$PBExportHeader$u_cst_taskpanelbar.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_taskpanelbar from u_cst_canvas
end type
type timer from n_timer within u_cst_taskpanelbar
end type
type theme from n_cst_taskpanelbar_theme within u_cst_taskpanelbar
end type
end forward

global type u_cst_taskpanelbar from u_cst_canvas
integer width = 841
integer height = 1712
boolean #fadeanimation = true
event oncapturechanged ( )
event type long onwindowsize ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event type long onmousehover ( unsignedlong vkey,  real xpos,  real ypos )
event type long onmousewheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event type long onpaint ( unsignedlong hdc )
event onmouseleave ( )
event ongetitemcolor ( n_cst_taskpanelbar_baseitem item,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type long onitemclicking ( n_cst_taskpanelbar_baseitem item )
event onitemclicked ( n_cst_taskpanelbar_baseitem item )
event type long onitemchecking ( n_cst_taskpanelbar_baseitem item )
event onitemchecked ( n_cst_taskpanelbar_baseitem item )
event onitemmousemove ( n_cst_taskpanelbar_baseitem item,  real xpos,  real ypos )
event onitemmouseenter ( n_cst_taskpanelbar_baseitem item,  real xpos,  real ypos )
event onitemmouseleave ( n_cst_taskpanelbar_baseitem item )
event onitemmousedown ( n_cst_taskpanelbar_baseitem item,  real xpos,  real ypos )
event onitemmouseup ( n_cst_taskpanelbar_baseitem item,  real xpos,  real ypos )
event type long ontitlebarclicking ( n_cst_taskpanelbar_panel panel )
event ontitlebarclicked ( n_cst_taskpanelbar_panel panel )
event ontitlebarmousemove ( n_cst_taskpanelbar_panel panel,  real xpos,  real ypos )
event ontitlebarmouseenter ( n_cst_taskpanelbar_panel panel,  real xpos,  real ypos )
event ontitlebarmouseleave ( n_cst_taskpanelbar_panel panel )
event ontitlebarmousedown ( n_cst_taskpanelbar_panel panel,  real xpos,  real ypos )
event ontitlebarmouseup ( n_cst_taskpanelbar_panel panel,  real xpos,  real ypos )
event onpanelmousemove ( n_cst_taskpanelbar_panel panel,  real xpos,  real ypos )
event onpanelmouseenter ( n_cst_taskpanelbar_panel panel,  real xpos,  real ypos )
event onpanelmouseleave ( n_cst_taskpanelbar_panel panel )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event type long onmenuselecting ( n_cst_taskpanelbar_baseitem item,  integer id )
event onmenuselected ( n_cst_taskpanelbar_baseitem item,  integer id )
event type long onpopupmenu ( n_cst_taskpanelbar_baseitem item,  ref real xpos,  ref real ypos,  ref unsignedlong flags )
event type long ontoolbarbuttonclicking ( n_cst_taskpanelbar_toolbar toolbar,  integer index )
event ontoolbarbuttonclicked ( n_cst_taskpanelbar_toolbar toolbar,  integer index )
event type long ontoolbarpopupmenu ( n_cst_taskpanelbar_toolbar toolbar,  integer index,  ref real xpos,  ref real ypos,  ref unsignedlong flags )
event ontoolbarbuttonmouseenter ( n_cst_taskpanelbar_toolbar toolbar,  integer index,  real xpos,  real ypos )
event ontoolbarbuttonmousemove ( n_cst_taskpanelbar_toolbar toolbar,  integer index,  real xpos,  real ypos )
event ontoolbarbuttonmouseleave ( n_cst_taskpanelbar_toolbar toolbar,  integer index )
event ontoolbarbuttonmousedown ( n_cst_taskpanelbar_toolbar toolbar,  integer index,  real xpos,  real ypos )
event ontoolbarbuttonmouseup ( n_cst_taskpanelbar_toolbar toolbar,  integer index,  real xpos,  real ypos )
event type long ontoolbarmenuselecting ( n_cst_taskpanelbar_toolbar toolbar,  integer index,  integer id )
event ontoolbarmenuselected ( n_cst_taskpanelbar_toolbar toolbar,  integer index,  integer id )
event ongetpanelcolor ( n_cst_taskpanelbar_panel panel,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type long onerasebkgnd ( unsignedlong hdc )
event type long onnotify ( n_cst_taskpanelbar_panel childpanel,  long notifycode,  long command )
event type long onpanelexpanding ( n_cst_taskpanelbar_panel panel )
event onpanelexpanded ( n_cst_taskpanelbar_panel panel )
event type long onpanelcollapsing ( n_cst_taskpanelbar_panel panel )
event onpanelcollapsed ( n_cst_taskpanelbar_panel panel )
event ongettoolbaritemcolor ( n_cst_taskpanelbar_toolbar toolbar,  integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
timer timer
theme theme
end type
global u_cst_taskpanelbar u_cst_taskpanelbar

type variables
/*--- Constants ---*/
Public:
//Indexes
Constant Int IDX_SCROLLBARUP		= -1
Constant Int IDX_SCROLLBARDOWN	= -2

/*--- Properties ---*/
Public:
Uint		#FlashFadeTime		= 1500		//ms
Boolean	#ToolTip 				= false
Boolean	#Animation				= false		//展开/折叠时显示动画
Boolean	#AutoScroll				= false 		//当鼠标进入ScrollBar时自动滚动
Boolean	#SmoothScroll			= false 		//平滑滚动效果

/*--- Implementation ---*/
Private:
n_imagelist						_PanelImageList
n_imagelist						_ItemImageList
n_tooltip 							_ToolTip
n_cst_taskpanelbar_panel	Panels[]
PAINTPANE						ScrollBarUp
PAINTPANE						ScrollBarDown
RECTF								rcClient

Int		_mouseOverIndex		= 0
Int		_mouseDownIndex	= 0
Int		_firstIndex				= 0
Int		_lastIndex				= 0
Real	_ScrollPosition 			= 0
Real	_StartPoint 				= 0
Real	_EndPoint				= 0
Real 	_LastScrollPosition	 	= 0
Real	_smoothScrollSize		= 0

WindowState _ParentLastWindowState

Boolean _MouseLeaveTracked 	= false
Boolean _MouseCaptured 		= false
Boolean _MouseHoverTracked 	= false

/*--- Constants ---*/
//Notify code
Constant Ulong	NCD_UPDATEPOINTS	= 1
Constant Ulong	NCD_ANIMATION		= 2	//command:offsetsize
Constant Ulong	NCD_SETCAPTURE	= 3	//command:1,setcapture;0,releasecapture
Constant Ulong	NCD_SETFOCUS		= 4	//command:1,setfocus;0,releasefocus
Constant Ulong	NCD_CUSTOM			= 5
//Hit-test code
Constant Long HTNOWHERE		= 0
Constant Long HTVALID			= 1
//Timer ID
Constant Uint TM_SCROLL		= 1
Constant Uint TM_FLASH			= 2
//Timer interval (ms)
Constant Uint TMI_SCROLL 		= 15
//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
//Sizes
Constant Real SCROLLBARSIZE = 10 		//px
end variables

forward prototypes
public function integer of_getcount ()
public function integer of_getindex (readonly n_cst_taskpanelbar_panel panel)
public function unsignedlong of_getsafedc ()
private subroutine _of_capturemouse (readonly boolean capture)
private subroutine _of_trackmouseleave (readonly boolean track)
private subroutine _of_updatescrollbarpoints ()
private subroutine _of_scrollup ()
private subroutine _of_scrolldown ()
public function long of_redraw (readonly boolean fadeanimation)
private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly unsignedlong hdc)
private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly boolean fadeanimation)
private function boolean _of_adjustscrollposition ()
public function long of_getpanel (readonly integer index, ref n_cst_taskpanelbar_panel panel)
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime)
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation)
private subroutine _of_updatepoints ()
public function long of_remove (readonly integer index)
public function long of_updatepoints ()
public function long of_removeall ()
public function n_cst_taskpanelbar_panel of_insertpanel (readonly integer index)
public function n_cst_taskpanelbar_panel of_addpanel (readonly string title)
private subroutine _of_fillbkgnd (readonly unsignedlong hdc)
private subroutine _of_updatepanellayouts ()
public function n_cst_taskpanelbar_panel of_insertpanel (readonly integer index, readonly string title, readonly string image, readonly boolean collapsed)
public function n_cst_taskpanelbar_panel of_insertpanel (readonly integer index, readonly string title, readonly string image)
public function n_cst_taskpanelbar_panel of_insertpanel (readonly integer index, readonly string title)
public function n_cst_taskpanelbar_panel of_addpanel (readonly string title, readonly string image, readonly boolean collapsed)
public function n_cst_taskpanelbar_panel of_addpanel (readonly string title, readonly string image)
private subroutine _of_trackmousehover (readonly boolean track, readonly long hovertime)
public function long of_finditembytag (readonly string stag, ref n_cst_taskpanelbar_baseitem founditem)
public function long of_finditembytext (readonly string txt, ref n_cst_taskpanelbar_baseitem founditem)
public function long of_findpanelbytag (readonly string stag, ref n_cst_taskpanelbar_panel foundpanel)
public function long of_scrollto (readonly integer index, readonly long flag)
public function long of_scrollto (readonly integer index)
public function long of_scrollto (readonly n_cst_taskpanelbar_baseitem item, readonly long flag)
public function long of_scrollto (readonly n_cst_taskpanelbar_baseitem item)
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
public function integer of_indexfrompoint (readonly real xpos, readonly real ypos)
private subroutine _of_scrollposition (readonly real scrollsize)
end prototypes

