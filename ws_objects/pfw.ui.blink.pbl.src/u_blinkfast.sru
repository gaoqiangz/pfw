$PBExportHeader$u_blinkfast.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_blinkfast from userobject
end type
end forward

global type u_blinkfast from userobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function ulong GetHandle()
public function long SetOption(readonly ulong option,readonly boolean value)
public function long SetOption(readonly ulong option,readonly ulong value)
public function long SetOption(readonly ulong option,readonly string value)
public function long SetDebugOutput(readonly boolean enable)
public function long ShowDevTools()
public function long ShowDevTools(readonly string inspectorPath)
public function long SetAgent(readonly string name)
public function long SetCookie(readonly string url,readonly string cookie)
public function long SetZoom(readonly long zoom)
public function long GetZoom()
public function long LoadFile(readonly string uri)
public function long LoadHtml(readonly string html)
public function long LoadHtml(readonly string html,readonly string baseurl)
public function long LoadUrl(readonly string url)
public function long StopLoading()
public function long Reload()
public function string GetUrl()
public function string GetContentTitle()
public function long EvaluateAsync(readonly long id,readonly string scripting)
public function long GoBack()
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
event type long OnScriptQuery(long msg,string request,ref string response)
event type long OnEvaluateComplete(long id,string result)
event type long OnDownload(string url,string mime,string disposition,ulong size,ref string path)
event type long OnDownloadComplete(string url,string mime,string disposition,ulong size,string path,long result)
integer width = 1001
integer height = 500
end type
global u_blinkfast u_blinkfast

on u_blinkfast.create
end on

on u_blinkfast.destroy
end on

