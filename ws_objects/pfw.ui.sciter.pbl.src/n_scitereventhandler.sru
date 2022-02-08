$PBExportHeader$n_scitereventhandler.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_scitereventhandler from nonvisualobject
end type
end forward

global type n_scitereventhandler from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function ulong GetFilter()
public function long SetFilter(readonly ulong filter)
event type long OnAttached(n_sciterelement element)
event type long OnDetached(n_sciterelement element)
event type long OnMouse(n_sciterelement element,n_sciterelement target,ulong eventflag,real xpos,real ypos,ulong mousebuttons,ulong keyboardstates)
event type long OnKey(n_sciterelement element,n_sciterelement target,ulong eventflag,ulong code,ulong keyboardstates)
event type long OnFocus(n_sciterelement element,n_sciterelement target,ulong eventflag)
event type long OnTimer(n_sciterelement element,ulong id)
event type long OnSize(n_sciterelement element)
event type long OnScroll(n_sciterelement element,n_sciterelement target,ulong eventflag,real pos,boolean vertical)
event type long OnEvent(n_sciterelement element,n_sciterelement target,n_sciterelement owner,ulong eventflag,ulong reason,string name,any data)
event type any OnInvokeMethod(n_sciterelement element,string name,any args[])
end type
global n_scitereventhandler n_scitereventhandler

on n_scitereventhandler.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_scitereventhandler.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

