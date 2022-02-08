$PBExportHeader$w_test_dwsvc_rowselect.srw
forward
global type w_test_dwsvc_rowselect from window
end type
type dw_1 from se_cst_dw within w_test_dwsvc_rowselect
end type
end forward

global type w_test_dwsvc_rowselect from window
integer width = 2153
integer height = 1076
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
end type
global w_test_dwsvc_rowselect w_test_dwsvc_rowselect

on w_test_dwsvc_rowselect.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_test_dwsvc_rowselect.destroy
destroy(this.dw_1)
end on

event open;/*
	行选服务
		支持单行/多行选择功能(Ctrl/Shift+鼠标左键)
		*支持组合
*/
//开启行选服务
dw_1.RowSelect.of_SetEnabled(true)
//开启多行选择功能
dw_1.RowSelect.of_SetStyle(dw_1.RowSelect.RS_SINGLE + dw_1.RowSelect.RS_MULTIPLE)
end event

type dw_1 from se_cst_dw within w_test_dwsvc_rowselect
integer x = 37
integer y = 40
integer width = 2025
integer height = 872
integer taborder = 10
string dataobject = "dw_svc_sample"
boolean vscrollbar = true
end type

