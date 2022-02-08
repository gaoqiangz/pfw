$PBExportHeader$n_tooltip.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_tooltip from nonvisualobject
end type
end forward

global type n_tooltip from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean CreateToolTip(readonly ulong hparentwnd)
public function boolean CreateBalloonTip(readonly ulong hparentwnd,readonly boolean showclose)
public function ulong AddTool(readonly ulong hwnd,readonly boolean textcallback,readonly ulong fstyle)
public function ulong AddTool(readonly ulong hwnd,readonly string tiptext,readonly ulong fstyle)
public function boolean DelTool(readonly ulong hwnd,readonly ulong id)
public function boolean SetDelayTime(readonly ulong flag,readonly int timems)
public function boolean RelayEvent(readonly ulong hwnd,readonly uint msgnumber)
public function boolean Pop()
public function boolean Popup()
public function boolean SetMaxTipWidth(readonly real maxwidth)
public function boolean TrackActivate(readonly ulong hwnd,readonly ulong id,readonly boolean activate)
public function boolean TrackPosition(readonly ulong hwnd,readonly real x,readonly real y)
public function boolean UpdateTipText(readonly ulong hwnd,readonly ulong id,readonly string tiptext)
public function boolean UpdateToolRect(readonly ulong hwnd,readonly ulong id,readonly real left,readonly real top,readonly real right,readonly real bottom)
public function boolean SetTitle(readonly ulong icon,readonly string title)
public function boolean GetBubbleSize(readonly ulong hwnd,readonly ulong id,ref real width,ref real height)
end type
global n_tooltip n_tooltip

on n_tooltip.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_tooltip.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

