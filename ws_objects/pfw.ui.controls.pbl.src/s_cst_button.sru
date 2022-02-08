$PBExportHeader$s_cst_button.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type s_cst_button from commandbutton
end type
type timer from n_timer within s_cst_button
end type
type theme from n_cst_button_theme within s_cst_button
end type
end forward

global type s_cst_button from commandbutton
integer width = 347
integer height = 112
integer textsize = -12
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
event type long onpaint ( unsignedlong hdc )
event type long onwindowsize ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event onmouseleave ( )
event oncapturechanged ( )
event onkeydown pbm_keydown
event onkeyup pbm_keyup
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event onthemechanged ( unsignedinteger eventflag )
event ongetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type long onclicking ( )
event onenable pbm_enable
event onmenuselected ( integer id )
event type long onmenuselecting ( integer id )
event type long onsettext ( string newtext )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event type long onpopupmenu ( ref real xpos,  ref real ypos,  ref unsignedlong flags )
event onpostconstructor ( )
event onsetfont pbm_setfont
event type long onsetfocusquery ( )
event type long onsetfocus ( unsignedlong holdwnd )
event type long onkillfocus ( unsignedlong hnewwnd )
event onpreconstructor ( )
event onpredestructor ( )
event type long onerasebkgnd ( unsignedlong hdc )
event type long onrbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event oncreated pbm_other
event onconstructor pbm_constructor
event ondestructor pbm_destructor
timer timer
theme theme
end type
global s_cst_button s_cst_button

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

/*--- 属性 ---*/
public:
privatewrite		ulong		#handle
privatewrite		window	#parentwindow
protectedwrite	boolean	#Transparent
boolean						#LockUpdate
boolean						#FadeAnimation	 		= true
uint							#FadeTime			 		= 250
uint							#FlashFadeTime	 		= 1500 //ms
privatewrite uint 			#style				 		= Enums.BTS_NORMAL
privatewrite string		#Image
privatewrite string		#AnimatedImage
privatewrite boolean		#UseAnimatedImage
privatewrite boolean		#HighLighted
privatewrite boolean		#Toggled
privatewrite uint			#ToolTipStyle		 		= Enums.TTS_NONE
icon							#ToolTipIcon		 		= None!
string							#ToolTipTitle
string							#TipText
long							#TipTime

/*--- 私有 ---*/
private:
n_canvas				_Canvas
n_imagelist				_ImageList
n_image					_AnimatedImage
n_tooltip 				_ToolTip
n_cst_popupmenu	_PopupMenu

RECTF			_rcClient
RECTF			_rcText
RECTF			_rcImage
SIZEF				_szText
PAINTPANE		_Chevron

ulong _uTTID

long _nLastPopupTime

int _nImageIndex

boolean 	_bFlashing
long		_nFlashTime

boolean _bMenuOwner

boolean 	_bFocused
boolean	_bMouseOver
boolean	_bMouseDown
boolean _bMouseLeaveTracked
boolean _bMouseCaptured

//Timer ID
constant uint TM_FLASH			 = 1
constant uint TM_ANIMATION	 = 2
//Timer interval (ms)
constant uint TMI_ANIMATION	 = 15
//Adjust flags
constant uint ADJ_BORDER 				 = 1
constant uint ADJ_BORDERMARGIN 	 = 2
constant uint ADJ_CHEVRON 			 = 4
//Sizes(dip)
constant real CHEVRONWIDTH = 14
//Props
constant string PRP_POPUPMENUCREATOR = "{POPUPMENU_CREATOR}"


end variables

forward prototypes
private subroutine _of_capturemouse (readonly boolean capture)
private subroutine _of_trackmouseleave (readonly boolean track)
private subroutine _of_updatetextsize ()
private subroutine _of_initial ()
private subroutine _of_uninitial ()
private subroutine _of_showtip (boolean show)
private subroutine _of_flashredraw ()
public function boolean of_isflashing ()
public function long of_flash (readonly long flashtime)
public function long of_getpopupmenu (ref n_cst_popupmenu popupmenu)
public function long of_setimage (readonly string imagename)
public function long of_sethighlighted (readonly boolean highlighted)
public function long of_setstyle (readonly unsignedinteger style)
public function long of_settoggled (readonly boolean toggled)
public function long of_settooltipstyle (readonly Uint style)
public function long of_updatepoints ()
public function long of_updateparentbkgnd (readonly boolean bredraw)
public function long of_redraw (readonly boolean fadeanimation)
public function long of_settransparent (readonly boolean transparent, readonly boolean bredraw)
public function long of_settransparent (readonly boolean transparent)
private subroutine _of_drawtext (readonly unsignedlong hdc)
private subroutine _of_drawchevron (readonly unsignedlong hdc)
private subroutine _of_drawbutton (readonly unsignedlong hdc)
private subroutine _of_fillbkgnd (readonly unsignedlong hdc)
private subroutine _of_updatepoints ()
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu)
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu, readonly string clsname)
public function long of_setpopupmenu (ref n_cst_popupmenu popupmenu)
public function long of_setpopupmenu (readonly string clsname)
public function long of_setanimatedimage (readonly string amimage)
public function long of_setuseanimatedimage (boolean buse)
private function boolean _of_hasvalidimage ()
public subroutine _of_redraw (readonly boolean bimageonly, readonly boolean fadeanimation)
public function unsignedlong of_getstate ()
public function unsignedlong of_getchevronstate ()
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
private function unsignedlong _of_popupmenu (real xpos, real ypos)
public function long of_reattach ()
end prototypes

