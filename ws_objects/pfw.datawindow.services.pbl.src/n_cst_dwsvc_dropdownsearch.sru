$PBExportHeader$n_cst_dwsvc_dropdownsearch.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_dwsvc_dropdownsearch from n_cst_dwsvc
end type
type editcontextdata from structure within n_cst_dwsvc_dropdownsearch
end type
type dddwdata from structure within n_cst_dwsvc_dropdownsearch
end type
end forward

type editcontextdata from structure
	boolean		valid
	long		row
	dwobject		dwo
	string		name
	string		style
	dddwdata		dddw
	string		lastdata
end type

type dddwdata from structure
	string		dispcolname
	string		datacolname
	string		orgfilter
	string		filter
	string		inputfilter
	datawindowchild		object
	long		rowheight
	unsignedlong		hwnd
end type

global type n_cst_dwsvc_dropdownsearch from n_cst_dwsvc
event onitemfocuschanged ( long row,  dwobject dwo )
event oneditchanged ( long row,  dwobject dwo,  string data )
event ongetfocus ( )
event onlosefocus ( )
end type
global n_cst_dwsvc_dropdownsearch n_cst_dwsvc_dropdownsearch

type prototypes
private:
function boolean IsWindowVisible(ulong hwnd) library "user32.dll"
end prototypes

type variables
/*--- Constants ---*/
public:
//DDDW过滤的类型（支持组合）
constant ulong FILTER_DISP		= 1	//Display列
constant ulong FILTER_DISP_PY	= 2	//Display列以输入数据的拼音首字母过滤
constant ulong FILTER_DATA		= 4	//Data列
constant ulong FILTER_ALL		= FILTER_DISP + FILTER_DISP_PY + FILTER_DATA

/*--- Properites ---*/
public:
privatewrite ulong 	#FilterType			= FILTER_DISP + FILTER_DISP_PY	//DDDW过滤的类型
privatewrite boolean #ShowFilteredRows 											//显示DDDW被过滤的行
																								//*移动过滤的行到Primary缓冲区,解决过滤会影响其它行显示的文本的情况,为NULL时自动判断（默认）

private:
EDITCONTEXTDATA _editCtx
end variables

forward prototypes
private subroutine _of_initeditcontextinfo (readonly long row, readonly dwobject dwo)
private subroutine _of_initctxdddwfilter (readonly long row, readonly dwobject dwo)
private subroutine _of_showdddw ()
private function boolean _of_isshowfilteredrows ()
public function long of_setshowfilteredrows (readonly boolean show)
public function long of_setfiltertype (readonly unsignedlong ntype)
public function long of_updatedddwfilter (readonly string colname)
private function string _of_getfilter (readonly string data)
public function boolean of_hasfilter ()
private subroutine _of_filter (readonly long row, readonly dwobject dwo, readonly string filter, readonly boolean show)
public function long of_updatedddwfilter (readonly string colname, string filter, readonly boolean dofilter)
public function long of_updatedddwfilter (readonly string colname, readonly string filter)
private function long _of_adjustdddwheight (readonly string name)
end prototypes

event onitemfocuschanged(long row, dwobject dwo);_of_InitEditContextInfo(row,dwo)
end event

event oneditchanged(long row, dwobject dwo, string data);long nIndex,nLenData,nRow,nRowCnt
string sVal,sValDisp
boolean bMatched

if Not _editCtx.valid then return

if IsNull(data) then data = ""

nLenData = Len(data)

if _editCtx.Style = "dddw" then
	_of_Filter(row,dwo,_of_GetFilter(data),true)
end if

if nLenData <= Len(_editCtx.lastData) then
	_editCtx.lastData = data
	return
end if
_editCtx.lastData = data

