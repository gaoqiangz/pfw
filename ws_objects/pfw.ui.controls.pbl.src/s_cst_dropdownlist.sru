$PBExportHeader$s_cst_dropdownlist.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type s_cst_dropdownlist from dropdownlistbox
end type
type comboboxinfo from structure within s_cst_dropdownlist
end type
type listdrawitem from structure within s_cst_dropdownlist
end type
type icondata from structure within s_cst_dropdownlist
end type
type theme from n_cst_dropdownlist_theme within s_cst_dropdownlist
end type
end forward

type comboboxinfo from structure
	unsignedlong		cbsize
	rectf		rcitem
	rectf		rcbutton
	unsignedlong		statebutton
	unsignedlong		hwndcombo
	unsignedlong		hwnditem
	unsignedlong		hwndlist
end type

type listdrawitem from structure
	integer		index
	boolean		highlight
	unsignedlong		lpcstext
	rectf		rctext
	rectf		rcpaint
end type

type icondata from structure
	integer		index
	rectf		rcimage
end type

global type s_cst_dropdownlist from dropdownlistbox
integer width = 549
integer height = 476
integer textsize = -12
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
event onpostconstructor ( )
event onpreconstructor ( )
event onpredestructor ( )
event ongetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event onthemechanged ( unsignedinteger eventflag )
event type long onpaint ( unsignedlong hdc )
event type long onwindowsize ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event onmouseleave ( )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event onenable pbm_enable
event type long onsetfocus ( unsignedlong holdwnd )
event type long onkillfocus ( unsignedlong hnewwnd )
event type long onerasebkgnd ( unsignedlong hdc )
event type long onrbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event oncreated pbm_other
event onconstructor pbm_constructor
event ondestructor pbm_destructor
event type long ondrawscrollbar ( unsignedlong hdc,  unsignedlong lpsbdi,  boolean bvert,  long flags )
event type long oncreatescrollbar ( unsignedlong lpsbci,  boolean bvert )
event type long onlistnccalcsize ( unsignedlong lpcrect )
event type long onlistncpaint ( unsignedlong hdc )
event type long onlistpaint ( unsignedlong hdc )
event type long onlistdrawitem ( unsignedlong hdc,  unsignedlong lpdi )
event onsetfont pbm_setfont
event type long onsettext ( string newtext )
event type long onselectionchanged ( integer oldindex,  integer newindex )
event type long onshowdropdown ( boolean bshow )
event type long oneditkillfocus ( unsignedlong hnewwnd )
event type long oneditsetfocus ( unsignedlong holdwnd )
event type long oneditmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event oneditmouseleave ( )
event type long oneditlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type unsignedlong onlistgetwindowrgn ( real newwidth,  real newheight )
theme theme
end type
global s_cst_dropdownlist s_cst_dropdownlist

type prototypes
Private:
Function Boolean GetComboBoxInfo(ulong hwndCombo,ref COMBOBOXINFO pcbi) Library "User32.dll"
Subroutine CopyListDrawItem(ref LISTDRAWITEM di,Ulong lpdi,Ulong nLength) Library "kernel32.dll" Alias for "RtlMoveMemory"
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
PrivateWrite 	String		#DefaultText
PrivateWrite 	String		#Image
PrivateWrite 	Uint		#ToolTipStyle		= Enums.TTS_NONE
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
RECTF			rcClient
RECTF			rcText
PAINTPANE	Chevron
SIZEF			szText

Ulong _TTID

Ulong _hWndEdit
Ulong _hWndList

Boolean 	_Focused 		= false
Boolean	_MouseOver		= false
Boolean	_MouseDown	= false

Boolean _MouseLeaveTracked		= false
Boolean _EditMouseLeaveTracked	= false

//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
Constant Uint ADJ_CHEVRON 			= 4
Constant Uint ADJ_ICON				 	= 8
//Sizes
Constant Real CHEVRONWIDTH = 14 	//px
Constant Long SIZEOF_COMBOBOXINFO = 52
Constant Long SIZEOF_LISTDRAWITEM = 40
//Messages
Constant Long CB_SHOWDROPDOWN = 335
end variables

