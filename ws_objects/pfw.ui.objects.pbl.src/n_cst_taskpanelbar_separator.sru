$PBExportHeader$n_cst_taskpanelbar_separator.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_taskpanelbar_separator from n_cst_taskpanelbar_baseitem
end type
end forward

global type n_cst_taskpanelbar_separator from n_cst_taskpanelbar_baseitem
unsignedinteger #type = 9
end type
global n_cst_taskpanelbar_separator n_cst_taskpanelbar_separator

type variables

end variables

forward prototypes
public function unsignedlong of_getstate ()
end prototypes

public function unsignedlong of_getstate ();ulong nState

if Not of_IsEnabled() then nState += Enums.STATE_DISABLED

return nState
end function

on n_cst_taskpanelbar_separator.create
call super::create
end on

on n_cst_taskpanelbar_separator.destroy
call super::destroy
end on

event onpaint;call super::onpaint;ulong lineColor

if AncestorReturnValue = 1 then return 1

lineColor = theme.of_GetItemColor(this,theme.CLR_LINE,of_GetState())

if theme.#PanelBkgndStyle = Enums.SOLID or theme.#PanelBkgndStyle = Enums.TRANSPARENT then
	Painter.DrawLine(hdc,&
							rcPaint.left,&
							rcPaint.top,&
							rcPaint.right,&
							rcPaint.top,&
							lineColor,Enums.LS_SOLID ,true,1)
else
	Painter.DrawGradientLine(hdc,&
							rcPaint.left,&
							rcPaint.top,&
							rcPaint.right,&
							rcPaint.top,&
							0,lineColor,Enums.LS_SOLID ,true,true,1)
end if

return 0
end event

event onupdatelayout;call super::onupdatelayout;if AncestorReturnValue = 1 then return 1
_of_RecalcLayout()
return 0
end event

event oncalclayout;call super::oncalclayout;szLayout.cx = _layoutWidth
szLayout.cy = 2
end event

