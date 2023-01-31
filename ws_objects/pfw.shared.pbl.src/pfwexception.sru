$PBExportHeader$pfwexception.sru
forward
global type pfwexception from runtimeerror
end type
end forward

global type pfwexception from runtimeerror
string objectname = "pfwexception"
string class = "pfwexception"
string routinename = "create"
integer line = -1
end type
global pfwexception pfwexception

type variables

end variables

forward prototypes
public subroutine setmessage (string newmessage)
end prototypes

public subroutine setmessage (string newmessage);super::SetMessage("PowerFramework Runtime Error~n" + newMessage)
end subroutine

on pfwexception.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfwexception.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

