$PBExportHeader$n_sciterfunctor.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_sciterfunctor from nonvisualobject
end type
end forward

global type n_sciterfunctor from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
event type any OnInvoke(any args[])
end type
global n_sciterfunctor n_sciterfunctor

on n_sciterfunctor.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_sciterfunctor.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