event oncapturechanged();if _MouseCaptured then
	_of_CaptureMouse(false)
	if ScrollBarUp.MouseDown then
		ScrollBarUp.MouseDown = false
		_of_DrawScrollBar(ScrollBarUp,true)
	end if
	if ScrollBarDown.MouseDown then
		ScrollBarDown.MouseDown = false
		_of_DrawScrollBar(ScrollBarDown,true)
	end if
	Event OnMouseLeave()
elseif _mouseDownIndex > 0 then
	Panels[_mouseDownIndex].Event OnCaptureChanged()
	_mouseDownIndex = 0
end if
end event

event type long onwindowsize(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);boolean bUpdateLayout

if rcClient.right <> newWidth then
	bUpdateLayout = true
end if

rcClient.right = newWidth
rcClient.bottom = newHeight

if bUpdateLayout then
	_of_UpdatePanelLayouts()
end if

if #ParentWindow.WindowState <> Minimized! then
	if _ParentLastWindowState <> #ParentWindow.WindowState then
		if Not IsNull(_LastScrollPosition) then
			_ScrollPosition = _LastScrollPosition
			SetNull(_LastScrollPosition)
		else
			_LastScrollPosition = _ScrollPosition
		end if
		_ParentLastWindowState = #ParentWindow.WindowState
	end if
end if

_of_UpdatePoints()

return 0
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);int index
boolean inScrollBar

if Not Painter.PtInRect(ref rcClient,xpos,ypos) then
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
		Event OnPanelMouseLeave(Panels[_mouseOverIndex])
	end if
	_mouseOverIndex = index
	if _mouseOverIndex > 0 then
		Panels[_mouseOverIndex].Event OnMouseMove(vkey,xpos,ypos)
		Event OnPanelMouseEnter(Panels[_mouseOverIndex],xpos,ypos)
	end if
