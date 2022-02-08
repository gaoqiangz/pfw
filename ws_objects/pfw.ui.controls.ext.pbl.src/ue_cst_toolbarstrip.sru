$PBExportHeader$ue_cst_toolbarstrip.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type ue_cst_toolbarstrip from u_cst_toolbarstrip
end type
end forward

global type ue_cst_toolbarstrip from u_cst_toolbarstrip
boolean #tooltip = true
event type long onthemeregistering ( )
event onthemeregistered ( )
event onthememgrnotify ( boolean colorchanged,  boolean stylechanged )
end type
global ue_cst_toolbarstrip ue_cst_toolbarstrip

type variables

end variables

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
			theme.of_SetItemBkgndStyle(Enums.SOLID)
			theme.of_SetItemBorderStyle(Enums.BS_SOLID)
		case n_cst_thememanager.WIN7
			theme.of_SetBkgndStyle(Enums.VISTAORIGINAL)
			theme.of_SetItemBkgndStyle(Enums.VISTAORIGINAL)
			theme.of_SetItemBorderStyle(Enums.BS_ROUND)
		case n_cst_thememanager.XP
			theme.of_SetBkgndStyle(Enums.XP)
			theme.of_SetItemBkgndStyle(Enums.XP)
			theme.of_SetItemBorderStyle(Enums.BS_ROUND)
		case n_cst_thememanager.QQ
			theme.of_SetBkgndStyle(Enums.XP)
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

on ue_cst_toolbarstrip.create
call super::create
end on

on ue_cst_toolbarstrip.destroy
call super::destroy
end on

event onpreconstructor;call super::onpreconstructor;if IsPrevented(Event OnThemeRegistering()) then return

ThemeManager().of_RegisterControl(this)

Event OnThemeRegistered()
end event

event onpredestructor;call super::onpredestructor;ThemeManager().of_UnregisterControl(this)
end event

type uo_logo from u_cst_toolbarstrip`uo_logo within ue_cst_toolbarstrip
end type

