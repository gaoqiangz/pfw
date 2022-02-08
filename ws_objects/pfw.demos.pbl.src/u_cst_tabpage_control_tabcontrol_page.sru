$PBExportHeader$u_cst_tabpage_control_tabcontrol_page.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_control_tabcontrol_page from ue_cst_tabpage
end type
type st_1 from statictext within u_cst_tabpage_control_tabcontrol_page
end type
end forward

global type u_cst_tabpage_control_tabcontrol_page from ue_cst_tabpage
integer width = 2862
integer height = 920
st_1 st_1
end type
global u_cst_tabpage_control_tabcontrol_page u_cst_tabpage_control_tabcontrol_page

on u_cst_tabpage_control_tabcontrol_page.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on u_cst_tabpage_control_tabcontrol_page.destroy
call super::destroy
destroy(this.st_1)
end on

type st_1 from statictext within u_cst_tabpage_control_tabcontrol_page
integer x = 59
integer y = 52
integer width = 425
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "什么都没有."
boolean focusrectangle = false
end type

