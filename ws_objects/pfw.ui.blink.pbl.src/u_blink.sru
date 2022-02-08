﻿$PBExportHeader$u_blink.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_blink from userobject
end type
end forward

global type u_blink from userobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function ulong GetHandle()
public function n_blinkvalue CreateValue()
public function n_blinkelement CreateElement(readonly string tagName)
public function n_blinkelement CreateElement(readonly string tagName,readonly string text)
public function long SetOption(readonly ulong option,readonly boolean value)
public function long SetOption(readonly ulong option,readonly ulong value)
public function long SetOption(readonly ulong option,readonly string value)
public function long SetDebugOutput(readonly boolean enable)
public function long ShowDevTools()
public function long ShowDevTools(readonly string inspectorPath)
public function long SetHost(readonly powerobject object)
public function long SetAgent(readonly string name)
public function string GetAgent()
public function long SetCookie(readonly string url,readonly string cookie)
public function long SetZoom(readonly long zoom)
public function long GetZoom()
public function long LoadFile(readonly string uri)
public function long LoadHtml(readonly string html)
public function long LoadHtml(readonly string html,readonly string baseurl)
public function long LoadUrl(readonly string url)
public function boolean IsLoading()
public function boolean IsDocumentReady()
public function long StopLoading()
public function long Reload()
public function string GetUrl()
public function string GetCookie()
public function string GetContentTitle()
public function real GetContentWidth()
public function real GetContentHeight()
public function n_blinkvalue GetWindowExpando()
public function n_blinkvalue GetDocumentExpando()
public function n_blinkelement GetRootElement()
public function n_blinkelement GetFocusElement()
public function n_blinkelement GetElementById(readonly string id)
public function int GetElementsByName(readonly string name,ref n_blinkelement els[])
public function int GetElementsByTagName(readonly string name,ref n_blinkelement els[])
public function int GetElementsByClassName(readonly string name,ref n_blinkelement els[])
public function n_blinkelement ElementFromPoint(readonly real xpos,readonly real ypos)
public function n_blinkelement FindElement(readonly string cssselector)
public function int FindElements(readonly string cssselector,ref n_blinkelement els[])
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
public function boolean CanGoBack()
public function long GoBack()
public function boolean CanGoForward()
public function long GoForward()
event type long OnAlertBox(string msg)
event type long OnConfirmBox(string msg,ref boolean result)
event type long OnPromptBox(string msg,string default,ref string result)
event type long OnTitleReceived(string newtitle)
event type long OnFaviconReceived(string url,blob data)
event type long OnDocumentReady()
event type long OnLoadingFinish(string url,long result,string failedreason)
event type long OnNavigation(long navtype,string url)
event type long OnUrlChanged(string url)
event type ulong OnCreateView(long navtype,string url,real xpos,real ypos,real viewwidth,real viewheight,boolean viewresizable,boolean viewfullscreen)
event type long OnDebugOutput(ulong severity,string info,string source,long line,string stacktrace)
integer width = 1000
integer height = 500
end type
global u_blink u_blink

on u_blink.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_blink.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

