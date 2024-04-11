$PBExportHeader$n_cst_thread_task_sqlupdate.sru
$PBExportComments$PowerThread线程数据库更新任务对象~r~n[运行在子线程]~r~nBy gaoqiangz@msn.com
forward
global type n_cst_thread_task_sqlupdate from n_cst_thread_task_sqlbase
end type
type tabledata from structure within n_cst_thread_task_sqlupdate
end type
end forward

type tabledata from structure
	string		name
	string		updatablecolumns[]
	string		keycolumns[]
	string		identitycolumn
	long		updatewhere
	boolean		updatekeyinplace
end type

global type n_cst_thread_task_sqlupdate from n_cst_thread_task_sqlbase
end type
global n_cst_thread_task_sqlupdate n_cst_thread_task_sqlupdate

type prototypes

end prototypes

type variables
/*--- Implementation ---*/
private:
TABLEDATA Tables[]

boolean _bAutoCommit
boolean _bMultiTableUpdate
string _sDataObject
string _sSQLSyntax	

blob _blbUpdateData
long _nUpdateRows
end variables

forward prototypes
private function n_cst_threading_task_sqlupdate _of_gettasking ()
public function long of_reset ()
public function long of_setupdatedata (ref blob blbdata, readonly long rows)
public function long of_getupdaterows ()
public function long of_addupdatabletable (readonly string name, readonly string updatablecolumns[], readonly string keycolumns[], readonly string identitycolumn, readonly long updatewhere, readonly boolean updatekeyinplace)
private function long _of_updateprepare (readonly n_cst_thread_task_sqlbase_ds data, readonly integer index)
private function long _of_update (readonly n_cst_thread_task_sqlbase_ds data)
public function long of_setautocommit (readonly boolean autocommit)
public function long of_setdataobject (readonly string dataobject)
public function long of_setmultitableupdate (readonly boolean multitable)
public function long of_setsqlsyntax (readonly string sqlsyntax)
end prototypes

private function n_cst_threading_task_sqlupdate _of_gettasking ();return #ParentTasking
end function

public function long of_reset ();TABLEDATA emptyTables[]

if #Running then return RetCode.E_BUSY

_bAutoCommit = false
_bMultiTableUpdate = false
_sDataObject = ""
_sSQLSyntax = ""

Tables = emptyTables
_blbUpdateData = Blob("")
_nUpdateRows = 0

return super::of_Reset()
end function

public function long of_setupdatedata (ref blob blbdata, readonly long rows);_blbUpdateData = blbData
_nUpdateRows = rows
return RetCode.OK
end function

public function long of_getupdaterows ();return _nUpdateRows
end function

public function long of_addupdatabletable (readonly string name, readonly string updatablecolumns[], readonly string keycolumns[], readonly string identitycolumn, readonly long updatewhere, readonly boolean updatekeyinplace);int nIndex

if name = "" or UpperBound(updatableColumns) = 0 or UpperBound(keyColumns) = 0 then return RetCode.E_INVALID_ARGUMENT

nIndex = UpperBound(Tables) + 1

Tables[nIndex].Name = name
Tables[nIndex].UpdatableColumns = updatableColumns
Tables[nIndex].KeyColumns = keyColumns
Tables[nIndex].IdentityColumn = identityColumn
Tables[nIndex].UpdateWhere = updateWhere
Tables[nIndex].UpdateKeyInPlace = updateKeyInPlace

return RetCode.OK
end function

private function long _of_updateprepare (readonly n_cst_thread_task_sqlbase_ds data, readonly integer index);long nIndex,nCount,nColId,nKeyColumns[]
long nRow,nRowCnt
string sModString,sErr

//Reset
nCount = Long(Data.Describe("DataWindow.Column.Count"))
for nIndex = 1 to nCount
	sModString += "#" + String(nIndex) + ".Update = no" + "~n"
	sModString += "#" + String(nIndex) + ".Key = no" + "~n"
	sModString += "#" + String(nIndex) + ".Identity = no" + "~n"
next

//Updatable Columns
nCount = UpperBound(Tables[index].UpdatableColumns)
for nIndex = 1 to nCount
	sModString += Tables[index].UpdatableColumns[nIndex] + ".Update = yes" + "~n"
next
//Key Columns
nCount = UpperBound(Tables[index].KeyColumns)
for nIndex = 1 to nCount
	if Data.Describe(Tables[index].KeyColumns[nIndex] + ".Key") <> "yes" then
		nColId = Long(Data.Describe(Tables[index].KeyColumns[nIndex] + ".Id"))
		if nColId <= 0 then
			Event OnError(RetCode.E_INTERNAL_ERROR,"无效的列名:" + Tables[index].KeyColumns[nIndex])
			return RetCode.E_INTERNAL_ERROR
		end if
		nKeyColumns[UpperBound(nKeyColumns) + 1] = nColId
	end if
	sModString += Tables[index].KeyColumns[nIndex] + ".Key = yes" + "~n"