elseif _mouseOverIndex > 0 then
	Panels[_mouseOverIndex].Event OnMouseMove(vkey,xpos,ypos)
	Event OnPanelMouseMove(Panels[_mouseOverIndex],xpos,ypos)
end if

if index = IDX_SCROLLBARUP then
	if Not ScrollBarUp.MouseOver then
		ScrollBarUp.MouseOver = true
		_of_DrawScrollBar(ScrollBarUp,true)
		if #AutoScroll then
			_of_TrackMouseHover(true,50)
		end if
	elseif ScrollBarUp.MouseDown then
		_of_TrackMouseHover(true,50)
	end if
else
	if ScrollBarUp.MouseOver then
		ScrollBarUp.MouseOver = false
		_of_DrawScrollBar(ScrollBarUp,true)
	end if
end if

if index = IDX_SCROLLBARDOWN then
	if Not ScrollBarDown.MouseOver then
		ScrollBarDown.MouseOver = true
		_of_DrawScrollBar(ScrollBarDown,true)
		if #AutoScroll then
			_of_TrackMouseHover(true,50)
		end if
	elseif ScrollBarDown.MouseDown then
		_of_TrackMouseHover(true,50)
	end if
else
	if ScrollBarDown.MouseOver then
		ScrollBarDown.MouseOver = false
		_of_DrawScrollBar(ScrollBarDown,true)
	end if
end if

return 0
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if _MouseCaptured then
	_of_CaptureMouse(false)
	if ScrollBarUp.MouseDown then
		ScrollBarUp.MouseDown = false
		_of_DrawScrollBar(ScrollBarUp,true)
	end if
	if ScrollBarDown.MouseDown then
		ScrollBarDown.MouseDown = false
		_of_DrawScrollBar(ScrollBarDown,true)
	end if
elseif _mouseDownIndex > 0 then
	Panels[_mouseDownIndex].Event OnLButtonUp(vkey,xpos,ypos)
	_mouseDownIndex = 0
end if

_of_TrackMouseLeave(true)

return 0
end event

event type long onmousehover(unsignedlong vkey, real xpos, real ypos);if _MouseCaptured or _MouseHoverTracked then
	boolean trackMouseHover = false
	
	if ScrollBarUp.visible and Painter.PtInRect(ScrollBarUp.rcPaint,xpos,ypos) and &
		(#AutoScroll or ScrollBarUp.MouseDown) then
		_of_ScrollUp()
		trackMouseHover = true
	end if
	
	if ScrollBarDown.visible and Painter.PtInRect(ScrollBarDown.rcPaint,xpos,ypos) and &
		(#AutoScroll or ScrollBarDown.MouseDown) then
		_of_ScrollDown()
		trackMouseHover = true
	end if
	
	if #SmoothScroll then
		_of_TrackMouseHover(trackMouseHover,50)
	else
		_of_TrackMouseHover(trackMouseHover,200)
	end if
elseif _mouseOverIndex > 0 then
	Panels[_mouseOverIndex].Event OnMouseHover(vkey,xpos,ypos)
end if

return 0
end event

event type long onmousewheel(unsignedlong vkey, long zdelta, real xpos, real ypos);int i,steps

steps = Abs(zdelta)/WinMsg.WHEEL_DELTA

if Painter.PtInRect(rcClient,xpos,ypos) then
	if (zdelta > 0 and ScrollBarUp.visible)  then
		for i = 1 to steps
			_of_ScrollUp()
		next
	elseif (zdelta < 0 and ScrollBarDown.visible) then
		for i = 1 to steps
			_of_ScrollDown()
		next
	end if
end if

return 1
end event

event type long onpaint(unsignedlong hdc);int index
RECTF paintRect

if #LockUpdate then return 1

Event OnEraseBkgnd(hdc)

paintRect = rcClient
_of_AdjustRect(ref paintRect,ADJ_BORDER)
Painter.IntersectClipRect(hdc,paintRect)

if ScrollBarUp.visible then
	_of_DrawScrollBar(ScrollBarUp,hdc)
	Painter.ExcludeClipRect(hdc,ScrollBarUp.rcPaint)
end if
if ScrollBarDown.visible then
	_of_DrawScrollBar(ScrollBarDown,hdc)
	Painter.ExcludeClipRect(hdc,ScrollBarDown.rcPaint)
end if

for index = 1 to UpperBound(Panels)
	if Panels[index].#Visible then
		Panels[index].Event OnPaint(hdc)
	end if
next

Painter.SelectClipRgn(hdc,0)

return 1
end event

event onmouseleave();if _mouseOverIndex > 0 then
	Panels[_mouseOverIndex].Event OnMouseLeave()
	Event OnPanelMouseLeave(Panels[_mouseOverIndex])
	_mouseOverIndex = 0
end if

if ScrollBarUp.MouseOver then
	ScrollBarUp.MouseOver = false
	_of_DrawScrollBar(ScrollBarUp,true)
end if

if ScrollBarDown.MouseOver then
	ScrollBarDown.MouseOver = false
	_of_DrawScrollBar(ScrollBarDown,true)
end if

_of_TrackMouseLeave(false)
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);if Not _MouseLeaveTracked or Timer.IsRunning(TM_SCROLL) then
	Event OnMouseMove(vkey,xpos,ypos)
end if

if Not #AutoScroll then
	if ScrollBarUp.MouseOver then
		ScrollBarUp.MouseDown = true
		_of_DrawScrollBar(ScrollBarUp,false)
		_of_CaptureMouse(true)
		_of_TrackMouseHover(true,500)
		_of_ScrollUp()
		return 0
	end if
	
	if ScrollBarDown.MouseOver then
		ScrollBarDown.MouseDown = true
		_of_DrawScrollBar(ScrollBarDown,false)
		_of_CaptureMouse(true)
		_of_TrackMouseHover(true,500)
		_of_ScrollDown()
		return 0
	end if
end if

if _mouseOverIndex > 0 then
	_mouseDownIndex = _mouseOverIndex
	Panels[_mouseDownIndex].Event OnLButtonDown(vkey,xpos,ypos)
end if

return 0
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);if Not _MouseLeaveTracked or Timer.IsRunning(TM_SCROLL) then
	Event OnMouseMove(vkey,xpos,ypos)
