$PBExportHeader$w_cst_msgbox.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type w_cst_msgbox from se_cst_window
end type
type cb_copy from s_cst_button within w_cst_msgbox
end type
type cb_3 from s_cst_button within w_cst_msgbox
end type
type cb_2 from s_cst_button within w_cst_msgbox
end type
type cb_1 from s_cst_button within w_cst_msgbox
end type
type cb_detail from s_cst_button within w_cst_msgbox
end type
type mle_detail from s_cst_multilineedit within w_cst_msgbox
end type
type font from n_cst_font within w_cst_msgbox
end type
end forward

global type w_cst_msgbox from se_cst_window
integer width = 1106
integer height = 741
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = false
cb_copy cb_copy
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_detail cb_detail
mle_detail mle_detail
font font
end type
global w_cst_msgbox w_cst_msgbox

type prototypes
Private:
Function Boolean PlaySound(string lpszName,ulong hModule,ulong dwFlags) Library "winmm.dll" Alias for "PlaySoundW"
end prototypes

type variables
/*--- 私有 ---*/
private:
MSGBOXDATA	_MsgData
RECTF			_rcText
RECTF			_rcIcon
SIZEF 			_szText

n_imagelist _ImageList

real _fMinHeight
real _fMaxHeight

boolean _bInitialized
boolean _bShowDetail

string _sTimeOutBtnOrgText
long _nTimeRemaining

//Tips
constant string TIP_OK			= "确定"
constant string TIP_CANCEL	= "取消"
constant string TIP_YES		= "是"
constant string TIP_NO			= "否"
constant string TIP_ABORT	= "中止"
constant string TIP_RETRY	= "重试"
constant string TIP_IGNORE	= "忽略"
constant string TIP_SHOW	= "查看详情"
constant string TIP_HIDE		= "隐藏"
//Icons
constant string ICO_INFO					= "pfw://zip/images[msgbox/info.svg]{fill:rgb(24,112,183)}"
constant string ICO_WARNING			= "pfw://zip/images[msgbox/warning.svg]{fill:rgb(239,185,0)}"
constant string ICO_QUESTION			= "pfw://zip/images[msgbox/question.svg]{fill:rgb(121,171,210)}"
constant string ICO_ERROR				= "pfw://zip/images[msgbox/error.svg]{fill:rgb(194,52,9)}"
constant string ICO_ARROW_UP		= "pfw://zip/images[menu-up.svg]{fill:#888}"
constant string ICO_ARROW_DOWN	= "pfw://zip/images[menu-down.svg]{fill:#888}"
constant string ICO_COPY				= "pfw://zip/images[copy.svg]{fill:#888}"
//Timer IDs
constant uint TM_DETAIL 	 	= 1
constant uint TM_TIMEOUT	= 2
//Sizes(dip)
constant real XMARGIN 		= 10
constant real YMARGIN 		= 10
constant real ICONWIDTH 	= 48
constant real ICONHEIGHT 	= 48

end variables
forward prototypes
private subroutine _wf_updatetextsize ()
private subroutine _wf_initlayout ()
private subroutine _wf_showdetail ()
private subroutine _wf_hidedetail ()
private subroutine _wf_updatepoints ()
private subroutine _wf_playsystemsound ()
private subroutine _wf_refreshtimeoutbtntext ()
private subroutine _wf_setposition ()
private subroutine _wf_updatebtnwidth (readonly s_cst_button btn)
private subroutine _wf_updatebtnpoints ()
end prototypes

private subroutine _wf_updatetextsize ();ulong dtparam
ulong hfont
real fMaxCY
RECTF calcRect
RECTF rcScreen

if _MsgData.Text = "" then
	_szText.cx = 0
	_szText.cy = 0
	return
end if

Painter.GetScreenRect(ref rcScreen)

