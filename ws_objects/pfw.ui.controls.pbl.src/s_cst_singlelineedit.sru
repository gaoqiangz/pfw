$PBExportHeader$s_cst_singlelineedit.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type s_cst_singlelineedit from singlelineedit
end type
type icondata from structure within s_cst_singlelineedit
end type
type theme from n_cst_singlelineedit_theme within s_cst_singlelineedit
end type
end forward

type icondata from structure
	boolean		mouseover
	boolean		mousedown
	integer		index
	rectf		rcimage
	rectf		rcpaint
end type

global type s_cst_singlelineedit from singlelineedit
integer width = 457
integer height = 132
integer textsize = -12
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
event onpostconstructor ( )
event type long onnchittest ( real xpos,  real ypos )
event type long onnccalcsize ( unsignedlong lpcrect )
event type long onncpaint ( unsignedlong hdc )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event type long onncmousemove ( unsignedlong hittestcode,  real xpos,  real ypos )
event onthemechanged ( unsignedinteger eventflag )
event ongetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event onsetfont pbm_setfont
event onmouseleave ( )
event onncmouseleave ( )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event type long onsetfocus ( unsignedlong holdwnd )
event type long onkillfocus ( unsignedlong hnewwnd )
event onpreconstructor ( )
event onpredestructor ( )
event type long onwindowsizing ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long onnclbuttondown ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onimageclicking ( )
event onimageclicked ( )
event oncapturechanged ( )
event type long onnclbuttondblclk ( unsignedlong hittestcode,  real xpos,  real ypos )
event oncreated pbm_other
event onconstructor pbm_constructor
event ondestructor pbm_destructor
theme theme
end type
global s_cst_singlelineedit s_cst_singlelineedit

type prototypes
private:
function boolean SetCueBanner(ulong hwnd,ulong msg,boolean wparam,readonly string lparam) library "user32.dll" alias for "SendMessageW"
end prototypes

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

/*--- Properties ---*/
Public:
PrivateWrite 	Ulong		#Handle
PrivateWrite 	Window	#ParentWindow
ProtectedWrite 	Boolean	#Transparent		= false
Boolean						#LockUpdate		= false
Boolean						#FadeAnimation	= true
Uint							#FadeTime			= 250
PrivateWrite String		#DefaultText
PrivateWrite String		#Image
Boolean						#ImageButton		= false		//图标是否为按钮
PrivateWrite Uint			#ToolTipStyle		= Enums.TTS_NONE
Icon							#ToolTipIcon		= None!
String							#ToolTipTitle
String							#TipText
Long							#TipTime

/*--- Implementation ---*/
Private:
n_canvas		_Canvas
n_imagelist	_ImageList
n_tooltip 		_ToolTip
ICONDATA	IconData
SIZEF			szWord
RECTF			rcWnd

Ulong _TTID	

Boolean _MouseLeaveTracked		= false
Boolean _NcMouseLeaveTracked	= false
Boolean _MouseCaptured			= false

Boolean _MouseOver		= false
Boolean _MouseDown		= false
Boolean _Focused			= false

//Hit-test code
Constant Uint HTVALID	= 100
//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
Constant Uint ADJ_ICON				 	= 4
end variables

forward prototypes
private subroutine _of_initial ()
private subroutine _of_uninitial ()
public function long of_redraw (readonly boolean fadeanimation)
private subroutine _of_trackmouseleave (readonly boolean track)
public function long of_settooltipstyle (readonly unsignedinteger style)
private subroutine _of_showtip (readonly boolean show)
public function long of_setimage (readonly string imagename)
public function long of_settransparent (readonly boolean transparent, readonly boolean bredraw)
public function long of_settransparent (readonly boolean transparent)
public function long of_updateparentbkgnd (readonly boolean bredraw)
private subroutine _of_trackncmouseleave (readonly boolean track)
private subroutine _of_updatepoints ()
private subroutine _of_capturemouse (readonly boolean capture)
public function long of_updatepoints ()
public function long of_setdefaulttext (readonly string deftext)
public function unsignedlong of_getstate ()
public function unsignedlong of_getbuttonstate ()
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
public function long of_reattach ()
end prototypes

