$PBExportHeader$n_cst_thread_trans.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_thread_trans from transaction
end type
end forward

global type n_cst_thread_trans from transaction
event type long onbeforeconnect ( )
event onafterconnect ( )
event type long onbeforeretrieve ( datastore data )
event onafterretrieve ( datastore data,  long result )
event onbeforedisconnect ( )
event onafterdisconnect ( )
event onafterupdate ( datastore data,  long result )
event type long onbeforeupdate ( datastore data )
event type long onbeforecommand ( string sqlcmd )
event onaftercommand ( string sqlcmd )
event onbeforecommit ( )
event onaftercommit ( )
event onbeforerollback ( )
event onafterrollback ( )
event onattach ( n_cst_thread_task parenttask )
event onsyntaxfromsql ( readonly string sql,  readonly string presentation,  ref string sqlsyntax,  ref string errinfo )
event type long onsettransdata ( transactiondata data )
event type long ongettransdata ( ref transactiondata data,  ref string errinfo )
event onconnok ( )
event type long ontest ( )
event type long oncheck ( )
end type
global n_cst_thread_trans n_cst_thread_trans

type variables
//* Copyright (c) 2013 - 2017
//* 著作权由金千枝（深圳）软件技术有限公司所有。著作权人保留一切权利。
//* 
//* 这份授权条款，在满足下列条件的前提下，允许使用者再发布经过或未经过
//* 修改的、源代码或二进制形式的本软件：
//* 
//* 1. 源代码的再发布，必须保留原来代码中的版权声明、这几条许可条件细目
//*    和下面的免责声明。
//* 2. 二进制形式的再发布，必须在随同提供的文档和其它媒介中，复制原来的
//*    版权声明、这几条许可条件细目和下面的免责声明。
//* 3. 所有使用到本软件功能的产品及宣传材料，都必须包还含下列之交待文字：
//*        “本产品内含有由金千枝（深圳）软件技术有限公司及其软件贡献者所开发的软件。”
//* 4. 如果没有特殊的事前书面许可，原作者的组织名称，和贡献者名字，都不能
//*    用于支持或宣传从既有软件派生的产品。
//* 
//* 免责声明：此软件由金千枝（深圳）软件技术有限公司和贡献者以“即此”方式提供，无论明示或
//* 暗示的，包括但不限于间接的关于基于某种目的的适销性、实用性，在此皆明示
//* 不予保证。在任何情况下，由于使用此软件造成的，直接、间接、连带、特别、
//* 惩戒或因此而造成的损害（包括但不限于获得替代品及服务，无法使用，丢失数
//* 据，损失盈利或业务中断），无论此类损害是如何造成的，基于何种责任推断，
//* 是否属于合同范畴，严格赔偿责任或民事侵权行为（包括疏忽和其他原因），即
//* 使预先被告知此类损害可能发生，金千枝（深圳）软件技术有限公司和贡献者均不承担任何责任。
//================================================================

public:
//Database type
constant long DBT_MSSQL		= 0
constant long DBT_ORACLE	= 1

public:
privatewrite n_cst_thread_task	#ParentTask
privatewrite n_cst_thread			#ParentThread

private:
ulong _nLastConnOK
boolean _bBroken
end variables

forward prototypes
public function long of_connect ()
public function long of_disconnect ()
private subroutine _of_cleanrollback ()
public function long of_rollback ()
public function boolean of_isconnected ()
public function long of_exec (readonly string sqlcmd)
public function long of_commit (readonly boolean autorollback)
public function long of_update (readonly datastore ds)
public function string of_gridsyntaxfromsql (readonly string sql, ref string errinfo)
public function long of_query (readonly string sql, ref datastore ds, ref string errinfo)
public function boolean of_isfailed ()
public function boolean of_issucceeded ()
public function long of_settransdata (readonly transactiondata data)
public function long of_getdbtype ()
public subroutine of_clearstate ()
public function long of_autocommit ()
public function long of_commit ()
public function string of_gridsyntaxfromsql (readonly string sql)
public function long of_query (readonly string sql, ref datastore ds)
public function transactiondata of_gettransdata ()
public function long of_gettransdata (ref transactiondata data, ref string errinfo)
public function long of_retrieve (readonly datastore ds, readonly any params[], readonly boolean retrievedddw)
public function long of_retrieve (readonly datastore ds, readonly any params[])
public function long of_retrieve (readonly datastore ds)
public function long of_retrieve (readonly datastore ds, readonly boolean retrievedddw)
private subroutine _of_cleandisconnect ()
public function long of_setbroken ()
public function boolean of_isbroken ()
end prototypes