forward prototypes
private subroutine _of_initial ()
private subroutine _of_uninitial ()
private subroutine _of_showtip (readonly boolean show)
public function long of_redraw (readonly boolean fadeanimation)
public function long of_updateparentbkgnd (readonly boolean bredraw)
public function long of_settransparent (readonly boolean transparent, readonly boolean bredraw)
public function long of_settooltipstyle (readonly unsignedinteger style)
private subroutine _of_fillbkgnd (readonly unsignedlong hdc)
private subroutine _of_drawchevron (readonly unsignedlong hdc)
private subroutine _of_drawtext (readonly unsignedlong hdc)
private subroutine _of_updatetextsize ()
private subroutine _of_updatepoints ()
public function long of_updatepoints ()
public function long of_setdefaulttext (readonly string deftext)
private subroutine _of_trackmouseleave (readonly unsignedlong hwnd, readonly boolean track)
public function long of_settransparent (readonly boolean transparent)
public function long of_setimage (readonly string imagename)
public function unsignedlong of_getchevronstate ()
public function unsignedlong of_getstate ()
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
public function long of_reattach ()
end prototypes

event type long onpaint(unsignedlong hdc);if #LockUpdate then return 1
if Not Visible then return 1

Event OnEraseBkgnd(hdc)

if Not ShowList then
	if szText.cx > 0 then
		_of_DrawText(hdc)
	end if
	
	if Chevron.visible then
		_of_DrawChevron(hdc)
	end if
	
	if IconData.Index > 0 then
		if _MouseDown then
			_ImageList.Draw( IconData.Index, hdc, IconData.rcImage.left,IconData.rcImage.top + 1, Not Enabled)
		else
			_ImageList.Draw( IconData.Index, hdc, IconData.rcImage.left,IconData.rcImage.top, Not Enabled)
		end if
	end if
end if

return 1
end event

event type long onwindowsize(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);rcClient.right = newWidth
rcClient.bottom = newHeight

if AllowEdit then
	real nEditHeight
	RECTF editRect
	
	nEditHeight = theme.Font.#WordSize.cy
	
	if ShowList then
		editRect = rcClient
		_of_AdjustRect(ref editRect,ADJ_BORDER + ADJ_BORDERMARGIN)
		editRect.bottom = editRect.top + nEditHeight
	else
		editRect = rcClient
		_of_AdjustRect(ref editRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON + ADJ_ICON)
		editRect.top += (editRect.bottom - editRect.top - nEditHeight) / 2
		editRect.bottom = editRect.top + nEditHeight
	end if
	
	Win32.SetWindowPos(_hWndEdit, D2PX(editRect.left),D2PY(editRect.top),D2PX(editRect.right - editRect.left),D2PY(editRect.bottom - editRect.top))
	if ShowList then
		RECTF listRect
		listRect = rcClient
		listRect.top = editRect.bottom
		Win32.SetWindowPos(_hWndList, D2PX(listRect.left),D2PY(listRect.top),D2PX(listRect.right - listRect.left),D2PY(listRect.bottom - listRect.top))
	end if
end if

_of_UpdateTextSize()
_of_UpdatePoints()

return 0
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);boolean bRedraw

