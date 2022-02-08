$PBExportHeader$n_xmlparseresult.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_xmlparseresult from nonvisualobject
end type
end forward

global type n_xmlparseresult from nonvisualobject native "pfw.dll"
public function long GetStatus()
public function ulong GetOffset()
public function ulong GetEncoding()
public function string GetDescription()
end type
global n_xmlparseresult n_xmlparseresult

on n_xmlparseresult.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_xmlparseresult.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

