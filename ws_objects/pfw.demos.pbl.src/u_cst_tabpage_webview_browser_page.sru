$PBExportHeader$u_cst_tabpage_webview_browser_page.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_webview_browser_page from ue_cst_tabpage
end type
type uo_nav from ue_cst_toolbarstrip within u_cst_tabpage_webview_browser_page
end type
type sle_url from se_cst_singlelineedit within u_cst_tabpage_webview_browser_page
end type
type sle_search from se_cst_singlelineedit within u_cst_tabpage_webview_browser_page
end type
type uo_webview from u_cst_webview within u_cst_tabpage_webview_browser_page
end type
type uo_nav_container from ue_cst_splitcontainer within u_cst_tabpage_webview_browser_page
end type
end forward

global type u_cst_tabpage_webview_browser_page from ue_cst_tabpage
integer width = 2149
integer height = 1060
string text = ""
uo_nav uo_nav
sle_url sle_url
sle_search sle_search
uo_webview uo_webview
uo_nav_container uo_nav_container
end type
global u_cst_tabpage_webview_browser_page u_cst_tabpage_webview_browser_page

type variables
private:
n_cst_eventful _eventful //事件分发器

constant string HOME_URL	= "http://www.baidu.com"
constant string IMG_GO		= "res\images\forward.svg{fill:rgb(23,160,93)}"
constant string IMG_RELOAD = "res\images\reload.svg{fill:#888}"
constant string IMG_STOP	= "res\images\close.svg{fill:rgb(222,83,71)}"
end variables

forward prototypes
public function long of_on (readonly string name, readonly powerobject object, readonly string evtname)
public function unsignedlong of_getwebviewhandle ()
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

public function unsignedlong of_getwebviewhandle ();//获取webview窗口句柄
return uo_webview.GetHandle()
end function

public function long of_forward ();//转到下一页
return uo_webview.GoForward()
end function

public function long of_loadurl (readonly string url);//加载页面
if Trim(url) = "" then return RetCode.E_INVALID_ARGUMENT

return uo_webview.LoadUrl(url)
end function

public function long of_backward ();//转到上一页
return uo_webview.GoBack()
end function

public function long of_reload ();//重新加载页面
return uo_webview.Reload()
end function

public function string of_geturl ();//获取页面URL
return uo_webview.GetUrl()
end function

public function boolean of_canforward ();//是否可以转到下一页
return uo_webview.CanGoForward()
end function

public function boolean of_canbackward ();//是否可以转到上一页
return uo_webview.CanGoBack()
end function

public function long of_stoploading ();//停止正在加载的页面
return uo_webview.Stop()
end function

public function boolean of_isloading ();//是否正在加载页面
return uo_webview.IsLoading()
end function

public function string of_gettitle ();//获取页面标题
return uo_webview.GetContentTitle()
end function

on u_cst_tabpage_webview_browser_page.create
int iCurrent
call super::create
this.uo_nav=create uo_nav
this.sle_url=create sle_url
this.sle_search=create sle_search
this.uo_webview=create uo_webview
this.uo_nav_container=create uo_nav_container
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_nav
this.Control[iCurrent+2]=this.sle_url
this.Control[iCurrent+3]=this.sle_search
this.Control[iCurrent+4]=this.uo_webview
this.Control[iCurrent+5]=this.uo_nav_container
end on

on u_cst_tabpage_webview_browser_page.destroy
call super::destroy
destroy(this.uo_nav)
destroy(this.sle_url)
destroy(this.sle_search)
destroy(this.uo_webview)
destroy(this.uo_nav_container)
end on

event constructor;call super::constructor;_eventful = Create n_cst_eventful
//获取[Favicon](OnFaviconChanged事件)
uo_webview.SetOption(Enums.WEBVIEW_OPT_GET_FAVICON,true) 
//开启DevTools
uo_webview.SetOption(Enums.WEBVIEW_OPT_DEVTOOLS,true) 
//开启内置错误页面（默认为空白页）
uo_webview.SetOption(Enums.WEBVIEW_OPT_BUILTIN_ERROR_PAGE,true) 
end event

event destructor;call super::destructor;Destroy _eventful
end event

