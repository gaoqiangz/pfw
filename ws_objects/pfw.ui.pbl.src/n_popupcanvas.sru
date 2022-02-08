$PBExportHeader$n_popupcanvas.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_popupcanvas from nonvisualobject
end type
end forward

global type n_popupcanvas from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function ulong GetHandle()
public function ulong GetSafeDC()
public function ulong GetSafeNcDC()
public function boolean ReleaseDC(readonly ulong hdc,readonly ulong hrgn)
public function boolean ReleaseDC(readonly ulong hdc,readonly ulong hrgn,readonly uint fadetime)
public function boolean UpdateFrame()
public function boolean IsPopupMode()
public function ulong Popup(readonly ulong hwnd,readonly real x,readonly real y,readonly real width,readonly real height,readonly boolean fadeanimation)
public function ulong PopupEx(readonly ulong hwnd,readonly real x,readonly real y,readonly real width,readonly real height,readonly boolean fadeanimation,readonly ulong flags)
public function boolean ClosePopup(readonly ulong exitcode,readonly boolean fadeanimation)
public function boolean ClosePopupEx(readonly ulong exitcode,readonly boolean fadeanimation,readonly boolean force)
event type long OnInitPopup(ref real xpos,ref real ypos,ref real width,ref real height)
event type long OnUninitPopup(ulong exitcode,boolean force)
event type long OnPopup(boolean popup)
end type
global n_popupcanvas n_popupcanvas

on n_popupcanvas.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_popupcanvas.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

