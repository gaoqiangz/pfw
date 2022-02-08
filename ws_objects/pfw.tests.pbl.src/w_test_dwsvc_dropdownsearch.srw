$PBExportHeader$w_test_dwsvc_dropdownsearch.srw
forward
global type w_test_dwsvc_dropdownsearch from window
end type
type dw_1 from se_cst_dw within w_test_dwsvc_dropdownsearch
end type
end forward

global type w_test_dwsvc_dropdownsearch from window
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
global w_test_dwsvc_dropdownsearch w_test_dwsvc_dropdownsearch

on w_test_dwsvc_dropdownsearch.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_test_dwsvc_dropdownsearch.destroy
destroy(this.dw_1)
end on

event open;/*
	下拉检索服务
		支持DDDW/DDLB，按输入内容将匹配的数据过滤出来
		对于DDDW默认规则是：【用户输入的数据】+【用户输入的数据】的拼音首字母 过滤DDDW的【display】列
*/

//开启下拉检索服务
dw_1.DropDownSearch.of_SetEnabled(true)
//开启所有DDDW过滤规则
dw_1.DropDownSearch.of_SetFilterType(dw_1.DropDownSearch.FILTER_ALL)

dw_1.Modify("s1.ddlb.allowedit=yes")
dw_1.Modify("s2.dddw.allowedit=yes")
end event

type dw_1 from se_cst_dw within w_test_dwsvc_dropdownsearch
integer x = 37
integer y = 41
integer width = 2024
integer height = 871
integer taborder = 10
string dataobject = "dw_svc_sample"
boolean vscrollbar = true
end type

event onddsgetfilter;call super::onddsgetfilter;//下拉检索服务请求过滤条件
//示例设置第2行的S2 DDDW为自定义过滤条件为必须输入与下拉【data】完全相同的值
if row = 2 and dwo.name = "s2" then
	filter = "dat = '" + data + "'"
end if
end event

