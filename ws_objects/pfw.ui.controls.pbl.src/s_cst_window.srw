$PBExportHeader$s_cst_window.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type s_cst_window from window
end type
type toolbar from n_cst_window_toolbar within s_cst_window
end type
type menubar from n_cst_window_menubar within s_cst_window
end type
type statusbar from n_cst_window_statusbar within s_cst_window
end type
type captionbar from n_cst_window_titlebar within s_cst_window
end type
type timer from n_timer within s_cst_window
end type
type theme from n_cst_window_theme within s_cst_window
end type
end forward

global type s_cst_window from window
integer width = 1518
integer height = 1120
boolean titlebar = true
string title = "PowerFramework"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean toolbarvisible = false
boolean clientedge = true
boolean center = true
event onthemechanged ( unsignedinteger eventflag )
event ongetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event onpostopen ( )
event oncapturechanged ( )
event onncmouseleave ( )
event type long onncpaint ( unsignedlong hdc )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event type long onncmousemove ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onnccalcsize ( unsignedlong lpcrect )
event type long onnclbuttondown ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onncrbuttondown ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event type long onnchittest ( real xpos,  real ypos )
event type long onwindowsizing ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long onwindowsize ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long ongetminmaxinfo ( ref real maximizedx,  ref real maximizedy,  ref real maximizedwidth,  ref real maximizedheight,  ref real minwidth,  ref real minheight )
event ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  unsignedinteger objecttype,  ref unsignedlong color )
event onbuttonclicked ( integer index,  unsignedinteger objecttype )
event type long onbuttonclicking ( integer index,  unsignedinteger objecttype )
event onbuttonmouseenter ( integer index,  real xpos,  real ypos,  unsignedinteger objecttype )
event onbuttonmouseleave ( integer index,  unsignedinteger objecttype )
event onbuttonmousemove ( integer index,  real xpos,  real ypos,  unsignedinteger objecttype )
event type unsignedlong ongetwindowrgn ( real newwidth,  real newheight )
event type long onpaint ( unsignedlong hdc )
event type long onsettext ( string text )
event type long oniconchanged ( unsignedlong hicon )
event type long onncactivate ( boolean active )
event type long onsystembuttonchanged ( )
event type long onmenuselecting ( integer index,  integer id,  unsignedinteger objecttype )
event onmenuselected ( integer index,  integer id,  unsignedinteger objecttype )
event type long onpopupmenu ( integer index,  ref real xpos,  ref real ypos,  ref unsignedlong flags,  unsignedinteger objecttype )
event type boolean ontimer ( unsignedinteger id )
event onpreopen ( )
event type long onnclbuttondblclk ( unsignedlong hittestcode,  real xpos,  real ypos )
event onbuttonmousedown ( integer index,  real xpos,  real ypos,  unsignedinteger objecttype )
event onbuttonmouseup ( integer index,  real xpos,  real ypos,  unsignedinteger objecttype )
event type long onncerasebkgnd ( unsignedlong hdc )
event type long oncapturemouse ( boolean capture,  unsignedinteger objecttype )
event type long onmdiclientreposition ( ref real newx,  ref real newy,  ref real newwidth,  ref real newheight )
event type long onkeydown ( unsignedinteger nchar,  unsignedinteger nrepcnt,  unsignedlong flags )
event type long onmenuchar ( unsignedinteger nchar,  unsignedinteger nflags,  unsignedlong hmenu )
event onpreclose ( )
event type long onerasebkgnd ( unsignedlong hdc )
event type long ondrawscrollbar ( unsignedlong hdc,  unsignedlong lpsbdi,  boolean bvert,  long flags )
event type long oncreatescrollbar ( unsignedlong lpsbci,  boolean bvert )
event type long onclosequery ( )
event type long onclose ( )
event onopen pbm_open
event onprivc pbm_close
event onprivcq pbm_closequery
event onmdiclientgetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event onmdiclientgetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type long onmdiclientthemechanging ( unsignedinteger eventflag,  n_cst_window_mdiclient_theme newtheme )
event onmdiclientthemechanged ( unsignedinteger eventflag )
event type long onmdiclienterasebkgnd ( unsignedlong hdc )
event type long onmdichildactivate ( unsignedlong hwnddeactivated,  unsignedlong hwndactivated )
event onmdichilddestroy ( unsignedlong hwndchild )
event type long onmdiclientncerasebkgnd ( unsignedlong hdc )
toolbar toolbar
menubar menubar
statusbar statusbar
captionbar captionbar
timer timer
theme theme
end type
global s_cst_window s_cst_window

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
//Window object types
Constant Int WOT_TITLEBAR		= 1
Constant Int WOT_STATUSBAR	= 2
Constant Int WOT_MENUBAR		= 3
Constant Int WOT_TOOLBAR		= 4

/*--- Properties ---*/
Public:
PrivateWrite n_cst_window_mdiclient 	MDIClient
PrivateWrite Ulong 							#Handle
PrivateWrite s_cst_window					#ParentWindow
Boolean											#LockUpdate				= false
Boolean											#FadeAnimation			= true
Uint												#FadeTime					= 250		//ms
Uint												#FlashFadeTime			= 1500	//ms
ProtectedWrite Boolean						#ExtendFrameIntoClient	= false
ProtectedWrite Boolean						#BorderShadow			= false
Real												#MinWidth					= 100		//px
Real												#MinHeight					= 100		//px
Boolean 											#ToolTip 					= true

/*--- Implementation ---*/
Private:
n_canvas		_Canvas
n_tooltip		_ToolTip
RECTF			rcWnd
RECTF			rcTitleBar

n_cst_window_menubar _currentMenuBar
n_cst_window_toolbar	_currentToolBar

Long _lastHitTestCode

Boolean 	_Active 						= true
Boolean 	_MouseLeaveTracked 	= false
Uint		_MouseCaptured			= 0

Boolean _CloseFlag

//Graphic objects
GraphicObject _drawObjects[]

//Hit-test code
Constant Uint HTTITLEBAR		= 100
Constant Uint HTMENUBAR		= 101
Constant Uint HTSTATUSBAR	= 102
Constant Uint HTTOOLBAR		= 103
//Adjust flags
Constant Uint ADJ_BORDER 	= 1
//Timer ID
Constant Uint TM_USER	= 0
//Sizes
Constant Real WINDOWMINWIDTH 	= 200 //px
Constant Real WINDOWMINHEIGHT 	= 100 //px
end variables

