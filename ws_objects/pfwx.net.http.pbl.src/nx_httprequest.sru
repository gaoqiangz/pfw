$PBExportHeader$nx_httprequest.sru
forward
global type nx_httprequest from nonvisualobject
end type
end forward

global type nx_httprequest from nonvisualobject native "pfwx.dll"
public function nx_httprequest SetHeader(readonly string key, readonly string val)
public function nx_httprequest SetBasicAuth(readonly string user, readonly string psw)
public function nx_httprequest SetBearerAuth(readonly string token)
public function nx_httprequest SetTimeout(readonly double secs)
public function nx_httprequest Query(readonly string key, readonly string val)
public function nx_httpresponse Send()
public function nx_httpresponse Send(readonly ulong hevent)
public function long AsyncSend(readonly ulong id)
public function long AsyncSend(readonly ulong id, readonly boolean progress)
end type
global nx_httprequest nx_httprequest

on nx_httprequest.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nx_httprequest.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

