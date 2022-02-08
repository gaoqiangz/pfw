$PBExportHeader$n_cst_ribbonbar_category.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_ribbonbar_category from nonvisualobject
end type
end forward

global type n_cst_ribbonbar_category from nonvisualobject
event oncapturechanged ( )
event type long onerasebkgnd ( unsignedlong hdc )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event onmouseleave ( )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event type long onpaint ( unsignedlong hdc )
event type long onresize ( real newwidth,  real newheight )
event type long onmousehover ( unsignedlong vkey,  real xpos,  real ypos )
event type long onmousehwheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event type long onmousewheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event type boolean ontimer ( unsignedinteger id )
event type long onnotify ( n_cst_ribbonbar_panel childpanel,  long notifycode,  long command )
event onthemechanged ( unsignedinteger eventflag )
event type long onvisiblechanged ( boolean visible )
event type long onenable ( boolean enable )
event oninit ( u_cst_ribbonbar parentribbonbar,  n_tooltip tooltip,  n_imagelist panelimagelist,  n_imagelist smallimagelist,  n_imagelist largeimagelist )
event type long oninitpopup ( ref real xpos,  ref real ypos,  ref real width,  ref real height )
event type long onuninitpopup ( unsignedlong exitcode,  boolean force )
event type long onpopup ( boolean popup )
event type long onitemnotify ( n_cst_ribbonbar_baseitem childitem,  long command )
event type long onhiddenchanged ( boolean hidden )
event type boolean oninitdata ( string text,  string image )
event type long onsettext ( string text )
event type long onsetimage ( string image )
event type long onrbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onrbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
end type
global n_cst_ribbonbar_category n_cst_ribbonbar_category

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
//Indexes
Constant Int IDX_SCROLLBARLEFT		= -1
Constant Int IDX_SCROLLBARRIGHT	= -2

/*--- Properties ---*/
Public:
PrivateWrite 	u_cst_ribbonbar	#ParentRibbonBar
ProtectedWrite	Boolean 				#Visible			= true
ProtectedWrite	Boolean				#Enabled		= true
Any										#Data
String										#Tag
PrivateWrite String 					#Text
PrivateWrite String 					#Image
Boolean									#LockUpdate

/*--- Implementation ---*/
Private:
n_cst_ribbonbar_theme	theme
n_imagelist					_PanelImageList
n_imagelist					_SmallImageList
n_imagelist					_LargeImageList
n_tooltip						_ToolTip
n_cst_ribbonbar_panel	Panels[]
PAINTPANE					ScrollBarLeft
PAINTPANE					ScrollBarRight
RECTF							rcPaint

n_vector _IntermediateScaleOrder
n_vector _CompactScaleOrder
n_vector _CollapsedScaleOrder

Int		_mouseOverIndex			= 0
Int		_mouseDownIndex		= 0
Int		_rightMouseDownIndex	= 0
Int		_firstIndex					= 0
Int		_lastIndex					= 0
real	_ScrollPosition 				= 0
real	_StartPoint 					= 0
real	_EndPoint					= 0
real 	_LastScrollPosition	 		= 0
real	_smoothScrollSize			= 0
real	_layoutWidths[]

WindowState _ParentLastWindowState

Boolean _Hidden					= true
Boolean _PopupMode				= false
Boolean _layoutChanged			= false
Boolean _needRecalcLayout		= false
Boolean _MouseCaptured 		= false
Boolean _MouseLeaveTracked 	= false
Boolean _MouseHoverTracked 	= false

/*--- Constants ---*/
//Notify code
Constant Long	NCD_UPDATEPOINTS			= 1
Constant Long	NCD_LAYOUTCHANGED		= 2
Constant Long	NCD_UPDATESCALEORDER 	= 3	//command:Display mode
Constant Long	NCD_SETCAPTURE			= 4	//command:1,setcapture;0,releasecapture
Constant Long	NCD_SETFOCUS				= 5	//command:1,setfocus;0,releasefocus
Constant Long	NCD_CUSTOM					= 6
//Display mode
Constant Uint DPM_LARGE				= 1
Constant Uint DPM_INTERMEDIATE	= 2
Constant Uint DPM_COMPACT			= 3
Constant Uint DPM_COLLAPSED			= 4
//Hit-test code
Constant Long HTNOWHERE		= 0
Constant Long HTVALID			= 1
//Timer ID
Constant Uint TM_SCROLL	= 2
//Timer interval (ms)
Constant Uint TMI_SCROLL	= 15
//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
//Sizes
Constant real SCROLLBARSIZE 	= 10 		//px
end variables

forward prototypes
private subroutine _of_updatepoints ()
private subroutine _of_updatescrollbarpoints ()
private subroutine _of_capturemouse (readonly boolean capture)
private subroutine _of_scrollleft ()
private subroutine _of_scrollright ()
public function integer of_getindex (readonly n_cst_ribbonbar_panel panel)
public function unsignedlong of_getsafedc ()
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation)
private subroutine _of_recalclayout ()
public function boolean of_ispopupmode ()
public function ulong of_gethandle ()
private subroutine _of_trackmouseleave (boolean track)
public function integer of_getcount ()
private function boolean _of_adjustscrollposition ()
public function n_cst_ribbonbar_panel of_insertpanel (readonly integer index, readonly string caption, readonly string image)
public function n_cst_ribbonbar_panel of_insertpanel (readonly integer index, readonly string caption, readonly string image, readonly string tiptext)
public function n_cst_ribbonbar_panel of_addpanel (readonly string caption, readonly string image)
public function n_cst_ribbonbar_panel of_addpanel (readonly string caption, readonly string image, readonly string tiptext)
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime)
public function long of_setvisible (readonly boolean visible)
public function boolean of_isvisible ()
public function long of_finditembytag (readonly string tag, ref n_cst_ribbonbar_baseitem founditem)
public function long of_finditembytext (readonly string text, ref n_cst_ribbonbar_baseitem founditem)
public function long of_getpanel (readonly integer index, ref n_cst_ribbonbar_panel panel)
public function long of_remove (readonly integer index)
public function long of_removeall ()
public function long of_setenabled (readonly boolean enabled)
public function long of_updatepoints ()
public function long of_redraw (readonly boolean fadeanimation)
public function n_cst_ribbonbar_panel of_insertpanel (readonly integer index, readonly string caption)
public function n_cst_ribbonbar_panel of_addpanel (readonly string caption)
public function long of_exitpopupmode (readonly unsignedlong exitcode)
public function boolean of_isenabled ()
private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly boolean fadeanimation)
private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly unsignedlong hdc)
private subroutine _of_updatepanellayouts ()
private subroutine _of_updatescaleorder (readonly unsignedinteger displaymode)
private function boolean _of_compactscaleordercompare (any firstarg, any secondarg)
private function boolean _of_intermediatescaleordercompare (any firstarg, any secondarg)
private function boolean _of_collapsedscaleordercompare (any firstarg, any secondarg)
private subroutine _of_trackmousehover (readonly boolean track, readonly long hovertime)
public function long of_findpanelbytag (readonly string tag, ref n_cst_ribbonbar_panel foundpanel)
public function boolean of_islockupdate ()
public function long of_settext (readonly string text)
public function long of_setimage (readonly string image)
public function long of_scrollto (readonly integer index, readonly long flag)
public function long of_scrollto (readonly integer index)
public function long of_scrollto (readonly n_cst_ribbonbar_baseitem item, readonly long flag)
public function long of_scrollto (readonly n_cst_ribbonbar_baseitem item)
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
public function long of_getpaintrect (ref rectf paintrect)
private subroutine _of_scrollposition (real scrollsize)
public function integer of_indexfrompoint (readonly real xpos, readonly real ypos)
end prototypes

event oncapturechanged();if _MouseCaptured then
	_of_CaptureMouse(false)
	if ScrollBarLeft.MouseDown then
		ScrollBarLeft.MouseDown = false
		_of_DrawScrollBar(ScrollBarLeft,true)
	end if
	if ScrollBarRight.MouseDown then
		ScrollBarRight.MouseDown = false
		_of_DrawScrollBar(ScrollBarRight,true)
	end if
	Event OnMouseLeave()
