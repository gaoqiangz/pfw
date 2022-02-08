$PBExportHeader$u_cst_tabpage_blink_browser.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_blink_browser from ue_cst_tabpage
end type
type sle_search from se_cst_singlelineedit within u_cst_tabpage_blink_browser
end type
type sle_url from se_cst_singlelineedit within u_cst_tabpage_blink_browser
end type
type uo_nav from ue_cst_toolbarstrip within u_cst_tabpage_blink_browser
end type
type uo_nav_container from ue_cst_splitcontainer within u_cst_tabpage_blink_browser
end type
type uo_tab from ue_cst_tabcontrol within u_cst_tabpage_blink_browser
end type
end forward

global type u_cst_tabpage_blink_browser from ue_cst_tabpage
integer width = 2149
integer height = 1296
event onpagetitlereceived ( u_cst_tabpage_blink_browser_page page,  string newtitle )
event onpagedocumentready ( u_cst_tabpage_blink_browser_page page )
event type u_cst_tabpage_blink_browser_page onpagecreateview ( u_cst_tabpage_blink_browser_page page,  string url )
event onpageurlchanged ( u_cst_tabpage_blink_browser_page page,  string url )
event onpagefaviconreceived ( u_cst_tabpage_blink_browser_page page,  string url,  blob data )
event onpageloadingfinish ( u_cst_tabpage_blink_browser_page page,  string url,  long result,  string failedreason )
sle_search sle_search
sle_url sle_url
uo_nav uo_nav
uo_nav_container uo_nav_container
uo_tab uo_tab
end type
global u_cst_tabpage_blink_browser u_cst_tabpage_blink_browser

type variables
private:
constant string HOME_URL	= "http://www.baidu.com"
constant string IMG_GO		= "res\images\forward.svg{fill:rgb(23,160,93)}"
constant string IMG_RELOAD = "res\images\reload.svg{fill:#888}"
constant string IMG_STOP	= "res\images\close.svg{fill:rgb(222,83,71)}"
end variables

forward prototypes
public function u_cst_tabpage_blink_browser_page of_loadnew (readonly string url)
end prototypes

event onpagetitlereceived(u_cst_tabpage_blink_browser_page page, string newtitle);//*由标签触发的事件
//获取到页面标题
int nIndex
string sTitle

//获取标签index
nIndex = uo_tab.of_GetIndex(page)

//修正标题
sTitle = newTitle
if Len(sTitle) > 15 then
	sTitle = Left(sTitle,15) + ".."
end if

//设置标签文本
uo_tab.of_SetText(nIndex,sTitle)
//绑定文本到tag(用于在地址栏点[Stop]时恢复标题)
uo_tab.of_SetTag(nIndex,sTitle)
//标签提示文本显示为完整标题
uo_tab.of_SetTipText(nIndex,newTitle)
end event

event onpagedocumentready(u_cst_tabpage_blink_browser_page page);//*由标签触发的事件
//页面加载完成（DOM加载完成）
int nIndex
/*
//取标签index
nIndex = uo_tab.of_GetIndex(page)
//关闭标签动画
uo_tab.of_UseAnimatedImage(nIndex,false)
//没有标题的标签显示为[新建标签]
if page.of_GetTitle() <> "" /* 可能为NULL */ then
else
	uo_tab.of_SetText(nIndex,"新建标签")
end if

//刷新地址栏按钮状态
if sle_url.tag = "stop" then
	sle_url.tag = ""
	sle_url.of_SetImage(IMG_RELOAD)
end if

//刷新导航按钮状态
uo_nav.of_Enable(uo_nav.of_GetIndexByTag("backward"),page.of_CanBackward())
uo_nav.of_Enable(uo_nav.of_GetIndexByTag("forward"),page.of_CanForward())*/
end event

event type u_cst_tabpage_blink_browser_page onpagecreateview(u_cst_tabpage_blink_browser_page page, string url);//*由标签触发的事件
//请求创建blink页面（如点击了一个<a>链接）
return of_LoadNew(url)
end event

