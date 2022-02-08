$PBExportHeader$se_cst_dw.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type se_cst_dw from se_cst_datawindow
end type
type eventful from n_cst_eventful within se_cst_dw
end type
end forward

global type se_cst_dw from se_cst_datawindow
event type long oninitcontextmenu ( long row,  dwobject dwo )
event type long oncontextmenu ( long row,  dwobject dwo,  long mid )
event onddsgetfilter ( long row,  dwobject dwo,  string data,  ref string filter )
event type any oncolumnexpinvokemethod ( long row,  dwobject dwo,  string name,  string args[] )
event ondwnrbuttondown pbm_dwnrbuttondown
event ondwnrbuttonup pbm_dwnrbuttonup
event ondwnrowchange pbm_dwnrowchange
event ondwnrowchanging pbm_dwnrowchanging
event ondwnlbuttondblclk pbm_dwnlbuttondblclk
event ondwnlbuttonclk pbm_dwnlbuttonclk
event ondwnchanging pbm_dwnchanging
event ondwnitemchangefocus pbm_dwnitemchangefocus
event ondwnitemchange pbm_dwnitemchange
event type long ondoitemchange ( long row,  dwobject dwo,  string data )
event onitemchanged ( long row,  dwobject dwo )
event ondoitemchanged ( long row,  dwobject dwo )
event ondwnitemvalidationerror pbm_dwnitemvalidationerror
event onddsfiltered ( long row,  dwobject dwo,  long rowcount,  long filteredcount )
event ondwnkillfocus pbm_dwnkillfocus
event ondwnlbuttonup pbm_dwnlbuttonup
event ondwnsetfocus pbm_dwnsetfocus
eventful eventful
end type
global se_cst_dw se_cst_dw

type variables
/* 常量 */
public:
//事件ID（支持组合）
constant long EID_ROWFOCUSCHANGE		= 1	//RowFocusChanging/RowFocusChanged
constant long EID_ITEMFOCUSCHANGE	= 2	//ItemFocusChanged
constant long EID_ITEMCHANGE			= 4	//ItemChanged，禁用后将不会触发列表达式计算！
//订阅事件名
//RowFocusChanging(se_cst_dw source,long currentRow,long newrow)
//0:continue,1:prevent
constant string EVT_ROWFOCUSCHANGING	= "rowfocuschanging"
//RowFocusChanged(se_cst_dw source,long currentRow)
constant string EVT_ROWFOCUSCHANGED		= "rowfocuschanged"
//long ItemFocusChanged(se_cst_dw source,long row,dwobject dwo)
//0:continue,1:prevent
constant string EVT_ITEMFOCUSCHANGED	= "itemfocuschanged"
//ItemChanged(se_cst_dw source,long row,dwobject dwo)
constant string EVT_ITEMCHANGED			= "0-itemchanged"
//long EditChanged(se_cst_dw source,long row,dwobject dwo,string data)
//0:continue,1:prevent
constant string EVT_EDITCHANGED			= "1-editchanged"
//long Clicked(se_cst_dw source,long xpos,long ypos,long row,dwobject dwo)
//0:continue,1:prevent
constant string EVT_CLICKED				= "clicked"
//long DoubleClicked(se_cst_dw source,long xpos,long ypos,long row,dwobject dwo)
//0:continue,1:prevent
constant string EVT_DOUBLECLICKED		= "doubleclicked"
//long LButtonUp(se_cst_dw source,long xpos,long ypos,long row,dwobject dwo)
//0:continue,1:prevent
constant string EVT_LBUTTONUP				= "lbuttonup"
//long RButtonDown(se_cst_dw source,long xpos,long ypos,long row,dwobject dwo)
//0:continue,1:prevent
constant string EVT_RBUTTONDOWN			= "rbuttondown"
//long RButtonUp(se_cst_dw source,long xpos,long ypos,long row,dwobject dwo)
//0:continue,1:prevent
constant string EVT_RBUTTONUP				= "rbuttonup"
//GetFocus(se_cst_dw source)
constant string EVT_GETFOCUS				= "getfocus"
//LoseFocus(se_cst_dw source)
constant string EVT_LOSEFOCUS				= "losefocus"