end if

if ScrollBarUp.MouseOver or ScrollBarDown.MouseOver then
	Event OnLButtonDown(vKey,xpos,ypos)
else
	if _mouseOverIndex > 0 then
		_mouseDownIndex = _mouseOverIndex
		Panels[_mouseDownIndex].Event OnLButtonDBLClk(vkey,xpos,ypos)
	end if
end if

return 0
end event

event type long onerasebkgnd(unsignedlong hdc);if #LockUpdate then return 1

_of_FillBkgnd(hdc)

return 1
end event

event type long onnotify(n_cst_taskpanelbar_panel childpanel, long notifycode, long command);//来自子控件的消息
choose case notifyCode
	case NCD_UPDATEPOINTS
		of_UpdatePoints()
	case NCD_ANIMATION
		int index
		RECTF paintRect
		childPanel.of_GetPaintRect(ref paintRect)
		childPanel.Event OnReposition(ref paintRect)
		for index = of_GetIndex(childPanel) + 1 to UpperBound(Panels)
			if Not Panels[index].#Visible then continue
			Panels[index].Event OnScroll(command)
		next
		_EndPoint += command
		if Not _of_AdjustScrollPosition() then
			_of_UpdateScrollBarPoints()
		end if
		of_Redraw(false)
end choose

return 0
end event

public function integer of_getcount ();return UpperBound(Panels)
end function

public function integer of_getindex (readonly n_cst_taskpanelbar_panel panel);int index

if Not IsValidObject(panel) then return RetCode.E_INVALID_OBJECT

for index = 1 to UpperBound(Panels)
	if Panels[index] = panel then return index
next

return 0
end function

public function unsignedlong of_getsafedc ();//由子对象调用
ulong safeDC
RECTF adjustedRect

if #LockUpdate then return 0

safeDC = GetSafeDC()

if safeDC > 0 then
	adjustedRect = rcClient

	_of_AdjustRect(ref adjustedRect,ADJ_BORDER)
	Painter.IntersectClipRect(safeDC,adjustedRect)
	
	if ScrollBarUp.Visible then
		Painter.ExcludeClipRect(safeDC,ScrollBarUp.rcPaint)
	end if
	
	if ScrollBarDown.Visible then
		Painter.ExcludeClipRect(safeDC,ScrollBarDown.rcPaint)
	end if
end if

return safeDC
end function

private subroutine _of_capturemouse (readonly boolean capture);if _MouseCaptured = capture then return

_MouseCaptured = capture

