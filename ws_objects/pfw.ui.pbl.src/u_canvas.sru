$PBExportHeader$u_canvas.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_canvas from userobject
end type
end forward

global type u_canvas from userobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function ulong GetHandle()
public function ulong GetSafeDC()
public function ulong GetSafeNcDC()
public function boolean ReleaseDC(readonly ulong hdc,readonly ulong hrgn)
public function boolean ReleaseDC(readonly ulong hdc,readonly ulong hrgn,readonly uint fadetime)
public function boolean FillParentBkgnd(readonly ulong dsthdc)
public function boolean UpdateFrame()
public subroutine Init()
integer width = 1000
integer height = 500
end type
global u_canvas u_canvas

on u_canvas.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_canvas.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

