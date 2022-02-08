$PBExportHeader$w_test_trayicon.srw
forward
global type w_test_trayicon from window
end type
type cb_8 from commandbutton within w_test_trayicon
end type
type cb_7 from commandbutton within w_test_trayicon
end type
type cb_6 from commandbutton within w_test_trayicon
end type
type cb_5 from commandbutton within w_test_trayicon
end type
type cb_4 from commandbutton within w_test_trayicon
end type
type cb_3 from commandbutton within w_test_trayicon
end type
type cb_2 from commandbutton within w_test_trayicon
end type
type cb_1 from commandbutton within w_test_trayicon
end type
end forward

global type w_test_trayicon from window
integer width = 1705
integer height = 1192
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_test_trayicon w_test_trayicon

type variables
n_trayicon _trayicon
ulong dwID
end variables

event open;_trayicon = Create n_trayicon
end event

event close;_trayicon.RemoveIcon(Handle(this),dwID)
Destroy _trayicon
end event

on w_test_trayicon.create
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_test_trayicon.destroy
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cb_8 from commandbutton within w_test_trayicon
integer x = 699
integer y = 560
integer width = 457
integer height = 132
integer taborder = 70
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "SetTipText"
end type

event clicked;_trayicon.SetTipText(Handle(Parent),dwID,"Time~n"+String(ToDay(),"YYYY-MM-DD HH:MM:SS"))
end event

type cb_7 from commandbutton within w_test_trayicon
integer x = 110
integer y = 564
integer width = 457
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "SetIcon"
end type

event clicked;if Mod(CPU(),2) = 0 then
	_trayicon.SetIcon(Handle(Parent),dwID,Res.ICO_S_USER)
else
	_trayicon.SetIcon(Handle(Parent),dwID,Res.ICO_S_LOGO)
end if
end event

type cb_6 from commandbutton within w_test_trayicon
integer x = 686
integer y = 376
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "HideIcon"
end type

event clicked;_trayicon.HideIcon(Handle(Parent),dwID)
end event

type cb_5 from commandbutton within w_test_trayicon
integer x = 105
integer y = 368
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ShowIcon"
end type

event clicked;_trayicon.ShowIcon(Handle(Parent),dwID)
end event

type cb_4 from commandbutton within w_test_trayicon
integer x = 681
integer y = 188
integer width = 553
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "HideBalloonTip"
end type

event clicked;_trayicon.HideBalloonTip(Handle(Parent),dwID)
end event

type cb_3 from commandbutton within w_test_trayicon
integer x = 64
integer y = 188
integer width = 585
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ShowBalloonTip"
end type

event clicked;_trayicon.ShowBalloonTip(Handle(Parent),dwID,Information!,"Time",String(ToDay(),"YYYY-MM-DD HH:MM:SS"))
end event

type cb_2 from commandbutton within w_test_trayicon
integer x = 448
integer y = 28
integer width = 357
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Delete"
end type

event clicked;_trayicon.RemoveIcon(Handle(Parent),dwID)
end event

type cb_1 from commandbutton within w_test_trayicon
integer x = 46
integer y = 36
integer width = 366
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add"
end type

event clicked;dwID = _trayicon.AddIcon(Handle(Parent),"open!","Test Tray-Icon!")
//pbr://Res.pbd/png/logoicon
end event

