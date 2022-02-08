$PBExportHeader$n_timer.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_timer from nonvisualobject
end type
end forward

global type n_timer from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean Start(readonly ulong id,readonly ulong interval)
public function boolean Stop(readonly ulong id)
public function boolean Stopall()
public function ulong GetInterval(readonly ulong id)
public function boolean IsRunning(readonly ulong id)
event type boolean OnTimer(ulong id)
end type
global n_timer n_timer

on n_timer.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_timer.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