if Not _MouseLeaveTracked then
	_of_TrackMouseLeave(#Handle,true)
end if

if Not _MouseOver then
	if Chevron.Visible then
		if Painter.PtInRect(Chevron.rcPaint,xpos,ypos) then
			Chevron.MouseOver = true
		else
			_of_ShowTip(true)
		end if
	else
		_of_ShowTip(true)
	end if
	_MouseOver = true
	bRedraw = true
else
	if Chevron.Visible then
		if Painter.PtInRect(Chevron.rcPaint,xpos,ypos) then
			if Not Chevron.MouseOver then
				Chevron.MouseOver = true
				bRedraw = true
				_of_ShowTip(false)
			end if
		else
			if Chevron.MouseOver then
				Chevron.MouseOver = false
				bRedraw = true
				_of_ShowTip(true)
			end if
		end if
	end if
end if

if bRedraw then
	of_Redraw(true)
end if

return 1
end event

event onmouseleave();if Not _EditMouseLeaveTracked then
	if _MouseOver then
		_MouseOver = false
		Chevron.MouseOver = false
		of_Redraw(true)
		_of_ShowTip(false)
	end if
end if

_of_TrackMouseLeave(#Handle,false)
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);if Not _MouseLeaveTracked  then
	Event OnMouseMove(vkey,xpos,ypos)
end if

if Not ShowList then
	if Not AllowEdit or Chevron.MouseOver then
		Send(#Handle,CB_SHOWDROPDOWN,1,0)
	end if
end if

return 1
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);return Event OnLButtonDown(vkey,xpos,ypos)
end event

event onenable;of_Redraw(true)
end event

event type long onsetfocus(unsignedlong holdwnd);if Not AllowEdit then
	_Focused = true
	of_Redraw(true)
end if

return 0
end event

event type long onkillfocus(unsignedlong hnewwnd);if Not AllowEdit then
	_Focused = false
	of_Redraw(true)
end if

return 0
end event

event type long onerasebkgnd(unsignedlong hdc);if #LockUpdate then return 1

_of_FillBkgnd( hdc)

return 1
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

sbCreateInfo.fBarSize = theme.#ScrollBarSize
sbCreateInfo.fArrowSize = theme.#ScrollBarArrowSize
sbCreateInfo.rcBorderMargin = theme.#ScrollBarBorderMargin

Win32.CopyScrollBarCreateInfo(lpsbci,ref sbCreateInfo,Win32.SIZEOF_SCROLLBARCREATEINFO)

return 1
end event

event type long onlistnccalcsize(unsignedlong lpcrect);RECTF cRect

Painter.CopyRect(ref cRect,lpcRect)

_of_AdjustRect(ref cRect,ADJ_BORDER)

Painter.CopyRect(lpcRect,ref cRect)

return 0
end event

event type long onlistncpaint(unsignedlong hdc);Ulong bkColor,borderColor
RECTF wndRect
RADIUSF rdBorder

if #LockUpdate then return 1
if Not Visible then return 1

Painter.GetWindowRect(_hWndList,ref wndRect)
Painter.OffsetRect(ref wndRect,-wndRect.left,-wndRect.top)

bkColor = ARGB(255,255,255,255)

if Border and theme.#BorderStyle <> Enums.BS_NONE then
	borderColor = theme.of_GetColor(theme.CLR_BORDER,0)
	if theme.#BorderStyle = Enums.BS_ROUND then
		Painter.of_FillRect( hdc, wndRect,  borderColor ,false,0)
	end if
	rdBorder = theme.#RoundSize
	rdBorder.leftTop = 0
	rdBorder.rightTop = 0
	Painter.ThemeFill( hdc, wndRect, bkColor, Enums.VERT, Enums.SOLID,0, false,theme.#BorderStyle,borderColor,rdBorder)
else
	Painter.ThemeFill( hdc, wndRect, bkColor, Enums.VERT, Enums.SOLID,0, false,Enums.BS_NONE,0,0)
end if

return 1
end event

event type long onlistpaint(unsignedlong hdc);RECTF cliRect

if #LockUpdate then return 1
if Not Visible then return 1

Painter.GetClientRect(_hWndList,ref cliRect)

Painter.of_FillRect( hdc, cliRect,  ARGB(255,255,255,255) ,false,0) 

return 1
end event

event type long onlistdrawitem(unsignedlong hdc, unsignedlong lpdi);ulong clrBack, clrText,nState
ulong dtparam
String ls_text
LISTDRAWITEM di

if #LockUpdate then return 1
if Not Visible then return 1

CopyListDrawItem(ref di,lpdi,SIZEOF_LISTDRAWITEM)

ls_text = String(di.lpcsText,"address")

if di.HighLight then
	nState += Enums.STATE_HOVER
end if
clrBack = theme.of_GetItemColor(di.index,theme.CLR_BKGND,nState)
clrText = theme.of_GetItemColor(di.index,theme.CLR_TEXT,nState)

Painter.of_FillRect( hdc, di.rcPaint,  clrBack ,false, 0) 

dtparam = Painter.DT_EXPANDTABS + Painter.DT_SINGLELINE + Painter.DT_VCENTER + Painter.DT_HIDEPREFIX
if theme.#TextAlign = Left! then
	dtparam += Painter.DT_LEFT
elseif theme.#TextAlign = Center! then
	dtparam += Painter.DT_CENTER
elseif theme.#TextAlign = Right! then
	dtparam += Painter.DT_RIGHT
end if

Painter.of_Drawtext(hdc,theme.Font,ls_text,ref di.rcText,clrText,dtparam)

return 1
end event

event onsetfont;//theme.Font.of_SetFont(hFont)
theme.Font.of_SetFont(Send(_hWndList,WinMsg.WM_GETFONT,0,0))
_Canvas.UpdateFrame()
return 0
end event

event type long onsettext(string newtext);if Not AllowEdit then
	_of_UpdateTextSize()
	of_UpdatePoints()
end if

return 0
end event

event type long onselectionchanged(integer oldindex, integer newindex);return Event SelectionChanged(newIndex)
end event

event type long onshowdropdown(boolean bshow);if bShow then
	if AllowEdit then
		Chevron.MouseDown = true
		of_Redraw(false)
	else
		_MouseDown = true
		of_Redraw(false)
	end if
else
	if AllowEdit then
		Chevron.MouseDown = false
		of_Redraw(true)
	else
		_MouseDown = false
		of_Redraw(true)
	end if
end if
return 0
end event

event type long oneditkillfocus(unsignedlong hnewwnd);_Focused = false
of_Redraw(true)

return 0
end event

event type long oneditsetfocus(unsignedlong holdwnd);_Focused = true
of_Redraw(true)

return 0
end event

event type long oneditmousemove(unsignedlong vkey, real xpos, real ypos);boolean bRedraw

if Not AllowEdit then return 1

if Not _EditMouseLeaveTracked then
	_of_TrackMouseLeave(_hWndEdit,true)
end if

if Not _MouseOver then
	_of_ShowTip(true)
	_MouseOver = true
	bRedraw = true
end if

if bRedraw then
	of_Redraw(true)
end if

return 0
end event

event oneditmouseleave();if Not _MouseLeaveTracked then
	if _MouseOver then
		_MouseOver = false
		of_Redraw(true)
		_of_ShowTip(false)
	end if
end if

_of_TrackMouseLeave(_hWndEdit,false)
end event

event type long oneditlbuttondown(unsignedlong vkey, real xpos, real ypos);_of_ShowTip(false)

return 0
end event

event type unsignedlong onlistgetwindowrgn(real newwidth, real newheight);ulong wndRgn
RADIUSF rdBorder

if theme.#BorderStyle = Enums.BS_ROUND then
	rdBorder = theme.#RoundSize
	rdBorder.leftTop = 0
	rdBorder.rightTop = 0
	wndRgn = Painter.CreateRoundRectRgn(0,0,newWidth + 1,newHeight + 1,ref rdBorder)
else
	//wndRgn = Painter.CreateRectRgn(0,0,newWidth,newHeight)
	wndRgn = 0
end if

return wndRgn
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
			_TTID = _ToolTip.AddTool(#Handle,false,Win32.TTF_TRANSPARENT + Win32.TTF_TRACK + Win32.TTF_ABSOLUTE)
		case Enums.TTS_BALLOON
			_ToolTip.CreateBalloonTip(#Handle,false)
			_TTID = _ToolTip.AddTool(#Handle,false,Win32.TTF_TRANSPARENT + Win32.TTF_TRACK + Win32.TTF_ABSOLUTE)
	end choose
end if

Chevron.Visible = (Not ShowList)

COMBOBOXINFO cboInfo
cboInfo.cbSize = SIZEOF_COMBOBOXINFO
if GetComboBoxInfo(#Handle,ref cboInfo) then
	if AllowEdit then
		_hWndEdit = cboInfo.hWndItem
	end if
	_hWndList = cboInfo.hWndList
end if

theme.Font.of_SetFont(Send(_hWndList,WinMsg.WM_GETFONT,0,0))

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

private subroutine _of_showtip (readonly boolean show);POINTF pt

if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return

if #ToolTipStyle <> Enums.TTS_NONE and show then
	if #TipText <> "" then
		_ToolTip.TrackActivate(#Handle,_TTID,false)
		if #ToolTipIcon = Information! then
			_ToolTip.SetTitle( Win32.TTI_INFO, #ToolTipTitle)
		elseif #ToolTipIcon = Exclamation! then
			_ToolTip.SetTitle( Win32.TTI_WARNING, #ToolTipTitle)
		elseif #ToolTipIcon = StopSign! then
			_ToolTip.SetTitle( Win32.TTI_ERROR, #ToolTipTitle)
		else
			_ToolTip.SetTitle( Win32.TTI_NONE, #ToolTipTitle)
		end if
		if #TipTime > 0 then
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,#TipTime)
		else
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,-1)
		end if
		_ToolTip.UpdateTipText(#Handle,_TTID,#TipText)
		Painter.GetCursorPos(ref pt)
		_ToolTip.TrackPosition( 0,pt.x,pt.y + 16)
		_ToolTip.TrackActivate(#Handle,_TTID,true)
	else
		_ToolTip.TrackActivate(#Handle,_TTID,false)
	end if
else
	_ToolTip.TrackActivate(#Handle,_TTID,false)
end if
end subroutine

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

private subroutine _of_fillbkgnd (readonly unsignedlong hdc);ulong borderColor,bkColor,transparentColor,nState,nChevronState
RADIUSF rdBorder,rdChevron
RECTF paintRect

nState = of_GetState()
transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,nState)
//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, rcClient,  transparentColor,false,0) 
end if

rdBorder = theme.#RoundSize

borderColor	 = theme.of_GetColor(theme.CLR_BORDER,nState)

//Get colors
if Enabled then
	if AllowEdit then
		bkColor = ARGB(255,255,255,255)
		if Chevron.mousedown then
			rdBorder.leftBottom = 0
			rdBorder.rightBottom = 0
		end if
		Painter.ThemeFill( hdc, rcClient, bkColor,theme.#BkgndOrientation,Enums.SOLID,nState,false,&
										theme.#BorderStyle,borderColor,rdBorder)
		if Not ShowList then
			paintRect = rcClient
			paintRect.right = Chevron.rcPaint.left + 1
			rdChevron.rightTop = rdBorder.rightTop
			rdChevron.rightBottom = rdBorder.rightBottom
			nChevronState = of_GetChevronState()
			bkColor = theme.of_GetColor(theme.CLR_CHEVRONBKGND,nState)
			borderColor = theme.of_GetColor(theme.CLR_CHEVRONBORDER,nState)
			if BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
				Painter.ThemeFill( hdc, Chevron.rcPaint, bkColor,theme.#BkgndOrientation,theme.#BkgndStyle,nChevronState,false,&
														theme.#BorderStyle,borderColor,rdChevron)
			end if
		end if
	else
		bkColor = theme.of_GetColor(theme.CLR_BKGND,nState)
		if _mouseDown then
			rdBorder.leftBottom = 0
			rdBorder.rightBottom = 0
		end if
		Painter.ThemeFill( hdc, rcClient, bkColor,theme.#BkgndOrientation,theme.#BkgndStyle,nState,false,&
										theme.#BorderStyle,borderColor,rdBorder)
	end if
else
	if AllowEdit then
		int dcState
		dcState = Painter.SaveDC(hdc)
		bkColor = Painter.GetSolidBrushColorA(Send(Handle(#ParentWindow),WinMsg.WM_CTLCOLORSTATIC,hdc,#Handle))
		Painter.RestoreDC( hdc, dcState)
	else
		bkColor = theme.of_GetColor(theme.CLR_BKGND,nState)
	end if
	Painter.ThemeFill( hdc, rcClient, bkColor,theme.#BkgndOrientation,theme.#BkgndStyle,nState,false,&
									theme.#BorderStyle,borderColor,rdBorder)
end if
end subroutine

private subroutine _of_drawchevron (readonly unsignedlong hdc);Constant real ARROWSIZE = 6
ulong arrowColor

if Not Chevron.Visible then return

arrowColor	= theme.of_GetColor(theme.CLR_ARROW,of_GetChevronState())

//Draw arrow
POINTF pt1,pt2,pt3

pt1.x = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE)/2
pt1.y = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - ARROWSIZE / 2) / 2

if Chevron.MouseDown or _MouseDown then
	pt1.y += 1
end if

pt2.x = pt1.x + ARROWSIZE
pt2.y = pt1.y
pt3.x = pt1.x + ARROWSIZE / 2
pt3.y = pt1.y + ARROWSIZE / 2

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

private subroutine _of_drawtext (readonly unsignedlong hdc);ulong clrText
ulong dtparam

if AllowEdit then return
	
clrText = theme.of_GetColor(theme.CLR_TEXT,of_GetState())

dtparam = Painter.DT_EXPANDTABS
dtparam += Painter.DT_SINGLELINE + Painter.DT_VCENTER + Painter.DT_WORD_ELLIPSIS
dtparam += Painter.DT_HIDEPREFIX

if theme.#TextAlign = Left! then
	dtparam += Painter.DT_LEFT
elseif theme.#TextAlign = Center! then
	dtparam += Painter.DT_CENTER
elseif theme.#TextAlign = Right! then
	dtparam += Painter.DT_RIGHT
end if

if _MouseDown then
	Painter.of_Drawtext(hdc,theme.Font,text,rcText.left,rcText.top + 1,rcText.right,rcText.bottom + 1,clrText,dtparam)
else
	Painter.of_Drawtext(hdc,theme.Font,text,ref rcText,clrText,dtparam)
end if
end subroutine

private subroutine _of_updatetextsize ();ulong dtparam
RECTF calcRect
RECTF cliRect

if AllowEdit then return

if Len(text) = 0 then
	Painter.SetRectEmpty(rcText)
	szText.cx = 0
	szText.cy = 0
	return
end if

cliRect = rcClient
_of_AdjustRect(ref cliRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

calcRect.right = cliRect.right - cliRect.left

calcRect.right -= CHEVRONWIDTH + 2
if IconData.Index > 0 then
	calcRect.right -= theme.#IconSize.cx + 2
end if

dtparam = Painter.DT_EXPANDTABS + Painter.DT_SINGLELINE

Painter.of_CalcTextSize(theme.Font,text,dtparam,ref calcRect)
if calcRect.bottom > cliRect.bottom - cliRect.top then
	calcRect.bottom = cliRect.bottom - cliRect.top
end if

szText.cx = calcRect.Right
szText.cy = calcRect.Bottom

if szText.cx < 0 or szText.cy < 0 then
	szText.cx = 0
	szText.cy = 0
end if
end subroutine

private subroutine _of_updatepoints ();real itemHeight
RECTF clientRect

if #LockUpdate then return
if ShowList then return

clientRect = rcClient
_of_AdjustRect(ref clientRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)
itemHeight = clientRect.bottom - clientRect.top

if IconData.Index > 0 then
	IconData.rcImage.left = clientRect.left
	IconData.rcImage.top = ((rcClient.bottom - rcClient.top) - theme.#IconSize.cy ) /2
	IconData.rcImage.right = IconData.rcImage.left + theme.#IconSize.cx
	IconData.rcImage.bottom = IconData.rcImage.top + theme.#IconSize.cy
else
	Painter.SetRectEmpty(IconData.rcImage)
end if

if Not AllowEdit then
	if szText.cx > 0 then
		//Set rcText
		if IconData.Index > 0 then
			rcText.left	= IconData.rcImage.right + 2
		else
			rcText.left	= clientRect.left
		end if
		rcText.right		= clientRect.right
		rcText.top		= clientRect.top + (itemHeight - szText.cy)/2	//取中间
		rcText.bottom	= rcText.top + szText.cy
	end if
end if

//Set chevron
if Chevron.Visible then
	Chevron.rcPaint.left		= rcClient.right - CHEVRONWIDTH
	Chevron.rcPaint.right		= rcClient.right
	Chevron.rcPaint.top		= rcClient.top
	Chevron.rcPaint.bottom	= rcClient.bottom
end if
end subroutine

public function long of_updatepoints ();if #LockUpdate then return RetCode.FAILED

_of_UpdatePoints()
of_Redraw(false)

return RetCode.OK
end function

public function long of_setdefaulttext (readonly string deftext);constant long EM_SETCUEBANNER = 5377

if Not AllowEdit then return RetCode.E_NO_SUPPORT
if #DefaultText = defText then return RetCode.OK

if Not SetCueBanner(_hWndEdit,EM_SETCUEBANNER,false,defText) then return RetCode.FAILED

#DefaultText = defText

return RetCode.OK
end function

private subroutine _of_trackmouseleave (readonly unsignedlong hwnd, readonly boolean track);TRACKMOUSEEVENT tme

if hWnd = _hWndEdit then
	if _EditMouseLeaveTracked = track then return
	_EditMouseLeaveTracked=track
else
	if _MouseLeaveTracked=track then return
	_MouseLeaveTracked=track
end if

tme.cbsize = 16
tme.dwflags = Win32.TME_LEAVE
tme.hwndtrack = hWnd
tme.dwhovertime = 0

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(tme)
end subroutine

public function long of_settransparent (readonly boolean transparent);return of_SetTransparent(transparent,true)
end function

public function long of_setimage (readonly string imagename);int oldImageIndex

if imageName = #Image then return RetCode.OK

oldImageIndex = IconData.Index
IconData.Index = _ImageList.AddImage(imageName)

if (IconData.Index > 0) <> (oldImageIndex > 0) then
	_Canvas.UpdateFrame()
else
	of_Redraw(true)
end if

return RetCode.OK
end function

public function unsignedlong of_getchevronstate ();ulong nState

if Chevron.MouseDown then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if Chevron.MouseOver then nState += Enums.STATE_HOVER
end if
if _Focused then nState += Enums.STATE_FOCUS

return nState
end function

public function unsignedlong of_getstate ();ulong nState

if Not AllowEdit and _MouseDown then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if _MouseOver then nState += Enums.STATE_HOVER
	if _MouseDown then nState += Enums.STATE_PRESSED
end if
if _Focused then nState += Enums.STATE_FOCUS
if Not Enabled then nState += Enums.STATE_DISABLED

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

if BitAND(flags,ADJ_CHEVRON) > 0 then
	if Chevron.visible then
		adjRect.right -= CHEVRONWIDTH
		if AllowEdit and BitAND(flags,ADJ_BORDERMARGIN) > 0 then
			adjRect.right += theme.#BorderMargin.right
		end if
	end if
end if

if BitAND(flags,ADJ_ICON) > 0 then
	if IconData.Index > 0 then
		adjRect.left += theme.#IconSize.cx + 2
	end if
end if
end subroutine

public function long of_reattach ();if Not IsValidObject(_Canvas) then return RetCode.FAILED

_MouseOver = false
_MouseDown = false
_MouseLeaveTracked = false
Chevron.Visible = (Not ShowList)

#Handle = Handle(this)

COMBOBOXINFO cboInfo
cboInfo.cbSize = SIZEOF_COMBOBOXINFO
if GetComboBoxInfo(#Handle,ref cboInfo) then
	if AllowEdit then
		_hWndEdit = cboInfo.hWndItem
	end if
	_hWndList = cboInfo.hWndList
else
	_hWndEdit = 0
	_hWndList = 0
end if

_Canvas.Attach(This)

return RetCode.OK
end function

on s_cst_dropdownlist.create
this.theme=create theme
end on

on s_cst_dropdownlist.destroy
destroy(this.theme)
end on

type theme from n_cst_dropdownlist_theme within s_cst_dropdownlist descriptor "pb_nvo" = "true" 
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
	case EVT_ROUNDSIZE
		dirty = true
	case EVT_ICONSIZE
		_ImageList.SetImageSize(#IconSize.cx,#IconSize.cy)
		if IconData.Index > 0 then
			dirty = true
		end if
	case EVT_SCROLLBARSIZE,EVT_SCROLLBARARROWSIZE
		if HScrollBar or VScrollBar then
			Send(_hWndList,WinMsg.WM_PUI_UPDATESCROLLBARSIZE,Win32.SB_BOTH,0)
		end if
end choose

if dirty then
	_Canvas.UpdateFrame()
	if ShowList then
		Send(_hWndList,WinMsg.WM_PUI_UPDATEFRAME,0,0)
	end if
else
	of_Redraw(true)
end if

Parent.Event OnThemeChanged(eventFlag)
end event

event ongetitemcolor;call super::ongetitemcolor;Parent.Event OnGetItemColor(index,colorFlag,state,ref color)
end event

