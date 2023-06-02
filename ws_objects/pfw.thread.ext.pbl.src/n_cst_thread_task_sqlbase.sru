$PBExportHeader$n_cst_thread_task_sqlbase.sru
$PBExportComments$线程SQL任务对象基类~r~n[运行在子线程]
forward
global type n_cst_thread_task_sqlbase from n_cst_thread_task
end type
type sqlarg from structure within n_cst_thread_task_sqlbase
end type
type sqlparam from structure within n_cst_thread_task_sqlbase
end type
type cacheds from structure within n_cst_thread_task_sqlbase
end type
end forward

type sqlarg from structure
	string		name
	long		pos
	long		length
	boolean		replaced
end type

type sqlparam from structure
	string		name
	any		value
end type

type cacheds from structure
	n_cst_thread_task_sqlbase_ds		ds
	string		origsql
	string		origsort
	string		origfilter
end type

global type n_cst_thread_task_sqlbase from n_cst_thread_task
event type long ondberror ( long sqldbcode,  string sqlerrtext,  string sqlsyntax,  dwbuffer buffer,  long row )
event oncommitted ( )
end type
global n_cst_thread_task_sqlbase n_cst_thread_task_sqlbase

type variables
private:
n_cst_thread_trans_pool _transPool

TRANSACTIONDATA _transData

boolean _bNCharBinding

SQLPARAM _sqlParams[]

int _nTransRefIdx
n_cst_thread_trans _transObject

ulong _hEvtCommitted
end variables

forward prototypes
public function long of_settransdata (readonly transactiondata transdata)
protected function long of_releasetransobject (ref n_cst_thread_trans transobject)
protected function long of_gettransobject (ref n_cst_thread_trans transobject, ref dberrordata dberrdata)
protected function long of_gettransobject (ref n_cst_thread_trans transobject)
protected function n_cst_thread_trans_pool of_gettranspool ()
public function boolean of_hasalivetrans ()
public function transactiondata of_gettransdata ()
public function long of_rollback ()
public function unsignedlong of_getcommitevent ()
public function long of_commit (readonly boolean autorollback)
public function long of_reset ()
public function long of_addparam (readonly string name, readonly any value)
private function string _of_paramtostring (readonly any param, readonly long dbtype)
public function long of_setparam (string name, readonly any value)
private function integer _of_parseargs (string argstring, ref string args[])
public function long of_resetparams ()
public function boolean of_hasparams ()
protected function long _of_sqlbindparams (ref string sql, readonly long dbtype, readonly string dwargstring)
protected function long _of_sqlbindparams (ref string sql, readonly long dbtype)
protected function long _of_retrievewithparams (readonly datastore data)
public function long of_getparam (readonly integer index, ref any value)
public function integer of_getparamcount ()
public function long of_getparam (string name, ref any value)
public function string of_getparamname (readonly integer index)
public function long of_setparam (readonly integer index, ref any value)
public function boolean of_isncharbinding ()
public function n_cst_thread_task_sqlbase_ds of_getcacheds (readonly string dataobject)
end prototypes

event type long ondberror(long sqldbcode, string sqlerrtext, string sqlsyntax, dwbuffer buffer, long row);n_cst_threading_task_sqlbase tasking
DBERRORDATA err

err.SQLDBCode = SQLDBCode
err.SQLErrText = SQLErrText
err.SQLSyntax = SQLSyntax
err.Buffer = Buffer
err.Row = Row

tasking = #ParentTasking
tasking.Event OnDBError(err)

return 3
end event

event oncommitted();int nIndex
n_cst_thread_task_sqlbase task

