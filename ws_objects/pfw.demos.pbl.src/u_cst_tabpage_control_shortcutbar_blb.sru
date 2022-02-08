$PBExportHeader$u_cst_tabpage_control_shortcutbar_blb.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_control_shortcutbar_blb from ue_cst_buttonlistbar
end type
end forward

global type u_cst_tabpage_control_shortcutbar_blb from ue_cst_buttonlistbar
end type
global u_cst_tabpage_control_shortcutbar_blb u_cst_tabpage_control_shortcutbar_blb

event constructor;call super::constructor;theme.of_SetItemOrientation(Enums.VERT)
//theme.of_SetBorderStyle(theme.BS_NONE)
of_AddButton("测试单行","new!","测试Tips")
of_AddButton("测试断行~n新行(~~n)","new!","测试Tips")
of_AddButton("测试测试asf~nsafsafsa测试adsfadsf测试wesadfasdfdsa测试","save!","测试Tips")
of_AddButton("测试测试dsafsafsa测试adsfadsf测试sadfasdfdsa测试","open!","测试Tips")
of_AddButton("测aafsafsa测试adsfadsf测试sadfasdfdsa测试","row!","测试Tips")
of_displaytext(of_AddButton("打开","Open!","测试Tips"),false)
end event

on u_cst_tabpage_control_shortcutbar_blb.create
call super::create
end on

on u_cst_tabpage_control_shortcutbar_blb.destroy
call super::destroy
end on

type uo_logo from ue_cst_buttonlistbar`uo_logo within u_cst_tabpage_control_shortcutbar_blb
end type

