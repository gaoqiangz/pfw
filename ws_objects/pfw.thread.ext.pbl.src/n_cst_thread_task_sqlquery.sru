$PBExportHeader$n_cst_thread_task_sqlquery.sru
$PBExportComments$PowerThread线程SQL查询任务对象~r~n[运行在子线程]~r~nBy gaoqiangz@msn.com
forward
global type n_cst_thread_task_sqlquery from n_cst_thread_task_sqlbase
end type
type sqlclause from structure within n_cst_thread_task_sqlquery
end type
end forward

type sqlclause from structure
	integer		index
	long		ms
	string		clause
end type

shared variables

end variables

global type n_cst_thread_task_sqlquery from n_cst_thread_task_sqlbase
event type long ondatareceived ( ref n_cst_thread_task_sqlbase_ds data,  long rowcount )
end type
global n_cst_thread_task_sqlquery n_cst_thread_task_sqlquery

type variables
/*--- Implementation ---*/
private:
string _sHookClass
string _sDataObject
string _sSQL
string _sSQLSyntax
string _sNewSort
string _sNewFilter
long _nChunkSize	= 10000	//Chunk row count,min:1000
boolean _bPaged
long _nPageSize
long _nPageIndex
boolean _bPageCounting = true
boolean _bPageNative			//Use native implementation
long _nMaxRows
boolean _bCache

SQLCLAUSE _whereClauses[]
SQLCLAUSE _orderByClauses[]

string _sPagedUniqueIndexColumns[]
end variables

forward prototypes
public function long of_reset ()
private function n_cst_threading_task_sqlquery _of_gettasking ()
private subroutine _of_reset ()
public function long of_setwhereclause (readonly integer selectindex, readonly long ms, readonly string clause)
public function long of_setorderbyclause (readonly integer selectindex, readonly long ms, readonly string clause)
private function long _of_buildpagedsql (readonly n_cst_thread_trans transobject, readonly string origsql, ref string sql)
public function long of_setpageduniqueindexcolumns (readonly string columns[])
public function long of_setchunksize (readonly long chunksize)
public function long of_setcache (readonly boolean cache)
public function long of_setdataobject (readonly string dataobject)
public function long of_sethookclass (readonly string hookcls)
public function long of_setmaxrows (readonly long rows)
public function long of_setpagecounting (readonly boolean counting)
public function long of_setpaged (readonly boolean paged)
public function long of_setpageindex (readonly long pageindex)
public function long of_setpagenative (readonly boolean use_native)
public function long of_setpagesize (readonly long pagesize)
public function long of_setsql (readonly string sql)
public function long of_setsqlsyntax (readonly string sqlsyntax)
public function long of_setfilter (readonly string filter)
public function long of_setsort (readonly string sort)
end prototypes

event type long ondatareceived(ref n_cst_thread_task_sqlbase_ds data, long rowcount);string sProp,sColName
int nIndex,nCount,nChunkIdx,nChunkCnt
long nRow,nRowCnt,nFilterCnt
blob blbData
n_cst_threading_task_sqlquery tasking
datastore dsTmp
datawindowchild dwcSrc

tasking = #ParentTasking

tasking.Event OnDataReceived(rowCount)

if #ParentThread.of_IsMainThread() then
	if Not tasking._of_HasReceiver() and Not _bCache then
		tasking.Event OnDataMove(data)
		SetNull(data)
		return RetCode.OK
	end if
end if