forward prototypes
private subroutine _wf_initial ()
private subroutine _wf_trackncmouseleave (readonly boolean track)
private subroutine _wf_uninitial ()
public function long wf_redraw (readonly boolean fadeanimation)
public function long wf_redraw (readonly boolean drawclient, readonly boolean fadeanimation)
private function boolean _wf_isiconic ()
public function integer wf_getsheetcount ()
public function integer wf_getsheetindex (readonly s_cst_window sheet)
public function long wf_getsheet (readonly integer index, ref s_cst_window sheet)
public function long wf_getsheets (ref s_cst_window sheets[])
public function long wf_activatesheet (readonly integer index)
public function long wf_arrangesheets (readonly arrangetypes atype)
public function long wf_closesheet (readonly integer index)
public function long wf_closesheets ()
public function integer wf_opensheet (ref s_cst_window sheet, readonly arrangeopen aopentype)
public function boolean wf_isactivesheetmaximized ()
public function long wf_getactivesheet (ref s_cst_window sheet)
public function boolean wf_ismaximized ()
public function boolean wf_isminimized ()
public function integer wf_opensheet (ref s_cst_window sheet)
public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly string wndtype)
public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly arrangeopen aopentype)
public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm)
public function long wf_timer (readonly double interval)
public function boolean wf_isactive ()
public function long wf_setwindowstateasync (readonly windowstate newstate)
public function long wf_setwindowstate (readonly windowstate newstate)
public function long wf_updatepoints ()
public function boolean wf_ischildwindow ()
public function boolean wf_ismdiwindow ()
public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly string wndtype, readonly integer indexbefore, readonly arrangeopen aopentype)
public function integer wf_opensheet (ref s_cst_window sheet, readonly string wndtype, integer indexbefore, readonly arrangeopen aopentype)
public function integer wf_opensheet (ref s_cst_window sheet, readonly string wndtype)
public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly string wndtype, readonly integer indexbefore)
public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly integer indexbefore, readonly arrangeopen aopentype)
public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly integer indexbefore)
public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly string wndtype, readonly arrangeopen aopentype)
public function integer wf_opensheet (ref s_cst_window sheet, readonly string wndtype, readonly integer indexbefore)
public function integer wf_opensheet (ref s_cst_window sheet, readonly string wndtype, readonly arrangeopen aopentype)
public function integer wf_opensheet (ref s_cst_window sheet, readonly integer indexbefore, readonly arrangeopen aopentype)
public function integer wf_opensheet (ref s_cst_window sheet, readonly integer indexbefore)
public function long wf_closesheet (readonly s_cst_window sheet)
public function boolean wf_issheet ()
public function n_cst_window_menubar wf_getcurrentmenubar ()
public function n_cst_window_toolbar wf_getcurrenttoolbar ()
public function long wf_timer (readonly unsignedlong id, readonly double interval)
public function boolean wf_istimerrunning (readonly unsignedlong id)
public function double wf_gettimerinterval (readonly unsignedlong id)
public function unsignedlong wf_getstate ()
public function boolean wf_istoolbarvisible ()
public function boolean wf_istitlebarvisible ()
public function boolean wf_ismenubarvisible ()
public function boolean wf_isstatusbarvisible ()
public function integer wf_changemenu (ref menu m)
private subroutine _wf_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
public function long wf_getclientrect (ref rectf clirect, readonly boolean relativewindow)
private function real _wf_getminheight ()
private function real _wf_getminwidth ()
private function real _wf_getstatusbarheight ()
private function real _wf_gettitlebarheight ()
private function real _wf_gettitlebarheight (readonly boolean includemenubar, readonly boolean includetoolbar)
private subroutine _wf_fillbkgnd (readonly unsignedlong hdc, ref rectf rcpaint, readonly boolean nonclient)
end prototypes

event oncapturechanged();choose case _MouseCaptured
	case WOT_TITLEBAR
		CaptionBar.Event OnCaptureChanged()
	case WOT_TOOLBAR
		_currentToolBar.Event OnCaptureChanged()
	case WOT_STATUSBAR
		StatusBar.Event OnCaptureChanged()
end choose
_MouseCaptured = 0
end event

event onncmouseleave();choose case _lastHitTestCode
	case HTTITLEBAR
		if _MouseCaptured <> WOT_TITLEBAR then
			CaptionBar.Event OnMouseLeave()
			_lastHitTestCode = 0
		end if
	case HTMENUBAR
		if _MouseCaptured <> WOT_MENUBAR then
			_currentMenuBar.Event OnMouseLeave()
			_lastHitTestCode = 0
		end if
	case HTTOOLBAR
		if _MouseCaptured <> WOT_TOOLBAR then
			_currentToolBar.Event OnMouseLeave()
			_lastHitTestCode = 0
		end if
	case HTSTATUSBAR
		if _MouseCaptured <> WOT_STATUSBAR then
			StatusBar.Event OnMouseLeave()
			_lastHitTestCode = 0
		end if
	case else
		_lastHitTestCode = 0
end choose

_wf_TrackNcMouseLeave(false)
end event

event type long onncpaint(unsignedlong hdc);real fBorderSize
RECTF wndRect,cliRect

if #LockUpdate then return 1
if Not Border then return 1

Event OnNcEraseBkgnd(hdc)

wndRect = rcWnd
_wf_AdjustRect(ref wndRect,ADJ_BORDER)
Painter.IntersectClipRect(hdc,wndRect)

