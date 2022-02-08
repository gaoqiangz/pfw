$PBExportHeader$n_unzip.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_unzip from nonvisualobject
end type
end forward

global type n_unzip from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function long OpenZip(readonly string filename)
public function long OpenZip(readonly string filename,readonly string password)
public function long OpenZip(readonly blob data)
public function long OpenZip(readonly blob data,readonly string password)
public function int GetItemCount()
public function string GetItemName(readonly int index)
public function int GetItemIndex(readonly string name)
public function boolean IsFile(readonly int index)
public function boolean IsFolder(readonly int index)
public function boolean HasFile(readonly string name)
public function boolean HasFolder(readonly string name)
public function blob UnzipFile(readonly int index)
public function blob UnzipFile(readonly string name)
public function long UnzipFile(readonly int index,readonly string filename)
public function long UnzipFile(readonly string name,readonly string filename)
public function long UnzipFolder(readonly int index,readonly string foldername)
public function long UnzipFolder(readonly string name,readonly string foldername)
public function long CloseZip()
end type
global n_unzip n_unzip

on n_unzip.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_unzip.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