if capture then
	Win32.SetCapture(#Handle)
else
	Win32.ReleaseCapture()
end if
end subroutine

private subroutine _of_trackmouseleave (readonly boolean track);TRACKMOUSEEVENT tme

if _MouseLeaveTracked = track then return

_MouseLeaveTracked = track

tme.cbsize = 16
tme.dwflags = Win32.TME_LEAVE
tme.hwndtrack = #Handle
tme.dwhovertime = 0

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(tme)
end subroutine

private subroutine _of_updatescrollbarpoints ();RECTF adjustedRect

adjustedRect = rcClient

_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if Ceiling(_StartPoint) < Ceiling(adjustedRect.top) then
	ScrollBarUp.visible = true
	ScrollBarUp.rcPaint.left 	= rcClient.left
	ScrollBarUp.rcPaint.right = rcClient.right
	ScrollBarUp.rcPaint.top 	= rcClient.top
	ScrollBarUp.rcPaint.bottom = SCROLLBARSIZE
else
	ScrollBarUp.visible = false
end if

if Ceiling(_EndPoint) > Ceiling(adjustedRect.bottom) then
	ScrollBarDown.visible = true
	ScrollBarDown.rcPaint.left 	= rcClient.left
	ScrollBarDown.rcPaint.right = rcClient.right
	ScrollBarDown.rcPaint.top 	= rcClient.bottom - SCROLLBARSIZE
	ScrollBarDown.rcPaint.bottom = rcClient.bottom
else
	ScrollBarDown.visible = false
end if
end subroutine

private subroutine _of_scrollup ();int index,nItemIndex
real offsetSize
boolean bNeedScroll
n_cst_taskpanelbar_baseitem item
RECTF paintRect,adjustedRect

if Not ScrollBarUp.visible then return

adjustedRect = rcClient
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if _smoothScrollSize > 0 then
	offsetSize = _smoothScrollSize
end if

for index = UpperBound(Panels) to 1 step -1
	if Not Panels[index].#Visible then continue
	Panels[index].of_GetPaintRect(ref paintRect)
	if index = _firstIndex then
		if paintRect.top + offsetSize < adjustedRect.top then
			bNeedScroll = true
		end if
	else
		if paintRect.top + offsetSize < ScrollBarUp.rcPaint.bottom + 1 then
			bNeedScroll = true
		end if
	end if
	if bNeedScroll then
		if Not Panels[index].#Collapsed then
			for nItemIndex = Panels[index].of_GetCount() to 1 step -1
				Panels[index].of_GetItem(nItemIndex,ref item)
				if Not item.#Visible then continue
				if item.#Type = item.ITT_SEPARATOR or item.#Type = item.ITT_SPACE or item.#Type = item.ITT_BREAK then continue
				item.of_GetPaintRect(ref paintRect)
				if paintRect.top + offsetSize < ScrollBarUp.rcPaint.bottom + 1 then
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

private subroutine _of_scrolldown ();int index,nCount,nItemIndex,nItemCount
real offsetSize
boolean bNeedScroll
n_cst_taskpanelbar_baseitem item
RECTF paintRect,adjustedRect

if Not ScrollBarDown.visible then return

adjustedRect = rcClient
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if _smoothScrollSize < 0 then
	offsetSize = _smoothScrollSize
end if

nCount = UpperBound(Panels)
for index = 1 to nCount
	if Not Panels[index].#Visible then continue
	Panels[index].of_GetPaintRect(ref paintRect)
	if index = _lastIndex then
		if paintRect.bottom + offsetSize > adjustedRect.bottom then
			bNeedScroll = true
		end if
	else
		if paintRect.bottom + offsetSize > ScrollBarDown.rcPaint.top - 1 then
			bNeedScroll = true
		end if
	end if
	if bNeedScroll then
		if Not Panels[index].#Collapsed then
			nItemCount = Panels[index].of_GetCount()
			for nItemIndex = 1 to nItemCount
				Panels[index].of_GetItem(nItemIndex,ref item)
				if Not item.#Visible then continue
				if item.#Type = item.ITT_SEPARATOR or item.#Type = item.ITT_SPACE or item.#Type = item.ITT_BREAK then continue
				item.of_GetPaintRect(ref paintRect)
				if paintRect.bottom + offsetSize > ScrollBarDown.rcPaint.top - 1 then
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

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC

if #LockUpdate then return RetCode.FAILED
if Not Visible then return RetCode.OK

safeDC=GetSafeDC()

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnPaint(safeDC)

if FadeAnimation then
	ReleaseDC(safeDC,0,#FadeTime)
else
	ReleaseDC(safeDC,0)
end if

return RetCode.OK
end function

private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly unsignedlong hdc);ulong borderColor,bkColor,arrowColor,nState
POINTF pt1,pt2,pt3
Constant real ARROWSIZE = 6

if Not Scrollbar.Visible then return

if ScrollBar.MouseOver then nState += Enums.STATE_HOVER
if ScrollBar.MouseDown then nState += Enums.STATE_PRESSED

bkColor = theme.of_GetColor(theme.CLR_SCROLLBARBKGND,nState)
borderColor = theme.of_GetColor(theme.CLR_SCROLLBARBORDER,nState)
arrowColor = theme.of_GetColor(theme.CLR_ARROW,nState)

Painter.ThemeFill(hdc,ScrollBar.rcPaint,bkColor,theme.#BkgndOrientation,theme.#ItemBkgndStyle,nState,false,&
								Enums.BS_SOLID,borderColor,0)
								
//Draw arrow
if ScrollBar = ScrollBarDown then		//箭头向下
	pt1.x = ScrollBar.rcPaint.left + (ScrollBar.rcPaint.right - ScrollBar.rcPaint.left - ARROWSIZE)/2
	pt1.y = ScrollBar.rcPaint.top + (ScrollBar.rcPaint.bottom - ScrollBar.rcPaint.top - ARROWSIZE / 2) / 2 
	pt2.x = pt1.x + ARROWSIZE
	pt2.y = pt1.y
	pt3.x = pt1.x + ARROWSIZE / 2
	pt3.y = pt1.y + ARROWSIZE / 2
else											//箭头向上
	pt1.x = ScrollBar.rcPaint.left + (ScrollBar.rcPaint.right - ScrollBar.rcPaint.left - ARROWSIZE)/2 + ARROWSIZE/2
	pt1.y = ScrollBar.rcPaint.top + (ScrollBar.rcPaint.bottom - ScrollBar.rcPaint.top - ARROWSIZE / 2 ) / 2
	pt2.x = pt1.x + ARROWSIZE / 2
	pt2.y = pt1.y + ARROWSIZE / 2
	pt3.x = pt1.x - ARROWSIZE / 2
	pt3.y = pt1.y + ARROWSIZE / 2
end if

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly boolean fadeanimation);ulong safeDC
RECTF adjustedRect

if #LockUpdate then return
if Not Visible then return
if Not ScrollBar.Visible then return

safeDC=GetSafeDC()

adjustedRect = rcClient
_of_AdjustRect(ref adjustedRect,ADJ_BORDER)

Painter.IntersectClipRect(safeDC,adjustedRect)

Painter.IntersectClipRect(safeDC,ScrollBar.rcPaint)

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnEraseBkgnd(safeDC)

_of_DrawScrollBar(ScrollBar,safeDC)

Painter.SelectClipRgn(safeDC,0)

ulong hUpdateRgn

hUpdateRgn = Painter.CreateRectRgn(ScrollBar.rcPaint)

