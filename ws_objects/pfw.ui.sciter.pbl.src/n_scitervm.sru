﻿$PBExportHeader$n_scitervm.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_scitervm from nonvisualobject
end type
end forward

global type n_scitervm from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function long SetDebugOutput(readonly boolean enable)
public function long SetHost(readonly powerobject object)
public function long LoadFile(readonly string uri)
public function long LoadScript(readonly string scripting)
public function long LoadScript(readonly string scripting,readonly string baseurl)
public function any InvokeFunction(readonly string name)
public function any InvokeFunction(readonly string name,readonly any arg1)
public function any InvokeFunction(readonly string name,readonly any arg1,readonly any arg2)
public function any InvokeFunction(readonly string name,readonly any arg1,readonly any arg2,readonly any arg3)
public function any InvokeFunction(readonly string name,readonly any arg1,readonly any arg2,readonly any arg3,readonly any arg4)
public function any InvokeFunction(readonly string name,readonly any arg1,readonly any arg2,readonly any arg3,readonly any arg4,readonly any arg5)
public function any InvokeFunction(readonly string name,readonly any arg1,readonly any arg2,readonly any arg3,readonly any arg4,readonly any arg5,readonly any arg6)
public function any InvokeFunction(readonly string name,readonly any arg1,readonly any arg2,readonly any arg3,readonly any arg4,readonly any arg5,readonly any arg6,readonly any arg7)
public function any InvokeFunction(readonly string name,readonly any arg1,readonly any arg2,readonly any arg3,readonly any arg4,readonly any arg5,readonly any arg6,readonly any arg7,readonly any arg8)
public function any InvokeFunction(readonly string name,readonly any arg1,readonly any arg2,readonly any arg3,readonly any arg4,readonly any arg5,readonly any arg6,readonly any arg7,readonly any arg8,readonly any arg9)
public function any InvokeFunction(readonly string name,readonly any arg1,readonly any arg2,readonly any arg3,readonly any arg4,readonly any arg5,readonly any arg6,readonly any arg7,readonly any arg8,readonly any arg9,readonly any arg10)
public function any InvokeFunction(readonly string name,readonly any arg1,readonly any arg2,readonly any arg3,readonly any arg4,readonly any arg5,readonly any arg6,readonly any arg7,readonly any arg8,readonly any arg9,readonly any arg10,readonly any arg11,...)
public function any Evaluate(readonly string scripting)
event type long OnDebugOutput(ulong subsystem,ulong severity,string info)
end type
global n_scitervm n_scitervm

on n_scitervm.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_scitervm.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

