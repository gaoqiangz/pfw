$PBExportHeader$w_test_statictext.srw
forward
global type w_test_statictext from window
end type
type st_6 from statictext within w_test_statictext
end type
type st_5 from statictext within w_test_statictext
end type
type st_4 from statictext within w_test_statictext
end type
type st_3 from s_cst_statictext within w_test_statictext
end type
type st_1 from statictext within w_test_statictext
end type
type st_2 from s_cst_statictext within w_test_statictext
end type
end forward

global type w_test_statictext from window
integer width = 3899
integer height = 992
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_1 st_1
st_2 st_2
end type
global w_test_statictext w_test_statictext

on w_test_statictext.create
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_1=create st_1
this.st_2=create st_2
this.Control[]={this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_1,&
this.st_2}
end on

on w_test_statictext.destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.st_2)
end on

event open;//垂直居中
st_2.theme.of_SetTextVAlign(VCenter!)
//水平居中
st_3.theme.of_SetTextAlign(Center!)
//垂直居中
st_3.theme.of_SetTextVAlign(VCenter!)
//背景填充风格
st_3.theme.of_SetBkgndStyle(Enums.XP)
//背景色
st_3.theme.of_SetBkgndColorStyle(ARGB(255,22,157,210))
end event

type st_6 from statictext within w_test_statictext
integer x = 2615
integer y = 64
integer width = 873
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "开启#Theme属性"
boolean focusrectangle = false
end type

type st_5 from statictext within w_test_statictext
integer x = 1362
integer y = 64
integer width = 873
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "未开启#Theme属性"
boolean focusrectangle = false
end type

type st_4 from statictext within w_test_statictext
integer x = 46
integer y = 64
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
string text = "原生"
boolean focusrectangle = false
end type

type st_3 from s_cst_statictext within w_test_statictext
integer x = 2629
integer y = 164
integer width = 1198
integer height = 388
alignment alignment = center!
boolean #theme = true
end type

type st_1 from statictext within w_test_statictext
integer x = 50
integer y = 156
integer width = 1198
integer height = 388
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from s_cst_statictext within w_test_statictext
integer x = 1381
integer y = 164
integer width = 1198
integer height = 388
alignment alignment = center!
end type