choose case Long(Data.Describe("DataWindow.Processing"))
	case 4,5 //Crosstab or Composite datawindow
		Data.GetFullState(ref blbData)
		Data.Reset()
		if tasking.Event OnDataChunk(ref blbData,1,1,true) < 0 then
			Event OnError(RetCode.E_INTERNAL_ERROR,"TransData Failed")
			return RetCode.E_INTERNAL_ERROR
		end if
		blbData = Blob("")
	case else
		if tasking._of_NeedCreate() then
			tasking.Event OnCreateData(Data.Describe("DataWindow.Syntax"))
			if of_IsCancelled() then return RetCode.CANCELLED
		end if
		
		//DDDW
		nCount = Long(Data.Describe("DataWindow.Column.Count"))
		for nIndex = 1 to nCount
			sProp = Data.Describe("#"+String(nIndex)+".DDDW.AutoRetrieve")
			if sProp <> "yes" then continue
			sProp = Data.Describe("#"+String(nIndex)+".DDDW.Name")
			if sProp <> "!" and sProp <> "?" then
				sColName = Data.Describe("#"+String(nIndex)+".Name")
				if Data.GetChild(sColName,ref dwcSrc) = -1 then continue
				nRowCnt = dwcSrc.RowCount()
				for nRow = 1 to nRowCnt
					dwcSrc.SetItemStatus(nRow,0,Primary!,DataModified!)
				next
				nRowCnt = dwcSrc.FilteredCount()
				for nRow = 1 to nRowCnt
					dwcSrc.SetItemStatus(nRow,0,Filter!,DataModified!)
				next
				if dwcSrc.GetChanges(ref blbData) < 0 then
					Event OnError(RetCode.E_INTERNAL_ERROR,"[" + sColName + "] GetChanges Failed")
					return RetCode.E_INTERNAL_ERROR
				end if
				dwcSrc.Reset()
				if tasking.Event OnChildDataReceived(sColName,ref blbData) < 0 then
					Event OnError(RetCode.E_INTERNAL_ERROR,"[" + sColName + "] TransData Failed")
					return RetCode.E_INTERNAL_ERROR
				end if
				blbData = Blob("")
				if of_IsCancelled() then return RetCode.CANCELLED
			end if
		next
		if of_IsCancelled() then return RetCode.CANCELLED
		
		//Chunk
		nChunkCnt = Ceiling((Data.RowCount() + Data.FilteredCount()) / _nChunkSize)
		if nChunkCnt > 0 then
			//FIXME
			//带排序的DW大于1块时使用SetChanges可能会丢失行
			//采用临时的DS来绕开此问题
			sProp = Data.Describe("DataWindow.Table.Sort")
			if nChunkCnt > 1 and sProp <> "?" and sProp <> "" then
				dsTmp = Create datastore
				if Data.DataObject <> "" then
					dsTmp.DataObject = Data.DataObject
				else
					dsTmp.Create(Data.Describe("DataWindow.Syntax"))
				end if
				for nChunkIdx = 1 to nChunkCnt
					nRowCnt = Min(_nChunkSize,Data.RowCount())
					Data.RowsMove(1,nRowCnt,Primary!,dsTmp,1,Primary!)
					for nRow = 1 to nRowCnt
						dsTmp.SetItemStatus(nRow,0,Primary!,DataModified!)
					next
					if nRowCnt < _nChunkSize and Data.FilteredCount() > 0 then
						nFilterCnt = Min(_nChunkSize - nRowCnt,Data.FilteredCount())
						Data.RowsMove(1,nFilterCnt,Filter!,dsTmp,1,Filter!)
						for nRow = 1 to nFilterCnt
							dsTmp.SetItemStatus(nRow,0,Filter!,DataModified!)
						next
					end if
					if dsTmp.GetChanges(ref blbData) < 0 then
						Event OnError(RetCode.E_INTERNAL_ERROR,"GetChanges Failed")
						return RetCode.E_INTERNAL_ERROR
					end if
					//FIXME
					//不能使用Reset来清除数据，会使SetChanges应用不到行
					if nRowCnt > 0 then
						dsTmp.RowsDiscard(1,nRowCnt,Primary!)
					end if
					if nFilterCnt > 0 then
						dsTmp.RowsDiscard(1,nFilterCnt,Filter!)
					end if
					if tasking.Event OnDataChunk(ref blbData,nChunkCnt,nChunkIdx,false) < 0 then
						Event OnError(RetCode.E_INTERNAL_ERROR,"TransData Failed")
						return RetCode.E_INTERNAL_ERROR
					end if
					blbData = Blob("")
					if nChunkIdx < nChunkCnt then
						if Not of_Wait(0.02) then return RetCode.CANCELLED
					end if
				next
				Destroy dsTmp
			else
				for nChunkIdx = 1 to nChunkCnt
					nRowCnt = Min(_nChunkSize,Data.RowCount())
					for nRow = 1 to nRowCnt
						Data.SetItemStatus(nRow,0,Primary!,DataModified!)
					next
					if nRowCnt < _nChunkSize and Data.FilteredCount() > 0 then
						nFilterCnt = Min(_nChunkSize - nRowCnt,Data.FilteredCount())
						for nRow = 1 to nFilterCnt
							Data.SetItemStatus(nRow,0,Filter!,DataModified!)
						next
					end if
					if Data.GetChanges(ref blbData) < 0 then
						Event OnError(RetCode.E_INTERNAL_ERROR,"GetChanges Failed")
						return RetCode.E_INTERNAL_ERROR
					end if
					if nChunkIdx < nChunkCnt then
						if nRowCnt > 0 then
							Data.RowsDiscard(1,nRowCnt,Primary!)
						end if
						if nFilterCnt > 0 then
							Data.RowsDiscard(1,nFilterCnt,Filter!)
						end if
					else
						Data.Reset()
					end if
					if tasking.Event OnDataChunk(ref blbData,nChunkCnt,nChunkIdx,false) < 0 then
						Event OnError(RetCode.E_INTERNAL_ERROR,"TransData Failed")
						return RetCode.E_INTERNAL_ERROR
					end if
					blbData = Blob("")
					if nChunkIdx < nChunkCnt then
						if Not of_Wait(0.02) then return RetCode.CANCELLED
					end if
				next
			end if
		else
			tasking.Event OnDataChunk(ref blbData,1,1,false)
		end if