/* 服务 */
public:
privatewrite n_cst_dwsvc_contextmenu		ContextMenu
privatewrite n_cst_dwsvc_rowselect			RowSelect
privatewrite n_cst_dwsvc_columnsort			ColumnSort
privatewrite n_cst_dwsvc_dropdownsearch	DropDownSearch
privatewrite n_cst_dwsvc_columnexp			ColumnExp

/* 实现 */
private:
//禁用的事件
long _nDisabledEvent

//标志当前正在调用OnDoItemChange
boolean _bDoItemChange
//标志当前正在调用OnDwnItemValidationError
boolean _bDwnItemValidationError
//当ItemError事件由ItemChanged触发时使用的ItemChanged返回值
long _nItemChangeRetCode
end variables

forward prototypes
public function integer filter ()
public function integer deleterow (long r)
public function long of_on (readonly string name, readonly powerobject obj, readonly string evtname)
public function long of_off (readonly string name, readonly powerobject obj, readonly string evtname)
public function long of_off (readonly string name, readonly powerobject obj)
public function long of_off (readonly string name)
public function long of_off ()
public function long of_off (readonly powerobject obj)
public function long of_off (readonly powerobject obj, readonly string evtname)
public function boolean of_iseventdisabled (readonly long evt)
public function long of_disableevent (readonly long evt)
public function integer of_enableevent (readonly long evt)
private subroutine _of_postaccepttext ()
end prototypes

event ondwnrbuttondown;if Event RButtonDown(xpos,ypos,row,dwo) = 1 then return 1
if Eventful.of_Trigger(EVT_RBUTTONDOWN,xpos,ypos,row,dwo) = 1 then return 1
return 0
end event

event ondwnrbuttonup;if Eventful.of_Trigger(EVT_RBUTTONUP,xpos,ypos,row,dwo) = 1 then return 1
return 0
end event

event ondwnrowchange;if BitTest(_nDisabledEvent,EID_ROWFOCUSCHANGE) then return 0
if Event RowFocusChanged(currentRow) = 1 then return 1
Eventful.of_Trigger(EVT_ROWFOCUSCHANGED,currentRow)
return 0
end event

event ondwnrowchanging;if BitTest(_nDisabledEvent,EID_ROWFOCUSCHANGE) then return 0
if Event RowFocusChanging(currentrow,newrow) = 1 then return 1
if Eventful.of_Trigger(EVT_ROWFOCUSCHANGING,currentRow,newrow) = 1 then return 1
return 0
end event

event ondwnlbuttondblclk;if Event DoubleClicked(xpos,ypos,row,dwo) = 1 then return 1

if IsValid(this) then
	if Eventful.of_Trigger(EVT_DOUBLECLICKED,xpos,ypos,row,dwo) = 1 then return 1
end if

return 0
end event

event ondwnlbuttonclk;if Event Clicked(xpos,ypos,row,dwo) = 1 then return 1

if IsValid(this) then
	if Eventful.of_Trigger(EVT_CLICKED,xpos,ypos,row,dwo) = 1 then return 1
end if

//无焦点切换行
if IsValid(this) and row > 0 then
	if Describe("DataWindow.Processing") = "1" then
		if GetRow() <> row then
			SetRow(row)
			if GetRow() <> row then return 1
		end if
	end if
end if

return 0
end event

event ondwnchanging;if Event EditChanged(row,dwo,data) = 1 then return 1

if Eventful.of_IsSubscribed(EVT_EDITCHANGED) then
	if Eventful.of_Trigger(EVT_EDITCHANGED,row,dwo,data) = 1 then return 1
end if
if DropdownSearch.#Enabled then
	DropdownSearch.Event OnEditChanged(row,dwo,data)
end if

return 0
end event

event ondwnitemchangefocus;if BitTest(_nDisabledEvent,EID_ITEMFOCUSCHANGE) then return 0
if Event ItemFocusChanged(row,dwo) = 1 then return 1
if Eventful.of_Trigger(EVT_ITEMFOCUSCHANGED,row,dwo) = 1 then return 1
return 0
end event

