$PBExportHeader$ue_cst_ribbonbar.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type ue_cst_ribbonbar from u_cst_ribbonbar
end type
end forward

global type ue_cst_ribbonbar from u_cst_ribbonbar
boolean #tooltip = true
boolean #smoothscroll = true
event type long onthemeregistering ( )
event onthemeregistered ( )
event onthememgrnotify ( boolean colorchanged,  boolean stylechanged )
end type
global ue_cst_ribbonbar ue_cst_ribbonbar

event onthememgrnotify(boolean colorchanged, boolean stylechanged);Boolean bLockUpdate

bLockUpdate = #LockUpdate
#LockUpdate = true

if colorChanged then
	theme.of_SetBkgndColorStyle(ThemeManager().#ColorStyle)
end if

if styleChanged then
	choose case ThemeManager().#Style
		case n_cst_thememanager.WIN8
			theme.of_SetRibbonStyle(theme.RBS_OFFICE2010)
			theme.of_SetTabStyle(theme.TBS_OFFICE2013)
			theme.of_SetBkgndStyle(Enums.SOLID)
			theme.of_SetTabBkgndStyle(Enums.SOLID)
			theme.of_SetItemBkgndStyle(Enums.SOLID)
			theme.of_SetItemBorderStyle(Enums.BS_SOLID)
			theme.of_SetPanelBorderStyle(Enums.BS_SOLID)
			theme.of_SetBorderShadow(false)
		case n_cst_thememanager.WIN7
			theme.of_SetRibbonStyle(theme.RBS_OFFICE2010)
			theme.of_SetTabStyle(theme.TBS_OFFICE2007)
			theme.of_SetBkgndStyle(Enums.VISTAORIGINAL)
			theme.of_SetTabBkgndStyle(Enums.VISTAORIGINAL)
			theme.of_SetItemBkgndStyle(Enums.VISTAORIGINAL)
			theme.of_SetItemBorderStyle(Enums.BS_ROUND)
			theme.of_SetPanelBorderStyle(Enums.BS_ROUND)
			theme.of_SetBorderShadow(true)
		case n_cst_thememanager.XP
			theme.of_SetRibbonStyle(theme.RBS_OFFICE2007)
			theme.of_SetTabStyle(theme.TBS_OFFICE2007)
			theme.of_SetBkgndStyle(Enums.XP)
			theme.of_SetTabBkgndStyle(Enums.XP)
			theme.of_SetItemBkgndStyle(Enums.XP)
			theme.of_SetItemBorderStyle(Enums.BS_ROUND)
			theme.of_SetPanelBorderStyle(Enums.BS_ROUND)
			theme.of_SetBorderShadow(true)
		case n_cst_thememanager.QQ
			theme.of_SetRibbonStyle(theme.RBS_OFFICE2010)
			theme.of_SetTabStyle(theme.TBS_WPS2012)
			theme.of_SetBkgndStyle(Enums.XP)
			theme.of_SetTabBkgndStyle(Enums.XP)
			theme.of_SetItemBkgndStyle(Enums.XP)
			theme.of_SetItemBorderStyle(Enums.BS_ROUND)
			theme.of_SetPanelBorderStyle(Enums.BS_ROUND)
			theme.of_SetBorderShadow(true)
	end choose
end if

#LockUpdate = bLockUpdate
if styleChanged then
	of_UpdatePoints()
else
	of_Redraw(true)
end if
end event

on ue_cst_ribbonbar.create
call super::create
end on

on ue_cst_ribbonbar.destroy
call super::destroy
end on

event onpreconstructor;call super::onpreconstructor;if IsPrevented(Event OnThemeRegistering()) then return

ThemeManager().of_RegisterControl(this)

Event OnThemeRegistered()
end event

event onpredestructor;call super::onpredestructor;ThemeManager().of_UnregisterControl(this)
end event

type uo_logo from u_cst_ribbonbar`uo_logo within ue_cst_ribbonbar
end type

