$PBExportHeader$nx_httpform.sru
forward
global type nx_httpform from nonvisualobject
end type
end forward

global type nx_httpform from nonvisualobject native "pfwx.dll"
public function nx_httpform AddField(readonly string name,readonly string value)
end type
global nx_httpform nx_httpform

on nx_httpform.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nx_httpform.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