end choose

return RetCode.OK
end event

public function long of_reset ();if #Running then return RetCode.E_BUSY

_of_Reset()

return super::of_Reset()
end function

private function n_cst_threading_task_sqlquery _of_gettasking ();return #ParentTasking
end function

private subroutine _of_reset ();string sEmpty[]
SQLCLAUSE emptyClauses[]

_sHookClass = ""
_sSQL = ""
_sSQLSyntax = ""
_sDataObject = ""
_sNewSort = ""
_sNewFilter = ""
_nChunkSize = 10000
_nPageIndex = 0
_bPaged = false
_nPageSize = 0
_bPageCounting = true
_nMaxRows = 0
_bCache = false

_whereClauses = emptyClauses
_orderByClauses = emptyClauses
_sPagedUniqueIndexColumns = sEmpty
end subroutine

public function long of_setwhereclause (readonly integer selectindex, readonly long ms, readonly string clause);int nIndex,nCount

if selectIndex <= 0 or clause = "" then return RetCode.E_INVALID_ARGUMENT

nCount = UpperBound(_whereClauses)
for nIndex = 1 to nCount
	if _whereClauses[nIndex].index = selectIndex then
		exit
	end if
next
_whereClauses[nIndex].index = selectIndex
_whereClauses[nIndex].ms = ms
_whereClauses[nIndex].clause = clause

return RetCode.OK
end function

public function long of_setorderbyclause (readonly integer selectindex, readonly long ms, readonly string clause);int nIndex,nCount

if selectIndex <= 0 or clause = "" then return RetCode.E_INVALID_ARGUMENT

nCount = UpperBound(_orderByClauses)
for nIndex = 1 to nCount
	if _orderByClauses[nIndex].index = selectIndex then
		exit
	end if
next
_orderByClauses[nIndex].index = selectIndex
_orderByClauses[nIndex].ms = ms
_orderByClauses[nIndex].clause = clause

return RetCode.OK
end function

private function long _of_buildpagedsql (readonly n_cst_thread_trans transobject, readonly string origsql, ref string sql);int nIndex,nCount
string sOrderBy,sOrigColumns,sUniqueColumns,sUniqueColumnsOrderBy,sUniqueColumnsWhere
n_sql sqlParser

if _nPageSize <= 0 or _nPageIndex <= 0 then
	Event OnError(RetCode.E_INVALID_ARGUMENT,"无效的分页设置!")
	return RetCode.E_INVALID_ARGUMENT
end if

sqlParser = Create n_sql

if Not sqlParser.Parse(origSql) then
	Event OnError(RetCode.E_INTERNAL_ERROR,"SQL解析失败!")
	return RetCode.E_INTERNAL_ERROR
end if

