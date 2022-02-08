$PBExportHeader$w_demo_special.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type w_demo_special from s_cst_window
end type
type uo_tabcontrol from u_cst_tabcontrol within w_demo_special
end type
type uo_ribbonbar from u_cst_ribbonbar within w_demo_special
end type
end forward

global type w_demo_special from s_cst_window
integer width = 3570
integer height = 2148
string icon = "res\logoicon.png"
boolean clientedge = false
boolean #extendframeintoclient = true
boolean #bordershadow = true
uo_tabcontrol uo_tabcontrol
uo_ribbonbar uo_ribbonbar
end type
global w_demo_special w_demo_special

type variables
n_cst_popupmenu	in_colorMenu

//Menu IDs
Constant Int ID_CLASSIC		= 100
Constant Int ID_BLUE			= 101
Constant Int ID_SILVER 		= 102
Constant Int ID_OLIVE 		= 103
Constant Int ID_PURPLE 		= 104
Constant Int ID_GOLD 		= 105
Constant Int ID_XP		 		= 106
Constant Int ID_VISTA 		= 107
Constant Int ID_WIN8	 		= 108
Constant Int ID_QQ	 		= 109
Constant Int ID_LEFT	 		= 110
Constant Int ID_TOP	 		= 111
Constant Int ID_RIGHT		= 112
Constant Int ID_BOTTOM		= 113
Constant Int ID_TABSTRIP 	= 114
Constant Int ID_STATUSBAR= 115
//Custom color styles
Constant Uint GOLD = theme.CUSTOM + 1
end variables

event onpreopen;call super::onpreopen;CaptionBar.of_SetIcon(Res.ICO_XXL_LOGO)

