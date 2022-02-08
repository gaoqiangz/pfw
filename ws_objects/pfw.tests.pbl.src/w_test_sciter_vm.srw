$PBExportHeader$w_test_sciter_vm.srw
forward
global type w_test_sciter_vm from window
end type
type cb_4 from commandbutton within w_test_sciter_vm
end type
type cb_3 from commandbutton within w_test_sciter_vm
end type
type cb_2 from commandbutton within w_test_sciter_vm
end type
type st_1 from statictext within w_test_sciter_vm
end type
type mle_debug from multilineedit within w_test_sciter_vm
end type
type cb_1 from commandbutton within w_test_sciter_vm
end type
type scvm from n_scitervm within w_test_sciter_vm
end type
end forward

global type w_test_sciter_vm from window
integer width = 2880
integer height = 1644
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
st_1 st_1
mle_debug mle_debug
cb_1 cb_1
scvm scvm
end type
global w_test_sciter_vm w_test_sciter_vm

type variables

end variables

on w_test_sciter_vm.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.st_1=create st_1
this.mle_debug=create mle_debug
this.cb_1=create cb_1
this.scvm=create scvm
this.Control[]={this.cb_4,&
this.cb_3,&
this.cb_2,&
this.st_1,&
this.mle_debug,&
this.cb_1}
end on

on w_test_sciter_vm.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.mle_debug)
destroy(this.cb_1)
destroy(this.scvm)
end on

event open;scVM.SetDebugOutput(true)
scVM.SetHost(this)
scVM.LoadFile("tests\sciter\test.js")
end event

type cb_4 from commandbutton within w_test_sciter_vm
integer x = 59
integer y = 288
integer width = 562
integer height = 136
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Invoke SetTitle"
end type

event clicked;scVM.InvokeFunction("setTitle","Hello pfw!")
end event

type cb_3 from commandbutton within w_test_sciter_vm
integer x = 1285
integer y = 92
integer width = 562
integer height = 136
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Invoke test"
end type

event clicked;scVM.InvokeFunction("test",this)
end event

type cb_2 from commandbutton within w_test_sciter_vm
integer x = 699
integer y = 100
integer width = 535
integer height = 136
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Invoke Add"
end type

event clicked;MessageBox("",String(scVM.InvokeFunction("add",100,200)))
end event

type st_1 from statictext within w_test_sciter_vm
integer x = 23
integer y = 496
integer width = 576
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Debug Output:"
boolean focusrectangle = false
end type

type mle_debug from multilineedit within w_test_sciter_vm
integer y = 616
integer width = 2834
integer height = 952
integer taborder = 20
integer textsize = -12
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

type cb_1 from commandbutton within w_test_sciter_vm
integer x = 78
integer y = 88
integer width = 562
integer height = 136
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Invoke MsgBox"
end type

event clicked;scVM.InvokeFunction("msgbox","test","Hello pfw!")
end event

type scvm from n_scitervm within w_test_sciter_vm descriptor "pb_nvo" = "true" 
end type

event ondebugoutput;call super::ondebugoutput;mle_debug.Text += info + "~r~n"
mle_debug.Scroll(mle_debug.LineCount())
return 1
end event

on scvm.create
call super::create
end on

on scvm.destroy
call super::destroy
end on

