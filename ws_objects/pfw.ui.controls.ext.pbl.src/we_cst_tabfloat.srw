$PBExportHeader$we_cst_tabfloat.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type we_cst_tabfloat from w_cst_tabfloat
end type
end forward

global type we_cst_tabfloat from w_cst_tabfloat
event type long onthemeregistering ( )
event onthemeregistered ( )
event onthememgrnotify ( boolean colorchanged,  boolean stylechanged )
end type
global we_cst_tabfloat we_cst_tabfloat

event onthememgrnotify(boolean colorchanged, boolean stylechanged);Boolean bLockUpdate

bLockUpdate = #LockUpdate
#LockUpdate = true

if colorChanged then
	theme.of_SetBkgndColorStyle(ThemeManager().#ColorStyle)
end if

if styleChanged then
	choose case ThemeManager().#Style
		case n_cst_thememanager.WIN8
			theme.of_SetItemStyle(theme.ITS_WIN8)
			theme.of_SetBkgndStyle(Enums.SOLID)
			theme.of_SetItemBkgndStyle(Enums.SOLID)
			theme.of_SetBorderStyle(Enums.BS_SOLID)
			theme.of_SetScrollBarBorderStyle(Enums.BS_SOLID)
			theme.Font.of_SetShadowStyle(n_cst_font.SDS_NONE)
		case n_cst_thememanager.WIN7
			theme.of_SetItemStyle(theme.ITS_VISTA)
			theme.of_SetBkgndStyle(Enums.VISTAEMBOSSED)
			theme.of_SetItemBkgndStyle(Enums.VISTAEMBOSSED)
			theme.of_SetBorderStyle(Enums.BS_ROUND)
			theme.of_SetScrollBarBorderStyle(Enums.BS_ROUND)
			theme.Font.of_SetShadowStyle(n_cst_font.SDS_GLOWING)
		case n_cst_thememanager.XP
			theme.of_SetItemStyle(theme.ITS_XP)
			theme.of_SetBkgndStyle(Enums.XP)
			theme.of_SetItemBkgndStyle(Enums.XP)
			theme.of_SetBorderStyle(Enums.BS_ROUND)
			theme.of_SetScrollBarBorderStyle(Enums.BS_ROUND)
			theme.Font.of_SetShadowStyle(n_cst_font.SDS_GLOWING)
		case n_cst_thememanager.QQ
			theme.of_SetItemStyle(theme.ITS_QQ)
			theme.of_SetBkgndStyle(Enums.XP)
			theme.of_SetItemBkgndStyle(Enums.XP)
			theme.of_SetBorderStyle(Enums.BS_ROUND)
			theme.of_SetScrollBarBorderStyle(Enums.BS_ROUND)
			theme.Font.of_SetShadowStyle(n_cst_font.SDS_GLOWING)
	end choose
end if

#LockUpdate = bLockUpdate
if styleChanged then
	wf_UpdatePoints()
else
	wf_Redraw(true)
end if
end event

event ontabthemechanged;//Prevent
return
end event

on we_cst_tabfloat.create
call super::create
end on

on we_cst_tabfloat.destroy
call super::destroy
end on

event open;call super::open;if IsPrevented(Event OnThemeRegistering()) then return

ThemeManager().of_RegisterControl(this)

Event OnThemeRegistered()
end event

event close;call super::close;ThemeManager().of_UnregisterControl(this)
end event

