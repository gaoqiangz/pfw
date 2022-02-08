$PBExportHeader$se_cst_tabpagew.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type se_cst_tabpagew from s_cst_tabpagew
end type
end forward

shared variables
Ulong __refCount
Ulong __hBrushStaticBkgnd
end variables

global type se_cst_tabpagew from s_cst_tabpagew
long backcolor = 16777215
event onctlcolorstatic pbm_other
end type
global se_cst_tabpagew se_cst_tabpagew

type variables
Private:
//Colors
Constant Ulong STATICBKGNDCOLOR = RGB(244,244,244)
end variables

event onctlcolorstatic;if Message.Number = WinMsg.WM_CTLCOLORSTATIC then
	Win32.SetBkColor(wparam,STATICBKGNDCOLOR)
	return __hBrushStaticBkgnd
else
	return Event Other(wparam,lparam)
end if
end event

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_CLIENTBKGND
		color = Win32.GetPBColorA(BackColor)
end choose
end event

on se_cst_tabpagew.create
call super::create
end on

on se_cst_tabpagew.destroy
call super::destroy
end on

event onpreclose;call super::onpreclose;__refCount --
if __refCount = 0 then
	if __hBrushStaticBkgnd > 0 then
		Win32.DeleteObject(__hBrushStaticBkgnd)
		__hBrushStaticBkgnd = 0
	end if
end if
end event

event onpreopen;call super::onpreopen;__refCount ++
if __refCount = 1 then
	if __hBrushStaticBkgnd = 0 then
		__hBrushStaticBkgnd = Win32.CreateSolidBrush(STATICBKGNDCOLOR)
	end if
end if
end event

