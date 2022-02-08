$PBExportHeader$n_cst_ribbonbar_baseitem.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_ribbonbar_baseitem from nonvisualobject
end type
end forward

shared variables

end variables

global type n_cst_ribbonbar_baseitem from nonvisualobject
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
event type long onmeasureitem ( unsignedinteger displaymode,  ref sizef itemsize )
event type long onreposition ( unsignedinteger displaymode,  ref rectf newrect )
event type long onupdatelayout ( real layoutheight )
event oninit ( n_cst_ribbonbar_panel parentpanel,  n_tooltip tooltip,  n_imagelist smallimagelist,  n_imagelist largeimagelist )
event oncalclayout ( )
event type long onrbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onrbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
end type
global n_cst_ribbonbar_baseitem n_cst_ribbonbar_baseitem

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
//Display mode
Constant Uint DPM_LARGE				= 1
Constant Uint DPM_INTERMEDIATE	= 2
Constant Uint DPM_COMPACT			= 3

/*--- Properties ---*/
Public:
PrivateWrite 	u_cst_ribbonbar				#ParentRibbonBar
PrivateWrite 	n_cst_ribbonbar_category	#ParentCategory
PrivateWrite 	n_cst_ribbonbar_panel		#ParentPanel
ProtectedWrite Uint 								#Type					= ITT_UNKNOW
ProtectedWrite	Boolean							#Visible					= true
ProtectedWrite	Boolean							#Enabled				= true
Any													#Data
String													#Tag
ProtectedWrite Uint								#MinDisplayMode		 = DPM_COMPACT
ProtectedWrite	Boolean							#AlwaysLargeMode
Boolean												#LockUpdate

/*--- Implementation ---*/
Protected:
PrivateWrite n_cst_ribbonbar_theme	theme
PrivateWrite n_imagelist					_SmallImageList
PrivateWrite n_imagelist					_LargeImageList
PrivateWrite n_tooltip						_ToolTip
RECTF											rcPaint
SIZEF											szLayouts[3]

Uint						_DisplayMode		= DPM_LARGE
PrivateWrite Boolean	_layoutChanged	= false
PrivateWrite Boolean	_needRecalcLayout= false
PrivateWrite Real			_layoutHeight		= 0
PrivateWrite Boolean 	_MouseCaptured 	= false

//Notify code
Constant Long	NCD_UPDATEPOINTS			= 1
Constant Long	NCD_LAYOUTCHANGED		= 2
Constant Long	NCD_UPDATESCALEORDER 	= 3	//command:Display mode
Constant Long	NCD_SETCAPTURE			= 4	//command:1,setcapture;0,releasecapture
Constant Long	NCD_SETFOCUS				= 5	//command:1,setfocus;0,releasefocus
Constant Long	NCD_CUSTOM					= 6
//Hit-test code
Constant Long HTNOWHERE		= 0
Constant Long HTVALID			= 1
end variables

forward prototypes
public function unsignedlong of_getsafedc ()
protected subroutine _of_recalclayout ()
public function boolean of_haslargemode ()
public function boolean of_hasintermediatemode ()
public function boolean of_hascompactmode ()
public function boolean of_islargemode ()
public function boolean of_isintermediatemode ()
public function boolean of_iscompactmode ()
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation)
protected subroutine _of_capturemouse (readonly boolean capture)
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime)
public function boolean of_isenabled ()
public function boolean of_isvisible ()
public function long of_setalwayslargemode (readonly boolean alwayslargemode)
public function long of_setenabled (readonly boolean enabled)
public function long of_setvisible (readonly boolean visible)
public function long of_updatepoints ()
public function long of_redraw (readonly boolean fadeanimation)
public function boolean of_islockupdate ()
public function long of_setmindisplaymode (readonly unsignedinteger mode)
public function uint of_getdisplaymode ()
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

Painter.OffsetRect(ref rcPaint,scrollSize,0)

return 0
end event

event type long onhittest(real xpos, real ypos);if Not #Visible or Not #Enabled then return HTNOWHERE

if Painter.PtInRect(ref rcPaint,xpos,ypos) then
	return HTVALID
else
	return HTNOWHERE
end if
end event

event type long onmeasureitem(unsignedinteger displaymode, ref sizef itemsize);if _needRecalcLayout then
	_of_RecalcLayout()
end if

itemSize = szLayouts[displayMode]

return 0
end event

event type long onreposition(unsignedinteger displaymode, ref rectf newrect);//由父控件调用
//参数:newRect.left,newRect.top为Item的新座标
//返回:newRect.right为Item右边界,newRect.bottom为Item下边界

if _needRecalcLayout then
	_of_RecalcLayout()
end if

if _DisplayMode = displayMode and newRect.left = rcPaint.left and newRect.top = rcPaint.top and Not _layoutChanged then
	newRect.right = rcPaint.right
	newRect.bottom = rcPaint.bottom
	return 1
end if

_layoutChanged = false
_DisplayMode = displayMode

rcPaint = newRect
rcPaint.right = rcPaint.left + szLayouts[_DisplayMode].cx
rcPaint.bottom = rcPaint.top + szLayouts[_DisplayMode].cy

//返回Item的边界
newRect.right = rcPaint.right
newRect.bottom = rcPaint.bottom

