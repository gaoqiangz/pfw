$PBExportHeader$w_about.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type w_about from s_cst_window
end type
type st_3 from statictext within w_about
end type
type shl_fwshare from statichyperlink within w_about
end type
type st_2 from statictext within w_about
end type
type mle_info from s_cst_multilineedit within w_about
end type
type st_1 from statictext within w_about
end type
type st_text from statictext within w_about
end type
end forward

global type w_about from s_cst_window
integer width = 1742
integer height = 1216
string title = "About PowerFramework"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 16777215
boolean #bordershadow = true
st_3 st_3
shl_fwshare shl_fwshare
st_2 st_2
mle_info mle_info
st_1 st_1
st_text st_text
end type
global w_about w_about

type prototypes

end prototypes

type variables
s_cst_window iw_Parent

n_image in_logoImage
end variables

on w_about.create
int iCurrent
call super::create
this.st_3=create st_3
this.shl_fwshare=create shl_fwshare
this.st_2=create st_2
this.mle_info=create mle_info
this.st_1=create st_1
this.st_text=create st_text
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.shl_fwshare
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.mle_info
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_text
end on

on w_about.destroy
call super::destroy
destroy(this.st_3)
destroy(this.shl_fwshare)
destroy(this.st_2)
destroy(this.mle_info)
destroy(this.st_1)
destroy(this.st_text)
end on

event ongetitemcolor;call super::ongetitemcolor;if IsValid(iw_Parent) then
	iw_Parent.Event OnGetItemColor(index,colorFlag,state,objectType,ref color)
end if
end event

Event OnGetColor;call super::ongetcolor;if IsValid(iw_Parent) then
	iw_Parent.Event OnGetColor(colorFlag,state,ref color)
end if
end event

event onpreopen;call super::onpreopen;s_cst_window lw_param

lw_param = Message.PowerObjectParm

if IsValid(lw_param) then
	iw_Parent = lw_param
	theme.of_SetTheme(iw_Parent.theme)
	theme.of_SetMenuBar(false)
	theme.of_SetToolBar(false)
	theme.of_SetStatusBar(false)
	theme.of_SetIconSize(16,16)
	theme.of_SetTitleBarHeight(40)
end if

mle_info.theme.of_SetTheme(theme)
mle_info.theme.of_SetBorderMargin(1,1,1,1)
mle_info.theme.of_SetScrollBarBorderStyle(theme.#BorderStyle)

in_logoImage = Create n_image
in_logoImage.SetImageSize(64,64)
in_logoImage.Load(Res.ICO_XXL_LOGO)

mle_info.text = "PowerFramework "+pfwVersion()+&
				"~r~n-----------------"+&
				"~r~nSciter:~r~n  http://sciter.com"+&
				"~r~nMiniBlink:~r~n  http://miniblink.net"+&
				"~r~nlibpng:~r~n  http://libmng.com/pub/png/libpng"+&
				"~r~napng-patch:~r~n  http://sourceforge.net/projects/libpng-apng"+&
				"~r~npugixml:~r~n  http://pugixml.org"+&
				"~r~ncJSON:~r~n  http://sourceforge.net/projects/cjson"+&
				"~r~nwebsocketpp:~r~n  http://www.zaphoyd.com/websocketpp"+&
				"~r~nopenssl:~r~n  https://www.openssl.org"+&
				"~r~nzlib:~r~n  http://www.zlib.net"+&
				"~r~nsqlite:~r~n  https://www.sqlite.org"+&
				"~r~nzint:~r~n  http://zint.org.uk"
st_text.text = "BUG反馈及意见请联系:~n~r邮箱gaoqiangz@msn.com或QQ:8509799"
end event

event close;call super::close;Destroy in_logoImage
end event

event onerasebkgnd;call super::onerasebkgnd;RECTF cliRect

if IsValid(in_logoImage) then
	wf_GetClientRect(ref cliRect,false)
	in_logoImage.Draw( hdc, (cliRect.right - 64) / 2, 20, false)
end if
return 1
end event

type st_3 from statictext within w_about
integer x = 1001
integer y = 1040
integer width = 128
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "开发"
boolean focusrectangle = false
end type

type shl_fwshare from statichyperlink within w_about
integer x = 283
integer y = 1040
integer width = 832
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 16777215
string text = "金千枝（深圳）软件技术有限公司"
boolean focusrectangle = false
string url = "http://www.jqzms.com"
end type

type st_2 from statictext within w_about
integer x = 59
integer y = 1040
integer width = 233
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "本框架由"
boolean focusrectangle = false
end type

type mle_info from s_cst_multilineedit within w_about
integer x = 50
integer y = 504
integer width = 1641
integer height = 348
integer taborder = 10
long backcolor = 16777215
boolean vscrollbar = true
boolean displayonly = true
boolean ignoredefaultbutton = true
end type

type st_1 from statictext within w_about
integer x = 1294
integer y = 1032
integer width = 398
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "2017/03/20"
boolean focusrectangle = false
end type

type st_text from statictext within w_about
integer x = 59
integer y = 856
integer width = 1632
integer height = 160
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
boolean focusrectangle = false
end type

