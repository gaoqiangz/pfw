$PBExportHeader$u_cst_tabpage_blink_browser_page.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_blink_browser_page from ue_cst_tabpage
end type
type uo_blink from u_cst_blink within u_cst_tabpage_blink_browser_page
end type
end forward

global type u_cst_tabpage_blink_browser_page from ue_cst_tabpage
integer width = 1751
integer height = 924
string text = ""
uo_blink uo_blink
end type
global u_cst_tabpage_blink_browser_page u_cst_tabpage_blink_browser_page

type variables
private:
n_cst_eventful _eventful //事件分发器
end variables

forward prototypes
public function long of_on (readonly string name, readonly powerobject object, readonly string evtname)
public function unsignedlong of_getblinkhandle ()
public function long of_forward ()
public function long of_loadurl (readonly string url)
public function long of_backward ()
public function long of_reload ()
public function string of_geturl ()
public function boolean of_canforward ()
public function boolean of_canbackward ()
public function long of_stoploading ()
public function boolean of_isloading ()
public function string of_gettitle ()
end prototypes

public function long of_on (readonly string name, readonly powerobject object, readonly string evtname);//订阅事件(事件订阅机制见:pfw.pbl::w_test_eventful示例)
return _eventful.of_On(name,object,evtName)
end function

public function unsignedlong of_getblinkhandle ();//获取blink窗口句柄
return uo_blink.GetHandle()
end function

public function long of_forward ();//转到下一页
return uo_blink.GoForward()
end function

public function long of_loadurl (readonly string url);//加载页面
if Trim(url) = "" then return RetCode.E_INVALID_ARGUMENT

return uo_blink.LoadUrl(url)
end function

public function long of_backward ();//转到上一页
return uo_blink.GoBack()
end function

public function long of_reload ();//重新加载页面
return uo_blink.Reload()
end function

public function string of_geturl ();//获取页面URL
return uo_blink.GetUrl()
end function

public function boolean of_canforward ();//是否可以转到下一页
return uo_blink.CanGoForward()
end function

public function boolean of_canbackward ();//是否可以转到上一页
return uo_blink.CanGoBack()
end function

public function long of_stoploading ();//停止正在加载的页面
return uo_blink.StopLoading()
end function

public function boolean of_isloading ();//是否正在加载页面
return uo_blink.IsLoading()
end function

public function string of_gettitle ();//获取页面标题
return uo_blink.GetDocumentExpando().GetItemString("title")
end function

on u_cst_tabpage_blink_browser_page.create
int iCurrent
call super::create
this.uo_blink=create uo_blink
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_blink
end on

on u_cst_tabpage_blink_browser_page.destroy
call super::destroy
destroy(this.uo_blink)
end on

event constructor;call super::constructor;_eventful = Create n_cst_eventful
//禁用JS异常弹窗口和OnDebugOutput事件
uo_blink.SetDebugOutput(false)
//获取[Favicon](事件OnFaviconReceived)
uo_blink.SetOption(Enums.BLINK_OPT_GET_FAVICON,true) 
end event

event destructor;call super::destructor;Destroy _eventful
end event

event resize;call super::resize;uo_blink.Move(0,0)
uo_blink.Resize(newWidth,newHeight)
end event

event onclose;call super::onclose;//*停止当前正在加载的页面（防止标签对象关闭时收到回调事件，而其它对象已经被释放引起的异常）
//uo_blink.StopLoading()
end event

event onopen;call super::onopen;Post of_LoadUrl(parm)
end event

type uo_blink from u_cst_blink within u_cst_tabpage_blink_browser_page
integer width = 1760
integer height = 920
integer taborder = 20
end type

on uo_blink.destroy
call u_cst_blink::destroy
end on

event oncreateview;call super::oncreateview;any aRetVal
u_cst_tabpage_blink_browser_page newPage

//分发订阅事件(事件订阅机制见:pfw.pbl::w_test_eventful示例)
aRetVal = _eventful.of_Trigger("onCreateView",parent,url)
if IsNull(aRetVal) then return 0
newPage = aRetVal

return newPage.of_GetBlinkHandle()
end event

event ondocumentready;call super::ondocumentready;//分发订阅事件(事件订阅机制见:pfw.pbl::w_test_eventful示例)
_eventful.of_Trigger("onDocumentReady",parent)
return 0
end event

event ontitlereceived;call super::ontitlereceived;//分发订阅事件(事件订阅机制见:pfw.pbl::w_test_eventful示例)
_eventful.of_Trigger("onTitleReceived",parent,newTitle)
return 0
end event

event onurlchanged;call super::onurlchanged;//分发订阅事件(事件订阅机制见:pfw.pbl::w_test_eventful示例)
_eventful.of_Trigger("onUrlChanged",parent,url)
return 0
end event

event onfaviconreceived;call super::onfaviconreceived;//分发订阅事件(事件订阅机制见:pfw.pbl::w_test_eventful示例)
_eventful.of_Trigger("onFaviconReceived",parent,url,data)
return 0
end event

event onloadingfinish;call super::onloadingfinish;//分发订阅事件(事件订阅机制见:pfw.pbl::w_test_eventful示例)
_eventful.of_Trigger("onLoadingFinish",parent,url,result,failedReason)
return 0
end event