event resize;call super::resize;uo_nav_container.Move(0,0)
uo_nav_container.Resize(newWidth,uo_nav_container.height)

uo_webview.Move(0,uo_nav_container.height + D2UY(4))
uo_webview.Resize(newWidth,newHeight - uo_webview.y)

end event

event onopen;call super::onopen;Post of_LoadUrl(parm)
end event

event onpreopen;call super::onpreopen;n_cst_splitcontainer_panel panel

/* 设置工具栏主题 */
//设置背景为透明(要开启#Transparent属性)
int nIndex

uo_nav.theme.of_SetBkgndStyle(Enums.TRANSPARENT)
//去掉边框
uo_nav.theme.of_SetBorderStyle(Enums.BS_NONE)
//设置按钮图标大小
uo_nav.theme.of_SetIconSize(24,24 /* 24dip x 24dip */)
//去掉按钮与边框的间距
uo_nav.theme.of_SetBorderMargin(0,0,0,0)

/* 添加导航工具栏按钮 */
//添加无文本的按钮
nIndex = uo_nav.of_AddButton("","res\images\home.svg{fill:#888}" /* 使用SVG图标,资源协议见pfw.demos.pbl::res对象里的说明 */,"主页")
//绑定tag(后面将通过tag来访问按钮)
uo_nav.of_SetTag(nIndex,"home")
nIndex = uo_nav.of_AddButton("","res\images\backward.svg{fill:#888}","转到上一页")
uo_nav.of_SetTag(nIndex,"backward")
nIndex = uo_nav.of_AddButton("","res\images\forward.svg{fill:#888}","转到下一页")
uo_nav.of_SetTag(nIndex,"forward")

/* 设置地址栏主题 */
//设置默认文本
sle_url.of_SetDefaultText("输入网址")
//设置图标大小
sle_url.theme.of_SetIconSize(16,16 /* 16dip x 16dip */)
//右侧显示图标
sle_url.theme.of_SetIconPosition(Enums.RIGHT)
//设置默认图标
sle_url.of_SetImage(IMG_RELOAD)
//开启鼠标提示(提示文本由#TipText属性设置)
sle_url.of_SetToolTipStyle(Enums.TTS_NORMAL)

/* 设置搜索栏主题 */
sle_search.of_SetDefaultText("百度搜索")
sle_search.theme.of_SetIconSize(16,16)
sle_search.theme.of_SetIconPosition(Enums.RIGHT)
sle_search.of_SetImage("res\images\search.svg{fill:#888}")
sle_search.of_SetToolTipStyle(Enums.TTS_NORMAL)

/* 设置地址导航栏布局 */
uo_nav_container.#LockUpdate = true

//去掉最外层的间距
uo_nav_container.theme.of_SetBorderMargin(4,4,4,4)

//使用模版生成布局(见pfw.demos.pbl::u_cst_tabpage_control_splitcontainer:of_TemplateLayout模版语法和规则说明)
uo_nav_container.of_TemplateBegin("nav url search")
uo_nav_container.of_TemplateBind(uo_nav,"nav")
uo_nav_container.of_TemplateBind(sle_url,"url")
uo_nav_container.of_TemplateBind(sle_search,"search")
uo_nav_container.of_TemplateEnd()

//进一步调整大小和其它细节

//导航工具栏面板
if IsSucceeded(uo_nav_container.of_FindPanelByObject(uo_nav,ref panel)) then
	//设置宽度
	panel.of_SetSize(100 /* 100dip */)
	//禁止容器的拆分条拖动
	panel.#ParentSplitContainer.#SplitBarDragable = false
	//去掉拆分条宽度
	panel.#ParentSplitContainer.of_SetSplitBarSize(0)
end if
//地址栏面板
if IsSucceeded(uo_nav_container.of_FindPanelByObject(sle_url,ref panel)) then
	//设置宽度
	panel.of_SetSize(0.8 /* 占可用空间的80% */)
	//设置最小宽度
	panel.of_SetMinSize(200 /* 200dip */)
