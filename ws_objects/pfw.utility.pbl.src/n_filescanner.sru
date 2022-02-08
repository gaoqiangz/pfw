$PBExportHeader$n_filescanner.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_filescanner from nonvisualobject
end type
end forward

global type n_filescanner from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function long ScanFiles(readonly string path,ref string files[])
public function long ScanFiles(readonly string path,ref string files[],readonly boolean deep)
public function long ScanFiles(readonly string path,ref string files[],readonly ulong flags)
public function long ScanFiles(readonly string path,ref string files[],readonly ulong flags,readonly boolean deep)
public function long ScanFolders(readonly string path,ref string folders[])
public function long ScanFolders(readonly string path,ref string folders[],readonly boolean deep)
public function long ScanFolders(readonly string path,ref string folders[],readonly ulong flags)
public function long ScanFolders(readonly string path,ref string folders[],readonly ulong flags,readonly boolean deep)
public function long ScanAll(readonly string path,ref string files[])
public function long ScanAll(readonly string path,ref string files[],readonly boolean deep)
public function long ScanAll(readonly string path,ref string files[],readonly ulong flags)
public function long ScanAll(readonly string path,ref string files[],readonly ulong flags,readonly boolean deep)
public function long Traverse(readonly string path)
public function long Traverse(readonly string path,readonly boolean deep)
public function long Traverse(readonly string path,readonly boolean deep,readonly any param)
public function long Traverse(readonly string path,readonly ulong flags)
public function long Traverse(readonly string path,readonly ulong flags,readonly boolean deep)
public function long Traverse(readonly string path,readonly ulong flags,readonly boolean deep,readonly any param)
event type long OnTraverse(any param,string name,boolean isFolder,ulong attributes,datetime creationTime,datetime lastWriteTime,ulong fileSize)
end type
global n_filescanner n_filescanner

on n_filescanner.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_filescanner.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

