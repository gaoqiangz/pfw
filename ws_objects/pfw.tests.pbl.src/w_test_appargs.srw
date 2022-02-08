$PBExportHeader$w_test_appargs.srw
forward
global type w_test_appargs from window
end type
type cb_4 from commandbutton within w_test_appargs
end type
type cb_3 from commandbutton within w_test_appargs
end type
type st_1 from statictext within w_test_appargs
end type
type mle_result from multilineedit within w_test_appargs
end type
type cb_2 from commandbutton within w_test_appargs
end type
type sle_cmdline from singlelineedit within w_test_appargs
end type
type cb_1 from commandbutton within w_test_appargs
end type
end forward

global type w_test_appargs from window
integer width = 2885
integer height = 1140
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
st_1 st_1
mle_result mle_result
cb_2 cb_2
sle_cmdline sle_cmdline
cb_1 cb_1
end type
global w_test_appargs w_test_appargs

type variables
n_cst_appargs _appArgs
end variables

event open;_appArgs = Create n_cst_appargs
end event

event close;Destroy _appArgs
end event

on w_test_appargs.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.st_1=create st_1
this.mle_result=create mle_result
this.cb_2=create cb_2
this.sle_cmdline=create sle_cmdline
this.cb_1=create cb_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.st_1,&
this.mle_result,&
this.cb_2,&
this.sle_cmdline,&
this.cb_1}
end on

on w_test_appargs.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.mle_result)
destroy(this.cb_2)
destroy(this.sle_cmdline)
destroy(this.cb_1)
end on

type cb_4 from commandbutton within w_test_appargs
integer x = 1605
integer y = 248
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

event clicked;int nIndex,nCount
string sVals[]

messagebox("ARG3",_appArgs.of_GetValueString("ARG3"))

nCount = _appArgs.of_GetValues("ARG5",ref sVals)
for nIndex = 1 to nCount
	messagebox("ARG5 #" + String(nIndex),sVals[nIndex])
next
end event

type cb_3 from commandbutton within w_test_appargs
integer x = 530
integer y = 248
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

event clicked;_appArgs.of_Add("newArg1")
_appArgs.of_Add("newArg2","val1")
_appArgs.of_Add("newArg2","val2")
_appArgs.of_Add("newArg3","abcd defg hijk")
_appArgs.of_Set("ARG5","new val")
_appArgs.of_Remove("ARG2")
end event

type st_1 from statictext within w_test_appargs
integer x = 41
integer y = 396
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
string text = "Result:"
boolean focusrectangle = false
end type

type mle_result from multilineedit within w_test_appargs
integer x = 41
integer y = 488
integer width = 2779
integer height = 524
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_test_appargs
integer x = 1033
integer y = 252
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Serialize"
end type

event clicked;mle_result.text = _appArgs.of_Serialize()
end event

type sle_cmdline from singlelineedit within w_test_appargs
integer x = 50
integer y = 80
integer width = 1563
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "/ARG1 /ARG2 /ARG3 val /ARG4 ~"val val~" /ARG5 val1 /ARG5 val2"
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_test_appargs
integer x = 41
integer y = 252
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Parse"
end type

event clicked;_appArgs.of_Parse(sle_cmdline.text)
end event

