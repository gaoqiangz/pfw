$PBExportHeader$n_blinkfast.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_blinkfast from nonvisualobject
end type
end forward

global type n_blinkfast from nonvisualobject native "pfw.dll"
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
end type
global n_blinkfast n_blinkfast

on n_blinkfast.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_blinkfast.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

