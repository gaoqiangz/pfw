$PBExportHeader$u_cst_tabpage_sciter_printing.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_sciter_printing from ue_cst_tabpage
end type
type uo_sciter from u_sciter within u_cst_tabpage_sciter_printing
end type
end forward

global type u_cst_tabpage_sciter_printing from ue_cst_tabpage
uo_sciter uo_sciter
end type
global u_cst_tabpage_sciter_printing u_cst_tabpage_sciter_printing

on u_cst_tabpage_sciter_printing.create
int iCurrent
call super::create
this.uo_sciter=create uo_sciter
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_sciter
end on

on u_cst_tabpage_sciter_printing.destroy
call super::destroy
destroy(this.uo_sciter)
end on

event resize;call super::resize;uo_sciter.Move(0,0)
uo_sciter.Resize(newWidth,newHeight)
end event

event onopen;call super::onopen;uo_sciter.LoadFile(Res.SCITER_HTML_PRINTING)
end event

type uo_sciter from u_sciter within u_cst_tabpage_sciter_printing
integer width = 2213
integer height = 1496
integer taborder = 10
end type

on uo_sciter.destroy
call u_sciter::destroy
end on

