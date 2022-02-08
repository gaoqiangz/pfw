$PBExportHeader$w_test_splitcontainer_template.srw
forward
global type w_test_splitcontainer_template from window
end type
type st_15 from s_cst_statictext within w_test_splitcontainer_template
end type
type st_14 from s_cst_statictext within w_test_splitcontainer_template
end type
type st_13 from s_cst_statictext within w_test_splitcontainer_template
end type
type st_12 from s_cst_statictext within w_test_splitcontainer_template
end type
type st_11 from s_cst_statictext within w_test_splitcontainer_template
end type
type st_10 from s_cst_statictext within w_test_splitcontainer_template
end type
type st_9 from s_cst_statictext within w_test_splitcontainer_template
end type
type st_8 from s_cst_statictext within w_test_splitcontainer_template
end type
type st_7 from s_cst_statictext within w_test_splitcontainer_template
end type
type st_6 from s_cst_statictext within w_test_splitcontainer_template
end type
type st_5 from s_cst_statictext within w_test_splitcontainer_template
end type
type st_4 from s_cst_statictext within w_test_splitcontainer_template
end type
type st_3 from s_cst_statictext within w_test_splitcontainer_template
end type
type st_2 from s_cst_statictext within w_test_splitcontainer_template
end type
type st_1 from s_cst_statictext within w_test_splitcontainer_template
end type
type uo_splitcontainer from u_cst_splitcontainer within w_test_splitcontainer_template
end type
end forward

global type w_test_splitcontainer_template from window
integer width = 4968
integer height = 2549
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_15 st_15
st_14 st_14
st_13 st_13
st_12 st_12
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
uo_splitcontainer uo_splitcontainer
end type
global w_test_splitcontainer_template w_test_splitcontainer_template

type variables
Private:
Any _templateTbl[]
end variables

on w_test_splitcontainer_template.create
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.uo_splitcontainer=create uo_splitcontainer
this.Control[]={this.st_15,&
this.st_14,&
this.st_13,&
this.st_12,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.uo_splitcontainer}
end on

on w_test_splitcontainer_template.destroy
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.uo_splitcontainer)
end on

event resize;uo_splitcontainer.Move(4,4)
uo_splitcontainer.Resize(newWidth - 8,newHeight - 8)
end event

event open;string sTemplate
int nIndex,nCount
s_cst_statictext st

nCount = UpperBound(Control)
for nIndex = 1 to nCount
	if Control[nIndex].TypeOf() = StaticText! then
		st = Control[nIndex]
		st.theme.of_SetTextAlign(Center!)
		st.theme.of_SetTextVAlign(VCenter!)
	end if
next

//sTemplate = 	"A B C~n" + &
//					"D E F~n" + &
//					"G H I"

//sTemplate = 	"A A B~n" + &
//					"C D D~n" + &
//					"C E F~n" + &
//					"H I M"
			
//sTemplate = 	"A B C D~n"+&
//					"E F G H~n"+&
//					"I J K L"
//

//sTemplate = 	"A A C D E~n"+&
//					"B K G H F~n"+&
//					"I M M J J"

//无法拆分这样的模板!
//sTemplate = 	"E B B B~n"+&
//					"E G F D~n"+&
//					"E J F D~n"+&
//					"A A A D"

//sTemplate = 	"A B C E~n"+&
//					"M F F E~n"+&
//					"D J J E~n"+&
//					"D K K E"
//
//sTemplate = 	"A B C D~n"+&
//					"E F F G~n"+&
//					"H F F I~n"+&
//					"J K M L"

//sTemplate = 	"A B C D~n"+&
//					"E F F F~n"+&
//					"H F F F~n"+&
//					"J F F F"
//sTemplate = 	"A A B B~n"+&
//					"C D D E~n"+&
//					"C D D E~n"+&
//					"C G H I"

sTemplate = 	"A A B B~n"+&
					"- - - -~n"+&
					"C D E F~n"+&
					"C G G H~n"

uo_splitcontainer.of_TemplateBegin(sTemplate)
uo_splitcontainer.of_TemplateBind(st_1,"A")
uo_splitcontainer.of_TemplateBind(st_2,"B")
uo_splitcontainer.of_TemplateBind(st_3,"C")
uo_splitcontainer.of_TemplateBind(st_4,"D")
uo_splitcontainer.of_TemplateBind(st_5,"E")
uo_splitcontainer.of_TemplateBind(st_6,"F")
uo_splitcontainer.of_TemplateBind(st_7,"G")
uo_splitcontainer.of_TemplateBind(st_8,"H")
uo_splitcontainer.of_TemplateBind(st_9,"I")
uo_splitcontainer.of_TemplateBind(st_10,"J")
uo_splitcontainer.of_TemplateBind(st_11,"K")
uo_splitcontainer.of_TemplateBind(st_12,"L")
uo_splitcontainer.of_TemplateBind(st_13,"M")
uo_splitcontainer.of_TemplateBind(st_14,"N")
uo_splitcontainer.of_TemplateBind(st_15,"O")
uo_splitcontainer.of_TemplateEnd()
end event

type st_15 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = -1798
integer y = -600
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "O"
alignment alignment = center!
boolean #theme = true
end type

type st_14 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = -1807
integer y = -728
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "N"
alignment alignment = center!
boolean #theme = true
end type

type st_13 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = -1807
integer y = -728
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "M"
alignment alignment = center!
boolean #theme = true
end type

type st_12 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = -1807
integer y = -728
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "L"
alignment alignment = center!
boolean #theme = true
end type

type st_11 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = -1807
integer y = -728
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "K"
alignment alignment = center!
boolean #theme = true
end type

type st_10 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = -1807
integer y = -728
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "J"
alignment alignment = center!
boolean #theme = true
end type

type st_9 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = 3730
integer y = 541
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "I"
alignment alignment = center!
boolean #theme = true
end type

type st_8 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = 2801
integer y = 813
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "H"
alignment alignment = center!
boolean #theme = true
end type

type st_7 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = 3566
integer y = 1477
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "G"
alignment alignment = center!
boolean #theme = true
end type

type st_6 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = 2481
integer y = 1381
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "F"
alignment alignment = center!
boolean #theme = true
end type

type st_5 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = 1487
integer y = 1496
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "E"
alignment alignment = center!
boolean #theme = true
end type

type st_4 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = 503
integer y = 1496
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "D"
alignment alignment = center!
boolean #theme = true
end type

type st_3 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = 1929
integer y = 741
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "C"
alignment alignment = center!
boolean #theme = true
end type

type st_2 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = 1186
integer y = 640
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "B"
alignment alignment = center!
boolean #theme = true
end type

type st_1 from s_cst_statictext within w_test_splitcontainer_template
boolean visible = false
integer x = 311
integer y = 637
integer width = 802
integer height = 469
integer textsize = -20
long textcolor = 255
string text = "A"
alignment alignment = center!
boolean #theme = true
end type

type uo_splitcontainer from u_cst_splitcontainer within w_test_splitcontainer_template
integer x = 91
integer y = 101
integer width = 4623
integer height = 2077
integer taborder = 20
end type

on uo_splitcontainer.destroy
call u_cst_splitcontainer::destroy
end on