//根据指定页码生成对应的SQL
choose case TransObject.of_GetDBType()
	case TransObject.DBT_MSSQL
		//MSSQL实现
		if UpperBound(_sPagedUniqueIndexColumns) > 0 then
			/*
				快速唯一索引列分页优化
			*/
			sOrderBy = Lower(sqlParser.GetOrder())
			nCount = UpperBound(_sPagedUniqueIndexColumns)
			for nIndex = 1 to nCount
				if nIndex > 1 then sUniqueColumns += ","
				sUniqueColumns += _sPagedUniqueIndexColumns[nIndex]
				if nIndex > 1 then sUniqueColumnsWhere += " AND "
				sUniqueColumnsWhere += "pfwPagedSQL_OutterTbl." + Mid(_sPagedUniqueIndexColumns[nIndex],Pos(_sPagedUniqueIndexColumns[nIndex],".") + 1) + " = " + _sPagedUniqueIndexColumns[nIndex]
				if Pos(sOrderBy,Lower(_sPagedUniqueIndexColumns[nIndex])) = 0 then
					if sUniqueColumnsOrderBy <> "" then sUniqueColumnsOrderBy += ","
					sUniqueColumnsOrderBy += _sPagedUniqueIndexColumns[nIndex]
				end if
			next
			sOrigColumns = sqlParser.GetColumn()
			//增加ORDER BY语句
			sqlParser.ModifyOrder(Enums.SQL_MS_APPEND,sUniqueColumnsOrderBy)
			sOrderBy = sqlParser.GetOrder()
			if _bPageNative then
				//构造INNER JOIN内层子查询语句
				sqlParser.ModifyColumn(Enums.SQL_MS_REPLACE, sUniqueColumns)
				sql = sqlParser.GetSQL()  + " OFFSET " + String(_nPageSize * (_nPageIndex - 1)) + " ROWS FETCH NEXT " + String(_nPageSize) + " ROWS ONLY"
				//还原字段列表
				sqlParser.ModifyColumn(Enums.SQL_MS_REPLACE, sOrigColumns)
				//增加FROM语句
				sqlParser.ModifyTable(Enums.SQL_MS_APPEND, "INNER JOIN (" + sql + ") pfwPagedSQL_OutterTbl ON " + sUniqueColumnsWhere)
			else
				//去掉ORDER BY语句
				sqlParser.ModifyOrder(Enums.SQL_MS_REPLACE,"")
				//构造INNER JOIN内层子查询语句
				sqlParser.ModifyColumn(Enums.SQL_MS_REPLACE, "TOP " + String(_nPageSize * _nPageIndex) + " " + sUniqueColumns + ",ROW_NUMBER() OVER (ORDER BY " + sOrderBy + ") AS pfwPagedSQL_RN")
				sql = "SELECT TOP " + String(_nPageSize) + " * FROM (" + sqlParser.GetSQL() + ") pfwPagedSQL_Tbl WHERE pfwPagedSQL_RN BETWEEN " + String(_nPageSize * (_nPageIndex - 1) + 1) + " AND " + String(_nPageSize * _nPageIndex)
				//还原字段列表
				sqlParser.ModifyColumn(Enums.SQL_MS_REPLACE, sOrigColumns)
				//还原ORDER BY语句
				sqlParser.ModifyOrder(Enums.SQL_MS_REPLACE, sOrderBy)
				//增加FROM语句
				sqlParser.ModifyTable(Enums.SQL_MS_APPEND, "INNER JOIN (" + sql + ") pfwPagedSQL_OutterTbl ON " + sUniqueColumnsWhere)
			end if
			sql = sqlParser.GetSQL()
		else
			if _bPageNative then
				if sqlParser.HasOrder() then
					sOrderBy = sqlParser.GetOrder()
				else
					sOrderBy = "(SELECT 0)" //原始结果集排序
				end if
				sqlParser.ModifyOrder(Enums.SQL_MS_REPLACE,sOrderBy + " OFFSET " + String(_nPageSize * (_nPageIndex - 1)) + " ROWS FETCH NEXT " + String(_nPageSize) + " ROWS ONLY")
				sql = sqlParser.GetSQL()
			else
				if sqlParser.HasOrder() then
					sOrderBy = sqlParser.GetOrder()
					sqlParser.ModifyOrder(Enums.SQL_MS_REPLACE,"") //去掉ORDER BY语句
				else
					sOrderBy = "(SELECT 0)" //原始结果集排序
				end if
				sqlParser.ModifyColumn(Enums.SQL_MS_REPLACE, "TOP " + String(_nPageSize * _nPageIndex) + " " + sqlParser.GetColumn() + ",ROW_NUMBER() OVER (ORDER BY " + sOrderBy + ") AS pfwPagedSQL_RN")
				sql = "SELECT TOP " + String(_nPageSize) + " * FROM (" + sqlParser.GetSQL() + ") pfwPagedSQL_Tbl WHERE pfwPagedSQL_RN BETWEEN " + String(_nPageSize * (_nPageIndex - 1) + 1) + " AND " + String(_nPageSize * _nPageIndex)
				sql += " ORDER BY pfwPagedSQL_RN"
			end if
		end if
	case TransObject.DBT_ORACLE
		//ORACLE实现
		if sqlParser.HasOrder() then
			sOrderBy = sqlParser.GetOrder()
			sqlParser.ModifyOrder(Enums.SQL_MS_REPLACE,"") //去掉ORDER BY语句
		else
			sOrderBy = "''" //原始结果集排序
		end if
		sql = "SELECT * FROM (SELECT * FROM (SELECT pfwPagedSQL_TblInnerInner.*,ROW_NUMBER() OVER (ORDER BY " + sOrderBy + ") AS pfwPagedSQL_RN FROM (" + sqlParser.GetSQL() + ") pfwPagedSQL_TblInnerInner) pfwPagedSQL_TblInner WHERE pfwPagedSQL_RN <= " + String(_nPageSize * _nPageIndex) + ") pfwPagedSQL_TblOuter " + &
				"WHERE pfwPagedSQL_RN BETWEEN " + String(_nPageSize * (_nPageIndex - 1) + 1) + " AND " + String(_nPageSize * _nPageIndex)
	case else
		Event OnError(RetCode.E_NO_IMPLEMENTATION,"")
		return RetCode.E_NO_IMPLEMENTATION
