$PBExportHeader$pm_skin.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type pm_skin from n_cst_popupmenu
end type
end forward

global type pm_skin from n_cst_popupmenu
end type
global pm_skin pm_skin

type variables
Public:
//Item IDs
Constant Int MID_CLASSIC		= 1
Constant Int MID_BLUE			= 2
Constant Int MID_SILVER 		= 3
Constant Int MID_OLIVE 			= 4
Constant Int MID_PURPLE 		= 5
Constant Int MID_GOLD 			= 6
Constant Int MID_XP		 		= 7
Constant Int MID_VISTA 			= 8
Constant Int MID_WIN8	 		= 9
Constant Int MID_QQ	 			= 10
Constant Int MID_LEFT	 		= 11
Constant Int MID_TOP	 		= 12
Constant Int MID_RIGHT			= 13
Constant Int MID_BOTTOM		= 14
Constant Int MID_TABSTRIP 	= 15
Constant Int MID_STATUSBAR	= 16
end variables

on pm_skin.create
call super::create
end on

on pm_skin.destroy
call super::destroy
end on

event onmenuselected;call super::onmenuselected;u_cst_ribbonbar uo_ribbonbar
u_cst_tabcontrol uo_tabcontrol
pm_color pmColor

if Not IsValidObject(w_demo) then return

uo_ribbonbar = w_demo.uo_ribbonbar
uo_tabcontrol = w_demo.uo_tabcontrol
pmColor = w_demo.wf_GetColorMenu()

