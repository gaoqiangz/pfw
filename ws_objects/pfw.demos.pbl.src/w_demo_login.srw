$PBExportHeader$w_demo_login.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type w_demo_login from s_cst_window
end type
type ddlb_id from s_cst_dropdownlist within w_demo_login
end type
type shl_2 from statichyperlink within w_demo_login
end type
type shl_1 from statichyperlink within w_demo_login
end type
type cbx_1 from s_cst_checkbox within w_demo_login
end type
type sle_psw from s_cst_singlelineedit within w_demo_login
end type
type cb_login from s_cst_button within w_demo_login
end type
end forward

global type w_demo_login from s_cst_window
integer width = 1595
integer height = 620
string title = "登录"
boolean maxbox = false
boolean resizable = false
boolean clientedge = false
windowanimationstyle closeanimation = fadeanimation!
boolean #bordershadow = true
ddlb_id ddlb_id
shl_2 shl_2
shl_1 shl_1
cbx_1 cbx_1
sle_psw sle_psw
cb_login cb_login
end type
global w_demo_login w_demo_login

type variables
Private:
n_image 	in_logoImage
n_image 	in_bannerImage

boolean _initialized				//窗口初始化标志
boolean _wndTopMost = true	//窗口置顶标志
boolean _reversePlay				//反向循环播放动画

//Background color
Ulong FLATBKGNDCOLOR
//Timer IDs
Constant Uint TM_BANNER = 1
end variables

on w_demo_login.create
int iCurrent
call super::create
this.ddlb_id=create ddlb_id
this.shl_2=create shl_2
this.shl_1=create shl_1
this.cbx_1=create cbx_1
this.sle_psw=create sle_psw
this.cb_login=create cb_login
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_id
this.Control[iCurrent+2]=this.shl_2
this.Control[iCurrent+3]=this.shl_1
this.Control[iCurrent+4]=this.cbx_1
this.Control[iCurrent+5]=this.sle_psw
this.Control[iCurrent+6]=this.cb_login
end on

on w_demo_login.destroy
call super::destroy
destroy(this.ddlb_id)
destroy(this.shl_2)
destroy(this.shl_1)
destroy(this.cbx_1)
destroy(this.sle_psw)
destroy(this.cb_login)
end on

event closequery;call super::closequery;_wndTopMost = false
end event

event onpreopen;call super::onpreopen;in_bannerImage = Create n_image
in_bannerImage.ShareImage(false)
in_bannerImage.SetImageSize(350,80)
in_bannerImage.Load(Res.AM_LW_LOWPOLY)

in_logoImage = Create n_image
in_logoImage.ShareImage(false)
in_logoImage.SetImageSize(64,64)
in_logoImage.Load(Res.ICO_XXL_LOGO)

FLATBKGNDCOLOR = ARGB(255,235,242,249)
shl_1.BackColor = ToRGB(FLATBKGNDCOLOR)
shl_2.BackColor = shl_1.BackColor

#LockUpdate = true

theme.of_SetBkgndColorStyle(theme.BLUE)
theme.of_SetBkgndStyle(Enums.TRANSPARENT)
theme.of_SetBorderStyle(Enums.BS_NONE)
theme.of_SetTitleBarHeight(80)
//theme.of_SetBorderMargin(1,0,1,1)
theme.of_SetBorderMargin(0,0,0,0)
theme.of_SetItemStyle(theme.ITS_WIN8)
theme.of_SetItemBkgndStyle(Enums.SOLID)
theme.Font.of_SetSize(20)
CaptionBar.of_SetTitle("")
CaptionBar.of_SetIcon("")

#LockUpdate = false
wf_UpdatePoints()

wf_Timer(TM_BANNER,in_bannerImage.GetFrameDelayTime( in_bannerImage.GetFrame())/10000)

_initialized = true
end event

event close;call super::close;Destroy in_logoImage
Destroy in_bannerImage
end event

event onncerasebkgnd;RECTF wndRect

if Not _initialized then return 1

