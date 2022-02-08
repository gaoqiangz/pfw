$PBExportHeader$s_cst_statictext.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type s_cst_statictext from statictext
end type
type theme from n_cst_statictext_theme within s_cst_statictext
end type
end forward

global type s_cst_statictext from statictext
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
event type long onwindowsize ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long onpaint ( unsignedlong hdc )
event type long onerasebkgnd ( unsignedlong hdc )
event onconstructor pbm_constructor
event ondestructor pbm_destructor
event oncreated pbm_other
event ongetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event onpostconstructor ( )
event onpreconstructor ( )
event onpredestructor ( )
event onthemechanged ( unsignedinteger eventflag )
event onsetfont pbm_setfont
theme theme
end type
global s_cst_statictext s_cst_statictext

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
public:
privatewrite	ulong		#Handle
privatewrite	window	#ParentWindow
privatewrite	boolean	#Transparent	= false
boolean						#LockUpdate		= false
boolean						#FadeAnimation	= true
uint							#FadeTime		= 250
protectedwrite boolean	#Theme			= false

/*--- Implementation ---*/
private:
n_canvas _Canvas
RECTF _rcClient
RECTF _rcText
SIZEF _szText

ulong _hFont
end variables

forward prototypes
private subroutine _of_updatetextsize ()
private subroutine _of_updatepoints ()
public function unsignedlong of_getstate ()
public function long of_updatepoints ()
public function long of_redraw (readonly boolean fadeanimation)
public function long of_settransparent (readonly boolean transparent, readonly boolean bredraw)
public function long of_settransparent (readonly boolean transparent)
public function long of_updateparentbkgnd (readonly boolean bredraw)
private subroutine _of_initial ()
private subroutine _of_uninitial ()
public function long of_reattach ()
end prototypes

event type long onwindowsize(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);_rcClient.right = newWidth
_rcClient.bottom = newHeight

_of_UpdatePoints()

return 0
end event

event type long onpaint(unsignedlong hdc);ulong txtColor
ulong dtparam

if #LockUpdate then return 1
if Not Visible then return 1

Event OnEraseBkgnd(hdc)

if #Theme then
	txtColor = theme.of_GetColor(theme.CLR_TEXT,of_GetState())
else
	if DisabledLook then
		txtColor = ARGB(255,128,128,128)
	else
		txtColor = Painter.GetPBColorA(TextColor)
	end if
end if

dtparam = Painter.DT_EXPANDTABS
if theme.#MultiLine then
	dtparam += Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
else
	dtparam += Painter.DT_SINGLELINE
end if
if Not KeyDown(KeyAlt!) then
	dtparam += Painter.DT_HIDEPREFIX
end if
if #Theme then
	if theme.#TextAlign = Left! then
		dtparam += Painter.DT_LEFT
	elseif theme.#TextAlign = Center! then
		dtparam += Painter.DT_CENTER
	elseif theme.#TextAlign = Right! then
		dtparam += Painter.DT_RIGHT
	end if
else
	if Alignment = Left! then
		dtparam += Painter.DT_LEFT
	elseif Alignment = Center! then
		dtparam += Painter.DT_CENTER
	elseif Alignment = Right! then
		dtparam += Painter.DT_RIGHT
	end if
end if
if RightToLeft then
	dtparam += Painter.DT_RTLREADING
end if

_of_UpdatePoints()

if #Theme then
	Painter.of_Drawtext(hdc,theme.Font,Text,_rcText,txtColor,dtparam)
else
	Painter.DrawText(hdc,_hFont,text,_rcText,txtColor,false,dtparam)
end if

return 1
end event

event type long onerasebkgnd(unsignedlong hdc);ulong bkColor,bdColor,transparentColor,nState

if #LockUpdate then return 1

nState = of_GetState()
transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,nState)
//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, _rcClient,  transparentColor,false,0) 
end if

