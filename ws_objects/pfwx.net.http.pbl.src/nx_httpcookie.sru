$PBExportHeader$nx_httpcookie.sru
forward
global type nx_httpcookie from nonvisualobject
end type
end forward

global type nx_httpcookie from nonvisualobject native "pfwx.dll"
public function nx_httpcookie SetCookie(readonly string url,readonly string cookie)
public function string GetCookie(readonly string url)
end type
global nx_httpcookie nx_httpcookie

on nx_httpcookie.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nx_httpcookie.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

