$PBExportHeader$ue_cst_buttonlistbar.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type ue_cst_buttonlistbar from u_cst_buttonlistbar
end type
end forward

global type ue_cst_buttonlistbar from u_cst_buttonlistbar
boolean #tooltip = true
boolean #smoothscroll = true
event type long onthemeregistering ( )
event onthemeregistered ( )
event onthememgrnotify ( boolean colorchanged,  boolean stylechanged )
end type
global ue_cst_buttonlistbar ue_cst_buttonlistbar

forward prototypes
public function long of_setmultilineall (readonly boolean multiline)
end prototypes

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
			theme.of_SetBkgndStyle(Enums.SOLID)
			theme.of_SetItemBkgndStyle(Enums.VISTAORIGINAL)
			theme.of_SetItemBorderStyle(Enums.BS_ROUND)
		case n_cst_thememanager.XP
			theme.of_SetBkgndStyle(Enums.SOLID)
			theme.of_SetItemBkgndStyle(Enums.XP)
			theme.of_SetItemBorderStyle(Enums.BS_ROUND)
		case n_cst_thememanager.QQ
			theme.of_SetBkgndStyle(Enums.SOLID)
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

public function long of_setmultilineall (readonly boolean multiline);int index

#LockUpdate = true

for index = 1 to of_GetCount()
	of_SetMultiLine(index,multiline)	
next

#LockUpdate = false
of_UpdatePoints()

return RetCode.OK
end function

on ue_cst_buttonlistbar.create
call super::create
end on

on ue_cst_buttonlistbar.destroy
call super::destroy
end on

event onpreconstructor;call super::onpreconstructor;if IsPrevented(Event OnThemeRegistering()) then return

ThemeManager().of_RegisterControl(this)

Event OnThemeRegistered()
end event

event onpredestructor;call super::onpredestructor;ThemeManager().of_UnregisterControl(this)
end event

type uo_logo from u_cst_buttonlistbar`uo_logo within ue_cst_buttonlistbar
end type