end choose

Destroy sqlParser

return RetCode.OK
end function

public function long of_setpageduniqueindexcolumns (readonly string columns[]);_sPagedUniqueIndexColumns = columns
return RetCode.OK
end function

public function long of_setchunksize (readonly long chunksize);if chunkSize <= 1000 then return RetCode.E_INVALID_ARGUMENT

_nChunkSize = chunkSize

return RetCode.OK
end function

public function long of_setcache (readonly boolean cache);_bCache = cache

return RetCode.OK
end function

public function long of_setdataobject (readonly string dataobject);_sDataObject = dataobject
_sSQLSyntax = ""

return RetCode.OK
end function

public function long of_sethookclass (readonly string hookcls);_sHookClass = hookCls

return RetCode.OK
end function

public function long of_setmaxrows (readonly long rows);if rows < 0 then return RetCode.E_INVALID_ARGUMENT

_nMaxRows = rows

return RetCode.OK
end function

public function long of_setpagecounting (readonly boolean counting);_bPageCounting = counting

return RetCode.OK
end function

public function long of_setpaged (readonly boolean paged);_bPaged = paged

return RetCode.OK
end function

public function long of_setpageindex (readonly long pageindex);if pageIndex <= 0 then return RetCode.E_INVALID_ARGUMENT

_nPageIndex = pageIndex

return RetCode.OK
end function

public function long of_setpagenative (readonly boolean use_native);_bPageNative = use_native

return RetCode.OK
end function

public function long of_setpagesize (readonly long pagesize);if pageSize <= 0 then return RetCode.E_INVALID_ARGUMENT

_nPageSize = pageSize

return RetCode.OK
end function

public function long of_setsql (readonly string sql);_sSQL = sql

return RetCode.OK
end function

public function long of_setsqlsyntax (readonly string sqlsyntax);_sSQLSyntax = sqlSyntax
_sDataObject = ""

return RetCode.OK
end function

public function long of_setfilter (readonly string filter);_sNewFilter = filter

return RetCode.OK
end function

public function long of_setsort (readonly string sort);_sNewSort = sort

return RetCode.OK
end function

on n_cst_thread_task_sqlquery.create
call super::create
end on

on n_cst_thread_task_sqlquery.destroy
call super::destroy
end on

event ondotask;call super::ondotask;long rtCode,nRowCnt
string sSQL,sSQLOriginal,sSQLExec,sSQLSyntax,sModString,sDwArgs,sError,sProp,sColName
boolean bSwitchStaticMode,bRestoreSQL,bCacheDS,bPlainSQL
long nIndex,nCount,nColIdx,nColCnt
long nRecordCount,nPageCount
n_cst_thread_task_sqlbase_ds data
n_cst_threading_task_sqlquery tasking
n_cst_thread_task_sqlbase_hook hook
n_cst_thread_trans TransObject
n_sql sqlParser
n_map map
datastore dsTmp
DBERRORDATA dbErrData

tasking = #ParentTasking

if _sHookClass <> "" then
	hook = Create Using _sHookClass
end if

if IsFailed(of_GetTransObject(ref TransObject,ref dbErrData)) then
	Event OnDBError(dbErrdata.SQLDBCode,dbErrdata.SQLErrText,"",Primary!,0)
	Event OnError(RetCode.E_INVALID_TRANSACTION,"")
	return RetCode.E_INVALID_TRANSACTION
end if

