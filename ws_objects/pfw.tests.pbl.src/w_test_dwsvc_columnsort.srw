$PBExportHeader$w_test_dwsvc_columnsort.srw
forward
global type w_test_dwsvc_columnsort from window
end type
type dw_1 from se_cst_dw within w_test_dwsvc_columnsort
end type
end forward

global type w_test_dwsvc_columnsort from window
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
dw_1 dw_1
end type
global w_test_dwsvc_columnsort w_test_dwsvc_columnsort

on w_test_dwsvc_columnsort.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_test_dwsvc_columnsort.destroy
destroy(this.dw_1)
end on

event open;/*
	列排序服务
		支持Ctrl+鼠标左键点击列标题多列排序，再点击恢复原来排序规则
	排序状态:
		升序，降序，不排序（默认规则）
*/
//开启排序服务
dw_1.ColumnSort.of_SetEnabled(true)
end event

type dw_1 from se_cst_dw within w_test_dwsvc_columnsort
integer x = 37
integer y = 41
integer width = 2024
integer height = 871
integer taborder = 10
string dataobject = "dw_svc_sample"
boolean vscrollbar = true
end type

