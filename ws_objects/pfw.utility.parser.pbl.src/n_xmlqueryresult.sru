$PBExportHeader$n_xmlqueryresult.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_xmlqueryresult from nonvisualobject
end type
end forward

global type n_xmlqueryresult from nonvisualobject native "pfw.dll"
public function boolean IsValid()
public function boolean IsEmpty()
public function long GetStatus()
public function ulong GetOffset()
public function string GetDescription()
public function long GetValueType()
public function string GetValueString()
public function double GetValueNumber()
public function boolean GetValueBoolean()
public function n_xmlnode GetValueNode()
public function int GetValueNodes(ref n_xmlnode nodes[])
public function int GetValueNodes(ref n_xmlnode nodes[],readonly long sorttype)
public function n_xmlattribute GetValueAttribute()
public function int GetValueAttributes(ref n_xmlattribute nodes[])
public function int GetValueAttributes(ref n_xmlattribute nodes[],readonly long sorttype)
end type
global n_xmlqueryresult n_xmlqueryresult

on n_xmlqueryresult.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_xmlqueryresult.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