event ondwnitemchange;long rtCode
any aOrgValue
boolean bDoItemChange,bEqual
dwitemstatus orgStatus

if BitTest(_nDisabledEvent,EID_ITEMCHANGE) then return 0

aOrgValue = dwo.Primary[row]
orgStatus = GetItemStatus(row,Long(dwo.ID),Primary!)

bDoItemChange = _bDoItemChange
_bDoItemChange = true
rtCode = Event OnDoItemChange(row,dwo,data)
_nItemChangeRetCode = rtCode
_bDoItemChange = bDoItemChange

if aOrgValue = dwo.Primary[row] then
	bEqual = true
elseif IsNull(aOrgValue) and IsNull(dwo.Primary[row]) then
	bEqual = true
end if

if Not bEqual then
	//取修改后的值
	data = String(dwo.Primary[row])
	Event OnDwnChanging(row,dwo,data)
end if

//*return 1触发OnDwnItemValidationError
choose case rtCode
	case 1
	case 2
		//还原当前显示的不可编辑下拉值
		//*缓冲区的值可能已经被改变,防止覆盖
		if bEqual then
			//if Describe(dwo.Name + ".DDDW.AllowEdit") = "no" or &
			//	Describe(dwo.Name + ".DDLB.AllowEdit") = "no" then //DDDW/DDLB
				SetItem(row,Long(dwo.ID),aOrgValue)
				SetItemStatus(row,Long(dwo.ID),Primary!,orgStatus)
			//end if
		end if
	case 3
		//保留值，不切换焦点
		rtCode = 1
	case else
		//检查值是否被修改
		//*缓冲区的值可能已经被改变,防止覆盖
		if bEqual then
			//*此处不能调用AcceptText来应用数据，因为像CheckBox这种控件输入是没有[Text]需要Accept的
			choose case Left(dwo.ColType,5)
				case "char","char("
					SetItem(row,Long(dwo.ID),data)
				case "decim","real","numbe"
					SetItem(row,Long(dwo.ID),Dec(data))
				case "long","ulong"
					SetItem(row,Long(dwo.ID),Long(data))
				case "datet"
					SetItem(row,Long(dwo.ID),DateTime(data))
				case "date"
					SetItem(row,Long(dwo.ID),Date(data))
				case "time"
					SetItem(row,Long(dwo.ID),Time(data))
			end choose
		end if
		//触发数据真实更改后的事件
		Event OnDoItemChanged(row,dwo)
		//拒绝DW将当前文本再次应用到缓冲区
		//*防止ItemChanged改变了缓冲区的值后被覆盖!
		rtCode = 2
end choose

return rtCode
end event

event type long ondoitemchange(long row, dwobject dwo, string data);//====================================================================
// Event: ondoitemchange()
//--------------------------------------------------------------------
// Description: 数据发生修改前触发(校验值,此时输入的数据没有被写入缓冲区!)
//--------------------------------------------------------------------
// Arguments:
// 	value	long    	row 	
// 	value	dwobject	dwo 	
// 	value	string  	data	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-15
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long nDBLimit
string sColName,sProp

sColName = dwo.Name

/*if data <> "" then
	//检查字符串输入长度是否合法
	sProp = dwo.ColType
	if Left(sProp,5) = "char(" then
		nDBLimit = Long(Mid(sProp,6,Len(sProp) - 6))
		if LenA(data) > nDBLimit then
			MessageBoxEx("超出最大允许的长度，" + String(nDBLimit) + "个字节(每汉字占2个字节)!",StopSign!)
			return 2
		end if
	end if
end if*/

return Event ItemChanged(row,dwo,data)
end event

event ondoitemchanged(long row, dwobject dwo);//====================================================================
// Event: ondoitemchanged()
//--------------------------------------------------------------------
// Description: 数据发生修改后触发(校验通过,此时输入的数据已经被写入缓冲区!)
//--------------------------------------------------------------------
// Arguments:
// 	long    	row 	
// 	dwobject	dwo 	
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-03-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if ColumnExp.#Enabled then
	ColumnExp.Event OnItemChanged(row,dwo)