next
//Identity Column
if Tables[index].IdentityColumn <> "" then
	sModString += Tables[index].IdentityColumn + ".Identity = yes" + "~n"
end if
//Update Where
if Not IsNull(Tables[index].UpdateWhere) then
	sModString += "DataWindow.Table.UpdateWhere = '" + String(Tables[index].UpdateWhere) + "'" + "~n"
end if
//Update Key In-Place
if Not IsNull(Tables[index].UpdateKeyInPlace) then
	if Tables[index].UpdateKeyInPlace then
		sModString += "DataWindow.Table.UpdateKeyinPlace = yes" + "~n"
	else
		sModString += "DataWindow.Table.UpdateKeyinPlace = no" + "~n"
	end if
end if
//Update Table
sModString += "DataWindow.Table.UpdateTable = '" + Tables[index].Name + "'"

sErr = Data.Modify(sModString)
if sErr <> "" then
	Event OnError(RetCode.E_INTERNAL_ERROR,sErr)
	return RetCode.E_INTERNAL_ERROR
end if

/*FIXME
	如果DW当前请求的KEY字段属性Key=no，那么DataModified!将不会生成Delete/Insert语句
	为解决这个问题，需要强制刷新内部的修改状态，使生成Delete/Insert语句
*/
if Data.Describe("DataWindow.Table.UpdateKeyinPlace") = "no" then
	nCount = UpperBound(nKeyColumns)
	if nCount > 0 then
		nRowCnt = Data.RowCount()
		for nRow = 1 to nRowCnt
			if Data.GetItemStatus(nRow,0,Primary!) <> DataModified! then continue
			for nIndex = 1 to nCount
				if Data.GetItemStatus(nRow,nKeyColumns[nIndex],Primary!) <> DataModified! then continue
				Data.Object.Data[nRow,nKeyColumns[nIndex]] = Data.Object.Data[nRow,nKeyColumns[nIndex]]
			next
		next
	end if
end if

return RetCode.OK
end function

private function long _of_update (readonly n_cst_thread_task_sqlbase_ds data);long rtCode
long nIndex,nCount
long nIdentityColumn
long nPrimaryIdValues[],nFilterIdValues[]
string sUpdateTable,sColDBNamePrefix
n_cst_threading_task_sqlupdate tasking
n_cst_thread_trans transObject

if IsFailed(of_GetTransObject(ref transObject)) then return RetCode.E_INVALID_TRANSACTION

if of_IsCancelled() then return RetCode.CANCELLED

tasking = #ParentTasking

Data.of_ClearState()

sUpdateTable = Data.Describe("DataWindow.Table.UpdateTable")
if sUpdateTable = "" or sUpdateTable = "!" or sUpdateTable = "?" then
	Event OnError(RetCode.E_DB_ERROR,"没有可更新的表")
	return RetCode.E_DB_ERROR
end if

if IsPrevented(TransObject.Event OnBeforeUpdate(Data)) then
	if TransObject.of_IsFailed() then
		Event OnDBError(TransObject.SQLDBCode,TransObject.SQLErrText,"",Primary!,0)
		Event OnError(RetCode.E_DB_ERROR,"")
		return RetCode.E_DB_ERROR
	end if
	return RetCode.CANCELLED
end if

rtCode = Data.Update(true,false)

TransObject.Event OnAfterUpdate(Data,rtCode)

if TransObject.SQLCode = -1 and rtCode = 1 then
	rtCode = -1
end if

if of_IsCancelled() then return RetCode.CANCELLED

if rtCode = 1 then
	if Data.of_GetInsertedCount() > 0 then
		/*--- 处理自动增加列 ---*/
		sColDBNamePrefix = Lower(sUpdateTable) + "."
		nCount = Long(Data.Describe("DataWindow.Column.Count"))
		for nIndex = 1 to nCount
			if Data.Describe("#" + String(nIndex) + ".Identity") = "yes" then
				if Lower(Left(Data.Describe("#" + String(nIndex) + ".DBName"),Len(sColDBNamePrefix))) = sColDBNamePrefix or nIdentityColumn = 0 then
					nIdentityColumn = nIndex
				end if
			end if
		next
		if nIdentityColumn > 0 then
			//Primary
			nCount = Data.RowCount()
			for nIndex = 1 to nCount
				if Data.GetItemStatus(nIndex,0,Primary!) = NewModified! then
					nPrimaryIdValues[UpperBound(nPrimaryIdValues) + 1] = Data.GetItemNumber(nIndex,nIdentityColumn)
				end if
			next
			//Filter
			//*过滤缓冲区的数据与数据源(调用GetChanges的对象)的过滤缓冲区的数据顺序是相反的
			nCount = Data.FilteredCount()
			for nIndex = nCount to 1 step -1
				if Data.GetItemStatus(nIndex,0,Filter!) = NewModified! then
					nFilterIdValues[UpperBound(nFilterIdValues) + 1] = Data.GetItemNumber(nIndex,nIdentityColumn,Filter!,false)
				end if
			next
			if UpperBound(nPrimaryIdValues) > 0 or UpperBound(nFilterIdValues) > 0 then
				tasking.Event OnIdentityColumnDataRetrieved(nIdentityColumn,ref nPrimaryIdValues,ref nFilterIdValues)
			end if
		end if
	end if
	tasking.Event OnUpdated(Data.of_GetInsertedCount(),Data.of_GetUpdatedCount(),Data.of_GetDeletedCount())
	return RetCode.OK
