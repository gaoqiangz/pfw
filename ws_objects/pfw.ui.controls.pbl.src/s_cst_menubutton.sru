$PBExportHeader$s_cst_menubutton.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type s_cst_menubutton from s_cst_button
end type
end forward

global type s_cst_menubutton from s_cst_button
end type
global s_cst_menubutton s_cst_menubutton

type variables

end variables

on s_cst_menubutton.create
call super::create
end on

on s_cst_menubutton.destroy
call super::destroy
end on

event onconstructor;call super::onconstructor;of_SetStyle(Enums.BTS_DROPDOWN)
of_SetPopupMenu("n_cst_popupmenu")
end event

