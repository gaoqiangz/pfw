$PBExportHeader$w_test_dwsvc_contextmenu.srw
forward
global type w_test_dwsvc_contextmenu from window
end type
type st_1 from statictext within w_test_dwsvc_contextmenu
end type
type dw_1 from se_cst_dw within w_test_dwsvc_contextmenu
end type
end forward

global type w_test_dwsvc_contextmenu from window
integer width = 2152
integer height = 1077
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
dw_1 dw_1
end type
global w_test_dwsvc_contextmenu w_test_dwsvc_contextmenu

type variables

end variables

on w_test_dwsvc_contextmenu.create
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.dw_1}
end on

on w_test_dwsvc_contextmenu.destroy
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;/*
	右键菜单服务
		支持内置右键的一些功能，同时可以添加自定义菜单项
	内置功能：
		勾选整列/清除勾选整列
		复制整列值
		拷贝粘帖板数据覆盖到整列
		复制单元格值
*/
//开启鼠标右键菜单服务
dw_1.ContextMenu.of_SetEnabled(true)
end event

type st_1 from statictext within w_test_dwsvc_contextmenu
integer x = 30
integer y = 923
integer width = 1039
integer height = 77
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "操作提示：右键列标题和单元格"
boolean focusrectangle = false
end type

type dw_1 from se_cst_dw within w_test_dwsvc_contextmenu
integer x = 37
integer y = 40
integer width = 2024
integer height = 872
integer taborder = 10
string dataobject = "dw_svc_sample_contextmenu"
boolean vscrollbar = true
end type

event oninitcontextmenu;call super::oninitcontextmenu;//右键菜单服务初始化请求
//返回1阻止
ContextMenu.theme.of_SetBkgndColorStyle(theme.BLUE)
ContextMenu.of_AddSeparator()
ContextMenu.of_AddMenu("自定义1","",true,100)
ContextMenu.of_AddMenu("自定义2","",true,101)
ContextMenu.of_AddMenu("自定义3","",false,102)
return 0
end event

event oncontextmenu;call super::oncontextmenu;//右键菜单服务-菜单项点击请求
//返回1阻止默认行为（如果该MID为内置的菜单项）
if mid < 10000 then
	MessageBox("OnContextMenu",Sprintf("text:{1}~nmid:{2}~nrow:{3}~ndwo:{4}",ContextMenu.of_GetText(mid,false),mid,row,dwo.name))
end if
return 0
end event