end if
if Eventful.of_IsSubscribed(EVT_ITEMCHANGED) then
	Eventful.of_Trigger(EVT_ITEMCHANGED,row,dwo)
end if
Event OnItemChanged(row,dwo)
end event

event ondwnitemvalidationerror;long rtCode,nItemChangeRetCode
any aOrgValue
string sErrMsg
dwitemstatus orgStatus

if _bDwnItemValidationError then return 1

_bDwnItemValidationError = true

nItemChangeRetCode = _nItemChangeRetCode
_nItemChangeRetCode = 0

aOrgValue = dwo.Primary[row]
orgStatus = GetItemStatus(row,Long(dwo.ID),Primary!)

//检查是否由ItemChanged触发
if nItemChangeRetCode = 1 or nItemChangeRetCode = 3 then
	rtCode = 1
end if

if rtCode = 0 then
	rtCode = Event ItemError(row,dwo,data)
	if IsNull(rtCode) then rtCode = 0
end if

if rtCode = 0 then
	if data <> "" /*or String(aOrgValue) <> ""*/ then
		//如果当前列有校验消息则显示该消息,同时阻止修改和焦点切换
		sErrMsg = Describe(dwo.Name+".ValidationMsg")
		if Len(sErrMsg) > 2 then
			sErrMsg = Mid(sErrMsg,2,Len(sErrMsg) - 2)
		end if
		if sErrMsg = "" or sErrMsg = "?" then
			sErrMsg = I18N(ne_cst_i18n.CAT_DWSVC,"输入了无效的值") + "!"
		end if
		MessageBox(I18N(ne_cst_i18n.CAT_DWSVC,"错误"),sErrMsg,StopSign!)
		rtCode = 1
	else
		//拒绝录入空值，保存时再检测提示
		_bDwnItemValidationError = false
		return 3
	end if
end if

choose case rtCode
	case 1,3
		//*此时有可能行被删除，所以需要检查（由MessageBox处理的Post消息）
		if row <= RowCount() and nItemChangeRetCode <> 3 then
			//还原当前显示的不可编辑下拉值
			//*缓冲区的值可能已经被改变,防止覆盖
			if aOrgValue = dwo.Primary[row] or (IsNull(aOrgValue) and IsNull(dwo.Primary[row])) then
				//if Describe(dwo.Name + ".DDDW.AllowEdit") = "no" or &
				//	Describe(dwo.Name + ".DDLB.AllowEdit") = "no" then //DDDW/DDLB
					SetItem(row,Long(dwo.ID),aOrgValue)
					SetItemStatus(row,Long(dwo.ID),Primary!,orgStatus)
				//end if
			end if
		end if
end choose

_bDwnItemValidationError = false

return rtCode
end event

event ondwnkillfocus;//*应用修改
if Not _bDoItemChange then
	Post _of_PostAcceptText()
end if
Eventful.of_Trigger(EVT_LOSEFOCUS)
return Event LoseFocus()
end event

event ondwnlbuttonup;if Eventful.of_Trigger(EVT_LBUTTONUP,xpos,ypos,row,dwo) = 1 then return 1
return 0
end event

event ondwnsetfocus;Eventful.of_Trigger(EVT_GETFOCUS)
return Event GetFocus()
end event

public function integer filter ();//Overrided
long rtCode

rtCode = super::Filter()
if rtCode = 1 then
	if RowSelect.#Enabled then
		RowSelect.Event OnFiltered()
	end if
end if

return rtCode
end function

public function integer deleterow (long r);//Overrided
long rtCode
long nRow
boolean bIsLastRow,bIsCurrentRow

if r < 0 or r > RowCount() then return -1

nRow= r
if nRow = 0 then
	nRow = GetRow()
end if

bIsCurrentRow = (nRow = GetRow())
bIsLastRow = (nRow = RowCount())

rtCode = super::DeleteRow(nRow)
if rtCode <> 1 then return rtCode