fMaxCY = rcScreen.Bottom - (theme.#TitleBarHeight + theme.#BorderMargin.bottom + U2DY(cb_1.Height) + YMARGIN * 3)
if _MsgData.Detail <> "" then
	fMaxCY -= U2DY(cb_detail.Height + mle_detail.Height) + YMARGIN
end if

calcRect.right = rcScreen.Right - (theme.#BorderMargin.left + theme.#BorderMargin.right + ICONWIDTH + XMARGIN * 3)
dtparam = Painter.DT_EXPANDTABS + Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING

Painter.CalcFontTextSize(Font.#Handle,_MsgData.Text,dtparam,ref calcRect)

_szText.cx = calcRect.right
_szText.cy = calcRect.bottom

if _szText.cy > fMaxCY then
	_szText.cy = fMaxCY
end if
end subroutine

private subroutine _wf_initlayout ();real minWidth
RECTF cliRect

Painter.GetClientRect(#Handle,ref cliRect)

if ICONHEIGHT > _szText.cy and _MsgData.Icon <> None! then
	_fMinHeight = YMARGIN + ICONHEIGHT + YMARGIN
else
	_fMinHeight = YMARGIN + _szText.cy + YMARGIN
end if
_fMinHeight += U2DY(cb_1.Height) + YMARGIN
_fMaxHeight = _fMinHeight
if _MsgData.Detail <> "" then
	_fMinHeight += U2DY(cb_detail.Height)
	_fMaxHeight = _fMinHeight + U2DY(mle_detail.Height)
end if

if cliRect.bottom - cliRect.top < _fMinHeight then
	Height += D2UY(_fMinHeight - (cliRect.bottom - cliRect.top))
elseif cliRect.bottom - cliRect.top > _fMinHeight then
	Height -= D2UY((cliRect.bottom - cliRect.top) - _fMinHeight)
end if

if _MsgData.Icon <> None! then
	minWidth = XMARGIN + ICONWIDTH + XMARGIN + _szText.cx + XMARGIN
else
	minWidth = XMARGIN + _szText.cx + XMARGIN
end if
if _MsgData.Detail <> "" then
	if minWidth < 300 then
		minWidth = 300
	end if
end if

if cliRect.right - cliRect.left < minWidth then
	Width += D2UX(minWidth - (cliRect.right - cliRect.left))
end if

choose case _MsgData.Button
	case OK!
		cb_1.Text = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_OK)
		cb_1.#TipText = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_OK)
		_wf_UpdateBtnWidth(cb_1)
		cb_2.Hide()
		cb_3.Hide()
		cb_1.Cancel = true
	case OKCancel!
		cb_1.Text = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_OK)
		cb_2.Text = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_CANCEL)
		cb_1.#TipText = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_OK)
		cb_2.#TipText = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_CANCEL)
		_wf_UpdateBtnWidth(cb_1)
		_wf_UpdateBtnWidth(cb_2)
		cb_3.Hide()
		cb_2.Cancel = true
	case YesNo!
		cb_1.Text = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_YES) + "(&Y)"
		cb_2.Text = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_NO) + "(&N)"
		cb_1.#TipText = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_YES)
		cb_2.#TipText = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_NO)
		_wf_UpdateBtnWidth(cb_1)
		_wf_UpdateBtnWidth(cb_2)
		cb_3.Hide()
	case YesNoCancel!
		cb_1.Text = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_YES) + "(&Y)"
		cb_2.Text = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_NO) + "(&N)"
		cb_3.Text = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_CANCEL)
		cb_1.#TipText = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_YES)
		cb_2.#TipText = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_NO)
		cb_3.#TipText = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_CANCEL)
		_wf_UpdateBtnWidth(cb_1)
		_wf_UpdateBtnWidth(cb_2)
		_wf_UpdateBtnWidth(cb_3)
		cb_3.Cancel = true
	case RetryCancel!
		cb_1.Text = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_RETRY) + "(&R)"
		cb_2.Text = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_CANCEL)
		cb_1.#TipText = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_RETRY)
		cb_2.#TipText = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_CANCEL)
		_wf_UpdateBtnWidth(cb_1)
		_wf_UpdateBtnWidth(cb_2)
		cb_3.Hide()
		cb_2.Cancel = true
	case AbortRetryIgnore!
		cb_1.Text = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_ABORT) + "(&A)"
		cb_2.Text = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_RETRY) + "(&R)"
		cb_3.Text = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_IGNORE) + "(&I)"
		cb_1.#TipText = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_ABORT)
		cb_2.#TipText = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_RETRY)
		cb_3.#TipText = I18N(ne_cst_i18n.CAT_MSGBOX,TIP_IGNORE)
		_wf_UpdateBtnWidth(cb_1)
		_wf_UpdateBtnWidth(cb_2)
		_wf_UpdateBtnWidth(cb_3)
