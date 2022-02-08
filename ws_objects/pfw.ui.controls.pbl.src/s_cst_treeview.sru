$PBExportHeader$s_cst_treeview.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type s_cst_treeview from treeview
end type
type theme from n_cst_treeview_theme within s_cst_treeview
end type
end forward

global type s_cst_treeview from treeview
integer width = 549
integer height = 476
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
event onthemechanged ( unsignedinteger eventflag )
event onpredestructor ( )
event onpreconstructor ( )
event onpostconstructor ( )
event ongetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event oncreated pbm_other
event type long onnccalcsize ( unsignedlong lpcrect )
event type long onncpaint ( unsignedlong hdc )
event type long ondrawscrollbar ( unsignedlong hdc,  unsignedlong lpsbdi,  boolean bvert,  long flags )
event type long oncreatescrollbar ( unsignedlong lpsbci,  boolean bvert )
event onconstructor pbm_constructor
event ondestructor pbm_destructor
theme theme
end type
global s_cst_treeview s_cst_treeview

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

/*--- Implementation ---*/
Private:
n_canvas	 _Canvas

//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
end variables

forward prototypes
private subroutine _of_initial ()
private subroutine _of_uninitial ()
public function long of_redraw (readonly boolean fadeanimation)
public function long of_updateparentbkgnd (readonly boolean bredraw)
public function long of_settransparent (readonly boolean transparent, readonly boolean bredraw)
public function long of_settransparent (readonly boolean transparent)
public function long of_updatepoints ()
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
public function long of_reattach ()
end prototypes

event oncreated;//不能定义其它PBM_OTHER事件，否则会有冲突
if Message.Number = WinMSG.WM_PUI_CREATED then
	of_Reattach()
	return 0
else
	return Event Other(wparam,lparam)
end if
end event

event type long onnccalcsize(unsignedlong lpcrect);RECTF cRect

Painter.CopyRect(ref cRect,lpcRect)

_of_AdjustRect(ref cRect,ADJ_BORDER + ADJ_BORDERMARGIN)

Painter.CopyRect(lpcRect,ref cRect)

return 0
end event

event type long onncpaint(unsignedlong hdc);Ulong bkColor,borderColor,transparentColor
RECTF wndRect
RADIUSF rdBorder

Painter.GetWindowRect(#Handle,ref wndRect)
Painter.OffsetRect(ref wndRect,-wndRect.left,-wndRect.top)

transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,0)
//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, wndRect,  transparentColor,false,0) 
end if

bkColor = Painter.GetPBColorA(BackColor)

if Border then
	borderColor = theme.of_GetColor(theme.CLR_BORDER,0)
	rdBorder = theme.#RoundSize
	Painter.ThemeFill( hdc, wndRect, bkColor, Enums.VERT, Enums.SOLID,0, false,theme.#BorderStyle,borderColor,rdBorder)
else
	Painter.ThemeFill( hdc, wndRect, bkColor, Enums.VERT, Enums.SOLID,0, false,Enums.BS_NONE,0,0)
end if

return 1
end event

event type long ondrawscrollbar(unsignedlong hdc, unsignedlong lpsbdi, boolean bvert, long flags);Ulong bkColor,transparentColor
SCROLLBARDRAWINFO sbDrawInfo

Win32.CopyScrollBarDrawInfo(ref sbDrawInfo,lpsbdi,Win32.SIZEOF_SCROLLBARDRAWINFO)

transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,0)
//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, sbDrawInfo.rcPaint,  transparentColor,false,0) 
end if

bkColor = Painter.GetPBColorA(BackColor)
Painter.of_FillRect( hdc, sbDrawInfo.rcPaint,  bkColor,false,0) 

Painter.of_DrawScrollBar(hdc,sbDrawInfo,bVert,flags,theme,theme.#ScrollBarBorderStyle,theme.#ScrollBarRoundSize)

return 1
end event

event type long oncreatescrollbar(unsignedlong lpsbci, boolean bvert);SCROLLBARCREATEINFO sbCreateInfo

Win32.CopyScrollBarCreateInfo(ref sbCreateInfo,lpsbci,Win32.SIZEOF_SCROLLBARCREATEINFO)

sbCreateInfo.fBarSize = theme.#ScrollBarSize
sbCreateInfo.fArrowSize = theme.#ScrollBarArrowSize
sbCreateInfo.rcBorderMargin = theme.#ScrollBarBorderMargin

Win32.CopyScrollBarCreateInfo(lpsbci,ref sbCreateInfo,Win32.SIZEOF_SCROLLBARCREATEINFO)

return 1
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

_Canvas.Attach(This)
end subroutine

private subroutine _of_uninitial ();_Canvas.Detach()
Destroy _Canvas
end subroutine

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

if Win32.GetScrollBarDrawInfo(#Handle,Win32.SB_VERT,ref sbDrawInfo) then
	Painter.of_DrawScrollBar(safeDC,sbDrawInfo,true,Win32.DSF_ALL,theme,theme.#ScrollBarBorderStyle,theme.#ScrollBarRoundSize)
end if
if Win32.GetScrollBarDrawInfo(#Handle,Win32.SB_HORZ,ref sbDrawInfo) then
	Painter.of_DrawScrollBar(safeDC,sbDrawInfo,false,Win32.DSF_ALL,theme,theme.#ScrollBarBorderStyle,theme.#ScrollBarRoundSize)
end if

if FadeAnimation then
	_Canvas.ReleaseDC(safeDC,0,#FadeTime)
else
	_Canvas.ReleaseDC(safeDC,0)
end if

return RetCode.OK
end function

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

public function long of_updatepoints ();if #LockUpdate then return RetCode.FAILED

of_Redraw(false)

return RetCode.OK
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
end subroutine

public function long of_reattach ();if IsValidObject(_Canvas) then return RetCode.FAILED

#Handle = Handle(this)
_Canvas.Attach(this)

return RetCode.OK
end function

on s_cst_treeview.create
this.theme=create theme
end on

on s_cst_treeview.destroy
destroy(this.theme)
end on

type theme from n_cst_treeview_theme within s_cst_treeview descriptor "pb_nvo" = "true" 
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
	case EVT_BORDERMARGIN
		dirty = true
	case EVT_SCROLLBARSIZE,EVT_SCROLLBARARROWSIZE
		Send(#Handle,WinMsg.WM_PUI_UPDATESCROLLBARSIZE,Win32.SB_BOTH,0)
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