Painter.GetWindowRect(#Handle,ref wndRect)
Painter.OffsetRect(ref wndRect,-wndRect.left,-wndRect.top)

//Draw titlebar image
if IsValidObject(in_bannerImage) then
	in_bannerImage.Draw( hdc,0,0,false)
else
	Painter.of_FillRect( hdc, wndRect, ARGB(255,0,133,210),false,0)
end if
//Draw frame border
//Painter.of_DrawRect( hdc, wndRect, ARGB(255,0,109,176), Enums.LS_SOLID, 1)
//Draw shadow
Painter.FillRect( hdc, wndRect.left,wndRect.top + theme.#TitleBarHeight - 10,wndRect.right,wndRect.top + theme.#TitleBarHeight - 2,&
				0,  ARGB(50,0,109,176),Enums.VERT,false,false,0)
Painter.FillRect( hdc, wndRect.left,wndRect.top + theme.#TitleBarHeight - 2,wndRect.right,wndRect.top + theme.#TitleBarHeight,&
				ARGB(50,0,109,176),  ARGB(200,0,109,176),Enums.VERT,false,false,0)

wndRect.bottom = theme.#TitleBarHeight - 2
Painter.DrawText( hdc, theme.Font.#Handle, "PowerFramework", wndRect, ARGB(255,255,255,255), false,Painter.DT_SINGLELINE + Painter.DT_CENTER + Painter.DT_VCENTER)

return 1
end event

event ontimer;call super::ontimer;boolean bContinue
boolean needRedraw

choose case id
	case TM_BANNER
		bContinue = true
		if in_bannerImage.IsFrameChanged() then
			if _reversePlay then
				if in_bannerImage.GetFrame() = 1 then
					_reversePlay = false
					in_bannerImage.NextFrame()
				else
					in_bannerImage.SetFrame(in_bannerImage.GetFrame() - 1)
				end if
			else
				if in_bannerImage.GetFrame() = in_bannerImage.GetFrameCount() then
					_reversePlay = true
					in_bannerImage.SetFrame(in_bannerImage.GetFrame() - 1)
				else
					in_bannerImage.NextFrame()
				end if
			end if
			wf_Timer(id,in_bannerImage.GetFrameDelayTime( in_bannerImage.GetFrame())/10000)
			needRedraw = true
		end if
end choose

if needRedraw then
	wf_Redraw(false,false)
end if

return bContinue
end event

event ongetitemcolor;if objectType = WOT_TITLEBAR then
	choose case colorFlag
		case theme.CLR_BKGND
			if BitTest(state,Enums.STATE_PRESSED) then
				if index = CaptionBar.IDX_CLOSE then
					color = ARGB(200,229,73,65)
				elseif index = CaptionBar.IDX_MINI then
					color = ARGB(200,0,152,226)
				end if
			elseif BitTest(state,Enums.STATE_HOVER) then
				if index = CaptionBar.IDX_CLOSE then
					color = ARGB(200,249,93,85)
				elseif index = CaptionBar.IDX_MINI then
					color = ARGB(200,0,172,246)
				end if
			else
				color = ARGB(0,255,255,255)
			end if
		case theme.CLR_BORDER
			color = 0
	end choose
end if
end event

event onpostopen;call super::onpostopen;//将窗口设置为前台窗口并置顶
if Win32.GetForegroundWindow() <> #Handle then
	Win32.SetForegroundWindow(#Handle)
	Win32.SwitchToThisWindow(#Handle,false)
end if
Win32.SetWindowTopMost(#Handle,true)
end event

event Onncactivate;call super::Onncactivate;Win32.SetWindowTopMost(#Handle,_wndTopMost)
return AncestorReturnValue
end event

event onerasebkgnd;call super::onerasebkgnd;RECTF cliRect

if #LockUpdate then return 1
if Not _initialized then return 1

wf_GetClientRect(ref cliRect,false)

Painter.of_FillRect( hdc, cliRect, FLATBKGNDCOLOR,false,0)

in_logoImage.Draw(hdc,10,20,false)

return 1
end event

type ddlb_id from s_cst_dropdownlist within w_demo_login
integer x = 393
integer y = 52
integer width = 850
integer height = 400
integer taborder = 10
boolean allowedit = true
boolean autohscroll = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"gaoqiangz@msn.com","路 人 甲 cw","张三","李四","王五"}
end type

event constructor;call super::constructor;#LockUpdate = true
theme.of_SetRoundSize(4,4,0,0)
theme.of_SetBorderStyle(Enums.BS_ROUND)
theme.of_SetBkgndColorStyle(theme.BLUE)
of_SetImage(Res.ICO_LW_USER)
#LockUpdate = false
of_UpdatePoints()
of_SetToolTipStyle(Enums.TTS_NORMAL)

of_SetDefaultText("请输入用户名")
end event

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_BORDER
		if BitTest(state,Enums.STATE_DISABLED) then
			color = ARGB(255,220,220,220)
		elseif BitTest(state,Enums.STATE_FOCUS) then
			color = ARGB(255,0,149,215)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,0,189,255)
		else
			color = ARGB(255,200,200,200)
		end if
	case theme.CLR_TRANSPARENT
		color = FLATBKGNDCOLOR
end choose
end event

event getfocus;call super::getfocus;BringToTop = true
end event

type shl_2 from statichyperlink within w_demo_login
integer x = 1298
integer y = 180
integer width = 256
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 134217741
long backcolor = 67108864
string text = "找回密码"
boolean focusrectangle = false
end type

type shl_1 from statichyperlink within w_demo_login
integer x = 1298
integer y = 64
integer width = 256
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 134217741
long backcolor = 67108864
string text = "注册账号"
boolean focusrectangle = false
end type

type cbx_1 from s_cst_checkbox within w_demo_login
integer x = 402
integer y = 288
integer width = 320
integer textsize = -8
string text = "记住密码"
string #tiptext = "记住密码"
end type

event constructor;call super::constructor;theme.of_SetBkgndColorStyle(theme.BLUE)
theme.of_SetBkgndStyle(Enums.TRANSPARENT)
of_SetToolTipStyle(Enums.TTS_NORMAL)
end event

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_TRANSPARENT
		color = FLATBKGNDCOLOR
end choose
end event

type sle_psw from s_cst_singlelineedit within w_demo_login
event onenchange pbm_enchange
integer x = 393
integer y = 152
integer width = 850
integer height = 120
integer taborder = 20
string text = ""
boolean password = true
icon #tooltipicon = information!
string #tooltiptitle = "密码"
string #tiptext = "区分大小写"
end type

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_BORDER
		if BitTest(state,Enums.STATE_DISABLED) then
			color = ARGB(255,220,220,220)
		elseif BitTest(state,Enums.STATE_FOCUS) then
			color = ARGB(255,0,149,215)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,0,189,255)
		else
			color = ARGB(255,200,200,200)
		end if
	case theme.CLR_TRANSPARENT
		color = FLATBKGNDCOLOR
end choose
end event

event constructor;call super::constructor;#LockUpdate = true
theme.of_SetRoundSize(0,0,4,4)
theme.of_SetBorderStyle(Enums.BS_ROUND)
of_SetImage(Res.ICO_LW_KEY)
#LockUpdate = false
of_UpdatePoints()
of_SetToolTipStyle(Enums.TTS_NORMAL)

of_SetDefaultText("请输入密码")
end event

event getfocus;call super::getfocus;BringToTop = true
end event

type cb_login from s_cst_button within w_demo_login
integer x = 393
integer y = 392
integer width = 850
integer height = 116
integer taborder = 30
integer weight = 700
string text = "登录"
boolean default = true
string #tiptext = "登录"
end type

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_BKGND
		if BitTest(state,Enums.STATE_DISABLED) then
			color = ARGB(255,0,136,219)
		elseif BitTest(state,Enums.STATE_FOCUS) then
			color = ARGB(255,0,136,219)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,0,156,239)
		elseif BitTest(state,Enums.STATE_DEFAULT) then
			color = ARGB(255,0,146,229)
		else
			color = ARGB(255,200,200,200)
		end if
	case theme.CLR_TEXT
		if BitTest(state,Enums.STATE_DISABLED) then
			color = ARGB(255,220,220,220)
		else
			color = ARGB(255,255,255,255)
		end if
	case theme.CLR_BORDER
		color = ARGB(255,0,146,229)
	case theme.CLR_TRANSPARENT
		color = FLATBKGNDCOLOR
end choose
end event

event constructor;call super::constructor;#LockUpdate = true
theme.of_SetBkgndColorStyle(theme.BLUE)
theme.of_SetBorderStyle(Enums.BS_ROUND)
theme.of_SetBkgndStyle(Enums.SOLID)
#LockUpdate = false
of_UpdatePoints()

of_SetToolTipStyle(Enums.TTS_NORMAL)
end event

