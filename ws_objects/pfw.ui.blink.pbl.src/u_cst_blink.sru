$PBExportHeader$u_cst_blink.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_blink from u_blink
end type
type uo_logo from u_logo within u_cst_blink
end type
end forward

global type u_cst_blink from u_blink
uo_logo uo_logo
end type
global u_cst_blink u_cst_blink

on u_cst_blink.create
int iCurrent
call super::create
this.uo_logo=create uo_logo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_logo
end on

on u_cst_blink.destroy
call super::destroy
destroy(this.uo_logo)
end on

type uo_logo from u_logo within u_cst_blink
string tag = "Blink"
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

