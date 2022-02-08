$PBExportHeader$w_test_regex.srw
forward
global type w_test_regex from window
end type
type cb_2 from commandbutton within w_test_regex
end type
type cb_1 from commandbutton within w_test_regex
end type
type cb_7 from commandbutton within w_test_regex
end type
end forward

shared variables
string iss_test = "hahaha"
end variables

global type w_test_regex from window
integer width = 2126
integer height = 708
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
cb_7 cb_7
end type
global w_test_regex w_test_regex

type variables

end variables

forward prototypes
public function string wf_test (ref double a, ref long b, ref string c, ref n_xmldoc doc)
public subroutine wf_test2 ()
public function string wf_test3 ()
end prototypes

public function string wf_test (ref double a, ref long b, ref string c, ref n_xmldoc doc);a = 100.452
b = 123
c = "test"

doc = Create n_xmldoc
doc.Parse("<xml>test</xml>")

return "ok"
end function

public subroutine wf_test2 ();messagebox("","wf_test2")
end subroutine

public function string wf_test3 ();return "ok"
end function

on w_test_regex.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_7=create cb_7
this.Control[]={this.cb_2,&
this.cb_1,&
this.cb_7}
end on

on w_test_regex.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_7)
end on

type cb_2 from commandbutton within w_test_regex
integer x = 1330
integer y = 236
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Find"
end type

event clicked;string ls_string,ls_pattern

ls_string = "[xxxABCDEFG]"
ls_pattern = "[A-Z]{4}"

messagebox("",RegExpFind(ls_string,ls_pattern))
end event

type cb_1 from commandbutton within w_test_regex
integer x = 777
integer y = 240
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Replace"
end type

event clicked;string ls_string,ls_pattern

ls_string = "[ABCDEFG]"
ls_pattern = "[A-Z]{4}"

messagebox("",RegExpReplace(ls_string,ls_pattern,"Replaced"))
end event

type cb_7 from commandbutton within w_test_regex
integer x = 215
integer y = 236
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Match"
end type

event clicked;string ls_string,ls_pattern

ls_string = "ABCD"
ls_pattern = "[A-Z]{4}"

messagebox("",RegExpMatch(ls_string,ls_pattern))
end event

