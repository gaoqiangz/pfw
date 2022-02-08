$PBExportHeader$w_test_invoker.srw
forward
global type w_test_invoker from window
end type
type cb_6 from commandbutton within w_test_invoker
end type
type cb_4 from commandbutton within w_test_invoker
end type
type cb_3 from commandbutton within w_test_invoker
end type
end forward

shared variables
string iss_test = "hahaha"
end variables

global type w_test_invoker from window
integer width = 2153
integer height = 620
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_6 cb_6
cb_4 cb_4
cb_3 cb_3
end type
global w_test_invoker w_test_invoker

type variables
string is_nvl
long il_nvl
string is_test
long il_test
datetime idtt_nvl
decimal idec_nvl
double idb_nvl
blob iblb_nvl
any iany_nvl
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

on w_test_invoker.create
this.cb_6=create cb_6
this.cb_4=create cb_4
this.cb_3=create cb_3
this.Control[]={this.cb_6,&
this.cb_4,&
this.cb_3}
end on

on w_test_invoker.destroy
destroy(this.cb_6)
destroy(this.cb_4)
destroy(this.cb_3)
end on

event open;SetNull(is_nvl)
SetNull(il_nvl)
SetNull(idtt_nvl)
SetNull(idec_nvl)
SetNull(iblb_nvl)
SetNull(iany_nvl)
SetNull(idb_nvl)
is_test = "test var"
il_test = 123456
end event

type cb_6 from commandbutton within w_test_invoker
integer x = 974
integer y = 164
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Function"
end type

event clicked;n_scriptinvoker invoker

invoker = Create n_scriptinvoker

n_xmldoc doc
double a
long b
string c

//invoker.Init(parent,"wf_test","ref double,ref long,ref string,ref n_xmldoc")
//messagebox("",String(invoker.Invoke()))
//a = invoker.GetArg(1)
//b = invoker.GetArg(2)
//c = invoker.GetArg(3)
//doc = invoker.GetArg(4)
//invoker.Release()
//
//messagebox("","a:" + String(a) + "~nb:"+string(b)+"~nc:"+c + "~ndoc:"+doc.Serialize())

//invoker.Init("handle","LCpowerobject.")
//invoker.SetArg(1,this)
//messagebox("",String(invoker.Invoke()))
//invoker.Release()

invoker.Init(parent,"wf_test2","")
messagebox("",String(invoker.Invoke()))
invoker.Release()

Destroy invoker
end event

type cb_4 from commandbutton within w_test_invoker
integer x = 151
integer y = 160
integer width = 763
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "InvokeGlobalFunction"
end type

event clicked;MessageBox("",String(InvokeGlobalFunction("handle","powerobject",this)))
end event

type cb_3 from commandbutton within w_test_invoker
integer x = 1495
integer y = 172
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Var"
end type

event clicked;n_objectinvoker invoker

invoker = Create n_objectinvoker
invoker.Attach(parent)

messagebox("Title",string(invoker.GetVar("Title")))

invoker.SetVar("title","pfwInvoker")

messagebox("New Title",string(invoker.GetVar("Title")))

Destroy invoker
end event

