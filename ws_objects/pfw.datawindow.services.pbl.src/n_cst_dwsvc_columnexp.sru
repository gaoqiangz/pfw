$PBExportHeader$n_cst_dwsvc_columnexp.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_dwsvc_columnexp from n_cst_dwsvc
end type
type columnexpdata from structure within n_cst_dwsvc_columnexp
end type
type columndata from structure within n_cst_dwsvc_columnexp
end type
type vardata from structure within n_cst_dwsvc_columnexp
end type
type funcdata from structure within n_cst_dwsvc_columnexp
end type
type globalvardata from structure within n_cst_dwsvc_columnexp
end type
end forward

type columnexpdata from structure
	string		name		
	long		id		
	dwobject		dwo		
	long		coltype		
	string		exp		
	vardata		vars[]		
	funcdata		fns[]		
	long		relativecolids[]		
	long		relativeinputcolids[]		
	long		dupexps[]		
	boolean		emptystringisnull		
	boolean		hasmacro		
	boolean		alwayscalc		
	boolean		triggerevent		
	boolean		recursive		
	boolean		dirty		
	boolean		empty		
	boolean		cacheable		
	string		computename		
end type

type columndata from structure
	long		flag		
	integer		indexes[]		
end type

type vardata from structure
	string		name		
	string		fullname		
	integer		index		
end type

type funcdata from structure
	string		name		
	string		fullname		
	string		args[]		
	boolean		builtin		
end type

type globalvardata from structure
	string		name		
	string		exp		
	vardata		vars[]		
	funcdata		fns[]		
	boolean		hasmacro		
end type

global type n_cst_dwsvc_columnexp from n_cst_dwsvc
event onitemchanged ( long row,  dwobject dwo )
event ondoitemchanged ( long row,  string colname,  long colid,  boolean frominput )
end type
global n_cst_dwsvc_columnexp n_cst_dwsvc_columnexp

type variables
public:
//compute suffix
constant string DWOSUFFIX = "_columnexp"

private:
COLUMNDATA		ColDatas[]
COLUMNEXPDATA	ColExpDatas[]
GLOBALVARDATA	GlobalVars[]

boolean _bRowCalcing
boolean _bRowCalcingEmpty

long _nCachedID

n_vector _vecCalcStack

//Column calc flags
constant long CLC_UNKNOWN	= 0
constant long CLC_YES		= 1
constant long CLC_NO			= 2
//Global functions
constant string FUNC_VAR	 = ""
constant string FUNC_INVOKE = "Invoke"
end variables

forward prototypes
public function long of_removeall ()
private subroutine _of_makedirty ()
public function string of_getexp (string colname)
public function long of_setrelativecolumn (readonly string colname, readonly string relativecol)
public function long of_setrelativeinputcolumn (readonly string colname, readonly string relativecol)
public function string of_getexp (readonly integer index)
public function long of_remove (readonly integer index)
public function long of_remove (readonly string colname)
public function long of_setalwayscalc (readonly integer index, readonly boolean alwayscalc)
public function long of_setalwayscalc (readonly string colname, readonly boolean alwayscalc)
public function long of_setrelativecolumns (readonly integer index, readonly string relativecols[])
public function long of_setrelativecolumns (readonly string colname, readonly string relativecols[])
public function long of_setrelativecolumn (readonly integer index, readonly string relativecol)
public function long of_setrelativeinputcolumns (readonly integer index, readonly string relativecols[])
public function long of_setrelativeinputcolumns (readonly string colname, readonly string relativecols[])
public function long of_setrelativeinputcolumn (readonly integer index, readonly string relativecol)
private function integer _of_findexpindex (string colname)
public function boolean _of_calcitem (readonly long row, readonly integer index)
public function long of_calc (readonly long row, readonly integer index)
public function long of_calc (readonly long row, readonly string colname)
public function long of_calcall ()
public function long of_setrecursive (readonly integer index, readonly boolean recursive)
public function long of_setrecursive (readonly string colname, readonly boolean recursive)
public function long of_settriggerevent (readonly integer index, readonly boolean btrigger)
public function long of_settriggerevent (readonly string colname, readonly boolean btrigger)
private function integer _of_findvarindex (readonly string name)
private function integer _of_findvardepends (readonly integer index, ref integer colexps[], readonly boolean excluderels)
public function string of_getvarexp (readonly integer index)
public function string of_getvarexp (string name)
public function long of_addvar (readonly string name, readonly time value)
public function long of_addvar (readonly string name, readonly string value)
public function long of_addvar (readonly string name, readonly long value)
public function long of_addvar (readonly string name, readonly double value)
public function long of_addvar (readonly string name, readonly datetime value)
public function long of_addvar (readonly string name, readonly date value)
public function long of_addvar (readonly string name, readonly boolean value)
public function long of_setvar (readonly string name, readonly time value)
public function long of_setvar (readonly string name, readonly string value)
public function long of_setvar (readonly string name, readonly long value)
public function long of_setvar (readonly string name, readonly double value)
public function long of_setvar (readonly string name, readonly datetime value)
public function long of_setvar (readonly string name, readonly date value)
public function long of_setvar (readonly string name, readonly boolean value)
private subroutine _of_resetcolumns ()
public function long of_calc (readonly long row, readonly boolean force)
public function long of_calc (readonly long row)
public function long of_calcall (readonly boolean force)
private function long _of_parseexp (ref string exp, ref vardata vars[], ref funcdata fns[])
public function integer of_addexp (string colname, string exp)
public function long of_addvarexp (readonly string name, string exp)
private function string _of_preprocessexp (readonly long row, readonly dwobject dwo, string exp, readonly vardata vars[], funcdata fns[])
public function long of_setexp (readonly integer index, string exp, readonly boolean recalc)
public function long of_setexp (readonly string colname, readonly string exp, readonly boolean recalc)
public function long of_setexp (readonly integer index, readonly string exp)
public function long of_setexp (readonly string colname, readonly string exp)
public function long of_setvarexp (readonly string name, readonly string exp)
public function long of_setvar (readonly string name, readonly time value, readonly boolean recalc)
public function long of_setvar (readonly string name, readonly string value, readonly boolean recalc)
public function long of_setvar (readonly string name, readonly long value, readonly boolean recalc)
public function long of_setvar (readonly string name, readonly double value, readonly boolean recalc)
public function long of_setvar (readonly string name, readonly datetime value, readonly boolean recalc)
public function long of_setvar (readonly string name, readonly date value, readonly boolean recalc)
public function long of_setvar (readonly string name, readonly boolean value, readonly boolean recalc)
public function long of_setvarexp (readonly string name, string exp, readonly boolean recalc, readonly boolean force)
public function long of_setvarexp (readonly string name, readonly string exp, readonly boolean recalc)
public function long of_setvar (readonly string name, readonly time value, readonly boolean recalc, readonly boolean force)
public function long of_setvar (readonly string name, readonly boolean value, readonly boolean recalc, readonly boolean force)
public function long of_setvar (readonly string name, readonly date value, readonly boolean recalc, readonly boolean force)
public function long of_setvar (readonly string name, readonly datetime value, readonly boolean recalc, readonly boolean force)
public function long of_setvar (readonly string name, readonly double value, readonly boolean recalc, readonly boolean force)
public function long of_setvar (readonly string name, readonly long value, readonly boolean recalc, readonly boolean force)
public function long of_setvar (readonly string name, readonly string value, readonly boolean recalc, readonly boolean force)
private function boolean _of_hasref (string exp, readonly string colname)
public function long of_setcacheable (readonly integer index, readonly boolean cache)
public function long of_setcacheable (readonly string colname, readonly boolean cache)
private function boolean _of_createcompute (readonly string name, readonly string exp, ref string errinfo)
public function long of_calcempty (readonly long row)
public function long of_calcempty ()
end prototypes

event onitemchanged(long row, dwobject dwo);long nColID
string sColName

if Not #Enabled then return

nColID = Long(dwo.ID)
sColName = String(dwo.Name)
if nColID > UpperBound(ColDatas) then
	ColDatas[nColID].flag = CLC_UNKNOWN
end if
if ColDatas[nColID].flag <> CLC_NO then
	Event OnDoItemChanged(row,sColName,nColID,true)
end if
end event

event ondoitemchanged(long row, string colname, long colid, boolean frominput);int nIndex,nCount,i,c,n,k
boolean bMatched,bHasRelative

if row < 1 or row > #DataWindow.RowCount() then return

if colID > UpperBound(ColDatas) then
	ColDatas[colID].flag = CLC_UNKNOWN
end if

