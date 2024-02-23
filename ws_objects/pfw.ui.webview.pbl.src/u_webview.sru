$PBExportHeader$u_webview.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_webview from userobject
end type
end forward

global type u_webview from userobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function ulong GetHandle()
public function long SetOption(readonly ulong option,readonly boolean value)
public function long SetDebugOutput(readonly boolean enable)
public function long LoadEngine()
public function long LoadFile(readonly string uri)
public function long LoadHtml(readonly string html)
public function long LoadHtml(readonly string html, readonly string baseurl)
public function long LoadUrl(readonly string url)
public function long ShowDevTools()
public function long SetAgent(readonly string name)
public function string GetAgent()
public function long SetCookie(readonly string domain,readonly string name,readonly string value)
public function string GetCookie(readonly string domain)
public function string GetCookies()
public function long SetZoom(readonly long zoom)
public function long GetZoom()
public function boolean IsLoading()
public function boolean IsDocumentReady()
public function long Stop()
public function long Reload()
public function boolean CanGoBack()
public function long GoBack()
public function boolean CanGoForward()
public function long GoForward()
public function string GetUrl()
public function string GetContentTitle()
public function string Evaluate(readonly string scripting)
public function long EvaluateAsync(readonly string scripting)
event type long OnNavigationStart(string url)
event OnNavigationEnd(string url,boolean succ)
event OnUrlChanged(string url)
event OnLoading()
event OnDocumentReady()
event OnTitleChanged(string newtitle)
event OnFaviconChanged(string url,blob data)
event OnAlert(string msg)
event type long OnConfirm(string msg)
event type long OnPrompt(string msg,string default,ref string result)
event type ulong OnCreateView(string url,real xpos,real ypos,real viewwidth,real viewheight)
event type string OnInvoke(string method,string args[])
event OnDebugOutput(string url,string source,string level,string info,long line,string stacktrace)
integer width = 1000
integer height = 500
end type
global u_webview u_webview

on u_webview.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_webview.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

