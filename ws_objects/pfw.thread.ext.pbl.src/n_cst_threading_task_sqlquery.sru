$PBExportHeader$n_cst_threading_task_sqlquery.sru
$PBExportComments$PowerThread线程SQL查询任务控制对象~r~n[运行在当前线程]~r~nBy gaoqiangz@msn.com
forward
global type n_cst_threading_task_sqlquery from n_cst_threading_task_sqlbase
end type
end forward

global type n_cst_threading_task_sqlquery from n_cst_threading_task_sqlbase
string #type = "sqlquery"
event type long onchilddatareceived ( string name,  ref blob blbdata )
event oncreatedata ( readonly string syntax )
event ondatareceived ( long rowcount )
event type long ondatachunk ( ref blob blbdata,  long count,  long current,  boolean fullstate )
event onpagereceived ( long pagecount,  long recordcount )
event ondatamove ( datastore ds )
end type
global n_cst_threading_task_sqlquery n_cst_threading_task_sqlquery

type variables
/*--- Constants ---*/
public:
//Type
constant string TASK_TYPE = "sqlquery"

/*--- Constants ---*/
Public:
//Notify codes (wparam)
Constant Long NCD_MAXROWS			= 1
Constant Long NCD_DATARECEIVED	= 2 //lparam:row count
Constant Long NCD_PAGERECEIVED	= 3 //lparam:(low word:page count,high word:record count)
Constant Long NCD_DATACHUNK		= 4 //lparam:(low word:count,high word:current)
Constant Long NCD_CHILDRECEIVED	= 5 //sparam:colname
Constant Long NCD_CHILDQUERY		= 6 //lparam:colid,sparam:colname

/*--- Properties ---*/
Public:
PrivateWrite Boolean	#Paged
PrivateWrite Long		#PageSize
PrivateWrite Long		#PageIndex
PrivateWrite Boolean	#PageCounting = true

PrivateWrite DataStore Data

/*--- Implementation ---*/
Private:
Long _nRowCount

//#Paged开启后有效
Long _nPageCount
Long _nRecordCount

PowerObject _receiver
Boolean _bRcvrRedraw
end variables

forward prototypes
public function long of_setsql (readonly string sql)
public function long of_reset ()
public function long of_setsqlsyntax (readonly string sqlsyntax)
public function long of_setdataobject (readonly string dataobject)
public function long of_setparam (readonly any param)
private function n_cst_thread_task_sqlquery _of_gettask ()
public function long of_setparams (readonly any param1, readonly any param2)
public function long of_setparams (readonly any param1, readonly any param2, readonly any param3)
public function long of_setparams (readonly any param1, readonly any param2, readonly any param3, readonly any param4)
public function long of_setparams (readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5)
public function long of_setpaged (readonly boolean paged)
public function long of_setpagesize (readonly long pagesize)
public function long of_setpageindex (readonly long pageindex)
public function long of_getpagecount ()
public function long of_getrecordcount ()
public function long of_setparams (readonly any params[])
public function long of_setorderbyclause (readonly long ms, readonly string clause)
public function long of_setwhereclause (readonly long ms, readonly string clause)
public function long of_setorderbyclause (readonly integer selectindex, readonly long ms, readonly string clause)
public function long of_setwhereclause (readonly integer selectindex, readonly long ms, readonly string clause)
public function long of_setmaxrows (readonly long rows)
public function long of_getrowcount ()
public function long of_setchunksize (readonly long chunksize)
public function long of_setpagecounting (readonly boolean counting)
public function datastore of_movedata ()
public function long of_setpagenative (readonly boolean use_native)
public function long of_setreceiver (readonly powerobject object)
public function boolean _of_needcreate ()
public function boolean _of_hasreceiver ()
public function long of_setpageduniqueindexcolumns (string columns[])
public function long of_sethookclass (readonly string hookcls)
public function long of_setcache (readonly boolean cache)
public function long of_setfilter (readonly string filter)
public function long of_setsort (readonly string sort)
end prototypes