choose case _editCtx.Style
	case "dddw"
		nRowCnt = _editCtx.dddw.object.RowCount()
		if nRowCnt > 0 then
			for nRow = 1 to nRowCnt
				sValDisp = _editCtx.dddw.object.GetItemString(nRow,_editCtx.dddw.dispColName)
				bMatched = (Lower(Left(sValDisp,nLenData)) = Lower(data))
				if bMatched then exit
			next
		end if
	case "ddlb"
		do
			nIndex ++
			sVal = #DataWindow.GetValue(_editCtx.Name,nIndex)
			if sVal = "" then exit
			//忽略大小写
			bMatched = (Lower(Left(sVal,nLenData)) = Lower(data))
		loop until(bMatched)
		if bMatched then
			sValDisp = Left(sVal,Pos(sVal,"~t") - 1)
		end if
end choose

if bMatched then
	#DataWindow.SetText(sValDisp)
	#DataWindow.SelectText(nLenData + 1,Len(sValDisp))
end if
end event

event ongetfocus();long nRow
string sColName

nRow = #DataWindow.GetRow()
if nRow = 0 then return
sColName = #DataWindow.GetColumnName()
if sColName = "" then return

//强制刷新编辑上下文
_of_InitEditContextInfo(nRow,_of_GetDWObject(sColName))
end event

event onlosefocus();dwobject dwoNvl

//强制刷新编辑上下文
_of_InitEditContextInfo(0,dwoNvl)
end event

private subroutine _of_initeditcontextinfo (readonly long row, readonly dwobject dwo);string sProp
datawindowchild dwcEmtpy

if row <= 0 or Not IsValidObject(dwo) then
	if _editCtx.valid then
		//*重新获取DataWindowChild（可能会失效）
		#DataWindow.GetChild(_editCtx.name,ref _editCtx.dddw.object)
		_of_Filter(_editCtx.row,_editCtx.dwo,"",false)
	end if
	_editCtx.valid = false
	_editCtx.lastData = ""
	_editCtx.row = row
	_editCtx.dwo = dwo
	return
end if
//if _editCtx.row = row and _editCtx.name = dwo.name then return

if _editCtx.valid then
	//*重新获取DataWindowChild（可能会失效）
	#DataWindow.GetChild(_editCtx.name,ref _editCtx.dddw.object)
	_editCtx.dddw.hWnd = Handle(_editCtx.dddw.object)
	//如果只是行改变则只初始化一下DDDW过滤条件即可
	if _editCtx.name = dwo.name and _editCtx.row <> row and _editCtx.style = "dddw" then
		_editCtx.row = row
		_editCtx.lastData = ""
		_of_InitCtxDDDWFilter(row,dwo)
		return
	end if
	//还原DDDW的原始过滤条件
	_of_Filter(_editCtx.row,_editCtx.dwo,"",false)
end if

_editCtx.valid = false
_editCtx.lastData = ""
_editCtx.row = row
_editCtx.dwo = dwo
_editCtx.name = dwo.name
_editCtx.style = ""
_editCtx.dddw.object = dwcEmtpy
_editCtx.dddw.dataColName = ""
_editCtx.dddw.dispColName = ""
_editCtx.dddw.orgFilter = ""
_editCtx.dddw.filter = ""
_editCtx.dddw.inputFilter = ""
_editCtx.dddw.hWnd = 0
_editCtx.dddw.rowHeight = 0

sProp = #DataWindow.Describe(_editCtx.name + ".Edit.DisplayOnly")
if sProp = "yes" then return
_editCtx.style = #DataWindow.Describe(_editCtx.name + ".Edit.Style")
if _editCtx.style = "!" then return

