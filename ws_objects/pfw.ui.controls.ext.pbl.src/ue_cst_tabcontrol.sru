$PBExportHeader$ue_cst_tabcontrol.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type ue_cst_tabcontrol from u_cst_tabcontrol
end type
end forward

global type ue_cst_tabcontrol from u_cst_tabcontrol
long backcolor = 16777215
boolean #tooltip = true
boolean #smoothscroll = true
boolean #smoothdrag = true
boolean #smoothclose = true
event type long onthemeregistering ( )
event onthemeregistered ( )
event onthememgrnotify ( boolean colorchanged,  boolean stylechanged )
end type
global ue_cst_tabcontrol ue_cst_tabcontrol

type variables

end variables

forward prototypes
public function long of_redraw (readonly boolean drawclient, readonly boolean fadeanimation)
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
			theme.of_SetTabStyle(theme.TBS_SOLID)
			theme.of_SetItemBkgndStyle(Enums.SOLID)
		case n_cst_thememanager.WIN7
			theme.of_SetTabStyle(theme.TBS_RIBBON)
			theme.of_SetItemBkgndStyle(Enums.VISTAORIGINAL)
		case n_cst_thememanager.XP
			theme.of_SetTabStyle(theme.TBS_OFFICE)
			theme.of_SetItemBkgndStyle(Enums.XP)
		case n_cst_thememanager.QQ
			theme.of_SetTabStyle(theme.TBS_REGULAR)
			theme.of_SetItemBkgndStyle(Enums.XP)
	end choose
end if

#LockUpdate = bLockUpdate
if styleChanged then
	of_UpdatePoints()
else
	of_Redraw(true)
end if
end event

public function long of_redraw (readonly boolean drawclient, readonly boolean fadeanimation);ulong safeDC

if #LockUpdate then return RetCode.FAILED
if Not Visible then return RetCode.OK

of_Redraw(fadeAnimation)

if drawClient then
	safeDC=GetSafeDC()
	
	if #Transparent then
		FillParentBkgnd(safeDC)
	end if
	
	TriggerEvent("OnPaint",0,safeDC)	//Message.LongParm:safeDC

	if FadeAnimation then
		ReleaseDC(safeDC,0,#FadeTime)
	else
		ReleaseDC(safeDC,0)
	end if
end if

return RetCode.OK
end function

public function long of_setmultilineall (readonly boolean multiline);int index

#LockUpdate = true

for index = 1 to of_GetCount()
	of_SetMultiLine(index,multiline)	
next

#LockUpdate = false
of_UpdatePoints()

return RetCode.OK
end function

on ue_cst_tabcontrol.create
call super::create
end on

on ue_cst_tabcontrol.destroy
call super::destroy
end on

event Onkeydown;call super::Onkeydown;ue_cst_tabpage page

if IsSucceeded(of_GetPage(of_GetSelectedIndex(),ref page)) then
	return page.Event OnKeyDown(nChar,nRepCnt,nflags)
end if

return 0
end event

event onpreconstructor;call super::onpreconstructor;theme.of_SetBkgndStyle(Enums.SOLID)

if IsPrevented(Event OnThemeRegistering()) then return

ThemeManager().of_RegisterControl(this)

Event OnThemeRegistered()
end event

event onpredestructor;call super::onpredestructor;ThemeManager().of_UnregisterControl(this)
end event

type uo_logo from u_cst_tabcontrol`uo_logo within ue_cst_tabcontrol
end type