theme.Font.of_SetSize(14)
theme.of_SetBkgndColorStyle(ARGB(255,60,163,247))
theme.of_SetIconSize(64,64)	//Logo size(px)
theme.of_SetTitleAlign(Center!)
theme.of_SetStatusBar(true)
theme.of_SetStatusBarHeight(26)
theme.of_SetClientThemeBkgnd(true)
theme.of_SetBorderStyle(Enums.BS_NONE)
theme.of_SetBorderMargin(0,0,0,0)
theme.of_SetTitleBarHeight(theme.Font.#WordSize.cy + 8 + U2DY(uo_ribbonbar.height) + 4)

//--- 添加窗口状态栏按钮 ---
StatusBar.of_AddIcon(Res.ICO_S_USER,left!)
StatusBar.of_AddLink("Powered by 金千枝（深圳）软件技术有限公司",left!)
StatusBar.of_AddLabel(string(today(),"yyyy-mm-dd hh:mm:ss"),right!)
StatusBar.of_AddIcon(Res.AM_S_TIME,right!)
StatusBar.of_AddSeparator(right!)
StatusBar.of_AddLabel(pfwVersion(),right!)
end event

on w_demo_special.create
int iCurrent
call super::create
this.uo_tabcontrol=create uo_tabcontrol
this.uo_ribbonbar=create uo_ribbonbar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_tabcontrol
this.Control[iCurrent+2]=this.uo_ribbonbar
end on

on w_demo_special.destroy
call super::destroy
destroy(this.uo_tabcontrol)
destroy(this.uo_ribbonbar)
end on

event onncerasebkgnd;call super::onncerasebkgnd;RECTF wndRect
RECTF titleBarRect

Painter.GetWindowRect(#Handle,ref wndRect)
Painter.OffsetRect(ref wndRect,-wndRect.left,-wndRect.top)

Painter.FillRect( hdc, wndRect.left,wndRect.top,wndRect.right,wndRect.bottom,&
				ARGB(255,255,255,255),  ARGB(255,255,255,255),Enums.VERT,false,false,0)


titleBarRect = wndRect
titleBarRect.bottom 	= 70

Painter.ThemeFill( hdc, titleBarRect, theme.of_GetColor(theme.CLR_BKGND,0), Enums.VERT, theme.#BkgndStyle,0, false,Enums.BS_NONE,0,0)

return 1
end event

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_TITLE
		if BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,240,240,240)
		else
			color = ARGB(255,255,255,255)
		end if
end choose
end event

event resize;call super::resize;long nWidth,nHeight
ulong hdwp
RECTF cliRect

wf_GetClientRect(ref cliRect,true)

nWidth = D2PX(cliRect.right - cliRect.left)
nHeight = D2PY(cliRect.bottom - cliRect.top)

hdwp = Win32.BeginDeferWindowPos(2)

//RibbonBar
Win32.DeferWindowPos(hdwp,&
							uo_ribbonbar.#Handle,&
							0,&
							D2PX(cliRect.left) - 1,/*x*/&
							D2PY(theme.Font.#WordSize.cy + 8),/*y*/&
							nWidth + 2,/*cx*/&
							U2PY(uo_ribbonbar.Height),/*cy*/&
							Win32.SWP_NOZORDER + Win32.SWP_NOACTIVATE)

//TabControl
Win32.DeferWindowPos(hdwp,&
							uo_tabcontrol.#Handle,&
							0,&
							D2PX(cliRect.left) - 1,/*x*/&
							D2PY(cliRect.top),/*y*/&
							nWidth + 2,/*cx*/&
							nHeight,/*cy*/&
							Win32.SWP_NOZORDER + Win32.SWP_NOACTIVATE)

Win32.EndDeferWindowPos(hdwp)

return 0
end event

event onerasebkgnd;call super::onerasebkgnd;RECTF cliRect

Painter.GetClientRect(#Handle,ref cliRect)

Painter.FillRect( hdc, cliRect.left,cliRect.top,cliRect.right,cliRect.bottom,&
				ARGB(255,235,242,249),  ARGB(255,235,242,249),Enums.VERT,false,false,0)

return 1
end event

type uo_tabcontrol from u_cst_tabcontrol within w_demo_special
integer y = 552
integer width = 3534
integer height = 1488
integer taborder = 30
boolean bringtotop = true
long backcolor = 16777215
boolean #tooltip = true
boolean #allowtabdrag = true
boolean #dragthumbnail = true
boolean #smoothscroll = true
boolean #smoothdrag = true
boolean #smoothclose = true
end type

event constructor;call super::constructor;this.#LockUpdate = true
theme.of_SetTabPosition(TabsOnBottom!)
theme.of_SetTabCloseButton(theme.TBC_SHOW)
this.theme.of_SetBkgndColorStyle(ARGB(255,90,193,255))
this.#LockUpdate = false
of_UpdatePoints()
end event

event ontabselectionchanging;call super::ontabselectionchanging;//标签选中状态改变时触发
uo_TabControl.of_UseAnimatedImage(oldindex,false)
uo_TabControl.of_UseAnimatedImage(newindex,true)
return 0
end event

event ontabselectionchanged;call super::ontabselectionchanged;//标签选中状态改变后触发
int index
n_cst_ribbonbar_category category
n_cst_ribbonbar_panel	panel
n_cst_ribbonbar_button button

if IsSucceeded(uo_ribbonbar.of_GetCategory(1,ref category)) then
	if IsSucceeded(category.of_GetPanel(1,ref panel)) then
		for index = 1 to panel.of_GetCount()
			if IsSucceeded(panel.of_GetItem(index,ref button)) then
				if button.#Text = of_GetText(newIndex) then
					button.of_SetToggled(true)
				else
					button.of_SetToggled(false)
				end if
			end if
		next
	end if
end if
end event

event ontabclosed;call super::ontabclosed;//标签关闭后触发
int i
n_cst_ribbonbar_category category
n_cst_ribbonbar_panel	panel
n_cst_ribbonbar_button button

if of_GetCount() = 0 then
	if IsSucceeded(uo_ribbonbar.of_GetCategory(1,ref category)) then
		if IsSucceeded(category.of_GetPanel(1,ref panel)) then
			for i = 1 to panel.of_GetCount()
				if IsSucceeded(panel.of_GetItem(i,ref button)) then
					button.of_SetToggled(false)
				end if
			next
		end if
	end if
end if
end event

event OnTabDocked;call super::OnTabDocked;//标签停靠后触发
of_Select(index)
end event

event ontabdragdrop;call super::ontabdragdrop;//标签拖拽结束时触发
RECTF wndRect,cliRect

Painter.GetWindowRect(#Handle,ref wndRect)
Painter.GetClientRect(#Handle,ref cliRect)
Painter.ClientToScreen(#Handle,ref cliRect)

if Painter.PtInRect(ref cliRect,xpos,ypos) or Not Painter.PtInRect(ref wndRect,xpos,ypos)then
	of_Float(index,xpos,ypos)
end if
end event

event ontabdoubleclicked;call super::ontabdoubleclicked;//双击标签后触发
of_Remove(index)
end event

on uo_tabcontrol.destroy
call u_cst_tabcontrol::destroy
end on

event ongetitemcolor;call super::ongetitemcolor;if theme.#BkgndColorStyle <> GOLD then return

choose case colorFlag
	case theme.CLR_BKGND
		if BitTest(state,Enums.STATE_DRAGGING) then
			color = ARGB(100,230,214,195)
		elseif BitTest(state,Enums.STATE_SELECTED) then
			color = ARGB(255,230,214,195)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,250,234,215)
		elseif BitTest(state,Enums.STATE_HIGHLIGHTED) then
			color = ARGB(255,250,192,141)
		else
			color = ARGB(255,230,214,195)
		end if
	case theme.CLR_BORDER
		color = ARGB(255,210,194,175)
	case theme.CLR_CLOSE
		if BitTest(state,Enums.STATE_PRESSED) then
			color = ARGB(255,255,128,128)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,255,128,128)
		else
			color = ARGB(255,210,194,175)
		end if
	case theme.CLR_CLOSEBTNBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = ARGB(255,230,214,195)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,250,234,215)
		end if
end choose
end event

event ongetcolor;call super::ongetcolor;if theme.#BkgndColorStyle <> GOLD then return

choose case colorFlag
	case theme.CLR_BORDER
		color = ARGB(255,190,174,155)
	case theme.CLR_TEXT
		if BitTest(state,Enums.STATE_DISABLED) then
			color = ARGB(255,180,180,180)
		else
			color = ARGB(255,150,134,115)
		end if
	case theme.CLR_LINE
		if BitTest(state,Enums.STATE_DISABLED) then
			color = ARGB(255,180,180,180)
		else
			color = ARGB(255,190,174,155)
		end if
	case theme.CLR_ARROW
		if BitTest(state,Enums.STATE_DISABLED) then
			color = ARGB(255,180,180,180)
		else
			color = ARGB(255,190,174,155)
		end if
	case theme.CLR_TABSTRIPBKGND
		color = ARGB(255,230,214,195)
	case theme.CLR_CHEVRONBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = ARGB(255,230,214,195)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,250,234,215)
		end if
	case theme.CLR_SCROLLBARBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = ARGB(255,230,214,195)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,250,234,215)
		else
			color = ARGB(255,230,214,195)
		end if
	case theme.CLR_SCROLLBARBORDER
		color = ARGB(255,190,174,155)
end choose
end event

type uo_ribbonbar from u_cst_ribbonbar within w_demo_special
integer width = 3534
integer height = 528
integer taborder = 30
boolean #transparent = true
boolean #tooltip = true
boolean #smoothscroll = true
end type

event constructor;call super::constructor;in_colorMenu = create n_cst_popupmenu
in_colorMenu.theme.of_SetTheme(theme)
in_colorMenu.theme.of_SetIconSize(CaptionBar.#IconSize.cx,CaptionBar.#IconSize.cy)
in_colorMenu.of_AddMenu( "Classic",  Res.ICO_S_CLASSIC,"classic color", ID_CLASSIC)
in_colorMenu.of_AddMenu( "Blue", Res.ICO_S_BLUE,"blue color",  ID_BLUE)
in_colorMenu.of_AddMenu( "Silver",Res.ICO_S_SILVER,"silver color",  ID_SILVER)
in_colorMenu.of_AddMenu( "Olive",Res.ICO_S_OLIVE,"olive color",  ID_OLIVE)
in_colorMenu.of_AddMenu( "Purple",Res.ICO_S_PURPLE,"purple color",  ID_PURPLE)
in_colorMenu.of_AddMenu( "Gold",Res.ICO_S_GOLD,"gold color",  ID_GOLD)
in_colorMenu.of_CheckRadios( ID_CLASSIC, ID_GOLD, ID_CLASSIC, false, true)

n_cst_ribbonbar_category category
n_cst_ribbonbar_panel	panel
n_cst_ribbonbar_button	button

#LockUpdate = true

theme.of_SetTabStripBorderStyle(Enums.BS_NONE)
theme.of_SetTabStripBkgndStyle(Enums.TRANSPARENT)
theme.of_SetBkgndColorStyle(ARGB(255,90,193,255))
theme.of_SetTabStripSize(30)
theme.of_SetBorderShadow(true)
theme.of_SetTabStripOffset(64,0,0,0)

//UI Controls
category = of_AddCategory("控件",Res.ICO_L_BUTTONLISTBAR)
panel = category.of_AddPanel("PowerFramework Controls",Res.ICO_L_BUTTONLISTBAR)
panel.of_SetAlwaysItemMode(true)
button = panel.of_AddButton("ToolBarStrip",Res.ICO_L_TOOLBARSTRIP,Res.ICO_L_TOOLBARSTRIP,"ToolBarStrip")
button.of_SetAlwaysLargeMode(true)
button = panel.of_AddButton("ButtonListBar",Res.ICO_L_BUTTONLISTBAR,Res.ICO_L_BUTTONLISTBAR,"ButtonListBar")
button.of_SetAlwaysLargeMode(true)
button = panel.of_AddButton("ShortCutBar",Res.ICO_L_SHORTCUTBAR,Res.ICO_L_SHORTCUTBAR,"ShortCutBar")
button.of_SetAlwaysLargeMode(true)
button = panel.of_AddButton("TabControl",Res.ICO_L_TABCONTROL,Res.ICO_L_TABCONTROL,"TabControl")
button.of_SetAlwaysLargeMode(true)
button = panel.of_AddButton("TaskPanelBar",Res.ICO_L_TASKPANELBAR,Res.ICO_L_TASKPANELBAR,"TaskPanelBar")
button.of_SetAlwaysLargeMode(true)
button = panel.of_AddButton("SplitContainer",Res.ICO_L_SPLITCONTAINER,Res.ICO_L_SPLITCONTAINER,"SplitContainer")
button.of_SetAlwaysLargeMode(true)
//Skin category
category = of_AddCategory("主题",Res.ICO_S_SKIN)
panel = category.of_AddPanel("",Res.ICO_L_TOOL)
panel.of_SetAlwaysItemMode(true)
panel.of_SetLargeItemMargin(8,1)
panel.of_SetIntermediateItemMargin(4,1)
panel.of_SetCompactItemMargin(1,1)
button = panel.of_AddButton("颜色",Res.ICO_S_CLASSIC,Res.ICO_L_CLASSIC,"主题颜色")
button.of_SetAlwaysLargeMode(true)
button.of_SetStyle(Enums.BTS_DROPDOWN)
button.of_SetPopupMenu(in_colorMenu)
panel.of_addradiobox("XP",false,"xp style")
panel.of_addradiobox("Vista",false,"vista style")
panel.of_addradiobox("Win8",true,"win8 style")
panel.of_addradiobox("QQ",false,"QQ style")
//Other panel
panel = category.of_AddPanel("其他",Res.ICO_L_TOOL)
panel.of_SetLargeItemMargin(8,4)
panel.of_SetIntermediateItemMargin(4,4)
panel.of_SetCompactItemMargin(1,4)
panel.of_AddLabel("导航栏:")
panel.of_addradiobox("Left",false,"Left position")
panel.of_addradiobox("Top",false,"Top position")
panel.of_AddLabel("	")
panel.of_addradiobox("Right",false,"Right position")
panel.of_addradiobox("Bottom",true,"bottom position")
panel.of_AddSeparator()
panel.of_AddLabel("布局:")
panel.of_addcheckbox("显示导航栏",true,"Show tabstrip")
panel.of_addcheckbox("显示状态栏",true,"Show statusbar")

//About control
category = of_AddCategory("关于",Res.ICO_S_ABOUT)
panel = category.of_AddPanel("",Res.ICO_L_TOOL)
panel.of_SetAlwaysItemMode(true)
panel.of_SetLaunchButton(true)
panel.#LaunchTipText = "更多选项"
panel.of_SetLargeItemMargin(2,2)
panel.of_SetIntermediateItemMargin(2,2)
panel.of_SetCompactItemMargin(2,2)
panel.of_AddLabel("    邮箱：gaoqiangz@msn.com")
panel.of_AddLabel("       QQ：8509799")
panel.of_AddLabel("      Q群：303560219(新)").#Tag = "QQun"
//panel.of_addseparator( ).of_setalwayslargemode( true)
panel.of_AddSpace(1,40)
panel.of_AddIcon(Res.IMG_POWERED,104,26)

#LockUpdate = false
of_UpdatePoints()
end event

event destructor;call super::destructor;destroy in_colorMenu
end event

event OnNchittest;int index
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

event ontabmouseenter;call super::ontabmouseenter;of_Select(index)
end event

event ongetitemcolor;call super::ongetitemcolor;if theme.#BkgndColorStyle <> GOLD then return

choose case colorFlag
	case theme.CLR_BKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = ARGB(255,210,194,175)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,250,234,215)
		elseif BitTest(state,Enums.STATE_HIGHLIGHTED) then
			color = ARGB(255,250,192,141)
		else
			color = ARGB(255,230,214,195)
		end if
	case theme.CLR_BORDER
		color = ARGB(255,190,174,155)
	case theme.CLR_TEXT
		if item.#Tag = "QQun" then
			Color = ARGB(255,255,0,0)
		end if
end choose
end event

event onpopupenteridle;call super::onpopupenteridle;Event OnPopupIdle(popupType)
end event

event onpopupidle;call super::onpopupidle;int index
RECTF wndRect
POINTF pt

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

event onthemechanged;call super::onthemechanged;choose case eventflag
	case theme.EVT_RIBBONCOLLAPSED
		if theme.#RibbonCollapsed then
			Parent.theme.of_SetTitleBarHeight(Parent.theme.Font.#WordSize.cy + 8 + U2DY(uo_ribbonbar.height) - 1)
		else
			Parent.theme.of_SetTitleBarHeight(Parent.theme.Font.#WordSize.cy + 8 + U2DY(uo_ribbonbar.height) + 4)
		end if
		uo_ribbonbar.of_UpdateParentBkgnd(true)
end choose

in_colorMenu.theme.of_SetTheme(theme)
end event

on uo_ribbonbar.destroy
call u_cst_ribbonbar::destroy
end on

event ongetcolor;call super::ongetcolor;if theme.#BkgndColorStyle <> GOLD then return

choose case colorFlag
	case theme.CLR_BORDER
		color = ARGB(255,190,174,155)
	case theme.CLR_TEXT
		if BitTest(state,Enums.STATE_DISABLED) then
			color = ARGB(255,180,180,180)
		else
			color = ARGB(255,150,134,115)
		end if
	case theme.CLR_LINE
		if BitTest(state,Enums.STATE_DISABLED) then
			color = ARGB(255,180,180,180)
		else
			color = ARGB(255,190,174,155)
		end if
	case theme.CLR_ARROW
		if BitTest(state,Enums.STATE_DISABLED) then
			color = ARGB(255,180,180,180)
		else
			color = ARGB(255,190,174,155)
		end if
	case theme.CLR_BKGND
		color = ARGB(255,230,214,195)
	case theme.CLR_SCROLLBARBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = ARGB(255,230,214,195)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,250,234,215)
		else
			color = ARGB(255,230,214,195)
		end if
	case theme.CLR_SCROLLBARBORDER
		color = ARGB(255,190,174,155)
end choose

end event

event ongettabcolor;call super::ongettabcolor;if theme.#BkgndColorStyle <> GOLD then return

choose case colorFlag
	case theme.CLR_BKGND
		if BitTest(state,Enums.STATE_SELECTED) then
			color = ARGB(255,230,214,195)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,250,234,215)
		elseif BitTest(state,Enums.STATE_HIGHLIGHTED) then
			color = ARGB(255,250,192,141)
		else
			color = ARGB(255,230,214,195)
		end if
	case theme.CLR_BORDER
		color = ARGB(255,210,194,175)
end choose

end event

event ongetpanelcolor;call super::ongetpanelcolor;if theme.#BkgndColorStyle <> GOLD then return

choose case colorFlag
	case theme.CLR_BKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = ARGB(255,210,194,175)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,250,234,215)
		else
			color = ARGB(255,230,214,195)
		end if
	case theme.CLR_BORDER
		color = ARGB(255,190,174,155)
	case theme.CLR_CAPTIONBKGND
		if BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(245,210,194,185)
		else
			color = ARGB(225,190,174,165)
		end if
	case theme.CLR_LAUNCHBTNBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = ARGB(255,210,194,175)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,250,234,215)
		end if
end choose

end event

event ongettoolbaritemcolor;call super::ongettoolbaritemcolor;if theme.#BkgndColorStyle <> GOLD then return

choose case colorFlag
	case theme.CLR_BKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = ARGB(255,210,194,175)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,250,234,215)
		elseif BitTest(state,Enums.STATE_HIGHLIGHTED) then
			color = ARGB(255,250,192,141)
		else
			color = ARGB(255,230,214,195)
		end if
	case theme.CLR_BORDER
		color = ARGB(255,190,174,155)
end choose
end event

event ongetcategorycolor;call super::ongetcategorycolor;if theme.#BkgndColorStyle <> GOLD then return

choose case colorFlag
	case theme.CLR_BORDER
		color = ARGB(255,190,174,155)
	case theme.CLR_BKGND
		color = ARGB(255,230,214,195)
	case theme.CLR_SCROLLBARBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = ARGB(255,230,214,195)
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,250,234,215)
		else
			color = ARGB(255,230,214,195)
		end if
	case theme.CLR_SCROLLBARBORDER
		color = ARGB(255,190,174,155)
end choose

end event