elseif _mouseDownIndex > 0 then
	Panels[_mouseDownIndex].Event OnCaptureChanged()
	_mouseDownIndex = 0
elseif _rightMouseDownIndex > 0 then
	Panels[_rightMouseDownIndex].Event OnCaptureChanged()
	_rightMouseDownIndex = 0
end if
end event

event type long onerasebkgnd(unsignedlong hdc);//由子控件调用，用于清除指定DC的背景
if #ParentRibbonBar.#Transparent then
	#ParentRibbonBar.FillParentBkgnd(hdc)
end if

#ParentRibbonBar.Event OnEraseBkgnd(hdc)

return 1
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);if Not _MouseLeaveTracked or #ParentRibbonBar.Timer.IsRunning(TM_SCROLL) then
	Event OnMouseMove(vkey,xpos,ypos)
end if

if ScrollBarLeft.MouseOver or ScrollBarRight.MouseOver then
	Event OnLButtonDown(vKey,xpos,ypos)
else
	if _mouseOverIndex > 0 then
		_mouseDownIndex = _mouseOverIndex
		Panels[_mouseDownIndex].Event OnLButtonDBLClk(vkey,xpos,ypos)
	end if
end if

return 0
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);if Not _MouseLeaveTracked or #ParentRibbonBar.Timer.IsRunning(TM_SCROLL) then
	Event OnMouseMove(vkey,xpos,ypos)
end if

if Not #ParentRibbonBar.#AutoScroll then
	if ScrollBarLeft.MouseOver then
		ScrollBarLeft.MouseDown = true
		_of_DrawScrollBar(ScrollBarLeft,false)
		_of_CaptureMouse(true)
		_of_TrackMouseHover(true,500)
		_of_ScrollLeft()
		return 0
	end if
	
	if ScrollBarRight.MouseOver then
		ScrollBarRight.MouseDown = true
		_of_DrawScrollBar(ScrollBarRight,false)
		_of_CaptureMouse(true)
		_of_TrackMouseHover(true,500)
		_of_ScrollRight()
		return 0
	end if
end if

if _mouseOverIndex > 0 then
	_mouseDownIndex = _mouseOverIndex
	Panels[_mouseDownIndex].Event OnLButtonDown(vkey,xpos,ypos)
end if

return 0
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if _MouseCaptured then
	_of_CaptureMouse(false)
	if ScrollBarLeft.MouseDown then
		ScrollBarLeft.MouseDown = false
		_of_DrawScrollBar(ScrollBarLeft,true)
	end if
	if ScrollBarRight.MouseDown then
		ScrollBarRight.MouseDown = false
		_of_DrawScrollBar(ScrollBarRight,true)
	end if
elseif _mouseDownIndex > 0 then
	Panels[_mouseDownIndex].Event OnLButtonUp(vkey,xpos,ypos)
	_mouseDownIndex = 0
end if

_of_TrackMouseLeave(true)

return 0
end event

event onmouseleave();if _mouseOverIndex > 0 then
	Panels[_mouseOverIndex].Event OnMouseLeave()
	#ParentRibbonBar.Event OnPanelMouseLeave(Panels[_mouseOverIndex])
	_mouseOverIndex = 0
end if

if ScrollBarLeft.MouseOver then
	ScrollBarLeft.MouseOver = false
	_of_DrawScrollBar(ScrollBarLeft,true)
end if

if ScrollBarRight.MouseOver then
	ScrollBarRight.MouseOver = false
	_of_DrawScrollBar(ScrollBarRight,true)
end if

_of_TrackMouseLeave(false)
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);int index
boolean inScrollBar

if Not Painter.PtInRect(ref rcPaint,xpos,ypos) then
	if _MouseLeaveTracked then
		Event OnMouseLeave()
	end if
	return 0
end if

if Not _MouseLeaveTracked then
	_of_TrackMouseLeave(true)
end if

index = of_indexfrompoint(xpos,ypos)

if _mouseOverIndex <> index then
	if _mouseOverIndex > 0 then
		Panels[_mouseOverIndex].Event OnMouseLeave()
		#ParentRibbonBar.Event OnPanelMouseLeave(Panels[_mouseOverIndex])
	end if
	_mouseOverIndex = index
	if _mouseOverIndex > 0 then
		Panels[_mouseOverIndex].Event OnMouseMove(vkey,xpos,ypos)
		#ParentRibbonBar.Event OnPanelMouseEnter(Panels[_mouseOverIndex],xpos,ypos)
	end if
elseif _mouseOverIndex > 0 then
	Panels[_mouseOverIndex].Event OnMouseMove(vkey,xpos,ypos)
	#ParentRibbonBar.Event OnPanelMouseMove(Panels[_mouseOverIndex],xpos,ypos)
end if

if index = IDX_SCROLLBARLEFT then
	if Not ScrollBarLeft.MouseOver then
		ScrollBarLeft.MouseOver = true
		_of_DrawScrollBar(ScrollBarLeft,true)
		if #ParentRibbonBar.#AutoScroll then
			_of_TrackMouseHover(true,50)
		end if
	elseif ScrollBarLeft.MouseDown then
		_of_TrackMouseHover(true,50)
	end if
else
	if ScrollBarLeft.MouseOver then
		ScrollBarLeft.MouseOver = false
		_of_DrawScrollBar(ScrollBarLeft,true)
	end if
end if

if index = IDX_SCROLLBARRIGHT then
	if Not ScrollBarRight.MouseOver then
		ScrollBarRight.MouseOver = true
		_of_DrawScrollBar(ScrollBarRight,true)
		if #ParentRibbonBar.#AutoScroll then
			_of_TrackMouseHover(true,50)
		end if
	elseif ScrollBarRight.MouseDown then
		_of_TrackMouseHover(true,50)
	end if
else
	if ScrollBarRight.MouseOver then
		ScrollBarRight.MouseOver = false
		_of_DrawScrollBar(ScrollBarRight,true)
	end if
end if

return 0
end event

event type long onpaint(unsignedlong hdc);int index
RECTF paintRect

if of_IsLockUpdate() then return 1

paintRect = rcPaint

_of_AdjustRect(ref paintRect,ADJ_BORDER)
Painter.IntersectClipRect(hdc,paintRect)

if ScrollBarLeft.visible then
	_of_DrawScrollBar(ScrollBarLeft,hdc)
	Painter.ExcludeClipRect(hdc,ScrollBarLeft.rcPaint)
end if
if ScrollBarRight.visible then
	_of_DrawScrollBar(ScrollBarRight,hdc)
	Painter.ExcludeClipRect(hdc,ScrollBarRight.rcPaint)
end if

for index = 1 to UpperBound(Panels)
	if Panels[index].#Visible then
		Panels[index].Event OnPaint(hdc)
	end if
next

Painter.SelectClipRgn(hdc,0)

return 1
end event

event type long onresize(real newwidth, real newheight);boolean bUpdateLayout

if _needRecalcLayout then
	_of_RecalcLayout()
end if

if rcPaint.right = newWidth and rcPaint.bottom = newHeight  and Not _layoutChanged then return 1

if rcPaint.bottom <> newHeight then
	bUpdateLayout = true
end if

rcPaint.right = newWidth
rcPaint.bottom = newHeight

if bUpdateLayout then
	_of_UpdatePanelLayouts()
end if

if #ParentRibbonBar.#ParentWindow.WindowState <> Minimized! then
	if _ParentLastWindowState <> #ParentRibbonBar.#ParentWindow.WindowState then
		if Not IsNull(_LastScrollPosition) then
			_ScrollPosition = _LastScrollPosition
			SetNull(_LastScrollPosition)
		else
			_LastScrollPosition = _ScrollPosition
		end if
		_ParentLastWindowState = #ParentRibbonBar.#ParentWindow.WindowState
	end if
end if

_of_UpdatePoints()

return 0
end event

