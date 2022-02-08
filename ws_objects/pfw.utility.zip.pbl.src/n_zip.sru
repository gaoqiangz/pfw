$PBExportHeader$n_zip.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_zip from nonvisualobject
end type
end forward

global type n_zip from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function long CreateZip(readonly string filename)
public function long CreateZip(readonly string filename,readonly string password)
public function long CreateMemZip()
public function long CreateMemZip(readonly string password)
public function long AddFolder(readonly string name)
public function long AddFile(readonly string name,readonly blob data)
public function long AddFile(readonly string name,readonly string filename)
public function long CloseZip()
public function blob CloseMemZip()
end type
global n_zip n_zip

on n_zip.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_zip.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