event onattach(n_cst_thread_task parenttask);#ParentTask = parentTask
#ParentThread = parentTask.#ParentThread
end event

event onconnok();_nLastConnOK = CPU()
_bBroken = false
end event

public function long of_connect ();boolean bConnected

if _bBroken then return RetCode.E_INVALID_TRANSACTION

if DBHandle() <> 0 then
	DISCONNECT USING this;
end if

_nLastConnOK = 0
of_ClearState()

if IsPrevented(Event OnBeforeConnect()) then
	if SQLCode <> 0 then return RetCode.E_DB_ERROR
	return RetCode.CANCELLED
end if

CONNECT USING this;

bConnected = (SQLCode = 0)

Event OnAfterConnect()

if SQLCode <> 0 then
	if bConnected then
		_of_CleanDisconnect()
	end if
	return RetCode.E_DB_ERROR
end if

Event OnConnOK()

return RetCode.OK
end function

public function long of_disconnect ();if DBHandle() <= 0 or _bBroken then
	_nLastConnOK = 0
	return RetCode.OK
end if

Event OnBeforeDisconnect()
DISCONNECT USING this;
Event OnAfterDisconnect()

_nLastConnOK = 0

if SQLCode <> 0 then
	return RetCode.E_DB_ERROR
end if

return RetCode.OK
end function

private subroutine _of_cleanrollback ();long nSQLCode,nSQLDBCode,nSQLNRows
string sSQLErrText,sSQLReturnData

nSQLCode = SQLCode
nSQLDBCode = SQLDBCode
nSQLNRows = SQLNRows
sSQLErrText = SQLErrText
sSQLReturnData = SQLReturnData

Event OnBeforeRollback()

ROLLBACK USING this;

SQLCode = nSQLCode
SQLDBCode = nSQLDBCode
SQLNRows = nSQLNRows
SQLErrText = sSQLErrText
SQLReturnData = sSQLReturnData

Event OnAfterRollback()
end subroutine

public function long of_rollback ();if AutoCommit then return RetCode.FAILED
if _bBroken then return RetCode.E_INVALID_TRANSACTION

_of_CleanRollback()

return RetCode.OK
end function

public function boolean of_isconnected ();long rtCode
boolean bConnected

if _nLastConnOK = 0 or _bBroken then return false
if IsFailed(Event OnCheck()) then return false
if CPU() - _nLastConnOK < 10000 then return true

rtCode = Event OnTest()
if IsNull(rtCode) then
	if Pos(Upper(DBMS),"ORACLE") > 0 then
		EXECUTE IMMEDIATE "SELECT 1 FROM DUAL" USING this;
	else
		EXECUTE IMMEDIATE "SELECT 1" USING this;
	end if
	bConnected = (SQLNRows > 0)
else
	bConnected = IsSucceeded(rtCode)
end if
if bConnected then
	_nLastConnOK = CPU()
else
	_nLastConnOK = 0
end if

return bConnected
end function

public function long of_exec (readonly string sqlcmd);if sqlCmd = "" or IsNull(sqlCmd) then return RetCode.E_INVALID_ARGUMENT

of_ClearState()

if IsPrevented(Event OnBeforeCommand(sqlCmd)) then
	if SQLCode <> 0 then return RetCode.E_DB_ERROR
	return RetCode.CANCELLED
end if

EXECUTE IMMEDIATE :sqlCmd USING this;

Event OnAfterCommand(sqlCmd)

if SQLCode <> 0 and SQLCode <> 100 then
	return RetCode.E_DB_ERROR
end if

return RetCode.OK
end function

public function long of_commit (readonly boolean autorollback);if AutoCommit then return RetCode.FAILED
if _bBroken then return RetCode.E_INVALID_TRANSACTION

Event OnBeforeCommit()

COMMIt USING this;

Event OnAfterCommit()

