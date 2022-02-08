$PBExportHeader$n_canvas.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_canvas from nonvisualobject
end type
end forward

global type n_canvas from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean Attach(readonly powerobject pbobject)
public function boolean Attach(readonly powerobject pbobject,readonly ulong hwnd)
public function boolean Detach()
public function ulong GetHandle()
public function ulong GetSafeDC()
public function ulong GetSafeNcDC()
public function boolean ReleaseDC(readonly ulong hdc,readonly ulong hrgn)
public function boolean ReleaseDC(readonly ulong hdc,readonly ulong hrgn,readonly uint fadetime)
public function boolean FillParentBkgnd(readonly ulong dsthdc)
public function boolean UpdateFrame()
end type
global n_canvas n_canvas

on n_canvas.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_canvas.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