event type long onmousehover(unsignedlong vkey, real xpos, real ypos);if _MouseCaptured or _MouseHoverTracked then
	boolean trackMouseHover = false
	
	if ScrollBarLeft.visible and Painter.PtInRect(ScrollBarLeft.rcPaint,xpos,ypos) and &
		(#ParentRibbonBar.#AutoScroll or ScrollBarLeft.MouseDown) then
		_of_ScrollLeft()
		trackMouseHover = true
	end if
	
	if ScrollBarRight.visible and Painter.PtInRect(ScrollBarRight.rcPaint,xpos,ypos) and &
		(#ParentRibbonBar.#AutoScroll or ScrollBarRight.MouseDown) then
		_of_ScrollRight()
		trackMouseHover = true
	end if
	
	if #ParentRibbonBar.#SmoothScroll then
		_of_TrackMouseHover(trackMouseHover,50)
	else
		_of_TrackMouseHover(trackMouseHover,200)
	end if

elseif _mouseOverIndex > 0 then
	Panels[_mouseOverIndex].Event OnMouseHover(vkey,xpos,ypos)
end if

return 0
end event

event type long onmousehwheel(unsignedlong vkey, long zdelta, real xpos, real ypos);int i,steps

steps = Abs(zdelta)/WinMsg.WHEEL_DELTA

if (zdelta < 0 and ScrollBarLeft.visible)  then
	for i = 1 to steps
		_of_ScrollLeft()
	next
elseif (zdelta > 0 and ScrollBarRight.visible) then
	for i = 1 to steps
		_of_ScrollRight()
	next
end if

return 1
end event

event type long onmousewheel(unsignedlong vkey, long zdelta, real xpos, real ypos);int i,steps

steps = Abs(zdelta)/WinMsg.WHEEL_DELTA

if (zdelta > 0 and ScrollBarLeft.visible)  then
	for i = 1 to steps
		_of_ScrollLeft()
	next
elseif (zdelta < 0 and ScrollBarRight.visible) then
	for i = 1 to steps
		_of_ScrollRight()
	next
end if

return 1
end event

event type boolean ontimer(unsignedinteger id);real scrollSize

if id = TM_SCROLL then
	if _smoothScrollSize = 0 then
		return false
	end if
	
	if _smoothScrollSize > 0 and ScrollBarLeft.Visible then
		scrollSize = Ceiling(_smoothScrollSize / 10) + 2
		if _smoothScrollSize - scrollSize < 0 then
			scrollSize = _smoothScrollSize
		end if
		_smoothScrollSize -= scrollSize
	end if
	
	if _smoothScrollSize < 0 and ScrollBarRight.Visible then
		scrollSize = Ceiling(_smoothScrollSize / 10) - 2
		if _smoothScrollSize - scrollSize > 0 then
			scrollSize = _smoothScrollSize
		end if
		_smoothScrollSize -= scrollSize
	end if
	
	if scrollSize <> 0 then
		_of_ScrollPosition(scrollSize)
		of_Redraw(false)
	end if
	if (_smoothScrollSize = 0 or scrollSize = 0) and _MouseLeaveTracked then
		POINTF pt
		
		_smoothScrollSize = 0
		
		Painter.GetCursorPos(ref pt)
		Painter.ScreenToClient(of_GetHandle(),ref pt)
		
		Event OnMouseMove(0,pt.x,pt.y)
		//Stop timer
		return false
	end if
	return true
end if

return false
end event

event type long onnotify(n_cst_ribbonbar_panel childpanel, long notifycode, long command);//来自子控件的消息
choose case notifyCode
	case NCD_UPDATEPOINTS
		of_UpdatePoints()
	case NCD_LAYOUTCHANGED
		_needRecalcLayout = true
	case NCD_UPDATESCALEORDER
		_of_UpdateScaleOrder(command)
end choose

return 0
end event

event onthemechanged(unsignedinteger eventflag);int index
boolean layoutChanged,dirty,panelEvent

choose case eventFlag
	case theme.EVT_THEME
		dirty = true
		layoutChanged = true
		panelEvent = true
	case theme.EVT_RIBBONSTYLE
		dirty = true
		layoutChanged = true
		panelEvent = true
	case theme.EVT_BORDERSHADOW
		dirty = true
		layoutChanged = true
	case theme.EVT_PANELBORDERSTYLE
		dirty = true
		panelEvent = true
	case theme.EVT_ITEMBORDERSTYLE
		dirty = true
		panelEvent = true
	case theme.EVT_PANELICONSIZE
		dirty = true
		panelEvent = true
	case theme.EVT_SMALLICONSIZE
		dirty = true
		panelEvent = true
	case theme.EVT_LARGEICONSIZE
		dirty = true
		panelEvent = true
	case theme.EVT_PANELMARGIN
		dirty = true
	case theme.EVT_SHADOWSIZE
		dirty = true
		layoutChanged = true
	case theme.EVT_BORDERMARGIN
		dirty = true
		layoutChanged = true
end choose

if dirty then
	if layoutChanged then
		_of_UpdatePanelLayouts()
	end if
end if

if panelEvent then
	for index = 1 to UpperBound(Panels)
		Panels[index].Event OnThemeChanged(eventFlag)
	next
end if

if dirty then
	of_UpdatePoints()
else
	of_Redraw(true)
end if
end event

event type long onvisiblechanged(boolean visible);if #Visible = visible then return 0

#Visible = visible

if Not #Visible then
	if _smoothScrollSize <> 0 then
		_of_ScrollPosition(_smoothScrollSize)
		_smoothScrollSize = 0
	end if
	if _MouseLeaveTracked then
		Event OnMouseLeave()
	end if
end if

return 0
end event

event type long onenable(boolean enable);of_SetEnabled(enable)

return 0
end event

event oninit(u_cst_ribbonbar parentribbonbar, n_tooltip tooltip, n_imagelist panelimagelist, n_imagelist smallimagelist, n_imagelist largeimagelist);#ParentRibbonbar = parentRibbonbar
theme				= #ParentRibbonBar.theme

_ToolTip = tooltip
_PanelImageList = panelImageList
_SmallImageList = smallimagelist
_LargeImageList = largeimagelist
end event

event type long onpopup(boolean popup);_PopupMode = popup
_MouseLeaveTracked = false

if Not Popup then
	Event OnMouseLeave()
end if

return 0
end event

event type long onhiddenchanged(boolean hidden);if _Hidden = hidden then return 0

_Hidden = hidden

if _Hidden then
	if _smoothScrollSize <> 0 then
		_of_ScrollPosition(_smoothScrollSize)
		_smoothScrollSize = 0
	end if
	Event OnMouseLeave()
end if

return 0
end event

event type boolean oninitdata(string text, string image);#Text = text
#Image = image
return true
end event

event type long onsettext(string text);#Text = text
return 0
end event

event type long onsetimage(string image);#Image = image
return 0
end event

event type long onrbuttondown(unsignedlong vkey, real xpos, real ypos);if Not _MouseLeaveTracked or #ParentRibbonBar.Timer.IsRunning(TM_SCROLL) then
	Event OnMouseMove(vkey,xpos,ypos)
end if

if _mouseOverIndex > 0 then
	_rightMouseDownIndex = _mouseOverIndex
	Panels[_rightMouseDownIndex].Event OnRButtonDown(vkey,xpos,ypos)
end if

return 0
end event

event type long onrbuttonup(unsignedlong vkey, real xpos, real ypos);if _rightMouseDownIndex > 0 then
	Panels[_rightMouseDownIndex].Event OnRButtonUp(vkey,xpos,ypos)
	_rightMouseDownIndex = 0
end if

_of_TrackMouseLeave(true)

return 0
end event

private subroutine _of_updatepoints ();int index
real panelMargin
real xpos
real curWidth,maxWidth
Uint presetDPM
RECTF adjustedRect,paintRect
SIZEF panelSize
SIZEF calcSize
n_cst_ribbonbar_panel curPanel

if of_IsLockUpdate() then return
if _Hidden then return

_layoutChanged = false

adjustedRect = rcPaint

_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

xpos = adjustedRect.left
xpos += _ScrollPosition
_StartPoint = xpos

_firstIndex = 0
_lastIndex = 0

maxWidth = adjustedRect.right - adjustedRect.left

if theme.#RibbonStyle = theme.RBS_OFFICE2007 then
	panelMargin = theme.#PanelMargin
end if

if _layoutWidths[DPM_LARGE] <= maxWidth then							//Large mode
	for index = 1 to UpperBound(Panels)
		if Not Panels[index].#Visible then continue
		paintRect.left = xpos
		paintRect.top = adjustedRect.top
		if Panels[index].#Collapsed then
			Panels[index].Event OnReposition(DPM_COLLAPSED,ref paintRect)
		else
			Panels[index].Event OnReposition(DPM_LARGE,ref paintRect)
		end if
		_EndPoint = paintRect.right
		xpos = paintRect.right + panelMargin
		
		if _firstIndex = 0 then
			_firstIndex = index
		end if
		_lastIndex = index
	next
elseif _layoutWidths[DPM_INTERMEDIATE] <= maxWidth then			//Intermediate mode
	//预设缩放排版
	curWidth = _layoutWidths[DPM_LARGE]
	if _IntermediateScaleOrder.Count() > 0 then
		_IntermediateScaleOrder.Rewind()
		do while IsValidObject(_IntermediateScaleOrder.Get())
			curPanel = _IntermediateScaleOrder.GetAndNext()
			if Not curPanel.#Visible then continue
			if curPanel.#Collapsed then continue
			if curWidth > maxWidth then
				curPanel.Event OnMeasureItem(DPM_LARGE,ref calcSize)
				curPanel.Event OnMeasureItem(DPM_INTERMEDIATE,ref panelSize)
				curWidth -= calcSize.cx - panelSize.cx
				curPanel.Event OnPreSetDisplayMode(DPM_INTERMEDIATE)
			else
				curPanel.Event OnPreSetDisplayMode(DPM_LARGE)
			end if
		loop
	end if
	//设置Panel的真实位置
	for index = 1 to UpperBound(Panels)
		if Not Panels[index].#Visible then continue
		paintRect.left = xpos
		paintRect.top = adjustedRect.top
		if Panels[index].#Collapsed then
			presetDPM = DPM_COLLAPSED
		else
			presetDPM = Panels[index].Event OnGetPresetDisplayMode()
		end if
		if presetDPM <> 0 then
			Panels[index].Event OnReposition(presetDPM,ref paintRect)
		else
			if curWidth > maxWidth then
				Panels[index].Event OnMeasureItem(DPM_LARGE,ref calcSize)
				Panels[index].Event OnMeasureItem(DPM_INTERMEDIATE,ref panelSize)
				curWidth -= calcSize.cx - panelSize.cx
				Panels[index].Event OnReposition(DPM_INTERMEDIATE,ref paintRect)
			else
				Panels[index].Event OnReposition(DPM_LARGE,ref paintRect)
			end if
		end if
		_EndPoint = paintRect.right
		xpos = paintRect.right + panelMargin
		
		if _firstIndex = 0 then
			_firstIndex = index
		end if
		_lastIndex = index
	next
elseif _layoutWidths[DPM_COMPACT] <= maxWidth then					//Compact mode
	//预设缩放排板
	curWidth = _layoutWidths[DPM_INTERMEDIATE]
	if _CompactScaleOrder.Count() > 0 then
		_CompactScaleOrder.Rewind()
		do while IsValidObject(_CompactScaleOrder.Get())
			curPanel = _CompactScaleOrder.GetAndNext()
			if Not curPanel.#Visible then continue
			if curPanel.#Collapsed then continue
			if curWidth > maxWidth then
				curPanel.Event OnMeasureItem(DPM_INTERMEDIATE,ref calcSize)
				curPanel.Event OnMeasureItem(DPM_COMPACT,ref panelSize)
				curWidth -= calcSize.cx - panelSize.cx
				curPanel.Event OnPreSetDisplayMode(DPM_COMPACT)
			else
				curPanel.Event OnPreSetDisplayMode(DPM_INTERMEDIATE)
			end if
		loop
	end if
	//设置Panel的真实位置
	for index = 1 to UpperBound(Panels)
		if Not Panels[index].#Visible then continue
		paintRect.left = xpos
		paintRect.top = adjustedRect.top
		if Panels[index].#Collapsed then
			presetDPM = DPM_COLLAPSED
		else
			presetDPM = Panels[index].Event OnGetPresetDisplayMode()
		end if
		if presetDPM <> 0 then
			Panels[index].Event OnReposition(presetDPM,ref paintRect)
		else
			if curWidth > maxWidth then
				Panels[index].Event OnMeasureItem(DPM_INTERMEDIATE,ref calcSize)
				Panels[index].Event OnMeasureItem(DPM_COMPACT,ref panelSize)
				curWidth -= calcSize.cx - panelSize.cx
				Panels[index].Event OnReposition(DPM_COMPACT,ref paintRect)
			else
				Panels[index].Event OnReposition(DPM_INTERMEDIATE,ref paintRect)
			end if
		end if
		_EndPoint = paintRect.right
		xpos = paintRect.right + panelMargin
		
		if _firstIndex = 0 then
			_firstIndex = index
		end if
		_lastIndex = index
	next
else																							//Collapsed mode
	//预设缩放排板
	curWidth = _layoutWidths[DPM_COMPACT]
	if _CollapsedScaleOrder.Count() > 0 then
		_CollapsedScaleOrder.Rewind()
		do while IsValidObject(_CollapsedScaleOrder.Get())
			curPanel = _CollapsedScaleOrder.GetAndNext()
			if Not curPanel.#Visible then continue
			if curPanel.#Collapsed then continue
			if curWidth > maxWidth and Not curPanel.#AlwaysItemMode then
				curPanel.Event OnMeasureItem(DPM_COMPACT,ref calcSize)
				curPanel.Event OnMeasureItem(DPM_COLLAPSED,ref panelSize)
				curWidth -= calcSize.cx - panelSize.cx
				curPanel.Event OnPreSetDisplayMode(DPM_COLLAPSED)
			else
				curPanel.Event OnPreSetDisplayMode(DPM_COMPACT)
			end if
		loop
	end if
	//设置Panel的真实位置
	for index = 1 to UpperBound(Panels)
		if Not Panels[index].#Visible then continue
		paintRect.left = xpos
		paintRect.top = adjustedRect.top
		if Panels[index].#Collapsed then
			presetDPM = DPM_COLLAPSED
		else
			presetDPM = Panels[index].Event OnGetPresetDisplayMode()
		end if
		if presetDPM <> 0 then
			Panels[index].Event OnReposition(presetDPM,ref paintRect)
		else
			if curWidth > maxWidth and Not Panels[index].#AlwaysItemMode then
				Panels[index].Event OnMeasureItem(DPM_COMPACT,ref calcSize)
				Panels[index].Event OnMeasureItem(DPM_COLLAPSED,ref panelSize)
				curWidth -= calcSize.cx - panelSize.cx
				Panels[index].Event OnReposition(DPM_COLLAPSED,ref paintRect)
			else
				Panels[index].Event OnReposition(DPM_COMPACT,ref paintRect)
			end if
		end if
		_EndPoint = paintRect.right
		xpos = paintRect.right + panelMargin
		
		if _firstIndex = 0 then
			_firstIndex = index
		end if
		_lastIndex = index
	next
end if

if Not _of_AdjustScrollPosition() then
	_of_UpdateScrollBarPoints()
end if
end subroutine

private subroutine _of_updatescrollbarpoints ();RECTF paintRect

paintRect = rcPaint

_of_AdjustRect(ref paintRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if Ceiling(_StartPoint) < Ceiling(paintRect.left) then
	ScrollBarLeft.visible = true
	ScrollBarLeft.rcPaint.left = rcPaint.left
	ScrollBarLeft.rcPaint.right = SCROLLBARSIZE
	ScrollBarLeft.rcPaint.top = paintRect.top + 2
	ScrollBarLeft.rcPaint.bottom = paintRect.bottom - 2
else
	ScrollBarLeft.visible = false
end if

if Ceiling(_EndPoint) > Ceiling(paintRect.right) then
	ScrollBarRight.visible = true
	ScrollBarRight.rcPaint.left = rcPaint.right - SCROLLBARSIZE
	ScrollBarRight.rcPaint.right = rcPaint.right
	ScrollBarRight.rcPaint.top 	= paintRect.top + 2
	ScrollBarRight.rcPaint.bottom = paintRect.bottom - 2
else
	ScrollBarRight.visible = false
end if
end subroutine

private subroutine _of_capturemouse (readonly boolean capture);if _MouseCaptured = capture then return

_MouseCaptured = capture

if Not of_IsPopupMode() then
	if capture then
		Win32.SetCapture(of_GetHandle())
	else
		Win32.ReleaseCapture()
	end if
end if
end subroutine

private subroutine _of_scrollleft ();int index,nItemIndex
real offsetSize
boolean bNeedScroll
n_cst_ribbonbar_baseitem item
RECTF paintRect,adjustedRect

if Not ScrollBarLeft.visible then return

adjustedRect = rcPaint
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if _smoothScrollSize > 0 then
	offsetSize = _smoothScrollSize
end if

for index = UpperBound(Panels) to 1 step -1
	if Not Panels[index].#Visible then continue
	Panels[index].of_GetPaintRect(ref paintRect)
	if index = _firstIndex then
		if paintRect.Left + offsetSize < adjustedRect.left then
			bNeedScroll = true
		end if
	else
		if paintRect.Left + offsetSize < ScrollBarLeft.rcPaint.Right + 1 then
			bNeedScroll = true
		end if
	end if
	if bNeedScroll then
		if Not Panels[index].of_IsCollapsedMode() then
			for nItemIndex = Panels[index].of_GetCount() to 1 step -1
				Panels[index].of_GetItem(nItemIndex,ref item)
				if Not item.#Visible then continue
				if item.#Type = item.ITT_SEPARATOR or item.#Type = item.ITT_SPACE or item.#Type = item.ITT_BREAK then continue
				item.of_GetPaintRect(ref paintRect)
				if paintRect.Left + offsetSize < ScrollBarLeft.rcPaint.Right + 1 then
					of_ScrollTo(item,Enums.SF_BACKWARD)
					return
				end if
			next
		end if
		of_ScrollTo(index,Enums.SF_BACKWARD)
		return
	end if
next
end subroutine

private subroutine _of_scrollright ();int index,nCount,nItemIndex,nItemCount
real offsetSize
boolean bNeedScroll
n_cst_ribbonbar_baseitem item
RECTF paintRect,adjustedRect

if Not ScrollBarRight.visible then return

adjustedRect = rcPaint
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if _smoothScrollSize < 0 then
	offsetSize = _smoothScrollSize
end if

nCount = UpperBound(Panels)
for index = 1 to nCount
	if Not Panels[index].#Visible then continue
	Panels[index].of_GetPaintRect(ref paintRect)
	if index = _lastIndex then
		if paintRect.Right + offsetSize > adjustedRect.right then
			bNeedScroll = true
		end if
	else
		if paintRect.Right + offsetSize > ScrollBarRight.rcPaint.Left - 1 then
			bNeedScroll = true
		end if
	end if
	if bNeedScroll then
		if Not Panels[index].of_IsCollapsedMode() then
			nItemCount = Panels[index].of_GetCount()
			for nItemIndex = 1 to nItemCount
				Panels[index].of_GetItem(nItemIndex,ref item)
				if Not item.#Visible then continue
				if item.#Type = item.ITT_SEPARATOR or item.#Type = item.ITT_SPACE or item.#Type = item.ITT_BREAK then continue
				item.of_GetPaintRect(ref paintRect)
				if paintRect.Right + offsetSize > ScrollBarRight.rcPaint.Left - 1 then
					of_ScrollTo(item,Enums.SF_FORWARD)
					return
				end if
			next
		end if
		of_ScrollTo(index,Enums.SF_FORWARD)
		return
	end if
next
end subroutine

public function integer of_getindex (readonly n_cst_ribbonbar_panel panel);int index

if Not IsValidObject(panel) then return RetCode.E_INVALID_OBJECT

for index = 1 to UpperBound(Panels)
	if Panels[index] = panel then return index
next

return 0
end function

public function unsignedlong of_getsafedc ();//由子对象调用
ulong safeDC
RECTF paintRect

if of_IsLockUpdate() then return 0
if Not of_IsVisible() then return 0

safeDC = #ParentRibbonBar.of_GetSafeDC()

if safeDC > 0 then
	paintRect = rcPaint

	_of_AdjustRect(ref paintRect,ADJ_BORDER)
	Painter.IntersectClipRect(safeDC,paintRect)
	
	if ScrollBarLeft.Visible then
		Painter.ExcludeClipRect(safeDC,ScrollBarLeft.rcPaint)
	end if
	
	if ScrollBarRight.Visible then
		Painter.ExcludeClipRect(safeDC,ScrollBarRight.rcPaint)
	end if
end if

return safeDC
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation);if hdc = 0 then return false

return #ParentRibbonBar.of_ReleaseDC(hdc,hrgn,FadeAnimation)
end function

private subroutine _of_recalclayout ();int index,visibleCount
real panelMargins
SIZEF panelSize

_needRecalcLayout = true

if of_IsLockUpdate() then return

_layoutWidths[DPM_LARGE] = 0
_layoutWidths[DPM_INTERMEDIATE] = 0
_layoutWidths[DPM_COMPACT] = 0
_layoutWidths[DPM_COLLAPSED] = 0

for index = 1 to UpperBound(Panels)
	if Not Panels[index].#Visible then continue
	if Panels[index].#Collapsed then
		Panels[index].Event OnMeasureItem(DPM_COLLAPSED,ref panelSize)
		_layoutWidths[DPM_LARGE] += panelSize.cx
		_layoutWidths[DPM_INTERMEDIATE] += panelSize.cx
		_layoutWidths[DPM_COMPACT] += panelSize.cx
		_layoutWidths[DPM_COLLAPSED] += panelSize.cx
	else
		Panels[index].Event OnMeasureItem(DPM_LARGE,ref panelSize)
		_layoutWidths[DPM_LARGE] += panelSize.cx
		Panels[index].Event OnMeasureItem(DPM_INTERMEDIATE,ref panelSize)
		_layoutWidths[DPM_INTERMEDIATE] += panelSize.cx
		Panels[index].Event OnMeasureItem(DPM_COMPACT,ref panelSize)
		_layoutWidths[DPM_COMPACT] += panelSize.cx
		if Panels[index].#AlwaysItemMode then
			_layoutWidths[DPM_COLLAPSED] += panelSize.cx	//沿用DPM_COMPACT
		else
			Panels[index].Event OnMeasureItem(DPM_COLLAPSED,ref panelSize)
			_layoutWidths[DPM_COLLAPSED] += panelSize.cx
		end if
	end if
	visibleCount += 1
next

if theme.#RibbonStyle = theme.RBS_OFFICE2007 and visibleCount > 0 then
	panelMargins = (visibleCount - 1) * theme.#PanelMargin
	_layoutWidths[DPM_LARGE] += panelMargins
	_layoutWidths[DPM_INTERMEDIATE] += panelMargins
	_layoutWidths[DPM_COMPACT] += panelMargins
	_layoutWidths[DPM_COLLAPSED] += panelMargins
end if

_layoutChanged = true
_needRecalcLayout = false
end subroutine

public function boolean of_ispopupmode ();return _PopupMode
end function

public function ulong of_gethandle ();return #ParentRibbonBar.of_GetHandle()
end function

private subroutine _of_trackmouseleave (boolean track);TRACKMOUSEEVENT tme

if _MouseLeaveTracked = track then return

_MouseLeaveTracked = track

tme.cbsize = 16
tme.dwflags = Win32.TME_LEAVE
tme.hwndtrack = of_GetHandle()
tme.dwhovertime = 0

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(tme)
end subroutine

public function integer of_getcount ();return UpperBound(Panels)
end function

private function boolean _of_adjustscrollposition ();RECTF paintRect

if _ScrollPosition = 0 then return false

paintRect = rcPaint

_of_AdjustRect(ref paintRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if _EndPoint < paintRect.right and _ScrollPosition < 0 then
	_of_ScrollPosition(paintRect.right - _EndPoint)
	return true
end if

return false
end function

public function n_cst_ribbonbar_panel of_insertpanel (readonly integer index, readonly string caption, readonly string image);return of_InsertPanel(index,caption,image,"")
end function

public function n_cst_ribbonbar_panel of_insertpanel (readonly integer index, readonly string caption, readonly string image, readonly string tiptext);int i
n_cst_ribbonbar_panel panel
RECTF layoutRect

if index < 1 or index > UpperBound(Panels) + 1 then return panel
if Len(Trim(image)) = 0 and Len(caption) = 0 then return panel

panel = Create n_cst_ribbonbar_panel
panel.Event OnInit(this,_ToolTip,_PanelImageList,_SmallImageList,_LargeImageList)

if Not panel.Event OnInitData(caption,image,tiptext) then
	Destroy panel
	SetNull(panel)
	return panel
end if
 
layoutRect = rcPaint
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

panel.Event OnUpdateLayout(layoutRect.bottom - layoutRect.top)

for i = UpperBound(Panels) + 1 to index + 1 step -1
	Panels[i] = Panels[i - 1]
next
Panels[index] = panel

of_UpdatePoints()

return panel
end function

public function n_cst_ribbonbar_panel of_addpanel (readonly string caption, readonly string image);return of_AddPanel(caption,image,"")
end function

public function n_cst_ribbonbar_panel of_addpanel (readonly string caption, readonly string image, readonly string tiptext);return of_InsertPanel(UpperBound(Panels) + 1,caption,image,tiptext)
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime);if hdc = 0 then return false

return #ParentRibbonBar.of_ReleaseDC(hdc,hrgn,FadeTime)
end function

public function long of_setvisible (readonly boolean visible);if #Visible = visible then return RetCode.OK

return #ParentRibbonBar.of_Visible(#ParentRibbonBar.of_GetIndex(this),visible)
end function

public function boolean of_isvisible ();return (#Visible and Not _Hidden)
end function

public function long of_finditembytag (readonly string tag, ref n_cst_ribbonbar_baseitem founditem);int index
boolean bFound

if Len(tag) = 0 then return RetCode.E_INVALID_ARGUMENT

for index = 1 to UpperBound(Panels)
	if IsSucceeded(Panels[index].of_FindItemByTag(tag,ref foundItem)) then
		bFound = true
		exit
	end if
next

if bFound then
	return iif(IsValidObject(foundItem),RetCode.OK,RetCode.E_INVALID_OBJECT)
else
	return RetCode.E_OBJECT_NOT_FOUND
end if
end function

public function long of_finditembytext (readonly string text, ref n_cst_ribbonbar_baseitem founditem);int index
boolean bFound

if Len(text) = 0 then return RetCode.E_INVALID_ARGUMENT

for index = 1 to UpperBound(Panels)
	if IsSucceeded(Panels[index].of_FindItemByText(text,ref foundItem)) then
		bFound = true
		exit
	end if
next

if bFound then
	return iif(IsValidObject(foundItem),RetCode.OK,RetCode.E_INVALID_OBJECT)
else
	return RetCode.E_OBJECT_NOT_FOUND
end if
end function

public function long of_getpanel (readonly integer index, ref n_cst_ribbonbar_panel panel);if index < 1 or index > UpperBound(Panels) then return RetCode.E_OUT_OF_BOUND

panel = Panels[index]

return iif(IsValidObject(panel),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function long of_remove (readonly integer index);int i
boolean bVisible
n_cst_ribbonbar_panel	newPanels[]

if index < 1 or index > UpperBound(Panels) then return RetCode.E_OUT_OF_BOUND

if _IntermediateScaleOrder.Exists(Panels[index]) then
	_IntermediateScaleOrder.RemoveAt(_IntermediateScaleOrder.Position(Panels[index]))
end if
if _CompactScaleOrder.Exists(Panels[index]) then
	_CompactScaleOrder.RemoveAt(_CompactScaleOrder.Position(Panels[index]))
end if
if _CollapsedScaleOrder.Exists(Panels[index]) then
	_CollapsedScaleOrder.RemoveAt(_CollapsedScaleOrder.Position(Panels[index]))
end if

if index = _mouseOverIndex then
	_mouseOverIndex = 0
end if

if index = _mouseDownIndex then
	_mouseDownIndex = 0
end if
	
bVisible = Panels[index].#Visible

Destroy Panels[index]

for i = 1 to UpperBound(Panels)
	if i = index then continue
	newPanels[UpperBound(newPanels) + 1] = Panels[i]
next

Panels = newPanels

if UpperBound(Panels) = 0 then
	_mouseOverIndex = 0
	_mouseDownIndex = 0
	_ScrollPosition = 0
	_StartPoint = 0
	_EndPoint = 0
	SetNull(_LastScrollPosition)
end if

if bVisible then
	of_UpdatePoints()
end if

return RetCode.OK
end function

public function long of_removeall ();int i
n_cst_ribbonbar_panel	emptyPanels[]

if UpperBound(Panels) =  0 then return RetCode.OK

for i = 1 to UpperBound(Panels)
	Destroy Panels[i]
next

Panels = emptyPanels

_mouseOverIndex = 0
_mouseDownIndex = 0
_ScrollPosition = 0
_StartPoint = 0
_EndPoint = 0

SetNull(_LastScrollPosition)

_IntermediateScaleOrder.Purge()
_CompactScaleOrder.Purge()
_CollapsedScaleOrder.Purge()

of_UpdatePoints()

return RetCode.OK
end function

public function long of_setenabled (readonly boolean enabled);if #Enabled = enabled then return RetCode.OK

#Enabled = enabled

of_Redraw(true)

return RetCode.OK
end function

public function long of_updatepoints ();_needRecalcLayout = true

if of_IsLockUpdate() then return RetCode.FAILED
if Not of_IsVisible() then return RetCode.OK

_of_RecalcLayout()
_of_UpdatePoints()
of_Redraw(false)

return RetCode.OK
end function

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC

if of_IsLockUpdate() then return RetCode.FAILED
if Not of_IsVisible() then return RetCode.OK

safeDC=#ParentRibbonBar.of_GetSafeDC()

if safeDC > 0 then
	
	Event OnEraseBkgnd(safeDC)
	Event OnPaint(safeDC)
	
	#ParentRibbonBar.of_ReleaseDC(safeDC,0,FadeAnimation)
end if

return RetCode.OK
end function

public function n_cst_ribbonbar_panel of_insertpanel (readonly integer index, readonly string caption);return of_InsertPanel(index,caption,"","")
end function

public function n_cst_ribbonbar_panel of_addpanel (readonly string caption);return of_AddPanel(caption,"","")
end function

public function long of_exitpopupmode (readonly unsignedlong exitcode);if Not of_IsPopupMode() then return RetCode.OK

return #ParentRibbonBar.of_ExitPopupMode(exitcode)
end function

public function boolean of_isenabled ();return #Enabled
end function

private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly boolean fadeanimation);ulong safeDC
RECTF adjustedRect

if of_IsLockUpdate() then return
if Not ScrollBar.Visible then return

safeDC=#ParentRibbonBar.of_GetSafeDC()

adjustedRect = rcPaint
_of_AdjustRect(ref adjustedRect,ADJ_BORDER)

Painter.IntersectClipRect(safeDC,adjustedRect)
Painter.IntersectClipRect(safeDC,ScrollBar.rcPaint)

Event OnEraseBkgnd(safeDC)

_of_DrawScrollBar(ScrollBar,safeDC)

Painter.SelectClipRgn(safeDC,0)

ulong hUpdateRgn

hUpdateRgn = Painter.CreateRectRgn(ScrollBar.rcPaint)

#ParentRibbonBar.of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)

Painter.DeleteRgn(hUpdateRgn)
end subroutine

private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly unsignedlong hdc);ulong borderColor,bkColor,arrowColor,nState
POINTF pt1,pt2,pt3
Constant real ARROWSIZE = 6

if Not Scrollbar.Visible then return

if ScrollBar.MouseOver then nState += Enums.STATE_HOVER
if ScrollBar.MouseDown then nState += Enums.STATE_PRESSED

bkColor = theme.of_GetCategoryColor(this,theme.CLR_SCROLLBARBKGND,nState)
borderColor = theme.of_GetCategoryColor(this,theme.CLR_SCROLLBARBORDER,nState)
arrowColor = theme.of_GetCategoryColor(this,theme.CLR_ARROW,nState)

Painter.ThemeFill(hdc,ScrollBar.rcPaint,bkColor,Enums.HORZ,theme.#TabBkgndStyle,nState,false,&
								Enums.BS_SOLID,borderColor,0)
								
//Draw arrow
if ScrollBar = ScrollBarRight then		//箭头向右
	pt1.x = Scrollbar.rcPaint.left + (Scrollbar.rcPaint.right - Scrollbar.rcPaint.left - ARROWSIZE / 2) / 2
	pt1.y = Scrollbar.rcPaint.top + (Scrollbar.rcPaint.bottom - Scrollbar.rcPaint.top - ARROWSIZE) / 2
	pt2.x = pt1.x + ARROWSIZE / 2
	pt2.y = pt1.y + ARROWSIZE / 2
	pt3.x = pt1.x
	pt3.y = pt1.y + ARROWSIZE
else						//箭头向左
	pt1.x = Scrollbar.rcPaint.left + (Scrollbar.rcPaint.right - Scrollbar.rcPaint.left - ARROWSIZE / 2) / 2
	pt1.y = Scrollbar.rcPaint.top + (Scrollbar.rcPaint.bottom - Scrollbar.rcPaint.top - ARROWSIZE ) / 2  + ARROWSIZE/2
	pt2.x = pt1.x + ARROWSIZE / 2
	pt2.y = pt1.y - ARROWSIZE / 2
	pt3.x = pt1.x + ARROWSIZE / 2
	pt3.y = pt1.y + ARROWSIZE / 2
end if

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

private subroutine _of_updatepanellayouts ();int index
RECTF layoutRect

layoutRect = rcPaint
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if layoutRect.bottom - layoutRect.top <=0 then return

for index = 1 to UpperBound(Panels)
	Panels[index].Event OnUpdateLayout(layoutRect.bottom - layoutRect.top)
next

_of_RecalcLayout()
end subroutine

private subroutine _of_updatescaleorder (readonly unsignedinteger displaymode);int index

choose case displayMode
	case DPM_INTERMEDIATE
		_IntermediateScaleOrder.Purge()
		_IntermediateScaleOrder.Reserve(UpperBound(Panels))
		for index = 1 to UpperBound(Panels)
			if Panels[index].#IntermediateScaleOrder <> 0 then
				_IntermediateScaleOrder.Append(Panels[index])
			end if
		next
		if _IntermediateScaleOrder.Count() > 0 then
			_IntermediateScaleOrder.Sort(this,"_of_IntermediateScaleOrderCompare")
		end if
		of_UpdatePoints()
	case DPM_COMPACT
		_CompactScaleOrder.Purge()
		_CompactScaleOrder.Reserve(UpperBound(Panels))
		for index = 1 to UpperBound(Panels)
			if Panels[index].#CompactScaleOrder <> 0 then
				_CompactScaleOrder.Append(Panels[index])
			end if
		next
		if _CompactScaleOrder.Count() > 0 then
			_CompactScaleOrder.Sort(this,"_of_CompactScaleOrderCompare")
		end if
		of_UpdatePoints()
	case DPM_COLLAPSED
		_CollapsedScaleOrder.Purge()
		_CollapsedScaleOrder.Reserve(UpperBound(Panels))
		for index = 1 to UpperBound(Panels)
			if Panels[index].#CollapsedScaleOrder <> 0 then
				_CollapsedScaleOrder.Append(Panels[index])
			end if
		next
		if _CollapsedScaleOrder.Count() > 0 then
			_CollapsedScaleOrder.Sort(this,"_of_CollapsedScaleOrderCompare")
		end if
		of_UpdatePoints()
end choose
end subroutine

private function boolean _of_compactscaleordercompare (any firstarg, any secondarg);n_cst_ribbonbar_panel firstPanel,secondPanel

firstPanel = firstArg
secondPanel = secondArg

return (firstPanel.#CompactScaleOrder < secondPanel.#CompactScaleOrder)
end function

private function boolean _of_intermediatescaleordercompare (any firstarg, any secondarg);n_cst_ribbonbar_panel firstPanel,secondPanel

firstPanel = firstArg
secondPanel = secondArg

return (firstPanel.#IntermediateScaleOrder < secondPanel.#IntermediateScaleOrder)
end function

private function boolean _of_collapsedscaleordercompare (any firstarg, any secondarg);n_cst_ribbonbar_panel firstPanel,secondPanel

firstPanel = firstArg
secondPanel = secondArg

return (firstPanel.#CollapsedScaleOrder < secondPanel.#CollapsedScaleOrder)
end function

private subroutine _of_trackmousehover (readonly boolean track, readonly long hovertime);TRACKMOUSEEVENT tme

tme.cbsize = 16
tme.dwflags = Win32.TME_HOVER
tme.hwndtrack = of_GetHandle()
tme.dwhovertime = hoverTime

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(TME)

_MouseHoverTracked = track
end subroutine

public function long of_findpanelbytag (readonly string tag, ref n_cst_ribbonbar_panel foundpanel);int index
boolean bFound
n_cst_ribbonbar_panel panel

if Len(tag) = 0 then return RetCode.E_INVALID_ARGUMENT

for index = 1 to UpperBound(Panels)
	if Panels[index].#Tag = tag then
		panel = Panels[index]
		bFound = true
		exit
	end if
next

if bFound then
	try
		foundPanel = panel
	catch(Throwable ex)
		return RetCode.E_INVALID_ARGUMENT
	end try
	return iif(IsValidObject(foundPanel),RetCode.OK,RetCode.E_INVALID_OBJECT)
else
	return RetCode.E_OBJECT_NOT_FOUND
end if
end function

public function boolean of_islockupdate ();if #LockUpdate then return true

return #ParentRibbonBar.#LockUpdate
end function

public function long of_settext (readonly string text);return #ParentRibbonBar.of_SetText(#ParentRibbonBar.of_GetIndex(this),text)
end function

public function long of_setimage (readonly string image);return #ParentRibbonBar.of_SetImage(#ParentRibbonBar.of_GetIndex(this),image)
end function

public function long of_scrollto (readonly integer index, readonly long flag);real scrollSize
RECTF paintRect,adjustedRect

if index < 1 or index > UpperBound(Panels) then return RetCode.E_OUT_OF_BOUND
if Not Panels[index].#Visible then return RetCode.FAILED
if Not ScrollBarLeft.Visible and Not ScrollBarRight.Visible then return RetCode.FAILED

adjustedRect = rcPaint
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

Panels[index].of_GetPaintRect(ref paintRect)

choose case flag
	case Enums.SF_FORWARD
		if ScrollBarRight.Visible then
			if index = _lastIndex then
				if paintRect.Right > adjustedRect.right then
					scrollSize = adjustedRect.right - paintRect.Right
				end if
			else
				if paintRect.Right > ScrollBarRight.rcPaint.Left - 1 then
					scrollSize = (ScrollBarRight.rcPaint.Left - 1) - paintRect.Right
				end if
			end if
		end if
	case Enums.SF_BACKWARD
		if ScrollBarLeft.Visible then
			if index = _firstIndex then
				if paintRect.Left < adjustedRect.Left then
					scrollSize = adjustedRect.left - paintRect.Left
				end if
			else
				if paintRect.Left < ScrollBarLeft.rcPaint.Right + 1 then
					scrollSize = (ScrollBarLeft.rcPaint.Right + 1) - paintRect.Left
				end if
			end if
		end if
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

if scrollSize <> 0 then
	if #ParentRibbonBar.#SmoothScroll then
		_smoothScrollSize = scrollSize
		#ParentRibbonBar.Timer.Start(TM_SCROLL,TMI_SCROLL)
	else
		_of_ScrollPosition(scrollSize)
		of_Redraw(false)
		if _MouseLeaveTracked then
			POINTF pt
			
			Painter.GetCursorPos(ref pt)
			Painter.ScreenToClient(of_GetHandle(),ref pt)
			
			Event OnMouseMove(0,pt.x,pt.y)
		end if
	end if
	SetNull(_LastScrollPosition)
	return RetCode.OK
else
	if _smoothScrollSize > 0 then
		_smoothScrollSize = 0
		#ParentRibbonBar.Timer.Stop(TM_SCROLL)
		SetNull(_LastScrollPosition)
	end if
	return RetCode.FAILED
end if
end function

public function long of_scrollto (readonly integer index);long rtCode

rtCode = RetCode.FAILED
if ScrollBarRight.Visible then
	rtCode = of_ScrollTo(index,Enums.SF_FORWARD)
end if
if rtCode = RetCode.FAILED then
	if ScrollBarLeft.Visible then
		rtCode = of_ScrollTo(index,Enums.SF_BACKWARD)
	end if
end if

return rtCode
end function

public function long of_scrollto (readonly n_cst_ribbonbar_baseitem item, readonly long flag);real scrollSize
RECTF paintRect

if Not IsValidObject(item) then return RetCode.E_INVALID_OBJECT
if item.#ParentCategory <> this then return RetCode.E_INVALID_ARGUMENT
if item.#ParentPanel.of_IsCollapsedMode() then return RetCode.FAILED
if Not item.#Visible then return RetCode.FAILED
if Not ScrollBarLeft.Visible and Not ScrollBarRight.Visible then return RetCode.FAILED

item.of_GetPaintRect(ref paintRect)

choose case flag
	case Enums.SF_FORWARD
		if ScrollBarRight.Visible then
			if paintRect.Right > ScrollBarRight.rcPaint.Left - 1 then
				scrollSize = (ScrollBarRight.rcPaint.Left - 1) - paintRect.Right
			end if
		end if
	case Enums.SF_BACKWARD
		if ScrollBarLeft.Visible then
			if paintRect.Left < ScrollBarLeft.rcPaint.Right + 1 then
				scrollSize = (ScrollBarLeft.rcPaint.Right + 1) - paintRect.Left
			end if
		end if
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

if scrollSize <> 0 then
	if #ParentRibbonBar.#SmoothScroll then
		_smoothScrollSize = scrollSize
		#ParentRibbonBar.Timer.Start(TM_SCROLL,TMI_SCROLL)
	else
		_of_ScrollPosition(scrollSize)
		of_Redraw(false)
		if _MouseLeaveTracked then
			POINTF pt
			
			Painter.GetCursorPos(ref pt)
			Painter.ScreenToClient(of_GetHandle(),ref pt)
			
			Event OnMouseMove(0,pt.x,pt.y)
		end if
	end if
	SetNull(_LastScrollPosition)
	return RetCode.OK
else
	if _smoothScrollSize > 0 then
		_smoothScrollSize = 0
		#ParentRibbonBar.Timer.Stop(TM_SCROLL)
		SetNull(_LastScrollPosition)
	end if
	return RetCode.FAILED
end if
end function

public function long of_scrollto (readonly n_cst_ribbonbar_baseitem item);long rtCode

rtCode = RetCode.FAILED
if ScrollBarRight.Visible then
	rtCode = of_ScrollTo(item,Enums.SF_FORWARD)
end if
if rtCode = RetCode.FAILED then
	if ScrollBarLeft.Visible then
		rtCode = of_ScrollTo(item,Enums.SF_BACKWARD)
	end if
end if

return rtCode
end function

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if BitAND(flags,ADJ_BORDER) > 0 then
	if theme.#BorderStyle <> Enums.BS_NONE then
		fBorderSize = P2DY(1)
		adjRect.left += fBorderSize
		adjRect.right -= fBorderSize
		adjRect.bottom -= fBorderSize
		if Not theme.#TabStripBar then
			adjRect.top += fBorderSize
		end if
	end if
	if theme.#BorderShadow then
		adjRect.bottom -= theme.#ShadowSize
	end if
end if

if BitAND(flags,ADJ_BORDERMARGIN) > 0 then
	if theme.#RibbonStyle = theme.RBS_OFFICE2007 then
		adjRect.left += theme.#BorderMargin.left
		adjRect.top += theme.#BorderMargin.top
		adjRect.right -= theme.#BorderMargin.right
		adjRect.bottom -= theme.#BorderMargin.bottom
	end if
end if
end subroutine

public function long of_getpaintrect (ref rectf paintrect);paintrect = rcPaint
return RetCode.OK
end function

private subroutine _of_scrollposition (real scrollsize);int	index
real scrollPosition
RECTF adjustedRect

if scrollSize = 0 then return

adjustedRect = rcPaint
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

scrollPosition = _ScrollPosition

if scrollSize > 0 then		//Scroll to left
	if _StartPoint + scrollSize < adjustedRect.left then
		_ScrollPosition += scrollSize
	else
		_ScrollPosition = 0
	end if
else								//Scroll to right
	if adjustedRect.right - _EndPoint < scrollSize then
		_ScrollPosition += scrollSize
	else
		_ScrollPosition += adjustedRect.right - _EndPoint 
	end if
end if

if scrollPosition <> _ScrollPosition then
	scrollPosition = _ScrollPosition - scrollPosition
	_StartPoint += scrollPosition
	_EndPoint += scrollPosition
	_of_UpdateScrollBarPoints()
	for index = 1 to UpperBound(Panels)
		if Not Panels[index].#Visible then continue
		Panels[index].Event OnScroll(scrollPosition)
	next
end if
end subroutine

public function integer of_indexfrompoint (readonly real xpos, readonly real ypos);int index

if Not of_IsVisible() or Not #Enabled then return 0
if Not Painter.PtInRect(rcPaint,xpos,ypos) then return 0

if ScrollBarLeft.Visible then
	if Painter.PtInRect(ScrollBarLeft.rcPaint,xpos,ypos) then
		return IDX_SCROLLBARLEFT
	end if
end if

if ScrollBarRight.Visible then
	if Painter.PtInRect(ScrollBarRight.rcPaint,xpos,ypos) then
		return IDX_SCROLLBARRIGHT
	end if
end if

if _mouseOverIndex > 0 then
	if Panels[_mouseOverIndex].#Visible and Panels[_mouseOverIndex].#Enabled then
		if Panels[_mouseOverIndex].Event OnHitTest(xpos,ypos) <> HTNOWHERE then
			return _mouseOverIndex
		end if
	end if
end if

for index = 1 to UpperBound(Panels)
	if index = _mouseOverIndex then continue
	if Not Panels[index].#Visible or Not Panels[index].#Enabled then continue
	if Panels[index].Event OnHitTest(xpos,ypos) <> HTNOWHERE then
		return index
	end if
next

return 0
end function

on n_cst_ribbonbar_category.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_ribbonbar_category.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;int index

for index = 1 to UpperBound(Panels)
	Destroy Panels[index]
next

Destroy _IntermediateScaleOrder
Destroy _CompactScaleOrder
Destroy _CollapsedScaleOrder

end event

event constructor;_IntermediateScaleOrder = Create n_vector
_CompactScaleOrder = Create n_vector
_CollapsedScaleOrder = Create n_vector

SetNull(_LastScrollPosition)

_layoutWidths[DPM_COLLAPSED] = 0
end event

