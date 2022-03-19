$PBExportHeader$s_cst_radiobox.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type s_cst_radiobox from radiobutton
end type
type theme from n_cst_radiobox_theme within s_cst_radiobox
end type
end forward

shared variables
n_imagelist _ImageList
Ulong 			__RefCount = 0

//Image indexes
int _Idx_RB_Normal
int _Idx_RB_Hover
int _Idx_RB_Down
int _Idx_RB_Focused
int _Idx_RBC_Normal
int _Idx_RBC_Hover
int _Idx_RBC_Down
int _Idx_RBC_Focused

end variables

global type s_cst_radiobox from radiobutton
integer width = 274
integer height = 96
integer textsize = -12
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
event onpostconstructor ( )
event onpreconstructor ( )
event onpredestructor ( )
event type long onsetfocusquery ( )
event ongetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event onthemechanged ( unsignedinteger eventflag )
event type long onclicking ( )
event type long onpaint ( unsignedlong hdc )
event type long onwindowsize ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event onmouseleave ( )
event oncapturechanged ( )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event onenable pbm_enable
event type long onsettext ( string newtext )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event onsetfont pbm_setfont
event type long onsetfocus ( unsignedlong holdwnd )
event type long onkillfocus ( unsignedlong hnewwnd )
event type long onerasebkgnd ( unsignedlong hdc )
event type long onrbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event onkeydown pbm_keydown
event onkeyup pbm_keyup
event type long onsetcheck ( long ncheck )
event oncreated pbm_other
event onconstructor pbm_constructor
event ondestructor pbm_destructor
theme theme
end type
global s_cst_radiobox s_cst_radiobox

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
ProtectedWrite	Boolean	#Theme				= false
PrivateWrite 	Uint		#ToolTipStyle		= Enums.TTS_NONE
Icon							#ToolTipIcon		= None!
String							#ToolTipTitle
String							#TipText
Long							#TipTime

/*--- Implementation ---*/
Private:
n_canvas		_Canvas
n_tooltip 		_ToolTip
RECTF			rcClient
RECTF			rcText
RECTF			rcImage
SIZEF			szText

Ulong _TTID

Boolean 	_Focused 		= false
Boolean	_MouseOver		= false
Boolean	_MouseDown	= false

Boolean _MouseLeaveTracked	= false
Boolean _MouseCaptured		= false

Boolean _inSetFocusing	= false

//Images
Constant String	ICO_RADIOBOX		= "pfw://zip/images[radiobox.svg]"
Constant String	ICO_RADIOBOX_ON	= "pfw://zip/images[radiobox-on.svg]"
//Sizes
Constant Real ICONSIZE 	= 16 		//px
end variables

forward prototypes
public function long of_redraw (readonly boolean fadeanimation)
private subroutine _of_updatetextsize ()
private subroutine _of_updatepoints ()
public function long of_updatepoints ()
private subroutine _of_trackmouseleave (readonly boolean track)
private subroutine _of_showtip (readonly boolean show)
private subroutine _of_fillbkgnd (readonly unsignedlong hdc)
private subroutine _of_capturemouse (readonly boolean capture)
public function long of_updateparentbkgnd (readonly boolean bredraw)
public function long of_settransparent (readonly boolean transparent, readonly boolean bredraw)
public function long of_settransparent (readonly boolean transparent)
public function long of_settooltipstyle (readonly unsignedinteger style)
public function unsignedlong of_getstate ()
public function long of_reattach ()
end prototypes

event type long onpaint(unsignedlong hdc);ulong txtColor
ulong dtparam

if #LockUpdate then return 1
if Not Visible then return 1

Event OnEraseBkgnd(hdc)

if Checked then
	if _MouseDown then
		_ImageList.Draw(_Idx_RBC_Down,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not Enabled)
	elseif _MouseOver then
		_ImageList.Draw(_Idx_RBC_Hover,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not Enabled)
	elseif _Focused then
		_ImageList.Draw(_Idx_RBC_Focused,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not Enabled)
	else
		_ImageList.Draw(_Idx_RBC_Normal,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not Enabled)
	end if
else
	if _MouseDown then
		_ImageList.Draw(_Idx_RB_Down,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not Enabled)
	elseif _MouseOver then
		_ImageList.Draw(_Idx_RB_Hover,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not Enabled)
	elseif _Focused then
		_ImageList.Draw(_Idx_RB_Focused,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not Enabled)
	else
		_ImageList.Draw(_Idx_RB_Normal,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not Enabled)
	end if
