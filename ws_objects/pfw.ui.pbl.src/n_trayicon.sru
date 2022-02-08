$PBExportHeader$n_trayicon.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_trayicon from nonvisualobject
end type
end forward

global type n_trayicon from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function ulong AddIcon(readonly ulong hwnd,readonly string image,readonly string tiptext)
public function ulong AddIcon(readonly ulong hwnd,readonly string image,readonly string tiptext,readonly ulong callbackmessage)
public function boolean RemoveIcon(readonly ulong hwnd,readonly ulong id)
public function boolean SetIcon(readonly ulong hwnd,readonly ulong id,readonly string image)
public function boolean SetTipText(readonly ulong hwnd,readonly ulong id,readonly string tiptext)
public function boolean ShowBalloonTip(readonly ulong hwnd,readonly ulong id,readonly icon icon,readonly string title,readonly string info)
public function boolean HideBalloonTip(readonly ulong hwnd,readonly ulong id)
public function boolean ShowIcon(readonly ulong hwnd,readonly ulong id)
public function boolean HideIcon(readonly ulong hwnd,readonly ulong id)
end type
global n_trayicon n_trayicon

on n_trayicon.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_trayicon.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

