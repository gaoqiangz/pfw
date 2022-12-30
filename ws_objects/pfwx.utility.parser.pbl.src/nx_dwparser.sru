$PBExportHeader$nx_dwparser.sru
forward
global type nx_dwparser from nonvisualobject
end type
end forward

global type nx_dwparser from nonvisualobject native "pfwx.dll"
public function long Parse(readonly string syn)
public function string Describe(readonly string selector)
public function string Modify(readonly string modifier)
public function long FromJson(readonly string syn_json)
public function string ToJson()
end type
global nx_dwparser nx_dwparser

on nx_dwparser.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nx_dwparser.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

