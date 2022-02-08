$PBExportHeader$n_httpformdata.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_httpformdata from nonvisualobject
end type
end forward

global type n_httpformdata from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
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
global n_httpformdata n_httpformdata

on n_httpformdata.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_httpformdata.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

