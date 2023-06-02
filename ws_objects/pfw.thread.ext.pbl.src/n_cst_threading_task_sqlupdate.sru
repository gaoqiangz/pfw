$PBExportHeader$n_cst_threading_task_sqlupdate.sru
$PBExportComments$PowerThread线程数据库任务控制对象~r~n[运行在当前线程]~r~nBy gaoqiangz@msn.com
forward
global type n_cst_threading_task_sqlupdate from n_cst_threading_task_sqlbase
end type
type idcoldata from structure within n_cst_threading_task_sqlupdate
end type
end forward

type IdColData from structure
	long		id
	long		PrimaryValues[]
	long		FilterValues[]
end type

global type n_cst_threading_task_sqlupdate from n_cst_threading_task_sqlbase
string #type = "sqlupdate"
event onupdated ( long inserted,  long updated,  long deleted )
event onidentitycolumndataretrieved ( long id,  ref long primaryvalues[],  ref long filtervalues[] )
end type
global n_cst_threading_task_sqlupdate n_cst_threading_task_sqlupdate

type variables
/*--- Constants ---*/
public:
//Type
constant string TASK_TYPE = "sqlupdate"

/*--- Implementation ---*/
Private:
long _nRowsInserted
long _nRowsUpdated
long _nRowsDeleted

ulong _hEvtCommitted

boolean _bMultiTableUpdate

powerobject _updateObject

//Identity columns
IDCOLDATA _idColDatas[]
end variables

forward prototypes
private function n_cst_thread_task_sqlupdate _of_gettask ()
public function long of_reset ()
public function long of_setdataobject (readonly string dataobject)
public function long of_setautocommit (readonly boolean autocommit)
public function long of_rollback ()
public function long of_setsqlsyntax (readonly string sqlsyntax)
public function long of_refreshidentitydata (readonly powerobject object)
public function long of_setmultitableupdate (readonly boolean multitable)
public function long of_getrowsinserted ()
public function long of_getrowsdeleted ()
public function long of_getrowsupdated ()
public function boolean of_iscommitted ()
public function long of_addupdatabletable (string name, string updatablecolumns[], string keycolumns[], string identitycolumn, long updatewhere, boolean updatekeyinplace)
public function long of_addupdatabletable (string name, string updatablecolumns[], string keycolumns[], string identitycolumn)
public function long of_commit (readonly boolean autorollback)
public function long of_commit ()
public function long of_setupdatedata (ref blob blbdata, readonly long updaterows)
public function long of_setupdateobject (readonly powerobject object, readonly boolean applydata)
public function long of_setupdateobject (readonly powerobject object)
end prototypes

event onupdated(long inserted, long updated, long deleted);_nRowsInserted += inserted
_nRowsUpdated += updated
_nRowsDeleted += deleted
end event

event onidentitycolumndataretrieved(long id, ref long primaryvalues[], ref long filtervalues[]);int nIndex

nIndex = UpperBound(_idColDatas) + 1
_idColDatas[nIndex].id = id
_idColDatas[nIndex].primaryValues = primaryValues
_idColDatas[nIndex].filterValues = filterValues
end event

private function n_cst_thread_task_sqlupdate _of_gettask ();return _Task
end function

public function long of_reset ();long rtCode
IDCOLDATA emptyIdColDatas[]

rtCode = super::of_Reset()
if IsFailed(rtCode) then return rtCode

_bMultiTableUpdate = false

_nRowsInserted = 0
_nRowsUpdated = 0
_nRowsDeleted = 0
_idColDatas = emptyIdColDatas
SetNull(_updateObject)

return RetCode.OK
end function

public function long of_setdataobject (readonly string dataobject);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_SetDataObject(dataObject)
end function

public function long of_setautocommit (readonly boolean autocommit);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_SetAutoCommit(autoCommit)
end function

public function long of_rollback ();if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_Rollback()
end function

public function long of_setsqlsyntax (readonly string sqlsyntax);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_SetSQLSyntax(sqlSyntax)
end function

