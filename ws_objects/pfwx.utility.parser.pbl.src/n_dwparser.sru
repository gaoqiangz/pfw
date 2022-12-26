$PBExportHeader$n_dwparser.sru
forward
global type n_dwparser from nonvisualobject
end type
end forward

global type n_dwparser from nonvisualobject native "pfwx.dll"
public function string copyright()
public function string getversion()
public function long parse(readonly string syn)
public function string describe(readonly string selector)
public function string modify(readonly string modifier)
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