try
	if of_IsCancelled() then
		return RetCode.CANCELLED
	end if
	
	sqlParser = Create n_sql

	//检查对象缓存
	if _bCache then
		if _sDataObject <> "" then
			bCacheDS = true
			//缓存对象使用DataObject
			data = of_GetCacheDS(_sDataObject)
		end if
	end if
	if Not IsValidObject(data) then
		if #ParentThread.of_IsMainThread() then
			data = Create n_cst_thread_task_sqlbase_ds
		else
			data = Create n_cst_thread_task_sqlbase_ds_mt
		end if
		data.Event OnInit(this)
	end if
	
	if _sDataObject <> "" then
		if Not bCacheDS then
			data.dataObject = _sDataObject
			if data.Describe("DataWindow.Units") = "" then
				Event OnError(RetCode.E_INVALID_ARGUMENT,"无效的查询对象")
				return RetCode.E_INVALID_ARGUMENT
			end if
		end if
	else
		if _sSQLSyntax <> "" then
			sSQLSyntax = _sSQLSyntax
		elseif _sSQL <> "" then
			bPlainSQL = true
			sSQL = _sSQL
			if of_HasParams() then
				if IsFailed(_of_SQLBindParams(ref sSQL,TransObject.of_GetDBType(),"")) then
					Event OnError(RetCode.E_SQL_BIND_ARG_FAILED,"SQL参数绑定失败!")
					return RetCode.E_SQL_BIND_ARG_FAILED
				end if
			end if
			sSQLSyntax = TransObject.of_GridSyntaxFromSQL(sSQL,ref sError)
			if sError <> "" then
				Event OnError(RetCode.E_INVALID_SQL,"GridSyntaxFromSQL: " + sError)
				return RetCode.E_INVALID_SQL
			end if
		else
			Event OnError(RetCode.E_INVALID_SQL,"SQL为空!")
			return RetCode.E_INVALID_SQL
		end if
		if data.Create(sSQLSyntax,ref sError) <> 1 then
			Event OnError(RetCode.E_INVALID_SQL,"Create: " + sError)
			return RetCode.E_INVALID_SQL
		end if
		sSQLSyntax = ""
	end if
	
	//修改排序和过滤语句
	if _sNewSort <> "" then
		if data.SetSort(_sNewSort) <> 1 then
			Event OnError(RetCode.E_INVALID_ARGUMENT,"SetSort: " + _sNewSort)
			return RetCode.E_INVALID_ARGUMENT
		end if
	end if
	if _sNewFilter <> "" then
		if data.SetFilter(_sNewFilter) <> 1 then
			Event OnError(RetCode.E_INVALID_ARGUMENT,"SetFilter: " + _sNewFilter)
			return RetCode.E_INVALID_ARGUMENT
		end if
	end if
	
	//保存当前的SQL用于还原
	sSQLOriginal = data.GetSQLSelect()
	
	//替换SQL
	//支持指定DataObject时修改其运行时SQL
	if _sSQL <> "" and Not bPlainSQL then
		if sSQLOriginal <> _sSQL then
			sError = data.Modify('DataWindow.Table.Select = "' + _sSQL +'"')
			if sError <> "" then
				Event OnError(RetCode.E_INTERNAL_ERROR,"Modify [DataWindow.Table.Select]: " + sError)
				return RetCode.E_INTERNAL_ERROR
			end if
			sSQLOriginal = _sSQL
		end if
	end if
	
	//使用缓存对象时优化减少DDDW重复查询
	if bCacheDS then
		map = Create n_map
		nColCnt = Long(data.Describe("DataWindow.Column.Count"))
		for nColIdx = 1 to nColCnt
			sProp = data.Describe("#" + String(nColIdx) + ".DDDW.AutoRetrieve")
			if sProp <> "yes" then continue
			sProp = data.Describe("#" + String(nColIdx) + ".DDDW.Name")
			if map.Exists(sProp) then
				sModString += "#" + String(nColIdx) + ".DDDW.AutoRetrieve = no ~n"
			else
				if Event OnNotify(tasking.NCD_CHILDQUERY,nColIdx,data.Describe("#" + String(nColIdx) + ".Name")) = 1 then
					sModString += "#" + String(nColIdx) + ".DDDW.AutoRetrieve = no ~n"
				else
					map.Add(sProp,true)
				end if
			end if
		next
		Destroy map
		if sModString <> "" then
			sError = data.Modify(sModString)
			if sError <> "" then
				Event OnError(RetCode.E_INVALID_SQL,sError)
				return RetCode.E_INVALID_SQL
			end if
		end if
	end if
	
	//FIXME
	//解决交叉表字段过多时可能出现SetFullState崩溃问题
	if data.Describe("DataWindow.NoUserPrompt") <> "yes" then
		data.Modify("DataWindow.NoUserPrompt=yes")
	end if

	if data.SetTransObject(TransObject) <> 1 then
		Event OnError(RetCode.E_INVALID_TRANSACTION,"设置事务对象失败!")
		return RetCode.E_INVALID_TRANSACTION
	end if
	
	//修改SQL语句
	if UpperBound(_whereClauses) > 0 or UpperBound(_orderByClauses) > 0 then
		if Not sqlParser.Parse(sSQLOriginal) then
			Event OnError(RetCode.E_INTERNAL_ERROR,"SQL解析失败!")
			return RetCode.E_INTERNAL_ERROR
		end if
		nCount = UpperBound(_whereClauses)
		for nIndex = 1 to nCount
			if Not sqlParser.ModifyWhere(_whereClauses[nIndex].index,_whereClauses[nIndex].ms,_whereClauses[nIndex].clause) then
				Event OnError(RetCode.E_INTERNAL_ERROR,"修改SQL[WHERE]语句失败!")
				return RetCode.E_INTERNAL_ERROR
			end if
		next
		nCount = UpperBound(_orderByClauses)
		for nIndex = 1 to nCount
			if Not sqlParser.ModifyOrder(_orderByClauses[nIndex].index,_orderByClauses[nIndex].ms,_orderByClauses[nIndex].clause) then
				Event OnError(RetCode.E_INTERNAL_ERROR,"修改SQL[ORDER BY]语句失败!")
				return RetCode.E_INTERNAL_ERROR
			end if
		next
		sSQLExec = sqlParser.GetSQL()
		//修改SQL