event type long onchilddatareceived(string name, ref blob blbdata);long rtCode
datawindowchild dwc

if of_IsCancelled() then return 0

if IsValid(_receiver) then
	if _receiver.TypeOf() = DataWindow! then
		datawindow dw
		dw = _receiver
		if dw.GetChild(name, ref dwc) = 1 then
			dwc.Reset()
			if Len(blbData) > 0 then
				rtCode = dwc.SetChanges(blbData)
			else
				rtCode = 1
			end if
		else
			rtCode = -1
		end if
	else
		datastore ds
		ds = _receiver
		if ds.GetChild(name, ref dwc) = 1 then
			dwc.Reset()
			if Len(blbData) > 0 then
				rtCode = dwc.SetChanges(blbData)
			else
				rtCode = 1
			end if
		else
			rtCode = -1
		end if
	end if
else
	if Data.GetChild(name, ref dwc) = 1 then
		dwc.Reset()
		if Len(blbData) > 0 then
			rtCode = dwc.SetChanges(blbData)
		else
			rtCode = 1
		end if
	else
		rtCode = -1
	end if
end if

blbData = Blob("")

if rtCode > 1 then rtCode = -1

if rtCode = 1 then
	dwc.ResetUpdate()
	if Len(dwc.Describe("DataWindow.Table.Filter")) > 1 then
		dwc.Filter()
	end if
	if Len(dwc.Describe("DataWindow.Table.Sort")) > 1 then
		dwc.Sort()
	end if
	Event OnNotify(NCD_CHILDRECEIVED,0,name)
end if

return rtCode
end event

event oncreatedata(readonly string syntax);if of_IsCancelled() then return

if IsValid(_receiver) then
	if _receiver.TypeOf() = DataWindow! then
		datawindow dw
		dw = _receiver
		dw.Create(syntax)
	else
		datastore ds
		ds = _receiver
		ds.Create(syntax)
	end if
else
	Data.Create(syntax)
end if
end event

event ondatareceived(long rowcount);if of_IsCancelled() then return

_nRowCount = rowCount
Event OnNotify(NCD_DATARECEIVED,_nRowCount,"")

if IsValid(_receiver) then
	if _receiver.TypeOf() = DataWindow! then
		datawindow dw
		dw = _receiver
		if dw.RowCount() > 0 then
			_bRcvrRedraw = true
			dw.SetRedraw(false)
			dw.Reset()
		end if
	else
		datastore ds
		ds = _receiver
		ds.Reset()
	end if
end if
end event

event type long ondatachunk(ref blob blbdata, long count, long current, boolean fullstate);long rtCode

if of_IsCancelled() then return 0

if IsValid(_receiver) then
	if _receiver.TypeOf() = DataWindow! then
		datawindow dw
		dw = _receiver
		if Len(blbData) > 0 then
			if fullState then
				rtCode = dw.SetFullState(blbData)
			else
				if Not _bRcvrRedraw then
					_bRcvrRedraw = true
					dw.SetRedraw(false)
				end if
				rtCode = dw.SetChanges(blbData)
				if count = current then
					dw.ResetUpdate()
					if _bRcvrRedraw then
						_bRcvrRedraw = false
						dw.SetRedraw(true)
					end if
				end if
			end if
		else
			rtCode = 1
			dw.Reset()
		end if
	else
		datastore ds
		ds = _receiver
		if Len(blbData) > 0 then
			if fullState then
				rtCode = ds.SetFullState(blbData)
			else
				rtCode = ds.SetChanges(blbData)
				if count = current then
					ds.ResetUpdate()
				end if
			end if
		else
			rtCode = 1
			ds.Reset()
		end if
	end if
