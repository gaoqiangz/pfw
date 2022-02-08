$PBExportHeader$n_dragicon.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_dragicon from nonvisualobject
end type
end forward

global type n_dragicon from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean IsDragging()
public function boolean BeginDrag(readonly ulong hwnd,readonly real x,readonly real y,readonly real width,readonly real height)
public function boolean BeginDragEx(readonly ulong hwnd,readonly real x,readonly real y,readonly real width,readonly real height,readonly uint alpha,readonly ulong bordercolor)
public function boolean DragMove(readonly real x,readonly real y)
public function boolean EndDrag()
public function boolean GetDraggingPosition(ref real x,ref real y)
end type
global n_dragicon n_dragicon

on n_dragicon.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_dragicon.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

