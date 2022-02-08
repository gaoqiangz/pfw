$PBExportHeader$w_demo.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type w_demo from se_cst_window
end type
type uo_tabcontrol from ue_cst_tabcontrol within w_demo
end type
type uo_ribbonbar from ue_cst_ribbonbar within w_demo
end type
type sciterclock from n_sciter within w_demo
end type
end forward

global type w_demo from se_cst_window
integer width = 3579
integer height = 2164
string title = "PowerFramework Demo"
windowstate windowstate = maximized!
string icon = "res\logoicon.ico"
boolean clientedge = false
boolean #extendframeintoclient = true
event type long ontrayiconnotify ( long wparam,  long lparam )
uo_tabcontrol uo_tabcontrol
uo_ribbonbar uo_ribbonbar
sciterclock sciterclock
end type
global w_demo w_demo

type prototypes

end prototypes

type variables
Private:
pm_skin	in_skinMenu
pm_color in_colorMenu
n_qrcode in_qrcode
n_trayicon in_trayicon
n_cst_sciter_traynotification _trayNotification

long _tiid

boolean ib_ribbonbar_trackMouseSelect

windowstate _lastWindowState = Normal!

//Item indexes
int ii_skinIndex
int ii_aboutIndex
int ii_copyRightIndex
int ii_timeIndex
//Classes
Constant String CLS_MENU_SKIN								= "pm_skin"
Constant String CLS_MENU_COLOR							= "pm_color"
Constant String CLS_TABFLOAT_WINDOW					= "we_cst_tabfloat"
Constant String CLS_PAGE_CONTROL_TOOLBARSTRIP 	= "u_cst_tabpage_control_toolbarstrip"
Constant String CLS_PAGE_CONTROL_BUTTONLISTBAR 	= "u_cst_tabpage_control_buttonlistbar"
Constant String CLS_PAGE_CONTROL_SHORTCUTBAR	= "u_cst_tabpage_control_shortcutbar"
Constant String CLS_PAGE_CONTROL_TABCONTROL		= "u_cst_tabpage_control_tabcontrol"
Constant String CLS_PAGE_CONTROL_TASKPANELBAR 	= "u_cst_tabpage_control_taskpanelbar"
Constant String CLS_PAGE_CONTROL_SPLITCONTAINER = "u_cst_tabpage_control_splitcontainer"
Constant String CLS_PAGE_SCITER_TREEVIEW 			= "u_cst_tabpage_sciter_treeview"
Constant String CLS_PAGE_SCITER_SIDEBAR 			= "u_cst_tabpage_sciter_sidebar"
Constant String CLS_PAGE_SCITER_BROWSER 			= "u_cst_tabpage_sciter_browser"
Constant String CLS_PAGE_SCITER_CHARTS 				= "u_cst_tabpage_sciter_charts"
Constant String CLS_PAGE_SCITER_PRINTING 				= "u_cst_tabpage_sciter_printing"
Constant String CLS_PAGE_SCITER_VSPAGE	 			= "u_cst_tabpage_sciter_vspage"
Constant String CLS_PAGE_SCITER_TEST					= "u_cst_tabpage_sciter_test"
Constant String CLS_PAGE_BLINK_BROWSER 			= "u_cst_tabpage_blink_browser"
Constant String CLS_PAGE_BLINK_CHARTS 			= "u_cst_tabpage_blink_charts"
Constant String CLS_PAGE_UTILITY_HTTPCLIENT			= "u_cst_tabpage_utility_httpclient"
Constant String CLS_PAGE_UTILITY_ALIPAY					= "u_cst_tabpage_utility_alipay"
Constant String CLS_PAGE_UTILITY_WXPAY				= "u_cst_tabpage_utility_wxpay"
Constant String CLS_PAGE_UTILITY_CRYPTO				= "u_cst_tabpage_utility_crypto"
//Messages
Constant Long NM_TRAYICON_NOTIFY = WinMsg.WM_APP + 100
end variables
forward prototypes
public subroutine wf_setthemestyle (readonly unsignedinteger style)
public function pm_color wf_getcolormenu ()
public function pm_skin wf_getskinmenu ()
public subroutine wf_setthemecolorstyle (readonly unsignedlong style)
public subroutine wf_showballoontip (readonly string tiptext)
end prototypes

