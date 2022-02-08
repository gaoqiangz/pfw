$PBExportHeader$n_cst_taskpanelbar_baseitem.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_taskpanelbar_baseitem from nonvisualobject
end type
end forward

global type n_cst_taskpanelbar_baseitem from nonvisualobject
event oncapturechanged ( )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event onmouseleave ( )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event type long onpaint ( unsignedlong hdc )
event type long onerasebkgnd ( unsignedlong hdc )
event type long onscroll ( real scrollsize )
event type long onhittest ( real xpos,  real ypos )
event type boolean ontimer ( unsignedinteger id )
event onthemechanged ( unsignedinteger eventflag )
event type long onreposition ( ref rectf newrect )
event type long onupdatelayout ( real layoutwidth )
event oninit ( n_cst_taskpanelbar_panel parentpanel,  n_tooltip tooltip,  n_imagelist itemimagelist )
event type long onmeasureitem ( ref sizef itemsize )
event oncalclayout ( )
end type
global n_cst_taskpanelbar_baseitem n_cst_taskpanelbar_baseitem

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

/*--- Constants ---*/
Public:
//Item types
Constant Uint ITT_UNKNOW		= 0
Constant Uint ITT_BUTTON		= 1
Constant Uint ITT_CHECKBOX	= 2
Constant Uint ITT_RADIOBOX	= 3
Constant Uint ITT_EDITBOX		= 4	/*暂未实现*/
Constant Uint ITT_TOOLBAR	= 5
Constant Uint ITT_LINK			= 6
Constant Uint ITT_LABEL			= 7
Constant Uint ITT_ICON			= 8
Constant Uint ITT_SEPARATOR	= 9
Constant Uint ITT_SPACE		= 10
Constant Uint ITT_BREAK		= 11

/*--- Properties ---*/
Public:
PrivateWrite 	u_cst_taskpanelbar			#ParentTaskPanelBar
PrivateWrite 	n_cst_taskpanelbar_panel	#ParentPanel
ProtectedWrite Uint 								#Type					= ITT_UNKNOW
ProtectedWrite	Boolean							#Visible					= true
ProtectedWrite	Boolean							#Enabled				= true
Any													#Data
String													#Tag
Boolean												#LockUpdate

/*--- Implementation ---*/
Protected:
PrivateWrite n_cst_taskpanelbar_theme	theme
PrivateWrite n_imagelist						_ItemImageList
PrivateWrite n_tooltip							_ToolTip
RECTF												rcPaint
SIZEF												szLayout

PrivateWrite Boolean	_layoutChanged	= false
PrivateWrite Boolean 	_needRecalcLayout= false
PrivateWrite real		_layoutWidth		= 0
PrivateWrite Boolean 	_MouseCaptured 	= false

//Notify code
Constant Ulong	NCD_UPDATEPOINTS	= 1
Constant Ulong	NCD_ANIMATION		= 2	//command:offsetsize
Constant Ulong	NCD_SETCAPTURE	= 3	//command:1,setcapture;0,releasecapture
Constant Ulong	NCD_SETFOCUS		= 4	//command:1,setfocus;0,releasefocus
Constant Ulong	NCD_CUSTOM			= 5
//Hit-test code
Constant Long HTNOWHERE		= 0
Constant Long HTVALID			= 1
end variables

forward prototypes
public function long of_updatepoints ()
public function boolean of_isvisible ()
public function boolean of_isenabled ()
protected subroutine _of_capturemouse (readonly boolean capture)
public function unsignedlong of_getsafedc ()
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, unsignedinteger fadetime)
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, boolean fadeanimation)
public function long of_setvisible (readonly boolean visible)
public function long of_redraw (readonly boolean fadeanimation)
public function long of_setenabled (readonly boolean enabled)
public function boolean of_islockupdate ()
protected subroutine _of_recalclayout ()
public function long of_getpaintrect (ref rectf paintrect)
end prototypes

event type long onpaint(unsignedlong hdc);if of_IsLockUpdate() then return 1
if Not of_IsVisible() then return 1

return 0
end event

event type long onerasebkgnd(unsignedlong hdc);//用于清除指定DC的背景
#ParentPanel.Event OnEraseBkgnd(hdc)
return 0
end event

event type long onscroll(real scrollsize);if scrollSize = 0 then return 1

Painter.OffsetRect(ref rcPaint,0,scrollSize)

return 0
end event

event type long onhittest(real xpos, real ypos);if Not #Visible or Not #Enabled then return HTNOWHERE

if Painter.PtInRect(ref rcPaint,xpos,ypos) then
	return HTVALID