event onpageurlchanged(u_cst_tabpage_blink_browser_page page, string url);//*由标签触发的事件
//页面URL被改变（重定向之类的）
int nIndex

//获取标签index
nIndex = uo_tab.of_GetIndex(page)
//只有当前标签才更新地址栏
if uo_tab.of_GetSelectedIndex() = nIndex then
	sle_url.text = url
end if

//开启标签动画
uo_tab.of_UseAnimatedImage(nIndex,true)
//设置标签文本
uo_tab.of_SetText(nIndex,"正在连接..")

//刷新地址栏按钮状态
sle_url.tag = "stop"
sle_url.of_SetImage(IMG_STOP)

//刷新导航按钮状态
uo_nav.of_Enable(uo_nav.of_GetIndexByTag("backward"),page.of_CanBackward())
uo_nav.of_Enable(uo_nav.of_GetIndexByTag("forward"),page.of_CanForward())
end event

event onpagefaviconreceived(u_cst_tabpage_blink_browser_page page, string url, blob data);//*由标签触发的事件
//获取到页面[Favicon]
int nIndex

//获取标签index
nIndex = uo_tab.of_GetIndex(page)

//设置标签图标
choose case Right(url,3)
	case "ico","png","gif"
		//使用[data]资源协议从内存加载图标（见pfw.demos.pbl::res对象下的资源协议说明）
		uo_tab.of_SetImage(nIndex,"data:" + Right(url,3) +";" + Base64Encode(data))
end choose
end event

event onpageloadingfinish(u_cst_tabpage_blink_browser_page page, string url, long result, string failedreason);//*由标签触发的事件
//页面加载完成
int nIndex
string sTitle

//取标签index
nIndex = uo_tab.of_GetIndex(page)
//关闭标签动画
uo_tab.of_UseAnimatedImage(nIndex,false)
//设置标签标题
choose case result
	case Enums.BLINK_LOADING_FAILED
		uo_tab.of_SetText(nIndex,"加载失败")
	case Enums.BLINK_LOADING_CANCELED
		//恢复标签标题
		sTitle = uo_tab.of_GetTag(nIndex)
		if sTitle = "" then sTitle = "新标签页"
		uo_tab.of_SetText(nIndex,sTitle)
	case else
		//没有标题的标签显示为[新建标签]
		if page.of_GetTitle() <> "" /* 可能为NULL */ then
		else
			uo_tab.of_SetText(nIndex,"新建标签")
		end if
end choose

//刷新地址栏按钮状态
if sle_url.tag = "stop" then
	sle_url.tag = ""
	sle_url.of_SetImage(IMG_RELOAD)
end if

//刷新导航按钮状态
uo_nav.of_Enable(uo_nav.of_GetIndexByTag("backward"),page.of_CanBackward())
uo_nav.of_Enable(uo_nav.of_GetIndexByTag("forward"),page.of_CanForward())
end event

public function u_cst_tabpage_blink_browser_page of_loadnew (readonly string url);int nIndex
u_cst_tabpage_blink_browser_page page

//创建页面标签
nIndex = uo_tab.of_AddPageWithParm(ref page,url /* OnOpen:[parm] */,"正在连接..","")
//设置动画图标
uo_tab.of_SetAnimatedImage(nIndex,Res.AM_S_WAITING_APNG)	//*该图像为APNG格式!
//设置为当前标签
uo_tab.of_Select(nIndex)

//禁止关闭第一个标签
if nIndex = 1 then
	uo_tab.of_Lock(nIndex,true)
end if

//订阅页面事件(事件订阅机制见:pfw.pbl::w_test_eventful示例)
page.of_On("onTitleReceived",this,"onPageTitleReceived")
page.of_On("onFaviconReceived",this,"onPageFaviconReceived")
page.of_On("onDocumentReady",this,"onPageDocumentReady")
page.of_On("onLoadingFinish",this,"onPageLoadingFinish")
page.of_On("onUrlChanged",this,"onPageUrlChanged")
page.of_On("onCreateView",this,"onPageCreateView")

return page
end function

