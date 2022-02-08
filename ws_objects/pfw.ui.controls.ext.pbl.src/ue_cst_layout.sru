$PBExportHeader$ue_cst_layout.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type ue_cst_layout from u_cst_layout
end type
end forward

global type ue_cst_layout from u_cst_layout
long backcolor = 16777215
event type long onthemeregistering ( )
event onthemeregistered ( )
event onthememgrnotify ( boolean colorchanged,  boolean stylechanged )
end type
global ue_cst_layout ue_cst_layout

event onthememgrnotify(boolean colorchanged, boolean stylechanged);Boolean bLockUpdate

bLockUpdate = #LockUpdate
#LockUpdate = true

if colorChanged then
	theme.of_SetBkgndColorStyle(ThemeManager().#ColorStyle)
end if

if styleChanged then
	choose case ThemeManager().#Style
		case n_cst_thememanager.WIN8
			theme.of_SetBorderStyle(Enums.BS_SOLID)
		case n_cst_thememanager.WIN7
			theme.of_SetBorderStyle(Enums.BS_ROUND)
		case n_cst_thememanager.XP
			theme.of_SetBorderStyle(Enums.BS_ROUND)
		case n_cst_thememanager.QQ
			theme.of_SetBorderStyle(Enums.BS_ROUND)
	end choose
end if

#LockUpdate = bLockUpdate
if styleChanged then
	of_UpdatePoints()
else
	of_Redraw(true)
end if
end event

on ue_cst_layout.create
call super::create
end on

on ue_cst_layout.destroy
call super::destroy
end on

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_TRANSPARENT
		if Not #Transparent then
			color = ARGB(255,255,255,255)
		end if
	case theme.CLR_BKGND
		color = ARGB(255,255,255,255)
end choose
end event

event onpreconstructor;call super::onpreconstructor;#LockUpdate = true

theme.of_SetBorderMargin(0,0,0,0)

#LockUpdate = false
of_UpdatePoints()

if IsPrevented(Event OnThemeRegistering()) then return

ThemeManager().of_RegisterControl(this)

Event OnThemeRegistered()
end event

event onpredestructor;call super::onpredestructor;ThemeManager().of_UnregisterControl(this)
end event

type uo_logo from u_cst_layout`uo_logo within ue_cst_layout
end type

