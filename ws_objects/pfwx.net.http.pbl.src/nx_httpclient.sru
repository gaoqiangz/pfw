$PBExportHeader$nx_httpclient.sru
forward
global type nx_httpclient from nonvisualobject
end type
end forward

global type nx_httpclient from nonvisualobject native "pfwx.dll"
end type
global nx_httpclient nx_httpclient

on nx_httpclient.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nx_httpclient.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