public function long of_refreshidentitydata (readonly powerobject object);long nRow,nRowCnt
long nIndex,nCount,i,n
DataWindow dw
DataStore ds

if of_IsBusy() then return RetCode.E_BUSY
if Not IsValidObject(object) then return RetCode.E_INVALID_OBJECT

nCount = UpperBound(_idColDatas)
if nCount = 0 then return RetCode.FAILED

choose case object.TypeOf()
	case DataWindow!
		dw = Object
		dw.SetRedraw(false)
		//Primary
		n = UpperBound(_idColDatas[1].primaryValues)
		if n > 0 then
			nRow = dw.GetNextModified(0,Primary!)
			do while(nRow > 0)
				if dw.GetItemStatus(nRow,0,Primary!) = NewModified! then
					i++
					if i > n then exit
					for nIndex = 1 to nCount
						dw.SetItem(nRow,_idColDatas[nIndex].id,_idColDatas[nIndex].primaryValues[i])
					next
				end if
				nRow = dw.GetNextModified(nRow,Primary!)
			loop
		end if
		//Filter
		n = UpperBound(_idColDatas[1].filterValues)
		if n > 0 then
			i = 0
			nRow = dw.GetNextModified(0,Filter!)
			do while(nRow > 0)
				if dw.GetItemStatus(nRow,0,Filter!) = NewModified! then
					i ++
					if i > n then exit
					for nIndex = 1 to nCount
						dw.Object.Data.Filter[nRow,_idColDatas[nIndex].id] = _idColDatas[nIndex].filterValues[i]
					next
				end if
				nRow = dw.GetNextModified(nRow,Filter!)
			loop
		end if
		dw.SetRedraw(true)
	case DataStore!
		ds = Object
		//Primary
		n = UpperBound(_idColDatas[1].primaryValues)
		if n > 0 then
			nRow = ds.GetNextModified(0,Primary!)
			do while(nRow > 0)
				if ds.GetItemStatus(nRow,0,Primary!) = NewModified! then
					i++
					if i > n then exit
					for nIndex = 1 to nCount
						ds.SetItem(nRow,_idColDatas[nIndex].id,_idColDatas[nIndex].primaryValues[i])
					next
				end if
				nRow = ds.GetNextModified(nRow,Primary!)
			loop
		end if
		//Filter
		n = UpperBound(_idColDatas[1].filterValues)
		if n > 0 then
			i = 0
			nRow = ds.GetNextModified(0,Filter!)
			do while(nRow > 0)
				if ds.GetItemStatus(nRow,0,Filter!) = NewModified! then
					i ++
					if i > n then exit
					for nIndex = 1 to nCount
						ds.Object.Data.Filter[nRow,_idColDatas[nIndex].id] = _idColDatas[nIndex].filterValues[i]
					next
				end if
				nRow = ds.GetNextModified(nRow,Filter!)
			loop
		end if
	case else
		return RetCode.E_INVALID_TYPE
end choose

return RetCode.OK
end function

public function long of_setmultitableupdate (readonly boolean multitable);if of_IsBusy() then return RetCode.E_BUSY

_bMultiTableUpdate = multiTable

return _of_GetTask().of_SetMultiTableUpdate(multiTable)
end function

public function long of_getrowsinserted ();return _nRowsInserted
end function

public function long of_getrowsdeleted ();return _nRowsDeleted
end function

public function long of_getrowsupdated ();return _nRowsUpdated
end function

public function boolean of_iscommitted ();return (WaitForSingleObject(_hEvtCommitted,0) = 0) //WAIT_OBJECT_0
end function

public function long of_addupdatabletable (string name, string updatablecolumns[], string keycolumns[], string identitycolumn, long updatewhere, boolean updatekeyinplace);if of_IsBusy() then return RetCode.E_BUSY
return _of_GetTask().of_AddUpdatableTable(name,updatableColumns,keyColumns,identityColumn,updateWhere,updateKeyInPlace)
end function

