$PBExportHeader$n_blinkfunctor.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_blinkfunctor from nonvisualobject
end type
end forward

global type n_blinkfunctor from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
event type any OnInvoke(any args[])
end type
global n_blinkfunctor n_blinkfunctor

type variables

end variables

on n_blinkfunctor.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_blinkfunctor.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