if FadeAnimation then
	ReleaseDC(safeDC,hUpdateRgn,#FadeTime)
else
	ReleaseDC(safeDC,hUpdateRgn)
end if

Painter.DeleteRgn(hUpdateRgn)
end subroutine

private function boolean _of_adjustscrollposition ();RECTF adjustedRect

if _ScrollPosition = 0 then return false

adjustedRect = rcClient

_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if _EndPoint < adjustedRect.bottom and _ScrollPosition < 0 then
	_of_ScrollPosition(adjustedRect.bottom - _EndPoint)
	return true
end if

return false
end function

public function long of_getpanel (readonly integer index, ref n_cst_taskpanelbar_panel panel);if index < 1 or index > UpperBound(Panels) then return RetCode.E_OUT_OF_BOUND

panel = Panels[index]

return iif(IsValidObject(panel),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime);if hdc = 0 then return false

Painter.SelectClipRgn(hdc,0)

return ReleaseDC(hdc,hrgn,FadeTime)
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation);if FadeAnimation then
	return of_ReleaseDC(hdc,hrgn,#FadeTime)
else
	return of_ReleaseDC(hdc,hrgn,0)
end if
end function

private subroutine _of_updatepoints ();int index
real ypos
RECTF adjustedRect,paintRect

if #LockUpdate then return

adjustedRect = rcClient

_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

ypos = adjustedRect.top
ypos += _ScrollPosition
_StartPoint = ypos

_firstIndex = 0
_lastIndex = 0

for index = 1 to UpperBound(Panels)
	if Not Panels[index].#Visible then continue
	paintRect.left = adjustedRect.left
	paintRect.top = ypos
	Panels[index].Event OnReposition(ref paintRect)
	_EndPoint = paintRect.bottom
	ypos = paintRect.bottom + theme.#PanelMargin
	
	if _firstIndex = 0 then
		_firstIndex = index
	end if
	_lastIndex = index
next

if Not _of_AdjustScrollPosition() then
	_of_UpdateScrollBarPoints()
end if
end subroutine

public function long of_remove (readonly integer index);int i
boolean bVisible
n_cst_taskpanelbar_panel	newPanels[]

if index < 1 or index > UpperBound(Panels) then return RetCode.E_OUT_OF_BOUND

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

public function long of_updatepoints ();if #LockUpdate then return RetCode.FAILED

_of_UpdatePoints()
of_Redraw(false)

return RetCode.OK
end function

public function long of_removeall ();int i
n_cst_taskpanelbar_panel	emptyPanels[]

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

of_UpdatePoints()

return RetCode.OK
end function

public function n_cst_taskpanelbar_panel of_insertpanel (readonly integer index);return of_InsertPanel(index,"","")
end function

public function n_cst_taskpanelbar_panel of_addpanel (readonly string title);return of_AddPanel(title,"",false)
end function

private subroutine _of_fillbkgnd (readonly unsignedlong hdc);ulong transparentColor

transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,0)
//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, rcClient,  transparentColor,false,0) 
end if

Painter.ThemeFill( hdc, rcClient, theme.of_GetColor(theme.CLR_BKGND,0),theme.#BkgndOrientation,theme.#BkgndStyle,0,false,&
										theme.#BorderStyle,theme.of_GetColor(theme.CLR_BORDER,0),theme.#RoundSize)
end subroutine

private subroutine _of_updatepanellayouts ();int index
RECTF layoutRect

layoutRect = rcClient
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if layoutRect.right - layoutRect.left <= 0 then return

for index = 1 to UpperBound(Panels)
	Panels[index].Event OnUpdateLayout(layoutRect.right - layoutRect.left)
next
end subroutine

public function n_cst_taskpanelbar_panel of_insertpanel (readonly integer index, readonly string title, readonly string image, readonly boolean collapsed);int i
n_cst_taskpanelbar_panel panel
RECTF layoutRect

if index < 1 or index > UpperBound(Panels) + 1 then return panel

panel = Create n_cst_taskpanelbar_panel
panel.Event OnInit(this,_ToolTip,_PanelImageList,_ItemImageList)

if Not panel.Event OnInitData(title,image,collapsed) then
	Destroy panel
	SetNull(panel)
	return panel
end if
 
layoutRect = rcClient
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

panel.Event OnUpdateLayout(layoutRect.right - layoutRect.left)

for i = UpperBound(Panels) + 1 to index + 1 step -1
	Panels[i] = Panels[i - 1]
next
Panels[index] = panel

of_UpdatePoints()

return panel
end function

public function n_cst_taskpanelbar_panel of_insertpanel (readonly integer index, readonly string title, readonly string image);return of_InsertPanel(index,title,image,false)
end function

public function n_cst_taskpanelbar_panel of_insertpanel (readonly integer index, readonly string title);return of_InsertPanel(index,title,"",false)
end function

public function n_cst_taskpanelbar_panel of_addpanel (readonly string title, readonly string image, readonly boolean collapsed);return of_InsertPanel(UpperBound(Panels)+1,title,image,collapsed)
end function

public function n_cst_taskpanelbar_panel of_addpanel (readonly string title, readonly string image);return of_AddPanel(title,image,false)
end function

private subroutine _of_trackmousehover (readonly boolean track, readonly long hovertime);TRACKMOUSEEVENT tme

tme.cbsize = 16
tme.dwflags = Win32.TME_HOVER
tme.hwndtrack = #Handle
tme.dwhovertime = hoverTime

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(TME)

_MouseHoverTracked = track
end subroutine

public function long of_finditembytag (readonly string stag, ref n_cst_taskpanelbar_baseitem founditem);int index
boolean bFound

if Len(sTag) = 0 then return RetCode.E_INVALID_ARGUMENT

for index = 1 to UpperBound(Panels)
	if IsSucceeded(Panels[index].of_FindItemByTag(sTag,ref foundItem)) then
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

public function long of_finditembytext (readonly string txt, ref n_cst_taskpanelbar_baseitem founditem);int index
boolean bFound

if Len(txt) = 0 then return RetCode.E_INVALID_ARGUMENT

for index = 1 to UpperBound(Panels)
	if IsSucceeded(Panels[index].of_FindItemByText(txt,ref foundItem)) then
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

public function long of_findpanelbytag (readonly string stag, ref n_cst_taskpanelbar_panel foundpanel);int index
boolean bFound
n_cst_taskpanelbar_panel panel

if Len(sTag) = 0 then return RetCode.E_INVALID_ARGUMENT

for index = 1 to UpperBound(Panels)
	if Panels[index].#Tag = sTag then
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

public function long of_scrollto (readonly integer index, readonly long flag);real scrollSize
RECTF paintRect,adjustedRect

if index < 1 or index > UpperBound(Panels) then return RetCode.E_OUT_OF_BOUND
if Not Panels[index].#Visible then return RetCode.FAILED
if Not ScrollBarUp.Visible and Not ScrollBarDown.Visible then return RetCode.FAILED

adjustedRect = rcClient
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)
		