if #Theme then
	bkColor = theme.of_GetColor(theme.CLR_BKGND,nState)
	bdColor = theme.of_GetColor(theme.CLR_BORDER,nState)
	Painter.ThemeFill( hdc, _rcClient, bkColor,theme.#BkgndOrientation,theme.#BkgndStyle,nState,false,theme.#BorderStyle,bdColor,theme.#RoundSize)
else
	if BackColor <> Win32.COLOR_PBTRANSPARENT then
		bkColor = Painter.GetPBColorA(BackColor)
	end if
	if Border then
		bdColor = Painter.GetPBColorA(BorderColor)
	end if
	Painter.ThemeFill( hdc, _rcClient, bkColor,Enums.VERT,Enums.SOLID,nState,Border,Enums.BS_SOLID,bdColor,0)
end if

return 1
end event

event onconstructor;_of_Initial()

Event OnPreConstructor()
Event Constructor()
Post Event OnPostConstructor()
end event

event ondestructor;Event OnPreDestructor()
Event Destructor()

_of_Uninitial()
end event

event oncreated;//不能定义其它PBM_OTHER事件，否则会有冲突
if Message.Number = WinMSG.WM_PUI_CREATED then
	of_Reattach()
	return 0
else
	return Event Other(wparam,lparam)
end if
end event

event onsetfont;_hFont = hFont
theme.Font.of_SetFont(hFont)
return 0
end event

private subroutine _of_updatetextsize ();ulong dtparam
real fXMargin,fYMargin
RECTF calcRect

if theme.#TextVAlign = Top! then return
if text = "" then
	Painter.SetRectEmpty(_rcText)
	_szText.cx = 0
	_szText.cy = 0
	return
end if

fXMargin = theme.#BorderMargin.left + theme.#BorderMargin.right
fYMargin = theme.#BorderMargin.top + theme.#BorderMargin.bottom

calcRect.right = _rcClient.right - _rcClient.left - fXMargin

dtparam = Painter.DT_EXPANDTABS
if theme.#MultiLine then
	dtparam += Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
else
	dtparam += Painter.DT_SINGLELINE
end if

Painter.of_CalcTextSize(theme.Font,text,dtparam,ref calcRect)
if calcRect.bottom > _rcClient.bottom - _rcClient.top - fYMargin then
	calcRect.bottom = _rcClient.bottom - _rcClient.top - fYMargin
end if

_szText.cx = calcRect.Right
_szText.cy = calcRect.Bottom

if _szText.cx < 0 or _szText.cy < 0 then
	_szText.cx = 0
	_szText.cy = 0
end if
end subroutine

private subroutine _of_updatepoints ();if #LockUpdate then return

_of_UpdateTextSize()

if #theme then
	_rcText.left = _rcClient.left + theme.#BorderMargin.left
	_rcText.top = _rcClient.top + theme.#BorderMargin.top
	_rcText.bottom = _rcClient.bottom - theme.#BorderMargin.bottom
	_rcText.right = _rcClient.right - theme.#BorderMargin.right
else
	_rcText = _rcClient
	if Border then
		Win32.InflateRect(ref _rcText,-P2DX(1),-P2DY(1))
	end if
end if

choose case theme.#TextVAlign
	case VCenter!
		_rcText.top = _rcText.top + (_rcText.bottom - _rcText.top - _szText.cy) / 2
	case Bottom!
		_rcText.top = _rcText.bottom - _szText.cy
end choose
end subroutine

public function unsignedlong of_getstate ();ulong nState

if DisabledLook then nState += Enums.STATE_DISABLED

return nState
end function

public function long of_updatepoints ();if #LockUpdate then return RetCode.FAILED

_of_UpdatePoints()
of_Redraw(false)

return RetCode.OK
end function

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

private subroutine _of_initial ();#Handle = Handle(this)
#ParentWindow = GetParentWindow(this)
_Canvas = Create n_canvas

_hFont = Send(#Handle,WinMsg.WM_GETFONT,0,0)
theme.Font.of_SetFont(_hFont)

_Canvas.Attach(this)
end subroutine

private subroutine _of_uninitial ();_Canvas.Detach()
Destroy _Canvas
end subroutine

public function long of_reattach ();if Not IsValidObject(_Canvas) then return RetCode.FAILED

#Handle = Handle(this)
_Canvas.Attach(this)

return RetCode.OK
end function

on s_cst_statictext.create
this.theme=create theme
end on

on s_cst_statictext.destroy
destroy(this.theme)
end on

type theme from n_cst_statictext_theme within s_cst_statictext descriptor "pb_nvo" = "true" 
end type

on theme.create
call super::create
end on

on theme.destroy
call super::destroy
end on

event onthemechanged;call super::onthemechanged;if _Canvas.GetHandle() = 0 then return

of_Redraw(true)

Parent.Event OnThemeChanged(eventFlag)
end event

event ongetcolor;call super::ongetcolor;Parent.Event OnGetColor(colorFlag,state,ref color)
end event