else
	if fullState then
		rtCode = Data.SetFullState(blbData)
	else
		rtCode = Data.SetChanges(blbData)
		if count = current then
			Data.ResetUpdate()
		end if
	end if
end if

blbData = Blob("")

if fullState then
	if rtCode > 1 then rtCode = 1
else
	if rtCode > 1 then rtCode = -1
end if

if rtCode = 1 then
	Event OnNotify(NCD_DATACHUNK,MakeLong(count,current),"")
end if

return rtCode
end event

event onpagereceived(long pagecount, long recordcount);if of_IsCancelled() then return

_nPageCount = pageCount
_nRecordCount = recordCount

Event OnNotify(NCD_PAGERECEIVED,MakeLong(_nPageCount,_nRecordCount),"")
end event

event ondatamove(datastore ds);Destroy Data
Data = ds
Event OnNotify(NCD_DATACHUNK,MakeLong(1,1),"")
end event

public function long of_setsql (readonly string sql);if of_IsBusy() then return RetCode.E_BUSY

#IF DEFINED DEBUG THEN
	Assert(Len(sql) > 0,"Len(sql) <= 0")
#END IF

return _of_GetTask().of_SetSQL(sql)
end function

public function long of_reset ();long rtCode

rtCode = super::of_Reset()
if IsFailed(rtCode) then return rtCode

#PageIndex = 0
#Paged = false
#PageSize = 0
#PageCounting = true

_nRowCount = 0
_nPageCount = 0
Data.Reset()
Data.DataObject = ""
SetNull(_receiver)

return RetCode.OK
end function

public function long of_setsqlsyntax (readonly string sqlsyntax);if of_IsBusy() then return RetCode.E_BUSY

#IF DEFINED DEBUG THEN
	Assert(Len(sqlSyntax) > 0,"Len(sqlSyntax) <= 0")
#END IF

return _of_GetTask().of_SetSQLSyntax(sqlSyntax)
end function

public function long of_setdataobject (readonly string dataobject);if of_IsBusy() then return RetCode.E_BUSY

#IF DEFINED DEBUG THEN
	Assert(Len(dataObject) > 0,"Len(dataObject) <= 0")
#END IF

return _of_GetTask().of_SetDataObject(dataObject)
end function

public function long of_setparam (readonly any param);return of_SetParams({param})
end function

private function n_cst_thread_task_sqlquery _of_gettask ();return _Task
end function

public function long of_setparams (readonly any param1, readonly any param2);return of_SetParams({param1,param2})
end function

public function long of_setparams (readonly any param1, readonly any param2, readonly any param3);return of_SetParams({param1,param2,param3})
end function

public function long of_setparams (readonly any param1, readonly any param2, readonly any param3, readonly any param4);return of_SetParams({param1,param2,param3,param4})
end function

public function long of_setparams (readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5);return of_SetParams({param1,param2,param3,param4,param5})
end function

public function long of_setpaged (readonly boolean paged);if of_IsBusy() then return RetCode.E_BUSY

#Paged = paged

return _of_GetTask().of_SetPaged(paged)
end function

public function long of_setpagesize (readonly long pagesize);if of_IsBusy() then return RetCode.E_BUSY

#PageSize = pageSize

return _of_GetTask().of_SetPageSize(pageSize)
end function

public function long of_setpageindex (readonly long pageindex);if of_IsBusy() then return RetCode.E_BUSY

#PageIndex = pageIndex

return _of_GetTask().of_SetPageIndex(pageIndex)
end function

public function long of_getpagecount ();return _nPageCount
end function

public function long of_getrecordcount ();return _nRecordCount
end function

public function long of_setparams (readonly any params[]);long rtCode
int index,nCount

if of_IsBusy() then return RetCode.E_BUSY

_of_GetTask().of_ResetParams()

nCount = UpperBound(params)
for index = 1 to nCount
	rtCode = of_AddParam("",params[index])
	if rtCode <> RetCode.OK then return rtCode
next