if wf_IsTitleBarVisible() then
	if Not (wf_IsSheet() and Win32.IsZoomed(#Handle)) then
		CaptionBar.Event OnPaint(hdc)
	end if
end if

if Not _wf_IsIconic() then
	if wf_IsMenuBarVisible() then
		_currentMenuBar.Event OnPaint(hdc)
	end if
	if wf_IsToolBarVisible() then
		_currentToolBar.Event OnPaint(hdc)
	end if
	if wf_IsStatusBarVisible() then
		StatusBar.Event OnPaint(hdc)
	end if
	if ClientEdge then
		wf_GetClientRect(ref cliRect,true)
		fBorderSize = P2DX(1)
		Painter.InflateRect(ref cliRect,fBorderSize,fBorderSize)
		Painter.DrawThemeBorder(hdc,cliRect,theme.of_GetColor(theme.CLR_BORDER,wf_GetState()),theme.#BkgndStyle,Enums.BS_SOLID,0)
	end if
end if

Painter.SelectClipRgn(hdc,0)

return 1
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);RECTF wndRect
POINTF pt

if _MouseCaptured = 0 and Not _currentMenuBar.of_IsPopupMenuMode() then return 0
	
Painter.GetWindowRect(#Handle,ref wndRect)
Painter.GetCursorPos(ref pt)
pt.x -= wndRect.left
pt.y -= wndRect.top

if _currentMenuBar.of_IsPopupMenuMode() then
	return _currentMenuBar.Event OnMouseMove(vkey,pt.x,pt.y)
else
	choose case _MouseCaptured
		case WOT_TITLEBAR
			return CaptionBar.Event OnMouseMove(vkey,pt.x,pt.y)
		case WOT_MENUBAR
			return _currentMenuBar.Event OnMouseMove(vkey,pt.x,pt.y)
		case WOT_TOOLBAR
			return _currentToolBar.Event OnMouseMove(vkey,pt.x,pt.y)
		case WOT_STATUSBAR
			return StatusBar.Event OnMouseMove(vkey,pt.x,pt.y)
	end choose
end if

return 0
end event

event type long onncmousemove(unsignedlong hittestcode, real xpos, real ypos);if Not _MouseLeaveTracked then
	_wf_TrackNcMouseLeave(true)
end if

choose case hitTestCode
	case HTTITLEBAR, WinMsg.HTCAPTION, WinMsg.HTSYSMENU
		hitTestCode = HTTITLEBAR
end choose

if hitTestCode <> _lastHitTestCode then
	choose case _lastHitTestCode
		case HTTITLEBAR
			CaptionBar.Event OnMouseLeave()
		case HTMENUBAR
			_currentMenuBar.Event OnMouseLeave()
		case HTTOOLBAR
			_currentToolBar.Event OnMouseLeave()
		case HTSTATUSBAR
			StatusBar.Event OnMouseLeave()
	end choose
	_lastHitTestCode = hitTestCode
end if

choose case hitTestCode
	case HTTITLEBAR
		return CaptionBar.Event OnMouseMove(0,xpos,ypos)
	case HTMENUBAR
		return _currentMenuBar.Event OnMouseMove(0,xpos,ypos)
	case HTTOOLBAR
		return _currentToolBar.Event OnMouseMove(0,xpos,ypos)
	case HTSTATUSBAR
		return StatusBar.Event OnMouseMove(0,xpos,ypos)
end choose

return 0
end event

event type long onnccalcsize(unsignedlong lpcrect);real fBorderSize
RECTF cRect

Painter.CopyRect(ref cRect,lpcRect)

if _wf_IsIconic() then
	Painter.SetRectEmpty(ref cRect)
else
	if Border then
		cRect.left += theme.#BorderMargin.left
		cRect.top += _wf_GetTitleBarHeight()
		cRect.right -= theme.#BorderMargin.right
		cRect.bottom -= _wf_GetStatusBarHeight()
	end if
	
	if ClientEdge then
		fBorderSize = P2DX(1)
		Painter.InflateRect(ref cRect,-fBorderSize,-fBorderSize)
	end if
end if

Painter.CopyRect(lpcRect,ref cRect)

return 0
end event

event type long onnclbuttondown(unsignedlong hittestcode, real xpos, real ypos);if Not _MouseLeaveTracked  then
	Event	OnNcMouseMove(hittestcode,xpos,ypos)
end if
/*
if HitTestCode = WinMsg.HTMENU then
	return 1
end if
*/
choose case hitTestCode
	case HTTITLEBAR
		return CaptionBar.Event OnLButtonDown(0,xpos,ypos)
	case HTMENUBAR
		return _currentMenuBar.Event OnLButtonDown(0,xpos,ypos)
	case HTTOOLBAR
		return _currentToolBar.Event OnLButtonDown(0,xpos,ypos)
	case HTSTATUSBAR
		return StatusBar.Event OnLButtonDown(0,xpos,ypos)
end choose

return 0
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if _MouseCaptured = 0 then return 0

choose case _MouseCaptured
	case WOT_TITLEBAR
		CaptionBar.Event OnLButtonUp(vkey,xpos,ypos)
	case WOT_TOOLBAR
		_currentToolBar.Event OnLButtonUp(vkey,xpos,ypos)
	case WOT_STATUSBAR
		StatusBar.Event OnLButtonUp(vkey,xpos,ypos)
end choose

_wf_TrackNcMouseLeave(true)

return 0
end event

event type long onnchittest(real xpos, real ypos);int hitCode
Constant real BORDERSIZE = 4

if Not Border then return WinMsg.HTCLIENT

if Resizable and Not wf_IsMaximized() and Not _wf_IsIconic() then
	if xpos >= 0 and xpos <= BORDERSIZE and ypos >= 0 and ypos <= BORDERSIZE then
		return WinMsg.HTTOPLEFT
	end if
	if xpos >= rcWnd.Right - BORDERSIZE and xpos <= rcWnd.Right and ypos >= 0 and ypos <= BORDERSIZE then
		return WinMsg.HTTOPRIGHT
	end if
	if xpos >= 0 and xpos <= BORDERSIZE and ypos >= rcWnd.Bottom - BORDERSIZE and ypos <= rcWnd.Bottom then
		return WinMsg.HTBOTTOMLEFT
	end if
	if xpos >= rcWnd.Right - BORDERSIZE and xpos <= rcWnd.Right and ypos >= rcWnd.Bottom - BORDERSIZE and ypos <= rcWnd.Bottom then
		return WinMsg.HTBOTTOMRIGHT
	end if
	if xpos >= 0 and xpos <= rcWnd.Right and ypos >= 0 and ypos <= BORDERSIZE then
		return WinMsg.HTTOP
	end if
	if xpos >= 0 and xpos <= BORDERSIZE and ypos >= BORDERSIZE and ypos <= rcWnd.Bottom - BORDERSIZE then
		return WinMsg.HTLEFT
	end if
	if xpos >= rcWnd.Right - BORDERSIZE and xpos <= rcWnd.Right and +&
		ypos >= BORDERSIZE and ypos <= rcWnd.Bottom - BORDERSIZE then
		return WinMsg.HTRIGHT
	end if
	if xpos >= 0 and xpos <= rcWnd.Right and ypos >= rcWnd.Bottom - BORDERSIZE and ypos <= rcWnd.Bottom then
		return WinMsg.HTBOTTOM
	end if
end if

if wf_IsTitleBarVisible() then
	hitCode = CaptionBar.Event OnHitTest(xpos,ypos)
	if hitCode > 0 then
		return hitCode
	end if
end if

if Not _wf_IsIconic() then
	if wf_IsMenuBarVisible() then
		hitCode = _currentMenuBar.Event OnHitTest(xpos,ypos)
		if hitCode > 0 then
			return hitCode
		end if
	end if
	if wf_IsToolBarVisible() then
		hitCode = _currentToolBar.Event OnHitTest(xpos,ypos)
		if hitCode > 0 then
			return hitCode
		end if
	end if
	if wf_IsStatusBarVisible() then
		hitCode = StatusBar.Event OnHitTest(xpos,ypos)
		if hitCode > 0 then
			return hitCode
		end if
	end if
end if

long nvl
SetNull(nvl)
return nvl
end event

event type long onwindowsizing(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);rcWnd.right 		= newWidth
rcWnd.bottom 	= newHeight

if wf_IsTitleBarVisible() then
	rcTitleBar.right 		= newWidth
	rcTitleBar.bottom 	= theme.#TitleBarHeight
	CaptionBar.Event OnWindowSizing(widthChanged,heightChanged,newWidth,newHeight)
end if

if Not _wf_IsIconic() then
	if wf_IsMenuBarVisible() then
		_currentMenuBar.Event OnWindowSizing(widthChanged,heightChanged,newWidth,newHeight)
	end if
	if wf_IsToolBarVisible() then
		_currentToolBar.Event OnWindowSizing(widthChanged,heightChanged,newWidth,newHeight)
	end if
	if wf_IsStatusBarVisible() then
		StatusBar.Event OnWindowSizing(widthChanged,heightChanged,newWidth,newHeight)
	end if
end if

return 0
end event

event type long ongetminmaxinfo(ref real maximizedx, ref real maximizedy, ref real maximizedwidth, ref real maximizedheight, ref real minwidth, ref real minheight);real fBorderSize

if Border then
	fBorderSize = P2DX(1)
	MaximizedX -= theme.#BorderMargin.left
	MaximizedY -= theme.#BorderMargin.top
	MaximizedWidth += theme.#BorderMargin.left + theme.#BorderMargin.right
	MaximizedHeight += theme.#BorderMargin.top + theme.#BorderMargin.bottom
	//if ClientEdge then
	if theme.#BorderStyle <> Enums.BS_NONE then
		MaximizedX -= fBorderSize
		MaximizedY -= fBorderSize
		MaximizedWidth += fBorderSize * 2
		MaximizedHeight += fBorderSize * 2
	end if
	//end if
	if wf_IsSheet() then
		MaximizedY += theme.#BorderMargin.top - _wf_GetTitleBarHeight()
		MaximizedHeight -= theme.#BorderMargin.top - _wf_GetTitleBarHeight()
	else
		MaximizedY += theme.#BorderMargin.top
		MaximizedHeight -= theme.#BorderMargin.top
	end if
	if wf_IsStatusBarVisible() then
		MaximizedHeight -= theme.#BorderMargin.bottom - 1
	end if
end if

//最小窗口宽度
MinWidth = _wf_GetMinWidth()
//最小窗口高度
MinHeight = _wf_GetMinHeight()

return 0
end event

event type unsignedlong ongetwindowrgn(real newwidth, real newheight);ulong wndRgn
RADIUSF rdBorder

if theme.#BorderStyle = Enums.BS_ROUND then
	rdBorder = theme.#RoundSize
	wndRgn = Painter.CreateRoundRectRgn(0,0,newWidth + 1,newHeight + 1,ref rdBorder)
else
	//wndRgn = Painter.CreateRectRgn(0,0,newWidth,newHeight)
	wndRgn = 0
end if

return wndRgn
end event

event type long onpaint(unsignedlong hdc);int index,nCount

if #LockUpdate then return 1
if _wf_IsIconic() then return 1

Event OnEraseBkgnd(hdc)

nCount = UpperBound(_drawObjects)
for index = 1 to nCount
	if Not _drawObjects[index].Visible then continue
	Painter.of_DrawGraphicObject(hdc,_drawObjects[index])
next

return 1
end event

event type long Onsettext(string text);CaptionBar.of_SetTitle(text)
return 1
end event

event type long Oniconchanged(unsignedlong hicon);return CaptionBar.Event OnIconChanged(hIcon)
end event

event type long Onncactivate(boolean active);_Active = active

return 0
end event

event type long Onsystembuttonchanged();return CaptionBar.Event OnSystemButtonChanged()
end event

event type long onnclbuttondblclk(unsignedlong hittestcode, real xpos, real ypos);/*if HitTestCode = WinMsg.HTMENU then
	return 1
end if
*/
choose case HitTestCode
	case HTTITLEBAR
		CaptionBar.Event OnLButtonDBLCLK(0,xpos,ypos)
	case HTMENUBAR
		_currentMenuBar.Event OnLButtonDBLCLK(0,xpos,ypos)
	case HTTOOLBAR
		_currentToolBar.Event OnLButtonDBLCLK(0,xpos,ypos)
	case HTSTATUSBAR
		StatusBar.Event OnLButtonDBLCLK(0,xpos,ypos)
end choose

return Event OnNcLButtonDown(hittestcode,xpos,ypos)
end event

event type long onncerasebkgnd(unsignedlong hdc);if #LockUpdate then return 1

_wf_FillBkgnd(hdc,rcWnd,true)

return 1
end event

event type long oncapturemouse(boolean capture, unsignedinteger objecttype);choose case objectType
	case WOT_TITLEBAR,WOT_TOOLBAR,WOT_STATUSBAR
		if capture then
			_MouseCaptured = objectType
			Win32.SetCapture(#Handle)
		else
			_MouseCaptured = 0
			Win32.ReleaseCapture()
		end if
end choose

return 0
end event

event type long onkeydown(unsignedinteger nchar, unsignedinteger nrepcnt, unsignedlong flags);if wf_IsMenuBarVisible() then
	return _currentMenuBar.Event OnKeyDown(nchar,nrepcnt,flags)
end if

return 0
end event

event type long onmenuchar(unsignedinteger nchar, unsignedinteger nflags, unsignedlong hmenu);if wf_IsMenuBarVisible() then
	return _currentMenuBar.Event OnMenuChar(nchar,nflags,hMenu)
end if
return 0
end event

event type long onerasebkgnd(unsignedlong hdc);RECTF cliRect

if #LockUpdate then return 1

wf_GetClientRect(ref cliRect,false)

if theme.#ClientThemeBkgnd then
	_wf_FillBkgnd( hdc, cliRect,false)
else
	Painter.of_FillRect( hdc, cliRect, Painter.GetPBColorA(BackColor),false,0)
end if

return 1
end event

event type long ondrawscrollbar(unsignedlong hdc, unsignedlong lpsbdi, boolean bvert, long flags);SCROLLBARDRAWINFO sbDrawInfo

Win32.CopyScrollBarDrawInfo(ref sbDrawInfo,lpsbdi,Win32.SIZEOF_SCROLLBARDRAWINFO)

Painter.of_FillRect( hdc, sbDrawInfo.rcPaint, Painter.GetPBColorA(BackColor),false,0)

Painter.of_DrawScrollBar(hdc,sbDrawInfo,bVert,flags,theme,theme.#ScrollBarBorderStyle,theme.#ScrollBarRoundSize)

return 1
end event

event type long oncreatescrollbar(unsignedlong lpsbci, boolean bvert);SCROLLBARCREATEINFO sbCreateInfo

Win32.CopyScrollBarCreateInfo(ref sbCreateInfo,lpsbci,Win32.SIZEOF_SCROLLBARCREATEINFO)

sbCreateInfo.fBarSize = theme.#ScrollBarSize
sbCreateInfo.fArrowSize = theme.#ScrollBarArrowSize
sbCreateInfo.rcBorderMargin = theme.#ScrollBarBorderMargin
sbCreateInfo.showArrow = theme.#ScrollBarArrow

Win32.CopyScrollBarCreateInfo(lpsbci,ref sbCreateInfo,Win32.SIZEOF_SCROLLBARCREATEINFO)

return 1
end event

event type long onclosequery();if _CloseFlag then return 0

if CaptionBar.of_IsVisible(CaptionBar.IDX_CLOSE) then
	if Not CaptionBar.of_IsEnabled(CaptionBar.IDX_CLOSE) then return 1
end if

if Event CloseQuery() = 1 then return 1

if IsValidObject(this) then
	if wf_IsMDIWindow() then
		if MDIClient.Event OnCloseQuery() = 1 then return 1
	end if
	if wf_IsChildWindow() then
		_CloseFlag = true
		#ParentWindow.Post wf_CloseSheet(this)
		return 1
	end if
end if

return 0
end event

event type long onclose();Timer.StopAll()
CaptionBar.Timer.StopAll()
MenuBar.Timer.StopAll()
ToolBar.Timer.StopAll()
StatusBar.Timer.StopAll()

Event OnPreClose()

if IsValidObject(this) then
	Event Close()
end if

if IsValidObject(this) then
	if wf_IsMDIWindow() then
		MDIClient.Event OnClose()
	end if
	_wf_Uninitial()
end if

return 0
end event

event onopen;_wf_Initial()

if IsAllowed(Event Open()) then
	Post Event OnPostOpen()
end if
end event

event onprivc;//Don't Touch!
if IsValidObject(_Canvas) then
	Event OnClose()
end if
return 0
end event

event onprivcq;//Don't Touch!
return 0
end event

event type long onmdichildactivate(unsignedlong hwnddeactivated, unsignedlong hwndactivated);s_cst_window lw_Active

if IsFailed(wf_GetActiveSheet(ref lw_Active)) then return 0
if _currentMenuBar = lw_Active.MenuBar then return 0

if IsValidObject(_currentMenuBar) then
	if _lastHitTestCode = HTMENUBAR then
		_currentMenuBar.Event OnMouseLeave()
		_lastHitTestCode = 0
	end if
	_currentMenuBar.Event OnAttach(_currentMenuBar.#ParentWindow,_currentMenuBar.#ParentWindow._Canvas)
end if
if IsValidObject(_currentToolBar) then
	if _lastHitTestCode = HTTOOLBAR then
		_currentToolBar.Event OnMouseLeave()
		_lastHitTestCode = 0
	end if
	_currentToolBar.Event OnAttach(_currentToolBar.#ParentWindow,_currentToolBar.#ParentWindow._Canvas)
end if

if lw_Active.MenuBar.of_GetCount() > 0 then
	_currentMenuBar = lw_Active.MenuBar
	_currentMenuBar.Event OnAttach(this,_Canvas)
	_currentToolBar = lw_Active.ToolBar
	_currentToolBar.Event OnAttach(this,_Canvas)
else
	_currentMenuBar = MenuBar
	_currentToolBar = ToolBar
end if

if wf_IsMenuBarVisible() then
	_currentMenuBar.Event OnWindowSizing(true,true,rcWnd.right,rcWnd.bottom)
	_currentMenuBar.of_Redraw(false)
end if
if wf_IsToolBarVisible() then
	_currentToolBar.Event OnWindowSizing(true,true,rcWnd.right,rcWnd.bottom)
	_currentToolBar.of_Redraw(false)
end if

return 0
end event

event onmdichilddestroy(unsignedlong hwndchild);if wf_GetSheetCount() = 0 then
	_currentMenuBar = MenuBar
	_currentToolBar = ToolBar
	//wf_Redraw(false,false)
	_Canvas.UpdateFrame()
end if
end event

private subroutine _wf_initial ();int index,nCount
long nOldWidth,nOldHeight
RECTF oldClientRect
RECTF newClientRect

nCount = UpperBound(Control)
for index = 1 to nCount
	choose case Control[index].TypeOf()
		case Line!,Oval!,Rectangle!,RoundRectangle!
			_drawObjects[UpperBound(_drawObjects) + 1] = Control[index]
	end choose
next

#Handle = Handle(this)

_Canvas = Create n_canvas
_ToolTip = Create n_tooltip
_ToolTip.CreateToolTip(#Handle)

_currentMenuBar = MenuBar
_currentToolBar = ToolBar

if wf_IsMDIWindow() then
	ulong hWnd
	hWnd = Win32.FindWindowEx(#Handle,0,"MDIClient","")
	MDIClient = Create n_cst_window_mdiclient
	MDIClient.Event OnInit(hWnd,this)
elseif wf_IsSheet() then
	#ParentWindow = ParentWindow()
end if

CaptionBar.Event OnInit(this,_Canvas,_ToolTip)
MenuBar.Event OnInit(this,_Canvas,_ToolTip)
StatusBar.Event OnInit(this,_Canvas,_ToolTip)
ToolBar.Event OnInit(this,_Canvas,_ToolTip)

Painter.GetClientRect(#Handle,ref oldClientRect)
_Canvas.Attach(this)

nOldWidth = Width
nOldHeight = Height
Event OnPreOpen()

CaptionBar.Event OnPreOpen()
if IsValid(MDIClient) then
	MDIClient.Event OnPreOpen()
end if

if Width = nOldWidth and Height = nOldHeight then
	Painter.GetClientRect(#Handle,ref newClientRect)
	if Not Painter.EqualRect(oldClientRect,newClientRect) then
		Win32.SetWindowPos(#Handle,0,0,0,&
										D2PX(rcWnd.right + (oldClientRect.right - newClientRect.right)),&
										D2PY(rcWnd.bottom + (oldClientRect.bottom - newClientRect.bottom)),&
										Win32.SWP_NOMOVE + Win32.SWP_NOZORDER + Win32.SWP_NOACTIVATE)
	end if
end if
end subroutine

private subroutine _wf_trackncmouseleave (readonly boolean track);TRACKMOUSEEVENT tme

if _MouseLeaveTracked=track then return

_MouseLeaveTracked=track

tme.cbsize = 16
tme.dwflags = Win32.TME_LEAVE + Win32.TME_NONCLIENT
tme.hwndtrack = #Handle
tme.dwhovertime = 0

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(tme)
end subroutine

private subroutine _wf_uninitial ();CaptionBar.Event OnClose()
MenuBar.Event OnClose()
ToolBar.Event OnClose()
StatusBar.Event OnClose()

if IsValidObject(MDIClient) then
	Destroy MDIClient
end if

Destroy _ToolTip

_Canvas.Detach()
Destroy _Canvas
end subroutine

public function long wf_redraw (readonly boolean fadeanimation);return wf_Redraw(true,fadeAnimation)
end function

public function long wf_redraw (readonly boolean drawclient, readonly boolean fadeanimation);ulong safeDC
SCROLLBARDRAWINFO sbDrawInfo

if #LockUpdate then return RetCode.FAILED
if Not Visible then return RetCode.OK
if _Canvas.GetHandle() = 0 then return RetCode.FAILED

if Border then
	safeDC=_Canvas.GetSafeNcDC()

	Event OnNcPaint(safeDC)
	
	if VScrollBar then
		if Win32.GetScrollBarDrawInfo(#Handle,Win32.SB_VERT,ref sbDrawInfo) then
			Painter.of_DrawScrollBar(safeDC,sbDrawInfo,true,Win32.DSF_ALL,theme,theme.#ScrollBarBorderStyle,theme.#ScrollBarRoundSize)
		end if
	end if
	if HScrollBar then
		if Win32.GetScrollBarDrawInfo(#Handle,Win32.SB_HORZ,ref sbDrawInfo) then
			Painter.of_DrawScrollBar(safeDC,sbDrawInfo,false,Win32.DSF_ALL,theme,theme.#ScrollBarBorderStyle,theme.#ScrollBarRoundSize)
		end if
	end if

	if FadeAnimation then
		_Canvas.ReleaseDC(safeDC,0,#FadeTime)
	else
		_Canvas.ReleaseDC(safeDC,0)
	end if
end if

if DrawClient then
	safeDC=_Canvas.GetSafeDC()

	Event OnPaint(safeDC)
	
	if FadeAnimation then
		_Canvas.ReleaseDC(safeDC,0,#FadeTime)
	else
		_Canvas.ReleaseDC(safeDC,0)
	end if
	
	if wf_IsMDIWindow() then
		MDIClient.of_Redraw(true,false)
	end if
end if

return RetCode.OK
end function

private function boolean _wf_isiconic ();return  (Not Win32.IsShowInTaskBar(#Handle) and Win32.IsIconic(#Handle))
end function

public function integer wf_getsheetcount ();if Not wf_IsMDIWindow() then return RetCode.E_NO_SUPPORT
return MDIClient.of_GetSheetCount()
end function

public function integer wf_getsheetindex (readonly s_cst_window sheet);if Not wf_IsMDIWindow() then return RetCode.E_NO_SUPPORT
return MDIClient.of_GetSheetIndex(sheet)
end function

public function long wf_getsheet (readonly integer index, ref s_cst_window sheet);if Not wf_IsMDIWindow() then return RetCode.E_NO_SUPPORT
return MDIClient.of_GetSheet(index,ref sheet)
end function

public function long wf_getsheets (ref s_cst_window sheets[]);if Not wf_IsMDIWindow() then return RetCode.E_NO_SUPPORT
return MDIClient.of_GetSheets(ref sheets)
end function

public function long wf_activatesheet (readonly integer index);if Not wf_IsMDIWindow() then return RetCode.E_NO_SUPPORT
return MDIClient.of_ActivateSheet(index)
end function

public function long wf_arrangesheets (readonly arrangetypes atype);if Not wf_IsMDIWindow() then return RetCode.E_NO_SUPPORT
return MDIClient.of_ArrangeSheets(aType)
end function

public function long wf_closesheet (readonly integer index);if Not wf_IsMDIWindow() then return RetCode.E_NO_SUPPORT
return MDIClient.of_CloseSheet(index)
end function

public function long wf_closesheets ();if Not wf_IsMDIWindow() then return RetCode.E_NO_SUPPORT
return MDIClient.of_CloseSheets()
end function

public function integer wf_opensheet (ref s_cst_window sheet, readonly arrangeopen aopentype);return wf_OpenSheet(ref sheet,"",0,aOpenType)
end function

public function boolean wf_isactivesheetmaximized ();if Not wf_IsMDIWindow() then return false
return MDIClient.of_IsActiveSheetMaximized()
end function

public function long wf_getactivesheet (ref s_cst_window sheet);if Not wf_IsMDIWindow() then return RetCode.E_NO_SUPPORT
return MDIClient.of_GetActiveSheet(ref sheet)
end function

public function boolean wf_ismaximized ();return Win32.IsZoomed(#Handle)
end function

public function boolean wf_isminimized ();return Win32.IsIconic(#Handle)
end function

public function integer wf_opensheet (ref s_cst_window sheet);return wf_OpenSheet(ref sheet,"",0,Original!)
end function

public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly string wndtype);return wf_OpenSheetWithParm(ref sheet,parm,wndType,0,Original!)
end function

public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly arrangeopen aopentype);return wf_OpenSheetWithParm(ref sheet,parm,"",0,aOpenType)
end function

public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm);return wf_OpenSheetWithParm(ref sheet,parm,"",0,Original!)
end function

public function long wf_timer (readonly double interval);return wf_Timer(0,interval)
end function

public function boolean wf_isactive ();return _Active
end function

public function long wf_setwindowstateasync (readonly windowstate newstate);if WindowState = newState then return RetCode.OK

choose case newState
	case Minimized!
		Post(#Handle,WinMsg.WM_SYSCOMMAND,WinMsg.SC_MINIMIZE,0)
	case Maximized!
		Post(#Handle,WinMsg.WM_SYSCOMMAND,WinMsg.SC_MAXIMIZE,0)
	case Normal!
		Post(#Handle,WinMsg.WM_SYSCOMMAND,WinMsg.SC_RESTORE,0)
end choose

return RetCode.OK
end function

public function long wf_setwindowstate (readonly windowstate newstate);if WindowState = newState then return RetCode.OK

choose case newState
	case Minimized!
		Send(#Handle,WinMsg.WM_SYSCOMMAND,WinMsg.SC_MINIMIZE,0)
	case Maximized!
		Send(#Handle,WinMsg.WM_SYSCOMMAND,WinMsg.SC_MAXIMIZE,0)
	case Normal!
		Send(#Handle,WinMsg.WM_SYSCOMMAND,WinMsg.SC_RESTORE,0)
end choose

return RetCode.OK
end function

public function long wf_updatepoints ();if #LockUpdate then return RetCode.FAILED

Event OnWindowSizing(true,true,rcWnd.right,rcWnd.bottom)
wf_Redraw(true,false)

return RetCode.OK
end function

public function boolean wf_ischildwindow ();Constant Long WS_CHILD = 1073741824

if WindowType = Child! then return true
return (BitAND(Win32.GetWindowLong(#Handle,Win32.GWL_STYLE),WS_CHILD) = WS_CHILD)
end function

public function boolean wf_ismdiwindow ();return (WindowType = MDI! or WindowType = MDIHelp!)
end function

public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly string wndtype, readonly integer indexbefore, readonly arrangeopen aopentype);if Not wf_IsMDIWindow() then return RetCode.E_NO_SUPPORT
return MDIClient.of_OpenSheetWithParm(ref sheet,parm,wndType,indexBefore,aOpenType)
end function

public function integer wf_opensheet (ref s_cst_window sheet, readonly string wndtype, integer indexbefore, readonly arrangeopen aopentype);if Not wf_IsMDIWindow() then return RetCode.E_NO_SUPPORT
return MDIClient.of_OpenSheet(ref sheet,wndType,indexBefore,aOpenType)
end function

public function integer wf_opensheet (ref s_cst_window sheet, readonly string wndtype);return wf_OpenSheet(ref sheet,wndType,0,Original!)
end function

public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly string wndtype, readonly integer indexbefore);return wf_OpenSheetWithParm(ref sheet,parm,wndType,indexBefore,Original!)
end function

public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly integer indexbefore, readonly arrangeopen aopentype);return wf_OpenSheetWithParm(ref sheet,parm,"",indexBefore,aOpenType)
end function

public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly integer indexbefore);return wf_OpenSheetWithParm(ref sheet,parm,"",indexBefore,Original!)
end function

public function integer wf_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly string wndtype, readonly arrangeopen aopentype);return wf_OpenSheetWithParm(ref sheet,parm,wndType,0,aOpenType)
end function

public function integer wf_opensheet (ref s_cst_window sheet, readonly string wndtype, readonly integer indexbefore);return wf_OpenSheet(ref sheet,wndType,indexBefore,Original!)
end function

public function integer wf_opensheet (ref s_cst_window sheet, readonly string wndtype, readonly arrangeopen aopentype);return wf_OpenSheet(ref sheet,wndType,0,aOpenType)
end function

public function integer wf_opensheet (ref s_cst_window sheet, readonly integer indexbefore, readonly arrangeopen aopentype);return wf_OpenSheet(ref sheet,"",indexBefore,aOpenType)
end function

public function integer wf_opensheet (ref s_cst_window sheet, readonly integer indexbefore);return wf_OpenSheet(ref sheet,"",indexBefore,Original!)
end function

public function long wf_closesheet (readonly s_cst_window sheet);if Not wf_IsMDIWindow() then return RetCode.E_NO_SUPPORT
return MDIClient.of_CloseSheet(sheet)
end function

public function boolean wf_issheet ();Constant Long WS_EX_MDICHILD = 64

if WindowType = Child! then return true
return (BitAND(Win32.GetWindowLong(#Handle,Win32.GWL_EXSTYLE),WS_EX_MDICHILD) = WS_EX_MDICHILD)
end function

public function n_cst_window_menubar wf_getcurrentmenubar ();return _currentMenuBar
end function

public function n_cst_window_toolbar wf_getcurrenttoolbar ();return _currentToolBar
end function

public function long wf_timer (readonly unsignedlong id, readonly double interval);if interval < 0 then return RetCode.E_INVALID_ARGUMENT

if Timer.Start(TM_USER + id,interval * 1000) then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function boolean wf_istimerrunning (readonly unsignedlong id);return Timer.IsRunning(TM_USER + id)
end function

public function double wf_gettimerinterval (readonly unsignedlong id);return (Double(Timer.GetInterval(TM_USER + id)) / 1000)
end function

public function unsignedlong wf_getstate ();ulong nState

if _Active then nState += Enums.STATE_ACTIVE
if Not Enabled then nState += Enums.STATE_DISABLED

return nState
end function

public function boolean wf_istoolbarvisible ();return (Border and TitleBar and theme.#ToolBar)
end function

public function boolean wf_istitlebarvisible ();if Not IsNull(theme.#TitleBar) then return theme.#TitleBar
return (Border and TitleBar)
end function

public function boolean wf_ismenubarvisible ();return (Border and TitleBar and theme.#MenuBar)
end function

public function boolean wf_isstatusbarvisible ();return (Border and theme.#StatusBar)
end function

public function integer wf_changemenu (ref menu m);if ChangeMenu(ref m) <> 1 then return RetCode.FAILED

MenuBar.of_DetachMenu()
MenuBar.of_AttachMenu(m)
ToolBar.of_DetachMenu()
ToolBar.of_AttachMenu(m)

return RetCode.OK
end function

private subroutine _wf_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if BitAnd(flags,ADJ_BORDER) > 0 then
	if theme.#BorderStyle = Enums.BS_SOLID or theme.#BorderStyle = Enums.BS_ROUND then
		fBorderSize = P2DX(1)
		Painter.InflateRect(ref adjRect,-fBorderSize,-fBorderSize)
	end if
end if
end subroutine

public function long wf_getclientrect (ref rectf clirect, readonly boolean relativewindow);real fBorderSize

Painter.GetClientRect(#Handle,ref cliRect)
fBorderSize = P2DX(1)

if Border then
	if RelativeWindow then
		if #ExtendFrameIntoClient then
			cliRect.left = theme.#BorderMargin.left
			cliRect.top = _wf_GetTitleBarHeight()
			cliRect.right -=  theme.#BorderMargin.right
			cliRect.bottom -= _wf_GetStatusBarHeight()
			if ClientEdge then
				Painter.InflateRect(ref cliRect,-fBorderSize,-fBorderSize)
			end if
		else
			RECTF wndRect
			Painter.GetWindowRect(Handle(this),ref wndRect)
			Painter.ClientToScreen(Handle(this),ref cliRect)
			Painter.OffsetRect(ref cliRect,-wndRect.left,-wndRect.top)
		end if
	elseif #ExtendFrameIntoClient then
		cliRect.right -= theme.#BorderMargin.left + theme.#BorderMargin.right
		cliRect.bottom -= _wf_GetTitleBarHeight() + _wf_GetStatusBarHeight()
		if ClientEdge then
			cliRect.right -= fBorderSize * 2
			cliRect.bottom -= fBorderSize * 2
		end if
	end if
else
	if RelativeWindow then
		if ClientEdge then
			Painter.InflateRect(ref cliRect,-fBorderSize,-fBorderSize)
		end if
	elseif #ExtendFrameIntoClient then
		if ClientEdge then
			cliRect.right -= fBorderSize * 2
			cliRect.bottom -= fBorderSize * 2
		end if
	end if
end if

return RetCode.OK
end function

private function real _wf_getminheight ();//最小窗口高度
real minSize

minSize = _wf_GetTitleBarHeight() + _wf_GetStatusBarHeight() + 4
if WINDOWMINHEIGHT > minSize then
	minSize = WINDOWMINHEIGHT
end if
if #MinHeight >= minSize then
	return #MinHeight
else
	return minSize
end if
end function

private function real _wf_getminwidth ();//最小窗口宽度
if #MinWidth >= WINDOWMINWIDTH then
	return #MinWidth
else
	return WINDOWMINWIDTH
end if
end function

private function real _wf_getstatusbarheight ();if Not Border then return 0

if wf_IsStatusBarVisible() then
	return theme.#StatusBarHeight
else
	return theme.#BorderMargin.bottom
end if
end function

private function real _wf_gettitlebarheight ();return _wf_GetTitleBarHeight(true,true)
end function

private function real _wf_gettitlebarheight (readonly boolean includemenubar, readonly boolean includetoolbar);real nHeight

if Not Border then return 0

if wf_IsTitleBarVisible() then
	nHeight = theme.#TitleBarHeight
else
	nHeight = theme.#BorderMargin.top
end if

if includeMenuBar and wf_IsMenuBarVisible() then
	 nHeight += theme.#MenuBarHeight
end if
if includeToolBar and wf_IsToolBarVisible() then
	 nHeight += theme.#ToolBarHeight
end if

return nHeight
end function

private subroutine _wf_fillbkgnd (readonly unsignedlong hdc, ref rectf rcpaint, readonly boolean nonclient);ulong bkColor
long nState
real lightenScale
boolean bTitleBarVisible

if theme.#BkgndStyle = Enums.TRANSPARENT then return

nState = wf_GetState()
bkColor = theme.of_GetColor(theme.CLR_BKGND,nState)

//去Alpha通道
bkColor = ToARGB(255,ToRGB(bkColor))		

bTitleBarVisible = wf_IsTitleBarVisible()
if bTitleBarVisible then
	if theme.#BkgndStyle = Enums.VISTAEMBOSSED then
		lightenScale = 0.7
	elseif theme.#BkgndStyle = Enums.VISTAGLASS then
		lightenScale = 1.0
	end if
	if lightenScale > 0 then
		bkColor = ARGBLighten(bkColor,lightenScale)
	end if
end if

Painter.FillRect(hdc,rcPaint.left,rcPaint.top,rcPaint.right,rcPaint.bottom,bkColor,bkColor,Enums.VERT,false,false,0)

if nonClient then
	if bTitleBarVisible then
		Painter.ThemeFill( hdc, rcTitleBar, theme.of_GetColor(theme.CLR_BKGND,nState), Enums.VERT, theme.#BkgndStyle,nState, false,Enums.BS_NONE,0,0)
	end if
	
	if Border then
		Painter.DrawThemeBorder(hdc,rcWnd,theme.of_GetColor(theme.CLR_BORDER,nState),theme.#BkgndStyle,theme.#BorderStyle,theme.#RoundSize)
	end if
end if

end subroutine

on s_cst_window.create
this.toolbar=create toolbar
this.menubar=create menubar
this.statusbar=create statusbar
this.captionbar=create captionbar
this.timer=create timer
this.theme=create theme
end on

on s_cst_window.destroy
destroy(this.toolbar)
destroy(this.menubar)
destroy(this.statusbar)
destroy(this.captionbar)
destroy(this.timer)
destroy(this.theme)
end on

type toolbar from n_cst_window_toolbar within s_cst_window descriptor "pb_nvo" = "true" 
end type

on toolbar.create
call super::create
end on

on toolbar.destroy
call super::destroy
end on

type menubar from n_cst_window_menubar within s_cst_window descriptor "pb_nvo" = "true" 
end type

on menubar.create
call super::create
end on

on menubar.destroy
call super::destroy
end on

type statusbar from n_cst_window_statusbar within s_cst_window descriptor "pb_nvo" = "true" 
end type

on statusbar.create
call super::create
end on

on statusbar.destroy
call super::destroy
end on

type captionbar from n_cst_window_titlebar within s_cst_window descriptor "pb_nvo" = "true" 
end type

on captionbar.create
call super::create
end on

on captionbar.destroy
call super::destroy
end on

type timer from n_timer within s_cst_window descriptor "pb_nvo" = "true" 
end type

event ontimer;call super::ontimer;return Parent.Event OnTimer(id - TM_USER)
end event

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

type theme from n_cst_window_theme within s_cst_window descriptor "pb_nvo" = "true" 
end type

on theme.create
call super::create
end on

on theme.destroy
call super::destroy
end on

event ongetitemcolor;call super::ongetitemcolor;Parent.Event OnGetItemColor(index,colorFlag,state,objectType,ref color)
end event

event onthemechanged;call super::onthemechanged;boolean bFrameChanged
boolean bTitleBarEvent,bMenuBarEvent,bToolBarEvent,bStatusBarEvent

if _Canvas.GetHandle() = 0 then return

choose case eventFlag
	case EVT_THEME
		bFrameChanged = true
		bTitleBarEvent = true
		bStatusBarEvent = true
		bMenuBarEvent = true
	case EVT_BORDERSTYLE
		if Border then
			bFrameChanged = true
		end if
		bTitleBarEvent = true
		bStatusBarEvent = true
	case EVT_TITLEBAR
		bFrameChanged = true
		bTitleBarEvent = true
	case EVT_MENUBAR
		bFrameChanged = true
		bMenuBarEvent = true
	case EVT_TOOLBAR
		bFrameChanged = true
		bToolBarEvent = true
	case EVT_STATUSBAR
		bFrameChanged = true
		bStatusBarEvent = true
	case EVT_ICONSIZE
		bTitleBarEvent = true
	case EVT_ITEMSTYLE
		bTitleBarEvent = true
		bStatusBarEvent = true
	case EVT_MENUBARBKGNDSTYLE
		bMenuBarEvent = true
	case EVT_MENUBARBORDERSTYLE
		bMenuBarEvent = true
	case EVT_MENUBARITEMBKGNDSTYLE
		bMenuBarEvent = true
	case EVT_MENUBARITEMBORDERSTYLE
		bMenuBarEvent = true
	case EVT_TOOLBARBKGNDSTYLE
		bToolBarEvent = true
	case EVT_TOOLBARBORDERSTYLE
		bToolBarEvent = true
	case EVT_TOOLBARITEMBKGNDSTYLE
		bToolBarEvent = true
	case EVT_TOOLBARITEMBORDERSTYLE
		bToolBarEvent = true
	case EVT_TITLEALIGN
		bTitleBarEvent = true
	case EVT_TITLEBARHEIGHT
		if wf_IsTitleBarVisible() then
			bFrameChanged = true
		end if
		bTitleBarEvent = true
	case EVT_MENUBARHEIGHT
		if wf_IsMenuBarVisible() then
			bFrameChanged = true
		end if
		bMenuBarEvent = true
	case EVT_TOOLBARHEIGHT
		if wf_IsToolBarVisible() then
			bFrameChanged = true
		end if
		bToolBarEvent = true
	case EVT_STATUSBARHEIGHT
		if wf_IsStatusBarVisible() then
			bFrameChanged = true
		end if
		bStatusBarEvent = true
	case EVT_BORDERMARGIN
		if Border then
			bFrameChanged = true
		end if
		bTitleBarEvent = true
		bStatusBarEvent = true
		bMenuBarEvent = true
	case EVT_FONT
		bTitleBarEvent = true
	case EVT_SCROLLBARSIZE,EVT_SCROLLBARARROW,EVT_SCROLLBARARROWSIZE
		if HScrollBar or VScrollBar then
			Send(#Handle,WinMsg.WM_PUI_UPDATESCROLLBARSIZE,Win32.SB_BOTH,0)
		end if
end choose

if bTitleBarEvent then
	CaptionBar.Event OnThemeChanged(eventFlag)
end if
if bMenuBarEvent then
	MenuBar.Event OnThemeChanged(eventFlag)
end if
if bToolBarEvent then
	ToolBar.Event OnThemeChanged(eventFlag)
end if
if bStatusBarEvent then
	StatusBar.Event OnThemeChanged(eventFlag)
end if

if bFrameChanged then
	_Canvas.UpdateFrame()
elseif Not bTitleBarEvent and Not bMenuBarEvent and Not bToolBarEvent and Not bStatusBarEvent then
	wf_Redraw(true,true)
end if

Parent.Event OnThemeChanged(eventFlag)
end event

event ongetcolor;call super::ongetcolor;Parent.Event OnGetColor(colorFlag,state,ref color)
end event

