$PBExportHeader$wx_test_mqttclient.srw
forward
global type wx_test_mqttclient from window
end type
type sle_2 from singlelineedit within wx_test_mqttclient
end type
type st_7 from statictext within wx_test_mqttclient
end type
type ddlb_1 from dropdownlistbox within wx_test_mqttclient
end type
type cb_4 from commandbutton within wx_test_mqttclient
end type
type cb_3 from commandbutton within wx_test_mqttclient
end type
type ddlb_qos from dropdownlistbox within wx_test_mqttclient
end type
type st_6 from statictext within wx_test_mqttclient
end type
type cbx_retain from checkbox within wx_test_mqttclient
end type
type sle_msg from singlelineedit within wx_test_mqttclient
end type
type st_5 from statictext within wx_test_mqttclient
end type
type sle_topic from singlelineedit within wx_test_mqttclient
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
type st_4 from statictext within wx_test_mqttclient
end type
type st_9 from statictext within wx_test_mqttclient
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
sle_2 sle_2
st_7 st_7
ddlb_1 ddlb_1
cb_4 cb_4
cb_3 cb_3
ddlb_qos ddlb_qos
st_6 st_6
cbx_retain cbx_retain
sle_msg sle_msg
st_5 st_5
sle_topic sle_topic
sle_psw sle_psw
st_3 st_3
st_2 st_2
st_1 st_1
sle_user sle_user
cb_2 cb_2
sle_url sle_url
cb_1 cb_1
mle_1 mle_1
st_4 st_4
st_9 st_9
mqttclient mqttclient
end type
global wx_test_mqttclient wx_test_mqttclient

on wx_test_mqttclient.create
this.sle_2=create sle_2
this.st_7=create st_7
this.ddlb_1=create ddlb_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.ddlb_qos=create ddlb_qos
this.st_6=create st_6
this.cbx_retain=create cbx_retain
this.sle_msg=create sle_msg
this.st_5=create st_5
this.sle_topic=create sle_topic
this.sle_psw=create sle_psw
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_user=create sle_user
this.cb_2=create cb_2
this.sle_url=create sle_url
this.cb_1=create cb_1
this.mle_1=create mle_1
this.st_4=create st_4
this.st_9=create st_9
this.mqttclient=create mqttclient
this.Control[]={this.sle_2,&
this.st_7,&
this.ddlb_1,&
this.cb_4,&
this.cb_3,&
this.ddlb_qos,&
this.st_6,&
this.cbx_retain,&
this.sle_msg,&
this.st_5,&
this.sle_topic,&
this.sle_psw,&
this.st_3,&
this.st_2,&
this.st_1,&
this.sle_user,&
this.cb_2,&
this.sle_url,&
this.cb_1,&
this.mle_1,&
this.st_4,&
this.st_9}
end on

on wx_test_mqttclient.destroy
destroy(this.sle_2)
destroy(this.st_7)
destroy(this.ddlb_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.ddlb_qos)
destroy(this.st_6)
destroy(this.cbx_retain)
destroy(this.sle_msg)
destroy(this.st_5)
destroy(this.sle_topic)
destroy(this.sle_psw)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_user)
destroy(this.cb_2)
destroy(this.sle_url)
destroy(this.cb_1)
destroy(this.mle_1)
destroy(this.st_4)
destroy(this.st_9)
destroy(this.mqttclient)
end on

type sle_2 from singlelineedit within wx_test_mqttclient
integer x = 215
integer y = 344
integer width = 585
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within wx_test_mqttclient
integer x = 855
integer y = 372
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
string text = "质量:"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within wx_test_mqttclient
integer x = 1097
integer y = 344
integer width = 352
integer height = 400
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"0","1","2"}
borderstyle borderstyle = stylelowered!
end type

event constructor;SelectItem(1)
end event

type cb_4 from commandbutton within wx_test_mqttclient
integer x = 1559
integer y = 336
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Subscribe"
end type

event clicked;mqttclient.Subscribe(sle_topic.text,Long(ddlb_qos.text))
end event

type cb_3 from commandbutton within wx_test_mqttclient
integer x = 2715
integer y = 192
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Publish"
end type

event clicked;mqttclient.Publish(sle_topic.text,sle_msg.text,Long(ddlb_qos.text),cbx_retain.checked)
end event

type ddlb_qos from dropdownlistbox within wx_test_mqttclient
integer x = 2016
integer y = 192
integer width = 352
integer height = 400
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"0","1","2"}
borderstyle borderstyle = stylelowered!
end type

event constructor;SelectItem(1)
end event

type st_6 from statictext within wx_test_mqttclient
integer x = 1792
integer y = 220
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
string text = "质量:"
boolean focusrectangle = false
end type

type cbx_retain from checkbox within wx_test_mqttclient
integer x = 2423
integer y = 204
integer width = 256
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "保留"
end type

type sle_msg from singlelineedit within wx_test_mqttclient
integer x = 1097
integer y = 192
integer width = 654
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

type st_5 from statictext within wx_test_mqttclient
integer x = 855
integer y = 220
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
string text = "消息:"
boolean focusrectangle = false
end type

type sle_topic from singlelineedit within wx_test_mqttclient
integer x = 215
integer y = 192
integer width = 585
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

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
integer x = 2903
integer y = 20
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
integer x = 2464
integer y = 20
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
cfg.SetAutoReconnect(true)
cfg.SetOfflineQueue(true)
cfg.SetCredential(sle_user.text,sle_psw.text)

mqttclient.Open(sle_url.text,cfg)

mqttclient.Subscribe("test/+")
mqttclient.Publish("test/topic","我爱PB!",1)
end event

type mle_1 from multilineedit within wx_test_mqttclient
integer y = 652
integer width = 3383
integer height = 1460
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

type st_4 from statictext within wx_test_mqttclient
integer x = 9
integer y = 220
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "主题："
boolean focusrectangle = false
end type

type st_9 from statictext within wx_test_mqttclient
integer x = 9
integer y = 372
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "主题："
boolean focusrectangle = false
end type

type mqttclient from nx_mqttclient within wx_test_mqttclient descriptor "pb_nvo" = "true" 
end type

on mqttclient.create
call super::create
end on

on mqttclient.destroy
call super::destroy
end on

event onopen;call super::onopen;mle_1.text += Sprintf("Open [reconnect: {}]~r~n",reconnect)
mle_1.Scroll(mle_1.LineCount() + 1)

end event

event onclose;call super::onclose;mle_1.text += Sprintf("Close [code: {}, info: {}]~r~n",code,info)
mle_1.Scroll(mle_1.LineCount() + 1)

end event

event onerror;call super::onerror;mle_1.text += Sprintf("Error: {}, {}~r~n",code,info)
mle_1.Scroll(mle_1.LineCount() + 1)

end event

event onmessage;call super::onmessage;mle_1.text += Sprintf("Message: {}, {}, {}~r~n",msg.GetTopic(),msg.IsRetained(),msg.GetDataString())
mle_1.Scroll(mle_1.LineCount() + 1)

end event

