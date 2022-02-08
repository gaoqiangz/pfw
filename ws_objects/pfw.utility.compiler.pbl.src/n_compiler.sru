$PBExportHeader$n_compiler.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_compiler from nonvisualobject
end type
end forward

global type n_compiler from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function long Import(readonly string name,readonly string syntax,readonly long ntype)
public function long ImportBegin()
public function long ImportEnd()
end type
global n_compiler n_compiler

on n_compiler.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_compiler.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

