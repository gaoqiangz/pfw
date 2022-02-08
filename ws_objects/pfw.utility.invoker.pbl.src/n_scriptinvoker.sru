$PBExportHeader$n_scriptinvoker.sru
$PBExportComments$PowerBuilder Extension~r~nBy gaoqiangz@msn.com
forward
global type n_scriptinvoker from nonvisualobject
end type
end forward

global type n_scriptinvoker from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean IsValid()
public function long Init(readonly string name,readonly string sign)
public function long Init(readonly powerobject object,readonly string name,readonly string sign)
public function long Init(readonly powerobject object,readonly string name,readonly string sign,readonly scriptkind scripttype)
public function long Init(readonly powerobject object,readonly long mid)
public function long Init(readonly powerobject object,readonly long mid,readonly scriptkind scripttype)
public function int GetArgCount()
public function long SetArg(readonly int index,any val)
public function long SetArgs(readonly int index,readonly any args[])
public function long SetArgs(readonly int index,readonly any args[],readonly int argidx)
public function long SetArgs(readonly int index,readonly any args[],readonly int argidx,readonly int argcount)
public function long SetArgs(readonly any args[])
public function long SetArgs(readonly any args[],readonly int argidx)
public function long SetArgs(readonly any args[],readonly int argidx,readonly int argcount)
public function any GetArg(readonly int index)
public function any Invoke()
public function long Release()
end type
global n_scriptinvoker n_scriptinvoker

on n_scriptinvoker.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_scriptinvoker.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

