$PBExportHeader$w_demo_selector.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type w_demo_selector from se_cst_window
end type
type cb_4 from se_cst_button within w_demo_selector
end type
type st_3 from statictext within w_demo_selector
end type
type cb_6 from se_cst_button within w_demo_selector
end type
type st_2 from statictext within w_demo_selector
end type
type st_1 from statictext within w_demo_selector
end type
type cb_5 from se_cst_button within w_demo_selector
end type
type cb_3 from se_cst_button within w_demo_selector
end type
type cb_2 from se_cst_button within w_demo_selector
end type
type cb_1 from se_cst_button within w_demo_selector
end type
end forward

global type w_demo_selector from se_cst_window
integer width = 1559
integer height = 1284
string title = "DEMO Selector"
boolean maxbox = false
boolean resizable = false
cb_4 cb_4
st_3 st_3
cb_6 cb_6
st_2 st_2
st_1 st_1
cb_5 cb_5
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_demo_selector w_demo_selector

on w_demo_selector.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.st_3=create st_3
this.cb_6=create cb_6
this.st_2=create st_2
this.st_1=create st_1
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.cb_6
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cb_5
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_1
end on

on w_demo_selector.destroy
call super::destroy
destroy(this.cb_4)
destroy(this.st_3)
destroy(this.cb_6)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cb_4 from se_cst_button within w_demo_selector
integer x = 722
integer y = 792
integer width = 750
integer height = 144
integer taborder = 30
string text = "Login Window(Sciter)"
end type

event clicked;call super::clicked;Open(w_demo_sciter_login)
end event

type st_3 from statictext within w_demo_selector
integer x = 101
integer y = 688
integer width = 457
integer height = 72
integer textsize = -12
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "其它："
boolean focusrectangle = false
end type

type cb_6 from se_cst_button within w_demo_selector
integer x = 608
integer y = 444
integer width = 640
integer height = 144
integer taborder = 30
string text = "MDI + RibbonBar"
end type

event clicked;call super::clicked;Open(w_demo_mdi_ribbonbar)
end event

type st_2 from statictext within w_demo_selector
integer x = 82
integer y = 332
integer width = 457
integer height = 72
integer textsize = -12
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "MDI窗口："
boolean focusrectangle = false
end type

type st_1 from statictext within w_demo_selector
integer x = 69
integer y = 36
integer width = 526
integer height = 72
integer textsize = -12
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "主DEMO窗口："
boolean focusrectangle = false
end type

type cb_5 from se_cst_button within w_demo_selector
integer x = 110
integer y = 984
integer width = 407
integer height = 144
integer taborder = 20
string text = "Special"
end type

event clicked;call super::clicked;Open(w_demo_special)
end event

type cb_3 from se_cst_button within w_demo_selector
integer x = 110
integer y = 792
integer width = 558
integer height = 144
integer taborder = 20
string text = "Login Window"
end type

event clicked;call super::clicked;Open(w_demo_login)
end event

type cb_2 from se_cst_button within w_demo_selector
integer x = 146
integer y = 444
integer width = 407
integer height = 144
integer taborder = 20
string text = "MDI"
end type

event clicked;call super::clicked;Open(w_demo_mdi)
end event

type cb_1 from se_cst_button within w_demo_selector
integer x = 137
integer y = 132
integer width = 407
integer height = 144
integer taborder = 10
string text = "Main"
end type

event clicked;call super::clicked;Open(w_demo)
end event

