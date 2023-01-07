$PBExportHeader$nx_httpmultipart.sru
forward
global type nx_httpmultipart from nonvisualobject
end type
end forward

global type nx_httpmultipart from nonvisualobject native "pfwx.dll"
public function nx_httpmultipart AddField(readonly string name,readonly string value)
public function nx_httpmultipart AddField(readonly string name,readonly string value,readonly string mime)
public function nx_httpmultipart AddField(readonly string name,readonly blob value)
public function nx_httpmultipart AddField(readonly string name,readonly blob value,readonly string mime)
public function nx_httpmultipart AddFile(readonly string name,readonly string filepath)
public function nx_httpmultipart AddFile(readonly string name,readonly string filepath,readonly string filename)
public function nx_httpmultipart AddFile(readonly string name,readonly string filepath,readonly string filename,readonly string mime)
public function string GetBoundary()
end type
global nx_httpmultipart nx_httpmultipart

on nx_httpmultipart.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nx_httpmultipart.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