public function long of_addupdatabletable (string name, string updatablecolumns[], string keycolumns[], string identitycolumn);Long nUpdateWhere
Boolean bUpdateInPlace

SetNull(nUpdateWhere)
SetNull(bUpdateInPlace)

return of_AddUpdatableTable(name,updatableColumns,keyColumns,identityColumn,nUpdateWhere,bUpdateInPlace)
end function

public function long of_commit (readonly boolean autorollback);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_Commit(autoRollback)
end function

public function long of_commit ();return of_Commit(true)
end function

public function long of_setupdatedata (ref blob blbdata, readonly long updaterows);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_SetUpdateData(ref blbData,updateRows)
end function

public function long of_setupdateobject (readonly powerobject object, readonly boolean applydata);blob blbData
long nChangeRows
DataWindow dw
DataStore ds

if of_IsBusy() then return RetCode.E_BUSY
if Not IsValidObject(object) then return RetCode.E_INVALID_OBJECT

choose case object.TypeOf()
	case DataWindow!
		_updateObject = object
		if applyData then
			dw = object
			if dw.Describe("DataWindow.Table.UpdateTable") <> "?" or _bMultiTableUpdate then
				nChangeRows = dw.GetChanges(ref blbData)
			end if
			_of_GetTask().of_SetSQLSyntax(dw.Describe("DataWindow.Syntax"))
			_of_GetTask().of_SetUpdateData(ref blbData,nChangeRows)
		end if
	case DataStore!
		_updateObject = object
		if applyData then
			ds = object
			if ds.Describe("DataWindow.Table.UpdateTable") <> "?" or _bMultiTableUpdate then
				nChangeRows = ds.GetChanges(ref blbData)
			end if
			_of_GetTask().of_SetSQLSyntax(ds.Describe("DataWindow.Syntax"))
			_of_GetTask().of_SetUpdateData(ref blbData,nChangeRows)
		end if
	case else
		return RetCode.E_INVALID_TYPE
end choose

return RetCode.OK
end function

public function long of_setupdateobject (readonly powerobject object);return of_SetUpdateObject(object,true)
end function

on n_cst_threading_task_sqlupdate.create
call super::create
end on

on n_cst_threading_task_sqlupdate.destroy
call super::destroy
end on

event ongettaskclsname;return "n_cst_thread_task_sqlupdate"
end event

event onprepare;call super::onprepare;IDCOLDATA emptyIdColDatas[]

if AncestorReturnValue <> 0 then return AncestorReturnValue

_nRowsInserted = 0
_nRowsUpdated = 0
_nRowsDeleted = 0
_idColDatas = emptyIdColDatas

return 0 //continue
end event

event oninit;call super::oninit;if AncestorReturnValue <> RetCode.OK then return AncestorReturnValue
_hEvtCommitted = _of_GetTask().of_GetCommitEvent()
return RetCode.OK
end event

event onfinalize;call super::onfinalize;if of_GetLastExitCode() = RetCode.OK then
	if IsValid(_updateObject) then
		of_RefreshIdentityData(_updateObject)
	end if
end if
end event

event ondberror;call super::ondberror;long nRow,nCnt
datastore ds
datawindow dw

if Not IsValidObject(_updateObject) then return
if _lastDBError.row <= 0 then return

choose case _updateObject.TypeOf()
	case DataWindow!
		dw = _updateObject
		//Primary
		nRow = dw.GetNextModified(0,Primary!)
		do while(nRow > 0)
			nCnt ++
			if nCnt = _lastDBError.row then
				_lastDBError.row = nRow
				return
			end if
			nRow = dw.GetNextModified(nRow,Primary!)
		loop
	case DataStore!
		ds = _updateObject
		//Primary
		nRow = ds.GetNextModified(0,Primary!)
		do while(nRow > 0)
			nCnt ++
			if nCnt = _lastDBError.row then
				_lastDBError.row = nRow
				return
			end if
			nRow = ds.GetNextModified(nRow,Primary!)
		loop
end choose
end event

