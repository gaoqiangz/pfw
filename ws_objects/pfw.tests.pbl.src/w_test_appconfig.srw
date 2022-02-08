$PBExportHeader$w_test_appconfig.srw
forward
global type w_test_appconfig from window
end type
type cb_3 from commandbutton within w_test_appconfig
end type
type cb_2 from commandbutton within w_test_appconfig
end type
type cb_1 from commandbutton within w_test_appconfig
end type
end forward

global type w_test_appconfig from window
integer width = 1746
integer height = 1184
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_test_appconfig w_test_appconfig

type variables
n_cst_appconfig _appConfig
end variables

event open;_appConfig = Create n_cst_appconfig
end event

event close;Destroy _appConfig
end event

on w_test_appconfig.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_test_appconfig.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cb_3 from commandbutton within w_test_appconfig
integer x = 1125
integer y = 272
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Test"
end type

event clicked;messagebox("settings/ui/title",_appConfig.of_GetConfigString("settings/ui/title"))
messagebox("settings/security",_appConfig.of_GetConfigStringProtected("settings/security"))
end event

type cb_2 from commandbutton within w_test_appconfig
integer x = 549
integer y = 276
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Modify"
end type

event clicked;_appConfig.of_UpdateConfig("settings/ui/title","test title")
_appConfig.of_UpdateConfig("settings/temppath","test path")
_appConfig.of_UpdateConfigProtected("settings/security","security value")
end event

type cb_1 from commandbutton within w_test_appconfig
integer x = 37
integer y = 276
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "LoadFile"
end type

event clicked;_appConfig.of_OpenFile("app.cfg","APP_NAME")
end event