if ColDatas[colID].flag = CLC_UNKNOWN then
	ColDatas[colID].flag = CLC_NO
	nCount = UpperBound(ColExpDatas)
	if nCount = 0 then return
	for nIndex = 1 to nCount
		bMatched = false
		bHasRelative = false
		if ColExpDatas[nIndex].alwaysCalc then
			bMatched = true
		else
			c = UpperBound(ColExpDatas[nIndex].relativeColIDs)
			if c > 0 then
				bHasRelative = true
				for i = 1 to c
					if ColExpDatas[nIndex].relativeColIDs[i] = colID then
						bMatched = true
						exit
					end if
				next
			end if
			if Not bMatched then
				c = UpperBound(ColExpDatas[nIndex].relativeInputColIDs)
				if c > 0 then
					bHasRelative = true
					for i = 1 to c
						if ColExpDatas[nIndex].relativeInputColIDs[i] = colID then
							bMatched = true
							exit
						end if
					next
				end if
			end if
			if Not bMatched and Not bHasRelative then
				if _of_HasRef(ColExpDatas[nIndex].exp,colName) then
					bMatched = true
				end if
			end if
		end if
		if bMatched then
			ColDatas[colID].flag = CLC_YES
			ColDatas[colID].Indexes[UpperBound(ColDatas[colID].Indexes) + 1] = nIndex
		end if
	next
	if UpperBound(ColDatas[colID].Indexes) <> nCount then
		nCount = UpperBound(GlobalVars)
		for nIndex = 1 to nCount
			if _of_HasRef(GlobalVars[nIndex].exp,colName) then
				if _of_FindVarDepends(nIndex,ref ColDatas[colID].Indexes,true) > 0 then
					ColDatas[colID].flag = CLC_YES
				end if
			end if
		next
	end if
end if

if ColDatas[colID].flag = CLC_YES then
	_vecCalcStack.Append(colName)
	k = _vecCalcStack.Count()
	nCount = UpperBound(ColDatas[colID].Indexes)
	for nIndex = 1 to nCount
		n = ColDatas[colID].Indexes[nIndex]
		c = UpperBound(ColExpDatas[n].relativeInputColIDs)
		if c > 0 then
			if ColExpDatas[n].alwaysCalc or UpperBound(ColExpDatas[n].relativeColIDs) > 0 then
				bMatched = false
				for i = 1 to c
					if ColExpDatas[n].relativeInputColIDs[i] = colID then
						bMatched = true
						exit
					end if
				next
			else
				bMatched = true
			end if
			if bMatched and Not fromInput then continue
		end if
		_of_CalcItem(row,n)
	next
	_vecCalcStack.RemoveAt(k)
end if
end event

public function long of_removeall ();//====================================================================
// Function: of_removeall()
//--------------------------------------------------------------------
// Description: 移除所有列的表达式
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-10
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int nIndex,nCount
COLUMNEXPDATA emptyColExpDatas[]

nCount = UpperBound(ColExpDatas)
for nIndex = 1 to nCount
	if ColExpDatas[nIndex].cacheable then
		#DataWindow.Modify("Destroy " + ColExpDatas[nIndex].computeName)
	end if
next

ColExpDatas = emptyColExpDatas

_of_ResetColumns()

return RetCode.OK
end function

private subroutine _of_makedirty ();int nIndex,nCount

nCount = UpperBound(ColExpDatas)
for nIndex = 1 to nCount
	ColExpDatas[nIndex].dirty = true
next
end subroutine

public function string of_getexp (string colname);return of_GetExp(_of_FindExpIndex(colName))
end function

public function long of_setrelativecolumn (readonly string colname, readonly string relativecol);string relativeCols[]

if relativeCol <> "" then
	relativeCols[1] = relativeCol
end if
return of_SetRelativeColumns(_of_FindExpIndex(colName),relativeCols)
end function

public function long of_setrelativeinputcolumn (readonly string colname, readonly string relativecol);string sRelativeCols[]

if relativeCol <> "" then
	sRelativeCols[1] = relativeCol
end if
return of_SetRelativeInputColumns(_of_FindExpIndex(colName),sRelativeCols)
end function

public function string of_getexp (readonly integer index);//====================================================================
// Function: of_getexp()
//--------------------------------------------------------------------
// Description: 获取指定列的表达式
//--------------------------------------------------------------------
// Arguments:
// 	readonly	integer	index	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if index < 1 or index > UpperBound(ColExpDatas) then return ""

return ColExpDatas[index].exp
end function

public function long of_remove (readonly integer index);//====================================================================
// Function: of_remove()
//--------------------------------------------------------------------
// Description: 移除指定列的表达式
//--------------------------------------------------------------------
// Arguments:
// 	readonly	integer	index	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int nIndex,nCount,nIndex2
long nDupExpsAll[],nDupExps[],nEmptys[]
string sName
COLUMNEXPDATA newColExpDatas[]

if index < 1 or index > UpperBound(ColExpDatas) then return RetCode.E_OUT_OF_BOUND

sName = ColExpDatas[index].name

nCount = UpperBound(ColExpDatas)
for nIndex = 1 to nCount
	if nIndex = index then
		if ColExpDatas[nIndex].cacheable then
			#DataWindow.Modify("Destroy " + ColExpDatas[nIndex].computeName)
		end if
	else
		newColExpDatas[UpperBound(newColExpDatas) + 1] = ColExpDatas[nIndex]
		if ColExpDatas[nIndex].name = sName then
			nDupExpsAll[UpperBound(nDupExpsAll) + 1] = UpperBound(newColExpDatas)
		end if
	end if
next

ColExpDatas = newColExpDatas

nCount = UpperBound(nDupExpsAll)
if nCount > 1 then
	for nIndex = 1 to nCount
		nDupExps = nEmptys
		for nIndex2 = 1 to nCount
			if nDupExpsAll[nIndex2] = nDupExpsAll[nIndex] then continue
			nDupExps[UpperBound(nDupExps) + 1] = nDupExpsAll[nIndex2]
		next
		ColExpDatas[nDupExpsAll[nIndex]].dupExps = nDupExps
	next
end if

_of_ResetColumns()

return RetCode.OK
end function

public function long of_remove (readonly string colname);return of_Remove(_of_FindExpIndex(colName))
end function

public function long of_setalwayscalc (readonly integer index, readonly boolean alwayscalc);//====================================================================
// Function: of_setalwayscalc()
//--------------------------------------------------------------------
// Description: 设置指定列表达式是否由任意列触发重算
//--------------------------------------------------------------------
// Arguments:
// 	readonly	integer	index     	
// 	readonly	boolean	alwayscalc	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if index < 1 or index > UpperBound(ColExpDatas) then return RetCode.E_OUT_OF_BOUND
if ColExpDatas[index].alwaysCalc = alwaysCalc then return RetCode.OK

ColExpDatas[index].alwaysCalc = alwaysCalc

_of_ResetColumns()

return RetCode.OK
end function

public function long of_setalwayscalc (readonly string colname, readonly boolean alwayscalc);//====================================================================
// Function: of_setalwayscalc()
//--------------------------------------------------------------------
// Description: 设置指定列表达式是否由任意列触发重算
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string 	colname   	
// 	readonly	boolean	alwayscalc	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return of_SetAlwaysCalc(_of_FindExpIndex(colName),alwaysCalc)
end function

public function long of_setrelativecolumns (readonly integer index, readonly string relativecols[]);//====================================================================
// Function: of_setrelativecolumns()
//--------------------------------------------------------------------
// Description: 设置指定列表达式由指定列触发重算
//--------------------------------------------------------------------
// Arguments:
// 	readonly	integer	index         	
// 	readonly	string 	relativecols[]	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int i,c
long nID,nColIDs[]

if index < 1 or index > UpperBound(ColExpDatas) then return RetCode.E_OUT_OF_BOUND