event type long onpaint(unsignedlong hdc);if #LockUpdate then return 1
if Not Visible then return 1

Event OnEraseBkgnd(hdc)

_of_DrawButton(hdc)

return 1
end event

event type long onwindowsize(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);_rcClient.right = newWidth
_rcClient.bottom = newHeight

_of_UpdateTextSize()
_of_UpdatePoints()

return 0
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);boolean bRedraw

if KeyDown(KeyEnter!) or KeyDown(KeySpaceBar!) then return 1

if Not _bMouseLeaveTracked and Not _bMouseCaptured then
	_of_TrackMouseLeave(true)
end if

if Painter.PtInRect(ref _rcClient,xpos,ypos) then
	if Not _bMouseOver then
		_bMouseOver = true
		if _Chevron.Visible and #Style = Enums.BTS_SPLIT then
			if Painter.PtInRect(_Chevron.rcPaint,xpos,ypos) then
				_Chevron.MouseOver = true
			else
				_of_ShowTip(true)
			end if
		else
			_of_ShowTip(true)
		end if
		bRedraw = true
	else
		if _Chevron.Visible and #Style = Enums.BTS_SPLIT then
			if Painter.PtInRect(_Chevron.rcPaint,xpos,ypos) then
				if Not _Chevron.MouseOVer then
					_Chevron.MouseOver = true
					bRedraw = true
					_of_ShowTip(false)
				end if
			else
				if _Chevron.MouseOVer then
					_Chevron.MouseOver = false
					bRedraw = true
					_of_ShowTip(true)
				end if
			end if
		end if
	end if
else
	if _bMouseOver then
		_bMouseOver = false
		_Chevron.MouseOver = false
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

if _bMouseOver then
	_bMouseOver = false
	_Chevron.MouseOver = false
	of_Redraw(true)
	_of_ShowTip(false)
end if

_of_TrackMouseLeave(false)
end event

event oncapturechanged();if _bMouseCaptured then
	_bMouseDown = false
	_of_CaptureMouse(false)
	Event OnMouseLeave()
end if
end event

event onkeydown;ulong pmCode

if key = KeySpaceBar! then
	if #Style = Enums.BTS_DROPDOWN then
		_bMouseDown=true
		of_Redraw(true)
		pmCode = _of_PopupMenu(0,0)
		_bMouseDown=false
		of_Redraw(true)
		if pmCode > 0 then
			if IsAllowed(Event OnMenuSelecting(pmCode)) then
				Post Event OnMenuSelected(pmCode)
			end if
		end if
	else
		_bMouseOver=true
		_bMouseDown=true
		of_Redraw(true)
	end if
	return 1
elseif key = KeyUpArrow! or key = KeyDownArrow! then
	if #Style = Enums.BTS_DROPDOWN then
		_bMouseDown=true
		of_Redraw(true)
		pmCode = _of_PopupMenu(0,0)
		_bMouseDown=false
		of_Redraw(true)
		if pmCode > 0 then
			if IsAllowed(Event OnMenuSelecting(pmCode)) then
				Post Event OnMenuSelected(pmCode)
			end if
		end if
		return 1
	elseif #Style = Enums.BTS_SPLIT then
		_Chevron.MouseDown = true
		of_Redraw(true)
		pmCode = _of_PopupMenu(0,0)
		_Chevron.MouseDown = false
		of_Redraw(true)
		if pmCode > 0 then
			if IsAllowed(Event OnMenuSelecting(pmCode)) then
				Post Event OnMenuSelected(pmCode)
			end if
		end if
		return 1
	end if
end if
end event

event onkeyup;if key = KeySpaceBar! then
	if _bMouseDown then
		_bMouseOver=false
		_bMouseDown = false
		of_Redraw(true)
		if IsAllowed(Event OnClicking()) then
			Post Event Clicked()
		end if
	end if
else
	if _bMouseDown then
		_bMouseDown = false
		of_Redraw(true)
	end if
end if

return 1
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);long pmCode

if Not _bMouseLeaveTracked  then
	Event OnMouseMove(vkey,xpos,ypos)
end if

if IsAllowed(Event OnSetFocusQuery()) then
	SetFocus(this)
end if

if #Style = Enums.BTS_DROPDOWN or &
	(#Style = Enums.BTS_SPLIT and _Chevron.MouseOver) then
	
	if Cpu() - _nLastPopupTime < 100 then
		return 1
	end if
	
	if #Style = Enums.BTS_SPLIT then
		_Chevron.MouseDown = true
	else
		_bMouseDown = true
	end if
	of_Redraw(false)
	
	pmCode = _of_PopupMenu(xpos,ypos)
	
	if #Style = Enums.BTS_SPLIT then
		_Chevron.MouseDown = false
	else
		_bMouseDown = false
	end if
	of_Redraw(true)
	
	if pmCode > 0 then
		if IsAllowed(Event OnMenuSelecting(pmCode)) then
			Post Event OnMenuSelected(pmCode)
		end if
	end if
else
	_bMouseDown = true
	of_Redraw(false)
	_of_CaptureMouse(true)
end if

return 1
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if Not _bMouseCaptured then return 1

_of_CaptureMouse(false)
_of_TrackMouseLeave(true)

if _bMouseDown then
	_bMouseDown = false
	of_Redraw(true)
	if _bMouseOver and Not _Chevron.MouseOver then
		if IsAllowed(Event OnClicking()) then
			Post Event Clicked()
		end if
	end if
end if

return 1
end event

event onenable;of_Redraw(true)
return 1
end event

event type long Onsettext(string newtext);_of_UpdateTextSize()
of_UpdatePoints()

return 1
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);return Event OnLButtonDown(vkey,xpos,ypos)
end event