event type long ontrayiconnotify(long wparam, long lparam);//托盘图标的通知消息
choose case LoWord(lparam)
	case WinMsg.WM_LBUTTONDOWN
		//鼠标左键图标
		Win32.SwitchToThisWindow(#Handle,true)
	case WinMsg.WM_RBUTTONUP
		//鼠标右键图标
		ne_cst_popupmenu lm_menu
		POINTF pt
		
		Painter.GetCursorPos(ref pt)
		//使当前线程为前台线程以接收鼠标和键盘消息(因为当前进程可能并不是用户当前操作的前台进程)
		Win32.SetForegroundWindow(#Handle)
		
		lm_menu = Create ne_cst_popupmenu
		
		lm_menu.of_AddMenu("打开","","前台显示窗口")
		lm_menu.of_AddSeparator()
		lm_menu.of_AddMenu("关闭","","关闭窗口")
		
		choose case lm_menu.of_Popup(pt.x,pt.y)
			case 1
				Win32.SwitchToThisWindow(#Handle,true)
			case 3
				Post Close(this)
		end choose
		
		Destroy lm_menu
end choose
return 0
end event

public subroutine wf_setthemestyle (readonly unsignedinteger style);if ThemeManager().#Style = Style then return

#LockUpdate = true
uo_ribbonbar.#LockUpdate = true
uo_tabcontrol.#LockUpdate = true

ThemeManager().of_SetStyle(Style)

#LockUpdate = false
wf_UpdatePoints()
uo_ribbonbar.#LockUpdate = false
uo_ribbonbar.of_UpdateParentBkgnd(false)
uo_ribbonbar.of_UpdatePoints()
uo_tabcontrol.#LockUpdate = false
uo_tabcontrol.of_UpdatePoints()

wf_ShowBalloonTip("主题风格已变更")
end subroutine

public function pm_color wf_getcolormenu ();return in_colorMenu
end function

public function pm_skin wf_getskinmenu ();return in_skinMenu
end function

public subroutine wf_setthemecolorstyle (readonly unsignedlong style);if ThemeManager().#ColorStyle = style then return

#LockUpdate = true
uo_ribbonbar.#LockUpdate = true
uo_tabcontrol.#LockUpdate = true

ThemeManager().of_SetColorStyle(Style)

#LockUpdate = false
wf_Redraw(true)
uo_ribbonbar.#LockUpdate = false
uo_ribbonbar.of_UpdateParentBkgnd(false)
uo_ribbonbar.of_Redraw(true,true)
uo_tabcontrol.#LockUpdate = false
uo_tabcontrol.of_Redraw(true)

wf_ShowBalloonTip("主题颜色已变更")
end subroutine

public subroutine wf_showballoontip (readonly string tiptext);in_trayicon.ShowBalloonTip(#Handle,_tiid,Information!,pfwVersion(),tipText)
_trayNotification.of_Notify(Title,tipText,Information!)
end subroutine

on w_demo.create
int iCurrent
call super::create
this.uo_tabcontrol=create uo_tabcontrol
this.uo_ribbonbar=create uo_ribbonbar
this.sciterclock=create sciterclock
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_tabcontrol
this.Control[iCurrent+2]=this.uo_ribbonbar
end on

on w_demo.destroy
call super::destroy
destroy(this.uo_tabcontrol)
destroy(this.uo_ribbonbar)
destroy(this.sciterclock)
end on

event close;call super::close;//*主动关闭所有标签来释放资源,避免可能的由释放顺序造成的异常
uo_tabcontrol.of_RemoveAll(true /* 强制关闭,不触发CloseQuery事件 */)

//关闭Sciter时钟窗口
SciterClock.Close()

Destroy in_qrcode

in_trayicon.RemoveIcon(#Handle,_tiid)
Destroy in_trayicon

Destroy _trayNotification

end event

event onbuttonclicked;call super::onbuttonclicked;//子项左键单击后触发
if objectType = WOT_STATUSBAR then
	choose case index
		case ii_copyRightIndex
			OpenWithParm(w_about,this)
	end choose
else
	choose case index
		case ii_aboutIndex
			OpenWithParm(w_about,this)
	end choose
end if
end event

event onthemechanged;call super::onthemechanged;if CaptionBar.of_IsFlashing(ii_skinIndex) then
	CaptionBar.of_Flash(ii_skinIndex,0)
end if
end event

event ongetitemcolor;//Override
//获取子项某一颜色值时触发
if objectType <> WOT_STATUSBAR then
	choose case colorFlag
		case theme.CLR_BKGND 		//背景色
			choose case index
				case CaptionBar.IDX_CLOSE
					if BitTest(state,Enums.STATE_PRESSED) then		//鼠标按下
						color = ARGB(255,243,116,103)
					elseif BitTest(state,Enums.STATE_HOVER) then	//鼠标盘旋
						color = ARGB(192,243,116,103)
					else
						color = ARGB(128,243,116,103)					//默认
					end if
				case CaptionBar.IDX_MAX, CaptionBar.IDX_MINI
					if BitTest(state,Enums.STATE_PRESSED) then		//鼠标按下
						color = ARGB(255,159,199,255)
					elseif BitTest(state,Enums.STATE_HOVER) then	//鼠标盘旋
						color = ARGB(128,159,199,255)
					end if
				case ii_skinIndex
					if BitTest(state,Enums.STATE_PRESSED) then		//鼠标按下
						color = ARGB(255,250,192,141)
					elseif BitTest(state,Enums.STATE_HOVER) then	//鼠标盘旋
						color = ARGB(128,250,192,141)
					end if
				case ii_aboutIndex
					if BitTest(state,Enums.STATE_PRESSED) then		//鼠标按下
						color = ARGB(255,159,199,255)
					elseif BitTest(state,Enums.STATE_HOVER) then	//鼠标盘旋
						color = ARGB(255,250,192,141)
					else
						color = ARGB(255,159,199,255)					//默认
					end if
			end choose
	end choose
end if
end event

event oniconchanged;call super::oniconchanged;//当窗口[Icon]属性改变后触发
CaptionBar.of_SetIcon(Res.ICO_XXL_LOGO)

return 0
end event

event ontimer;call super::ontimer;if ii_timeIndex > 0 then
	return IsSucceeded(StatusBar.of_settext(ii_timeIndex,string(today(),"yyyy-mm-dd hh:mm:ss")))
end if

return true
end event

event resize;call super::resize;real nWidth,nHeight
ulong hdwp
RECTF cliRect

if WindowState = Minimized! or _lastWindowState = Minimized! then
	_lastWindowState = WindowState
	return 0
end if
_lastWindowState = WindowState

wf_GetClientRect(ref cliRect,true)

nWidth = cliRect.right - cliRect.left
nHeight = cliRect.bottom - cliRect.top

hdwp = Win32.BeginDeferWindowPos(2)

//RibbonBar
Win32.DeferWindowPos(hdwp,&
							uo_ribbonbar.#Handle,&
							0,&
							D2PX(cliRect.left),/*x*/&
							D2PY(theme.Font.#WordSize.cy + 8),/*y*/&
							D2PX(nWidth),/*cx*/&
							U2PY(uo_ribbonbar.Height),/*cy*/&
							Win32.SWP_NOZORDER + Win32.SWP_NOACTIVATE)

//TabControl
Win32.DeferWindowPos(hdwp,&
							uo_tabcontrol.#Handle,&
							0,&
							D2PX(cliRect.left),/*x*/&
							D2PY(cliRect.top),/*y*/&
							D2PX(nWidth),/*cx*/&
							D2PY(nHeight),/*cy*/&
							Win32.SWP_NOZORDER + Win32.SWP_NOACTIVATE)

Win32.EndDeferWindowPos(hdwp)

return 0
end event

event onpreopen;call super::onpreopen;int nNewIndex

//锁住窗口更新
#LockUpdate = true

//--- 初始化窗口主题 ---
//开启窗口的状态栏
theme.of_SetStatusBar(true)
//设置状态栏高度(px)
theme.of_SetStatusBarHeight(30)
//设置窗口图标的大小(px)
theme.of_SetIconSize(64,64)
//设置窗口图标
CaptionBar.of_SetIcon(Res.ICO_XXL_LOGO)
//设置标题对齐方式
theme.of_SetTitleAlign(Center!)
//设置标题栏高度
theme.of_SetTitleBarHeight(theme.Font.#WordSize.cy + 8 + U2DY(uo_ribbonbar.height) + 4)

//--- 添加窗口标题栏按钮 ---
ii_skinIndex = CaptionBar.of_AddMenuButton(CLS_MENU_SKIN,"皮肤",Res.ICO_S_SKIN,"皮肤",right!)
CaptionBar.of_GetPopupMenu(ii_skinIndex,ref in_skinmenu)
ii_aboutIndex = CaptionBar.of_AddButton("About",Res.ICO_S_ABOUT,"About",right!)

//--- 添加窗口状态栏按钮 ---
StatusBar.of_AddIcon(Res.ICO_S_USER,left!)
ii_copyRightIndex = StatusBar.of_AddLink("Powered by 金千枝（深圳）软件技术有限公司",left!)
ii_timeIndex = StatusBar.of_AddLabel(string(today(),"yyyy-mm-dd hh:mm:ss"),right!)
nNewIndex = StatusBar.of_AddIcon(Res.AM_S_TIME,right!)
StatusBar.of_AddSeparator(right!)
StatusBar.of_AddLabel(pfwVersion(),right!)

//*该图像为APNG格式!
StatusBar.of_SetAnimatedImage(nNewIndex,Res.AM_S_TIME)
StatusBar.of_UseAnimatedImage(nNewIndex,true)

#LockUpdate = false
wf_UpdatePoints()

//设置RibbonBar菜单的主题
//将标签栏的有效区域的左侧向右移动主窗口的图标宽度
uo_ribbonbar.theme.of_SetTabStripOffset(theme.#IconSize.cx,0,0,0)

//创建托盘图标
in_trayicon = Create n_trayicon
_tiid = in_trayicon.AddIcon(#Handle,Res.ICO_S_LOGO,pfwVersion(),NM_TRAYICON_NOTIFY)

//创建Sciter托盘提示
_trayNotification = Create n_cst_sciter_traynotification

//创建Sciter时钟窗口
SciterClock.CreateWindow(Enums.SC_WS_POPUP + Enums.SC_WS_ALPHA + Enums.SC_WS_TOOL,this)
//监听Sciter事件(脚本调用)
SciterClock.AttachEvent(Enums.SC_HANDLE_INVOKE_METHOD)
//加载资源文件
SciterClock.LoadFile(Res.SCITER_HTML_CLOCK)

//初始化QQ群链接二维码
in_qrcode = Create n_qrcode
in_qrcode.SetUnit(Enums.QRCODE_UNIT_DIP)
in_qrcode.SetSize(150)
in_qrcode.SetLogo(Res.ICO_XXL_LOGO)
in_qrcode.SetLogoBkgnd(true,ARGB(240,255,255,255))
in_qrcode.SetLogoBorder(true)
in_qrcode.Encode("http://qm.qq.com/cgi-bin/qm/qr?k=eIBS6egtmq2MLUWIIcdQhQBvTCLi2fwJ#")
end event

event open;call super::open;//wf_HighLight(ii_skinIndex,true)
CaptionBar.of_Flash(ii_skinIndex,-1)

if ii_timeIndex > 0 then
	wf_Timer(1)
end if
end event

event onpostopen;call super::onpostopen;RECTF rcScreen
real nSCWnd,nSCHeight

//将Sciter时钟显示在屏幕右下角
Painter.GetScreenWorkArea(ref rcScreen)
SciterClock.GetSize(ref nSCWnd,ref nSCHeight)
SciterClock.Move(rcScreen.right - nSCWnd,rcScreen.bottom - nSCHeight)
SciterClock.Show()

//显示气泡提示
wf_ShowBalloonTip("欢迎使用PowerFramework!")
end event

event other;call super::other;choose case Message.Number
	case NM_TRAYICON_NOTIFY
		return Event OnTrayIconNotify(wparam,lparam)
end choose
end event

type uo_tabcontrol from ue_cst_tabcontrol within w_demo
event type long onpaint ( unsignedlong hdc )
integer x = 5
integer y = 504
integer width = 3534
integer height = 1536
integer taborder = 20
boolean bringtotop = true
boolean #allowtabdrag = true
boolean #dragthumbnail = true
end type

event type long onpaint(unsignedlong hdc);real fQRSize
n_cst_font font
POINTF pt
RECTF cliRect,rcText

Painter.GetClientRect(#Handle,ref cliRect)

Painter.FillRect( hdc, cliRect.left,cliRect.top,cliRect.right,cliRect.bottom,&
				ARGB(255,255,255,255),  ARGB(255,255,255,255),Enums.VERT,false,false,0)

if IsValid(in_qrcode) then
	Painter.GetClientRect(#Handle,ref cliRect)
	fQRSize = in_qrcode.GetSize()
	pt.x = cliRect.right - fQRSize - 100
	pt.y = cliRect.bottom - fQRSize - 100
	in_qrcode.Draw( hdc, pt.x, pt.y)
	font = Create n_cst_font
	font.of_SetSize(12) //pt
	rcText.left = pt.x
	rcText.right = pt.x + fQRSize
	rcText.top = pt.y + fQRSize + 2
	rcText.bottom = rcText.top + font.#WordSize.cy + 2
	Painter.DrawText(hdc,font.#Handle,"PFW技术分享交流",rcText,ARGB(255,51,153,255),false,Painter.DT_SINGLELINE + Painter.DT_CENTER)
	Destroy font
end if

return 1
end event

on uo_tabcontrol.destroy
call ue_cst_tabcontrol::destroy
end on

event constructor;call super::constructor;this.#LockUpdate = true
theme.of_SetTabPosition(TabsOnTop!)
theme.of_SetTabCloseButton(theme.TBC_SHOW)
theme.of_SetTabListButton(true)
this.#LockUpdate = false
of_UpdatePoints()
end event

event ontabselectionchanged;call super::ontabselectionchanged;//标签选中状态改变后触发

end event

event ontabclosed;call super::ontabclosed;//标签关闭后触发

end event

event ontabopened;call super::ontabopened;//标签打开后触发
wf_ShowBalloonTip("打开标签[" + of_GetText(index) + "]")
end event

event ontabselectionchanging;call super::ontabselectionchanging;//标签选中状态改变时触发
return 0
end event

event ontabdragdrop;call super::ontabdragdrop;//标签拖拽结束时触发
RECTF wndRect,cliRect

Painter.GetWindowRect(#Handle,ref wndRect)
Painter.GetClientRect(#Handle,ref cliRect)
Painter.ClientToScreen(#Handle,ref cliRect)

wf_ShowBalloonTip("停止拖动标签[" + of_GetText(index) + "]")

if Painter.PtInRect(ref cliRect,xpos,ypos) or Not Painter.PtInRect(ref wndRect,xpos,ypos)then
	of_Float(index,xpos,ypos,CLS_TABFLOAT_WINDOW)
end if
end event

event ontabdoubleclicked;call super::ontabdoubleclicked;//双击标签后触发
of_Remove(index)
end event

event ontabrightclicked;call super::ontabrightclicked;//标签右键单击后触发
int i
int nFirstVisible,nLastVisible,nPrevVisible,nNextVisible
long rtCode
ne_cst_popupmenu lm_popup
RECTF wndRect
//Menu item IDs
Constant Uint MID_CLOSE 			= 100
Constant Uint MID_CLOSEALL 		= 101
Constant Uint MID_CLOSEOTHER 	= 102
Constant Uint MID_CLOSELEFT 		= 103
Constant Uint MID_CLOSERIGHT 	= 104
Constant Uint MID_MOVETOFIRST	= 105
Constant Uint MID_MOVETOPREV	= 106
Constant Uint MID_MOVETONEXT	= 107
Constant Uint MID_MOVETOLAST 	= 108
Constant Uint MID_FLOAT			= 109
Constant Uint MID_LOCK				= 110

//of_Select(index)

for i = 1 to of_GetCount()
	if i = index then continue
	if of_IsVisible(i) and Not of_IsFloated(i) then
		if i < index then
			if nFirstVisible = 0 then
				nFirstVisible = i
			end if
			nPrevVisible = i
		else
			if nNextVisible = 0 then
				nNextVisible = i
			end if
			nLastVisible = i
		end if
	end if
next

lm_popup = Create ne_cst_popupmenu
lm_popup.theme.of_SetTheme(theme)

lm_popup.of_AddMenu("关闭",Res.ICO_S_TAB_CLOSE,Not of_IsLocked(index),MID_CLOSE)
lm_popup.of_AddMenu("关闭所有标签","",(Not of_IsLocked(index) or of_GetCount() > 1),MID_CLOSEALL)
lm_popup.of_AddMenu("除此之外全部关闭","",of_GetCount() > 1,MID_CLOSEOTHER)
if theme.#TabPosition = TabsOnTop! or theme.#TabPosition = TabsOnBottom! then
	lm_popup.of_AddMenu("关闭左侧标签","",index > 1,MID_CLOSELEFT)
	lm_popup.of_AddMenu("关闭右侧标签","",index < of_GetCount(),MID_CLOSERIGHT)
else
	lm_popup.of_AddMenu("关闭上侧标签","",index > 1,MID_CLOSELEFT)
	lm_popup.of_AddMenu("关闭下侧标签","",index < of_GetCount(),MID_CLOSERIGHT)
end if
lm_popup.of_AddSeparator()
lm_popup.of_AddMenu("移动至首位","VCRFirst!",nFirstVisible > 0,MID_MOVETOFIRST)
lm_popup.of_AddMenu("向前移动","VCRPrior!",nPrevVisible > 0,MID_MOVETOPREV)
lm_popup.of_AddMenu("向后移动","VCRNext!",nNextVisible > 0,MID_MOVETONEXT)
lm_popup.of_AddMenu("移动至末位","VCRLast!",nLastVisible > 0,MID_MOVETOLAST)
lm_popup.of_AddSeparator()
lm_popup.of_AddMenu("浮动",Res.ICO_S_TAB_FLOAT,MID_FLOAT)
if Not of_IsLocked(index) then
	lm_popup.of_AddMenu("锁住标签",Res.ICO_S_TAB_LOCK,MID_LOCK)
else
	lm_popup.of_AddMenu("解锁标签",Res.ICO_S_TAB_UNLOCK,MID_LOCK)
end if

Painter.GetWindowRect(#Handle,ref wndRect)

rtCode = lm_popup.of_Popup(wndRect.left + xpos,wndRect.top + ypos)

choose case rtCode
	case MID_CLOSE
		of_Remove(index)
	case MID_CLOSEALL
		for i =  of_GetCount() to 1 Step -1
			if IsFailed(of_Remove(i)) then
				of_Select(i)
				goto _Exit_
			end if
		next
	case MID_CLOSEOTHER
		for i =  of_GetCount() to index + 1 Step -1
			if IsFailed(of_Remove(i)) then goto _Exit_
		next
		for i = index - 1 to 1 Step -1
			if IsFailed(of_Remove(i)) then goto _Exit_
		next
	case MID_CLOSELEFT
		for i = index - 1 to 1 Step -1
			if IsFailed(of_Remove(i)) then goto _Exit_
		next
	case MID_CLOSERIGHT
		for i =  of_GetCount() to index + 1 Step -1
			if IsFailed(of_Remove(i)) then goto _Exit_
		next
	case MID_MOVETOFIRST
		of_Move(index,nFirstVisible)
	case MID_MOVETOPREV
		of_Move(index,nPrevVisible)
	case MID_MOVETONEXT
		of_Move(index,nNextVisible)
	case MID_MOVETOLAST
		of_Move(index,nLastVisible)
	case MID_FLOAT
		of_Float(index,CLS_TABFLOAT_WINDOW)
	case MID_LOCK
		of_Lock(index,Not of_IsLocked(index))
end choose

_Exit_:

Destroy lm_popup

return
end event

event ontabdocked;call super::ontabdocked;//标签停靠后触发
of_Select(index)

wf_ShowBalloonTip("标签[" + of_GetText(index) + "]停靠")
end event

event ontabclosing;call super::ontabclosing;wf_ShowBalloonTip("关闭标签[" + of_GetText(index) + "]")
return 0
end event

event ontabfloated;call super::ontabfloated;wf_ShowBalloonTip("标签[" + of_GetText(index) + "]浮动")
end event

event ontabbegindrag;call super::ontabbegindrag;wf_ShowBalloonTip("开始拖动标签[" + of_GetText(index) + "]")
return 0
end event

type uo_ribbonbar from ue_cst_ribbonbar within w_demo
event type unsignedlong ongetwindowrgn ( real newwidth,  real newheight )
integer x = 5
integer width = 3534
integer height = 480
integer taborder = 20
boolean bringtotop = true
boolean #transparent = true
end type

event type unsignedlong ongetwindowrgn(real newwidth, real newheight);//设置控件的显示区域
ulong hRgnWnd
ulong hRgnExclude

hRgnWnd = Painter.CreateRectRgn(0,0,newWidth,newHeight)
hRgnExclude = Painter.CreateRectRgn(0,0,theme.#TabStripOffset.left,theme.#TabStripSize - 1)

Painter.CombineRgn(hRgnWnd,hRgnWnd,hRgnExclude,Painter.RGN_DIFF)

Painter.DeleteRgn(hRgnExclude)

return hRgnWnd
end event

event constructor;call super::constructor;n_cst_ribbonbar_category category
n_cst_ribbonbar_panel	panel
n_cst_ribbonbar_button	button
n_cst_ribbonbar_label label

#LockUpdate = true

//---设置主题--
//将标签栏边框间距
theme.of_SetTabStripBorderMargin(2,0,2,0)
//去掉标签栏的边框
theme.of_SetTabStripBorderStyle(Enums.BS_NONE)
//将标签栏背景设置为透明
theme.of_SetTabStripBkgndStyle(Enums.TRANSPARENT)
//设置标签栏高度(px)
theme.of_SetTabStripSize(30)

//UI Controls
//添加Category(标签)
category = of_AddCategory("控件",Res.ICO_L_BUTTONLISTBAR)
//添加Panel
panel = category.of_AddPanel("PowerFramework Controls",Res.ICO_L_BUTTONLISTBAR)
//禁止Panel被折叠
panel.of_SetAlwaysItemMode(true)
//添加按钮
button = panel.of_AddButton("ToolBarStrip",Res.ICO_L_TOOLBARSTRIP,Res.ICO_L_TOOLBARSTRIP,"ToolBarStrip~n" + CLS_PAGE_CONTROL_TOOLBARSTRIP)
//绑定类名(在OnItemClicked中使用)
button.#Tag = CLS_PAGE_CONTROL_TOOLBARSTRIP
//按钮始终最大化显示
button.of_SetAlwaysLargeMode(true)
button = panel.of_AddButton("ButtonListBar",Res.ICO_L_BUTTONLISTBAR,Res.ICO_L_BUTTONLISTBAR,"ButtonListBar~n" + CLS_PAGE_CONTROL_BUTTONLISTBAR)
button.#Tag = CLS_PAGE_CONTROL_BUTTONLISTBAR
button.of_SetAlwaysLargeMode(true)
button = panel.of_AddButton("ShortCutBar",Res.ICO_L_SHORTCUTBAR,Res.ICO_L_SHORTCUTBAR,"ShortCutBar~n" + CLS_PAGE_CONTROL_SHORTCUTBAR)
button.#Tag = CLS_PAGE_CONTROL_SHORTCUTBAR
button.of_SetAlwaysLargeMode(true)
button = panel.of_AddButton("TabControl",Res.ICO_L_TABCONTROL,Res.ICO_L_TABCONTROL,"TabControl~n" + CLS_PAGE_CONTROL_TABCONTROL)
button.#Tag = CLS_PAGE_CONTROL_TABCONTROL
button.of_SetAlwaysLargeMode(true)
button = panel.of_AddButton("TaskPanelBar",Res.ICO_L_TASKPANELBAR,Res.ICO_L_TASKPANELBAR,"TaskPanelBar~n" + CLS_PAGE_CONTROL_TASKPANELBAR)
button.#Tag = CLS_PAGE_CONTROL_TASKPANELBAR
button.of_SetAlwaysLargeMode(true)
button = panel.of_AddButton("SplitContainer",Res.ICO_L_SPLITCONTAINER,Res.ICO_L_SPLITCONTAINER,"SplitContainer~n" + CLS_PAGE_CONTROL_SPLITCONTAINER)
button.#Tag = CLS_PAGE_CONTROL_SPLITCONTAINER
button.of_SetAlwaysLargeMode(true)
button = panel.of_AddButton("TreeView",Res.ICO_L_TREEVIEW,Res.ICO_L_TREEVIEW,"TreeView~n" + CLS_PAGE_SCITER_TREEVIEW)
button.#Tag = CLS_PAGE_SCITER_TREEVIEW
button.of_SetAlwaysLargeMode(true)
button = panel.of_AddButton("Sidebar",Res.ICO_L_TREEVIEW,Res.ICO_L_TREEVIEW,"Sidebar~n" + CLS_PAGE_SCITER_SIDEBAR)
button.#Tag = CLS_PAGE_SCITER_SIDEBAR
button.of_SetAlwaysLargeMode(true)
//添加Panel
panel = category.of_AddPanel("Sciter",Res.ICO_L_SCITER)
button = panel.of_AddButton("Browser",Res.ICO_S_SCITER,Res.ICO_L_SCITER,"Sciter浏览器~n用于加载Sciter页面~n" + CLS_PAGE_SCITER_BROWSER)
button.#Tag = CLS_PAGE_SCITER_BROWSER
button = panel.of_AddButton("Charts",Res.ICO_S_CHART,Res.ICO_L_CHART,"Sciter简易图表~n" + CLS_PAGE_SCITER_CHARTS)
button.#Tag = CLS_PAGE_SCITER_CHARTS
button = panel.of_AddButton("Printing",Res.ICO_S_PRINTING,Res.ICO_L_PRINTING,"Sciter打印预览~n" + CLS_PAGE_SCITER_PRINTING)
button.#Tag = CLS_PAGE_SCITER_PRINTING
button = panel.of_AddButton("VS Page",Res.ICO_S_VSPAGE,Res.ICO_L_VSPAGE,"Sciter仿Visual Studio起始页面~n" + CLS_PAGE_SCITER_VSPAGE)
button.#Tag = CLS_PAGE_SCITER_VSPAGE
panel.of_AddSeparator()
button = panel.of_AddButton("Test",Res.ICO_S_SCITER,Res.ICO_L_SCITER,"Sciter交互示例~n" + CLS_PAGE_SCITER_TEST)
button.#Tag = CLS_PAGE_SCITER_TEST
button.of_SetTextAlign(Center!)
//添加Panel
panel = category.of_AddPanel("Blink",Res.ICO_L_SCITER)
button = panel.of_AddButton("Browser",Res.ICO_S_SCITER,Res.ICO_L_SCITER,"Blink浏览器~n用于加载Web页面~n" + CLS_PAGE_BLINK_BROWSER)
button.#Tag = CLS_PAGE_BLINK_BROWSER
button = panel.of_AddButton("Charts",Res.ICO_S_CHART,Res.ICO_L_CHART,"ECharts图表~n" + CLS_PAGE_BLINK_CHARTS)
button.#Tag = CLS_PAGE_BLINK_CHARTS
//添加Panel
panel = category.of_AddPanel("Utility",Res.ICO_L_TOOL)
button = panel.of_AddButton("HttpClient",Res.ICO_L_TOOL,Res.ICO_L_TOOL,"HttpClient~n" + CLS_PAGE_UTILITY_HTTPCLIENT)
button.#Tag = CLS_PAGE_UTILITY_HTTPCLIENT
panel.of_AddSeparator()
button = panel.of_AddButton("Alipay",Res.ICO_S_ALIPAY,Res.ICO_L_ALIPAY,"HttpClient支付宝支付接口示例~n" + CLS_PAGE_UTILITY_ALIPAY)
button.#Tag = CLS_PAGE_UTILITY_ALIPAY
button = panel.of_AddButton("WxPay",Res.ICO_S_WXPAY,Res.ICO_L_WXPAY,"HttpClient微信支付接口示例~n" + CLS_PAGE_UTILITY_WXPAY)
button.#Tag = CLS_PAGE_UTILITY_WXPAY
panel.of_AddSeparator()
button = panel.of_AddButton("Crypto",Res.ICO_L_TOOL,Res.ICO_L_TOOL,"密码算法工具类~n" + CLS_PAGE_UTILITY_CRYPTO)
button.#Tag = CLS_PAGE_UTILITY_CRYPTO
//Skin category
category = of_AddCategory("主题",Res.ICO_S_SKIN)
panel = category.of_AddPanel("",Res.ICO_L_TOOL)
panel.of_SetAlwaysItemMode(true)
//--设置Panel不同显示状态下的子项横纵间距(px)
//最大化状态
panel.of_SetLargeItemMargin(8,1)
//中间状态
panel.of_SetIntermediateItemMargin(4,1)
//最小状态
panel.of_SetCompactItemMargin(1,1)
button = panel.of_AddMenuButton(CLS_MENU_COLOR,"颜色",Res.ICO_S_CLASSIC,Res.ICO_L_CLASSIC,"主题颜色")
button.of_GetPopupMenu(ref in_colorMenu)
button.of_SetAlwaysLargeMode(true)
panel.of_AddRadiobox("XP",false,"XP风格")
panel.of_AddRadiobox("Vista",false,"Vista风格")
panel.of_AddRadiobox("Win8",true,"Win8风格")
panel.of_AddRadiobox("QQ",false,"QQ风格")
//Other panel
panel = category.of_AddPanel("其他",Res.ICO_L_TOOL)
panel.of_SetLargeItemMargin(8,1)
panel.of_SetIntermediateItemMargin(4,1)
panel.of_SetCompactItemMargin(1,1)
panel.of_AddLabel("导航栏:")
panel.of_AddRadiobox("左侧",false,"左侧")
panel.of_AddRadiobox("上侧",true,"上侧")
panel.of_AddLabel("	")
panel.of_AddRadiobox("右侧",false,"右侧")
panel.of_AddRadiobox("下侧",false,"下侧")
panel.of_AddSeparator()
panel.of_AddLabel("布局:")
panel.of_AddCheckbox("显示导航栏",true,"显示标签导航栏")
panel.of_AddCheckbox("显示状态栏",true,"显示窗口状态栏")
panel.of_AddSeparator()
panel.of_AddLabel("菜单栏:")
panel.of_AddCheckbox("自动选择标签",false,"自动选择鼠标下的标签")

//About
category = of_AddCategory("关于",Res.ICO_S_ABOUT)
panel = category.of_AddPanel(" ","")
panel.of_SetAlwaysItemMode(true)
panel.of_SetLargeItemMargin(2,2)
panel.of_SetIntermediateItemMargin(2,2)
panel.of_SetCompactItemMargin(2,2)
panel.of_AddLabel("    邮箱：gaoqiangz@msn.com")
panel.of_AddLabel("       QQ：8509799")
panel.of_AddLabel("      Q群：303560219")
panel = category.of_AddPanel(" ","")
panel.of_SetAlwaysItemMode(true)
panel.of_SetLargeItemMargin(0,0)
panel.of_SetIntermediateItemMargin(0,0)
panel.of_SetCompactItemMargin(0,0)
//显示Panel的[Launch]按钮
panel.of_SetLaunchButton(true)
//设置[Launch]按钮的提示文本
panel.#LaunchTipText = "关于"
label = panel.of_AddLabel("特别说明:"+&
						"~nPowerFramework可以免费使用,没有任何限制!"+&
						"~n同时也提供付费技术支持,如有需要请联系作者.")
label.#Tag = "TAG_NOTICE"	//设置#Tag(在OnGetItemColor中使用)
label.of_SetMultiLine(true)
label.Font.of_SetSize(8)
//换列
panel.of_AddBreak()
panel.of_AddIcon(Res.IMG_POWERED,104,26)

#LockUpdate = false
of_UpdatePoints()
end event

on uo_ribbonbar.destroy
call ue_cst_ribbonbar::destroy
end on

event onthemechanged;call super::onthemechanged;choose case eventflag
	case theme.EVT_BKGNDCOLORSTYLE
		n_cst_ribbonbar_category category
		n_cst_ribbonbar_panel	panel
		n_cst_ribbonbar_button button
		
		if IsSucceeded(uo_ribbonbar.of_GetCategory(2,ref category)) then
			if IsSucceeded(category.of_GetPanel(1,ref panel)) then
				if IsSucceeded(panel.of_GetItem(1,ref button)) then
					choose case ThemeManager().#ColorStyle
						case n_cst_thememanager.CLASSIC
							button.of_SetImage(Res.ICO_S_CLASSIC,Res.ICO_L_CLASSIC)
						case n_cst_thememanager.BLUE
							button.of_SetImage(Res.ICO_S_BLUE,Res.ICO_L_BLUE)
						case n_cst_thememanager.SILVER
							button.of_SetImage(Res.ICO_S_SILVER,Res.ICO_L_SILVER)
						case n_cst_thememanager.OLIVE
							button.of_SetImage(Res.ICO_S_OLIVE,Res.ICO_L_OLIVE)
						case n_cst_thememanager.PURPLE
							button.of_SetImage(Res.ICO_S_PURPLE,Res.ICO_L_PURPLE)
						case n_cst_thememanager.GOLD
							button.of_SetImage(Res.ICO_S_GOLD,Res.ICO_L_GOLD)
					end choose
				end if
			end if
		end if
	case theme.EVT_RIBBONCOLLAPSED
		if theme.#RibbonCollapsed then
			Parent.theme.of_SetTitleBarHeight(Parent.theme.Font.#WordSize.cy + 8 + U2DY(uo_ribbonbar.height) - 1)
		else
			Parent.theme.of_SetTitleBarHeight(Parent.theme.Font.#WordSize.cy + 8 + U2DY(uo_ribbonbar.height) + 4)
		end if
		uo_ribbonbar.of_UpdateParentBkgnd(true)
end choose
end event

event onitemclicked;call super::onitemclicked;//子项左键单击后触发
int newObjIndex

choose case item.#Type
	case item.ITT_BUTTON
		n_cst_ribbonbar_button button
		button = item
		if button.#Tag = "" then return
		newObjIndex = uo_TabControl.of_GetIndexByClassName(button.#Tag)
		if newObjIndex < 1 then
			newObjIndex = uo_TabControl.of_AddObject(button.#Tag,button.#Text,button.#SmallImage,button.#TipText)
		end if
		if newObjIndex < 1 then
			MessageBoxEx("错误","打开标签失败!~n" + button.#Tag,StopSign!)
			return
		end if
end choose

uo_TabControl.of_Select(newObjIndex)
end event

event onitemchecked;call super::onitemchecked;//子项的单选/复选状态改变后触发
n_cst_ribbonbar_radiobox radiobox
n_cst_ribbonbar_checkbox checkbox

if item.#Type = item.ITT_RADIOBOX then
	radiobox = item
	choose case Upper(radiobox.#Text)
		case "XP"
			in_skinMenu.Event OnMenuSelected(in_skinMenu.MID_XP)
		case "VISTA"
			in_skinMenu.Event OnMenuSelected(in_skinMenu.MID_VISTA)
		case "WIN8"
			in_skinMenu.Event OnMenuSelected(in_skinMenu.MID_WIN8)
		case "QQ"
			in_skinMenu.Event OnMenuSelected(in_skinMenu.MID_QQ)
		case "左侧"
			in_skinMenu.Event OnMenuSelected(in_skinMenu.MID_LEFT)
		case "上侧"
			in_skinMenu.Event OnMenuSelected(in_skinMenu.MID_TOP)
		case "右侧"
			in_skinMenu.Event OnMenuSelected(in_skinMenu.MID_RIGHT)
		case "下侧"
			in_skinMenu.Event OnMenuSelected(in_skinMenu.MID_BOTTOM)
	end choose
elseif item.#Type = item.ITT_CHECKBOX then
	checkbox = item
	choose case lower(checkbox.#Text)
		case "显示导航栏"
			in_skinMenu.Event OnMenuSelected(in_skinMenu.MID_TABSTRIP)
		case "显示状态栏"
			in_skinMenu.Event OnMenuSelected(in_skinMenu.MID_STATUSBAR)
		case "自动选择标签"
			ib_ribbonbar_trackMouseSelect = Not ib_ribbonbar_trackMouseSelect
	end choose
end if
end event

event onnchittest;//Override
int index
long hitTestCode

hitTestCode = Super::Event OnNcHitTest(xpos,ypos)

if hitTestCode <> WinMsg.HTCLIENT then
	index = of_IndexFromPoint(xpos,ypos)
	if index = 0 then
		return WinMsg.HTTRANSPARENT
	else
		return hitTestCode
	end if
else
	return hitTestCode
end if
end event

event onlaunchbuttonclicked;call super::onlaunchbuttonclicked;//Panel的[Launch]按钮被点击后触发
parent.Event OnButtonClicked(ii_aboutIndex,WOT_TITLEBAR)
end event

event onpostconstructor;call super::onpostconstructor;int index
n_cst_ribbonbar_category category
n_cst_ribbonbar_panel panel
n_cst_ribbonbar_button button
n_cst_ribbonbar_toolbar rbtoolbar

//!删除此return语句加载RibbonBar更多控件看看!
return

if IsFailed(of_GetCategory(1,ref category)) then return

category.#LockUpdate = true

//Add button panel
panel = category.of_AddPanel("Buttons","Open!")
panel.#LaunchTipText = "buttons"
panel.#TipText = "buttons"
panel.of_SetIntermediateScaleOrder(4)
panel.of_SetCompactScaleOrder(4)
panel.of_SetCollapsedScaleOrder(4)
//panel.of_SetAlwaysItemMode(true)
panel.of_addbutton("Large button","Open!","Copy!","test tip").of_SetAlwaysLargeMode(true)
panel.of_addseparator()
panel.of_addmenubutton(in_skinMenu,"Menu button","Open!","Copy!","test tip")
panel.of_addsplitbutton(in_skinMenu,"Split button","Open!","Copy!","test tip")
//Add rbtoolbar panel
panel = category.of_AddPanel("rbtoolbar","Open!")
panel.#LaunchTipText = "rbtoolbar"
panel.#TipText = "rbtoolbar"
panel.of_SetIntermediateScaleOrder(2)
panel.of_SetCompactScaleOrder(2)
panel.of_SetCollapsedScaleOrder(1)
rbtoolbar = panel.of_addtoolbar()
rbtoolbar.of_SetTextUnderImage(true)
rbtoolbar.of_addbutton( "Open", "Open!", "test tip")
rbtoolbar.of_addbutton( "Save", "Save!", "test tip")
rbtoolbar.of_addseparator()
rbtoolbar.of_addmenubutton(in_skinMenu,"Dropdown button","Copy!","test tips")
rbtoolbar.of_addsplitbutton(in_skinMenu,"Split button","Copy!","test tips")
//	panel.of_addseparator()
rbtoolbar = panel.of_addtoolbar()
rbtoolbar.of_addbutton( "Open", "Open!", "test tip")
rbtoolbar.of_addbutton( "Save", "Save!", "test tip")
rbtoolbar.of_addseparator()
rbtoolbar.of_addmenubutton(in_skinMenu,"Dropdown button","Copy!","test tips")
rbtoolbar.of_addsplitbutton(in_skinMenu,"Split button","Copy!","test tips")

category.#LockUpdate = false
category.of_updatepoints()
end event

event ongetitemcolor;call super::ongetitemcolor;//获取子项某一颜色值时触发
if colorFlag = theme.CLR_TEXT then
	if item.#Tag = "TAG_NOTICE" then
		Color = ARGB(255,255,0,0)
	end if
end if
end event

event ontabmouseenter;call super::ontabmouseenter;//鼠标进入某一标签项时触发
if ib_ribbonbar_trackMouseSelect then
	of_Select(index)
end if
end event

event onpopupenteridle;call super::onpopupenteridle;//Category弹出状态时
//当鼠标进入非操作区域时触发
Event OnPopupIdle(popupType)
end event

event onpopupidle;call super::onpopupidle;//Category弹出状态时
//当鼠标在非操作区域盘旋时触发
int index
RECTF wndRect
POINTF pt

if Not ib_ribbonbar_trackMouseSelect then return
if popupType = 1 then return

Painter.GetWindowRect(#Handle,ref wndRect)
Painter.GetCursorPos(ref pt)
pt.x -= wndRect.left
pt.y -= wndRect.top

index = of_IndexFromPoint(pt.x,pt.y)
if index > 0 then
	of_Select(index)
else
	of_ExitPopupMode(0)
end if
end event

type sciterclock from n_sciter within w_demo descriptor "pb_nvo" = "true" 
end type

on sciterclock.create
call super::create
end on

on sciterclock.destroy
call super::destroy
end on

event oninvokemethod;call super::oninvokemethod;//响应脚本[view.architecture]调用,返回系统类型(这里直接返回32位)
if name = "architecture" then
	return 32
end if
end event