if RowCount() = 0 then
	Event OnDwnRowChange(0)
elseif bIsCurrentRow and nRow = GetRow() then
	Event OnDwnRowChange(nRow)
end if

//使DETAIL区的颜色刷新..
if bIsLastRow and RowCount() > 0 then
	SetRedraw(true)
end if

return rtCode
end function

public function long of_on (readonly string name, readonly powerobject obj, readonly string evtname);return Eventful.of_On(name,obj,evtName)
end function

public function long of_off (readonly string name, readonly powerobject obj, readonly string evtname);return Eventful.of_Off(name,obj,evtName)
end function

public function long of_off (readonly string name, readonly powerobject obj);return Eventful.of_Off(name,obj)
end function

public function long of_off (readonly string name);return Eventful.of_Off(name)
end function

public function long of_off ();return Eventful.of_Off()
end function

public function long of_off (readonly powerobject obj);return Eventful.of_Off(obj)
end function

public function long of_off (readonly powerobject obj, readonly string evtname);return Eventful.of_Off(obj,evtName)
end function

public function boolean of_iseventdisabled (readonly long evt);//====================================================================
// Function: of_iseventdisabled()
//--------------------------------------------------------------------
// Description: 判断指定事件是否被禁用
//--------------------------------------------------------------------
// Arguments:
// 	readonly	long	evt	
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-01-04
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return BitTest(_nDisabledEvent,evt)
end function

public function long of_disableevent (readonly long evt);//====================================================================
// Function: of_disableevent()
//--------------------------------------------------------------------
// Description: 禁用指定事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	long	evt	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-10-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if evt = 0 then return RetCode.E_INVALID_ARGUMENT

_nDisabledEvent = BitOR(_nDisabledEvent,evt)

return RetCode.OK
end function

public function integer of_enableevent (readonly long evt);//====================================================================
// Function: of_enableevent()
//--------------------------------------------------------------------
// Description: 启用指定事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	long	evt	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-10-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if evt = 0 then return RetCode.E_INVALID_ARGUMENT

_nDisabledEvent = BitClear(_nDisabledEvent,evt)

return RetCode.OK
end function

private subroutine _of_postaccepttext ();//====================================================================
// Function: _of_postaccepttext()
//--------------------------------------------------------------------
// Description: 用于失去焦点之后应用录入数据
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-09-11
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if GetFocus() <> this then
	if AcceptText() = -1 then
		SetFocus()
	end if
end if
end subroutine

on se_cst_dw.create
call super::create
this.eventful=create eventful
end on

on se_cst_dw.destroy
call super::destroy
destroy(this.eventful)
end on

event onpreconstructor;call super::onpreconstructor;ContextMenu = Create n_cst_dwsvc_contextmenu
RowSelect = Create n_cst_dwsvc_rowselect
ColumnSort = Create n_cst_dwsvc_columnsort
DropDownSearch = Create n_cst_dwsvc_dropdownsearch	
ColumnExp = Create n_cst_dwsvc_columnexp

ContextMenu.Event OnInit(this)
RowSelect.Event OnInit(this)
DropDownSearch.Event OnInit(this)
ColumnSort.Event OnInit(this)
ColumnExp.Event OnInit(this)
end event

event ondestructor;call super::ondestructor;Eventful.of_Off()
Destroy ContextMenu
Destroy RowSelect
Destroy ColumnSort
Destroy DropDownSearch
Destroy ColumnExp
end event

type eventful from n_cst_eventful within se_cst_dw descriptor "pb_nvo" = "true" 
end type

event constructor;call super::constructor;//long nvl
//SetNull(nvl)
of_SetDefaultReturnValue(0)
end event

event onprepare;call super::onprepare;if argCount < 1 then return 0
if target = parent then return 0
if target = ColumnExp then return 0
if target = DropDownSearch then return 0
if IsAncestor(target,"n_cst_dwsvc") then return 0
invoker.SetArg(1,parent)
argPassed = 1
return 0
end event

on eventful.create
call super::create
end on

on eventful.destroy
call super::destroy
end on