choose case _editCtx.style
	case "dddw"
		sProp = #DataWindow.Describe(_editCtx.name + ".DDDW.AllowEdit")
		if Lower(sProp) = "no" then return
		_editCtx.dddw.dispColName = #DataWindow.Describe(_editCtx.name + ".DDDW.DisplayColumn")
		if _editCtx.dddw.dispColName = "!" then return
		_editCtx.dddw.dataColName = #DataWindow.Describe(_editCtx.name + ".DDDW.DataColumn")
		if _editCtx.dddw.dataColName = "!" then return
		if #DataWindow.GetChild(_editCtx.name,ref _editCtx.dddw.object) <> 1 then return
		sProp = _editCtx.dddw.object.Describe(_editCtx.dddw.dispColName + ".ColType")
		if Left(sProp,4) <> "char" then return
		_editCtx.dddw.hWnd = Handle(_editCtx.dddw.object)
		_editCtx.dddw.rowHeight = Long(_editCtx.dddw.object.Describe("DataWindow.Detail.Height"))
		_editCtx.dddw.orgFilter = _editCtx.dddw.object.Describe("DataWindow.Table.Filter")
		if _editCtx.dddw.orgFilter = "?" then _editCtx.dddw.orgFilter = ""
		_editCtx.dddw.filter = _editCtx.dddw.orgFilter
		if _editCtx.dddw.object.Describe("DataWindow.Table.Sort") = "?" then
			_editCtx.dddw.object.SetSort(_editCtx.dddw.dispColName + " ASC")
		end if
		_editCtx.valid = true
		_of_InitCtxDDDWFilter(row,dwo)
	case "ddlb"
		sProp = #DataWindow.Describe(_editCtx.name + ".Edit.AllowEdit")
		if Lower(sProp) = "no" then return
		_editCtx.valid = true
end choose
end subroutine

private subroutine _of_initctxdddwfilter (readonly long row, readonly dwobject dwo);string sVal,sFilter

if Not _editCtx.valid then return
if _editCtx.Style <> "dddw" then return

//始终还原为初始的过滤条件
//2017-09-01
/*
sVal = _of_LookupDisplay(row,_editCtx.Name)
if sVal <> "" and #DataWindow.GetItemStatus(row,_editCtx.Name,Primary!) = DataModified! then
	//如果当前有值并且这个值在下拉列表中没有完全匹配的项,则使用该值做为模糊过滤的初始条件
	if _editCtx.dddw.object.Find(_editCtx.dddw.dispColName + " = '" + sVal + "'",1,_editCtx.dddw.object.RowCount()) = 0 then
		sFilter = _of_GetFilter(sVal)
	end if
end if
*/
sFilter = _of_GetFilter("")
_of_Filter(row,dwo,sFilter,false)
end subroutine

private subroutine _of_showdddw ();if _editCtx.dddw.hWnd = 0 then return

_of_AdjustDDDWHeight(_editCtx.name)
	
if Not IsWindowVisible(_editCtx.dddw.hWnd) then
	Win32.ShowWindow(_editCtx.dddw.hWnd,8) //SW_SHOWNA
end if
end subroutine