if of_IsLockUpdate() then
	return 1
else
	return 0
end if
end event

event type long onupdatelayout(real layoutheight);if _layoutHeight = layoutHeight then return 1

_layoutHeight = layoutHeight
_of_RecalcLayout()

return 0
end event

event oninit(n_cst_ribbonbar_panel parentpanel, n_tooltip tooltip, n_imagelist smallimagelist, n_imagelist largeimagelist);#ParentPanel 		= parentpanel
#ParentCategory 	= #ParentPanel.#ParentCategory
#ParentRibbonBar = #ParentCategory.#ParentRibbonBar
theme				= #ParentRibbonBar.theme

_ToolTip = tooltip
_SmallImageList = smallimagelist
_LargeImageList = largeimagelist
end event

public function unsignedlong of_getsafedc ();ulong safeDC

if of_IsLockUpdate() then return 0
if Not of_IsVisible()  then return 0

safeDC = #ParentPanel.of_GetSafeDC()

if safeDC > 0 then
	Painter.IntersectClipRect(safeDC,rcPaint)
end if

return safeDC
end function

protected subroutine _of_recalclayout ();_needRecalcLayout = true

if of_IsLockUpdate() then return

Event OnCalcLayout()

_layoutChanged = true
_needRecalcLayout = false
end subroutine

public function boolean of_haslargemode ();return true
end function

public function boolean of_hasintermediatemode ();return true
end function

public function boolean of_hascompactmode ();return true
end function

public function boolean of_islargemode ();return (_DisplayMode = DPM_LARGE)
end function

public function boolean of_isintermediatemode ();return (_DisplayMode = DPM_INTERMEDIATE)
end function

public function boolean of_iscompactmode ();return (_DisplayMode = DPM_COMPACT)
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation);return #ParentPanel.of_ReleaseDC(hdc,hrgn,FadeAnimation)
end function

protected subroutine _of_capturemouse (readonly boolean capture);if _MouseCaptured = capture then return

_MouseCaptured = capture

if Not #ParentPanel.of_IsPopupMode() and Not #ParentCategory.of_IsPopupMode() then
	if capture then
		Win32.SetCapture(#ParentPanel.of_GetHandle())
	else
		Win32.ReleaseCapture()
	end if
end if
end subroutine

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime);return #ParentPanel.of_ReleaseDC(hdc,hrgn,FadeTime)
end function

public function boolean of_isenabled ();if Not #Enabled then return false

return #ParentPanel.of_IsEnabled()
end function

public function boolean of_isvisible ();RECTF paintRect

if Not #Visible then return false
if Not #ParentPanel.of_IsVisible() then return false
if #ParentPanel.of_IsPopupMode() then return true

#ParentCategory.of_GetPaintRect(ref paintRect)
if rcPaint.Right <= paintRect.Left or rcPaint.Left >= paintRect.Right then
	return false
else
	return true
end if
end function

public function long of_setalwayslargemode (readonly boolean alwayslargemode);if Not of_HasLargeMode() then return RetCode.E_NO_SUPPORT
if #AlwaysLargeMode = AlwaysLargeMode then return RetCode.OK

#AlwaysLargeMode = AlwaysLargeMode

#ParentPanel.Event OnNotify(this,NCD_UPDATEPOINTS,0)

return RetCode.OK
end function

public function long of_setenabled (readonly boolean enabled);if #Enabled = enabled then return RetCode.OK

#Enabled = enabled

of_Redraw(true)

return RetCode.OK
end function

public function long of_setvisible (readonly boolean visible);if #Visible = visible then return RetCode.OK

#Visible = visible

#ParentPanel.Event OnNotify(this,NCD_UPDATEPOINTS,0)

return RetCode.OK
end function

public function long of_updatepoints ();_needRecalcLayout = true
#ParentPanel.Event OnNotify(this,NCD_LAYOUTCHANGED,0)

if of_IsLockUpdate() then return RetCode.FAILED
if Not of_IsVisible() then return RetCode.OK

_of_RecalcLayout()

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

public function boolean of_islockupdate ();if #LockUpdate then return true

return #ParentPanel.of_IsLockUpdate()
end function

public function long of_setmindisplaymode (readonly unsignedinteger mode);boolean bDirty

if #MinDisplayMode = mode then return RetCode.OK

choose case mode
	case DPM_COMPACT,DPM_INTERMEDIATE,DPM_LARGE
		#MinDisplayMode = mode
		choose case _DisplayMode
			case DPM_COMPACT
				if #MinDisplayMode = DPM_INTERMEDIATE and of_HasIntermediateMode() then
					bDirty = true
				elseif #MinDisplayMode = DPM_LARGE and of_HasLargeMode() then
					bDirty = true
				end if
			case DPM_INTERMEDIATE
				if #MinDisplayMode = DPM_LARGE and of_HasLargeMode() then
					bDirty = true
				end if
		end choose
		if bDirty then
			#ParentPanel.Event OnNotify(this,NCD_UPDATEPOINTS,0)
		end if
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function uint of_getdisplaymode ();return _DisplayMode
end function

public function long of_getpaintrect (ref rectf paintrect);paintrect = rcPaint
return RetCode.OK
end function

on n_cst_ribbonbar_baseitem.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_ribbonbar_baseitem.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

