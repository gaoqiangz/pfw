$PBExportHeader$se_cst_radiobox.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type se_cst_radiobox from s_cst_radiobox
end type
end forward

global type se_cst_radiobox from s_cst_radiobox
long backcolor = 16777215
event type long onthemeregistering ( )
event onthemeregistered ( )
event onthememgrnotify ( boolean colorchanged,  boolean stylechanged )
end type
global se_cst_radiobox se_cst_radiobox

event onthememgrnotify(boolean colorchanged, boolean stylechanged);if colorChanged then
	theme.of_SetBkgndColorStyle(ThemeManager().#ColorStyle)
end if
end event

on se_cst_radiobox.create
call super::create
end on

on se_cst_radiobox.destroy
call super::destroy
end on

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_TRANSPARENT
		if Not #Transparent then
			color = ARGB(255,255,255,255)
		end if
end choose
end event

event onpreconstructor;call super::onpreconstructor;of_SetToolTipStyle(Enums.TTS_NORMAL)

if #Theme then
	theme.of_SetBkgndStyle(Enums.TRANSPARENT)
	if IsAllowed(Event OnThemeRegistering()) then
		ThemeManager().of_RegisterControl(this)
		Event OnThemeRegistered()
	end if
else
	theme.of_SetBkgndStyle(Enums.SOLID)
end if
end event

event onpredestructor;call super::onpredestructor;ThemeManager().of_UnregisterControl(this)
end event

