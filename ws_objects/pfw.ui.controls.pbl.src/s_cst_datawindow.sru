$PBExportHeader$s_cst_datawindow.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type s_cst_datawindow from datawindow
end type
type sysitemdata from structure within s_cst_datawindow
end type
type icondata from structure within s_cst_datawindow
end type
type theme from n_cst_datawindow_theme within s_cst_datawindow
end type
end forward

type sysitemdata from structure
	unsignedinteger		itemtype
	boolean		visible
	boolean		mouseover
	boolean		mousedown
	string		tiptext
	long		tiptime
	string		image
	integer		imageindex
	rectf		rcimage
	rectf		rcpaint
end type

type icondata from structure
	integer		index
	rectf		rcimage
end type

global type s_cst_datawindow from datawindow
integer width = 686
integer height = 400
string title = "none"
boolean livescroll = true
event type long onnccalcsize ( unsignedlong lpcrect )
event type long onwindowsizing ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long onncpaint ( unsignedlong hdc )
event onthemechanged ( unsignedinteger eventflag )
event ongetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event onpreconstructor ( )
event onpredestructor ( )
event onpostconstructor ( )
event oncreated pbm_other
event type long ondrawscrollbar ( unsignedlong hdc,  unsignedlong lpsbdi,  boolean bvert,  long flags )
event type long oncreatescrollbar ( unsignedlong lpsbci,  boolean bvert )
event onconstructor pbm_constructor
event ondestructor pbm_destructor
event type unsignedlong ongetwindowrgn ( real newwidth,  real newheight )
event type long onnchittest ( real xpos,  real ypos )
event type long onncmousemove ( unsignedlong hittestcode,  real xpos,  real ypos )
event onncmouseleave ( )
event oncapturechanged ( )
event type long onnclbuttondown ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event type long onnclbuttondblclk ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long oniconchanged ( unsignedlong hicon )
event ongetsystembuttoncolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type long onsettext ( string text )
event type long ongetminmaxinfo ( ref real maximizedx,  ref real maximizedy,  ref real maximizedwidth,  ref real maximizedheight,  ref real minwidth,  ref real minheight )
theme theme
end type
global s_cst_datawindow s_cst_datawindow

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
//System button indexes
Constant Int	IDX_CLOSE		= 1
Constant Int	IDX_MAX			= 2
Constant Int	IDX_MINI			= 3

/*--- Properties ---*/
Public:
PrivateWrite 	Ulong		#Handle
PrivateWrite 	Window	#ParentWindow
ProtectedWrite 	Boolean	#Transparent		= false
Boolean						#LockUpdate		= false
Boolean						#FadeAnimation	= true
Uint							#FadeTime			= 250
Boolean 						#ToolTip 			= false

/*--- Implementation ---*/
Private:
n_canvas			_Canvas
n_imagelist		_ImageList
n_imagelist		_ImageList_Icon
n_tooltip 			_ToolTip
SYSITEMDATA	Items[]
ICONDATA		IconData
RECTF 				rcWnd
RECTF 				rcTitleBar
RECTF 				rcTitle

Ulong _TTID	

Int		_mouseOverIndex  	= 0
Int		_mouseDownIndex	= 0

Boolean _MouseLeaveTracked 	= false
Boolean _MouseCaptured 		= false
Ulong _hBrushStaticBkgnd

//System icon indexes
Int		_maxIconIndex			= 0
Int		_restoreIconIndex		= 0
Int		_miniIconIndex			= 0

//Hit-test code
Constant Uint HTITEM		= 200
//Item types
Constant Uint ITT_CLOSE 		= 0
Constant Uint ITT_MAX			= 1
Constant Uint ITT_MINI 			= 2
//System button icon
Constant String ICO_CLOSE 	= "pfw://zip/images[win-close.svg]"
Constant String ICO_MAX 		= "pfw://zip/images[win-maximize.svg]"
Constant String ICO_RESTORE = "pfw://zip/images[win-restore.svg]"
Constant String ICO_MINI 		= "pfw://zip/images[win-minimize.svg]"
//System button tiptext
Constant String TIP_CLOSE 		= "关闭"
Constant String TIP_MAX 		= "最大化"
Constant String TIP_RESTORE 	= "还原"
Constant String TIP_MINI 		= "最小化"
//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
end variables