if SQLCode <> 0 then
	if autoRollback then
		_of_CleanRollback()
	end if
	return RetCode.E_DB_ERROR
end if

return RetCode.OK
end function

public function long of_update (readonly datastore ds);long rtCode

if Not IsValidObject(ds) then return RetCode.E_INVALID_OBJECT
if ds.SetTransObject(this) <> 1 then return RetCode.E_INVALID_TRANSACTION 

of_ClearState()

if IsPrevented(Event OnBeforeUpdate(ds)) then
	if SQLCode <> 0 then return RetCode.E_DB_ERROR
	return RetCode.CANCELLED
end if

rtCode = ds.Update(true,false)

Event OnAfterUpdate(ds,rtCode)

if SQLCode <> 0 and rtCode = 1 then
	rtCode = -1
end if

return rtCode
end function

public function string of_gridsyntaxfromsql (readonly string sql, ref string errinfo);string sSyntax

Event OnSyntaxFromSQL(sql,"style(type=grid)",ref sSyntax,ref errInfo)
if sSyntax = "" and errInfo = "" then
	sSyntax = SyntaxFromSQL(sql,"style(type=grid)",ref errInfo)
end if

return sSyntax
end function

public function long of_query (readonly string sql, ref datastore ds, ref string errinfo);long rtCode
string sSqlSyntax
boolean bCreated,bSucc

if sql = "" then
	errInfo = "E_INVALID_SQL"
	return RetCode.E_INVALID_SQL
end if

of_ClearState()

if Not IsValidObject(ds) then
	bCreated = true
	ds = Create DataStore
end if

try
	if Left(sql,1) = "@" then
		ds.DataObject = Mid(sql,2)
	else
		sSqlSyntax = of_GridSyntaxFromSQL(sql,ref errInfo)
		if sSqlSyntax = "" then
			errInfo = "E_INVALID_SQL"
			return RetCode.E_INVALID_SQL
		end if
		if ds.Create(sSqlSyntax) <> 1 then
			errInfo = "E_INVALID_SQL"
			return RetCode.E_INVALID_SQL
		end if
	end if
	//关闭DW自己的错误提示窗口
	ds.Modify("DataWindow.NoUserPrompt=yes")
	rtCode = of_Retrieve(ds)
	bSucc = IsSucceeded(rtCode)
	if Not bSucc then
		errInfo = SqlErrText
	end if
	return rtCode
finally
	if Not bSucc and bCreated then
		Destroy ds
	end if
end try
end function

public function boolean of_isfailed ();return (SQLCode < 0)
end function

public function boolean of_issucceeded ();return (SQLCode >= 0)
end function

public function long of_settransdata (readonly transactiondata data);if Event OnSetTransData(data) = 1 then return RetCode.OK

DBMS = data.DBMS
ServerName = data.ServerName
Database = data.Database
LogID = data.LogID
LogPass = data.LogPass
DBParm = data.DBParm
Lock = data.Lock

return RetCode.OK
end function

public function long of_getdbtype ();if Pos(Upper(DBMS),"ORACLE") > 0 then
	return DBT_ORACLE
else
	return DBT_MSSQL
end if
end function

public subroutine of_clearstate ();SQLCode = 0
SQLDBCode = 0
SQLNRows = 0
SQLErrText = ""
SQLReturnData = ""
end subroutine

public function long of_autocommit ();if SQLCode <> 0 then
	if Not AutoCommit then
		_of_CleanRollback()
	end if
	return RetCode.E_DB_ERROR
end if
if Not AutoCommit then
	return of_Commit(true)
end if

return RetCode.OK
end function

public function long of_commit ();return of_Commit(true)
end function

public function string of_gridsyntaxfromsql (readonly string sql);string errInfo
return of_GridSyntaxFromSQL(sql,ref errInfo)
end function

public function long of_query (readonly string sql, ref datastore ds);string errInfo
return of_Query(sql,ref ds,ref errInfo)
end function

public function transactiondata of_gettransdata ();string sErrInfo
TRANSACTIONDATA data

of_GetTransData(ref data,ref sErrInfo)

return data
end function

public function long of_gettransdata (ref transactiondata data, ref string errinfo);errInfo = ""

if Event OnGetTransData(ref data,ref errInfo) = 1 then
	if errInfo <> "" then return RetCode.FAILED
	return RetCode.OK
