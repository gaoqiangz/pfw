$PBExportHeader$u_cst_tabpage_webview_browser.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_webview_browser from ue_cst_tabpage
end type
type uo_tab from ue_cst_tabcontrol within u_cst_tabpage_webview_browser
end type
end forward

global type u_cst_tabpage_webview_browser from ue_cst_tabpage
integer width = 2149
integer height = 1296
event type u_cst_tabpage_webview_browser_page onpagecreateview ( u_cst_tabpage_webview_browser_page page,  string url )
uo_tab uo_tab
end type
global u_cst_tabpage_webview_browser u_cst_tabpage_webview_browser

type variables
private:
constant string HOME_URL	= "http://www.baidu.com"
end variables

forward prototypes
public function u_cst_tabpage_webview_browser_page of_loadnew (readonly string url)
end prototypes

event type u_cst_tabpage_webview_browser_page onpagecreateview(u_cst_tabpage_webview_browser_page page, string url);//*由标签触发的事件
//请求创建webview页面（如点击了一个<a>链接）
return of_LoadNew(url)
end event

public function u_cst_tabpage_webview_browser_page of_loadnew (readonly string url);int nIndex
u_cst_tabpage_webview_browser_page page

//创建页面标签
nIndex = uo_tab.of_AddPageWithParm(ref page,url /* OnOpen:[parm] */,"正在加载..","")
//设置动画图标
uo_tab.of_SetAnimatedImage(nIndex,Res.AM_S_WAITING_APNG)	//*该图像为APNG格式!
//设置为当前标签
uo_tab.of_Select(nIndex)

//禁止关闭第一个标签
if nIndex = 1 then
	uo_tab.of_Lock(nIndex,true)
end if

//订阅页面事件(事件订阅机制见:pfw.pbl::w_test_eventful示例)
page.of_On("onCreateView",this,"onPageCreateView")

return page
end function

on u_cst_tabpage_webview_browser.create
int iCurrent
call super::create
this.uo_tab=create uo_tab
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_tab
end on

on u_cst_tabpage_webview_browser.destroy
call super::destroy
destroy(this.uo_tab)
end on

event onpreopen;call super::onpreopen;/* 设置TAB主题 */
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

end event

event resize;call super::resize;uo_tab.Move(0,0)
uo_tab.Resize(newWidth,newHeight)
end event

event onopen;call super::onopen;//加载主页
of_LoadNew(HOME_URL)
end event

event onclose;call super::onclose;//*主动关闭所有标签来释放资源,避免可能的由释放顺序造成的异常
uo_tab.of_RemoveAll(true /* 强制关闭,不触发CloseQuery事件 */)
end event

type uo_tab from ue_cst_tabcontrol within u_cst_tabpage_webview_browser
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

