$PBExportHeader$n_objectinvoker.sru
$PBExportComments$PowerBuilder Extension~r~nBy gaoqiangz@msn.com
forward
global type n_objectinvoker from nonvisualobject
end type
end forward

global type n_objectinvoker from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean IsAttached()
public function long Attach(readonly powerobject object)
public function long Detach()
public function powerobject GetObject()
public function int GetVarCount()
public function boolean HasVar(readonly string name)
public function string GetVarName(readonly int index)
public function any GetVar(readonly int index)
public function any GetVar(readonly string name)
public function long SetVar(readonly int index,readonly any val)
public function long SetVar(readonly string name,readonly any val)
public function boolean HasSharedVar(readonly string name)
public function any GetSharedVar(readonly string name)
public function long SetSharedVar(readonly string name,readonly any val)
public function boolean HasMethod(readonly string name,readonly string sign)
public function boolean HasEvent(readonly string name,readonly string sign)
public function any InvokeMethod(readonly string name,readonly string sign)
public function any InvokeMethod(readonly string name,readonly string sign,any arg1)
public function any InvokeMethod(readonly string name,readonly string sign,any arg1,any arg2)
public function any InvokeMethod(readonly string name,readonly string sign,any arg1,any arg2,any arg3)
public function any InvokeMethod(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4)
public function any InvokeMethod(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4,any arg5)
public function any InvokeMethod(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4,any arg5,any arg6)
public function any InvokeMethod(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4,any arg5,any arg6,any arg7)
public function any InvokeMethod(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4,any arg5,any arg6,any arg7,any arg8)
public function any InvokeMethod(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4,any arg5,any arg6,any arg7,any arg8,any arg9)
public function any InvokeMethod(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4,any arg5,any arg6,any arg7,any arg8,any arg9,any arg10)
public function any InvokeMethod(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4,any arg5,any arg6,any arg7,any arg8,any arg9,any arg10,any arg11)
public function any InvokeEvent(readonly string name,readonly string sign)
public function any InvokeEvent(readonly string name,readonly string sign,any arg1)
public function any InvokeEvent(readonly string name,readonly string sign,any arg1,any arg2)
public function any InvokeEvent(readonly string name,readonly string sign,any arg1,any arg2,any arg3)
public function any InvokeEvent(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4)
public function any InvokeEvent(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4,any arg5)
public function any InvokeEvent(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4,any arg5,any arg6)
public function any InvokeEvent(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4,any arg5,any arg6,any arg7)
public function any InvokeEvent(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4,any arg5,any arg6,any arg7,any arg8)
public function any InvokeEvent(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4,any arg5,any arg6,any arg7,any arg8,any arg9)
public function any InvokeEvent(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4,any arg5,any arg6,any arg7,any arg8,any arg9,any arg10)
public function any InvokeEvent(readonly string name,readonly string sign,any arg1,any arg2,any arg3,any arg4,any arg5,any arg6,any arg7,any arg8,any arg9,any arg10,any arg11)
end type
global n_objectinvoker n_objectinvoker

on n_objectinvoker.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_objectinvoker.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

