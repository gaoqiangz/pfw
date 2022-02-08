$PBExportHeader$n_devinfo.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_devinfo from nonvisualobject
end type
end forward

global type n_devinfo from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function string GetDevice(readonly long ntype)
public function int GetDevices(readonly long ntype,ref string devs[])
public function boolean MatchDevice(readonly long ntype,readonly string dev)
end type
global n_devinfo n_devinfo

on n_devinfo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_devinfo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