c = UpperBound(relativeCols)
for i = 1 to c
	nID = Long(#DataWindow.Describe(relativeCols[i] + ".ID"))
	if nID = 0 then return RetCode.E_INVALID_ARGUMENT
	nColIDs[UpperBound(nColIDs) + 1] = nID	
next

ColExpDatas[index].relativeColIDs = nColIDs

_of_ResetColumns()

return RetCode.OK
end function

public function long of_setrelativecolumns (readonly string colname, readonly string relativecols[]);return of_SetRelativeColumns(_of_FindExpIndex(colName),relativeCols)
end function

public function long of_setrelativecolumn (readonly integer index, readonly string relativecol);string relativeCols[]

if relativeCol <> "" then
	relativeCols[1] = relativeCol
end if
return of_SetRelativeColumns(index,relativeCols)
end function

public function long of_setrelativeinputcolumns (readonly integer index, readonly string relativecols[]);//====================================================================
// Function: of_setrelativeinputcolumns()
//--------------------------------------------------------------------
// Description: 设置指定列表达式由指定输入列触发重算(只有当用户输入这些列时才重算)
//--------------------------------------------------------------------
// Arguments:
// 	readonly	integer	index         	
// 	readonly	string 	relativecols[]	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int i,c
long nID,nColIDs[]

if index < 1 or index > UpperBound(ColExpDatas) then return RetCode.E_OUT_OF_BOUND

c = UpperBound(relativeCols)
for i = 1 to c
	nID = Long(#DataWindow.Describe(relativeCols[i] + ".ID"))
	if nID = 0 then return RetCode.E_INVALID_ARGUMENT
	nColIDs[UpperBound(nColIDs) + 1] = nID	
next

ColExpDatas[index].relativeInputColIDs = nColIDs

_of_ResetColumns()

return RetCode.OK
end function

public function long of_setrelativeinputcolumns (readonly string colname, readonly string relativecols[]);return of_SetRelativeInputColumns(_of_FindExpIndex(colName),relativeCols)
end function

public function long of_setrelativeinputcolumn (readonly integer index, readonly string relativecol);string sRelativeCols[]

if relativeCol <> "" then
	sRelativeCols[1] = relativeCol
end if
return of_SetRelativeInputColumns(index,sRelativeCols)
end function

private function integer _of_findexpindex (string colname);int nIndex

colName = Lower(Trim(colName))
for nIndex = UpperBound(ColExpDatas) to 1 step -1
	if ColExpDatas[nIndex].name = colName then return nIndex
next

return 0
end function

public function boolean _of_calcitem (readonly long row, readonly integer index);int nIndex,nCount
string sVal,sExp,sErrInfo
boolean bDwoValid,bUseCache

if _bRowCalcingEmpty and Not ColExpDatas[index].empty then return false

if Not _bRowCalcing then
	if Not ColExpDatas[index].recursive then
		nCount = _vecCalcStack.Count()
		for nIndex = 1 to nCount
			if _vecCalcStack.GetAt(nIndex) = ColExpDatas[index].name then
				return false
			end if
		next
	end if
else
	if Not ColExpDatas[index].dirty then return false
	ColExpDatas[index].dirty = false
	nCount = UpperBound(ColExpDatas[index].dupExps)
	for nIndex = 1 to nCount
		ColExpDatas[nIndex].dirty = false
	next
end if

try
	ColExpDatas[index].dwo.name
	bDwoValid = true
catch(throwable ex)
end try

bUseCache = (ColExpDatas[index].cacheable and Not ColExpDatas[index].hasMacro)

if Not bDwoValid then
	ColExpDatas[index].dwo = _of_GetDWObject(ColExpDatas[index].name)
	if bUseCache then
		if Not _of_HasDWObject(ColExpDatas[index].computeName) then
			if Not _of_CreateCompute(ColExpDatas[index].computeName,ColExpDatas[index].exp,ref sErrInfo) then
				MessageBoxEx("ColumnExp Error","[" + String(ColExpDatas[index].name) + "]创建表达式缓存失败:~nExpression:" + ColExpDatas[index].exp + "~nError:" + sErrInfo,StopSign!)
				return false
			end if
		end if
	end if
end if

if bUseCache then
	try
		choose case ColExpDatas[index].colType
			case COL_TYPE_DECIMAL
				sVal = String(#DataWindow.GetItemDecimal(row,ColExpDatas[index].computeName))
			case COL_TYPE_INTEGER
				sVal = String(#DataWindow.GetItemNumber(row,ColExpDatas[index].computeName))
			case COL_TYPE_STRING
				sVal = #DataWindow.GetItemString(row,ColExpDatas[index].computeName)
			case COL_TYPE_DATETIME
				sVal = String(#DataWindow.GetItemDateTime(row,ColExpDatas[index].computeName))
			case COL_TYPE_DATE
				sVal = String(#DataWindow.GetItemDate(row,ColExpDatas[index].computeName))
			case COL_TYPE_TIME
				sVal = String(#DataWindow.GetItemTime(row,ColExpDatas[index].computeName))
			case else
				return false
		end choose
	catch(throwable ex2)
		MessageBoxEx("ColumnExp Error","[" + String(ColExpDatas[index].name) + "]表达式缓存错误:~nExpression:" + ColExpDatas[index].exp + "~nError:" + ex.text,StopSign!)
		return false
	end try
else
	if ColExpDatas[index].hasMacro then
		sExp = _of_PreprocessExp(row,ColExpDatas[index].dwo,ColExpDatas[index].exp,ColExpDatas[index].vars,ColExpDatas[index].fns)
		if sExp = "" then return false
	else
		sExp = ColExpDatas[index].exp
	end if
	sVal = _of_Evaluate(sExp,row)
	if sVal = "?" or sVal = "!" then
		MessageBoxEx("ColumnExp Error","[" + String(ColExpDatas[index].name) + "]表达式错误:~nExpression:" + sExp,StopSign!)
		return false
	end if
end if

choose case ColExpDatas[index].colType
	case COL_TYPE_DECIMAL
		decimal dcVal,dcValOld
		if sVal = "" then SetNull(sVal)
		dcVal = Dec(sVal)
		dcValOld = #DataWindow.GetItemDecimal(row,ColExpDatas[index].id)
		if dcVal = dcValOld  then
			return false
		elseif IsNull(dcVal) and IsNull(dcValOld) then
			return false
		end if
		if ColExpDatas[index].triggerEvent then
			if #DataWindow.Event ItemChanged(row,ColExpDatas[index].dwo,sVal) <> 0 then return false
		end if
		#DataWindow.SetItem(row,ColExpDatas[index].id,dcVal)
	case COL_TYPE_INTEGER
		long nVal,nValOld
		if sVal = "" then SetNull(sVal)
		nVal = Long(sVal)
		nValOld = #DataWindow.GetItemNumber(row,ColExpDatas[index].id)
		if nVal = nValOld then
			return false
		elseif IsNull(nVal) and IsNull(nValOld) then
			return false
		end if
		if ColExpDatas[index].triggerEvent then
			if #DataWindow.Event ItemChanged(row,ColExpDatas[index].dwo,sVal) <> 0 then return false
		end if
		#DataWindow.SetItem(row,ColExpDatas[index].id,nVal)
	case COL_TYPE_STRING
		string sValOld
		if sVal = "" and ColExpDatas[index].emptyStringIsNull then
			SetNull(sVal)
		end if
		sValOld = #DataWindow.GetItemString(row,ColExpDatas[index].id)
		if sVal = sValOld then
			return false
		elseif IsNull(sVal) and IsNull(sValOld) then
			return false
		end if
		if ColExpDatas[index].triggerEvent then
			if #DataWindow.Event ItemChanged(row,ColExpDatas[index].dwo,sVal) <> 0 then return false
		end if
		#DataWindow.SetItem(row,ColExpDatas[index].id,sVal)
	case COL_TYPE_DATETIME
		datetime dttVal,dttValOld
		if sVal = "" then SetNull(sVal)
		dttVal = DateTime(sVal)
		dttValOld = #DataWindow.GetItemDateTime(row,ColExpDatas[index].id)
		if dttVal = dttValOld then
			return false
		elseif IsNull(dttVal) and IsNull(dttValOld) then
			return false
		end if
		if ColExpDatas[index].triggerEvent then
			if #DataWindow.Event ItemChanged(row,ColExpDatas[index].dwo,sVal) <> 0 then return false
		end if
		#DataWindow.SetItem(row,ColExpDatas[index].id,dttVal)
	case COL_TYPE_DATE
		date dtVal,dtValOld
		if sVal = "" then SetNull(sVal)
		dtVal = Date(sVal)
		dtValOld = #DataWindow.GetItemDate(row,ColExpDatas[index].id)
		if dtVal = dtValOld  then
			return false
		elseif IsNull(dtVal) and IsNull(dtValOld) then
			return false
		end if
		if ColExpDatas[index].triggerEvent then
			if #DataWindow.Event ItemChanged(row,ColExpDatas[index].dwo,sVal) <> 0 then return false
		end if
		#DataWindow.SetItem(row,ColExpDatas[index].id,dtVal)
	case COL_TYPE_TIME
		time tmVal,tmValOld
		if sVal = "" then SetNull(sVal)
		tmVal = Time(sVal)
		tmValOld = #DataWindow.GetItemTime(row,ColExpDatas[index].id)
		if tmVal = tmValOld then
			return false
		elseif IsNull(tmVal) and IsNull(tmValOld) then
			return false
		end if
		if ColExpDatas[index].triggerEvent then
			if #DataWindow.Event ItemChanged(row,ColExpDatas[index].dwo,sVal) <> 0 then return false
		end if
		#DataWindow.SetItem(row,ColExpDatas[index].id,tmVal)
	case else
		return false
end choose

#Enabled = false
#DataWindow.Event OnDoItemChanged(row,ColExpDatas[index].dwo)
#Enabled = true

if Not _bRowCalcing then
	Event OnDoItemChanged(row,ColExpDatas[index].name,ColExpDatas[index].id,false)
end if
return true
end function

public function long of_calc (readonly long row, readonly integer index);//====================================================================
// Function: of_calc()
//--------------------------------------------------------------------
// Description: 计算指定列的表达式
//--------------------------------------------------------------------
// Arguments:
// 	readonly	long   	row  	
// 	readonly	integer	index	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if row <= 0 or row > #DataWindow.RowCount() then return RetCode.E_INVALID_ARGUMENT
if index < 1 or index > UpperBound(ColExpDatas) then return RetCode.E_OUT_OF_BOUND
if _bRowCalcing then return RetCode.FAILED

_of_CalcItem(row,index)

return RetCode.OK
end function

public function long of_calc (readonly long row, readonly string colname);return of_Calc(row,_of_FindExpIndex(colName))
end function

public function long of_calcall ();return of_CalcAll(false)
end function

public function long of_setrecursive (readonly integer index, readonly boolean recursive);//====================================================================
// Function: of_setrecursive()
//--------------------------------------------------------------------
// Description: 设置指定列表达式是否允许递归计算
//--------------------------------------------------------------------
// Arguments:
// 	readonly	integer	index     	
// 	readonly	boolean	recursive	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if index < 1 or index > UpperBound(ColExpDatas) then return RetCode.E_OUT_OF_BOUND
if ColExpDatas[index].recursive = recursive then return RetCode.OK

ColExpDatas[index].recursive = recursive

return RetCode.OK
end function

public function long of_setrecursive (readonly string colname, readonly boolean recursive);//====================================================================
// Function: of_setrecursive()
//--------------------------------------------------------------------
// Description: 设置指定列表达式是否允许递归计算
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string 	colname   	
// 	readonly	boolean	recursive	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return of_SetRecursive(_of_FindExpIndex(colName),recursive)
end function

public function long of_settriggerevent (readonly integer index, readonly boolean btrigger);//====================================================================
// Function: of_settriggerevent()
//--------------------------------------------------------------------
// Description: 设置指定列表达式计算后是否触发ItemChange事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	integer	index     	
// 	readonly	boolean	btrigger	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if index < 1 or index > UpperBound(ColExpDatas) then return RetCode.E_OUT_OF_BOUND
if ColExpDatas[index].triggerEvent = btrigger then return RetCode.OK

ColExpDatas[index].triggerEvent = btrigger

return RetCode.OK
end function

public function long of_settriggerevent (readonly string colname, readonly boolean btrigger);//====================================================================
// Function: of_settriggerevent()
//--------------------------------------------------------------------
// Description: 设置指定列表达式计算后是否触发ItemChange事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string 	colname   	
// 	readonly	boolean	btrigger	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return of_SetTriggerEvent(_of_FindExpIndex(colName),btrigger)
end function

private function integer _of_findvarindex (readonly string name);int nIndex

for nIndex = UpperBound(GlobalVars) to 1 step -1
	if GlobalVars[nIndex].name = name then return nIndex
next

return 0
end function

private function integer _of_findvardepends (readonly integer index, ref integer colexps[], readonly boolean excluderels);int nIndex,nCount,nVarIndex,nVarCnt,i,c

nCount = UpperBound(ColExpDatas)
for nIndex = 1 to nCount
	if Not ColExpDatas[nIndex].hasMacro then continue
	if excludeRels then
		if UpperBound(ColExpDatas[nIndex].relativeColIDs) > 0 or UpperBound(ColExpDatas[nIndex].relativeInputColIDs) > 0 then
			continue
		end if
	end if
	nVarCnt = UpperBound(ColExpDatas[nIndex].vars)
	for nVarIndex = 1 to nVarCnt
		if ColExpDatas[nIndex].vars[nVarIndex].name = GlobalVars[index].name then
			c = UpperBound(colExps)
			for i = 1 to c
				if colExps[i] = nIndex then exit
			next
			colExps[i] = nIndex
			if i = nCount then return nCount
			exit
		end if
	next
next

nCount = UpperBound(GlobalVars)
for nIndex = 1 to nCount
	if nIndex = index then continue
	if Not GlobalVars[nIndex].hasMacro then continue
	nVarCnt = UpperBound(GlobalVars[nIndex].vars)
	for nVarIndex = 1 to nVarCnt
		if GlobalVars[nIndex].vars[nVarIndex].name = GlobalVars[index].name then
			_of_FindVarDepends(nIndex,ref colExps,excludeRels)
			exit
		end if
	next
	if UpperBound(colExps) = UpperBound(ColExpDatas) then exit
next

return UpperBound(colExps)
end function

public function string of_getvarexp (readonly integer index);//====================================================================
// Function: of_getvarexp()
//--------------------------------------------------------------------
// Description: 获取指定全局变量的表达式
//--------------------------------------------------------------------
// Arguments:
// 	readonly	integer	index	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if index < 1 or index > UpperBound(GlobalVars) then return ""

return GlobalVars[index].exp
end function

public function string of_getvarexp (string name);return of_GetVarExp(_of_FindVarIndex(name))
end function

public function long of_addvar (readonly string name, readonly time value);return of_AddVarExp(name,"Time('" + String(value) + "')")
end function

public function long of_addvar (readonly string name, readonly string value);return of_AddVarExp(name,"'" + value + "'")
end function

public function long of_addvar (readonly string name, readonly long value);return of_AddVarExp(name,String(value))
end function

public function long of_addvar (readonly string name, readonly double value);return of_AddVarExp(name,String(value))
end function

public function long of_addvar (readonly string name, readonly datetime value);return of_AddVarExp(name,"DateTime('" + String(value) + "')")
end function

public function long of_addvar (readonly string name, readonly date value);return of_AddVarExp(name,"Date('" + String(value) + "')")
end function

public function long of_addvar (readonly string name, readonly boolean value);return of_AddVarExp(name,String(value))
end function

public function long of_setvar (readonly string name, readonly time value);return of_SetVarExp(name,"Time('" + String(value) + "')",false,false)
end function

public function long of_setvar (readonly string name, readonly string value);return of_SetVarExp(name,"'" + value + "'",false,false)
end function

public function long of_setvar (readonly string name, readonly long value);return of_SetVarExp(name,String(value),false,false)
end function

public function long of_setvar (readonly string name, readonly double value);return of_SetVarExp(name,String(value),false,false)
end function

public function long of_setvar (readonly string name, readonly datetime value);return of_SetVarExp(name,"DateTime('" + String(value) + "')",false,false)
end function

public function long of_setvar (readonly string name, readonly date value);return of_SetVarExp(name,"Date('" + String(value) + "')",false,false)
end function

public function long of_setvar (readonly string name, readonly boolean value);return of_SetVarExp(name,String(value),false,false)
end function

private subroutine _of_resetcolumns ();COLUMNDATA emptyColDatas[]

ColDatas = emptyColDatas
end subroutine

public function long of_calc (readonly long row, readonly boolean force);//====================================================================
// Function: of_calc()
//--------------------------------------------------------------------
// Description: 计算指定行的列表达式
//--------------------------------------------------------------------
// Arguments:
// 	readonly	long		row	
// 	readonly	boolean	force	强制更新所有表达式（默认排除需要手动输入触发的表达式）
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-10
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int nIndex,nCount

if Not #Enabled then return RetCode.FAILED
if row < 1 or row > #DataWindow.RowCount() then return RetCode.E_OUT_OF_RANGE
if _bRowCalcing then return RetCode.FAILED

_bRowCalcing = true

_of_MakeDirty()

nCount = UpperBound(ColExpDatas)
for nIndex = 1 to nCount
	if Not force then
		if UpperBound(ColExpDatas[nIndex].relativeInputColIDs) > 0 then continue
	end if
	_of_CalcItem(row,nIndex)
next

_bRowCalcing = false

return RetCode.OK
end function

public function long of_calc (readonly long row);return of_Calc(row,false)
end function

public function long of_calcall (readonly boolean force);//====================================================================
// Function: of_calcall()
//--------------------------------------------------------------------
// Description: 计算所有行的表达式
//--------------------------------------------------------------------
// Arguments:
// 	readonly	boolean	force	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-10
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long nRow,nRowCnt

if Not #Enabled then return RetCode.FAILED

nRowCnt = #DataWindow.RowCount()
for nRow = 1 to nRowCnt
	of_Calc(nRow,force)
next

return RetCode.OK
end function

private function long _of_parseexp (ref string exp, ref vardata vars[], ref funcdata fns[]);long nPos,nLen
long nMacFlag,nMacPos
int nIndex,nVarIdx,nVarCnt,nFnIdx,nFnCnt,nFnArgIdx,nFnArgCnt,nGVarIdx,nGVarCnt,nGFnIdx,nGFnCnt
string sExp,sVarExp,sWord,sQuote
boolean bQuoted
long nFnPos,nFnArgPos,nFnBrCnt
string sFnWord,sFnQuote,sEmptyArray[]
boolean bFnQuoted
boolean bDD
VARDATA varData,varDatas[]
FUNCDATA fnData,fnDatas[]
constant string	TRAILER 				= ";"
constant string	MACRO_FLAG			= "$"
constant long		MACRO_PHASE_NONE	= 0
constant long		MACRO_PHASE_FIND	= 1
constant long		MACRO_PHASE_PARSE	= 2

if Pos(exp,MACRO_FLAG) = 0 then return RetCode.OK

sExp = exp + TRAILER
nMacFlag = MACRO_PHASE_FIND

nLen = Len(sExp)
for nPos = 1 to nLen
	sWord = Mid(sExp,nPos,1)
	choose case sWord
		case "'","~""
			if sQuote = sWord or sQuote = "" then
				bQuoted = Not bQuoted
				if bQuoted then
					sQuote = sWord
				else
					sQuote = ""
				end if
			end if
			if bQuoted then
				nMacFlag = MACRO_PHASE_NONE
			elseif nMacFlag = MACRO_PHASE_NONE then
				nMacFlag = MACRO_PHASE_FIND
			end if
		case MACRO_FLAG
			if nMacFlag <> MACRO_PHASE_FIND then continue
			nMacFlag = MACRO_PHASE_PARSE
			nMacPos = nPos
			bDD = (Mid(sExp,nPos + 1,1) = MACRO_FLAG)
			if bDD then
				nPos++
			end if
		case "=","+","-","*","/","\",">","<","^",",","(",")","[","]","{","}",":",",","?","!","&","|",TRAILER
			if bQuoted then continue
			if nMacFlag = MACRO_PHASE_NONE then
				nMacFlag = MACRO_PHASE_FIND
			elseif nMacFlag = MACRO_PHASE_PARSE then
				if sWord = "(" then
					fnData.builtIn = bDD
					if fnData.builtIn then
						fnData.name = Trim(Mid(sExp,nMacPos + 2,nPos - nMacPos - 2))
					else
						fnData.name = Trim(Mid(sExp,nMacPos + 1,nPos - nMacPos - 1))
					end if
					fnData.args = sEmptyArray
					nFnBrCnt = 0
					for nFnPos = nPos + 1 to nLen
						sFnWord = Mid(sExp,nFnPos,1)
						choose case sFnWord
							case "'","~""
								if sFnQuote = sFnWord or sFnQuote = ""then
									bFnQuoted = Not bFnQuoted
									if bFnQuoted then
										sFnQuote = sFnWord
										if nFnArgPos <= 0 then
											nFnArgPos = nFnPos
										end if
									else
										sFnQuote = ""
									end if
								end if
							case "("
								if bFnQuoted then continue
								nFnBrCnt ++
								if nFnArgPos <= 0 then
									nFnArgPos = nFnPos
								end if
							case ")"
								if bFnQuoted then continue
								nFnBrCnt --
								if nFnBrCnt = -1 then
									if nFnArgPos > 0 then
										fnData.args[UpperBound(fnData.args) + 1] = RightTrim(Mid(sExp,nFnArgPos,nFnPos - nFnArgPos))
										nFnArgPos = 0
									elseif nFnArgPos = -1 then
										exit
									end if
									fnData.fullName = Mid(sExp,nMacPos,nFnPos - nMacPos + 1)
									for nIndex = 1 to nFnCnt
										if fnDatas[nIndex].fullName = fnData.fullName then exit
									next
									if nIndex > nFnCnt then
										nFnCnt = UpperBound(fnDatas) + 1
										fnDatas[nFnCnt] = fnData
									else
										do while nIndex < nFnCnt
											fnDatas[nIndex] = fnDatas[nIndex + 1]
											nIndex++
										loop
										fnDatas[nFnCnt] = fnData
									end if
									exit
								end if
							case ","
								if bFnQuoted or nFnBrCnt > 0 then continue
								if nFnArgPos > 0 then
									fnData.args[UpperBound(fnData.args) + 1] = RightTrim(Mid(sExp,nFnArgPos,nFnPos - nFnArgPos))
									nFnArgPos = -1
								else
									exit
								end if
							case else
								if nFnArgPos <= 0 then
									if sFnWord <> " " and sFnWord <> "~t" /*and sFnWord <> "~n"*/ then
										nFnArgPos = nFnPos
									end if
								end if
						end choose
					next
					if bFnQuoted or nFnBrCnt <> -1 or nFnArgPos <> 0 then
						MessageBoxEx("错误","解析函数宏失败!~n无效的参数列表",StopSign!)
						return RetCode.E_INVALID_ARGUMENT
					end if
					if fnData.builtIn then
						choose case fnData.name
							case FUNC_VAR
								if UpperBound(fnData.args) <> 1 then
									MessageBoxEx("错误","解析函数宏失败!~n函数{" + fnData.fullName + "},参数数量不正确",StopSign!)
									return RetCode.E_INVALID_ARGUMENT
								end if
							case FUNC_INVOKE
								if UpperBound(fnData.args) < 1 then
									MessageBoxEx("错误","解析函数宏失败!~n函数{" + fnData.name + "},参数数量不正确",StopSign!)
									return RetCode.E_INVALID_ARGUMENT
								end if
							case else
								MessageBoxEx("错误","解析函数宏失败!~n函数{" + fnData.name + "},未定义",StopSign!)
								return RetCode.E_INVALID_ARGUMENT
						end choose
					end if
				else
					if nPos - nMacPos - 1 > 0 then
						if bDD then
							varData.name = Trim(Mid(sExp,nMacPos + 2,nPos - nMacPos - 2))
						else
							varData.name = Trim(Mid(sExp,nMacPos + 1,nPos - nMacPos - 1))
						end if
						varData.fullName = RightTrim(Mid(sExp,nMacPos,nPos - nMacPos))
						if Not bDD then
							nVarIdx = _of_FindVarIndex(varData.name)
							if nVarIdx = 0 then
								MessageBoxEx("错误","解析变量宏失败!~n变量{" + varData.name + "},未定义",StopSign!)
								return RetCode.E_INVALID_ARGUMENT
							end if
							sVarExp = GlobalVars[nVarIdx].exp
							if sVarExp = "" then
								MessageBoxEx("错误","解析变量宏失败!~n变量{" + varData.name + "},值无效",StopSign!)
								return RetCode.FAILED
							end if
							sVarExp = "(" + sVarExp + ")"
							sExp = ReplaceAll(sExp,varData.fullName,sVarExp,true,true)
							nLen = Len(sExp)
							nPos += Len(sVarExp) - (nPos - nMacPos)
							if GlobalVars[nVarIdx].hasMacro then
								nGVarCnt = UpperBound(GlobalVars[nVarIdx].vars)
								for nGVarIdx = 1 to nGVarCnt
									for nIndex = 1 to nVarCnt
										if varDatas[nIndex] = GlobalVars[nVarIdx].vars[nGVarIdx] then exit
									next
									if nIndex > nVarCnt then
										nVarCnt = UpperBound(varDatas) + 1
										varDatas[nVarCnt] = GlobalVars[nVarIdx].vars[nGVarIdx]
									end if
								next
								nGFnCnt = UpperBound(GlobalVars[nVarIdx].fns)
								for nGFnIdx = 1 to nGFnCnt
									for nIndex = 1 to nFnCnt
										if fnDatas[nIndex].fullName = GlobalVars[nVarIdx].fns[nGFnIdx].fullName then exit
									next
									if nIndex > nFnCnt then
										nFnCnt = UpperBound(fnDatas) + 1
										fnDatas[nFnCnt] = GlobalVars[nVarIdx].fns[nGFnIdx]
									else
										do while nIndex < nFnCnt
											fnDatas[nIndex] = fnDatas[nIndex + 1]
											nIndex++
										loop
										fnDatas[nFnCnt] = GlobalVars[nVarIdx].fns[nGFnIdx]
									end if
								next
							end if
							nFnCnt = UpperBound(fnDatas)
							for nFnIdx = 1 to nFnCnt
								if Pos(fnDatas[nFnIdx].fullName,varData.fullName) > 0 then
									fnDatas[nFnIdx].fullName = ReplaceAll(fnDatas[nFnIdx].fullName,varData.fullName,sVarExp,true,true)
									nFnArgCnt = UpperBound(fnDatas[nFnIdx].args)
									for nFnArgIdx = 1 to nFnArgCnt
										fnDatas[nFnIdx].args[nFnArgIdx] = ReplaceAll(fnDatas[nFnIdx].args[nFnArgIdx],varData.fullName,sVarExp,true,true)
									next
								end if
							next
						else
							for nIndex = 1 to nVarCnt
								if varDatas[nIndex].fullName = varData.fullName then exit
							next
							if nIndex > nVarCnt then
								nVarCnt = UpperBound(varDatas) + 1
								varDatas[nVarCnt] = varData
							end if
						end if
					else
						MessageBoxEx("错误","解析变量宏失败!~n无效的名称",StopSign!)
						return RetCode.E_INVALID_ARGUMENT
					end if
				end if
				nMacFlag = MACRO_PHASE_FIND
			end if
		case else
			if nMacFlag = MACRO_PHASE_FIND then
				if sWord <> " " and sWord <> "~t" /*and sWord <> "~n"*/ then
					nMacFlag = MACRO_PHASE_NONE
				end if
			elseif nMacFlag = MACRO_PHASE_NONE then
				if sWord = " " or sWord = "~t" /*or sWord = "~n"*/ then
					nMacFlag = MACRO_PHASE_FIND
				end if
			end if
	end choose
next

exp = Left(sExp,nLen - 1)
vars = varDatas
fns = fnDatas

return RetCode.OK
end function

public function integer of_addexp (string colname, string exp);//====================================================================
// Function: of_addexp()
//--------------------------------------------------------------------
// Description: 添加指定列的表达式
//--------------------------------------------------------------------
// Arguments:
// 	value	string	colname	
// 	value	string	exp    	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int nIndex,nCount,nIndex2,nIndex3
long nDupExpsAll[],nDupExps[],nEmptys[]
COLUMNEXPDATA expData

colName = Lower(Trim(colName))
if colName = "" or exp = "" then return RetCode.E_INVALID_ARGUMENT

expData.id = Long(#DataWindow.Describe(colName + ".ID"))
if expData.id = 0 then return RetCode.E_INVALID_ARGUMENT
expData.name = colName
expData.dwo = _of_GetDWObject(colName)
expData.colType = _of_GetColumnType(colName)
if #DataWindow.Describe(colName+".edit.NilIsNull") = "yes" then
	expData.emptyStringIsNull =  true
elseif #DataWindow.Describe(colName+".dddw.NilIsNull") = "yes" then
	expData.emptyStringIsNull =  true
elseif #DataWindow.Describe(colName+".ddlb.NilIsNull") = "yes" then
	expData.emptyStringIsNull =  true
end if

if IsFailed(_of_ParseExp(ref exp,ref expData.vars,ref expData.fns)) then return RetCode.E_INVALID_ARGUMENT

expData.exp = exp
expData.hasMacro = (UpperBound(expData.vars) > 0 or UpperBound(expData.fns) > 0)

nIndex = UpperBound(ColExpDatas) + 1
ColExpDatas[nIndex] = expData

for nIndex2 = nIndex to 1 step -1
	if ColExpDatas[nIndex2].name = colName then
		nDupExpsAll[UpperBound(nDupExpsAll) + 1] = nIndex2
	end if
next
nCount = UpperBound(nDupExpsAll)
if nCount > 1 then
	for nIndex2 = 1 to nCount
		nDupExps = nEmptys
		for nIndex3 = 1 to nCount
			if nDupExpsAll[nIndex3] = nDupExpsAll[nIndex2] then continue
			nDupExps[UpperBound(nDupExps) + 1] = nDupExpsAll[nIndex3]
		next
		ColExpDatas[nDupExpsAll[nIndex2]].dupExps = nDupExps
	next
end if

_of_ResetColumns()

return nIndex
end function

public function long of_addvarexp (readonly string name, string exp);//====================================================================
// Function: of_addvarexp()
//--------------------------------------------------------------------
// Description: 添加全局变量表达式(区分大小写)
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	name	
// 	value		string	value    	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long nPos,nLen
GLOBALVARDATA varData

if name = "" or exp = "" then return RetCode.E_INVALID_ARGUMENT
if _of_FindVarIndex(name) > 0 then return RetCode.FAILED

nLen = Len(name)
for nPos = 1 to nLen
	choose case Mid(name,nPos,1)
		case " ","~t","~n","~r","'","~"","+","-","*","/","\",">","<","=","(",")","{","}","[","]",",",".",":",";","?","!","&","|"		//Word delimiters
			return RetCode.E_INVALID_ARGUMENT
	end choose
next

if IsFailed(_of_ParseExp(ref exp,ref varData.vars,ref varData.fns)) then return RetCode.E_INVALID_ARGUMENT

varData.name = name
varData.exp = exp
varData.hasMacro = (UpperBound(varData.vars) > 0 or UpperBound(varData.fns) > 0)

GlobalVars[UpperBound(GlobalVars) + 1] = varData

_of_ResetColumns()

return RetCode.OK
end function

private function string _of_preprocessexp (readonly long row, readonly dwobject dwo, string exp, readonly vardata vars[], funcdata fns[]);int nIndex,nVarIdx,nVarCount,nGVarIdx,nFnIdx,nFnCnt,nFnArgIdx,nFnArgCnt
string sVal,sArgs[],sArgs2[],sEmptyArray[]
any aVal

nFnCnt = UpperBound(fns)
nVarCount = UpperBound(vars)

for nVarIdx = 1 to nVarCount
	if vars[nVarIdx].index = 0 then
		nGVarIdx = _of_FindVarIndex(vars[nVarIdx].name)
		if nGVarIdx = 0 then
			MessageBoxEx("ColumnExp Error","预处理表达式发生错误!~n[" + String(dwo.name) + "]表达式错误:~n变量{" + vars[nVarIdx].name + "},未定义",StopSign!)
			return ""
		end if
		vars[nVarIdx].index = nGVarIdx
	else
		nGVarIdx = vars[nVarIdx].index
	end if
	if GlobalVars[nGVarIdx].hasMacro then
		sVal = _of_PreprocessExp(row,dwo,GlobalVars[nGVarIdx].exp,GlobalVars[nGVarIdx].vars,GlobalVars[nGVarIdx].fns)
		if sVal = "" then return ""
	else
		sVal = GlobalVars[nGVarIdx].exp
		if sVal = "" then
			MessageBoxEx("ColumnExp Error","预处理表达式发生错误!~n[" + String(dwo.name) + "]表达式错误:~n变量{" + vars[nVarIdx].name + "},值无效",StopSign!)
			return ""
		end if
	end if
	sVal = "(" + sVal + ")"
	exp = ReplaceAll(exp,vars[nVarIdx].fullName,sVal,true,true)
	for nFnIdx = 1 to nFnCnt
		if Pos(fns[nFnIdx].fullName,vars[nVarIdx].fullName) > 0 then
			fns[nFnIdx].fullName = ReplaceAll(fns[nFnIdx].fullName,vars[nVarIdx].fullName,sVal,true,true)
			nFnArgCnt = UpperBound(fns[nFnIdx].args)
			for nFnArgIdx = 1 to nFnArgCnt
				fns[nFnIdx].args[nFnArgIdx] = ReplaceAll(fns[nFnIdx].args[nFnArgIdx],vars[nVarIdx].fullName,sVal,true,true)
			next
		end if
	next
next

for nFnIdx = nFnCnt to 1 step -1
	sArgs = sEmptyArray
	nFnArgCnt = UpperBound(fns[nFnIdx].args)
	for nFnArgIdx = 1 to nFnArgCnt
		sVal = _of_Evaluate(fns[nFnIdx].args[nFnArgIdx],row)
		if sVal = "!" or sVal = "?" then
			MessageBoxEx("ColumnExp Error","预处理表达式发生错误!~n[" + String(dwo.name) + "]表达式错误:~nExpression:" + fns[nFnIdx].fullName + "~nSub Expression:" + fns[nFnIdx].args[nFnArgIdx],StopSign!)
			return ""
		end if
		sArgs[nFnArgIdx] = sVal
	next
	if fns[nFnIdx].builtIn then
		choose case fns[nFnIdx].name
			case FUNC_VAR
				nGVarIdx = _of_FindVarIndex(sArgs[1])
				if nGVarIdx = 0 then
					MessageBoxEx("ColumnExp Error","预处理表达式发生错误!~n[" + String(dwo.name) + "]表达式错误:~n变量{" + sArgs[1] + "},未定义",StopSign!)
					return ""
				end if
				if GlobalVars[nGVarIdx].hasMacro then
					sVal = _of_PreprocessExp(row,dwo,GlobalVars[nGVarIdx].exp,GlobalVars[nGVarIdx].vars,GlobalVars[nGVarIdx].fns)
					if sVal = "" then return ""
				else
					sVal = GlobalVars[nGVarIdx].exp
					if sVal = "" then
						MessageBoxEx("ColumnExp Error","预处理表达式发生错误!~n[" + String(dwo.name) + "]表达式错误:~n变量{" + sArgs[1] + "},值无效",StopSign!)
						return ""
					end if
				end if
			case FUNC_INVOKE
				sArgs2 = sEmptyArray
				for nFnArgIdx = 2 to nFnArgCnt
					sArgs2[nFnArgIdx - 1] = sArgs[nFnArgIdx]
				next
				aVal = #DataWindow.Event OnColumnExpInvokeMethod(row,dwo,sArgs[1],sArgs2)
				choose case ClassName(aVal)
					case "string"
						sVal = "'" + String(aVal) + "'"
					case "long","integer","unsignedlong","usignedinteger","double","real","decimal"
						sVal = String(aVal)
					case "boolean"
						if aVal = true then
							sVal = "1=1"
						else
							sVal = "1=0"
						end if
					case "datetime"
						sVal = "DateTime('" + String(aVal) + "')"
					case "date"
						sVal = "Date('" + String(aVal) + "')"
					case "time"
						sVal = "Time('" + String(aVal) + "')"
					case else
						MessageBoxEx("ColumnExp Error","预处理表达式发生错误!~n[" + String(dwo.name) + "]表达式错误:~n函数{" + sArgs[1] + "},返回值无效",StopSign!)
						return ""
				end choose
		end choose
	else
		aVal = #DataWindow.Event OnColumnExpInvokeMethod(row,dwo,fns[nFnIdx].name,sArgs)
		choose case ClassName(aVal)
			case "string"
				sVal = "'" + String(aVal) + "'"
			case "long","integer","unsignedlong","usignedinteger","double","real","decimal"
				sVal = String(aVal)
			case "boolean"
				if aVal = true then
					sVal = "1=1"
				else
					sVal = "1=0"
				end if
			case "datetime"
				sVal = "DateTime('" + String(aVal) + "')"
			case "date"
				sVal = "Date('" + String(aVal) + "')"
			case "time"
				sVal = "Time('" + String(aVal) + "')"
			case else
				MessageBoxEx("ColumnExp Error","预处理表达式发生错误!~n[" + String(dwo.name) + "]表达式错误:~n函数{" + fns[nFnIdx].name + "},返回值无效",StopSign!)
				return ""
		end choose
	end if
	sVal = "(" + sVal + ")"
	exp = ReplaceAll(exp,fns[nFnIdx].fullName,sVal,true,true)
	for nIndex = 1 to nFnIdx - 1
		if Pos(fns[nIndex].fullName,fns[nFnIdx].fullName) > 0 then
			fns[nIndex].fullName = ReplaceAll(fns[nIndex].fullName,fns[nFnIdx].fullName,sVal,true,true)
			nFnArgCnt = UpperBound(fns[nIndex].args)
			for nFnArgIdx = 1 to nFnArgCnt
				fns[nIndex].args[nFnArgIdx] = ReplaceAll(fns[nIndex].args[nFnArgIdx],fns[nFnIdx].fullName,sVal,true,true)
			next
		end if
	next
next

return exp
end function

public function long of_setexp (readonly integer index, string exp, readonly boolean recalc);//====================================================================
// Function: of_setexp()
//--------------------------------------------------------------------
// Description: 设置指定列的表达式
//--------------------------------------------------------------------
// Arguments:
// 	readonly	integer	index	
// 	value		string 	exp  	
// 	readonly	boolean	recalc	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sErrInfo

if index < 1 or index > UpperBound(ColExpDatas) then return RetCode.E_OUT_OF_BOUND
if exp = "" then return RetCode.E_INVALID_ARGUMENT
if ColExpDatas[index].exp = exp then return RetCode.OK

if IsFailed(_of_ParseExp(ref exp,ref ColExpDatas[index].vars,ref ColExpDatas[index].fns)) then return RetCode.E_INVALID_ARGUMENT

ColExpDatas[index].exp = exp
ColExpDatas[index].hasMacro = (UpperBound(ColExpDatas[index].vars) > 0 or UpperBound(ColExpDatas[index].fns) > 0)
if ColExpDatas[index].cacheable then
	if ColExpDatas[index].hasMacro then
		#DataWindow.Modify("Destroy " + ColExpDatas[index].computeName)
	else
		if _of_HasDWObject(ColExpDatas[index].computeName) then
			sErrInfo = #DataWindow.Modify(ColExpDatas[index].computeName + ".expression=~"" + exp + "~"")
		else
			_of_CreateCompute(ColExpDatas[index].computeName,exp,ref sErrInfo)
		end if
		if sErrInfo <> "" then
			MessageBoxEx("ColumnExp Error","[" + String(ColExpDatas[index].name) + "]更新表达式缓存失败:~nExpression:" + exp + "~nError:" + sErrInfo,StopSign!)
		end if
	end if
end if

_of_ResetColumns()

if #Enabled and Not _bRowCalcing and recalc then
	long nRow,nRowCnt
	nRowCnt = #DataWindow.RowCount()
	if nRowCnt > 0 then
		for nRow = 1 to nRowCnt
			_of_CalcItem(nRow,index)
		next
	end if
end if

return RetCode.OK
end function

public function long of_setexp (readonly string colname, readonly string exp, readonly boolean recalc);int index
long rtCode

index = _of_FindExpIndex(colName)
if index > 0 then
	return of_SetExp(index,exp,recalc)
else
	rtCode = of_AddExp(colName,exp)
	if rtCode > 0 then return RetCode.OK
	return rtCode
end if
end function

public function long of_setexp (readonly integer index, readonly string exp);return of_SetExp(index,exp,false)
end function

public function long of_setexp (readonly string colname, readonly string exp);return of_SetExp(colName,exp,false)
end function

public function long of_setvarexp (readonly string name, readonly string exp);return of_SetVarExp(name,exp,false,false)
end function

public function long of_setvar (readonly string name, readonly time value, readonly boolean recalc);return of_SetVarExp(name,"Time('" + String(value) + "')",recalc,false)
end function

public function long of_setvar (readonly string name, readonly string value, readonly boolean recalc);return of_SetVarExp(name,"'" + value + "'",recalc,false)
end function

public function long of_setvar (readonly string name, readonly long value, readonly boolean recalc);return of_SetVarExp(name,String(value),recalc,false)
end function

public function long of_setvar (readonly string name, readonly double value, readonly boolean recalc);return of_SetVarExp(name,String(value),recalc,false)
end function

public function long of_setvar (readonly string name, readonly datetime value, readonly boolean recalc);return of_SetVarExp(name,"DateTime('" + String(value) + "')",recalc,false)
end function

public function long of_setvar (readonly string name, readonly date value, readonly boolean recalc);return of_SetVarExp(name,"Date('" + String(value) + "')",recalc,false)
end function

public function long of_setvar (readonly string name, readonly boolean value, readonly boolean recalc);return of_SetVarExp(name,String(value),recalc,false)
end function

public function long of_setvarexp (readonly string name, string exp, readonly boolean recalc, readonly boolean force);//====================================================================
// Function: of_setvarexp()
//--------------------------------------------------------------------
// Description: 设置指定全局变量的表达式(区分大小写)
//--------------------------------------------------------------------
// Arguments:
// 	readonly	integer	index	
// 	value		string 	value  
// 	readonly	boolean	recalc		
// 	readonly	boolean	force		
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int index

index = _of_FindVarIndex(name)
if index = 0 then return of_AddVarExp(name,exp)
if exp = "" then return RetCode.E_INVALID_ARGUMENT
if GlobalVars[index].exp = exp then return RetCode.OK

if IsFailed(_of_ParseExp(ref exp,ref GlobalVars[index].vars,ref GlobalVars[index].fns)) then return RetCode.E_INVALID_ARGUMENT

GlobalVars[index].exp = exp
GlobalVars[index].hasMacro = (UpperBound(GlobalVars[index].vars) > 0 or UpperBound(GlobalVars[index].fns) > 0)

_of_ResetColumns()

if #Enabled and Not _bRowCalcing and recalc then
	long nRow,nRowCnt
	int nIndex,nCount
	int nColExps[]
	nRowCnt = #DataWindow.RowCount()
	if nRowCnt > 0 then
		nCount = _of_FindVarDepends(index,ref nColExps,false)
		if nCount > 0 then
			_bRowCalcing = true
			for nRow = 1 to nRowCnt
				_of_MakeDirty()
				for nIndex = 1 to nCount
					if Not force then
						if UpperBound(ColExpDatas[nColExps[nIndex]].relativeInputColIDs) > 0 then continue
					end if
					_of_CalcItem(nRow,nColExps[nIndex])
				next
			next
			_bRowCalcing = false
		end if
	end if
end if

return RetCode.OK
end function

public function long of_setvarexp (readonly string name, readonly string exp, readonly boolean recalc);return of_SetVarExp(name,exp,recalc,false)
end function

public function long of_setvar (readonly string name, readonly time value, readonly boolean recalc, readonly boolean force);return of_SetVarExp(name,"Time('" + String(value) + "')",recalc,force)
end function

public function long of_setvar (readonly string name, readonly boolean value, readonly boolean recalc, readonly boolean force);return of_SetVarExp(name,String(value),recalc,force)
end function

public function long of_setvar (readonly string name, readonly date value, readonly boolean recalc, readonly boolean force);return of_SetVarExp(name,"Date('" + String(value) + "')",recalc,force)
end function

public function long of_setvar (readonly string name, readonly datetime value, readonly boolean recalc, readonly boolean force);return of_SetVarExp(name,"DateTime('" + String(value) + "')",recalc,force)
end function

public function long of_setvar (readonly string name, readonly double value, readonly boolean recalc, readonly boolean force);return of_SetVarExp(name,String(value),recalc,force)
end function

public function long of_setvar (readonly string name, readonly long value, readonly boolean recalc, readonly boolean force);return of_SetVarExp(name,String(value),recalc,force)
end function

public function long of_setvar (readonly string name, readonly string value, readonly boolean recalc, readonly boolean force);return of_SetVarExp(name,"'" + value + "'",recalc,force)
end function

private function boolean _of_hasref (string exp, readonly string colname);long nPos,nLen,nPosBegin
string sWord,sQuote
boolean bQuoted
constant string TRAILER = ";"

exp = Lower(exp) + TRAILER
nLen = Len(exp)
nPosBegin = 1

for nPos = 1 to nLen
	sWord = Mid(exp,nPos,1)
	choose case sWord
		case "'","~""
			if sQuote = sWord or sQuote = "" then
				bQuoted = Not bQuoted
				if bQuoted then
					sQuote = sWord
				else
					sQuote = ""
				end if
				nPosBegin = 0
			end if
		case " ","~t","~n","~r","+","-","*","/","\",">","<","=","(",")","{","}","[","]",",",".",":",";","?","!","&","|"
			if bQuoted then continue
			if nPosBegin > 0 then
				if Mid(exp,nPosBegin,nPos - nPosBegin) = colName then return true
				nPosBegin = 0
			end if
		case else
			if bQuoted then continue
			if nPosBegin = 0 then
				nPosBegin = nPos
			end if
	end choose
next

return false
end function

public function long of_setcacheable (readonly integer index, readonly boolean cache);//====================================================================
// Function: of_setcacheable()
//--------------------------------------------------------------------
// Description: 设置指定表达式的缓存开关（开启后ColumnExp将会为该表达式创建计算列）
//--------------------------------------------------------------------
// Arguments:
// 	readonly	integer	index	
// 	readonly	boolean	cache	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-03-16
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sErrInfo

if index < 1 or index > UpperBound(ColExpDatas) then return RetCode.E_OUT_OF_BOUND
if ColExpDatas[index].cacheable = cache then return RetCode.OK

if cache then
	if ColExpDatas[index].hasMacro then return RetCode.E_NO_SUPPORT
	_nCachedID ++
	ColExpDatas[index].computeName = ColExpDatas[index].name + "_" + String(_nCachedID) + "_" + DWOSUFFIX
	if Not _of_CreateCompute(ColExpDatas[index].computeName,ColExpDatas[index].exp,ref sErrInfo) then
		MessageBoxEx("ColumnExp Error","[" + String(ColExpDatas[index].name) + "]创建表达式缓存失败:~nExpression:" + ColExpDatas[index].exp + "~nError:" + sErrInfo,StopSign!)
	end if
else
	#DataWindow.Modify("Destroy " + ColExpDatas[index].computeName)
	ColExpDatas[index].computeName = ""
end if

ColExpDatas[index].cacheable = cache

return RetCode.OK
end function

public function long of_setcacheable (readonly string colname, readonly boolean cache);//====================================================================
// Function: of_setcacheable()
//--------------------------------------------------------------------
// Description: 设置指定表达式的缓存开关（开启后ColumnExp将会为该表达式创建计算列）
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string 	colname   	
// 	readonly	boolean	cache	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-03-16
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return of_SetCacheable(_of_FindExpIndex(colName),cache)
end function

private function boolean _of_createcompute (readonly string name, readonly string exp, ref string errinfo);string sSyntax

sSyntax  = 'create compute(band=detail alignment="1" expression="' + exp + '" border="0" '
sSyntax += 'color="0" x="0" y="0" height="0" width="0" '
sSyntax += 'html.valueishtml="0" name=' + name + ' visible="1" enabled="0" font.face="Arial" '
sSyntax += 'font.height="-10" font.weight="400" font.family="0" font.pitch="2" '
sSyntax += 'font.charset="0" background.mode="1" background.color="0")~n'

errInfo = #DataWindow.Modify(sSyntax)
if errInfo <> "" then
	errInfo = sSyntax + errInfo
end if

return errInfo = ""
end function

public function long of_calcempty (readonly long row);//====================================================================
// Function: of_calcempty()
//--------------------------------------------------------------------
// Description: 计算指定行的列表达式(为空数据的列)
//--------------------------------------------------------------------
// Arguments:
// 	readonly	long		row	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-10
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int nIndex,nCount,nIndex2,nCount2
boolean bEmpty

if Not #Enabled then return RetCode.FAILED
if row < 1 or row > #DataWindow.RowCount() then return RetCode.E_OUT_OF_RANGE
if _bRowCalcingEmpty then return RetCode.FAILED

_bRowCalcingEmpty = true

nCount = UpperBound(ColExpDatas)
for nIndex = 1 to nCount
	ColExpDatas[nIndex].dirty = true
	choose case ColExpDatas[nIndex].colType
		case COL_TYPE_DECIMAL
			ColExpDatas[nIndex].empty = IsNull(#DataWindow.GetItemDecimal(row,ColExpDatas[nIndex].id))
		case COL_TYPE_INTEGER
			ColExpDatas[nIndex].empty = IsNull(#DataWindow.GetItemNumber(row,ColExpDatas[nIndex].id))
		case COL_TYPE_STRING
			ColExpDatas[nIndex].empty = IsNull(#DataWindow.GetItemString(row,ColExpDatas[nIndex].id))
		case COL_TYPE_DATETIME
			ColExpDatas[nIndex].empty = IsNull(#DataWindow.GetItemDateTime(row,ColExpDatas[nIndex].id))
		case COL_TYPE_DATE
			ColExpDatas[nIndex].empty = IsNull(#DataWindow.GetItemDate(row,ColExpDatas[nIndex].id))
		case COL_TYPE_TIME
			ColExpDatas[nIndex].empty = IsNull(#DataWindow.GetItemTime(row,ColExpDatas[nIndex].id))
		case else
			ColExpDatas[nIndex].empty = false
	end choose
next

for nIndex = 1 to nCount
	if Not ColExpDatas[nIndex].empty or Not ColExpDatas[nIndex].dirty then continue
	if Not _of_CalcItem(row,nIndex) then continue
	if nIndex = nCount then exit
	nCount2 = UpperBound(ColExpDatas[nIndex].dupExps)
	if nCount2 = 0 then continue
	choose case ColExpDatas[nIndex].colType
		case COL_TYPE_DECIMAL
			bEmpty = IsNull(#DataWindow.GetItemDecimal(row,ColExpDatas[nIndex].id))
		case COL_TYPE_INTEGER
			bEmpty = IsNull(#DataWindow.GetItemNumber(row,ColExpDatas[nIndex].id))
		case COL_TYPE_STRING
			bEmpty = IsNull(#DataWindow.GetItemString(row,ColExpDatas[nIndex].id))
		case COL_TYPE_DATETIME
			bEmpty = IsNull(#DataWindow.GetItemDateTime(row,ColExpDatas[nIndex].id))
		case COL_TYPE_DATE
			bEmpty = IsNull(#DataWindow.GetItemDate(row,ColExpDatas[nIndex].id))
		case COL_TYPE_TIME
			bEmpty = IsNull(#DataWindow.GetItemTime(row,ColExpDatas[nIndex].id))
		case else
			bEmpty = true
	end choose
	if bEmpty then continue
	for nIndex2 = 1 to nCount2
		ColExpDatas[ColExpDatas[nIndex].dupExps[nIndex2]].dirty = false
	next
next

_bRowCalcingEmpty = false

return RetCode.OK
end function

public function long of_calcempty ();//====================================================================
// Function: of_calcempty()
//--------------------------------------------------------------------
// Description: 计算所有行的表达式(为空数据的列)
//--------------------------------------------------------------------
// Arguments:
// 	readonly	boolean	force	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-11-10
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long nRow,nRowCnt

if Not #Enabled then return RetCode.FAILED

nRowCnt = #DataWindow.RowCount()
for nRow = 1 to nRowCnt
	of_CalcEmpty(nRow)
next

return RetCode.OK
end function

on n_cst_dwsvc_columnexp.create
call super::create
end on

on n_cst_dwsvc_columnexp.destroy
call super::destroy
end on

event constructor;call super::constructor;_vecCalcStack = Create n_vector
_vecCalcStack.Reserve(20)
end event

event destructor;call super::destructor;Destroy _vecCalcStack
end event

event onenable;call super::onenable;/*if enabled then
	#DataWindow.of_On("!" + #DataWindow.EVT_ITEMCHANGED,this,"onItemChanged")
else
	#DataWindow.of_Off(this)
end if*/
return 0
end event

