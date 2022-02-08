$PBExportHeader$ue_cst_splitcontainer.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type ue_cst_splitcontainer from u_cst_splitcontainer
end type
end forward

global type ue_cst_splitcontainer from u_cst_splitcontainer
long backcolor = 16777215
boolean #tooltip = true
event type long onthemeregistering ( )
event onthemeregistered ( )
event onthememgrnotify ( boolean colorchanged,  boolean stylechanged )
end type
global ue_cst_splitcontainer ue_cst_splitcontainer

event onthememgrnotify(boolean colorchanged, boolean stylechanged);Boolean bLockUpdate

bLockUpdate = #LockUpdate
#LockUpdate = true

if colorChanged then
	theme.of_SetBkgndColorStyle(ThemeManager().#ColorStyle)
end if

if styleChanged then
	choose case ThemeManager().#Style
		case n_cst_thememanager.WIN8
			theme.of_SetTitleBarBkgndStyle(Enums.SOLID)
			theme.of_SetTitleBarBorderStyle(Enums.BS_SOLID)
			theme.of_SetItemBkgndStyle(Enums.SOLID)
			theme.of_SetItemBorderStyle(Enums.BS_SOLID)
		case n_cst_thememanager.WIN7
			theme.of_SetTitleBarBkgndStyle(Enums.VISTAORIGINAL)
			theme.of_SetTitleBarBorderStyle(Enums.BS_ROUND)
			theme.of_SetItemBkgndStyle(Enums.VISTAORIGINAL)
			theme.of_SetItemBorderStyle(Enums.BS_ROUND)
		case n_cst_thememanager.XP
			theme.of_SetTitleBarBkgndStyle(Enums.XP)
			theme.of_SetTitleBarBorderStyle(Enums.BS_ROUND)
			theme.of_SetItemBkgndStyle(Enums.XP)
			theme.of_SetItemBorderStyle(Enums.BS_ROUND)
		case n_cst_thememanager.QQ
			theme.of_SetTitleBarBkgndStyle(Enums.XP)
			theme.of_SetTitleBarBorderStyle(Enums.BS_ROUND)
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

on ue_cst_splitcontainer.create
call super::create
end on

on ue_cst_splitcontainer.destroy
call super::destroy
end on

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_TRANSPARENT
		if Not #Transparent then
			color = ARGB(255,255,255,255)
		end if
end choose
end event

event onsplitbarendmove;call super::onsplitbarendmove;RECTF panelRect

splitContainer.Panel1.of_GetClientRect(ref panelRect)
if Painter.IsRectEmpty(ref panelRect) then
	splitContainer.Panel1.of_SetCollapsed(true)
	return
end if

splitContainer.Panel2.of_GetClientRect(ref panelRect)
if Painter.IsRectEmpty(ref panelRect) then
	splitContainer.Panel2.of_SetCollapsed(true)
	return
end if
end event

event onpanelexpanded;call super::onpanelexpanded;RECTF panelRect

Panel.of_GetClientRect(ref panelRect)
if Painter.IsRectEmpty(ref panelRect) then
	Panel.#ParentSplitContainer.of_ResetLayout()
end if
end event

event onpreconstructor;call super::onpreconstructor;#LockUpdate = true

theme.of_SetBorderStyle(Enums.BS_NONE)
theme.of_SetBkgndStyle(Enums.TRANSPARENT)

#LockUpdate = false
of_UpdatePoints()

if IsPrevented(Event OnThemeRegistering()) then return

ThemeManager().of_RegisterControl(this)

Event OnThemeRegistered()
end event

event onpredestructor;call super::onpredestructor;ThemeManager().of_UnregisterControl(this)
end event

type uo_logo from u_cst_splitcontainer`uo_logo within ue_cst_splitcontainer
end type

