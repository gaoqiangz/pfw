$PBExportHeader$w_test_assert.srw
forward
global type w_test_assert from window
end type
type cb_4 from commandbutton within w_test_assert
end type
type cb_3 from commandbutton within w_test_assert
end type
type cb_2 from commandbutton within w_test_assert
end type
type cb_1 from commandbutton within w_test_assert
end type
end forward

global type w_test_assert from window
integer width = 1911
integer height = 1436
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
cb_1 cb_1
end type
global w_test_assert w_test_assert

forward prototypes
public subroutine wf_testassert (readonly long num)
public subroutine wf_testassert2 (readonly long num)
end prototypes

public subroutine wf_testassert (readonly long num);Assert(num > 0)
end subroutine

public subroutine wf_testassert2 (readonly long num);Assert(num > 0,"Invalid Number!")

end subroutine

on w_test_assert.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_test_assert.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cb_4 from commandbutton within w_test_assert
integer x = 480
integer y = 1092
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "StackTrace"
end type

event clicked;messagebox("",StackTraceInfo("-- "))
end event

type cb_3 from commandbutton within w_test_assert
integer x = 297
integer y = 812
integer width = 814
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Test Assert2 with catch"
end type

event clicked;try
	wf_TestAssert2(-1)
catch(AssertionFailed ex)
	messagebox("EXCEPTION",ex.#Info + "~nvia:~n" + ex.#Object + "::" + ex.#ObjectEvent + "~nStackTrace:~n" + ex.#StackTraceInfo)
end try
end event

type cb_2 from commandbutton within w_test_assert
integer x = 1029
integer y = 544
integer width = 466
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Test Assert2"
end type

event clicked;wf_TestAssert2(-1)
end event

type cb_1 from commandbutton within w_test_assert
integer x = 315
integer y = 540
integer width = 466
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Test Assert1"
end type

event clicked;wf_TestAssert(-1)
end event