end if

if #Theme then
	txtColor	= theme.of_GetColor(theme.CLR_TEXT,of_GetState())
else
	if Enabled then
		txtColor		= Painter.GetPBColorA(TextColor)
	else
		txtColor		= ARGB(255,128,128,128)
	end if
end if

dtparam = Painter.DT_EXPANDTABS
if theme.#MultiLine then
	dtparam += Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
else
	dtparam += Painter.DT_SINGLELINE + Painter.DT_VCENTER
end if
if Not KeyDown(KeyAlt!) then
	dtparam += Painter.DT_HIDEPREFIX
end if
if theme.#TextAlign = Left! then
	dtparam += Painter.DT_LEFT
elseif theme.#TextAlign = Center! then
	dtparam += Painter.DT_CENTER
elseif theme.#TextAlign = Right! then
	dtparam += Painter.DT_RIGHT
end if

Painter.of_Drawtext(hdc,theme.Font,Text,rcText,txtColor,dtparam)

return 1
end event

event type long onwindowsize(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);rcClient.right = newWidth
rcClient.bottom = newHeight

_of_UpdateTextSize()
_of_UpdatePoints()

return 0
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);int index
boolean bRedraw

if KeyDown(KeyEnter!) or KeyDown(KeySpaceBar!) then return 1

if Not _MouseLeaveTracked and Not _MouseCaptured then
	_of_TrackMouseLeave(true)
end if

if Painter.PtInRect(ref rcClient,xpos,ypos) then
	if Not _MouseOver then
		_MouseOver = true
		_of_ShowTip(true)
		bRedraw = true
	end if
else
	if _MouseOver then
		_MouseOver = false
		bRedraw = true
		_of_ShowTip(false)
	end if
end if

if bRedraw then
	of_Redraw(true)
end if

return 1
end event

event onmouseleave();if KeyDown(KeyEnter!) or KeyDown(KeySpaceBar!) then return

if _MouseOver then
	_MouseOver = false
	
	of_Redraw(true)
	_of_ShowTip(false)
end if

_of_TrackMouseLeave(false)
end event

event oncapturechanged();if _MouseCaptured then
	_MouseDown = false
	_of_CaptureMouse(false)
	Event OnMouseLeave()
end if
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);if Not _MouseLeaveTracked  then
	Event	OnMouseMove(vkey,xpos,ypos)
end if

if IsAllowed(Event OnSetFocusQuery()) then
	_inSetFocusing = true
	SetFocus(this)
	_inSetFocusing = false
end if

_MouseDown = true
of_Redraw(false)
_of_CaptureMouse(true)

return 1
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if Not _MouseCaptured then return 1

_of_CaptureMouse(false)
_of_TrackMouseLeave(true)

if _MouseDown then
	_MouseDown = false
	if _MouseOver then
		if IsAllowed(Event OnClicking()) then
			if Automatic then
				Checked = true
			end if
			Post Event Clicked()
		end if
	end if
	of_Redraw(false)
end if

return 1
end event

event onenable;of_Redraw(true)
return 1
end event

event type long onsettext(string newtext);_of_UpdateTextSize()
of_UpdatePoints()

return 1
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);return Event OnLButtonDown(vkey,xpos,ypos)
end event

event onsetfont;theme.Font.of_SetFont(hFont)
return 0
end event

event type long onsetfocus(unsignedlong holdwnd);_Focused = true
of_Redraw(true)

if _inSetFocusing then return 0

if Automatic and Not Checked then
	if IsAllowed(Event OnClicking()) then
		Checked = true
		Post Event Clicked()
	end if
end if

return 0
end event

event type long onkillfocus(unsignedlong hnewwnd);_Focused = false
of_Redraw(true)

return 0
end event

event type long onerasebkgnd(unsignedlong hdc);if #LockUpdate then return 1

_of_FillBkgnd( hdc)

return 1
end event

event type long onrbuttondown(unsignedlong vkey, real xpos, real ypos);if IsAllowed(Event OnSetFocusQuery()) then
	_inSetFocusing = true
	SetFocus(this)
	_inSetFocusing = false
end if

return 0
end event

event onkeydown;if key = KeySpaceBar! then
	_mouseover=true
	_mousedown=true
	of_Redraw(false)
	return 1
end if

return 0
end event