private function boolean _of_isshowfilteredrows ();if Not IsNull(#ShowFilteredRows) then return #ShowFilteredRows
if _editCtx.dddw.dispColName = _editCtx.dddw.dataColName then return false
if _of_GetStyle() = STYLE_GRID then return true
return (#DataWindow.RowCount() > 1 and #DataWindow.VScrollBar)
end function

public function long of_setshowfilteredrows (readonly boolean show);//====================================================================
// Function: of_setshowfilteredrows()
//--------------------------------------------------------------------
// Description: 显示DDDW被过滤的行
//--------------------------------------------------------------------
// Arguments:
// 	readonly	boolean	show	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-09-04
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
#ShowFilteredRows = show
return RetCode.OK
end function

public function long of_setfiltertype (readonly unsignedlong ntype);//====================================================================
// Function: of_setfiltertype()
//--------------------------------------------------------------------
// Description: 设置
//--------------------------------------------------------------------
// Arguments:
// 	readonly	ulong	ntype	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-09-04
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
#FilterType = nType
return RetCode.OK
end function

public function long of_updatedddwfilter (readonly string colname);string nvl
SetNull(nvl)
return of_UpdateDDDWFilter(colName,nvl,true)
end function

private function string _of_getfilter (readonly string data);string sData,sDataLike,sFilter,sProp

if data <> "" then
	sData = Lower(data)
	sDataLike = ReplaceAll(Trim(sData)," ","%",true)
	if BitTest(#FilterType,FILTER_DISP) then
		sFilter = "(Lower(" + _editCtx.dddw.dispColName + ") LIKE '%" + sDataLike + "%')"
	end if
	if BitTest(#FilterType,FILTER_DISP_PY) then
		if Match(data,"[a-zA-Z]") then
			sFilter += " OR PinyinFirstLetterLike(" + _editCtx.dddw.dispColName + ",'" + sData + "',7)"
		end if
	end if
	if BitTest(#FilterType,FILTER_DATA) then
		if _editCtx.dddw.dataColName <> _editCtx.dddw.dispColName then
			sProp = _editCtx.dddw.object.Describe(_editCtx.dddw.dataColName + ".ColType")
			choose case Left(sProp,4)
				case "char"
					sFilter += " OR (Lower(" + _editCtx.dddw.dataColName + ") LIKE '%" + sDataLike + "%')"
				case "numb","deci","long","ulon"
					if IsNumber(data) then
						sFilter += " OR (" + _editCtx.dddw.dataColName + " = " + data + ")"
					end if
			end choose
		end if
	end if
end if
if sFilter <> "" then sFilter = "(" + sFilter + ")"

#DataWindow.Event OnDDSGetFilter(_editCtx.row,_editCtx.dwo,data,ref sFilter)

return sFilter
end function

public function boolean of_hasfilter ();//====================================================================
// Function: of_hasfilter()
//--------------------------------------------------------------------
// Description: 当前是否有录入过滤条件
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-02-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if Not _editCtx.valid then return false
if _editCtx.style <> "dddw" then return false
return _editCtx.dddw.inputFilter <> ""
end function

private subroutine _of_filter (readonly long row, readonly dwobject dwo, readonly string filter, readonly boolean show);long nRowCnt,nFilteredCnt
string sFilter,sCurrentFilter
boolean bRedraw

sFilter = filter

if filter <> "" then
	if _editCtx.dddw.orgFilter <> "" then
		sFilter = "(" + _editCtx.dddw.orgFilter + ") AND (" + filter + ")"
	end if
else
	sFilter = _editCtx.dddw.orgFilter
end if

if sFilter <> _editCtx.dddw.filter then
	_editCtx.dddw.filter = sFilter
	_editCtx.dddw.inputFilter = filter //保存当前录入的过滤条件
	if IsWindowVisible(_editCtx.dddw.hWnd) then
		bRedraw = true
		_editCtx.dddw.object.SetRedraw(false)
	end if
	_editCtx.dddw.object.SetFilter(sFilter)
	_editCtx.dddw.object.Filter()
	_editCtx.dddw.object.Sort()
	//*保证行数是被移动缓冲区之前的值
	nRowCnt = _editCtx.dddw.object.RowCount()
	nFilteredCnt = _editCtx.dddw.object.FilteredCount()
	//处理过滤数据的显示状态
	if _of_IsShowFilteredRows() then
		//显示没被过滤的行
		if nRowCnt > 0 then
			_editCtx.dddw.object.SetDetailHeight(1,nRowCnt,_editCtx.dddw.rowHeight)
		end if
		//将被过滤的数据放在末尾(否则会影响其它行显示的文本)
		if _editCtx.dddw.object.RowsMove(1,_editCtx.dddw.object.FilteredCount(),Filter!,_editCtx.dddw.object,nRowCnt + 1,Primary!) = 1 then
			//隐藏被过滤的行
			_editCtx.dddw.object.SetDetailHeight(nRowCnt + 1,_editCtx.dddw.object.RowCount(),0)
		end if
	end if
	//*保证行数是被移动缓冲区之前的值
	#DataWindow.Event OnDDSFiltered(row,dwo,nRowCnt,nFilteredCnt)
	if bRedraw then
		_editCtx.dddw.object.SetRedraw(true)
	end if
	//显示DDDW
	if show then
		_of_ShowDDDW()
	end if
end if
end subroutine

public function long of_updatedddwfilter (readonly string colname, string filter, readonly boolean dofilter);//====================================================================
// Function: of_updatedddwfilter()
//--------------------------------------------------------------------
// Description: 更新指定列DDDW的过滤条件(如果是当前编辑的列)
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	colname	
// 	value		string	filter	
//		readonly boolean 	dofilter 重新过滤数据（默认为true）
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-06-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if GetFocus() <> #DataWindow then return RetCode.OK
if Not _editCtx.valid then return RetCode.OK
if _editCtx.name <> Lower(colName) then return RetCode.OK
if _editCtx.Style <> "dddw" then return RetCode.FAILED

if IsNull(filter) then
	filter = _editCtx.dddw.object.Describe("DataWindow.Table.Filter")
	if filter = "?" then filter = ""
end if
if _editCtx.dddw.orgFilter <> filter then
	_editCtx.dddw.orgFilter = filter
	//重新过滤数据
	if doFilter then
		_of_Filter(_editCtx.row,_editCtx.dwo,_editCtx.dddw.inputFilter,false)
	end if
end if

return RetCode.OK
end function

public function long of_updatedddwfilter (readonly string colname, readonly string filter);return of_UpdateDDDWFilter(colName,filter,true)
end function

private function long _of_adjustdddwheight (readonly string name);ulong hWnd
long nWndHeight,nLines,nShowRows,nFlags
datawindowchild dwc
RECT wndRect

if name = "" then return RetCode.E_INVALID_ARGUMENT
if #DataWindow.GetChild(name,ref dwc) = -1 then return RetCode.FAILED

hWnd = Handle(dwc)
if hWnd = 0 then return RetCode.FAILED

nLines = Long(#DataWindow.Describe(name + ".DDDW.Lines"))

Win32.GetWindowRect(hWnd,ref wndRect)
Win32.OffsetRect(ref wndRect,-wndRect.left,-wndRect.top)

nShowRows = dwc.RowCount()
if nShowRows > nLines then nShowRows = nLines
if nShowRows <= 0 then nShowRows = 1
nWndHeight = UnitsToPixels(Long(dwc.Describe("DataWindow.Header.Height")) + &
									Long(dwc.Describe("DataWindow.Summary.Height")) + &
									Long(dwc.Describe("DataWindow.Footer.Height")) + &
									nShowRows * Long(dwc.Describe("DataWindow.Detail.Height")),&
									YUnitsToPixels!) + 4
if nWndHeight < 50 then nWndHeight = 50

if wndRect.bottom < nWndHeight then
	nFlags = Win32.SWP_NOZORDER + Win32.SWP_NOMOVE + Win32.SWP_NOACTIVATE
	Win32.SetWindowPos(hWnd,0,0,0,wndRect.right,nWndHeight,nFlags)
end if

return RetCode.OK
end function

on n_cst_dwsvc_dropdownsearch.create
call super::create
end on

on n_cst_dwsvc_dropdownsearch.destroy
call super::destroy
end on

event constructor;call super::constructor;SetNull(#ShowFilteredRows)
end event

event onenable;call super::onenable;if enabled then
	//#DataWindow.of_On(#DataWindow.EVT_EDITCHANGED,this,"onEditChanged")
	#DataWindow.of_On(#DataWindow.EVT_ITEMFOCUSCHANGED,this,"onItemFocusChanged")
	#DataWindow.of_On(#DataWindow.EVT_GETFOCUS,this,"onGetFocus")
	#DataWindow.of_On(#DataWindow.EVT_LOSEFOCUS,this,"onLoseFocus")
else
	#DataWindow.of_Off(this)
end if
return 0
end event