else
	return HTNOWHERE
end if
end event

event type long onreposition(ref rectf newrect);//由父控件调用
//参数:newRect.left,newRect.top为Item的新座标
//返回:newRect.right为Item右边界,newRect.bottom为Item下边界

if _needRecalcLayout then
	_of_RecalcLayout()
end if

if newRect.left = rcPaint.left and newRect.top = rcPaint.top and Not _layoutChanged then
	newRect.right = rcPaint.right
	newRect.bottom = rcPaint.bottom
	return 1
end if

_layoutChanged = false

rcPaint = newRect
rcPaint.right = rcPaint.left + szLayout.cx
rcPaint.bottom = rcPaint.top + szLayout.cy

newRect.right = rcPaint.right
newRect.bottom = rcPaint.bottom

if of_IsLockUpdate() then
	return 1
else
	return 0
end if
end event

event type long onupdatelayout(real layoutwidth);if _layoutWidth = layoutWidth then return 1

_layoutWidth = layoutWidth

return 0
end event

event oninit(n_cst_taskpanelbar_panel parentpanel, n_tooltip tooltip, n_imagelist itemimagelist);#ParentPanel 			= parentpanel
#ParentTaskPanelBar = #ParentPanel.#ParentTaskPanelBar
theme					= #ParentTaskPanelBar.theme

_ToolTip = tooltip
_ItemImageList = itemimagelist
end event

event type long onmeasureitem(ref sizef itemsize);if _needRecalcLayout then
	_of_RecalcLayout()
end if
itemSize = szLayout
return 0
end event

public function long of_updatepoints ();_needRecalcLayout = true

if of_IsLockUpdate() then return RetCode.FAILED
if Not of_IsVisible() then return RetCode.OK

_of_RecalcLayout()

#ParentPanel.Event OnNotify(this,NCD_UPDATEPOINTS,0)

return RetCode.OK
end function

public function boolean of_isvisible ();RECTF paintRect

if Not #Visible then return false
if Not #ParentPanel.of_IsVisible() then return false

Painter.GetClientRect(#ParentTaskPanelBar.#Handle,ref paintRect)
if rcPaint.bottom <= paintRect.top or rcPaint.top >= paintRect.bottom then
	return false
else
	return true
end if
end function

public function boolean of_isenabled ();if Not #Enabled then return false

return #ParentPanel.of_IsEnabled()
end function

protected subroutine _of_capturemouse (readonly boolean capture);if _MouseCaptured = capture then return

_MouseCaptured = capture

if capture then
	Win32.SetCapture(#ParentTaskPanelBar.#Handle)
else
	Win32.ReleaseCapture()
end if
end subroutine

public function unsignedlong of_getsafedc ();ulong safeDC

if of_IsLockUpdate() then return 0
if Not of_IsVisible()  then return 0

safeDC = #ParentPanel.of_GetSafeDC()

if safeDC > 0 then
	Painter.IntersectClipRect(safeDC,rcPaint)
end if

return safeDC
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, unsignedinteger fadetime);return #ParentPanel.of_ReleaseDC(hdc,hrgn,FadeTime)
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, boolean fadeanimation);return #ParentPanel.of_ReleaseDC(hdc,hrgn,FadeAnimation)
end function

public function long of_setvisible (readonly boolean visible);if #Visible = visible then return RetCode.OK

#Visible = visible

#ParentPanel.Event OnNotify(this,NCD_UPDATEPOINTS,0)

return RetCode.OK
end function

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC

if of_IsLockUpdate() then return RetCode.FAILED
if Not #Visible then return RetCode.OK

safeDC=of_GetSafeDC()

if safeDC > 0 then

	#ParentPanel.Event OnEraseBkgnd(safeDC)
	Event OnPaint(safeDC)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(rcPaint)
	
	of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
	
end if

return RetCode.OK
end function

public function long of_setenabled (readonly boolean enabled);if #Enabled = enabled then return RetCode.OK

#Enabled = enabled

of_Redraw(true)

return RetCode.OK
end function

public function boolean of_islockupdate ();if #LockUpdate then return true

return #ParentPanel.of_IsLockUpdate()
end function

protected subroutine _of_recalclayout ();_needRecalcLayout = true

if of_IsLockUpdate() then return

Event OnCalcLayout()

_layoutChanged = true
_needRecalcLayout = false
end subroutine

public function long of_getpaintrect (ref rectf paintrect);paintrect = rcPaint
return RetCode.OK
end function

on n_cst_taskpanelbar_baseitem.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_taskpanelbar_baseitem.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

