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
public function nx_httprequest SetBody(readonly string text)
public function nx_httprequest SetBody(readonly string text, readonly string contenttype)
public function nx_httprequest SetBody(readonly blob data)
public function nx_httprequest SetBody(readonly blob data, readonly string contenttype)
public function nx_httprequest SetBody(readonly nonvisualobject json_or_xml)
public function nx_httprequest SetBody(readonly nx_httpmultipart form)
public function nx_httprequest SetBody(readonly nx_httpform form)
public function nx_httprequest Query(readonly string key, readonly string val)
public function nx_httprequest SetReceiveFile(readonly string filepath)
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