event type long onnchittest(real xpos, real ypos);RECTF cliRect
RECTF wndRect

Painter.GetWindowRect(#Handle,ref wndRect)
Painter.GetClientRect(#Handle,ref cliRect)
Painter.ClientToScreen(#Handle,ref cliRect)

Painter.OffsetRect(ref cliRect,-wndRect.left,-wndRect.top)
Painter.OffsetRect(ref wndRect,-wndRect.left,-wndRect.top)

if Not Painter.PtInRect(ref wndRect,xpos,ypos) then return WinMsg.HTNOWHERE

if Painter.PtInRect(ref cliRect,xpos,ypos) then
	return WinMsg.HTCLIENT
else
	return HTVALID
end if

end event

event type long onnccalcsize(unsignedlong lpcrect);RECTF cRect

Painter.CopyRect(ref cRect,lpcRect)

_of_AdjustRect(ref cRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_ICON)

if szWord.cy <> 0 then
	if ((cRect.bottom - cRect.top) - szWord.cy) / 2 > 0 then
		cRect.top += ((cRect.bottom - cRect.top) - szWord.cy) / 2
	end if
end if

Painter.CopyRect(lpcRect,ref cRect)

return 0
end event

event type long onncpaint(unsignedlong hdc);Ulong bkColor,borderColor,transparentColor,nState
RADIUSF rdBorder

nState = of_GetState()
transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,nState)
//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, rcWnd,  transparentColor,false,0) 
end if

if Enabled then
	bkColor = Painter.GetPBColorA(BackColor)
else
	int dcState
	dcState = Painter.SaveDC(hdc)
	bkColor = Painter.GetSolidBrushColorA(Send(Handle(#ParentWindow),WinMsg.WM_CTLCOLORSTATIC,hdc,#Handle))
	Painter.RestoreDC( hdc, dcState)
end if

if Border then
	borderColor = theme.of_GetColor(theme.CLR_BORDER,nState)
	rdBorder = theme.#RoundSize
	Painter.ThemeFill( hdc, rcWnd, bkColor, Enums.VERT, Enums.SOLID,nState, false,theme.#BorderStyle,borderColor,rdBorder)
else
	Painter.ThemeFill( hdc, rcWnd, bkColor, Enums.VERT, Enums.SOLID,nState, false,Enums.BS_NONE,0,0)
end if

if IconData.Index > 0 then
	if #ImageButton then
		if theme.#IconPosition = Enums.LEFT then
			rdBorder.rightTop = 0
			rdBorder.rightBottom = 0
		else
			rdBorder.leftTop = 0
			rdBorder.leftBottom = 0
		end if
		nState = of_GetButtonState()
		if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
			bkColor = theme.of_GetColor(theme.CLR_BTNBKGND,nState)
			Painter.ThemeFill( hdc, IconData.rcPaint, bkColor, Enums.VERT, theme.#BkgndStyle,nState, false,theme.#BorderStyle,borderColor,rdBorder)
		end if
	end if
	if IconData.MouseDown then
		_ImageList.Draw( IconData.Index, hdc, IconData.rcImage.left,IconData.rcImage.top + 1, Not Enabled)
	else
		_ImageList.Draw( IconData.Index, hdc, IconData.rcImage.left,IconData.rcImage.top, Not Enabled)
	end if
end if

return 1
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);boolean bRedraw
RECTF wndRect
POINTF pt

Painter.GetWindowRect(#Handle,ref wndRect)
Painter.GetCursorPos(ref pt)
xpos = pt.x - wndRect.left
ypos = pt.y - wndRect.top

if Not _MouseLeaveTracked and Win32.GetCapture() <> #Handle  then
	_of_TrackMouseLeave(true)
end if

if Painter.PtInRect(ref rcWnd,xpos,ypos) then
	if Not _MouseOver then
		_MouseOver = true
		if #ImageButton then
			if Painter.PtInRect(IconData.rcPaint,xpos,ypos) then
				IconData.MouseOver = true
			end if
		end if
		_of_ShowTip(true)
		bRedraw = true
	elseif #ImageButton then
		if Painter.PtInRect(IconData.rcPaint,xpos,ypos) then
			if Not IconData.MouseOver then
				IconData.MouseOver = true
				bRedraw = true
			end if
		else
			if IconData.MouseOver then
				IconData.MouseOver = false
				bRedraw = true
			end if
		end if
	end if
else
	if _MouseOver then
		_MouseOver = false
		IconData.MouseOver = false
		bRedraw = true
		_of_ShowTip(false)
	end if
end if

if bRedraw then
	of_Redraw(true)
end if

if _MouseCaptured then
	return 1
end if

return 0
end event

event type long onncmousemove(unsignedlong hittestcode, real xpos, real ypos);boolean bRedraw

if Not _NcMouseLeaveTracked then
	_of_TrackNcMouseLeave(true)
end if

if Not _MouseOver then
	_MouseOver = true
	if #ImageButton then
		if Painter.PtInRect(IconData.rcPaint,xpos,ypos) then
			IconData.MouseOver = true
		end if
	else
		_of_ShowTip(true)
	end if
	bRedraw = true
elseif #ImageButton then
	if Painter.PtInRect(IconData.rcPaint,xpos,ypos) then
		if Not IconData.MouseOver then
			IconData.MouseOver = true
			bRedraw = true
		end if
	else
		if IconData.MouseOver then
			IconData.MouseOver = false
			bRedraw = true
		end if
	end if
end if

if bRedraw then
	of_Redraw(true)
end if

return 1
end event

event onsetfont;String ls_Word

ls_Word = "国"
Painter.GetFontTextSize(hFont,ref ls_Word,ref szWord)
_Canvas.UpdateFrame()

return 0
end event

event Onmouseleave();if _MouseOver and Not _NcMouseLeaveTracked then
	_MouseOver = false
	IconData.MouseOver = false
	
	of_Redraw(true)
	_of_ShowTip(false)
end if

_of_TrackMouseLeave(false)
end event

event Onncmouseleave();boolean bRedraw

if Not _MouseCaptured then
	if _MouseOver and Not _MouseLeaveTracked then
		_MouseOver = false
		
		_of_ShowTip(false)
		bRedraw =  true
	elseif _MouseLeaveTracked then
		_of_ShowTip(true)
	end if
	
	if IconData.MouseOver then
		IconData.MouseOver = false
		bRedraw =  true
	end if
	
	if bRedraw then
		of_Redraw(true)
	end if
end if

_of_TrackNcMouseLeave(false)
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);_MouseDown = true

return 0
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);_MouseDown = false

if _MouseCaptured then
	_of_CaptureMouse(false)
	_of_TrackNcMouseLeave(true)
	
	if IconData.MouseDown then
		IconData.MouseDown = false
		of_Redraw(true)
		if IconData.MouseOver then
			if IsAllowed(Event OnImageClicking()) then
				if Not IsValid(this) then return 1
				Event OnImageClicked()
			end if
		end if
	end if
end if

return 0
end event

event type long onsetfocus(unsignedlong holdwnd);_Focused = true
of_Redraw(true)

return 0
end event

event type long onkillfocus(unsignedlong hnewwnd);_Focused = false
of_Redraw(true)

return 0
end event

event type long onwindowsizing(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);rcWnd.right 		= newWidth
rcWnd.bottom 	= newHeight

_of_UpdatePoints()

return 0
end event

event type long onnclbuttondown(unsignedlong hittestcode, real xpos, real ypos);SetFocus()

if Not _NcMouseLeaveTracked  then
	Event	OnNcMouseMove(hittestcode,xpos,ypos)
end if

if #ImageButton then
	if IconData.MouseOver then
		IconData.MouseDown = true
		of_Redraw(false)
		_of_CaptureMouse(true)
	end if
end if

return 0
end event

event Oncapturechanged();if _MouseCaptured then
	IconData.MouseDown = false
	_of_CaptureMouse(false)
	of_Redraw(true)
	Event OnMouseLeave()
end if
end event

event type long onnclbuttondblclk(unsignedlong hittestcode, real xpos, real ypos);return Event OnNcLButtonDown(hittestcode,xpos,ypos)
end event

event oncreated;//不能定义其它PBM_OTHER事件，否则会有冲突
if Message.Number = WinMSG.WM_PUI_CREATED then
	of_Reattach()
	return 0
else
	return Event Other(wparam,lparam)
end if
end event

event onconstructor;_of_Initial()

Event OnPreConstructor()
Event Constructor()
Post Event OnPostConstructor( )
end event

event ondestructor;Event OnPreDestructor()
Event Destructor()

_of_Uninitial()
end event

private subroutine _of_initial ();#Handle = Handle(this)
#ParentWindow = GetParentWindow(this)
_Canvas = Create n_canvas

//Init _ImageList
_ImageList = Create n_imagelist
_ImageList.ShareImage(true)
_ImageList.SetImageSize(theme.#IconSize.cx,theme.#IconSize.cy)

//Init tooltip
_ToolTip = Create n_tooltip
if #ToolTipStyle <> Enums.TTS_NONE then
	choose case #ToolTipStyle
		case Enums.TTS_NORMAL
			_ToolTip.CreateToolTip(#Handle)
			_TTID = _ToolTip.AddTool(#Handle,false,Win32.TTF_SUBCLASS + Win32.TTF_TRANSPARENT)
		case Enums.TTS_BALLOON
			_ToolTip.CreateBalloonTip(#Handle,false)
			_TTID = _ToolTip.AddTool(#Handle,false,Win32.TTF_SUBCLASS + Win32.TTF_TRANSPARENT)
	end choose
end if

//Init singlelineedit data
IconData.Index = _ImageList.AddImage(theme.of_GetIcon(#Image,0))

Event OnSetFont(Send(#Handle,WinMsg.WM_GETFONT,0,0),false)

_Canvas.Attach(This)
end subroutine

private subroutine _of_uninitial ();_Canvas.Detach()
Destroy _Canvas
Destroy _ImageList

if _TTID > 0 then
	_ToolTip.DelTool(#Handle,_TTID)
	_TTID = 0
end if
Destroy _ToolTip
end subroutine

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC

if #LockUpdate then return RetCode.FAILED
if Not Visible then return RetCode.OK

safeDC=_Canvas.GetSafeNcDC()

if #Transparent then
	_Canvas.FillParentBkgnd(safeDC)
end if

Event OnNcPaint(safeDC)

if FadeAnimation then
	_Canvas.ReleaseDC(safeDC,0,#FadeTime)
else
	_Canvas.ReleaseDC(safeDC,0)
end if

return RetCode.OK
end function

private subroutine _of_trackmouseleave (readonly boolean track);TRACKMOUSEEVENT tme

if _MouseLeaveTracked=track then return

_MouseLeaveTracked=track

tme.cbsize = 16
tme.dwflags = Win32.TME_LEAVE
tme.hwndtrack = #Handle
tme.dwhovertime = 0

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(tme)
end subroutine

public function long of_settooltipstyle (readonly unsignedinteger style);if #ToolTipStyle = style then return RetCode.OK

choose case #ToolTipStyle
	case Enums.TTS_NONE,Enums.TTS_NORMAL,Enums.TTS_BALLOON
		if _TTID > 0 then
			_ToolTip.DelTool(#Handle,_TTID)
			_TTID = 0
		end if
		#ToolTipStyle = style
		if #ToolTipStyle <> Enums.TTS_NONE then
			if #ToolTipStyle = Enums.TTS_NORMAL then
				_ToolTip.CreateToolTip(#Handle)
			elseif #ToolTipStyle = Enums.TTS_BALLOON then
				_ToolTip.CreateBalloonTip(#Handle,false)
			end if
			_TTID = _ToolTip.AddTool(#Handle,false,Win32.TTF_SUBCLASS + Win32.TTF_TRANSPARENT)
		end if
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

private subroutine _of_showtip (readonly boolean show);RECTF cliRect

if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _MouseCaptured then return

Painter.GetClientRect(#Handle,ref cliRect)

if #ToolTipStyle <> Enums.TTS_NONE and show then
	if #ToolTipIcon = Information! then
		_ToolTip.SetTitle( Win32.TTI_INFO, #ToolTipTitle)
	elseif #ToolTipIcon = Exclamation! then
		_ToolTip.SetTitle( Win32.TTI_WARNING, #ToolTipTitle)
	elseif #ToolTipIcon = StopSign! then
		_ToolTip.SetTitle( Win32.TTI_ERROR, #ToolTipTitle)
	else
		_ToolTip.SetTitle( Win32.TTI_NONE, #ToolTipTitle)
	end if
	if #TipText <> "" then
		if #TipTime > 0 then
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,#TipTime)
		else
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,-1)
		end if
		_ToolTip.UpdateTipText(#Handle,_TTID,#TipText)
		_ToolTip.UpdateToolRect(#Handle,_TTID,cliRect.left,cliRect.top,cliRect.right,cliRect.bottom)
	else
		_ToolTip.UpdateToolRect(#Handle,_TTID,0,0,0,0)								
	end if
else
	_ToolTip.UpdateToolRect(#Handle,_TTID,0,0,0,0)
end if
end subroutine

public function long of_setimage (readonly string imagename);int oldImageIndex

if imageName = #Image then return RetCode.OK

oldImageIndex = IconData.Index
IconData.Index = _ImageList.AddImage(theme.of_GetIcon(imageName,0))

if (IconData.Index > 0) <> (oldImageIndex > 0) then
	_Canvas.UpdateFrame()
else
	of_Redraw(true)
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

private subroutine _of_trackncmouseleave (readonly boolean track);TRACKMOUSEEVENT tme

if _NcMouseLeaveTracked=track then return

_NcMouseLeaveTracked=track
	
tme.cbsize = 16
tme.dwflags = Win32.TME_LEAVE + Win32.TME_NONCLIENT
tme.hwndtrack = #Handle
tme.dwhovertime = 0

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(tme)
end subroutine

private subroutine _of_updatepoints ();RECTF wndRect
RECTF adjRect

if #LockUpdate then return

wndRect = rcWnd
adjRect = rcWnd
_of_AdjustRect(ref wndRect,ADJ_BORDER)
_of_AdjustRect(ref adjRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if IconData.Index > 0 then
	if theme.#IconPosition = Enums.LEFT then
		IconData.rcImage.left = adjRect.left
		IconData.rcImage.top = ((wndRect.bottom - wndRect.top) - theme.#IconSize.cy ) /2
		IconData.rcImage.right = IconData.rcImage.left + theme.#IconSize.cx
		IconData.rcImage.bottom = IconData.rcImage.top + theme.#IconSize.cy
		IconData.rcPaint.left = rcWnd.left
		IconData.rcPaint.top = rcWnd.top
		IconData.rcPaint.right = IconData.rcImage.right + 2
		IconData.rcPaint.bottom = rcWnd.bottom
	else
		IconData.rcImage.left = adjRect.right - theme.#IconSize.cx
		IconData.rcImage.top = ((wndRect.bottom - wndRect.top) - theme.#IconSize.cy ) /2
		IconData.rcImage.right = IconData.rcImage.left + theme.#IconSize.cx
		IconData.rcImage.bottom = IconData.rcImage.top + theme.#IconSize.cy
		IconData.rcPaint.left = IconData.rcImage.left - 2
		IconData.rcPaint.top = rcWnd.top
		IconData.rcPaint.right = rcWnd.right
		IconData.rcPaint.bottom = rcWnd.bottom
	end if
else
	Painter.SetRectEmpty(IconData.rcImage)
	Painter.SetRectEmpty(IconData.rcPaint)
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

public function long of_updatepoints ();if #LockUpdate then return RetCode.FAILED

_of_UpdatePoints()
of_Redraw(false)

return RetCode.OK
end function

public function long of_setdefaulttext (readonly string deftext);constant long EM_SETCUEBANNER = 5377

if #DefaultText = defText then return RetCode.OK

if Not SetCueBanner(#Handle,EM_SETCUEBANNER,false,defText) then return RetCode.FAILED

#DefaultText = defText

return RetCode.OK
end function

public function unsignedlong of_getstate ();ulong nState

if _MouseOver then nState += Enums.STATE_HOVER
if _Focused then nState += Enums.STATE_FOCUS
if DisplayOnly then nState += Enums.STATE_READONLY
if Not Enabled then nState += Enums.STATE_DISABLED

return nState
end function

public function unsignedlong of_getbuttonstate ();ulong nState

if IconData.MouseOver then nState += Enums.STATE_HOVER
if IconData.MouseDown then nState += Enums.STATE_FOCUS

return nState
end function

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if Border then
	if BitAND(flags,ADJ_BORDER) > 0 then
		fBorderSize = P2DX(1)
		if theme.#BorderStyle = Enums.BS_SOLID or theme.#BorderStyle = Enums.BS_ROUND then
			Painter.InflateRect(ref adjRect,-fBorderSize,-fBorderSize)
		elseif theme.#BorderStyle = Enums.BS_RAISED then
			adjRect.right -= fBorderSize * 2
			adjRect.bottom -= fBorderSize * 2
		end if
	end if
	if BitAND(flags,ADJ_BORDERMARGIN) > 0 then
		adjRect.left += theme.#BorderMargin.left
		adjRect.top += theme.#BorderMargin.top
		adjRect.right -= theme.#BorderMargin.right
		adjRect.bottom -= theme.#BorderMargin.bottom
	end if
end if

if BitAND(flags,ADJ_ICON) > 0 then
	if IconData.Index > 0 then
		if theme.#IconPosition = Enums.LEFT then
			adjRect.left += theme.#IconSize.cx + 4
		else
			adjRect.right -= theme.#IconSize.cx + 4
		end if
	end if
end if
end subroutine

public function long of_reattach ();if Not IsValidObject(_Canvas) then return RetCode.FAILED

_MouseOver = false
_MouseDown = false
IconData.MouseOver = false
IconData.MouseDown = false
_MouseLeaveTracked = false
_NcMouseLeaveTracked = false
_MouseCaptured = false

#Handle = Handle(this)

if _TTID > 0 then
	_ToolTip.DelTool(#Handle,_TTID)
	_TTID = 0
end if

//Init tooltip
if #ToolTipStyle <> Enums.TTS_NONE then
	choose case #ToolTipStyle
		case Enums.TTS_NORMAL
			_ToolTip.CreateToolTip(#Handle)
			_TTID = _ToolTip.AddTool(#Handle,false,Win32.TTF_SUBCLASS + Win32.TTF_TRANSPARENT)
		case Enums.TTS_BALLOON
			_ToolTip.CreateBalloonTip(#Handle,false)
			_TTID = _ToolTip.AddTool(#Handle,false,Win32.TTF_SUBCLASS + Win32.TTF_TRANSPARENT)
	end choose
end if

_Canvas.Attach(this)

return RetCode.OK
end function

on s_cst_singlelineedit.create
this.theme=create theme
end on

on s_cst_singlelineedit.destroy
destroy(this.theme)
end on

type theme from n_cst_singlelineedit_theme within s_cst_singlelineedit descriptor "pb_nvo" = "true" 
end type

on theme.create
call super::create
end on

on theme.destroy
call super::destroy
end on

event onthemechanged;call super::onthemechanged;boolean dirty

if _Canvas.GetHandle() = 0 then return

choose case eventFlag
	case EVT_THEME
		dirty = true
	case EVT_BORDERSTYLE
		dirty = true
	case EVT_ICONPOSITION
		if IconData.Index > 0 then
			dirty = true
		end if
	case EVT_ICONSIZE
		_ImageList.SetImageSize(#IconSize.cx,#IconSize.cy)
		if IconData.Index > 0 then
			dirty = true
		end if
	case EVT_BORDERMARGIN
		dirty = true
end choose

if dirty then
	_Canvas.UpdateFrame()
else
	of_Redraw(true)
end if

Parent.Event OnThemeChanged(eventFlag)
end event

event ongetcolor;call super::ongetcolor;Parent.Event OnGetColor(colorFlag,state,ref color)
end event

