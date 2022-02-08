$PBExportHeader$w_test_svg.srw
forward
global type w_test_svg from window
end type
type cb_2 from s_cst_button within w_test_svg
end type
type cb_1 from s_cst_button within w_test_svg
end type
end forward

global type w_test_svg from window
integer width = 2042
integer height = 1352
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
end type
global w_test_svg w_test_svg

on w_test_svg.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.cb_1}
end on

on w_test_svg.destroy
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;/*
	附加参数为SVG支持的CSS参数
*/
cb_1.theme.of_SetIconPosition(Enums.TOP)
cb_1.theme.of_SetIconSize(100,100)
//fill：path填充色
//stroke：path边框色
//storke-width：path边框大小（支持dip）
cb_1.of_SetImage("pbr://res/images.zip[save.svg]{fill:blue;stroke:red;stroke-width:10dip}")

cb_2.theme.of_SetIconPosition(Enums.BOTTOM)
cb_2.theme.of_SetIconSize(64,64)
cb_2.of_SetImage("pbr://res/images.zip[save.svg]{fill:#ff0000}")
end event

type cb_2 from s_cst_button within w_test_svg
integer x = 360
integer y = 640
integer width = 1030
integer height = 472
integer taborder = 20
end type

type cb_1 from s_cst_button within w_test_svg
integer x = 354
integer y = 85
integer width = 1030
integer height = 472
integer taborder = 10
end type

