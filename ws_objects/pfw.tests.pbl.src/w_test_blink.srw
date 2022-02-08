$PBExportHeader$w_test_blink.srw
forward
global type w_test_blink from window
end type
type cb_15 from commandbutton within w_test_blink
end type
type cb_14 from commandbutton within w_test_blink
end type
type cb_5 from commandbutton within w_test_blink
end type
type cb_13 from commandbutton within w_test_blink
end type
type cb_12 from commandbutton within w_test_blink
end type
type cb_11 from commandbutton within w_test_blink
end type
type cb_10 from commandbutton within w_test_blink
end type
type cb_9 from commandbutton within w_test_blink
end type
type cb_8 from commandbutton within w_test_blink
end type
type cb_7 from commandbutton within w_test_blink
end type
type cb_6 from commandbutton within w_test_blink
end type
type cb_4 from commandbutton within w_test_blink
end type
type cb_3 from commandbutton within w_test_blink
end type
type cb_2 from commandbutton within w_test_blink
end type
type cb_1 from commandbutton within w_test_blink
end type
type uo_blink from u_cst_blink within w_test_blink
end type
type fn_eventhandler from n_blinkfunctor within w_test_blink
end type
type fn_add from n_blinkfunctor within w_test_blink
end type
end forward

global type w_test_blink from window
integer width = 4837
integer height = 2812
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ontest ( string arg )
cb_15 cb_15
cb_14 cb_14
cb_5 cb_5
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
uo_blink uo_blink
fn_eventhandler fn_eventhandler
fn_add fn_add
end type
global w_test_blink w_test_blink

type variables
string #isVar = "pb instance var"
end variables

forward prototypes
public function integer wf_test (alignment align)
public function integer wf_opentest ()
public subroutine wf_close ()
end prototypes

event ontest(string arg);messagebox("ontest",arg)
end event

public function integer wf_test (alignment align);messagebox("",align = right!)
return 0
end function

public function integer wf_opentest ();//open(w_test)
w_test_blink b
open(b)
return 0
end function

public subroutine wf_close ();post close(this)
end subroutine

on w_test_blink.create
this.cb_15=create cb_15
this.cb_14=create cb_14
this.cb_5=create cb_5
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.uo_blink=create uo_blink
this.fn_eventhandler=create fn_eventhandler
this.fn_add=create fn_add
this.Control[]={this.cb_15,&
this.cb_14,&
this.cb_5,&
this.cb_13,&
this.cb_12,&
this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.uo_blink}
end on

on w_test_blink.destroy
destroy(this.cb_15)
destroy(this.cb_14)
destroy(this.cb_5)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.uo_blink)
destroy(this.fn_eventhandler)
destroy(this.fn_add)
end on

event resize;uo_blink.Move(4,4)
uo_blink.Resize(newWidth - 8,uo_blink.height)
end event

type cb_15 from commandbutton within w_test_blink
integer x = 4201
integer y = 2444
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;n_blinkvalue val

val = uo_blink.CreateValue()
val.AddItem("stdsf")
val.RemoveAll()
messagebox("",val.Serialize())
end event

type cb_14 from commandbutton within w_test_blink
integer x = 3538
integer y = 2548
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "eval2"
end type

event clicked;uo_blink.Evaluate("'test'")
end event

type cb_5 from commandbutton within w_test_blink
integer x = 3035
integer y = 2544
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "eval"
end type

event clicked;try
uo_blink.Evaluate("f.test()")
catch(throwable ex)
messagebox("",ex.text)
end try
end event

type cb_13 from commandbutton within w_test_blink
integer x = 2295
integer y = 2544
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Popup"
end type

event clicked;n_blink blink

blink = Create n_blink
blink.CreateWindow(Enums.BLINK_WS_POPUP + Enums.BLINK_WS_TOOL /*+ Enums.BLINK_WS_ALPHA*/ /* + Enums.BLINK_WS_TITLEBAR + Enums.BLINK_WS_CONTROLS + Enums.BLINK_WS_RESIZEABLE*/,800,800,parent)
blink.LoadFile("tests\blink\echarts.html")
blink.Center()
blink.Popup()

Destroy blink
end event

type cb_12 from commandbutton within w_test_blink
integer x = 1696
integer y = 2544
integer width = 498
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Event listener"
end type

event clicked;uo_blink.GetElementById("cbx").InvokeMethod("addEventListener","change",fn_eventhandler)
end event

type cb_11 from commandbutton within w_test_blink
integer x = 1184
integer y = 2540
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Functor"
end type

event clicked;messagebox("",String(uo_blink.InvokeFunction("test_pb_function",fn_add)))
end event

