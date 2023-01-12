$PBExportHeader$wx_test_mqttclient.srw
forward
global type wx_test_mqttclient from window
end type
type sle_psw from singlelineedit within wx_test_mqttclient
end type
type st_3 from statictext within wx_test_mqttclient
end type
type st_2 from statictext within wx_test_mqttclient
end type
type st_1 from statictext within wx_test_mqttclient
end type
type sle_user from singlelineedit within wx_test_mqttclient
end type
type cb_2 from commandbutton within wx_test_mqttclient
end type
type sle_url from singlelineedit within wx_test_mqttclient
end type
type cb_1 from commandbutton within wx_test_mqttclient
end type
type mle_1 from multilineedit within wx_test_mqttclient
end type
type mqttclient from nx_mqttclient within wx_test_mqttclient
end type
end forward

global type wx_test_mqttclient from window
integer width = 3429
integer height = 2204
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_psw sle_psw
st_3 st_3
st_2 st_2
st_1 st_1
sle_user sle_user
cb_2 cb_2
sle_url sle_url
cb_1 cb_1
mle_1 mle_1
mqttclient mqttclient
end type
global wx_test_mqttclient wx_test_mqttclient

on wx_test_mqttclient.create
this.sle_psw=create sle_psw
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_user=create sle_user
this.cb_2=create cb_2
this.sle_url=create sle_url
this.cb_1=create cb_1
this.mle_1=create mle_1
this.mqttclient=create mqttclient
this.Control[]={this.sle_psw,&
this.st_3,&
this.st_2,&
this.st_1,&
this.sle_user,&
this.cb_2,&
this.sle_url,&
this.cb_1,&
this.mle_1}
end on

on wx_test_mqttclient.destroy
destroy(this.sle_psw)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_user)
destroy(this.cb_2)
destroy(this.sle_url)
destroy(this.cb_1)
destroy(this.mle_1)
destroy(this.mqttclient)
end on

type sle_psw from singlelineedit within wx_test_mqttclient
integer x = 2007
integer y = 28
integer width = 366
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within wx_test_mqttclient
integer x = 1792
integer y = 56
integer width = 206
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "密码:"
boolean focusrectangle = false
end type

type st_2 from statictext within wx_test_mqttclient
integer x = 1138
integer y = 56
integer width = 242
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "用户名:"
boolean focusrectangle = false
end type

type st_1 from statictext within wx_test_mqttclient
integer x = 9
integer y = 56
integer width = 206
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "地址:"
boolean focusrectangle = false
end type

type sle_user from singlelineedit within wx_test_mqttclient
integer x = 1385
integer y = 28
integer width = 366
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within wx_test_mqttclient
integer x = 471
integer y = 164
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;mqttclient.Close()
end event

type sle_url from singlelineedit within wx_test_mqttclient
integer x = 215
integer y = 28
integer width = 891
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within wx_test_mqttclient
integer x = 32
integer y = 164
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Open"
end type

event clicked;nx_mqttconfig cfg

cfg = Create nx_mqttconfig
cfg.SetCredential(sle_user.text,sle_psw.text)

mqttclient.Open(sle_url.text,cfg)
end event

type mle_1 from multilineedit within wx_test_mqttclient
integer y = 720
integer width = 3383
integer height = 1392
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type mqttclient from nx_mqttclient within wx_test_mqttclient descriptor "pb_nvo" = "true" 
end type

on mqttclient.create
call super::create
end on

on mqttclient.destroy
call super::destroy
end on

event onopen;call super::onopen;mle_1.text += Sprintf("Open [reconnect: {}, sessionPresent: {}]~r~n",reconnect,sessionPresent)
mle_1.Scroll(mle_1.LineCount() + 1)

end event

event onclose;call super::onclose;mle_1.text += Sprintf("Close [code: {}, info: {}]~r~n",code,info)
mle_1.Scroll(mle_1.LineCount() + 1)

end event