choose case id
	case MID_CLASSIC
		w_demo.wf_SetThemeColorStyle(n_cst_thememanager.CLASSIC)
		of_CheckRadios( MID_CLASSIC, MID_GOLD, MID_CLASSIC, false, true)
		pmColor.of_CheckRadios( MID_CLASSIC, MID_GOLD, MID_CLASSIC, false, true)
	case MID_BLUE
		w_demo.wf_SetThemeColorStyle(n_cst_thememanager.BLUE)
		of_CheckRadios( MID_CLASSIC, MID_GOLD, MID_BLUE, false, true)
		pmColor.of_CheckRadios( MID_CLASSIC, MID_GOLD, MID_BLUE, false, true)
	case MID_SILVER
		w_demo.wf_SetThemeColorStyle(n_cst_thememanager.SILVER)
		of_CheckRadios( MID_CLASSIC, MID_GOLD, MID_SILVER, false, true)
		pmColor.of_CheckRadios( MID_CLASSIC, MID_GOLD, MID_SILVER, false, true)
	case MID_OLIVE
		w_demo.wf_SetThemeColorStyle(n_cst_thememanager.OLIVE)
		of_CheckRadios( MID_CLASSIC, MID_GOLD, MID_OLIVE, false, true)
		pmColor.of_CheckRadios( MID_CLASSIC, MID_GOLD, MID_OLIVE, false, true)
	case MID_PURPLE
		w_demo.wf_SetThemeColorStyle(n_cst_thememanager.PURPLE)
		of_CheckRadios( MID_CLASSIC, MID_GOLD, MID_PURPLE, false, true)
		pmColor.of_CheckRadios( MID_CLASSIC, MID_GOLD, MID_PURPLE, false, true)
	case MID_GOLD
		w_demo.wf_SetThemeColorStyle(n_cst_thememanager.GOLD)
		of_CheckRadios( MID_CLASSIC, MID_GOLD, MID_GOLD, false, true)
		pmColor.of_CheckRadios( MID_CLASSIC, MID_GOLD, MID_GOLD, false, true)
	case MID_XP
		w_demo.wf_SetThemeStyle(n_cst_thememanager.XP)
		of_CheckRadios( MID_XP, MID_QQ, MID_XP, false, true)
		goto _SetStyleRadioBox_
	case MID_VISTA
		w_demo.wf_SetThemeStyle(n_cst_thememanager.WIN7)
		of_CheckRadios( MID_XP, MID_QQ, MID_VISTA, false, true)
		goto _SetStyleRadioBox_
	case MID_WIN8
		w_demo.wf_SetThemeStyle(n_cst_thememanager.WIN8)
		of_CheckRadios( MID_XP, MID_QQ, MID_WIN8, false, true)
		goto _SetStyleRadioBox_
	case MID_QQ
		w_demo.wf_SetThemeStyle(n_cst_thememanager.QQ)
		of_CheckRadios( MID_XP, MID_QQ, MID_QQ, false, true)
		goto _SetStyleRadioBox_
	case MID_LEFT
		w_demo.uo_TabControl.theme.of_SetTabPosition(TabsOnLeft!)
		w_demo.uo_TabControl.theme.of_SetTextOrientation(Enums.VERT)
		w_demo.uo_TabControl.theme.of_SetIconPosition(Enums.TOP)
		of_CheckRadios( MID_LEFT, MID_BOTTOM, MID_LEFT, false, true)
		goto _SetPositionRadioBox_
	case MID_TOP
		w_demo.uo_TabControl.theme.of_SetTabPosition(TabsOnTop!)
		w_demo.uo_TabControl.theme.of_SetTextOrientation(Enums.HORZ)
		w_demo.uo_TabControl.theme.of_SetIconPosition(Enums.LEFT)
		of_CheckRadios( MID_LEFT, MID_BOTTOM, MID_TOP, false, true)
		goto _SetPositionRadioBox_
	case MID_RIGHT
		w_demo.uo_TabControl.theme.of_SetTabPosition(TabsOnRight!)
		w_demo.uo_TabControl.theme.of_SetTextOrientation(Enums.VERT)
		w_demo.uo_TabControl.theme.of_SetIconPosition(Enums.TOP)
		of_CheckRadios( MID_LEFT, MID_BOTTOM, MID_RIGHT, false, true)
		goto _SetPositionRadioBox_
	case MID_BOTTOM
		w_demo.uo_TabControl.theme.of_SetTabPosition(TabsOnBottom!)
		w_demo.uo_TabControl.theme.of_SetTextOrientation(Enums.HORZ)
		w_demo.uo_TabControl.theme.of_SetIconPosition(Enums.LEFT)
		of_CheckRadios( MID_LEFT, MID_BOTTOM, MID_BOTTOM, false, true)
		goto _SetPositionRadioBox_
	case MID_TABSTRIP
		uo_TabControl.theme.of_SetTabStripBar(Not uo_TabControl.theme.#TabStripBar)
		of_Check( MID_TABSTRIP, false,uo_TabControl.theme.#TabStripBar)
		goto _SetCheckBox_
	case MID_STATUSBAR
		w_demo.theme.of_SetStatusBar(Not w_demo.theme.#StatusBar)
		of_Check( MID_STATUSBAR, false,w_demo.theme.#StatusBar)
		goto _SetCheckBox_
end choose

return

int index
n_cst_ribbonbar_category category
n_cst_ribbonbar_panel	panel
n_cst_ribbonbar_baseitem	ribbonitem
n_cst_ribbonbar_radiobox radiobox
n_cst_ribbonbar_checkbox checkbox

_SetStyleRadioBox_:
if IsSucceeded(uo_ribbonbar.of_GetCategory(2,ref category)) then
	if IsSucceeded(category.of_GetPanel(1,ref panel)) then
		for index = 1 to panel.of_GetCount()
			if IsSucceeded(panel.of_GetItem(index,ref ribbonitem)) then
				if ribbonitem.#Type = ribbonitem.ITT_RADIOBOX then
					radiobox = ribbonitem
					if Lower(radiobox.#Text) <> Lower(of_GetText(id,false)) then
						radiobox.of_SetChecked(false)
					else
						radiobox.of_SetChecked(true)
					end if
				end if
			end if
		next
	end if
end if
return

_SetPositionRadioBox_:

if IsSucceeded(uo_ribbonbar.of_GetCategory(2,ref category)) then
	if IsSucceeded(category.of_GetPanel(2,ref panel)) then
		for index = 1 to panel.of_GetCount()
			if IsSucceeded(panel.of_GetItem(index,ref ribbonitem)) then
				if ribbonitem.#Type = ribbonitem.ITT_RADIOBOX then
					radiobox = ribbonitem
					if Lower(radiobox.#Text) <> Lower(of_GetText(id,false)) then
						radiobox.of_SetChecked(false)
					else
						radiobox.of_SetChecked(true)
					end if
				end if
			end if
		next
	end if
end if
return

_SetCheckBox_:
if IsSucceeded(uo_ribbonbar.of_GetCategory(2,ref category)) then
	if IsSucceeded(category.of_GetPanel(2,ref panel)) then
		for index = 1 to panel.of_GetCount()
			if IsSucceeded(panel.of_GetItem(index,ref ribbonitem)) then
				if ribbonitem.#Type = ribbonitem.ITT_CHECKBOX then
					checkbox = ribbonitem
					if checkbox.#Text = of_GetText(id,false) then
						choose case checkbox.#Text 
							case "显示导航栏"
								checkbox.of_SetChecked(uo_TabControl.theme.#TabStripBar)
							case "显示状态栏"
								checkbox.of_SetChecked(w_demo.theme.#StatusBar)
						end choose
					end if
				end if
			end if
		next
	end if
end if

return
end event

event constructor;call super::constructor;//设置Menu图标大小
theme.of_SetIconSize(Enums.SMALL,Enums.SMALL)
//开启Menu标题栏
theme.of_SetTitleBar(true)
//开启Menu的工具提示
of_SetToolTip( true)
//设置Menu标题
of_SetTitleText("皮肤")
//设置Menu标题图标
of_SetTitleImage(Res.ICO_S_SKIN)
//设置Menu标题图标对齐方式
theme.of_SetTitleBarIconAlign(Center!)
//--- 添加Menu子项 ---
of_AddLabel( "颜色:")
of_AddMenu( "Classic", Res.ICO_S_CLASSIC,"Classic", MID_CLASSIC)
of_AddMenu( "Blue", Res.ICO_S_BLUE,"Blue",  MID_BLUE)
of_AddMenu( "Silver",Res.ICO_S_SILVER,"Silver",  MID_SILVER)
of_AddMenu( "Olive", Res.ICO_S_OLIVE,"Olive",  MID_OLIVE)
of_AddMenu( "Purple", Res.ICO_S_PURPLE,"Purple",  MID_PURPLE)
of_AddMenu( "Gold", Res.ICO_S_GOLD,"Gold", MID_GOLD)
of_AddLabel( "风格:")
of_AddMenu( "XP","","XP风格",MID_XP)
of_AddMenu( "Vista","","Vista风格",  MID_VISTA)
of_AddMenu( "Win8","","Win8风格",  MID_WIN8)
of_AddMenu( "QQ","","QQ风格", MID_QQ)
of_AddLabel( "导航栏位置:")
of_AddMenu( "左侧","","左侧",MID_LEFT)
of_AddMenu( "上侧","","上侧",  MID_TOP)
of_AddMenu( "右侧","","右侧",  MID_RIGHT)
of_AddMenu( "下侧","","下侧", MID_BOTTOM)
of_AddSeparator( )
of_AddMenu( "显示导航栏","","显示标签导航栏", MID_TABSTRIP)
of_AddMenu( "显示状态栏","","显示窗口状态栏", MID_STATUSBAR)
//预设Menu item的选中状态
of_CheckRadios( MID_CLASSIC, MID_GOLD, MID_CLASSIC, false, true)
of_CheckRadios( MID_XP, MID_QQ, MID_WIN8, false, true)
of_CheckRadios( MID_LEFT, MID_BOTTOM, MID_TOP, false, true)
of_Check( MID_TABSTRIP, false,true)
of_Check( MID_STATUSBAR, false,true)
end event

