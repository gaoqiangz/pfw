$PBExportHeader$u_cst_webview.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_webview from u_webview
end type
type uo_logo from u_logo within u_cst_webview
end type
end forward

global type u_cst_webview from u_webview
integer width = 1000
uo_logo uo_logo
end type
global u_cst_webview u_cst_webview

on u_cst_webview.create
int iCurrent
call super::create
this.uo_logo=create uo_logo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_logo
end on

on u_cst_webview.destroy
call super::destroy
destroy(this.uo_logo)
end on

type uo_logo from u_logo within u_cst_webview
string tag = "webview"
integer width = 1010
integer height = 504
integer taborder = 10
end type

on uo_logo.destroy
call u_logo::destroy
end on

event constructor;call super::constructor;/*
/*--- PB12以下版本使用下面的代码 ---*/
GetParentWindow(this).CloseUserObject(this)
/*--------------------------------------------------*/
*/

/*--- PB12及以上版本使用下面的代码 ---*/
Parent.CloseUserObject(this)
/*--------------------------------------------------*/
end event