on u_cst_tabpage_blink_browser.create
int iCurrent
call super::create
this.sle_search=create sle_search
this.sle_url=create sle_url
this.uo_nav=create uo_nav
this.uo_nav_container=create uo_nav_container
this.uo_tab=create uo_tab
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_search
this.Control[iCurrent+2]=this.sle_url
this.Control[iCurrent+3]=this.uo_nav
this.Control[iCurrent+4]=this.uo_nav_container
this.Control[iCurrent+5]=this.uo_tab
end on

on u_cst_tabpage_blink_browser.destroy
call super::destroy
destroy(this.sle_search)
destroy(this.sle_url)
destroy(this.uo_nav)
destroy(this.uo_nav_container)
destroy(this.uo_tab)
end on

event onpreopen;call super::onpreopen;int nIndex
n_cst_splitcontainer_panel panel

/* 设置TAB主题 */
//去掉内容区域边框
uo_tab.theme.of_SetBorderStyle(Enums.BS_NONE)
//去掉标签导航栏边框
uo_tab.theme.of_SetTabStripBorderStyle(Enums.BS_NONE)
//设置标签关闭按钮显示方式
uo_tab.theme.of_SetTabCloseButton(uo_tab.theme.TBC_SELECTED + uo_tab.theme.TBC_MOUSEOVER /* 选中和鼠标下的标签显示关闭按钮 */)
//固定标签的最小大小
uo_tab.theme.of_SetFixedSize(true)
//设置标签的最小大小
uo_tab.theme.of_SetItemMinSize(150 /* 150dip */)
//设置标签导航栏高度
uo_tab.theme.of_SetTabStripSize(30 /* 30dip */)
//显示标签下拉列表按钮
uo_tab.theme.of_SetTabListButton(true)

/* 设置工具栏主题 */
//设置背景为透明(要开启#Transparent属性)
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
uo_nav_container.theme.of_SetBorderMargin(0,0,0,0)

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

