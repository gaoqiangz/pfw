$PBExportHeader$n_httpresponse.sru
$PBExportComments$PowerBuilder Extension~r~nBy gaoqiangz@msn.com
forward
global type n_httpresponse from nonvisualobject
end type
end forward

global type n_httpresponse from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean IsValid()
public function boolean IsHttpStatusOK()
public function boolean IsCancelled()
public function boolean IsContentTypeTextual()
public function boolean IsContentTypeJSON()
public function boolean IsContentTypeXML()
public function string GetHeader(readonly string name)
public function string GetHeaderName(readonly int index)
public function string GetHeaderValue(readonly int index)
public function int GetHeaderCount()
public function string GetHeaders()
public function string GetContentType()
public function string GetCharset()
public function ulong GetHttpStatus()
public function ulong GetError()
public function string GetErrorInfo()
public function blob GetData()
public function string GetDataString()
public function string GetDataString(readonly long encoding)
public function n_json GetDataJSON()
public function n_json GetDataJSON(readonly long encoding)
public function n_xmldoc GetDataXML()
public function n_xmldoc GetDataXML(readonly long encoding)
end type
global n_httpresponse n_httpresponse

on n_httpresponse.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_httpresponse.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