Panels[index].of_GetPaintRect(ref paintRect)

choose case flag
	case Enums.SF_FORWARD
		if ScrollBarDown.Visible then
			if index = _lastIndex then
				if paintRect.bottom > adjustedRect.bottom then
					scrollSize = adjustedRect.bottom - paintRect.bottom
				end if
			else
				if paintRect.bottom > ScrollBarDown.rcPaint.top - 1 then
					scrollSize = (ScrollBarDown.rcPaint.top - 1) - paintRect.bottom
				end if
			end if
		end if
	case Enums.SF_BACKWARD
		if ScrollBarUp.Visible then
			if index = _firstIndex then
				if paintRect.top < adjustedRect.top then
					scrollSize = adjustedRect.top - paintRect.top
				end if
			else
				if paintRect.top < ScrollBarUp.rcPaint.bottom + 1 then
					scrollSize = (ScrollBarUp.rcPaint.bottom + 1) - paintRect.top
				end if
			end if
		end if
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

if scrollSize <> 0 then
	if #SmoothScroll then
		_smoothScrollSize = scrollSize
		Timer.Start(TM_SCROLL,TMI_SCROLL)
	else
		_of_ScrollPosition(scrollSize)
		of_Redraw(false)
		if _MouseLeaveTracked then
			POINTF pt
			
			Painter.GetCursorPos(ref pt)
			Painter.ScreenToClient(#Handle,ref pt)
			
			Event OnMouseMove(0,pt.x,pt.y)
		end if
	end if
	SetNull(_LastScrollPosition)
	return RetCode.OK
else
	if _smoothScrollSize > 0 then
		_smoothScrollSize = 0
		Timer.Stop(TM_SCROLL)
		SetNull(_LastScrollPosition)
	end if
	return RetCode.FAILED
end if
end function

public function long of_scrollto (readonly integer index);long rtCode

rtCode = RetCode.FAILED
if ScrollBarDown.Visible then
	rtCode = of_ScrollTo(index,Enums.SF_FORWARD)
end if
if rtCode = RetCode.FAILED then
	if ScrollBarUp.Visible then
		rtCode = of_ScrollTo(index,Enums.SF_BACKWARD)
	end if
end if

return rtCode
end function

public function long of_scrollto (readonly n_cst_taskpanelbar_baseitem item, readonly long flag);real scrollSize
RECTF paintRect,adjustedRect

if Not IsValidObject(item) then return RetCode.E_INVALID_OBJECT
if item.#ParentTaskPanelBar <> this then return RetCode.E_INVALID_ARGUMENT
if Not item.#Visible then return RetCode.FAILED
if Not ScrollBarUp.Visible and Not ScrollBarDown.Visible then return RetCode.OK

adjustedRect = rcClient
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

item.of_GetPaintRect(ref paintRect)

choose case flag
	case Enums.SF_FORWARD
		if ScrollBarDown.Visible then
			if paintRect.bottom > ScrollBarDown.rcPaint.top - 1 then
				scrollSize = (ScrollBarDown.rcPaint.top - 1) - paintRect.bottom
			end if
		end if
	case Enums.SF_BACKWARD
		if ScrollBarUp.Visible then
			if paintRect.top < ScrollBarUp.rcPaint.bottom + 1 then
				scrollSize = (ScrollBarUp.rcPaint.bottom + 1) - paintRect.top
			end if
		end if
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

if scrollSize <> 0 then
	if #SmoothScroll then
		_smoothScrollSize = scrollSize
		Timer.Start(TM_SCROLL,TMI_SCROLL)
	else
		_of_ScrollPosition(scrollSize)
		of_Redraw(false)
		if _MouseLeaveTracked then
			POINTF pt
			
			Painter.GetCursorPos(ref pt)
			Painter.ScreenToClient(#Handle,ref pt)
			
			Event OnMouseMove(0,pt.x,pt.y)
		end if
	end if
	SetNull(_LastScrollPosition)
	return RetCode.OK
else
	if _smoothScrollSize > 0 then
		_smoothScrollSize = 0
		Timer.Stop(TM_SCROLL)
		SetNull(_LastScrollPosition)
	end if
	return RetCode.FAILED
end if
end function

public function long of_scrollto (readonly n_cst_taskpanelbar_baseitem item);long rtCode

rtCode = RetCode.FAILED
if ScrollBarDown.Visible then
	rtCode = of_ScrollTo(item,Enums.SF_FORWARD)
end if
if rtCode = RetCode.FAILED then
	if ScrollBarUp.Visible then
		rtCode = of_ScrollTo(item,Enums.SF_BACKWARD)
	end if
end if

return rtCode
end function

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if BitAND(flags,ADJ_BORDER) > 0 then
	if theme.#BorderStyle = Enums.BS_SOLID then
		fBorderSize = P2DX(1)
		Painter.InflateRect(ref adjRect,-fBorderSize,-fBorderSize)
	end if
end if

if BitAND(flags,ADJ_BORDERMARGIN) > 0 then
	adjRect.left += theme.#BorderMargin.left
	adjRect.top += theme.#BorderMargin.top
	adjRect.right -= theme.#BorderMargin.right
	adjRect.bottom -= theme.#BorderMargin.bottom
end if
end subroutine

public function integer of_indexfrompoint (readonly real xpos, readonly real ypos);int index

if Not Painter.PtInRect(rcClient,xpos,ypos) then return 0

if ScrollBarUp.Visible then
	if Painter.PtInRect(ScrollBarUp.rcPaint,xpos,ypos) then
		return IDX_SCROLLBARUP
	end if
end if

if ScrollBarDown.Visible then
	if Painter.PtInRect(ScrollBarDown.rcPaint,xpos,ypos) then
		return IDX_SCROLLBARDOWN
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

private subroutine _of_scrollposition (readonly real scrollsize);int	index
real scrollPosition
RECTF adjustedRect

if scrollSize = 0 then return

adjustedRect = rcClient
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

scrollPosition = _ScrollPosition

if scrollSize > 0 then
	if _StartPoint + scrollSize < adjustedRect.top then
		_ScrollPosition += scrollSize
	else
		_ScrollPosition = 0
	end if
elseif scrollSize < 0 then
	if adjustedRect.bottom - _EndPoint < scrollSize then
		_ScrollPosition += scrollSize
	else
		_ScrollPosition += adjustedRect.bottom - _EndPoint 
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

on u_cst_taskpanelbar.create
call super::create
this.timer=create timer
this.theme=create theme
end on

on u_cst_taskpanelbar.destroy
call super::destroy
destroy(this.timer)
destroy(this.theme)
end on

event oninit;call super::oninit;_PanelImageList = Create n_imagelist
_ItemImageList = Create n_imagelist

_PanelImageList.ShareImage(true)
_ItemImageList.ShareImage(true)

_PanelImageList.SetImageSize(theme.#PanelIconSize.cx,theme.#PanelIconSize.cy)
_ItemImageList.SetImageSize(theme.#ItemIconSize.cx,theme.#ItemIconSize.cy)

_ToolTip = Create n_tooltip
_ToolTip.CreateToolTip(#Handle)

SetNull(_LastScrollPosition)

Painter.GetClientRect(#Handle,ref rcClient)
end event

event onuninit;call super::onuninit;int index

for index = 1 to UpperBound(Panels)
	Destroy Panels[index]
next

Destroy _PanelImageList
Destroy _ItemImageList
Destroy _ToolTip
Timer.StopAll()
end event

type uo_logo from u_cst_canvas`uo_logo within u_cst_taskpanelbar
string tag = "TaskPanelBar"
end type

type timer from n_timer within u_cst_taskpanelbar descriptor "pb_nvo" = "true" 
end type

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

event ontimer;call super::ontimer;if id = TM_SCROLL then
	real scrollSize
	
	if _smoothScrollSize = 0 or (Not ScrollBarUp.Visible and Not ScrollBarDown.Visible) then
		_smoothScrollSize = 0
		return false
	end if
	
	if _smoothScrollSize > 0 and ScrollBarUp.Visible then
		scrollSize = Ceiling(_smoothScrollSize / 10) + 2//10
		if _smoothScrollSize - scrollSize < 0 then
			scrollSize = _smoothScrollSize
		end if
		_smoothScrollSize -= scrollSize
	end if
	
	if _smoothScrollSize < 0 and ScrollBarDown.Visible then
		scrollSize = Ceiling(_smoothScrollSize / 10) - 2//10
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
		RECTF wndRect
		POINTF pt
		
		_smoothScrollSize = 0
		
		Painter.GetWindowRect(#Handle,ref wndRect)
		Painter.GetCursorPos(ref pt)
		Event OnMouseMove(0,pt.x - wndRect.left,pt.y - wndRect.top)
		//Stop timer
		return false
	end if
	
	return true
end if

return false
end event

type theme from n_cst_taskpanelbar_theme within u_cst_taskpanelbar descriptor "pb_nvo" = "true" 
end type

on theme.create
call super::create
end on

on theme.destroy
call super::destroy
end on

event ongetitemcolor;call super::ongetitemcolor;Parent.Event OnGetItemColor(item,colorFlag,state,ref color)
end event

event ongetpanelcolor;call super::ongetpanelcolor;Parent.Event OnGetPanelColor(panel,colorFlag,state,ref color)
end event

event ongetcolor;call super::ongetcolor;Parent.Event OnGetColor(colorFlag,state,ref color)
end event

event onthemechanged;call super::onthemechanged;int index
boolean dirty,panelEvent,layoutChanged

choose case eventFlag
	case EVT_THEME
		dirty = true
		panelEvent = true
		layoutChanged = true
		_ScrollPosition = 0
	case EVT_BORDERSTYLE
		dirty = true
		layoutChanged = true
	case theme.EVT_PANELICONPOSITION
		panelEvent = true
	case theme.EVT_PANELARROWPOSITION
		panelEvent = true
	case EVT_PANELBORDERSTYLE
		dirty = true
		panelEvent = true
	case EVT_ITEMBORDERSTYLE
		dirty = true
		panelEvent = true
	case EVT_PANELMARGIN
		dirty = true
	case EVT_PANELICONSIZE
		dirty = true
		panelEvent = true
		_PanelImageList.SetImageSize(#PanelIconSize.cx,#PanelIconSize.cy)
	case EVT_ITEMICONSIZE
		dirty = true
		panelEvent = true
		_ItemImageList.SetImageSize(#ItemIconSize.cx,#ItemIconSize.cy)
	case EVT_BORDERMARGIN
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

Parent.Event OnThemeChanged(eventFlag)
end event

event ongettoolbaritemcolor;call super::ongettoolbaritemcolor;Parent.Event OnGetToolBarItemColor(toolbar,index,colorFlag,state,ref color)
end event

