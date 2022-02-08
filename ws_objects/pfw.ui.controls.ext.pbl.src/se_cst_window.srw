$PBExportHeader$se_cst_window.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type se_cst_window from s_cst_window
end type
end forward

shared variables
Ulong __refCount
Ulong __hBrushStaticBkgnd
end variables

global type se_cst_window from s_cst_window
long backcolor = 16777215
boolean #bordershadow = true
event type long onthemeregistering ( )
event onthemeregistered ( )
event onthememgrnotify ( boolean colorchanged,  boolean stylechanged )
event onctlcolorstatic pbm_other
end type
global se_cst_window se_cst_window

type variables
Private:
//Colors
Constant Ulong STATICBKGNDCOLOR = RGB(244,244,244)
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

event onctlcolorstatic;if Message.Number = WinMsg.WM_CTLCOLORSTATIC then
	Win32.SetBkColor(wparam,STATICBKGNDCOLOR)
	return __hBrushStaticBkgnd
else
	return Event Other(wparam,lparam)
end if
end event

on se_cst_window.create
call super::create
end on

on se_cst_window.destroy
call super::destroy
end on

event ongetitemcolor;call super::ongetitemcolor;if objectType = WOT_TITLEBAR then
	choose case colorFlag
		case theme.CLR_BKGND
			if index = CaptionBar.IDX_CLOSE then
				if BitTest(state,Enums.STATE_PRESSED) then
					color = ARGB(240,209,53,45)
				elseif BitTest(state,Enums.STATE_HOVER) then
					color = ARGB(240,249,93,85)
				else
					color = ARGB(240,229,73,65)
				end if
			end if
	end choose
end if
if colorFlag = theme.CLR_BORDER then
	if ThemeManager().#Style = n_cst_thememanager.WIN8 then
		color = 0
	end if
end if
end event

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_TITLE
		if ThemeManager().#Style = n_cst_thememanager.WIN8 then
			choose case ThemeManager().#ColorStyle
				case n_cst_thememanager.SILVER,n_cst_thememanager.BLUE,n_cst_thememanager.PURPLE,n_cst_thememanager.GOLD
				if BitTest(state,Enums.STATE_ACTIVE) then
					color = ARGB(255,255,255,255)
				else
				end if
			end choose
		end if
/*	case theme.CLR_TEXT
		if ThemeManager().#Style = n_cst_thememanager.WIN8 then
			choose case n_cst_thememanager.#ColorStyle
				case n_cst_thememanager.SILVER,n_cst_thememanager.BLUE,n_cst_thememanager.PURPLE,n_cst_thememanager.GOLD
					color = ARGB(255,255,255,255)
			end choose
		end if*/
end choose
end event

event onpreclose;call super::onpreclose;__refCount --
if __refCount = 0 then
	if __hBrushStaticBkgnd > 0 then
		Win32.DeleteObject(__hBrushStaticBkgnd)
		__hBrushStaticBkgnd = 0
	end if
end if

ThemeManager().of_UnregisterControl(this)
end event

event onpreopen;call super::onpreopen;__refCount ++
if __refCount = 1 then
	if __hBrushStaticBkgnd = 0 then
		__hBrushStaticBkgnd = Win32.CreateSolidBrush(STATICBKGNDCOLOR)
	end if
end if

if IsPrevented(Event OnThemeRegistering()) then return

ThemeManager().of_RegisterControl(this)

Event OnThemeRegistered()
end event

