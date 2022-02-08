$PBExportHeader$w_test_static_map.srw
forward
global type w_test_static_map from window
end type
type cb_1 from commandbutton within w_test_static_map
end type
type p_map from picture within w_test_static_map
end type
end forward

global type w_test_static_map from window
integer width = 4754
integer height = 1980
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
p_map p_map
end type
global w_test_static_map w_test_static_map

on w_test_static_map.create
this.cb_1=create cb_1
this.p_map=create p_map
this.Control[]={this.cb_1,&
this.p_map}
end on

on w_test_static_map.destroy
destroy(this.cb_1)
destroy(this.p_map)
end on

type cb_1 from commandbutton within w_test_static_map
integer x = 78
integer y = 1704
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Load Map"
end type

event clicked;n_httpclient httpClient
n_httpresponse rsp

httpClient = Create n_httpclient

rsp = httpClient.Request("GET",Sprintf("http://api.map.baidu.com/staticimage?center={1}&zoom={2}&width={3}&height={4}",+&
													/*center*/&
													"深圳罗湖怡景花园" /*"114.143028,22.559883"*/,+&
													/*zoom*/&
													15,+&
													/*size*/&
													U2PX(p_map.Width),U2PY(p_map.Height)))
if rsp.IsValid() then
	p_map.SetPicture(rsp.GetData())
end if

Destroy httpClient
end event

type p_map from picture within w_test_static_map
integer x = 27
integer y = 24
integer width = 4658
integer height = 1556
boolean originalsize = true
boolean focusrectangle = false
end type

