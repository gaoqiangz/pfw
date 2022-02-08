$PBExportHeader$assertionfailed.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type assertionfailed from runtimeerror
end type
end forward

global type assertionfailed from runtimeerror
string objectname = "assertionfailed"
string class = "assertionfailed"
string routinename = "create"
integer line = -1
end type
global assertionfailed assertionfailed

type variables
public:
string 	#Info
string 	#WindowMenu
string 	#Object
string	#ObjectEvent
long		#Line
string 	#StackTraceInfo
string 	#StackTrace[]

end variables

on assertionfailed.create
call super::create
TriggerEvent( this, "constructor" )
end on

on assertionfailed.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