end if
//搜索栏面板
if IsSucceeded(uo_nav_container.of_FindPanelByObject(sle_search,ref panel)) then
	//允许被折叠
	panel.of_SetCollapsible(true)
	//设置最小宽度
	panel.of_SetMinSize(40 /* 40dip */)
end if

//提交布局
uo_nav_container.#LockUpdate = false
uo_nav_container.of_UpdatePoints()

end event

type uo_nav from ue_cst_toolbarstrip within u_cst_tabpage_webview_browser_page
event destroy ( )
integer x = 37
integer y = 8
integer width = 649
integer height = 100
integer taborder = 40
end type

on uo_nav.destroy
call ue_cst_toolbarstrip::destroy
end on

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_TRANSPARENT
		//设置透明背景色
		color = ARGB(255,255,255,255)
end choose
end event

event onbuttonclicked;call super::onbuttonclicked;int nIndex

//根据按钮tag判断点击的按钮
choose case of_GetTag(index)
	case "home"			//加载主页
		of_LoadUrl(HOME_URL)
	case "backward"	//转到上一页
		of_Backward()
	case "forward"		//转到下一页
		of_Forward()
end choose
end event

event onthememgrnotify;//overrided
Boolean bLockUpdate

bLockUpdate = #LockUpdate
#LockUpdate = true

