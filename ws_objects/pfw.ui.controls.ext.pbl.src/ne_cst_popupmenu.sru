$PBExportHeader$ne_cst_popupmenu.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type ne_cst_popupmenu from n_cst_popupmenu
end type
end forward

global type ne_cst_popupmenu from n_cst_popupmenu
boolean #tooltip = true
event type long onthemeregistering ( )
event onthemeregistered ( )
event onthememgrnotify ( boolean colorchanged,  boolean stylechanged )
end type
global ne_cst_popupmenu ne_cst_popupmenu

type variables

end variables

event onthememgrnotify(boolean colorchanged, boolean stylechanged);if colorChanged then
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

end event

on ne_cst_popupmenu.create
call super::create
end on

on ne_cst_popupmenu.destroy
call super::destroy
end on

event onpreconstructor;call super::onpreconstructor;if IsPrevented(Event OnThemeRegistering()) then return

ThemeManager().of_RegisterControl(this)

Event OnThemeRegistered()
end event

event onpredestructor;call super::onpredestructor;ThemeManager().of_UnregisterControl(this)
end event

event onthemechanging;call super::onthemechanging;//禁止被其它控件下拉事件同步主题
return 1
end event

