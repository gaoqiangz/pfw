$PBExportHeader$w_test_compiler.srw
forward
global type w_test_compiler from window
end type
type st_2 from statictext within w_test_compiler
end type
type cb_7 from commandbutton within w_test_compiler
end type
type st_1 from statictext within w_test_compiler
end type
type cb_6 from commandbutton within w_test_compiler
end type
type cb_5 from commandbutton within w_test_compiler
end type
type cb_4 from commandbutton within w_test_compiler
end type
type sle_name from singlelineedit within w_test_compiler
end type
type cb_3 from commandbutton within w_test_compiler
end type
type cb_2 from commandbutton within w_test_compiler
end type
type cb_1 from commandbutton within w_test_compiler
end type
type mle_scripting from multilineedit within w_test_compiler
end type
end forward

global type w_test_compiler from window
integer width = 3776
integer height = 1968
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
cb_7 cb_7
st_1 st_1
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
sle_name sle_name
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
mle_scripting mle_scripting
end type
global w_test_compiler w_test_compiler

type variables
n_compiler _compiler
end variables

on w_test_compiler.create
this.st_2=create st_2
this.cb_7=create cb_7
this.st_1=create st_1
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.sle_name=create sle_name
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.mle_scripting=create mle_scripting
this.Control[]={this.st_2,&
this.cb_7,&
this.st_1,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.sle_name,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.mle_scripting}
end on

on w_test_compiler.destroy
destroy(this.st_2)
destroy(this.cb_7)
destroy(this.st_1)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.sle_name)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.mle_scripting)
end on

event open;_compiler = Create n_compiler
end event

event close;Destroy _compiler
end event

type st_2 from statictext within w_test_compiler
integer x = 1093
integer y = 480
integer width = 649
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Object Class Name:"
boolean focusrectangle = false
end type

type cb_7 from commandbutton within w_test_compiler
integer x = 110
integer y = 516
integer width = 805
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "EvaluateWithMultiParm"
end type

event clicked;string ls_result

try
	ls_result = String(Evaluate(mle_scripting.Text,+&
							/*自定义参数列表*/&
							"long lparam,long wparam,string sparam,commandbutton btn" ,+&
							/*以下参数必须与上面定义的参数列表的顺序与类型一致(兼容)*/&
							123,456,"abcd",this))
	MessageBox("Result",ls_result)
catch(Throwable ex)
	MessageBox("EXCEPTION",ex.Text)
end try
end event

type st_1 from statictext within w_test_compiler
integer x = 96
integer y = 8
integer width = 955
integer height = 140
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 134217857
long backcolor = 67108864
string text = "需要编译后才能测试"
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_test_compiler
integer x = 110
integer y = 332
integer width = 649
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "EvaluateWithParm"
end type

event clicked;string ls_result

try
	//默认参数列表为any param
	ls_result = String(Evaluate(mle_scripting.Text,this))
	MessageBox("Result",ls_result)
catch(Throwable ex)
	MessageBox("EXCEPTION",ex.Text)
end try
end event

type cb_5 from commandbutton within w_test_compiler
integer x = 2258
integer y = 188
integer width = 489
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Import End"
end type

event clicked;try
	_compiler.ImportEnd()
catch(Throwable ex)
	MessageBox("EXCEPTION",ex.Text)
end try
end event

type cb_4 from commandbutton within w_test_compiler
integer x = 1061
integer y = 188
integer width = 489
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Import Begin"
end type

event clicked;try
	_compiler.ImportBegin()
catch(Throwable ex)
	MessageBox("EXCEPTION",ex.Text)
end try
end event

type sle_name from singlelineedit within w_test_compiler
integer x = 1746
integer y = 452
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "n_test"
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_test_compiler
integer x = 2245
integer y = 452
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Test Object"
end type

event clicked;string ls_result
nonvisualobject nvo

try
	nvo = Create Using sle_name.Text
	ls_result = String(nvo.Dynamic f_Test())
	MessageBox("",ls_result)
	Destroy nvo
catch(Throwable ex)
	MessageBox("EXCEPTION",ex.Text)
end try



end event

type cb_2 from commandbutton within w_test_compiler
integer x = 1646
integer y = 188
integer width = 521
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Import Object"
end type

event clicked;/*
	导入的对象源码就是PB右键对象的Edit Source的语法
	示例n_test:
	------------------
	forward
	global type n_test from nonvisualobject
	end type
	end forward
	
	global type n_test from nonvisualobject
	end type
	global n_test n_test
	
	forward prototypes
	public function string f_test ()
	end prototypes
	
	public function string f_test ();return "pfwCompiler测试"
	end function
	
	on n_test.create
	call super::create
	TriggerEvent( this, "constructor" )
	end on
	
	on n_test.destroy
	TriggerEvent( this, "destructor" )
	call super::destroy
	end on
	------------------
	拷贝分割线中间的源码测试吧!
*/
string ls_result

try
	_compiler.Import(sle_name.Text,mle_scripting.Text,Enums.CMP_TYPE_USEROBJECT)
catch(Throwable ex)
	MessageBox("EXCEPTION",ex.Text)
end try
end event

type cb_1 from commandbutton within w_test_compiler
integer x = 110
integer y = 168
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Evaluate"
end type

event clicked;string ls_result

try
	ls_result = String(Evaluate(mle_scripting.Text))
	MessageBox("Result",ls_result)
catch(Throwable ex)
	MessageBox("EXCEPTION",ex.Text)
end try
end event

type mle_scripting from multilineedit within w_test_compiler
integer x = 96
integer y = 720
integer width = 3538
integer height = 1108
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "return ~"pfwCompiler测试~""
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

