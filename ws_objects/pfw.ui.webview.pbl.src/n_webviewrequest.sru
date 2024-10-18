$PBExportHeader$n_webviewrequest.sru
forward
global type n_webviewrequest from nonvisualobject
end type
end forward

global type n_webviewrequest from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function long FromHandle(ulong handle)
public function ulong IntoHandle()
public function boolean IsValid()
public function long GetContextType()
public function string GetUrl()
public function string GetMethod()
public function string GetHeader(readonly string name)
public function string GetHeaders()
public function string GetContentType()
public function string GetCharset()
public function blob GetData()
public function string GetDataString()
public function string GetDataString(readonly long encoding)
public function n_json GetDataJSON()
public function n_json GetDataJSON(readonly long encoding)
public function n_xmldoc GetDataXML()
public function n_xmldoc GetDataXML(readonly long encoding)
public function n_webviewresponse Response(readonly long status)
public function n_webviewresponse Response(readonly long status, readonly string reason)
end type
global n_webviewrequest n_webviewrequest

on n_webviewrequest.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_webviewrequest.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

