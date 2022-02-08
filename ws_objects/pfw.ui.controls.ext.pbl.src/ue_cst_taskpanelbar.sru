$PBExportHeader$ue_cst_taskpanelbar.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type ue_cst_taskpanelbar from u_cst_taskpanelbar
end type
end forward

global type ue_cst_taskpanelbar from u_cst_taskpanelbar
event type long onthemeregistering ( )
event onthemeregistered ( )
event onthememgrnotify ( boolean colorchanged,  boolean stylechanged )
end type
global ue_cst_taskpanelbar ue_cst_taskpanelbar

event onthememgrnotify(boolean colorchanged, boolean stylechanged);Boolean bLockUpdate

bLockUpdate = #LockUpdate
#LockUpdate = true

if colorChanged then
	theme.of_SetBkgndColorStyle(ThemeManager().#ColorStyle)
end if

if styleChanged then
	choose case ThemeManager().#Style
		case n_cst_thememanager.WIN8
			theme.of_SetBkgndStyle(Enums.SOLID)
			theme.of_SetPanelBkgndStyle(Enums.SOLID)
			theme.of_SetTitleBarBkgndStyle(Enums.SOLID)
			theme.of_SetItemBkgndStyle(Enums.SOLID)
			theme.of_SetPanelBorderStyle(Enums.BS_SOLID)
			theme.of_SetItemBorderStyle(Enums.BS_SOLID)
		case n_cst_thememanager.WIN7
			theme.of_SetBkgndStyle(Enums.XP)
			theme.of_SetPanelBkgndStyle(Enums.VISTAORIGINAL)
			theme.of_SetTitleBarBkgndStyle(Enums.VISTAORIGINAL)
			theme.of_SetItemBkgndStyle(Enums.VISTAORIGINAL)
			theme.of_SetPanelBorderStyle(Enums.BS_ROUND)
			theme.of_SetItemBorderStyle(Enums.BS_ROUND)
		case n_cst_thememanager.XP
			theme.of_SetBkgndStyle(Enums.SOLID)
			theme.of_SetPanelBkgndStyle(Enums.XP)
			theme.of_SetTitleBarBkgndStyle(Enums.XP)
			theme.of_SetItemBkgndStyle(Enums.XP)
			theme.of_SetPanelBorderStyle(Enums.BS_ROUND)
			theme.of_SetItemBorderStyle(Enums.BS_ROUND)
		case n_cst_thememanager.QQ
			theme.of_SetBkgndStyle(Enums.XP)
			theme.of_SetPanelBkgndStyle(Enums.XP)
			theme.of_SetTitleBarBkgndStyle(Enums.XP)
			theme.of_SetItemBkgndStyle(Enums.XP)
			theme.of_SetPanelBorderStyle(Enums.BS_ROUND)
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

on ue_cst_taskpanelbar.create
call super::create
end on

on ue_cst_taskpanelbar.destroy
call super::destroy
end on

event onpreconstructor;call super::onpreconstructor;if IsPrevented(Event OnThemeRegistering()) then return

ThemeManager().of_RegisterControl(this)

Event OnThemeRegistered()
end event

event onpredestructor;call super::onpredestructor;ThemeManager().of_UnregisterControl(this)
end event

type uo_logo from u_cst_taskpanelbar`uo_logo within ue_cst_taskpanelbar
end type

