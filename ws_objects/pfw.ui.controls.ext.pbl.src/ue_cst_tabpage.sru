$PBExportHeader$ue_cst_tabpage.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type ue_cst_tabpage from u_cst_tabpage
end type
end forward

shared variables
Ulong __refCount
Ulong __hBrushStaticBkgnd
end variables

global type ue_cst_tabpage from u_cst_tabpage
long backcolor = 16777215
event resize pbm_size
event type long onkeydown ( unsignedinteger nchar,  unsignedinteger brepcnt,  unsignedlong flags )
event onctlcolorstatic pbm_other
end type
global ue_cst_tabpage ue_cst_tabpage

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

on ue_cst_tabpage.create
call super::create
end on

on ue_cst_tabpage.destroy
call super::destroy
end on

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_CLIENTBKGND
		color = Win32.GetPBColorA(BackColor)
end choose
end event

event onpreconstructor;call super::onpreconstructor;__refCount ++
if __refCount = 1 then
	if __hBrushStaticBkgnd = 0 then
		__hBrushStaticBkgnd = Win32.CreateSolidBrush(STATICBKGNDCOLOR)
	end if
end if
end event

event onpredestructor;call super::onpredestructor;__refCount --
if __refCount = 0 then
	if __hBrushStaticBkgnd > 0 then
		Win32.DeleteObject(__hBrushStaticBkgnd)
		__hBrushStaticBkgnd = 0
	end if
end if
end event