//		if data.Describe("DataWindow.Crosstab.StaticMode") = "no" then
//			data.Modify("DataWindow.Crosstab.StaticMode = yes")
//			bSwitchStaticMode = true
//		end if
		sError = data.Modify('DataWindow.Table.Select = "' + ReplaceAll(sSQLExec,"~"","~~~"",true) +'"')
		if sError <> "" then
			Event OnError(RetCode.E_INTERNAL_ERROR,"Modify [DataWindow.Table.Select]: " + sError)
			return RetCode.E_INTERNAL_ERROR
		end if
//		if bSwitchStaticMode then
//			data.Modify("DataWindow.Crosstab.StaticMode = no")
//		end if
		bRestoreSQL = true
	else
		sSQLExec = sSQLOriginal
	end if
	
	//分页查询
	if _bPaged then
		rtCode = _of_BuildPagedSQL(TransObject,sSQLExec,ref sSQL)
		if rtCode <> RetCode.OK then return rtCode
		//修改SQL
//		bSwitchStaticMode = false
//		if data.Describe("DataWindow.Crosstab.StaticMode") = "no" then
//			data.Modify("DataWindow.Crosstab.StaticMode = yes")
//			bSwitchStaticMode = true
//		end if
		sError = data.Modify('DataWindow.Table.Select = "' + ReplaceAll(sSQL,"~"","~~~"",true) +'"')
		if sError <> "" then
			Event OnError(RetCode.E_INTERNAL_ERROR,"Modify [DataWindow.Table.Select]: " + sError)
			return RetCode.E_INTERNAL_ERROR
		end if