event onsetfont;theme.Font.of_SetFont(hFont)
return 0
end event

event type long onsetfocus(unsignedlong holdwnd);_bFocused = true
of_Redraw(true)

return 0
end event

event type long onkillfocus(unsignedlong hnewwnd);_bFocused = false
of_Redraw(true)

return 0
end event

event type long onerasebkgnd(unsignedlong hdc);if #LockUpdate then return 1

_of_FillBkgnd( hdc)

return 1
end event

event type long onrbuttondown(unsignedlong vkey, real xpos, real ypos);if IsAllowed(Event OnSetFocusQuery()) then
	SetFocus(this)
end if

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

event onconstructor;_of_Initial()

Event OnPreConstructor()
Event Constructor()
Post Event OnPostConstructor( )
end event

event ondestructor;Event OnPreDestructor()
Event Destructor()

if _bMenuOwner then
	Destroy _PopupMenu
end if

_of_Uninitial()
Timer.StopAll()
end event

private subroutine _of_capturemouse (readonly boolean capture);if _bMouseCaptured = capture then return

_bMouseCaptured = capture

if capture then
	Win32.SetCapture(#Handle)
else
	Win32.ReleaseCapture()
end if
end subroutine

private subroutine _of_trackmouseleave (readonly boolean track);TRACKMOUSEEVENT tme

if _bMouseLeaveTracked=track then return

_bMouseLeaveTracked=track

tme.cbsize = 16
tme.dwflags = Win32.TME_LEAVE
tme.hwndtrack = #Handle
tme.dwhovertime = 0

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(tme)
end subroutine

private subroutine _of_updatetextsize ();ulong uDTParam
RECTF rcCalc
RECTF rcClient

if text = "" then
	Painter.SetRectEmpty(_rcText)
	_szText.cx = 0
	_szText.cy = 0
	return
end if

rcClient = _rcClient
_of_AdjustRect(ref rcClient,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

rcCalc.right = rcClient.right - rcClient.left

if #Style = Enums.BTS_DROPDOWN or #Style = Enums.BTS_SPLIT then
	rcCalc.right -= CHEVRONWIDTH + 2
end if

uDTParam = Painter.DT_EXPANDTABS
if theme.#MultiLine then
	uDTParam += Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
else
	uDTParam += Painter.DT_SINGLELINE
end if

if _of_HasValidImage() then
	if theme.#IconPosition = Enums.TOP or theme.#IconPosition = Enums.BOTTOM then
		Painter.of_CalcTextSize(theme.Font,text,uDTParam,ref rcCalc)
		if rcCalc.bottom > rcClient.bottom - rcClient.top - (theme.#IconSize.cy + 2) then
			rcCalc.bottom = rcClient.bottom - rcClient.top - (theme.#IconSize.cy + 2)
		end if
	else
		rcCalc.right -= theme.#IconSize.cx + 2
		Painter.of_CalcTextSize(theme.Font,text,uDTParam,ref rcCalc)
		if rcCalc.bottom > rcClient.bottom - rcClient.top then
			rcCalc.bottom = rcClient.bottom - rcClient.top
		end if
	end if
else
	Painter.of_CalcTextSize(theme.Font,text,uDTParam,ref rcCalc)
	if rcCalc.bottom > rcClient.bottom - rcClient.top then
		rcCalc.bottom = rcClient.bottom - rcClient.top
	end if
end if

_szText.cx = rcCalc.Right
_szText.cy = rcCalc.Bottom

if _szText.cx < 0 or _szText.cy < 0 then
	_szText.cx = 0
	_szText.cy = 0
end if
end subroutine

private subroutine _of_initial ();#Handle = Handle(this)
#ParentWindow = GetParentWindow(this)
_Canvas = Create n_canvas

//Init ImageList
_ImageList = Create n_imagelist
_ImageList.ShareImage(true)
_ImageList.SetImageSize(theme.#IconSize.cx,theme.#IconSize.cy)

_nImageIndex = _ImageList.AddImage(#Image)

//Init tooltip
_ToolTip = Create n_tooltip
if #ToolTipStyle <> Enums.TTS_NONE then
	choose case #ToolTipStyle
		case Enums.TTS_NORMAL
			_ToolTip.CreateToolTip(#Handle)
			_uTTID = _ToolTip.AddTool(#Handle,false,Win32.TTF_SUBCLASS + Win32.TTF_TRANSPARENT)
		case Enums.TTS_BALLOON
			_ToolTip.CreateBalloonTip(#Handle,false)
			_uTTID = _ToolTip.AddTool(#Handle,false,Win32.TTF_SUBCLASS + Win32.TTF_TRANSPARENT)
	end choose
end if

theme.Font.of_SetFont(Send(#Handle,WinMsg.WM_GETFONT,0,0))

_Canvas.Attach(This)
end subroutine

private subroutine _of_uninitial ();_Canvas.Detach()
Destroy _Canvas
Destroy _ImageList
if IsValidObject(_AnimatedImage) then
	Destroy _AnimatedImage
end if

if _uTTID > 0 then
	_ToolTip.DelTool(#Handle,_uTTID)
	_uTTID = 0
end if
Destroy _ToolTip
end subroutine

private subroutine _of_showtip (boolean show);if _uTTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _bMouseCaptured then return

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
		_ToolTip.UpdateTipText(#Handle,_uTTID,#TipText)
		_ToolTip.UpdateToolRect(#Handle,_uTTID,_rcClient.left,_rcClient.top,_rcClient.right,_rcClient.bottom)
	else
		_ToolTip.UpdateToolRect(#Handle,_uTTID,0,0,0,0)								
	end if
else
	_ToolTip.UpdateToolRect(#Handle,_uTTID,0,0,0,0)
end if
end subroutine

private subroutine _of_flashredraw ();ulong hdc

if #LockUpdate then return
if Not Visible or Not Enabled or &
	_bMouseOver or _bMouseDown or &
	_Chevron.MouseOver or _Chevron.MouseDown or #Toggled then return
	
hdc=_Canvas.GetSafeDC()
if hdc = 0 then return

if #Transparent then
	_Canvas.FillParentBkgnd(hdc)
end if

Event OnPaint(hdc)

_Canvas.ReleaseDC(hdc,0,#FlashFadeTime)
end subroutine

public function boolean of_isflashing ();return (_nFlashTime = -1 or _nFlashTime > 0)
end function

public function long of_flash (readonly long flashtime);//flashtime:sec
//-1:always
//0:stop
if flashtime < 0 and flashtime <> -1 then return RetCode.E_INVALID_ARGUMENT
if flashtime = -1 and _nFlashTime = flashtime then return RetCode.OK
if flashtime = 0 and _nFlashTime = flashtime then return RetCode.OK
if _nFlashTime = flashtime * 1000 then return RetCode.OK

_nFlashTime = flashtime

if _nFlashTime > 0 then
	_nFlashTime *= 1000	//转换为毫秒
end if

if _nFlashTime = -1 or _nFlashTime > 0 then
	_bFlashing = true
	_of_FlashRedraw()
	Timer.Start(TM_FLASH,#FlashFadeTime)
else
	_bFlashing = false
	of_Redraw(true)
end if

return RetCode.OK
end function

public function long of_getpopupmenu (ref n_cst_popupmenu popupmenu);try
	PopupMenu = _PopupMenu
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try
return iif(IsValidObject(PopupMenu),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function long of_setimage (readonly string imagename);int nOldImageIndex
if imageName = #Image then return RetCode.OK

nOldImageIndex = _nImageIndex
_nImageIndex = _ImageList.AddImage(imageName)

if (_nImageIndex > 0) <> (nOldImageIndex > 0) then
	_of_UpdateTextSize()
	of_UpdatePoints()
else
	of_Redraw(true)
end if

return RetCode.OK
end function

public function long of_sethighlighted (readonly boolean highlighted);if #HighLighted = HighLighted then return RetCode.OK

#HighLighted = HighLighted
of_Redraw(true)

return RetCode.OK
end function

public function long of_setstyle (readonly unsignedinteger style);if style = Enums.BTS_DROPDOWN and #Toggled then return RetCode.FAILED
if #Style = style then return RetCode.OK

choose case style
	case Enums.BTS_NORMAL,Enums.BTS_DROPDOWN,Enums.BTS_SPLIT
		#Style = style
		if #Style = Enums.BTS_DROPDOWN or #Style = Enums.BTS_SPLIT then
			_Chevron.Visible = true
		else
			_Chevron.Visible = false
		end if
	
		_of_UpdateTextSize()
		of_UpdatePoints()
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_settoggled (readonly boolean toggled);if #Style = Enums.BTS_DROPDOWN then return RetCode.E_NO_SUPPORT
if #Toggled = toggled then return RetCode.OK

#Toggled = toggled
of_Redraw(true)

return RetCode.OK
end function

public function long of_settooltipstyle (readonly Uint style);if #ToolTipStyle = style then return RetCode.OK

choose case #ToolTipStyle
	case Enums.TTS_NONE,Enums.TTS_NORMAL,Enums.TTS_BALLOON
		if _uTTID > 0 then
			_ToolTip.DelTool(#Handle,_uTTID)
			_uTTID = 0
		end if
		#ToolTipStyle = style
		if #ToolTipStyle <> Enums.TTS_NONE then
			if #ToolTipStyle = Enums.TTS_NORMAL then
				_ToolTip.CreateToolTip(#Handle)
			elseif #ToolTipStyle = Enums.TTS_BALLOON then
				_ToolTip.CreateBalloonTip(#Handle,false)
			end if
			_uTTID = _ToolTip.AddTool(#Handle,false,Win32.TTF_SUBCLASS + Win32.TTF_TRANSPARENT)
		end if
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_updatepoints ();if #LockUpdate then return RetCode.FAILED

_of_UpdatePoints()
of_Redraw(false)

return RetCode.OK
end function

public function long of_updateparentbkgnd (readonly boolean bredraw);if Not #Transparent then return RetCode.E_NO_SUPPORT

Win32.UpdateParentBkgnd(#Handle,bRedraw)

return RetCode.OK
end function

public function long of_redraw (readonly boolean fadeanimation);if #LockUpdate then return RetCode.FAILED
if Not Visible then return RetCode.OK

_of_Redraw(false,FadeAnimation)

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

private subroutine _of_drawtext (readonly unsignedlong hdc);ulong clrText
ulong uDTParam

clrText = theme.of_GetColor(theme.CLR_TEXT,of_GetState())

uDTParam = Painter.DT_EXPANDTABS
if theme.#MultiLine then
	uDTParam += Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
else
	uDTParam += Painter.DT_SINGLELINE + Painter.DT_VCENTER + Painter.DT_WORD_ELLIPSIS
end if
if Not KeyDown(KeyAlt!) then
	uDTParam += Painter.DT_HIDEPREFIX
end if
if theme.#TextAlign = Left! then
	uDTParam += Painter.DT_LEFT
elseif theme.#TextAlign = Center! then
	uDTParam += Painter.DT_CENTER
elseif theme.#TextAlign = Right! then
	uDTParam += Painter.DT_RIGHT
end if

if _bMouseDown or #Toggled then
	Painter.of_Drawtext(hdc,theme.Font,text,_rcText.left,_rcText.top + 1,_rcText.right,_rcText.bottom + 1,clrText,uDTParam)
else
	Painter.of_Drawtext(hdc,theme.Font,text,ref _rcText,clrText,uDTParam)
end if
end subroutine

private subroutine _of_drawchevron (readonly unsignedlong hdc);ulong clrLine,clrArrow
constant real ARROWSIZE = 6

if Not _Chevron.Visible then return

clrLine 	= theme.of_GetColor(theme.CLR_LINE,of_GetState())
clrArrow	= theme.of_GetColor(theme.CLR_ARROW,of_GetState())

//Draw line
if #Style = Enums.BTS_SPLIT then
	if Not _bMouseOver and Not _bMouseDown and &
		Not _Chevron.MouseOver and Not _Chevron.MouseDown and Not #Toggled then
		if theme.#BkgndStyle = Enums.SOLID or theme.#BkgndStyle = Enums.TRANSPARENT then
			Painter.DrawLine(hdc,&
					_Chevron.rcPaint.left,&
					_Chevron.rcPaint.top + 2,&
					_Chevron.rcPaint.left,&
					_Chevron.rcPaint.bottom - 2,&
					clrLine,Enums.LS_SOLID,&
					true,1)
		else
			Painter.DrawGradientLine(hdc,&
					_Chevron.rcPaint.left,&
					_Chevron.rcPaint.top,&
					_Chevron.rcPaint.left,&
					_Chevron.rcPaint.bottom,&
					0,clrLine,Enums.LS_SOLID,true,true,1)
		end if
	end if
end if

//Draw arrow
POINTF pt1,pt2,pt3

pt1.x = _Chevron.rcPaint.left + (_Chevron.rcPaint.right - _Chevron.rcPaint.left - ARROWSIZE) / 2
pt1.y = _Chevron.rcPaint.top + (_Chevron.rcPaint.bottom - _Chevron.rcPaint.top - ARROWSIZE / 2) / 2

if _Chevron.MouseDown or (#Style = Enums.BTS_DROPDOWN and _bMouseDown) then
	pt1.y += 1
end if

pt2.x = pt1.x + ARROWSIZE
pt2.y = pt1.y
pt3.x = pt1.x + ARROWSIZE / 2
pt3.y = pt1.y + ARROWSIZE / 2

Painter.FillTriangle(hdc,pt1,pt2,pt3,clrArrow,clrArrow,Enums.HORZ,false,true,clrArrow)
end subroutine

private subroutine _of_drawbutton (readonly unsignedlong hdc);if #UseAnimatedImage then
	if _AnimatedImage.GetFrameCount() > 0 then
		if _bMouseDown or #Toggled then
			_AnimatedImage.Draw(hdc, _rcImage.left ,_rcImage.top + 1,Not Enabled)
		else
			_AnimatedImage.Draw(hdc, _rcImage.left ,_rcImage.top,Not Enabled)
		end if
	end if
else
	if _nImageIndex > 0 then
		if _bMouseDown or #Toggled then
			_ImageList.Draw(_nImageIndex,hdc, _rcImage.left ,_rcImage.top + 1,Not Enabled)
		else
			_ImageList.Draw(_nImageIndex,hdc, _rcImage.left ,_rcImage.top,Not Enabled)
		end if
	end if
end if

if _szText.cx > 0 then
	_of_DrawText(hdc)
end if

if _Chevron.visible then
	_of_DrawChevron(hdc)
end if
end subroutine

private subroutine _of_fillbkgnd (readonly unsignedlong hdc);ulong clrBorder,clrBkgnd,clrTransparent,uState
ulong clrChevronBorder,clrChevronBkgnd,nChevrouState
RADIUSF rdBorder,rdChevron
RECTF paintRect

//Get colors
uState = of_GetState()
clrBkgnd = theme.of_GetColor(theme.CLR_BKGND,uState)
clrBorder = theme.of_GetColor(theme.CLR_BORDER,uState)
clrTransparent = theme.of_GetColor(theme.CLR_TRANSPARENT,uState)
//填充透明色
if clrTransparent <> 0 then
	Painter.of_FillRect( hdc, _rcClient,  clrTransparent,false,0) 
end if

rdBorder = theme.#RoundSize

if Not Enabled then
	Painter.ThemeFill( hdc, _rcClient, clrBkgnd,theme.#BkgndOrientation,Enums.SOLID,uState,false,&
									theme.#BorderStyle,clrBorder,rdBorder)
	return
end if

if #Style = Enums.BTS_SPLIT then
	nChevrouState = of_GetChevronState()
	clrChevronBkgnd = theme.of_GetColor(theme.CLR_CHEVRONBKGND,nChevrouState)
	clrChevronBorder = theme.of_GetColor(theme.CLR_CHEVRONBORDER,nChevrouState)
	if BitAND(uState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 and BitAND(nChevrouState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
		if _bFlashing then
			clrBkgnd = ARGBLighten(clrBkgnd,0.4)
		end if
	end if
	if BitAND(nChevrouState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
		rdChevron.rightTop = theme.#RoundSize.rightTop
		rdChevron.rightBottom = theme.#RoundSize.rightBottom
		rdBorder.rightTop = 0
		rdBorder.rightBottom = 0
		paintRect = _rcClient
		paintRect.right = _Chevron.rcPaint.left + 1
		Painter.ThemeFill( hdc, paintRect, clrBkgnd,theme.#BkgndOrientation,theme.#BkgndStyle,uState,false,&
												theme.#BorderStyle,clrBorder,rdBorder)
		Painter.ThemeFill( hdc, _Chevron.rcPaint, clrChevronBkgnd,theme.#BkgndOrientation,theme.#BkgndStyle,nChevrouState,false,&
												theme.#BorderStyle,ARGBDarken(clrChevronBorder,0.2),rdChevron)
	elseif BitAND(uState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
		rdChevron.rightTop = theme.#RoundSize.rightTop
		rdChevron.rightBottom = theme.#RoundSize.rightBottom
		paintRect = _rcClient
		paintRect.right = _Chevron.rcPaint.left + 1
		rdBorder.rightTop = 0
		rdBorder.rightBottom = 0
		Painter.ThemeFill( hdc, _Chevron.rcPaint, clrChevronBkgnd,theme.#BkgndOrientation,theme.#BkgndStyle,nChevrouState,false,&
												theme.#BorderStyle,clrChevronBorder,rdChevron)
		Painter.ThemeFill( hdc, paintRect, clrBkgnd,theme.#BkgndOrientation,theme.#BkgndStyle,uState,false,&
												theme.#BorderStyle,ARGBDarken(clrBorder,0.2),rdBorder)
	else
		Painter.IntersectClipRect( hdc, _Chevron.rcPaint)
		Painter.ThemeFill( hdc, _rcClient, clrChevronBkgnd,theme.#BkgndOrientation,theme.#BkgndStyle,nChevrouState,false,&
											theme.#BorderStyle,clrChevronBorder,rdBorder)
		Painter.SelectClipRgn(hdc,0)
		Painter.ExcludeClipRect(hdc,_Chevron.rcPaint)
		Painter.ThemeFill( hdc, _rcClient, clrBkgnd,theme.#BkgndOrientation,theme.#BkgndStyle,uState,false,&
											theme.#BorderStyle,clrBorder,rdBorder)	
		Painter.SelectClipRgn(hdc,0)
	end if
else
	if BitAND(uState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
		if _bFlashing then
			clrBkgnd = ARGBLighten(clrBkgnd,0.4)
		end if
	end if
	Painter.ThemeFill( hdc, _rcClient, clrBkgnd,theme.#BkgndOrientation,theme.#BkgndStyle,uState,false,&
									theme.#BorderStyle,clrBorder,rdBorder)
end if
end subroutine

private subroutine _of_updatepoints ();real fItemWidth,fItemHeight
RECTF rcClient

if #LockUpdate then return

rcClient = _rcClient
_of_AdjustRect(ref rcClient,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)
fItemWidth = rcClient.right - rcClient.left
fItemHeight = rcClient.bottom - rcClient.top

if _of_HasValidImage() then
	if _szText.cx > 0 then
		choose case theme.#IconPosition
			case Enums.LEFT
				//Set _rcImage
				_rcImage.left		= rcClient.left
				_rcImage.right	= _rcImage.left + theme.#IconSize.cx
				_rcImage.top		= rcClient.top + (fItemHeight - theme.#IconSize.cy) / 2 //取中间
				_rcImage.bottom= _rcImage.top + theme.#IconSize.cy
				//Set _rcText
				_rcText.left		= _rcImage.right + 2
				_rcText.right		= rcClient.right
				_rcText.top		= rcClient.top + (fItemHeight - _szText.cy)/2	//取中间
				_rcText.bottom	= _rcText.top + _szText.cy
			case Enums.TOP
				//Set _rcImage
				_rcImage.left		= rcClient.left + (fItemWidth - theme.#IconSize.cx)/2 	//取中间
				_rcImage.right	= _rcImage.left + theme.#IconSize.cx
				_rcImage.top		= rcClient.top
				_rcImage.bottom= _rcImage.top + theme.#IconSize.cy
				//Set _rcText
				_rcText.left			= rcClient.left
				_rcText.right		= rcClient.right
				_rcText.top		= _rcImage.bottom + 2
				if (rcClient.bottom - _rcText.top) > _szText.cy then
					_rcText.top 	+= (rcClient.bottom - _rcText.top  - _szText.cy)/2 //取中间
				end if
				_rcText.bottom	= _rcText.top + _szText.cy
			case Enums.RIGHT
				//Set _rcImage
				_rcImage.left		= rcClient.right - theme.#IconSize.cx
				_rcImage.right	= _rcImage.left + theme.#IconSize.cx
				_rcImage.top		= rcClient.top + (fItemHeight - theme.#IconSize.cy) / 2 //取中间
				_rcImage.bottom= _rcImage.top + theme.#IconSize.cy
				//Set _rcText
				_rcText.left			= rcClient.left
				_rcText.right		= _rcImage.left - 2
				_rcText.top		= rcClient.top + (fItemHeight - _szText.cy)/2	//取中间
				_rcText.bottom	= _rcText.top + _szText.cy
			case Enums.BOTTOM
				//Set _rcImage
				_rcImage.left		= rcClient.left + (fItemWidth - theme.#IconSize.cx)/2 	//取中间
				_rcImage.right	= _rcImage.left + theme.#IconSize.cx
				_rcImage.top		= rcClient.bottom - theme.#IconSize.cy
				_rcImage.bottom= _rcImage.top + theme.#IconSize.cy
				//Set _rcText
				_rcText.left			= rcClient.left
				_rcText.right		= rcClient.right
				_rcText.top		= rcClient.top
				if (_rcImage.top - 2 - _rcText.top) > _szText.cy then
					_rcText.top 	+= (_rcImage.top - 2 - _rcText.top  - _szText.cy)/2 //取中间
				end if
				_rcText.bottom	= _rcText.top + _szText.cy
		end choose
	else
		//Set _rcImage
		_rcImage.left		= rcClient.left + (fItemWidth - theme.#IconSize.cx)/2 	//取中间
		_rcImage.right	= _rcImage.left + theme.#IconSize.cx
		_rcImage.top		= rcClient.top + (fItemHeight - theme.#IconSize.cy) / 2 //取中间
		_rcImage.bottom= _rcImage.top + theme.#IconSize.cy
	end if
elseif _szText.cx > 0 then
	//Set _rcText
	_rcText.left			= rcClient.left
	_rcText.right		= rcClient.right
	_rcText.top		= rcClient.top + (fItemHeight - _szText.cy)/2	//取中间
	_rcText.bottom	= _rcText.top + _szText.cy
end if

//Set chevron
if _Chevron.Visible then
	_Chevron.rcPaint.left		= _rcClient.right - CHEVRONWIDTH
	_Chevron.rcPaint.right		= _rcClient.right
	_Chevron.rcPaint.top		= _rcClient.top
	_Chevron.rcPaint.bottom	= _rcClient.bottom
end if
end subroutine

private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu);return _of_CreatePopupMenu(ref popupmenu,"")
end function

private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu, readonly string clsname);n_cst_popupmenu pm

try
	if clsName = "" then
		pm = Create n_cst_popupmenu
	else
		pm = Create Using clsName
	end if
	popupmenu = pm
	popupmenu.#Tag = PRP_POPUPMENUCREATOR
	return true
catch(Throwable ex)
	if IsValidObject(pm) then
		Destroy pm
	end if
	return false
end try
end function

public function long of_setpopupmenu (ref n_cst_popupmenu popupmenu);boolean bOwner

if #Style <> Enums.BTS_DROPDOWN and #Style <> Enums.BTS_SPLIT then return RetCode.E_NO_SUPPORT
if IsValidObject(PopupMenu) and _PopupMenu = PopupMenu then return RetCode.OK

if Not IsValidObject(PopupMenu) then
	if Not _of_CreatePopupMenu(ref PopupMenu) then return RetCode.E_INVALID_OBJECT
	bOwner = true
	PopupMenu.#Tag = ""
elseif PopupMenu.#Tag = PRP_POPUPMENUCREATOR then
	bOwner = true
	PopupMenu.#Tag = ""
end if

if _bMenuOwner then
	Destroy _PopupMenu
end if

_PopupMenu = PopupMenu
_bMenuOwner = bOwner

return RetCode.OK
end function

public function long of_setpopupmenu (readonly string clsname);long rtCode
n_cst_popupmenu pm

if Not _of_CreatePopupMenu(ref pm,clsName) then return RetCode.E_INVALID_TYPE

rtCode = of_SetPopupMenu(ref pm)
if IsFailed(rtCode) then
	Destroy pm
end if

return rtCode
end function

public function long of_setanimatedimage (readonly string amimage);int frameCount
boolean rt

if #AnimatedImage = amimage then return RetCode.OK

#AnimatedImage = amimage

if Not IsValidObject(_AnimatedImage) then
	_AnimatedImage = create n_image
	_AnimatedImage.ShareImage(true)
	_AnimatedImage.SetImageSize(theme.#IconSize.cx,theme.#IconSize.cy)
end if

frameCount = _AnimatedImage.GetFrameCount()
rt = _AnimatedImage.Load(amimage)

if #UseAnimatedImage then
	if (frameCount > 0) <> rt then
		_of_UpdateTextSize()
		of_UpdatePoints()
	else
		of_Redraw(false)
	end if
	if rt then
		Timer.Start(TM_ANIMATION,TMI_ANIMATION)
	else
		Timer.Stop(TM_ANIMATION)
	end if
end if

return RetCode.OK
end function

public function long of_setuseanimatedimage (boolean buse);int nFrmCnt

if Not IsValidObject(_AnimatedImage) then return RetCode.E_INVALID_OBJECT
if #UseAnimatedImage = bUse then return RetCode.OK

#UseAnimatedImage = bUse
nFrmCnt = _AnimatedImage.GetFrameCount()

if (_nImageIndex > 0) <> (nFrmCnt > 0) then
	_of_UpdateTextSize()
	of_UpdatePoints()
else
	of_Redraw(false)
end if

if #UseAnimatedImage and nFrmCnt > 0 then
	Timer.Start(TM_ANIMATION,TMI_ANIMATION)
else
	Timer.Stop(TM_ANIMATION)
end if

return RetCode.OK
end function

private function boolean _of_hasvalidimage ();if #UseAnimatedImage then
	return (_AnimatedImage.GetFrameCount() > 0)
else
	return (_nImageIndex > 0)
end if
end function

public subroutine _of_redraw (readonly boolean bimageonly, readonly boolean fadeanimation);ulong hdc
ulong hUpdateRgn

if #LockUpdate then return
if Not Visible then return

hdc=_Canvas.GetSafeDC()

if bImageOnly then
	Painter.IntersectClipRect(hdc,_rcImage)
end if

if #Transparent then
	_Canvas.FillParentBkgnd(hdc)
end if

Event OnPaint(hdc)

if bImageOnly then
	hUpdateRgn = Painter.CreateRectRgn(_rcImage)
end if

if FadeAnimation then
	_Canvas.ReleaseDC(hdc,hUpdateRgn,#FadeTime)
else
	_Canvas.ReleaseDC(hdc,hUpdateRgn)
end if

if bImageOnly then
	Painter.DeleteRgn(hUpdateRgn)
end if
end subroutine

public function unsignedlong of_getstate ();ulong uState

if #Toggled or (#Style = Enums.BTS_DROPDOWN and _bMouseDown) then
	uState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if _bMouseOver and Not _Chevron.MouseOver then uState += Enums.STATE_HOVER
	if _bMouseDown then uState += Enums.STATE_PRESSED
end if
if #HighLighted then uState += Enums.STATE_HIGHLIGHTED
if _bFocused then uState += Enums.STATE_FOCUS
if Not Enabled then uState += Enums.STATE_DISABLED
if Default then uState += Enums.STATE_DEFAULT
if _nFlashTime = -1 or _nFlashTime > 0 then uState += Enums.STATE_FLASHING

return uState
end function

public function unsignedlong of_getchevronstate ();ulong uState

if _Chevron.MouseDown then
	uState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if _Chevron.MouseOver then uState += Enums.STATE_HOVER
end if
if _bFocused then uState += Enums.STATE_FOCUS

return uState
end function

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

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

if BitAND(flags,ADJ_CHEVRON) > 0 then
	if _Chevron.visible then
		adjRect.right -= CHEVRONWIDTH
	end if
end if
end subroutine

private function unsignedlong _of_popupmenu (real xpos, real ypos);ulong rtCode
ulong pmFlags

if Not _Chevron.visible then return 0
if Not IsValidObject(_PopupMenu) then return 0

_PopupMenu.of_SetToolTip(#ToolTipStyle <> Enums.TTS_NONE)
_PopupMenu.theme.of_SetTheme(theme)

if #Style = Enums.BTS_DROPDOWN then
	xpos = _rcClient.Left
	ypos = _rcClient.Bottom
elseif #Style = Enums.BTS_SPLIT then
	xpos = _Chevron.rcPaint.Left
	ypos = _Chevron.rcPaint.Bottom
end if

pmFlags = Win32.TPM_LEFTALIGN + Win32.TPM_TOPALIGN
if IsPrevented(Event OnPopupMenu(ref xpos,ref ypos,ref pmFlags)) then return 0

rtCode = _PopupMenu.of_Popup(#Handle,xpos,ypos,pmFlags)
_nLastPopupTime = Cpu()

return rtCode
end function

public function long of_reattach ();if Not IsValidObject(_Canvas) then return RetCode.FAILED

_bMouseOver = false
_bMouseDown = false
_bMouseLeaveTracked = false
_bMouseCaptured = false

#Handle = Handle(this)
_Canvas.Attach(this)

return RetCode.OK
end function

on s_cst_button.create
this.timer=create timer
this.theme=create theme
end on

on s_cst_button.destroy
destroy(this.timer)
destroy(this.theme)
end on

type timer from n_timer within s_cst_button descriptor "pb_nvo" = "true" 
end type

event ontimer;call super::ontimer;if id = TM_FLASH then
	int index
	if _nFlashTime = 0 then return false
	if _nFlashTime > 0 then
		_nFlashTime -= #FlashFadeTime
		if _nFlashTime < 0 then
			_nFlashTime = 0
		end if
	end if
	_bFlashing = (Not _bFlashing and _nFlashTime <> 0)
	_of_FlashRedraw()
	return (_nFlashTime <> 0)
elseif id = TM_ANIMATION then
	if #UseAnimatedImage and _AnimatedImage.IsPlaying() then
		if _AnimatedImage.IsFrameChanged() then
			_AnimatedImage.NextFrame()
			_of_Redraw(true,false)
		end if
		return true
	end if
end if

return false
end event

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

type theme from n_cst_button_theme within s_cst_button descriptor "pb_nvo" = "true" 
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
	case EVT_BORDERSTYLE
		dirty = true
	case EVT_ICONPOSITION
		if _nImageIndex > 0 then
			_of_UpdateTextSize()
			dirty = true
		end if
	case EVT_MULTILINE
		_of_UpdateTextSize()
		dirty = true
	case EVT_ICONSIZE
		_ImageList.SetImageSize(#IconSize.cx,#IconSize.cy)
		if IsValidObject(_AnimatedImage) then
			_AnimatedImage.SetImageSize(#IconSize.cx,#IconSize.cy)
		end if
		if _of_HasValidImage() then
			_of_UpdateTextSize()
			dirty = true
		end if
	case EVT_BORDERMARGIN
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

