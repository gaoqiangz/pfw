$PBExportHeader$n_regexp.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_regexp from nonvisualobject
end type
end forward

global type n_regexp from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function long Compile(readonly string pattern)
public function long Compile(readonly string pattern,readonly boolean matchcase)
public function boolean Match(readonly string str)
public function boolean Match(readonly string str,readonly ulong flags)
public function string FindFirst(readonly string str)
public function string FindFirst(readonly string str,readonly ulong flags)
public function string FindLast(readonly string str)
public function string FindLast(readonly string str,readonly ulong flags)
public function int Find(readonly string str,ref string subs[])
public function int Find(readonly string str,ref string subs[],readonly ulong flags)
public function string Replace(readonly string str,readonly string rpl)
public function string Replace(readonly string str,readonly string rpl,readonly ulong flags)
end type
global n_regexp n_regexp

on n_regexp.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_regexp.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

