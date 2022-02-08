$PBExportHeader$n_cst_ribbonbar_separator.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_ribbonbar_separator from n_cst_ribbonbar_baseitem
end type
end forward

global type n_cst_ribbonbar_separator from n_cst_ribbonbar_baseitem
unsignedinteger #type = 9
end type
global n_cst_ribbonbar_separator n_cst_ribbonbar_separator

type variables

end variables

forward prototypes
public function boolean of_hasintermediatemode ()
public function boolean of_hascompactmode ()
public function unsignedlong of_getstate ()
end prototypes

public function boolean of_hasintermediatemode ();return false
end function

public function boolean of_hascompactmode ();return (#MinDisplayMode = DPM_COMPACT)
end function

public function unsignedlong of_getstate ();ulong nState

if Not of_IsEnabled() then nState += Enums.STATE_DISABLED

return nState
end function

on n_cst_ribbonbar_separator.create
call super::create
end on

on n_cst_ribbonbar_separator.destroy
call super::destroy
end on

event onpaint;call super::onpaint;ulong lineColor

if AncestorReturnValue = 1 then return 1

lineColor = theme.of_GetItemColor(this,theme.CLR_LINE,of_GetState())

if _DisplayMode <> DPM_COMPACT then
	if theme.#RibbonStyle = theme.RBS_OFFICE2010 then
		if theme.#BkgndStyle = Enums.SOLID or theme.#BkgndStyle = Enums.TRANSPARENT then
			Painter.DrawLine(hdc,&
									rcPaint.left,&
									rcPaint.top + 4,&
									rcPaint.left,&
									rcPaint.bottom - 4,&
									lineColor,Enums.LS_SOLID ,false,P2DX(1))
		else
			Painter.DrawGradientLine(hdc,&
									rcPaint.left,&
									rcPaint.top + 4,&
									rcPaint.left,&
									rcPaint.bottom - 4,&
									0,lineColor,Enums.LS_SOLID ,true,true,P2DX(1))
		end if
	else
		Painter.DrawLine(hdc,&
								rcPaint.left,&
								rcPaint.top + 4,&
								rcPaint.left,&
								rcPaint.bottom - 4,&
								lineColor,Enums.LS_SOLID ,true,P2DX(1))
	end if
end if
return 0
end event

event oncalclayout;call super::oncalclayout;szLayouts[DPM_LARGE].cx = P2DX(2)
szLayouts[DPM_LARGE].cy = _layoutHeight
szLayouts[DPM_INTERMEDIATE].cx = 0
szLayouts[DPM_INTERMEDIATE].cy = 0
szLayouts[DPM_COMPACT] = szLayouts[DPM_INTERMEDIATE]
end event