end choose

choose case _MsgData.DefaultButton
	case 2
		if cb_2.Visible then
			cb_2.SetFocus( )
			cb_2.Default = true
		else
			cb_1.Default = true
			cb_1.SetFocus()
		end if
	case 3
		if cb_3.Visible then
			cb_3.Default = true
			cb_3.SetFocus()
		else
			cb_1.Default = true
			cb_1.SetFocus()
		end if
	case else
		cb_1.Default = true
		cb_1.SetFocus()
end choose

_wf_UpdateBtnPoints()

if _MsgData.Detail <> "" then
	cb_1.y = D2UY(_fMinHeight) - cb_detail.Height - D2UY(YMARGIN) - cb_1.Height
else
	cb_1.y = D2UY(_fMinHeight) - D2UY(YMARGIN) - cb_1.Height
end if

if cb_2.Visible then
	cb_2.y = cb_1.y
end if
if cb_3.Visible then
	cb_3.y = cb_1.y
end if

if _MsgData.Detail <> "" then
	cb_detail.y = cb_1.y + cb_1.Height + D2UY(YMARGIN)
	mle_detail.y = cb_detail.y + cb_detail.height
	cb_copy.y = mle_detail.y + D2UY(1)
else
	cb_detail.Hide()
	mle_detail.Hide()
	cb_copy.Hide()
end if
end subroutine

private subroutine _wf_showdetail ();_bShowDetail = true
cb_detail.of_SetImage(ICO_ARROW_UP)
cb_detail.#TipText = TIP_HIDE
wf_Timer(TM_DETAIL,0.01)
end subroutine

private subroutine _wf_hidedetail ();_bShowDetail = false
cb_detail.of_SetImage(ICO_ARROW_DOWN)
cb_detail.#TipText = TIP_SHOW
wf_Timer(TM_DETAIL,0.01)
end subroutine

private subroutine _wf_updatepoints ();RECTF cliRect

