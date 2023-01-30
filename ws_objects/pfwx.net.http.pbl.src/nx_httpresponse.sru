$PBExportHeader$nx_httpresponse.sru
forward
global type nx_httpresponse from nonvisualobject
end type
end forward

global type nx_httpresponse from nonvisualobject native "pfwx.dll"
public function boolean IsValid()
public function boolean IsHttpStatusOK()
public function boolean IsCancelled()
public function boolean IsText()
public function boolean IsJSON()
public function boolean IsXML()
public function boolean IsBinary()
public function boolean IsAsync()
public function ulong GetAsyncId()
public function ulong GetElapsed()
public function string GetReceiveFile()
public function string GetHeader(readonly string name)
public function string GetHeader(readonly int index)
public function string GetHeaderName(readonly int index)
public function int GetHeaderCount()
public function string GetHeaders()
public function string GetContentType()
public function string GetCharset()
public function ulong GetHttpStatus()
public function string GetErrorInfo()
public function blob GetData()
public function string GetDataString()
public function string GetDataString(readonly long encoding)
public function nonvisualobject GetDataJSON()
public function nonvisualobject GetDataJSON(readonly long encoding)
public function nonvisualobject GetDataXML()
public function nonvisualobject GetDataXML(readonly long encoding)
end type
global nx_httpresponse nx_httpresponse

on nx_httpresponse.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nx_httpresponse.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