else
	return RetCode.E_DB_ERROR
end if
end function

public function long of_setautocommit (readonly boolean autocommit);_bAutoCommit = autoCommit

return RetCode.OK
end function

public function long of_setdataobject (readonly string dataobject);_sDataObject = dataObject
_sSQLSyntax = ""

return RetCode.OK
end function

public function long of_setmultitableupdate (readonly boolean multitable);_bMultiTableUpdate = multiTable

return RetCode.OK
end function

public function long of_setsqlsyntax (readonly string sqlsyntax);_sSQLSyntax = sqlSyntax
_sDataObject = ""

return RetCode.OK
end function

on n_cst_thread_task_sqlupdate.create
call super::create
end on

on n_cst_thread_task_sqlupdate.destroy
call super::destroy
end on

event ondotask;call super::ondotask;long rtCode
int nIndex,nCount
string sError
boolean bCacheDS
n_cst_thread_task_sqlbase_ds data
n_cst_thread_trans transObject
DBERRORDATA dbErrData

if IsFailed(of_GetTransObject(ref transObject,ref dbErrData)) then
	Event OnDBError(dbErrData.SQLDBCode,dbErrData.SQLErrText,"",Primary!,0)
	Event OnError(RetCode.E_INVALID_TRANSACTION,dbErrData.SQLErrText)
	return RetCode.E_INVALID_TRANSACTION
end if

rtCode = RetCode.OK

do
	if of_IsCancelled() then exit
	
	if _sDataObject <> "" then
		bCacheDS = true
		data = of_GetCacheDS(_sDataObject)
	end if
	if Not IsValidObject(data) then
		if #ParentThread.of_IsMainThread() then
			data = Create n_cst_thread_task_sqlbase_ds
		else
			data = Create n_cst_thread_task_sqlbase_ds_mt
		end if
		data.Event OnInit(this)
	end if
	
	if _sSQLSyntax <> "" then
		if data.Create(_sSQLSyntax,ref sError) <> 1 then
			rtCode = RetCode.E_INVALID_SQL
			exit
		end if
	else
		if _sDataObject <> "" then
			if Not bCacheDS then
				data.DataObject = _sDataObject
			end if
		else
			sError = "无效的数据源对象!"
			rtCode = RetCode.E_INVALID_DATAOBJECT
			exit
		end if
	end if
	
	//*去掉排序条件,保证数据按拷贝的顺序被提交
	data.SetSort("")
	
	rtCode = data.SetChanges(_blbUpdateData)
	if rtCode <> 1 then
		//无更新数据
		if rtCode = -1 and _nUpdateRows = 0 then
			rtCode = RetCode.OK
			exit
		end if
		sError = "无效的更新数据!"
		rtCode = RetCode.E_INVALID_DATA
		exit
	end if
	
	_blbUpdateData = Blob("")
	
	if data.SetTransObject(transObject) <> 1 then
		sError = "设置事务对象失败!"
		rtCode = RetCode.E_INVALID_TRANSACTION
		exit
	end if
	
	if _bMultiTableUpdate then
		//多表更新
		nCount = UpperBound(Tables)
		if nCount = 0 then
			sError = "没有设置可更新表!"
			rtCode = RetCode.E_INVALID_ARGUMENT
			exit
		end if
		for nIndex = 1 to nCount
			rtCode = _of_UpdatePrepare(data,nIndex)
			if rtCode <> RetCode.OK then exit
			rtCode = _of_Update(data)
			if rtCode <> RetCode.OK then exit
		next
	else
		rtCode = _of_Update(data)
	end if
loop while false

if bCacheDS then
	data.Reset()
else
	if IsValid(data) then Destroy data
end if

if of_IsCancelled() then
	rtCode = RetCode.CANCELLED
end if

if rtCode = RetCode.OK then
	if _bAutoCommit then
		rtCode = of_Commit(true)
		if IsFailed(rtCode) then
			if rtCode <> of_GetLastErrorCode() then
				Event OnError(rtCode,transObject.SQLErrText)
			end if
		end if
	end if
else
	transObject.of_Rollback()
	if rtCode <> RetCode.CANCELLED then
		if rtCode <> of_GetLastErrorCode() then
			Event OnError(rtCode,sError)
		end if
	end if
end if

return rtCode
end event

event onfinalize;call super::onfinalize;_blbUpdateData = Blob("")
_nUpdateRows = 0
end event