end if
if errInfo <> "" then return RetCode.FAILED

data.DBMS = DBMS
data.ServerName = ServerName
data.Database = Database
data.LogID = LogID
data.LogPass = LogPass
data.DBParm = DBParm
data.Lock = Lock

return RetCode.OK
end function

public function long of_retrieve (readonly datastore ds, readonly any params[], readonly boolean retrievedddw);long nColIdx,nColCnt,nRowCnt,nParmIdx,nParmCnt
string sModStr
n_scriptinvoker invoker

if Not IsValidObject(ds) then return RetCode.E_INVALID_OBJECT

of_ClearState()

if IsPrevented(Event OnBeforeRetrieve(ds)) then
	if SQLCode <> 0 then return RetCode.E_DB_ERROR
	return RetCode.CANCELLED
end if

if Not retrieveDDDW then
	nColCnt = Long(ds.Describe("DataWindow.Column.Count"))
	for nColIdx = 1 to nColCnt
		if ds.Describe("#" + String(nColIdx) + ".DDDW.AutoRetrieve") <> "yes" then continue
		sModStr += "#" + String(nColIdx) + ".DDDW.AutoRetrieve = no ~n"
	next
	if sModStr <> "" then
		ds.Modify(sModStr)
	end if
end if

if ds.SetTransObject(this) = 1 then
	nParmCnt = UpperBound(params)
	if nParmCnt <= 8 then
		choose case nParmCnt
			case 0
				nRowCnt = ds.Retrieve()
			case 1
				nRowCnt = ds.Retrieve(params[1])
			case 2
				nRowCnt = ds.Retrieve(params[1],params[2])
			case 3
				nRowCnt = ds.Retrieve(params[1],params[2],params[3])
			case 4
				nRowCnt = ds.Retrieve(params[1],params[2],params[3],params[4])
			case 5
				nRowCnt = ds.Retrieve(params[1],params[2],params[3],params[4],params[5])
			case 6
				nRowCnt = ds.Retrieve(params[1],params[2],params[3],params[4],params[5],params[6])
			case 7
				nRowCnt = ds.Retrieve(params[1],params[2],params[3],params[4],params[5],params[6],params[7])
			case 8
				nRowCnt = ds.Retrieve(params[1],params[2],params[3],params[4],params[5],params[6],params[7],params[8])
		end choose
	else
		invoker = Create n_scriptinvoker
		invoker.Init(ds,"retrieve","LAV")
		for nParmIdx = 1 to nParmCnt
			invoker.SetArg(nParmIdx,params[nParmIdx])
		next
		nRowCnt = invoker.Invoke()
		Destroy invoker
	end if
else
	nRowCnt = -1
end if

Event OnAfterRetrieve(ds,nRowCnt)

if SQLCode <> 0 and nRowCnt >= 0 then
	nRowCnt = -1
	ds.Reset()
end if

return nRowCnt
end function

public function long of_retrieve (readonly datastore ds, readonly any params[]);return of_Retrieve(ds,params,false)
end function

public function long of_retrieve (readonly datastore ds);any emptyParams[]

return of_Retrieve(ds,emptyParams,false)
end function

public function long of_retrieve (readonly datastore ds, readonly boolean retrievedddw);any emptyParams[]

return of_Retrieve(ds,emptyParams,retrieveDDDW)
end function

private subroutine _of_cleandisconnect ();long nSQLCode,nSQLDBCode,nSQLNRows
string sSQLErrText,sSQLReturnData

nSQLCode = SQLCode
nSQLDBCode = SQLDBCode
nSQLNRows = SQLNRows
sSQLErrText = SQLErrText
sSQLReturnData = SQLReturnData

Event OnBeforeDisconnect()

DISCONNECT USING this;

SQLCode = nSQLCode
SQLDBCode = nSQLDBCode
SQLNRows = nSQLNRows
SQLErrText = sSQLErrText
SQLReturnData = sSQLReturnData

Event OnAfterDisconnect()
end subroutine

public function long of_setbroken ();_bBroken = true
return RetCode.OK
end function

public function boolean of_isbroken ();if Not _bBroken then
	Event OnCheck()
end if
return _bBroken
end function

on n_cst_thread_trans.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_thread_trans.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