Painter.GetClientRect(#Handle,ref cliRect)

cliRect.bottom = U2DY(cb_1.Y)

if _MsgData.Icon <> None! then
	_rcIcon.left = XMARGIN
	_rcIcon.right = _rcIcon.left + ICONWIDTH
	_rcIcon.top = cliRect.top + YMARGIN
	_rcIcon.bottom = _rcIcon.top + ICONHEIGHT
	
	_rcText.left = _rcIcon.right + XMARGIN
	_rcText.right = _rcText.left + _szText.cx
	_rcText.top = cliRect.top + (cliRect.bottom - cliRect.top - _szText.cy) / 2
	_rcText.bottom = _rcText.top + _szText.cy
else
	_rcText.left = XMARGIN
	_rcText.right = _rcText.left + _szText.cx
	_rcText.top = cliRect.top + (cliRect.bottom - cliRect.top - _szText.cy) / 2
	_rcText.bottom = _rcText.top + _szText.cy
end if
end subroutine

private subroutine _wf_playsystemsound ();Constant Ulong SND_ASYNC = 1
Constant Ulong SND_ALIAS = 65536
try
	choose case _MsgData.Icon
		case Information!
			PlaySound("SystemAsterisk",0, SND_ALIAS + SND_ASYNC)
		case Exclamation!
			PlaySound("SystemExclamation",0, SND_ALIAS + SND_ASYNC)
		case Question!
			PlaySound("SystemQuestion",0, SND_ALIAS + SND_ASYNC)
		case StopSign!
			PlaySound("SystemHand",0, SND_ALIAS + SND_ASYNC)
		case None!
//			PlaySound("SystemDefault",0, SND_ALIAS + SND_ASYNC)
	end choose
catch(Throwable ex)
end try
end subroutine

private subroutine _wf_refreshtimeoutbtntext ();CommandButton cb_dst

choose case _MsgData.DefaultButton
	case 2
		cb_dst = cb_2
	case 3
		cb_dst = cb_3
	case else
		cb_dst = cb_1
end choose

if Not cb_Dst.Visible then
	cb_dst = cb_1
end if

if _sTimeOutBtnOrgText = "" then
	_sTimeOutBtnOrgText = cb_dst.Text
end if
cb_dst.Text = _sTimeOutBtnOrgText + "(" + String(_nTimeRemaining) + ")"
_wf_UpdateBtnWidth(cb_dst)
_wf_UpdateBtnPoints()
end subroutine

private subroutine _wf_setposition ();RECTF rcWndActive,rcWndThis,rcScreen
POINTF pt

Painter.GetScreenWorkArea(ref rcScreen)
Painter.GetWindowRect(#Handle,ref rcWndThis)
Painter.OffsetRect(ref rcWndThis,-rcWndThis.left,-rcWndThis.top)
	
if _MsgData.hWndActive <> 0 and Not Win32.IsIconic(_MsgData.hWndActive) then
	Painter.GetWindowRect(_MsgData.hWndActive,ref rcWndActive)
end if
if Not Win32.IsRectEmpty(ref rcWndActive) then
	pt.x = rcWndActive.left + ((rcWndActive.right - rcWndActive.left) - rcWndThis.right) / 2
	pt.y = rcWndActive.top + ((rcWndActive.bottom - rcWndActive.top) - rcWndThis.bottom) / 2
	if pt.x < rcScreen.left then
		pt.x = rcScreen.left
	end if
	if pt.y < rcScreen.top then
		pt.y = rcScreen.top
	end if
	if pt.x + rcWndThis.right > rcScreen.right then
		pt.x -= pt.x + rcWndThis.right - rcScreen.right
	end if
	if pt.y + rcWndThis.bottom > rcScreen.bottom then
		pt.y -= pt.y + rcWndThis.bottom - rcScreen.bottom
	end if
else
	pt.x = rcScreen.left + ((rcScreen.right - rcScreen.left) - rcWndThis.right) / 2
	pt.y = rcScreen.top + ((rcScreen.bottom - rcScreen.top) - rcWndThis.bottom) / 2
end if

Win32.SetWindowPos(#Handle,0,+&
						D2PX(pt.x),+&
						D2PY(pt.y),+&
						0,0,+&
						Win32.SWP_NOSIZE + Win32.SWP_NOZORDER + Win32.SWP_NOACTIVATE)
end subroutine

private subroutine _wf_updatebtnwidth (readonly s_cst_button btn);RECTF rcText

Painter.of_CalcTextSize(btn.theme.font,btn.text,Painter.DT_SINGLELINE,ref rcText)
btn.Width = D2UX(btn.theme.#BorderMargin.left + btn.theme.#BorderMargin.right + rcText.right + 24)
end subroutine

private subroutine _wf_updatebtnpoints ();choose case _MsgData.Button
	case OK!
		cb_1.x = (Width - cb_1.Width) / 2
	case OKCancel!
		cb_1.x = (Width - cb_1.Width - 16 - cb_2.Width) / 2
		cb_2.x = cb_1.x + cb_1.Width + 16
	case YesNo!
		cb_1.x = (Width - cb_1.Width - 16 - cb_2.Width) / 2
		cb_2.x = cb_1.x + cb_1.Width + 16
	case YesNoCancel!
		cb_1.x = (Width - cb_1.Width - 16 - cb_2.Width - 16 - cb_3.Width) / 2
		cb_2.x = cb_1.x + cb_1.Width + 16
		cb_3.x = cb_2.x + cb_2.Width + 16
	case RetryCancel!
		cb_1.x = (Width - cb_1.Width - 16 - cb_2.Width) / 2
		cb_2.x = cb_1.x + cb_1.Width + 16
	case AbortRetryIgnore!
		cb_1.x = (Width - cb_1.Width - 16 - cb_2.Width - 16 - cb_3.Width) / 2
		cb_2.x = cb_1.x + cb_1.Width + 16
		cb_3.x = cb_2.x + cb_2.Width + 16
end choose

end subroutine

on w_cst_msgbox.create
int iCurrent
call super::create
this.cb_copy=create cb_copy
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_detail=create cb_detail
this.mle_detail=create mle_detail
this.font=create font
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_copy
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_detail
this.Control[iCurrent+6]=this.mle_detail
end on

on w_cst_msgbox.destroy
call super::destroy
destroy(this.cb_copy)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_detail)
destroy(this.mle_detail)
destroy(this.font)
end on

event close;call super::close;Destroy _ImageList
end event

event onpaint;call super::onpaint;ulong dtparam

if #LockUpdate then return 1
if Not _bInitialized then return 1

if _MsgData.Icon <> None! then
	_ImageList.Draw( 1, hdc, _rcIcon.left, _rcIcon.top, false)
end if

dtparam = Painter.DT_EXPANDTABS + Painter.DT_HIDEPREFIX + Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
Painter.of_DrawText(hdc,Font,_MsgData.Text,_rcText,ARGB(255,20,20,20),dtparam)

return 1
end event

event ontimer;call super::ontimer;boolean bContinue

choose case id
	case TM_DETAIL
		real nHeight
		real incSize
		RECTF cliRect
		Painter.GetClientRect(#Handle,ref cliRect)
		nHeight = cliRect.bottom - cliRect.top
		if _bShowDetail and nHeight < _fMaxHeight then
			bContinue = true
			incSize = 4 + (_fMaxHeight - nHeight) / 8
			if nHeight + incSize > _fMaxHeight then
				Height += D2UY(_fMaxHeight - nHeight)
			else
				Height += D2UY(incSize)
			end if
		elseif Not _bShowDetail and nHeight > _fMinHeight then
			bContinue = true
			incSize = 4 + (nHeight - _fMinHeight) / 8
			if nHeight - incSize < _fMinHeight then
				Height -= D2UY(nHeight - _fMinHeight)
			else
				Height -= D2UY(incSize)
			end if
		end if
	case TM_TIMEOUT
		_nTimeRemaining --
		_wf_RefreshTimeOutBtnText()
		bContinue = (_nTimeRemaining > 0)
		if Not bContinue then
			Post CloseWithReturn(this,_MsgData.DefaultButton)
		end if
end choose

return bContinue
end event

event resize;call super::resize;cb_detail.Width = newWidth
mle_detail.Width = newWidth
cb_copy.x = mle_detail.x + mle_detail.width - cb_copy.width - 80
end event

event onthemechanged;call super::onthemechanged;choose case eventFlag
	case theme.EVT_BKGNDSTYLE
		cb_1.theme.of_SetBkgndStyle(theme.#BkgndStyle)
		cb_2.theme.of_SetBkgndStyle(theme.#BkgndStyle)
		cb_3.theme.of_SetBkgndStyle(theme.#BkgndStyle)
	case theme.EVT_BKGNDCOLORSTYLE
		cb_1.theme.of_SetBkgndColorStyle(theme.#BkgndColorStyle)
		cb_2.theme.of_SetBkgndColorStyle(theme.#BkgndColorStyle)
		cb_3.theme.of_SetBkgndColorStyle(theme.#BkgndColorStyle)
		mle_detail.theme.of_SetBkgndColorStyle(theme.#BkgndColorStyle)
	case theme.EVT_BORDERSTYLE
		cb_1.theme.of_SetBorderStyle(theme.#BorderStyle)
		cb_2.theme.of_SetBorderStyle(theme.#BorderStyle)
		cb_3.theme.of_SetBorderStyle(theme.#BorderStyle)
end choose
end event

event onpostopen;call super::onpostopen;choose case _MsgData.Button
	case YesNo!,AbortRetryIgnore!
		ControlMenu = false
end choose
end event

event closequery;call super::closequery;if Message.DoubleParm = 0 then
	if cb_1.Cancel then
		Message.DoubleParm = 1
	elseif cb_2.Cancel then
		Message.DoubleParm = 2
	elseif cb_3.Cancel then
		Message.DoubleParm = 3
	else
		return 1
	end if
end if

return 0
end event

event open;call super::open;_ImageList = Create n_imagelist
_ImageList.ShareImage(true)
_ImageList.SetImageSize(ICONWIDTH,ICONHEIGHT)

if Not IsValidObject(Message.PowerObjectParm) then
	Close(this)
	return -1
end if

_MsgData = Message.PowerObjectParm

choose case _MsgData.Icon
	case Information!
		_ImageList.AddImage(ICO_INFO)
	case Exclamation!
		_ImageList.AddImage(ICO_WARNING)
	case Question!
		_ImageList.AddImage(ICO_QUESTION)
	case StopSign!
		_ImageList.AddImage(ICO_ERROR)
end choose

#LockUpdate = true
theme.of_SetTitleBarHeight(30)
theme.Font.of_SetSize(10)

Title = _MsgData.Title
mle_detail.Text = _MsgData.Detail

_wf_UpdateTextSize()
_wf_InitLayout()
_wf_UpdatePoints()

#LockUpdate = false
wf_UpdatePoints()

if _MsgData.TimeOut > 0 then
	_nTimeRemaining = _MsgData.TimeOut
	_wf_RefreshTimeOutBtnText()
	wf_Timer(TM_TIMEOUT,1)
end if

_wf_PlaySystemSound()

_bInitialized = true

_wf_SetPosition()
end event

event onkeydown;call super::onkeydown;if KeyDown(KeyControl!) then
	if KeyDown(KeyC!) then
		if mle_detail.Visible then
			if mle_detail.SelectedLength() = 0 then
				Clipboard(Title + &
							"~r~n=====================~r~n" + &
							ReplaceAll(_MsgData.Text,"~n","~r~n",true) + &
							"~r~n=====================~r~n" + &
							mle_detail.Text)
			else
				mle_detail.Copy()
			end if
		else
			Clipboard(Title + &
						"~r~n=====================~r~n" + &
						ReplaceAll(_MsgData.Text,"~n","~r~n",true))
		end if
	end if
end if

return 0
end event

type cb_copy from s_cst_button within w_cst_msgbox
integer x = 914
integer y = 181
integer width = 98
integer height = 85
string text = ""
string #tiptext = "复制"
end type

event constructor;call super::constructor;theme.of_SetBkgndColorStyle(theme.CLASSIC)
theme.of_SetBkgndStyle(Enums.SOLID)
of_SetImage(ICO_COPY)
end event

event clicked;call super::clicked;Clipboard(mle_detail.Text)
end event

event onsetfocusquery;call super::onsetfocusquery;return 1
end event

type cb_3 from s_cst_button within w_cst_msgbox
integer x = 710
integer y = 13
integer width = 302
integer taborder = 30
string text = "3"
end type

event clicked;call super::clicked;CloseWithReturn(Parent,3)
end event

event constructor;call super::constructor;of_SetToolTipStyle(Enums.TTS_NORMAL)
end event

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_TRANSPARENT
		color = ARGB(255,255,255,255)
	case theme.CLR_TEXT
		color = Parent.theme.of_GetColor(Parent.theme.CLR_TITLE,0)
end choose
end event

event onkeydown;call super::onkeydown;if KeyDown(KeyLeftArrow!) then
	if cb_2.visible then
		cb_2.SetFocus()
	elseif cb_1.visible then
		cb_1.SetFocus()
	end if
end if
end event

type cb_2 from s_cst_button within w_cst_msgbox
integer x = 384
integer y = 13
integer width = 302
integer taborder = 20
string text = "2"
end type

event clicked;call super::clicked;CloseWithReturn(Parent,2)
end event

event constructor;call super::constructor;of_SetToolTipStyle(Enums.TTS_NORMAL)
end event

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_TRANSPARENT
		color = ARGB(255,255,255,255)
	case theme.CLR_TEXT
		color = Parent.theme.of_GetColor(Parent.theme.CLR_TITLE,0)
end choose
end event

event onkeydown;call super::onkeydown;if KeyDown(KeyRightArrow!) then
	if cb_3.visible then
		cb_3.SetFocus()
	end if
end if
if KeyDown(KeyLeftArrow!) then
	if cb_1.visible then
		cb_1.SetFocus()
	end if
end if
end event

type cb_1 from s_cst_button within w_cst_msgbox
integer x = 58
integer y = 13
integer width = 302
integer taborder = 10
string text = "1"
end type

event clicked;call super::clicked;CloseWithReturn(Parent,1)
end event

event constructor;call super::constructor;of_SetToolTipStyle(Enums.TTS_NORMAL)
end event

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_TRANSPARENT
		color = ARGB(255,255,255,255)
	case theme.CLR_TEXT
		color = Parent.theme.of_GetColor(Parent.theme.CLR_TITLE,0)
end choose
end event

event onkeydown;call super::onkeydown;if KeyDown(KeyRightArrow!) then
	if cb_2.visible then
		cb_2.SetFocus()
	elseif cb_3.visible then
		cb_3.SetFocus()
	end if
end if

end event

type cb_detail from s_cst_button within w_cst_msgbox
integer y = 125
integer width = 1082
integer height = 53
boolean bringtotop = true
integer textsize = -8
string text = ""
string #tiptext = "查看详情"
end type

event constructor;call super::constructor;#LockUpdate = true
theme.of_SetBorderStyle(Enums.BS_NONE)
theme.of_SetBkgndStyle(Enums.SOLID)
theme.of_SetIconSize(16,16)
of_SetImage(ICO_ARROW_DOWN)
#LockUpdate = false
of_UpdatePoints()

of_SetToolTipStyle(Enums.TTS_NORMAL)
end event

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_BKGND
		if BitTest(state,Enums.STATE_FOCUS) then
			color = ARGB(255,244,247,252)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGBDarken(Painter.GetPBColorA(Parent.BackColor),0.05)
		elseif BitTest(state,Enums.STATE_PRESSED) then
			color = ARGBDarken(Painter.GetPBColorA(Parent.BackColor),0.1)
		elseif BitTest(state,Enums.STATE_DEFAULT) then
			color = ARGB(255,244,247,252)
		else
			color = ARGBDarken(Painter.GetPBColorA(Parent.BackColor),0.1)
		end if
	case theme.CLR_BORDER
		if BitTest(state,Enums.STATE_FOCUS) then
			color = ARGB(255,234,237,242)
		else
			color = ARGB(255,234,237,242)
		end if
end choose
end event

event clicked;call super::clicked;if _bShowDetail then
	_wf_HideDetail()
else
	_wf_ShowDetail()
end if
end event

event onsetfocusquery;call super::onsetfocusquery;return 1
end event

type mle_detail from s_cst_multilineedit within w_cst_msgbox
integer y = 181
integer width = 1082
integer height = 464
integer textsize = -10
long backcolor = 16777215
string text = ""
boolean border = false
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
boolean displayonly = true
boolean hideselection = false
end type

event constructor;call super::constructor;#LockUpdate = true

theme.of_SetBorderStyle(Enums.BS_SOLID)
theme.of_SetBorderMargin(0,0,0,0)

#LockUpdate = false
of_Redraw(false)
end event

type font from n_cst_font within w_cst_msgbox descriptor "pb_nvo" = "true" 
end type

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