event onkeyup;if key = KeySpaceBar! then
	if _MouseDown then
		_mouseover=false
		_MouseDown = false
		if IsAllowed(Event OnClicking()) then
			if Automatic then
				Checked = true
			end if
			Post Event Clicked()
		end if
		of_Redraw(false)
	end if
else
	if _MouseDown then
		_MouseDown = false
		of_Redraw(false)
	end if
end if

return 1
end event

event type long onsetcheck(long ncheck);if Checked <> (nCheck = 1) then
	Checked = (nCheck = 1)
end if
of_Redraw(false)
return 0
end event

event oncreated;//不能定义其它PBM_OTHER事件，否则会有冲突
if Message.Number = WinMSG.WM_PUI_CREATED then
	of_Reattach()
	return 0
else
	return Event Other(wparam,lparam)
end if
end event

event onconstructor;#Handle = Handle(this)
#ParentWindow = GetParentWindow(this)
_Canvas = Create n_canvas

//Init _ImageList
__RefCount ++
if __RefCount = 1 then
	_ImageList = Create n_imagelist
	_ImageList.SetImageSize(ICONSIZE,ICONSIZE)
end if

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

theme.Font.of_SetFont(Send(#Handle,WinMsg.WM_GETFONT,0,0))
if LeftText then
	theme.of_SetTextPosition(Enums.LEFT)
end if

_Canvas.Attach(This)

Event OnPreConstructor()

if __RefCount = 1 then
	_Idx_RB_Normal 		= _ImageList.AddImage(theme.of_GetIcon(ICO_RADIOBOX,0))
	_Idx_RB_Hover 		= _ImageList.AddImage(theme.of_GetIcon(ICO_RADIOBOX,Enums.STATE_HOVER))
	_Idx_RB_Down 		= _ImageList.AddImage(theme.of_GetIcon(ICO_RADIOBOX,Enums.STATE_PRESSED))
	_Idx_RB_Focused		= _ImageList.AddImage(theme.of_GetIcon(ICO_RADIOBOX,Enums.STATE_FOCUS))
	_Idx_RBC_Normal 		= _ImageList.AddImage(theme.of_GetIcon(ICO_RADIOBOX_ON,0))
	_Idx_RBC_Hover 		= _ImageList.AddImage(theme.of_GetIcon(ICO_RADIOBOX_ON,Enums.STATE_HOVER))
	_Idx_RBC_Down 		= _ImageList.AddImage(theme.of_GetIcon(ICO_RADIOBOX_ON,Enums.STATE_PRESSED))
	_Idx_RBC_Focused	= _ImageList.AddImage(theme.of_GetIcon(ICO_RADIOBOX_ON,Enums.STATE_FOCUS))
end if

Event Constructor()
Post Event OnPostConstructor( )
end event

event ondestructor;Event OnPreDestructor()
Event Destructor()

_Canvas.Detach()
Destroy _Canvas

if _TTID > 0 then
	_ToolTip.DelTool(#Handle,_TTID)
	_TTID = 0
end if
Destroy _ToolTip

__RefCount --
if __RefCount  = 0 then
	Destroy _ImageList
end if
end event

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC

if #LockUpdate then return RetCode.FAILED
if Not Visible then return RetCode.OK

safeDC=_Canvas.GetSafeDC()

if #Transparent then
	_Canvas.FillParentBkgnd(safeDC)
end if

Event OnPaint(safeDC)

if FadeAnimation then
	_Canvas.ReleaseDC(safeDC,0,#FadeTime)
else
	_Canvas.ReleaseDC(safeDC,0)
end if

return RetCode.OK
end function

private subroutine _of_updatetextsize ();ulong dtparam
RECTF calcRect

if Len(text) = 0 then
	Painter.SetRectEmpty(rcText)
	szText.cx = 0
	szText.cy = 0
	return
end if

calcRect.right = rcClient.right - rcClient.left - ICONSIZE - 2

dtparam = Painter.DT_EXPANDTABS
if theme.#MultiLine then
	dtparam += Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
else
	dtparam += Painter.DT_SINGLELINE
end if

Painter.of_CalcTextSize(theme.Font,text,dtparam,ref calcRect)
if calcRect.bottom > rcClient.bottom - rcClient.top then
	calcRect.bottom = rcClient.bottom - rcClient.top
end if

szText.cx = calcRect.Right
szText.cy = calcRect.Bottom

if szText.cx < 0 or szText.cy < 0 then
	szText.cx = 0
	szText.cy = 0
end if
end subroutine

private subroutine _of_updatepoints ();real itemHeight

if #LockUpdate then return

itemHeight = rcClient.bottom - rcClient.top
if theme.#TextPosition = Enums.LEFT then
	//Set rcImage
	rcImage.left		= rcClient.right - ICONSIZE
	rcImage.right	= rcImage.left + ICONSIZE
	rcImage.top		= rcClient.top + (itemHeight - ICONSIZE) / 2 //取中间
	rcImage.bottom= rcImage.top + ICONSIZE
	//Set rcText
	if szText.cx > 0 then
		rcText.left		= rcClient.left
		rcText.right		= rcImage.left - 2
		rcText.top		= rcClient.top + (itemHeight - szText.cy)/2	//取中间
		rcText.bottom	= rcText.top + szText.cy
	end if
else
	//Set rcImage
	rcImage.left		= rcClient.left
	rcImage.right	= rcImage.left + ICONSIZE
	rcImage.top		= rcClient.top + (itemHeight - ICONSIZE) / 2 //取中间
	rcImage.bottom= rcImage.top + ICONSIZE
	//Set rcText
	if szText.cx > 0 then
		rcText.left		= rcImage.right	+ 2
		rcText.right		= rcClient.right
		rcText.top		= rcClient.top + (itemHeight - szText.cy)/2	//取中间
		rcText.bottom	= rcText.top + szText.cy
	end if
end if
end subroutine

public function long of_updatepoints ();if #LockUpdate then return RetCode.FAILED

_of_UpdatePoints()
of_Redraw(false)

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

private subroutine _of_showtip (readonly boolean show);if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _MouseCaptured then return

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
		_ToolTip.UpdateToolRect(#Handle,_TTID,rcClient.left,rcClient.top,rcClient.right,rcClient.bottom)
	else
		_ToolTip.UpdateToolRect(#Handle,_TTID,0,0,0,0)								
	end if
else
	_ToolTip.UpdateToolRect(#Handle,_TTID,0,0,0,0)
end if
end subroutine

private subroutine _of_fillbkgnd (readonly unsignedlong hdc);ulong bkColor,transparentColor,nState

nState = of_GetState()
transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,nState)
//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, rcClient,  transparentColor,false,0) 
end if
	
if #Theme then
	bkColor = theme.of_GetColor(theme.CLR_BKGND,nState)
	Painter.ThemeFill( hdc, rcClient, bkColor,Enums.VERT,theme.#BkgndStyle,nState,false,Enums.BS_NONE,0,0)
else
	if BackColor <> Win32.COLOR_PBTRANSPARENT then
		Painter.ThemeFill( hdc, rcClient, Painter.GetPBColorA(BackColor),Enums.VERT,theme.#BkgndStyle,nState,false,Enums.BS_NONE,0,0)
	end if
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

public function long of_updateparentbkgnd (readonly boolean bredraw);if Not #Transparent then return RetCode.E_NO_SUPPORT

Win32.UpdateParentBkgnd(#Handle,bRedraw)

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

public function unsignedlong of_getstate ();ulong nState

if _MouseOver then nState += Enums.STATE_HOVER
if _MouseDown then nState += Enums.STATE_PRESSED
if _Focused then nState += Enums.STATE_FOCUS
if Checked then nState += Enums.STATE_CHECKED
if Not Enabled then nState += Enums.STATE_DISABLED

return nState
end function

public function long of_reattach ();if Not IsValidObject(_Canvas) then return RetCode.FAILED

_MouseOver = false
_MouseDown = false
_MouseLeaveTracked = false
_MouseCaptured = false

#Handle = Handle(this)
_Canvas.Attach(this)

return RetCode.OK
end function

on s_cst_radiobox.create
this.theme=create theme
end on

on s_cst_radiobox.destroy
destroy(this.theme)
end on

type theme from n_cst_radiobox_theme within s_cst_radiobox descriptor "pb_nvo" = "true" 
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
		_of_UpdateTextSize()
		dirty = true
	case EVT_TEXTPOSITION
		dirty = true
	case EVT_MULTILINE
		_of_UpdateTextSize()
		dirty = true
	case EVT_FONT
		_of_UpdateTextSize()
		dirty = true
end choose

if dirty then
	of_UpdatePoints()
else
	of_Redraw(true)
end if

Parent.Event OnThemeChanged(eventFlag)
end event

event ongetcolor;call super::ongetcolor;Parent.Event OnGetColor(colorFlag,state,ref color)
end event