//*将导航容器放在tab内
win32.SetParent(uo_nav_container.#Handle,uo_tab.#Handle)
end event

event resize;call super::resize;uo_tab.Move(0,0)
uo_tab.Resize(newWidth,newHeight)

uo_nav_container.Move(D2UY(2),D2UY(2))
uo_nav_container.Resize(uo_tab.width - D2UY(4),uo_nav_container.height)
end event

event onopen;call super::onopen;//加载主页
of_LoadNew("about:blank")//HOME_URL)
end event

event onclose;call super::onclose;//*主动关闭所有标签来释放资源,避免可能的由释放顺序造成的异常
uo_tab.of_RemoveAll(true /* 强制关闭,不触发CloseQuery事件 */)
end event

type sle_search from se_cst_singlelineedit within u_cst_tabpage_blink_browser
integer x = 1650
integer y = 16
integer width = 466
integer height = 84
integer taborder = 50
string text = ""
boolean #imagebutton = true
string #tiptext = "百度搜索"
end type

event onimageclicked;call super::onimageclicked;n_uribuilder uriBuilder

if text = "" then return

//使用URI Builder构建url
uriBuilder = Create n_uribuilder

of_LoadNew(uriBuilder.SetHost("https://www.baidu.com").AddPath("baidu").AddQuery("wd",text).Serialize())

Destroy uriBuilder
end event

event onkeydown;call super::onkeydown;if key <> KeyEnter! then return
Event OnImageClicked()
end event

type sle_url from se_cst_singlelineedit within u_cst_tabpage_blink_browser
event onchar pbm_char
integer x = 699
integer y = 16
integer width = 914
integer height = 84
integer taborder = 40
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

event onimageclicked;call super::onimageclicked;int nIndex
string sTitle
u_cst_tabpage_blink_browser_page page

//获取当前标签对象
nIndex = uo_tab.of_GetSelectedIndex()
if nIndex <= 0 then return
if IsFailed(uo_tab.of_GetPage(nIndex,ref page)) then return

//判断按钮状态
if tag = "go" then			//编辑了地址栏,加载这个地址
	if text = "" then return
	page.of_LoadUrl(text)
elseif tag = "stop" then	//当前正在加载,取消加载
	//取消加载
	page.of_StopLoading()
else
	//刷新
	page.of_Reload()
end if
end event

event onkeydown;call super::onkeydown;int nIndex
u_cst_tabpage_blink_browser_page page

if key <> KeyEnter! then return

//回车键处理

if text = "" then return

//获取当前标签对象
nIndex = uo_tab.of_GetSelectedIndex()
if nIndex <= 0 then return
if IsFailed(uo_tab.of_GetPage(nIndex,ref page)) then return

//加载当前地址
page.of_LoadUrl(text)
end event

event losefocus;call super::losefocus;int nIndex
u_cst_tabpage_blink_browser_page page

//当前如果是[go]状态(编辑了地址栏),则刷新按钮状态
if tag = "go" then
	//获取当前标签对象
	nIndex = uo_tab.of_GetSelectedIndex()
	if nIndex <= 0 then return
	if IsFailed(uo_tab.of_GetPage(nIndex,ref page)) then return
	if page.of_IsLoading() then	//加载状态
		tag = "stop"
		sle_url.of_SetImage(IMG_STOP)
	else									//正常状态
		tag = ""
		sle_url.of_SetImage(IMG_RELOAD)
	end if
end if

end event

type uo_nav from ue_cst_toolbarstrip within u_cst_tabpage_blink_browser
integer x = 37
integer y = 8
integer width = 649
integer height = 100
integer taborder = 30
end type

event onbuttonclicked;call super::onbuttonclicked;int nIndex
u_cst_tabpage_blink_browser_page page

//获取当前标签对象
nIndex = uo_tab.of_GetSelectedIndex()
if nIndex <= 0 then return
if IsFailed(uo_tab.of_GetPage(nIndex,ref page)) then return

//根据按钮tag判断点击的按钮
choose case of_GetTag(index)
	case "home"			//加载主页
		page.of_LoadUrl(HOME_URL)
	case "backward"	//转到上一页
		page.of_Backward()
	case "forward"		//转到下一页
		page.of_Forward()
end choose
end event

on uo_nav.destroy
call ue_cst_toolbarstrip::destroy
end on

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

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_TRANSPARENT
		//设置透明背景色
		color = ARGB(255,255,255,255)
end choose
end event

type uo_nav_container from ue_cst_splitcontainer within u_cst_tabpage_blink_browser
integer width = 2144
integer height = 112
integer taborder = 20
end type

on uo_nav_container.destroy
call ue_cst_splitcontainer::destroy
end on

type uo_tab from ue_cst_tabcontrol within u_cst_tabpage_blink_browser
integer width = 2144
integer height = 1284
integer taborder = 20
boolean #autoscroll = true
boolean #allowtabdrag = true
boolean #dragthumbnail = true
end type

on uo_tab.destroy
call ue_cst_tabcontrol::destroy
end on

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_TABSTRIPBKGND
		color = ARGB(255,255,255,255)
end choose
end event

event onobjectreposition;call super::onobjectreposition;//使标签页高度偏移导航栏区域(工具栏是所有标签共享的)
newY += U2DY(uo_nav_container.height) + 4
newHeight -= U2DY(uo_nav_container.height) + 4
end event

event ontabselectionchanged;call super::ontabselectionchanged;u_cst_tabpage_blink_browser_page page

//同步当前标签的状态
if IsSucceeded(of_GetPage(newIndex,ref page)) then
	//同步地址
	sle_url.text = page.of_GetUrl()
	//刷新地址栏按钮状态
	if sle_url.tag <> "go" then
		if page.of_IsLoading() then
			sle_url.tag = "stop"
			sle_url.of_SetImage(IMG_STOP)
		else
			sle_url.tag = ""
			sle_url.of_SetImage(IMG_RELOAD)
		end if
	end if
	//刷新导航栏按钮状态
	uo_nav.of_Enable(uo_nav.of_GetIndexByTag("backward"),page.of_CanBackward())
	uo_nav.of_Enable(uo_nav.of_GetIndexByTag("forward"),page.of_CanForward())
end if
end event