//		if bSwitchStaticMode then
//			data.Modify("DataWindow.Crosstab.StaticMode = no")
//		end if
		bRestoreSQL = true
	end if
	
	data.of_ClearState()
	data.of_SetMaxRows(_nMaxRows)
	
	if IsPrevented(TransObject.Event OnBeforeRetrieve(data)) then
		if TransObject.of_IsFailed() then
			Event OnDBError(TransObject.SQLDBCode,TransObject.SQLErrText,"",Primary!,0)
			Event OnError(RetCode.E_DB_ERROR,"")
			return RetCode.E_DB_ERROR
		end if
		return RetCode.CANCELLED
	end if
	
	if IsValid(hook) then
		nRowCnt = hook.Event OnRetrieve(this,TransObject,Data)
	else
		SetNull(nRowCnt)
	end if
	
	if IsNull(nRowCnt) or nRowCnt = RetCode.E_NO_IMPLEMENTATION then
		if bPlainSQL then
			nRowCnt = data.Retrieve()
		else
			nRowCnt = _of_RetrieveWithParams(Data)
		end if
	end if
	
	TransObject.Event OnAfterRetrieve(data,nRowCnt)
	
	if TransObject.SQLCode = -1 and nRowCnt >= 0 then
		nRowCnt = -1
		data.Reset()
	end if
	
	if nRowCnt < 0 then
		Event OnError(RetCode.E_DB_ERROR,"")
		return RetCode.E_DB_ERROR
	end if
	
	if of_IsCancelled() then return RetCode.CANCELLED
	
	if data.of_IsRowsExceeded() then
		Event OnError(RetCode.E_OUT_OF_RANGE,"超出最大允许的行数(" + String(_nMaxRows) + ")!")
		return RetCode.E_OUT_OF_RANGE
	end if
	
	//还原SQL
	//*需要在OnDataReceived之前还原
	if sSQLOriginal <> "" and bRestoreSQL then
		if Pos(sSQLOriginal,"~"") > 0 then sSQLOriginal = ReplaceAll(sSQLOriginal,"~"","~~~"",true)
//		bSwitchStaticMode = false
//		if data.Describe("DataWindow.Crosstab.StaticMode") = "no" then
//			data.Modify("DataWindow.Crosstab.StaticMode = yes")
//			bSwitchStaticMode = true
//		end if
		data.Modify('DataWindow.Table.Select = "' + sSQLOriginal +'"')
//		if bSwitchStaticMode then
//			data.Modify("DataWindow.Crosstab.StaticMode = no")
//		end if
	end if
	
	if _bPaged and _bPageCounting then
		//保存当前的SQL参数
		sDwArgs = data.Describe("DataWindow.Table.Arguments")
	end if
	
	//*OnDataReceived执行后Data可能将变得无效！
	rtCode = Event OnDataReceived(ref data,nRowCnt)
	if rtCode <> RetCode.OK then return rtCode
	
	//统计页数
	if _bPaged and _bPageCounting then
		//当前页不足分页大小时不进行统计
		if (nRowCnt > 0 and nRowCnt < _nPageSize) or (nRowCnt = 0 and _nPageIndex = 1) then
			nPageCount = _nPageIndex
			nRecordCount = (_nPageIndex - 1) * _nPageSize + nRowCnt
			if nRecordCount = 0 then nPageCount = 0
		else
			//获取总页数
			if Not sqlParser.Parse(sSQLExec) then
				Event OnError(RetCode.E_INTERNAL_ERROR,"SQL解析失败!")
				return RetCode.E_INTERNAL_ERROR
			end if
			sqlParser.ModifyColumn(Enums.SQL_MS_REPLACE, "1 AS _") //去掉字段
			if sqlParser.HasOrder() then
				sqlParser.ModifyOrder(Enums.SQL_MS_REPLACE,"") //去掉ORDER BY语句
			end if
			sSQL = "SELECT COUNT(1) AS CNT FROM (" + sqlParser.GetSQL() + ") pfwPagedSQL_Tbl"
			//绑定参数
			if of_HasParams() and Not bPlainSQL then
				if IsFailed(_of_SQLBindParams(ref sSQL,TransObject.of_GetDBType(),sDwArgs)) then
					Event OnError(RetCode.E_SQL_BIND_ARG_FAILED,"SQL参数绑定失败!")
					return RetCode.E_SQL_BIND_ARG_FAILED
				end if
			end if
			
			rtCode = TransObject.of_Query(sSQL,ref dsTmp,sError)
			if IsFailed(rtCode) then
				if rtCode <> RetCode.CANCELLED then
					Event OnError(rtCode,sError)
				end if
				return rtCode
			end if
			
			if rtCode = 1 then
				nRecordCount = dsTmp.GetItemNumber(1,1)
				nPageCount = Ceiling(nRecordCount / _nPageSize)
			else
				Event OnDBError(TransObject.SQLDBCode,TransObject.SQLErrText,sSQL,Primary!,1)
				Event OnError(RetCode.E_DB_ERROR,"")
				return RetCode.E_DB_ERROR
			end if
		end if
	else
		nPageCount = -1
		nRecordCount = -1
	end if
	
	tasking.Event OnPageReceived(nPageCount,nRecordCount)

	if of_IsCancelled() then return RetCode.CANCELLED
	
	return RetCode.OK
catch(Throwable ex)
	throw ex
finally
	if IsValid(hook) then Destroy hook
	if IsValid(sqlParser) then Destroy sqlParser
	if IsValid(dsTmp) then Destroy dsTmp
	if bCacheDS then
		data.Reset()
	else
		if IsValid(data) then Destroy data
	end if
end try
end event