return RetCode.OK
end function

public function long of_setorderbyclause (readonly long ms, readonly string clause);return of_SetOrderByClause(1,ms,clause)
end function

public function long of_setwhereclause (readonly long ms, readonly string clause);return of_SetWhereClause(1,ms,clause)
end function

public function long of_setorderbyclause (readonly integer selectindex, readonly long ms, readonly string clause);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_SetOrderByClause(selectIndex,ms,clause)
end function

public function long of_setwhereclause (readonly integer selectindex, readonly long ms, readonly string clause);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_SetWhereClause(selectIndex,ms,clause)
end function

public function long of_setmaxrows (readonly long rows);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_SetMaxRows(rows)
end function

public function long of_getrowcount ();return _nRowCount
end function

public function long of_setchunksize (readonly long chunksize);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_SetChunkSize(chunkSize)
end function

public function long of_setpagecounting (readonly boolean counting);if of_IsBusy() then return RetCode.E_BUSY

#PageCounting = counting

return _of_GetTask().of_SetPageCounting(counting)
end function

public function datastore of_movedata ();datastore ds

ds = Data
Data = Create DataStore

return ds
end function

public function long of_setpagenative (readonly boolean use_native);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_SetPageNative(use_native)
end function

public function long of_setreceiver (readonly powerobject object);if of_IsBusy() then return RetCode.E_BUSY
if Not IsValidObject(object) then return RetCode.E_INVALID_OBJECT

choose case object.TypeOf()
	case DataWindow!,DataStore!
		_receiver = object
	case else
		return RetCode.E_INVALID_TYPE
end choose

return RetCode.OK
end function

public function boolean _of_needcreate ();if IsValid(_receiver) then
	if _receiver.TypeOf() = DataWindow! then
		datawindow dw
		dw = _receiver
		return dw.Describe("DataWindow.Type") <> "datawindow"
	else
		datastore ds
		ds = _receiver
		return ds.Describe("DataWindow.Type") <> "datawindow"
	end if
else
	return Data.Describe("DataWindow.Type") <> "datawindow"
end if
end function

public function boolean _of_hasreceiver ();return IsValid(_receiver)
end function

public function long of_setpageduniqueindexcolumns (string columns[]);int nIndex,nCount

if of_IsBusy() then return RetCode.E_BUSY

nCount = UpperBound(columns)
for nIndex = 1 to nCount
	if Pos(columns[nIndex],".") = 0 then return RetCode.E_INVALID_ARGUMENT
next

return _of_GetTask().of_SetPagedUniqueIndexColumns(columns)
end function

public function long of_sethookclass (readonly string hookcls);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_SetHookClass(hookCls)
end function

public function long of_setcache (readonly boolean cache);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_SetCache(cache)
end function

public function long of_setfilter (readonly string filter);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_SetFilter(filter)
end function

public function long of_setsort (readonly string sort);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_SetSort(sort)
end function

on n_cst_threading_task_sqlquery.create
call super::create
end on

on n_cst_threading_task_sqlquery.destroy
call super::destroy
end on

event ongettaskclsname;call super::ongettaskclsname;return "n_cst_thread_task_sqlquery"
end event

event onprepare;call super::onprepare;if AncestorReturnValue <> 0 then return AncestorReturnValue

Data.Reset()
Data.DataObject = ""
_nRecordCount = 0
_nPageCount = 0
_nRowCount = 0
_bRcvrRedraw = false

return 0 //continue
end event

event destructor;call super::destructor;Destroy Data
end event

event constructor;call super::constructor;Data = Create DataStore
end event

event onfinalize;call super::onfinalize;if _bRcvrRedraw then
	_bRcvrRedraw = false
	if IsValid(_receiver) then
		if _receiver.TypeOf() = DataWindow! then
			datawindow dw
			dw = _receiver
			dw.SetRedraw(true)
		end if
	end if
end if
end event

