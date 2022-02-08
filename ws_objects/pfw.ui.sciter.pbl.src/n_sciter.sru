﻿$PBExportHeader$n_sciter.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_sciter from nonvisualobject
end type
end forward

global type n_sciter from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean IsValid()
public function boolean IsVisible()
public function boolean IsEnabled()
public function boolean IsActive()
public function boolean IsFocused()
public function boolean IsPopupMode()
public function long Attach(readonly window wobject)
public function long Detach()
public function ulong GetHandle()
public function n_sciterelement CreateElement(readonly string tagName)
public function n_sciterelement CreateElement(readonly string tagName,readonly string text)
public function ulong CreateWindow(readonly ulong flags)
public function ulong CreateWindow(readonly ulong flags,readonly window owner)
public function ulong CreateWindow(readonly ulong flags,readonly real width,readonly real height)
public function ulong CreateWindow(readonly ulong flags,readonly real width,readonly real height,readonly window owner)
public function ulong CreateWindow(readonly ulong flags,readonly real xpos,readonly real ypos,readonly real width,readonly real height)
public function ulong CreateWindow(readonly ulong flags,readonly real xpos,readonly real ypos,readonly real width,readonly real height,readonly window owner)
public function long Close()
public function long Show()
public function long Show(readonly ulong flags)
public function long Hide()
public function long Popup()
public function long ClosePopup()
public function long ClosePopup(readonly long exitcode)
public function long SetVisible(readonly boolean visible)
public function long SetEnabled(readonly boolean enabled)
public function long SetActive()
public function long SetFocus()
public function long Move(readonly real xpos,readonly real ypos)
public function long Resize(readonly real width,readonly real height)
public function long SetPos(readonly real xpos,readonly real ypos,readonly real width,readonly real height)
public function long Center()
public function long GetSize(ref real width,ref real height)
public function long GetPos(ref real xpos,ref real ypos)
public function long GetPos(ref real xpos,ref real ypos,ref real width,ref real height)
public function string GetTitle()
public function long SetTitle(readonly string title)
public function string GetIcon()
public function long SetIcon(readonly string icon)
public function long SetOption(readonly ulong option,readonly boolean value)
public function long SetOption(readonly ulong option,readonly ulong value)
public function long AttachEvent(readonly ulong filter)
public function long DetachEvent()
public function long SetDebugOutput(readonly boolean enable)
public function long SetHost(readonly powerobject object)
public function long SetCSS(readonly string css)
public function long SetCSS(readonly string css,readonly string baseurl)
public function long SetCSS(readonly string css,readonly string baseurl,readonly string mediatype)
public function long SetMediaType(readonly string mediatype)
public function long SetMediaVars(readonly string mediavars)
public function long LoadFile(readonly string uri)
public function long LoadHtml(readonly string html)
public function long LoadHtml(readonly string html,readonly string baseurl)
public function long LoadUrl(readonly string url)
public function real GetMinWidth()
public function real GetMinHeight(readonly long forwidth)
public function long UpdateWindow()
public function n_scitervalue GetViewExpando()
public function n_sciterelement GetRootElement()
public function n_sciterelement GetFocusElement()
public function n_sciterelement GetHighlightedElement()
public function n_sciterelement GetElementById(readonly string id)
public function n_sciterelement GetElementByUID(readonly ulong uid)
public function int GetElementsByName(readonly string name,ref n_sciterelement els[])
public function int GetElementsByTagName(readonly string name,ref n_sciterelement els[])
public function int GetElementsByClassName(readonly string name,ref n_sciterelement els[])
public function n_sciterelement ElementFromPoint(readonly real xpos,readonly real ypos)
public function n_sciterelement FindElement(readonly string cssselector)
public function int FindElements(readonly string cssselector,ref n_sciterelement els[])
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
event type long OnAttachBehavior(n_sciterelement element,string name)
event type long OnMouse(n_sciterelement element,n_sciterelement target,ulong eventflag,real xpos,real ypos,ulong mousebuttons,ulong keyboardstates)
event type long OnKey(n_sciterelement element,n_sciterelement target,ulong eventflag,ulong code,ulong keyboardstates)
event type long OnFocus(n_sciterelement element,n_sciterelement target,ulong eventflag)
event type long OnTimer(n_sciterelement element,ulong id)
event type long OnSize(n_sciterelement element)
event type long OnScroll(n_sciterelement element,n_sciterelement target,ulong eventflag,real pos,boolean vertical)
event type long OnEvent(n_sciterelement element,n_sciterelement target,n_sciterelement owner,ulong eventflag,ulong reason,string name,any data)
event type any OnInvokeMethod(n_sciterelement element,string name,any args[])
event type long OnDebugOutput(ulong subsystem,ulong severity,string info)
end type
global n_sciter n_sciter

on n_sciter.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_sciter.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on
