$PBExportHeader$n_webviewresponse.sru
forward
global type n_webviewresponse from nonvisualobject
end type
end forward

global type n_webviewresponse from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean IsValid()
public function long GetHttpStatus()
public function string GetReasonPhrase()
public function string GetHeader(readonly string name)
public function string GetHeaders()
public function n_webviewresponse SetHttpStatus(readonly long status)
public function n_webviewresponse SetReasonPhrase(readonly string reason)
public function n_webviewresponse SetHeader(readonly string name, readonly string value)
public function n_webviewresponse SetData(readonly string text)
public function n_webviewresponse SetData(readonly string text, readonly string contenttype)
public function n_webviewresponse SetData(readonly blob data)
public function n_webviewresponse SetData(readonly blob data, readonly string contenttype)
public function n_webviewresponse SetData(readonly n_json data)
public function n_webviewresponse SetData(readonly n_json data, readonly string contenttype)
public function n_webviewresponse SetData(readonly n_xmldoc data)
public function n_webviewresponse SetData(readonly n_xmldoc data, readonly string contenttype)
end type
global n_webviewresponse n_webviewresponse

on n_webviewresponse.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_webviewresponse.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

