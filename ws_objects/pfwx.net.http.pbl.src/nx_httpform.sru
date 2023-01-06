$PBExportHeader$nx_httpform.sru
forward
global type nx_httpform from nonvisualobject
end type
end forward

global type nx_httpform from nonvisualobject native "pfwx.dll"
public function long AddField(readonly string name,readonly string value)
public function long AddField(readonly string name,readonly string value,readonly string contenttype)
public function long AddField(readonly string name,readonly blob value)
public function long AddField(readonly string name,readonly blob value,readonly string contenttype)
public function long AddField(readonly string name,readonly blob value,readonly string contenttype,readonly string disposition)
public function long AddFile(readonly string name,readonly string filepath)
public function long AddFile(readonly string name,readonly string filepath,readonly string contenttype)
public function long AddFile(readonly string name,readonly string filepath,readonly string contenttype,readonly string filename)
public function blob GetData()
public function string GetBoundary()
public function long Reset()
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

