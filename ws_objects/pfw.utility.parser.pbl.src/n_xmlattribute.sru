$PBExportHeader$n_xmlattribute.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_xmlattribute from nonvisualobject
end type
end forward

global type n_xmlattribute from nonvisualobject native "pfw.dll"
public function boolean IsValid()
public function boolean IsEmpty()
public function ulong GetHashValue()
public function string GetName()
public function long SetName(readonly string name)
public function string GetValueString()
public function string GetValueString(readonly string default)
public function long GetValueLong()
public function long GetValueLong(readonly long default)
public function longlong GetValueLongLong()
public function longlong GetValueLongLong(readonly longlong default)
public function double GetValueDouble()
public function double GetValueDouble(readonly double default)
public function boolean GetValueBoolean()
public function boolean GetValueBoolean(readonly boolean default)
public function long SetValue(readonly string val)
public function long SetValue(readonly long val)
public function long SetValue(readonly longlong val)
public function long SetValue(readonly double val)
public function long SetValue(readonly boolean val)
public function n_xmlnode GetOwner()
public function n_xmlattribute GetPrevious()
public function n_xmlattribute GetNext()
end type
global n_xmlattribute n_xmlattribute

on n_xmlattribute.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_xmlattribute.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