type cb_10 from commandbutton within w_test_blink
integer x = 677
integer y = 2540
integer width = 457
integer height = 136
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Invoke"
end type

event clicked;n_blinkvalue val

val = uo_blink.GetWindowExpando()
//val = val.GetItem("global_function")
//val.Invoke("a",32,DateTime(ToDay(),Now()))

//uo_blink.InvokeFunction("test_pb_object",parent)

uo_blink.InvokeFunction("open_test")
end event

type cb_9 from commandbutton within w_test_blink
integer x = 101
integer y = 2544
integer width = 503
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "DOM"
end type

event clicked;n_blinkelement ele
n_blinkelement eles[]

ele = uo_blink.GetElementById("a")
ele.SetText("<test哈哈哈>")
ele.SetStyle("background-color","blue")
ele.SetStyle("border-color","green")
ele.SetStyle("border-style","solid")

uo_blink.GetElementsByTagName("body",ref eles)
eles[1].AddChild(uo_blink.CreateElement("div","hahah"))
eles[1].InsertChildBefore(uo_blink.GetElementById("c"),"div","hahah")

ele = uo_blink.GetElementById("c")
uo_blink.GetElementById("c").Swap(uo_blink.GetElementById("b"))
messagebox("outerHTML by Evaluate",String(ele.Evaluate("var me = this;function _test(){return me.outerHTML};return _test(this);")))
messagebox("outerHTML",ele.GetExpando().GetItemString("outerHTML"))

int nIndex,nCount
string sHtmls

ele = uo_blink.GetRootElement()
nCount = ele.FindChildren("div",ref eles)
for nIndex = 1 to nCount
	sHtmls += eles[nIndex].GetHtml() + "~n"
next

messagebox("htmls",sHtmls)
end event

type cb_8 from commandbutton within w_test_blink
integer x = 3195
integer y = 2336
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "GetCookie"
end type

event clicked;MessageBox("",uo_blink.GetCookie())
end event

type cb_7 from commandbutton within w_test_blink
integer x = 2725
integer y = 2340
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "GetUrl"
end type

event clicked;MessageBox("",uo_blink.Geturl())
end event

type cb_6 from commandbutton within w_test_blink
integer x = 2066
integer y = 2348
integer width = 526
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Zoom"
end type

event clicked;uo_blink.SetZoom(150)
end event

type cb_4 from commandbutton within w_test_blink
integer x = 1577
integer y = 2348
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "GetSize"
end type

event clicked;MessageBox("",Sprintf("width:{1} height:{2}",uo_blink.GetContentWidth(),uo_blink.GetContentHeight()))
end event

type cb_3 from commandbutton within w_test_blink
integer x = 1093
integer y = 2352
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "GetTitle"
end type

event clicked;MessageBox("",uo_blink.GetContentTitle())
end event

type cb_2 from commandbutton within w_test_blink
integer x = 603
integer y = 2356
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Reload"
end type

event clicked;uo_blink.Reload()
end event

type cb_1 from commandbutton within w_test_blink
integer x = 105
integer y = 2356
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Load"
end type

event clicked;//uo_blink.LoadUrl("http://echarts.baidu.com/examples/")
//uo_blink.LoadFile("tests\blink\layui.htm")
//uo_blink.LoadUrl("http://news.baidu.com")
//uo_blink.LoadFile("tests\blink\layui.zip[layui.htm]")
uo_blink.LoadFile("tests\blink\test_jws.htm")
end event

type uo_blink from u_cst_blink within w_test_blink
integer x = 55
integer y = 64
integer width = 4585
integer height = 2232
integer taborder = 10
end type

on uo_blink.destroy
call u_cst_blink::destroy
end on

event ontitlereceived;call super::ontitlereceived;title = newTitle
return 0
end event

event oncreateview;call super::oncreateview;long nStyle
w_blink w
Open(w)
return w.wf_GetHandle()
end event

event constructor;call super::constructor;SetDebugOutput(true)
end event

type fn_eventhandler from n_blinkfunctor within w_test_blink descriptor "pb_nvo" = "true" 
end type

on fn_eventhandler.create
call super::create
end on

on fn_eventhandler.destroy
call super::destroy
end on

event oninvoke;call super::oninvoke;n_blinkvalue valArg

valArg = args[1]

messagebox("",String(valArg.GetItem("target").GetValueElement().IsChecked()))
return true
end event

type fn_add from n_blinkfunctor within w_test_blink descriptor "pb_nvo" = "true" 
end type

on fn_add.create
call super::create
end on

on fn_add.destroy
call super::destroy
end on

event oninvoke;call super::oninvoke;int i
i = 1/ -0
return Long(args[1]) + Long(args[2])
end event