//设置当前以及前面所有任务的提交信号
for nIndex = of_GetIndex() to 1 step -1
	if IsSucceeded(#ParentThread.of_GetTask(nIndex,ref task)) then
		if task._hEvtCommitted <> 0 then
			SetEvent(task._hEvtCommitted)
		end if
	end if
next
end event

public function long of_settransdata (readonly transactiondata transdata);//if #Running then return RetCode.E_BUSY
if _transData = transData then return RetCode.OK

_transData = transData

//擦除连接目标无关的参数
_transData.AutoCommit = false

if _nTransRefIdx > 0 then
	of_GetTransPool().of_RemoveRef(_nTransRefIdx)
	_nTransRefIdx = 0
	SetNull(_transObject)
end if

_bNCharBinding = false
if RegExpFind(_transData.DBParm,"DisableBind\s*=\s*(0|1)",2,true) = "1" then
	if RegExpFind(_transData.DBParm,"NCharBind\s*=\s*(0|1)",2,true) = "1" then
		_bNCharBinding = true
	end if
end if

return RetCode.OK
end function

protected function long of_releasetransobject (ref n_cst_thread_trans transobject);if Not IsValidObject(transObject) then return RetCode.E_INVALID_OBJECT
if transObject <> _transObject then return RetCode.E_INVALID_OBJECT
if _nTransRefIdx <= 0 then return RetCode.FAILED

of_GetTransPool().of_Release(_nTransRefIdx,ref transObject)

SetNull(_transObject)

return RetCode.OK
end function

protected function long of_gettransobject (ref n_cst_thread_trans transobject, ref dberrordata dberrdata);long rtCode
n_cst_thread_trans_pool transPool

if _nTransRefIdx > 0 and IsValidObject(_transObject) then
	transObject = _transObject
	transObject.Event OnAttach(this)
	transObject.of_ClearState()
	return RetCode.OK
end if

transPool = of_GetTransPool()

if _nTransRefIdx <= 0 then
	_nTransRefIdx = transPool.of_AddRef(_transData)
end if

rtCode = transPool.of_Get(_nTransRefIdx,ref transObject)
if IsSucceeded(rtCode) then
	_transObject = transObject
	_transObject.Event OnAttach(this)
	//Test
	if Not _transObject.of_IsConnected() then
		if IsFailed(_transObject.of_Connect()) then
			dbErrData.SQLDBCode = _transObject.SQLDBCode
			dbErrData.SQLErrText = _transObject.SQLErrText
			return RetCode.E_INVALID_TRANSACTION
		end if
	end if
	return RetCode.OK
end if

return rtCode
end function

protected function long of_gettransobject (ref n_cst_thread_trans transobject);DBERRORDATA dbErrData
return of_GetTransObject(ref transObject,ref dbErrData)
end function

protected function n_cst_thread_trans_pool of_gettranspool ();string sCls

if IsValidObject(_transPool) then return _transPool

if #ParentThread.of_HasData("$SQL.TransPool") then
	_transPool = #ParentThread.of_GetData("$SQL.TransPool")
end if
if Not IsValidObject(_transPool) then
	sCls = #ParentThread.#ParentThreading.of_GetDataString("$SQL.TransPool.Class")
	if sCls <> "" then
		_transPool = Create Using sCls
	else
		_transPool = Create n_cst_thread_trans_pool
	end if
	_transPool.Event OnInit(#ParentThread)
	#ParentThread.of_SetData("$SQL.TransPool",_transPool)
end if

return _transPool
end function

public function boolean of_hasalivetrans ();if IsValidObject(_transObject) then return true

return of_GetTransPool().of_Exists(_transData)
end function

public function transactiondata of_gettransdata ();return _transData
end function

public function long of_rollback ();if Not IsValidObject(_transObject) then return RetCode.E_INVALID_TRANSACTION

return _transObject.of_Rollback()
end function

public function unsignedlong of_getcommitevent ();if _hEvtCommitted = 0 then
	_hEvtCommitted = CreateEvent(0,true,false,0)
end if
return _hEvtCommitted
end function

public function long of_commit (readonly boolean autorollback);if Not IsValidObject(_transObject) then return RetCode.E_INVALID_TRANSACTION

return _transObject.of_Commit(autoRollback)
end function

public function long of_reset ();if _hEvtCommitted <> 0 then
	ResetEvent(_hEvtCommitted)
end if

of_ResetParams()

return RetCode.OK
end function

public function long of_addparam (readonly string name, readonly any value);int nIndex

//if #Running then return RetCode.E_BUSY

nIndex = UpperBound(_sqlParams) + 1
_sqlParams[nIndex].name = Lower(name)
_sqlParams[nIndex].value = value

return RetCode.OK
end function

private function string _of_paramtostring (readonly any param, readonly long dbtype);int i,n
string sVal
any paramArray[]

n = UpperBound(param)
if n > 0 then
	paramArray = param
	choose case ClassName(paramArray[1])
		case "string"
			for i = 1 to n
				sVal += "~'" + String(paramArray[i]) + "~'"
				if i <> UpperBound(paramArray) then
					sVal += ","
				end if
			next
		case "time"
			for i = 1 to n
				sVal += "~'" + String(paramArray[i],"hh:mm:ss") + "~'"
				if i <> n then
					sVal += ","
				end if
			next
		case "date"
			for i = 1 to n
				if dbType = n_cst_thread_trans.DBT_ORACLE then
					sVal += "to_date(~'" + String(paramArray[i],"yyyy-mm-dd") + "~','yyyy-mm-dd')"
				else
					sVal += "~'" + String(paramArray[i],"yyyy-mm-dd") + "~'"
				end if
				if i <> n then
					sVal += ","
				end if
			next
		case "datetime"
			for i = 1 to n
				if dbType = n_cst_thread_trans.DBT_ORACLE then
					sVal += "to_date(~'" + String(paramArray[i],"yyyy-mm-dd hh:mm:ss") + "~','yyyy-mm-dd hh24:mi:ss')"
				else
					sVal += "~'" + String(paramArray[i],"yyyy-mm-dd hh:mm:ss") + "~'"
				end if
				if i <> n then
					sVal += ","
				end if
			next
		case else				//Numbers
			for i = 1 to n
				sVal += String(paramArray[i])
				if i <> n then
					sVal += ","
				end if
			next
	end choose
else
	if IsNull(param) then return "NULL"
	choose case ClassName(param)
		case "string"
			sVal = "~'" + String(param) + "~'"
		case "time"
			sVal = "~'" + String(param,"hh:mm:ss") + "~'"
		case "date"
			if dbType = n_cst_thread_trans.DBT_ORACLE then
				sVal = "to_date(~'" + String(param,"yyyy-mm-dd") + "~','yyyy-mm-dd')"
			else
				sVal = "~'" + String(param,"yyyy-mm-dd") + "~'"
			end if
		case "datetime"
			if dbType = n_cst_thread_trans.DBT_ORACLE then
				sVal = "to_date(~'" + String(param,"yyyy-mm-dd hh:mm:ss") + "~','yyyy-mm-dd hh24:mi:ss')"
			else
				sVal = "~'" + String(param,"yyyy-mm-dd hh:mm:ss") + "~'"
			end if
		case else				//Numbers
			sVal = String(param)
	end choose
end if

return sVal
end function

public function long of_setparam (string name, readonly any value);int nIndex,nCount

//if #Running then return RetCode.E_BUSY

name = Lower(name)
nCount = UpperBound(_sqlParams)

for nIndex = 1 to nCount
	if _sqlParams[nIndex].name = name then
		exit
	end if
next
_sqlParams[nIndex].name = name
_sqlParams[nIndex].value = value

return RetCode.OK
end function

private function integer _of_parseargs (string argstring, ref string args[]);long nPos,nLastPos
string sArg,sArgs[]

argString = Lower(argString + "~n")
nPos = Pos(argString,"~n")
do while nPos > 0
	sArg = Mid(argString,nLastPos + 1,nPos - nLastPos - 1)
	sArg = Left(sArg,Pos(sArg,"~t") - 1)
	if sArg <> "" then
		sArgs[UpperBound(sArgs) + 1] = sArg
	end if
	nLastPos = nPos
	nPos = Pos(argString,"~n",nPos + 1)
loop

args = sArgs
return UpperBound(args)
end function

public function long of_resetparams ();SQLPARAM emptyParams[]

//if #Running then return RetCode.E_BUSY

_sqlParams = emptyParams

return RetCode.OK
end function

public function boolean of_hasparams ();return UpperBound(_sqlParams) > 0
end function

protected function long _of_sqlbindparams (ref string sql, readonly long dbtype, readonly string dwargstring);//==================================================================== 
// 函数: _of_sqlbindparams
//-------------------------------------------------------------------- 
// 描述: 将SQL字符串与参数绑定为新的SQL字符串返回
//			参数只支持简单类型或简单类型的一维数组
//			*该函数不验证SQL语法有效性
//-------------------------------------------------------------------- 
// 参数: 
// ref string sql
// readonly long	 dbtype
// readonly string dwargstring
//-------------------------------------------------------------------- 
// 返回值: RetCode
//--------------------------------------------------------------------
// 作者:	gaoqiangz@msn.com		日期: 2014年11月06日
//--------------------------------------------------------------------
//	Copyright (c) 2013-2014 Gaoqiangz, All rights reserved.
//--------------------------------------------------------------------
long nPos,nLen,nOffset
int nIndex,nCount,nArgIdx,nArgIdx2,nArgCnt,nParmNameCnt
boolean bQtUnclose
string sWord,sQuote,sReplace
string sDwArgs[]
SQLARG sqlArgs[]
SQLPARAM sqlParams[]
constant string ARG_PREFIX = ":"		//SQL参数占位符的前缀

sqlParams = _sqlParams

nCount = UpperBound(sqlParams)
if nCount = 0 then return RetCode.FAILED
for nIndex = 1 to nCount
	if sqlParams[nIndex].name <> "" then
		nParmNameCnt ++
	end if
next
if nParmNameCnt > 0 and nParmNameCnt <> nCount then return RetCode.E_INVALID_ARGUMENT

//解析DW参数定义并将其名称绑定给实参列表
if dwArgString <> "" and nParmNameCnt = 0 then
	if _of_ParseArgs(dwArgString,ref sDwArgs) = 0 then return RetCode.E_INVALID_ARGUMENT
	if UpperBound(sDwArgs) <> nCount then return RetCode.E_OUT_OF_BOUND
	for nIndex = 1 to nCount
		sqlParams[nIndex].name = sDwArgs[nIndex]
	next
end if

//解析参数位置
nIndex = 0
nLen = Len(sql)
for nPos = 1 to nLen
	sWord = Mid(sql,nPos,1)
	choose case sWord
		case " ","~t","~n","~r","~'","~"","+","-","*","/","\","%",">","<","=","(",")","{","}","[","]",",",".",":",";","?","!","&","#","|"		//Word delimiters
			if sWord = "~'" or sWord = "~"" then
				if sQuote = sWord or sQuote = "" then
					bQtUnclose = Not bQtUnclose
					if bQtUnclose then
						sQuote = sWord
					else
						sQuote = ""
					end if
				end if
			end if
			if nIndex > 0 then
				sqlArgs[nIndex].length = nPos - sqlArgs[nIndex].pos
				sqlArgs[nIndex].name = Lower(Mid(sql,sqlArgs[nIndex].pos + 1,sqlArgs[nIndex].length - 1))
				nIndex = 0
			end if
			if sWord = ARG_PREFIX then
				if bQtUnclose then continue
				nIndex = UpperBound(sqlArgs) + 1
				sqlArgs[nIndex].pos = nPos
			end if
	end choose
next
if nIndex > 0 then
	sqlArgs[nIndex].length = nPos - sqlArgs[nIndex].pos
	sqlArgs[nIndex].name = Lower(Mid(sql,sqlArgs[nIndex].pos + 1,sqlArgs[nIndex].length - 1))
end if
if bQtUnclose then return RetCode.E_INVALID_ARGUMENT

nArgCnt = UpperBound(sqlArgs)
//if nArgCnt < nCount then return RetCode.E_OUT_OF_BOUND

for nIndex = 1 to nCount
	//查找替换参数
	for nArgIdx = 1 to nArgCnt
		if sqlArgs[nArgIdx].replaced then continue
		if sqlArgs[nArgIdx].name = sqlParams[nIndex].name or sqlParams[nIndex].name = "" then
			//将参数转换为SQL支持的格式
			sReplace = _of_ParamToString(sqlParams[nIndex].value,dbType)
			//替代SQL里的参数占位符
			sql = Left(sql,sqlArgs[nArgIdx].pos - 1) + sReplace + Mid(sql,sqlArgs[nArgIdx].pos + sqlArgs[nArgIdx].length)
			//偏移后面的参数
			sqlArgs[nArgIdx].replaced = true
			nOffset = Len(sReplace) - sqlArgs[nArgIdx].length
			for nArgIdx2 = nArgIdx + 1 to nArgCnt
				sqlArgs[nArgIdx2].pos += nOffset
			next
			//空参数名不再查找
			if sqlParams[nIndex].name = "" then exit
		end if
	next
next
//检查是否存在未替换的参数
for nArgIdx = 1 to nArgCnt
	if Not sqlArgs[nArgIdx].replaced then return RetCode.E_OUT_OF_BOUND
next

return RetCode.OK
end function

protected function long _of_sqlbindparams (ref string sql, readonly long dbtype);return _of_SQLBindParams(ref sql,dbType,"")
end function

protected function long _of_retrievewithparams (readonly datastore data);long nRowCnt,nParmIdx,nParmCnt
n_scriptinvoker invoker

nParmCnt = UpperBound(_sqlParams)

if nParmCnt <= 8 then
	choose case nParmCnt
		case 0
			nRowCnt = Data.Retrieve()
		case 1
			nRowCnt = Data.Retrieve(_sqlParams[1].value)
		case 2
			nRowCnt = Data.Retrieve(_sqlParams[1].value,_sqlParams[2].value)
		case 3
			nRowCnt = Data.Retrieve(_sqlParams[1].value,_sqlParams[2].value,_sqlParams[3].value)
		case 4
			nRowCnt = Data.Retrieve(_sqlParams[1].value,_sqlParams[2].value,_sqlParams[3].value,_sqlParams[4].value)
		case 5
			nRowCnt = Data.Retrieve(_sqlParams[1].value,_sqlParams[2].value,_sqlParams[3].value,_sqlParams[4].value,_sqlParams[5].value)
		case 6
			nRowCnt = Data.Retrieve(_sqlParams[1].value,_sqlParams[2].value,_sqlParams[3].value,_sqlParams[4].value,_sqlParams[5].value,_sqlParams[6].value)
		case 7
			nRowCnt = Data.Retrieve(_sqlParams[1].value,_sqlParams[2].value,_sqlParams[3].value,_sqlParams[4].value,_sqlParams[5].value,_sqlParams[6].value,_sqlParams[7].value)
		case 8
			nRowCnt = Data.Retrieve(_sqlParams[1].value,_sqlParams[2].value,_sqlParams[3].value,_sqlParams[4].value,_sqlParams[5].value,_sqlParams[6].value,_sqlParams[7].value,_sqlParams[8].value)
	end choose
else
	invoker = Create n_scriptinvoker
	invoker.Init(Data,"retrieve","LAV")
	for nParmIdx = 1 to nParmCnt
		invoker.SetArg(nParmIdx,_sqlParams[nParmIdx].value)
	next
	nRowCnt = invoker.Invoke()
	Destroy invoker
end if

return nRowCnt
end function

public function long of_getparam (readonly integer index, ref any value);if index < 1 or index > UpperBound(_sqlParams) then return RetCode.E_OUT_OF_BOUND

value = _sqlParams[index].value

return RetCode.OK
end function

public function integer of_getparamcount ();return UpperBound(_sqlParams)
end function

public function long of_getparam (string name, ref any value);int nIndex,nCount

name = Lower(name)
nCount = UpperBound(_sqlParams)

for nIndex = 1 to nCount
	if _sqlParams[nIndex].name = name then
		value = _sqlParams[nIndex].value
		return RetCode.OK
	end if
next

return RetCode.E_DATA_NOT_FOUND
end function

public function string of_getparamname (readonly integer index);if index < 1 or index > UpperBound(_sqlParams) then return ""

return _sqlParams[index].name
end function

public function long of_setparam (readonly integer index, ref any value);if index < 1 or index > UpperBound(_sqlParams) + 1 then return RetCode.E_OUT_OF_BOUND

_sqlParams[index].value = value

return RetCode.OK
end function

public function boolean of_isncharbinding ();return _bNCharBinding
end function

public function n_cst_thread_task_sqlbase_ds of_getcacheds (readonly string dataobject);n_map mapCache
n_cst_thread_task_sqlbase_ds ds
CACHEDS cacheDS

if #ParentThread.of_HasData("$SQL.DataStoreCache") then
	mapCache = #ParentThread.of_GetData("$SQL.DataStoreCache")
end if
if Not IsValidObject(mapCache) then
	mapCache = Create n_map
	#ParentThread.of_SetData("$SQL.DataStoreCache",mapCache)
end if

if mapCache.Exists(dataObject) then
	cacheDS = mapCache.Get(dataObject)
	ds = cacheDS.ds
	if cacheDS.origSQL <> ds.GetSQLSelect() then
		ds.Modify('DataWindow.Table.Select = "' + cacheDS.origSQL +'"')
	end if
	if cacheDS.origSort <> "" then
		if cacheDS.origSort <> ds.Describe("DataWindow.Table.Sort") then
			ds.SetFilter(cacheDS.origSort)
		end if
	end if
	if cacheDS.origFilter <> "" then
		if cacheDS.origFilter <> ds.Describe("DataWindow.Table.Filter") then
			ds.SetFilter(cacheDS.origFilter)
		end if
	end if
	ds.of_ClearState()
else
	if #ParentThread.of_IsMainThread() then
		ds = Create n_cst_thread_task_sqlbase_ds
	else
		ds = Create n_cst_thread_task_sqlbase_ds_mt
	end if
	ds.DataObject = dataObject
	cacheDS.ds = ds
	cacheDS.origSQL = ds.GetSQLSelect()
	cacheDS.origSort = ds.Describe("DataWindow.Table.Sort")
	if cacheDS.origSort = "!" or cacheDS.origSort = "?" then cacheDS.origSort = ""
	cacheDS.origFilter = ds.Describe("DataWindow.Table.Filter")
	if cacheDS.origFilter = "!" or cacheDS.origFilter = "?" then cacheDS.origFilter = ""
	mapCache.Add(dataObject,cacheDS)
end if

ds.Event OnInit(this)

return ds
end function

on n_cst_thread_task_sqlbase.create
call super::create
end on

on n_cst_thread_task_sqlbase.destroy
call super::destroy
end on

event onuninit;call super::onuninit;if _nTransRefIdx > 0 then
	of_GetTransPool().of_RemoveRef(_nTransRefIdx)
	_nTransRefIdx = 0
	SetNull(_transObject)
end if
if _hEvtCommitted <> 0 then
	CloseHandle(_hEvtCommitted)
end if
end event

event onprepare;call super::onprepare;if _hEvtCommitted <> 0 then
	ResetEvent(_hEvtCommitted)
end if
return 0
end event

