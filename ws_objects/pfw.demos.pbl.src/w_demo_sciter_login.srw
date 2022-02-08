$PBExportHeader$w_demo_sciter_login.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type w_demo_sciter_login from w_cst_sciter
end type
end forward

global type w_demo_sciter_login from w_cst_sciter
integer width = 2025
integer height = 1184
end type
global w_demo_sciter_login w_demo_sciter_login

event open;call super::open;wf_LoadFile(Res.SCITER_HTML_QQLOGIN)
end event

on w_demo_sciter_login.create
call super::create
end on

on w_demo_sciter_login.destroy
call super::destroy
end on

