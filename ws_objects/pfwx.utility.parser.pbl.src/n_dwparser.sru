$PBExportHeader$n_dwparser.sru
forward
global type n_dwparser from nonvisualobject
end type
end forward

global type n_dwparser from nonvisualobject native "pfwx.dll"
public function string Copyright()
public function string GetVersion()
public function long Parse(readonly string syn)
public function string Describe(readonly string selector)
public function string Modify(readonly string modifier)
public function long FromJson(readonly string syn_json)
public function string ToJson()
end type
global n_dwparser n_dwparser

on n_dwparser.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_dwparser.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

