$PBExportHeader$n_initializer.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_initializer from nonvisualobject
end type
end forward

global type n_initializer from nonvisualobject native "pfw.dll"
end type
global n_initializer n_initializer

type variables
public:
protected boolean #UI			= true
protected boolean #Sciter		= false
protected boolean #Blink		= false
protected boolean #BlinkFast	= false
protected boolean #ORCA			= false
protected boolean #SQLite		= false
protected boolean #DPIAware	= false
end variables

on n_initializer.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_initializer.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

