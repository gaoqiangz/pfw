$PBExportHeader$w_test_websocket.srw
forward
global type w_test_websocket from window
end type
type st_3 from statictext within w_test_websocket
end type
type mle_response from multilineedit within w_test_websocket
end type
type st_2 from statictext within w_test_websocket
end type
type sle_message from singlelineedit within w_test_websocket
end type
type cb_3 from commandbutton within w_test_websocket
end type
type cb_2 from commandbutton within w_test_websocket
end type
type cb_1 from commandbutton within w_test_websocket
end type
type st_1 from statictext within w_test_websocket
end type
type sle_url from singlelineedit within w_test_websocket
end type
type wsclient from n_wsclient within w_test_websocket
end type
end forward

global type w_test_websocket from window
integer width = 2446
integer height = 1704
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_3 st_3
mle_response mle_response
st_2 st_2
sle_message sle_message
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_1 st_1
sle_url sle_url
wsclient wsclient
end type
global w_test_websocket w_test_websocket

on w_test_websocket.create
this.st_3=create st_3
this.mle_response=create mle_response
this.st_2=create st_2
this.sle_message=create sle_message
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.sle_url=create sle_url
this.wsclient=create wsclient
this.Control[]={this.st_3,&
this.mle_response,&
this.st_2,&
this.sle_message,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.sle_url}
end on

on w_test_websocket.destroy
destroy(this.st_3)
destroy(this.mle_response)
destroy(this.st_2)
destroy(this.sle_message)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.sle_url)
destroy(this.wsclient)
end on

event open;//使用WSS协议时不验证服务端证书
//wsClient.SetValidateServer(false)
end event

type st_3 from statictext within w_test_websocket
integer x = 64
integer y = 532
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Response:"
boolean focusrectangle = false
end type

type mle_response from multilineedit within w_test_websocket
integer x = 64
integer y = 616
integer width = 2272
integer height = 956
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_test_websocket
integer x = 69
integer y = 264
integer width = 311
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Message:"
boolean focusrectangle = false
end type

type sle_message from singlelineedit within w_test_websocket
integer x = 69
integer y = 372
integer width = 841
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "测试pfwWebSocket"
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_test_websocket
integer x = 955
integer y = 372
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Send"
end type

event clicked;wsClient.Send(sle_message.Text)
end event

type cb_2 from commandbutton within w_test_websocket
integer x = 1701
integer y = 68
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Disconnect"
end type

event clicked;wsClient.Close()
end event

type cb_1 from commandbutton within w_test_websocket
integer x = 1170
integer y = 68
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Connect"
end type

event clicked;wsClient.Open(sle_url.Text)
end event

type st_1 from statictext within w_test_websocket
integer x = 69
integer y = 88
integer width = 219
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "URL:"
boolean focusrectangle = false
end type

type sle_url from singlelineedit within w_test_websocket
integer x = 288
integer y = 72
integer width = 841
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "wss://echo.websocket.org"
borderstyle borderstyle = stylelowered!
end type

type wsclient from n_wsclient within w_test_websocket descriptor "pb_nvo" = "true" 
end type

on wsclient.create
call super::create
end on

on wsclient.destroy
call super::destroy
end on

event onopen;call super::onopen;mle_response.Text += "Connection Opened!~r~n"
mle_response.Scroll(mle_response.LineCount())
return 0
end event

event onclose;call super::onclose;mle_response.Text += Sprintf("Connection Closed! Code:{1} Info:{2}~r~n",code,info)
mle_response.Scroll(mle_response.LineCount())
return 0
end event

event onerror;call super::onerror;mle_response.Text += Sprintf("Connection Error! Code:{1} Info:{2}~r~n",code,info)
mle_response.Scroll(mle_response.LineCount())
return 0
end event

event onmessage;call super::onmessage;mle_response.Text += "Message:~r~n" + msg.GetDataString() + "~r~n"
mle_response.Scroll(mle_response.LineCount())
return 0
end event

