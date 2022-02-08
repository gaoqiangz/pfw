$PBExportHeader$w_demo_mdi_ribbonbar.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type w_demo_mdi_ribbonbar from s_cst_window
end type
type mdi_1 from mdiclient within w_demo_mdi_ribbonbar
end type
type uo_ribbonbar from u_cst_ribbonbar within w_demo_mdi_ribbonbar
end type
end forward

global type w_demo_mdi_ribbonbar from s_cst_window
integer width = 2661
integer height = 1336
string menuname = "m_empty"
boolean hscrollbar = true
boolean vscrollbar = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 16777215
string icon = "res\logoicon.ico"
boolean #extendframeintoclient = true
boolean #bordershadow = true
mdi_1 mdi_1
uo_ribbonbar uo_ribbonbar
end type
global w_demo_mdi_ribbonbar w_demo_mdi_ribbonbar

type variables
int ii_idx_open,ii_idx_arrange
int ii_sheetIndex

n_image in_logoImage
end variables

on w_demo_mdi_ribbonbar.create
int iCurrent
call super::create
if this.MenuName = "m_empty" then this.MenuID = create m_empty
this.mdi_1=create mdi_1
this.uo_ribbonbar=create uo_ribbonbar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.uo_ribbonbar
end on

on w_demo_mdi_ribbonbar.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.uo_ribbonbar)
end on

event onpreopen;call super::onpreopen;theme.of_SetBkgndColorStyle(theme.BLUE)
//theme.of_SetClientThemeBkgnd(true)
theme.of_SetStatusBar(true)
theme.of_SetTitleBarHeight(theme.Font.#WordSize.cy + 8 + U2DY(uo_ribbonbar.height) + 4)
//--- 添加窗口状态栏按钮 ---
StatusBar.of_AddIcon(Res.ICO_S_USER,left!)
StatusBar.of_AddLink("Powered by 金千枝（深圳）软件技术有限公司",left!)
//MDI menu
ii_idx_open = Captionbar.of_AddButton("Open","Open!",left!)
ii_idx_arrange = Captionbar.of_AddButton("Window","Window!",left!)

in_logoImage = Create n_image
in_logoImage.SetImageSize(64,64)
in_logoImage.Load(Res.ICO_XXL_LOGO)
end event

event onbuttonclicked;call super::onbuttonclicked;choose case index
	case ii_idx_open
		w_demo_mdi_child lw_sheet
		wf_opensheet(lw_sheet,Original!)
		lw_sheet.title += "["+string(ii_sheetIndex)+"]"
		ii_sheetIndex += 1
	case ii_idx_arrange
		int li_Selected
		n_cst_popupmenu ln_pmMenu
		POINTF pt
		ln_pmMenu = Create n_cst_popupmenu
		ln_pmMenu.of_AddMenu("Cascade","Cascade!")
		ln_pmMenu.of_AddMenu("Layer","Layer!")
		ln_pmMenu.of_AddMenu("Tile","Tile!")
		ln_pmMenu.of_AddMenu("TileHorizontal","TileHorizontal!")
		ln_pmMenu.of_AddMenu("Icons","Icons!")
		ln_pmMenu.of_AddSeparator()
		//GetSheets
		int i,idCheck
		s_cst_window lw_activeSheet,lw_sheets[]
		lw_activeSheet = GetActiveSheet()
		wf_GetSheets(ref lw_sheets)
		for i = 1 to UpperBound(lw_sheets)
			ln_pmMenu.of_AddMenu(lw_sheets[i].Title,lw_sheets[i].Icon)
			if lw_sheets[i] = lw_activeSheet then
				idCheck = i + 6
			end if
		next
		if idCheck > 0 then
			ln_pmMenu.of_CheckRadios(7,UpperBound(lw_sheets) + 6,idCheck,true,true)
		end if
		//Popup
		Painter.GetCursorPos(ref pt)
		li_Selected = ln_pmMenu.of_Popup(0,pt.x + 10,pt.y + 10)
		choose case li_Selected
			case 1	//Cascade
				ArrangeSheets(Cascade!)
			case 2	//Layer
				ArrangeSheets(Layer!)
			case 3	//Tile
				ArrangeSheets(Tile!)
			case 4	//TileHorizontal
				ArrangeSheets(TileHorizontal!)
			case 5	//Icons
				ArrangeSheets(Icons!)
			case else
				if li_Selected > 0 then
					wf_ActivateSheet(li_Selected - 6)
				end if
		end choose
		Destroy ln_pmMenu
end choose
end event

event resize;call super::resize;RECTF cliRect
int nWidth,nHeight

wf_GetClientRect(ref cliRect,true)

Painter.InflateRect(ref cliRect,1,1)

nWidth = D2UX(cliRect.right - cliRect.left)
nHeight = D2UY(cliRect.bottom - cliRect.top)

uo_ribbonbar.Move(D2UX(cliRect.left),D2UY(theme.Font.#WordSize.cy + 8))
uo_ribbonbar.resize(nWidth,uo_ribbonbar.height)

return 0
end event

event open;call super::open;//Open sheet
wf_opensheet(w_demo_mdi_child,Original!)
end event

event close;call super::close;Destroy in_logoImage
end event

event onmdiclienterasebkgnd;call super::onmdiclienterasebkgnd;RECTF cliRect

if IsValid(in_logoImage) then
	Painter.GetClientRect(MDIClient.#Handle,ref cliRect)
	in_logoImage.Draw( hdc, cliRect.right - 100, cliRect.bottom - 100, false)
end if
return 1
end event

type mdi_1 from mdiclient within w_demo_mdi_ribbonbar
long BackColor=268435456
end type

type uo_ribbonbar from u_cst_ribbonbar within w_demo_mdi_ribbonbar
integer width = 2523
integer height = 528
integer taborder = 20
boolean #transparent = true
boolean #tooltip = true
end type

on uo_ribbonbar.destroy
call u_cst_ribbonbar::destroy
end on

event onthemechanged;call super::onthemechanged;choose case eventflag
	case theme.EVT_RIBBONCOLLAPSED
		Parent.SetRedraw(false)
		Parent.theme.of_SetTitleBarHeight(theme.Font.#WordSize.cy + 8 + U2DY(uo_ribbonbar.height) + 4)
		Parent.Event Resize(0,Parent.width,Parent.height)
		Parent.SetRedraw(true)
		uo_ribbonbar.of_UpdateParentBkgnd(true)
end choose
end event

event constructor;call super::constructor;n_cst_ribbonbar_category category
n_cst_ribbonbar_panel	panel
n_cst_ribbonbar_button	button

this.#LockUpdate = true

this.theme.of_SetBkgndColorStyle(theme.BLUE)
this.theme.of_SetRibbonStyle("OFFICE2010")
this.theme.of_SetTabStyle("WPS2012")
this.theme.of_SetBorderShadow(true)
this.theme.of_SetTabStripBkgndStyle(Enums.TRANSPARENT)
this.theme.of_SetTabStripBorderStyle(Enums.BS_NONE)
this.theme.of_SetTabStripSize(30)
this.theme.of_SetBorderMargin(parent.theme.#IconSize.cx,0,0,0)

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
category = this.of_AddCategory("关于",Res.ICO_S_ABOUT)
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

this.#LockUpdate = false
this.of_UpdatePoints()
end event