if colorChanged then
	theme.of_SetBkgndColorStyle(ThemeManager().#ColorStyle)
end if

if styleChanged then
	choose case ThemeManager().#Style
		case n_cst_thememanager.WIN8
			theme.of_SetItemBkgndStyle(Enums.SOLID)
			theme.of_SetItemBorderStyle(Enums.BS_SOLID)
		case n_cst_thememanager.WIN7
			theme.of_SetItemBkgndStyle(Enums.VISTAORIGINAL)
			theme.of_SetItemBorderStyle(Enums.BS_ROUND)
		case n_cst_thememanager.XP
			theme.of_SetItemBkgndStyle(Enums.XP)
			theme.of_SetItemBorderStyle(Enums.BS_ROUND)
		case n_cst_thememanager.QQ
			theme.of_SetItemBkgndStyle(Enums.XP)
			theme.of_SetItemBorderStyle(Enums.BS_ROUND)
	end choose
end if

#LockUpdate = bLockUpdate
if styleChanged then
	of_UpdatePoints()
else
	of_Redraw(true)
end if
end event

type sle_url from se_cst_singlelineedit within u_cst_tabpage_webview_browser_page
event onchar pbm_char
integer x = 699
integer y = 16
integer width = 914
integer height = 84
integer taborder = 20
string text = ""
boolean #imagebutton = true
string #tiptext = "地址"
end type

event onchar;//将按钮状态设置为[go]
if tag <> "go" then
	tag = "go"
	sle_url.of_SetImage(IMG_GO)
end if
end event

event losefocus;call super::losefocus;int nIndex

//当前如果是[go]状态(编辑了地址栏),则刷新按钮状态
if tag = "go" then
	if of_IsLoading() then	//加载状态
		tag = "stop"
		sle_url.of_SetImage(IMG_STOP)
	else									//正常状态
		tag = ""
		sle_url.of_SetImage(IMG_RELOAD)
	end if
end if

end event

event onimageclicked;call super::onimageclicked;int nIndex
string sTitle

//判断按钮状态
if tag = "go" then			//编辑了地址栏,加载这个地址
	if text = "" then return
	of_LoadUrl(text)
elseif tag = "stop" then	//当前正在加载,取消加载
	//取消加载
	of_StopLoading()
else
	//刷新
	of_Reload()
end if
end event

event onkeydown;call super::onkeydown;int nIndex

if key <> KeyEnter! then return

//回车键处理

if text = "" then return

//加载当前地址
of_LoadUrl(text)
end event

type sle_search from se_cst_singlelineedit within u_cst_tabpage_webview_browser_page
integer x = 1650
integer y = 16
integer width = 466
integer height = 84
integer taborder = 20
string text = ""
boolean #imagebutton = true
string #tiptext = "百度搜索"
end type

event onimageclicked;call super::onimageclicked;n_uribuilder uriBuilder

if text = "" then return

//使用URI Builder构建url
uriBuilder = Create n_uribuilder

of_LoadUrl(uriBuilder.SetHost("https://www.baidu.com").AddPath("baidu").AddQuery("wd",text).Serialize())

Destroy uriBuilder
end event

event onkeydown;call super::onkeydown;if key <> KeyEnter! then return
Event OnImageClicked()
end event

type uo_webview from u_cst_webview within u_cst_tabpage_webview_browser_page
integer y = 152
integer width = 2167
integer height = 896
integer taborder = 20
end type

on uo_webview.destroy
call u_cst_webview::destroy
end on

event oncreateview;call super::oncreateview;any aRetVal
u_cst_tabpage_webview_browser_page newPage

//分发订阅事件(事件订阅机制见:pfw.pbl::w_test_eventful示例)
aRetVal = _eventful.of_Trigger("onCreateView",parent,url)
if IsNull(aRetVal) then return 0
newPage = aRetVal

return newPage.of_GetWebViewHandle()
end event

event ontitlechanged;call super::ontitlechanged;//获取到页面标题
int nIndex
string sTitle

//获取标签index
nIndex = of_GetTabIndex()

//修正标题
sTitle = newTitle
if Len(sTitle) > 15 then
	sTitle = Left(sTitle,15) + ".."
end if

//设置标签文本
#ParentTabControl.of_SetText(nIndex,sTitle)
//绑定文本到tag(用于在地址栏点[Stop]时恢复标题)
#ParentTabControl.of_SetTag(nIndex,sTitle)
//标签提示文本显示为完整标题
#ParentTabControl.of_SetTipText(nIndex,newTitle)
end event

event onurlchanged;call super::onurlchanged;//页面URL被改变（重定向之类的）

sle_url.text = url

//刷新导航按钮状态
uo_nav.of_Enable(uo_nav.of_GetIndexByTag("backward"),of_CanBackward())
uo_nav.of_Enable(uo_nav.of_GetIndexByTag("forward"),of_CanForward())
end event

event onfaviconchanged;call super::onfaviconchanged;//获取到页面[Favicon]

//设置标签图标
choose case Right(url,3)
	case "ico","png","gif"
		//使用[data]资源协议从内存加载图标（见pfw.demos.pbl::res对象下的资源协议说明）
		#ParentTabControl.of_SetImage(of_GetTabIndex(),"data:" + Right(url,3) +";" + Base64Encode(data))
end choose
end event

event onloading;call super::onloading;//页面正在加载
int nIndex

//获取标签index
nIndex = of_GetTabIndex()

//开启标签动画
#ParentTabControl.of_UseAnimatedImage(nIndex,true)
//设置标签文本
#ParentTabControl.of_SetText(nIndex,"正在加载..")

//刷新地址栏按钮状态
sle_url.tag = "stop"
sle_url.of_SetImage(IMG_STOP)

//刷新导航按钮状态
uo_nav.of_Enable(uo_nav.of_GetIndexByTag("backward"),of_CanBackward())
uo_nav.of_Enable(uo_nav.of_GetIndexByTag("forward"),of_CanForward())
end event

event onnavigationend;call super::onnavigationend;//页面加载完成
int nIndex
string sTitle

//取标签index
nIndex = of_GetTabIndex()
//关闭标签动画
#ParentTabControl.of_UseAnimatedImage(nIndex,false)
//设置标签标题
sTitle = of_GetTitle()
if sTitle = "" then sTitle = "新建标签"
#ParentTabControl.of_SetText(nIndex,sTitle)

//刷新地址栏按钮状态
if sle_url.tag = "stop" then
	sle_url.tag = ""
	sle_url.of_SetImage(IMG_RELOAD)
end if

//刷新导航按钮状态
uo_nav.of_Enable(uo_nav.of_GetIndexByTag("backward"),of_CanBackward())
uo_nav.of_Enable(uo_nav.of_GetIndexByTag("forward"),of_CanForward())
end event

type uo_nav_container from ue_cst_splitcontainer within u_cst_tabpage_webview_browser_page
event destroy ( )
integer width = 2144
integer height = 140
integer taborder = 10
end type

on uo_nav_container.destroy
call ue_cst_splitcontainer::destroy
end on