forward prototypes
public function long of_redraw (readonly boolean fadeanimation)
public function long of_settransparent (readonly boolean transparent, readonly boolean bredraw)
public function long of_settransparent (readonly boolean transparent)
public function long of_updateparentbkgnd (readonly boolean bredraw)
public function long of_updatepoints ()
private function unsignedinteger _of_gettitlebarheight ()
private subroutine _of_drawtitle (unsignedlong hdc)
private subroutine _of_updatepoints ()
private subroutine _of_showtip (readonly integer index)
private subroutine _of_capturemouse (readonly boolean capture)
private subroutine _of_trackncmouseleave (readonly boolean track)
private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation)
private subroutine _of_fillbkgnd (readonly unsignedlong hdc)
public function ulong of_getstate ()
public function unsignedlong of_getsystembuttonstate (readonly integer index)
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
public function long of_reattach ()
end prototypes

event type long onnccalcsize(unsignedlong lpcrect);RECTF cRect

Painter.CopyRect(ref cRect,lpcRect)

if Win32.IsIconic(#Handle) then
	Painter.SetRectEmpty(ref cRect)
else
	_of_AdjustRect(ref cRect,ADJ_BORDER)
	
	if Border then
		cRect.left += theme.#BorderMargin.left
		cRect.top += _of_GetTitleBarHeight()
		cRect.right -= theme.#BorderMargin.right
		cRect.bottom -= theme.#BorderMargin.bottom
	else
		cRect.top += _of_GetTitleBarHeight()
	end if
end if

Painter.CopyRect(lpcRect,ref cRect)

return 0
end event

event type long onwindowsizing(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);rcWnd.right = newWidth
rcWnd.bottom = newHeight

if TitleBar then
	rcTitleBar = rcWnd
	rcTitleBar.bottom = _of_GetTitleBarHeight()
	_of_UpdatePoints()
	//更新MaxButton的图标
	if Items[IDX_MAX].Visible then
		if Win32.IsZoomed(#Handle) then
			Items[IDX_MAX].Image			= ICO_RESTORE
			Items[IDX_MAX].ImageIndex	= _restoreIconIndex
			Items[IDX_MAX].TipText			= I18N(Enums.I18N_CAT_DATAWINDOW,TIP_RESTORE)
		else
			Items[IDX_MAX].Image			= ICO_MAX
			Items[IDX_MAX].ImageIndex	= _maxIconIndex
			Items[IDX_MAX].TipText			= I18N(Enums.I18N_CAT_DATAWINDOW,TIP_MAX)
		end if
	end if
	
	if Items[IDX_MINI].Visible then
		if Win32.IsIconic(#Handle) then
			Items[IDX_MINI].Image			= ICO_RESTORE
			Items[IDX_MINI].ImageIndex	= _restoreIconIndex
			Items[IDX_MINI].TipText			= I18N(Enums.I18N_CAT_DATAWINDOW,TIP_RESTORE)
		else
			Items[IDX_MINI].Image			= ICO_MINI
			Items[IDX_MINI].ImageIndex	= _miniIconIndex
			Items[IDX_MINI].TipText			= I18N(Enums.I18N_CAT_DATAWINDOW,TIP_MINI)
		end if
	end if
end if

return 0
end event

event type long onncpaint(unsignedlong hdc);int index

_of_FillBkgnd(hdc)

if TitleBar then
	_of_DrawTitle(hdc)
	if IconData.Index > 0 then
		_ImageList_Icon.Draw(IconData.index,hdc, IconData.rcImage.left, IconData.rcImage.top,false)
	end if
	if ControlMenu then
		for index = 1 to UpperBound(Items)
			if Not Items[index].Visible then continue
			_of_DrawItem(index,hdc)
		next
	end if
end if

return 1
end event

event oncreated;//不能定义其它PBM_OTHER事件，否则会有冲突
if Message.Number = WinMSG.WM_PUI_CREATED then
	of_Reattach()
	return 0
elseif Message.Number = WinMsg.WM_CTLCOLORSTATIC then
	Win32.SetBkColor(wparam,theme.of_GetColor(theme.CLR_BKGND,0))
	return _hBrushStaticBkgnd
else
	return Event Other(wparam,lparam)
end if
end event

event type long ondrawscrollbar(unsignedlong hdc, unsignedlong lpsbdi, boolean bvert, long flags);Ulong bkColor,transparentColor,nState
SCROLLBARDRAWINFO sbDrawInfo

Win32.CopyScrollBarDrawInfo(ref sbDrawInfo,lpsbdi,Win32.SIZEOF_SCROLLBARDRAWINFO)

nState = of_GetState()
transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,nState)
//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, sbDrawInfo.rcPaint,  transparentColor,false,0) 
end if

bkColor = theme.of_GetColor(theme.CLR_BKGND,nState)
Painter.of_FillRect( hdc, sbDrawInfo.rcPaint,  bkColor,false,0) 

Painter.of_DrawScrollBar(hdc,sbDrawInfo,bVert,flags,theme,theme.#ScrollBarBorderStyle,theme.#ScrollBarRoundSize)

return 1
end event

event type long oncreatescrollbar(unsignedlong lpsbci, boolean bvert);SCROLLBARCREATEINFO sbCreateInfo

Win32.CopyScrollBarCreateInfo(ref sbCreateInfo,lpsbci,Win32.SIZEOF_SCROLLBARCREATEINFO)

if Not HSplitScroll then
	sbCreateInfo.fBarSize = theme.#ScrollBarSize
	sbCreateInfo.rcBorderMargin = theme.#ScrollBarBorderMargin
else
	if bVert then
		sbCreateInfo.rcBorderMargin.left = Round((sbCreateInfo.fBarSize - theme.#ScrollBarSize) / 2,0)
		sbCreateInfo.rcBorderMargin.right = sbCreateInfo.rcBorderMargin.left
		sbCreateInfo.rcBorderMargin.top = theme.#ScrollBarBorderMargin.top
		sbCreateInfo.rcBorderMargin.bottom = theme.#ScrollBarBorderMargin.bottom
	else
		sbCreateInfo.rcBorderMargin.left = theme.#ScrollBarBorderMargin.left
		sbCreateInfo.rcBorderMargin.right = theme.#ScrollBarBorderMargin.right
		sbCreateInfo.rcBorderMargin.top = Round((sbCreateInfo.fBarSize - theme.#ScrollBarSize) / 2,0)
		sbCreateInfo.rcBorderMargin.bottom = sbCreateInfo.rcBorderMargin.top
	end if
end if
sbCreateInfo.fArrowSize = theme.#ScrollBarArrowSize
sbCreateInfo.showArrow = theme.#ScrollBarArrow

Win32.CopyScrollBarCreateInfo(lpsbci,ref sbCreateInfo,Win32.SIZEOF_SCROLLBARCREATEINFO)

return 1
end event

event onconstructor;#Handle = Handle(this)
#ParentWindow = GetParentWindow(this)
_Canvas = Create n_canvas
_ImageList = Create n_imagelist
_ImageList.ShareImage(true)
_ImageList.SetImageSize(theme.#SysIconSize.cx,theme.#SysIconSize.cy)

_ImageList_Icon = Create n_imagelist
_ImageList_Icon.ShareImage(true)
_ImageList_Icon.SetImageSize(theme.#IconSize.cx,theme.#IconSize.cy)

_ToolTip = Create n_tooltip
_ToolTip.CreateToolTip(#Handle)
_TTID = _ToolTip.AddTool(#Handle,false,/*Win32.TTF_IDISHWND +*/ Win32.TTF_TRANSPARENT + Win32.TTF_TRACK + Win32.TTF_ABSOLUTE)

/*--- Init system buttons ---*/
//Add close button
Items[IDX_CLOSE].ItemType		= ITT_CLOSE
Items[IDX_CLOSE].Visible			= ControlMenu
Items[IDX_CLOSE].Image			= ICO_CLOSE
Items[IDX_CLOSE].TipText			= I18N(Enums.I18N_CAT_DATAWINDOW,TIP_CLOSE)
//Add max button
Items[IDX_MAX].ItemType			= ITT_MAX
Items[IDX_MAX].Visible				= (MaxBox and ControlMenu)
if Win32.IsZoomed(#Handle) then
	Items[IDX_MAX].Image			= ICO_RESTORE
	Items[IDX_MAX].TipText			= I18N(Enums.I18N_CAT_DATAWINDOW,TIP_RESTORE)
else
	Items[IDX_MAX].Image			= ICO_MAX
	Items[IDX_MAX].TipText			= I18N(Enums.I18N_CAT_DATAWINDOW,TIP_MAX)
end if
//Add min button
Items[IDX_MINI].ItemType			= ITT_MINI
Items[IDX_MINI].Visible				= (MinBox and ControlMenu)
Items[IDX_MINI].Image				= ICO_MINI
Items[IDX_MINI].TipText				= I18N(Enums.I18N_CAT_DATAWINDOW,TIP_MINI)
/*-------------------------------*/
//Init window icon
if Len(Icon) > 0 then
	IconData.Index = _ImageList_Icon.AddImage(theme.of_GetIcon(Icon,0))
	if IconData.Index = 0 then
		IconData.Index = _ImageList_Icon.AddHIcon(Send(#Handle,WinMsg.WM_GETICON,1,0))
	end if
end if

_Canvas.Attach(This)

Event OnPreConstructor()

_maxIconIndex = _ImageList.AddImage(theme.of_GetSystemButtonIcon(IDX_MAX,ICO_MAX,0))
_restoreIconIndex = _ImageList.AddImage(theme.of_GetSystemButtonIcon(IDX_MAX,ICO_RESTORE,0))
_miniIconIndex = _ImageList.AddImage(theme.of_GetSystemButtonIcon(IDX_MINI,ICO_MINI,0))

Items[IDX_CLOSE].ImageIndex = _ImageList.AddImage(theme.of_GetSystemButtonIcon(IDX_CLOSE,ICO_CLOSE,0))
if Win32.IsZoomed(#Handle) then
	Items[IDX_MAX].ImageIndex	= _restoreIconIndex
else
	Items[IDX_MAX].ImageIndex	= _maxIconIndex
end if
Items[IDX_MINI].ImageIndex		= _miniIconIndex

Event Constructor()
Post Event OnPostConstructor( )

_hBrushStaticBkgnd = Win32.CreateSolidBrush(ToRGB(theme.of_GetColor(theme.CLR_BKGND,0)))

end event

event ondestructor;Event OnPreDestructor()
Event Destructor()

_Canvas.Detach()
Destroy _Canvas
Destroy _ImageList
Destroy _ImageList_Icon

if _TTID > 0 then
	_ToolTip.DelTool(#Handle,_TTID)
end if

Destroy _ToolTip

Win32.DeleteObject(_hBrushStaticBkgnd)
end event

event type unsignedlong ongetwindowrgn(real newwidth, real newheight);if Not TitleBar then return 0
return Painter.CreateRectRgn(0,0,newWidth,newHeight)
end event

event type long onnchittest(real xpos, real ypos);int index
Constant real BORDERSIZE = 4

if Border then
	if Resizable and Not Win32.IsZoomed(#Handle) and Not Win32.IsIconic(#Handle) then
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
end if

if TitleBar then
	if Painter.PtInRect(ref rcTitleBar,xpos,ypos) then
		if ControlMenu then
			for index = 1 to UpperBound(Items)
				if Not Items[index].Visible then continue
				if Painter.PtInRect(Items[index].rcPaint,xpos,ypos) then return HTITEM + index
			next
		end if
		return WinMsg.HTCAPTION
	end if
end if

return WinMsg.HTCLIENT
end event

event type long onncmousemove(unsignedlong hittestcode, real xpos, real ypos);int index

if Not _MouseLeaveTracked and Not _MouseCaptured then
	_of_TrackNcMouseLeave(true)
end if

if hitTestCode > HTITEM then
	index = hitTestCode - HTITEM
end if

if _mouseOverIndex <> index then
	if _mouseOverIndex>0 then
		Items[_mouseOverIndex].mouseover=false
		_of_DrawItem(_mouseOverIndex,true)
		_of_ShowTip(0)
	end if

	_mouseOverIndex = index
	
	if index > 0 then
		Items[index].mouseover=true
		_of_DrawItem(index,true)
		_of_ShowTip(_mouseOverIndex)
	end if
	
end if

return 1
end event

event onncmouseleave();if Not _MouseCaptured then
	if _mouseOverIndex>0 then
		Items[_mouseOverIndex].mouseover=false
		_of_DrawItem(_mouseOverIndex,true)
		_mouseOverIndex = 0
	end if
end if

_of_ShowTip(0)

_of_TrackNcMouseLeave(false)
end event

event oncapturechanged();if _MouseCaptured then
	_of_CaptureMouse(false)
	if _mouseDownIndex>0 then
		Items[_mouseDownIndex].mousedown=false
		_of_DrawItem(_mouseDownIndex,true)
		_mouseDownIndex = 0
	end if
	Event OnNcMouseLeave()
end if
end event

event type long onnclbuttondown(unsignedlong hittestcode, real xpos, real ypos);if Not _MouseLeaveTracked then
	Event	OnNcMouseMove(hittestcode,xpos,ypos)
end if

if _mouseOverIndex > 0 then
	_mouseDownIndex = _mouseOverIndex
	Items[_mouseDownIndex].mousedown=true
	_of_DrawItem(_mouseDownIndex,false)
	_of_ShowTip(0)
	_of_CaptureMouse(true)
end if

choose case hitTestCode
	case WinMsg.HTCLOSE,WinMsg.HTMAXBUTTON,WinMsg.HTMINBUTTON,WinMsg.HTSYSMENU
		return 1
end choose

return 0
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if Not _MouseCaptured then return 0

_of_CaptureMouse(false)
_of_TrackNcMouseLeave(true)

if _mouseDownIndex > 0 then
	Items[_mouseDownIndex].MouseDown = false
	_of_DrawItem(_mouseDownIndex,true)
	
	if _mouseDownIndex = _mouseOverIndex then			//Clicked
		choose case _mouseDownIndex
			case IDX_CLOSE
				Post(#Handle,WinMsg.WM_SYSCOMMAND,WinMsg.SC_CLOSE,0)
			case IDX_MAX
				if Win32.IsZoomed(#Handle) then
					Send(#Handle,WinMsg.WM_SYSCOMMAND,WinMsg.SC_RESTORE,0)
				else
					Send(#Handle,WinMsg.WM_SYSCOMMAND,WinMsg.SC_MAXIMIZE,0)
				end if
			case IDX_MINI
				if Win32.IsIconic(#Handle) then
					Send(#Handle,WinMsg.WM_SYSCOMMAND,WinMsg.SC_RESTORE,0)
				else
					Send(#Handle,WinMsg.WM_SYSCOMMAND,WinMsg.SC_MINIMIZE,0)
				end if
		end choose
	end if
	
	_mouseDownIndex = 0
end if

return 1
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);long hitTestCode
RECTF wndRect
POINTF pt

if Not _MouseCaptured then return 0

Painter.GetWindowRect(#Handle,ref wndRect)
Painter.GetCursorPos(ref pt)
xpos = pt.x - wndRect.left
ypos = pt.y - wndRect.top

hitTestCode = Event OnNcHitTest(xpos,ypos)

if IsNull(hitTestCode) then
	hitTestCode = 0
end if

Event OnNcMouseMove(hitTestCode,xpos,ypos)

return 1
end event

event type long onnclbuttondblclk(unsignedlong hittestcode, real xpos, real ypos);if hitTestCode > HTITEM then
	return Event OnNcLButtonDown(hittestcode,xpos,ypos)
end if
choose case hitTestCode
	case WinMsg.HTCLOSE,WinMsg.HTMAXBUTTON,WinMsg.HTMINBUTTON,WinMsg.HTSYSMENU
		return 1
end choose

return 0
end event

event type long oniconchanged(unsignedlong hicon);int newIconIndex

if Len(Icon) > 0 then
	newIconIndex = _ImageList_Icon.AddImage(theme.of_GetIcon(Icon,0))
	if newIconIndex = 0 then
		newIconIndex = _ImageList_Icon.AddHIcon(hIcon)
	end if
else
	newIconIndex = 0
end if

if IconData.index <> newIconIndex then
	if (IconData.index > 0) <> (newIconIndex > 0) then
		IconData.index = newIconIndex
		of_UpdatePoints()
	else
		IconData.index = newIconIndex
		of_Redraw(false)
	end if
end if

return 0
end event

event type long onsettext(string text);of_Redraw(false)
return 1
end event

event type long ongetminmaxinfo(ref real maximizedx, ref real maximizedy, ref real maximizedwidth, ref real maximizedheight, ref real minwidth, ref real minheight);if Border then
	MaximizedX -= theme.#BorderMargin.left
	MaximizedWidth += theme.#BorderMargin.left + theme.#BorderMargin.right
	MaximizedHeight += theme.#BorderMargin.bottom
end if

return 0
end event

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC
SCROLLBARDRAWINFO sbDrawInfo

if #LockUpdate then return RetCode.FAILED
if Not Visible then return RetCode.OK

sbDrawInfo.cbSize = Win32.SIZEOF_SCROLLBARDRAWINFO

safeDC=_Canvas.GetSafeNcDC()

if #Transparent then
	_Canvas.FillParentBkgnd(safeDC)
end if

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

return RetCode.OK
end function

public function long of_settransparent (readonly boolean transparent, readonly boolean bredraw);if #Transparent = transparent then return RetCode.OK

#Transparent = transparent
if #Transparent then
	Win32.UpdateParentBkgnd(#Handle,false)
end if
if bRedraw and Visible then
	SetRedraw(true)
end if

return RetCode.OK
end function

public function long of_settransparent (readonly boolean transparent);return of_SetTransparent(transparent,true)
end function

public function long of_updateparentbkgnd (readonly boolean bredraw);if Not #Transparent then return RetCode.E_NO_SUPPORT

Win32.UpdateParentBkgnd(#Handle,bRedraw)

return RetCode.OK
end function

public function long of_updatepoints ();if #LockUpdate then return RetCode.FAILED

_of_UpdatePoints()
of_Redraw(false)

return RetCode.OK
end function

private function unsignedinteger _of_gettitlebarheight ();if TitleBar then
	return theme.#TitleBarHeight
elseif Border then
	return theme.#BorderMargin.top
else
	return 0
end if
end function

private subroutine _of_drawtitle (unsignedlong hdc);ulong textColor
ulong dtparam

textColor	= theme.of_GetColor(theme.CLR_TITLE,of_GetState())

dtparam = Painter.DT_SINGLELINE + Painter.DT_END_ELLIPSIS
dtparam += Painter.DT_VCENTER
if Not Win32.IsIconic(#Handle) then
	if theme.#TitleAlign = Left! then
		dtparam += Painter.DT_LEFT
	elseif theme.#TitleAlign = Right! then
		dtparam += Painter.DT_RIGHT
	elseif theme.#TitleAlign = Center! then
		dtparam += Painter.DT_CENTER
	end if
end if

Painter.of_DrawText(hdc,theme.Font,Title,ref rcTitle,textColor,dtparam)
end subroutine

private subroutine _of_updatepoints ();int	index
real ll_x,ll_left,ll_right
real itemSize
RECTF titlebarRect

if Not TitleBar then return

titlebarRect = rcTitleBar
_of_AdjustRect(ref titlebarRect,ADJ_BORDER)

if Win32.IsZoomed(#Handle) then
	ll_left = titlebarRect.left + theme.#BorderMargin.left
	ll_right = titlebarRect.right - theme.#BorderMargin.right
else
	ll_left = titlebarRect.left
	ll_right = titlebarRect.right
end if

ll_x = ll_right
	
if ControlMenu then
	itemSize = titlebarRect.bottom - titlebarRect.top
	for index = 1 to UpperBound(Items)
		if Not Items[index].Visible then continue
		//Set rcImage
		Items[index].rcImage.left 		= ll_x - 2 - theme.#SysIconSize.cx
		Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#SysIconSize.cx
		Items[index].rcImage.top 		= titlebarRect.top + (itemSize - theme.#SysIconSize.cy) / 2
		Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#SysIconSize.cy
		//Set rcPaint
		Items[index].rcPaint.left 			= Items[index].rcImage.left - 2
		Items[index].rcPaint.right 		= ll_x
		Items[index].rcPaint.top 			= Items[index].rcImage.top - 2
		Items[index].rcPaint.bottom 	= Items[index].rcImage.bottom + 2
		
		ll_x -= Items[index].rcPaint.right - Items[index].rcPaint.left
	next
end if

//Set icon rcImage
if IconData.index > 0 then
	IconData.rcImage.left 	= ll_left + 2
	IconData.rcImage.top 	= (rcTitleBar.bottom - rcTitleBar.top - theme.#IconSize.cy) / 2
	IconData.rcImage.right 	= IconData.rcImage.left + theme.#IconSize.cx
	IconData.rcImage.bottom= IconData.rcImage.top + theme.#IconSize.cy
	ll_left = IconData.rcImage.right
else
	Painter.SetRectEmpty(IconData.rcImage)
end if

//Set title rect
rcTitle = titlebarRect
rcTitle.left = ll_left + 2
rcTitle.right = ll_x - 2
end subroutine

private subroutine _of_showtip (readonly integer index);RECTF wndRect

if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _MouseCaptured then return

if #ToolTip and (index > 0 and index <= UpperBound(Items)) then
	if Items[index].tipText <> "" then
		Painter.GetWindowRect(#Handle,ref wndRect)
		_ToolTip.TrackActivate(#Handle,_TTID,false)
		_ToolTip.UpdateTipText(#Handle,_TTID,Items[index].tipText)
		_ToolTip.TrackPosition( 0,wndRect.left + Items[index].rcPaint.left ,wndRect.top + Items[index].rcPaint.bottom + 2)
		if Items[index].TipTime > 0 then
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,Items[index].TipTime)
		else
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,-1)
		end if
		_ToolTip.TrackActivate(#Handle,_TTID,true)
	else
		_ToolTip.TrackActivate(#Handle,_TTID,false)	
	end if
else
	_ToolTip.TrackActivate(#Handle,_TTID,false)
end if
end subroutine

private subroutine _of_capturemouse (readonly boolean capture);if _MouseCaptured = capture then return

_MouseCaptured = capture

if capture then
	Win32.SetCapture(#Handle)
else
	Win32.ReleaseCapture()
end if
end subroutine

private subroutine _of_trackncmouseleave (readonly boolean track);TRACKMOUSEEVENT tme

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

private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc);ulong borderColor,bkColor,nState

if Not Items[index].visible then return

nState = of_GetSystemButtonState(index)
bkColor = theme.of_GetSystemButtonColor(index,theme.CLR_BKGND,nState)
borderColor = theme.of_GetSystemButtonColor(index,theme.CLR_BORDER,nState)

Painter.ThemeFill(hdc,Items[index].rcPaint,bkColor,theme.#BkgndOrientation,theme.#SysBtnBkgndStyle,nState,false,&
					theme.#SysBtnBorderStyle,borderColor,theme.#SysRoundSize)

// Draw image
if Items[index].imageIndex > 0 then
	if Items[index].MouseDown then
		_ImageList.Draw(Items[index].imageindex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top + 1,false)
	else
		_ImageList.Draw(Items[index].imageindex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top,false)
	end if
end if
end subroutine

private subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation);ulong safeDC
ulong hUpdateRgn

if #LockUpdate then return
if Not Visible then return
if Not Items[index].visible then return

safeDC=_Canvas.GetSafeNcDC()

Painter.IntersectClipRect(safeDC,Items[index].rcPaint)

if #Transparent then
	_Canvas.FillParentBkgnd(safeDC)
end if

_of_FillBkgnd(safeDC)

_of_DrawItem(index,safeDC)

Painter.SelectClipRgn(safeDC,0)

hUpdateRgn = Painter.CreateRectRgn(Items[index].rcPaint)

if FadeAnimation then
	_Canvas.ReleaseDC(safeDC,hUpdateRgn,#FadeTime)
else
	_Canvas.ReleaseDC(safeDC,hUpdateRgn)
end if

Painter.DeleteRgn(hUpdateRgn)
end subroutine

private subroutine _of_fillbkgnd (readonly unsignedlong hdc);Ulong bkColor,borderColor,transparentColor,nState
RADIUSF rdBorder

nState = of_GetState()
transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,nState)
//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, rcWnd,  transparentColor,false,0) 
end if

rdBorder = theme.#RoundSize

if Win32.IsIconic(#Handle) then
	bkColor = theme.of_GetColor(theme.CLR_TITLEBAR,nState)
	borderColor = theme.of_GetColor(theme.CLR_BORDER,nState)
	Painter.ThemeFill( hdc, rcTitleBar, bkColor, Enums.VERT, theme.#BkgndStyle,nState, false,theme.#BorderStyle,borderColor,ref rdBorder)
else
	bkColor = theme.of_GetColor(theme.CLR_BKGND,nState)
	if Border then
		borderColor = theme.of_GetColor(theme.CLR_BORDER,nState)
		Painter.ThemeFill( hdc, rcWnd, bkColor, Enums.VERT, Enums.SOLID,nState, false,theme.#BorderStyle,borderColor,ref rdBorder)
	else
		Painter.of_FillRect( hdc, rcWnd,  bkColor,false,0) 
	end if
	if TitleBar then
		rdBorder.leftbottom = 0
		rdBorder.rightbottom = 0
		bkColor = theme.of_GetColor(theme.CLR_TITLEBAR,nState)
		Painter.ThemeFill( hdc, rcTitleBar, bkColor, Enums.VERT, theme.#BkgndStyle,nState, false,theme.#BorderStyle,borderColor,ref rdBorder)
	end if
end if
end subroutine

public function ulong of_getstate ();ulong nState

if Not Enabled then nState += Enums.STATE_DISABLED

return nState
end function

public function unsignedlong of_getsystembuttonstate (readonly integer index);ulong nState

if index < IDX_CLOSE or index > IDX_MINI then return 0

if Items[index].MouseOver then nState += Enums.STATE_HOVER
if Items[index].MouseDown then nState += Enums.STATE_PRESSED

return nState
end function

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if Border then
	if BitAND(flags,ADJ_BORDER) > 0 then
		if theme.#BorderStyle = Enums.BS_SOLID or theme.#BorderStyle = Enums.BS_ROUND then
			fBorderSize = P2DX(1)
			Painter.InflateRect(ref adjRect,-fBorderSize,-fBorderSize)
		end if
	end if
end if

if BitAND(flags,ADJ_BORDERMARGIN) > 0 then
	adjRect.left += theme.#BorderMargin.left
	adjRect.top += theme.#BorderMargin.top
	adjRect.right -= theme.#BorderMargin.right
	adjRect.bottom -= theme.#BorderMargin.bottom
end if
end subroutine

public function long of_reattach ();if Not IsValidObject(_Canvas) then return RetCode.FAILED

#Handle = Handle(this)
_Canvas.Attach(this)

return RetCode.OK
end function

on s_cst_datawindow.create
this.theme=create theme
end on

on s_cst_datawindow.destroy
destroy(this.theme)
end on

type theme from n_cst_datawindow_theme within s_cst_datawindow descriptor "pb_nvo" = "true" 
end type

on theme.create
call super::create
end on

on theme.destroy
call super::destroy
end on

event ongetcolor;call super::ongetcolor;Parent.Event OnGetColor(colorFlag,state,ref color)
end event

event onthemechanged;call super::onthemechanged;boolean dirty

if _Canvas.GetHandle() = 0 then return

choose case eventFlag
	case EVT_THEME
		dirty = true
	case EVT_BORDERSTYLE
		dirty = true
	case EVT_BORDERMARGIN
		dirty = true
	case EVT_TITLEBARHEIGHT
		if TitleBar then
			dirty = true
		end if
	case EVT_ICONSIZE
		_ImageList_Icon.SetImageSize(#IconSize.cx,#IconSize.cy)
		if IconData.Index > 0 then
			dirty = true
		end if
	case EVT_SYSICONSIZE
		_ImageList.SetImageSize(#SysIconSize.cx,#SysIconSize.cy)
		if TitleBar and ControlMenu then
			dirty = true
		end if
	case EVT_SCROLLBARSIZE,EVT_SCROLLBARARROW,EVT_SCROLLBARARROWSIZE
		if HScrollBar or VScrollBar then
			Send(#Handle,WinMsg.WM_PUI_UPDATESCROLLBARSIZE,Win32.SB_BOTH,0)
		end if
end choose

if dirty then
	_Canvas.UpdateFrame()
else
	of_Redraw(true)
end if

Parent.Event OnThemeChanged(eventFlag)
end event

event ongetsystembuttoncolor;call super::ongetsystembuttoncolor;Parent.Event OnGetSystemButtonColor(index,colorflag,state,ref color)
end event

