$PBExportHeader$n_cst_taskpanelbar_label.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_taskpanelbar_label from n_cst_taskpanelbar_baseitem
end type
type font from n_cst_font within n_cst_taskpanelbar_label
end type
end forward

global type n_cst_taskpanelbar_label from n_cst_taskpanelbar_baseitem
unsignedinteger #type = 7
event type boolean oninitdata ( string text )
font font
end type
global n_cst_taskpanelbar_label n_cst_taskpanelbar_label

type variables
/*--- Properties ---*/
Public:
PrivateWrite String 		#Text
PrivateWrite Alignment	#Alignment
PrivateWrite Boolean		#MultiLine

/*--- Implementation ---*/
Private:
SIZEF szText
end variables

forward prototypes
private subroutine _of_updatetextsize ()
public function long of_settext (readonly string text)
public function long of_setalignment (readonly alignment align)
public function long of_setmultiline (readonly boolean multiline)
public function unsignedlong of_getstate ()
end prototypes

event type boolean oninitdata(string text);#Text= text

//_of_UpdateTextSize()

return true
end event

private subroutine _of_updatetextsize ();ulong dtparam
RECTF calcRect

if Len(#Text) = 0 then
	szText.cx = 0
	szText.cy = 0
	return
end if

if #MultiLine then
	calcRect.right = _layoutWidth
	dtparam = Painter.DT_EXPANDTABS + Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
else
	dtparam = Painter.DT_EXPANDTABS + Painter.DT_SINGLELINE
end if

Painter.of_CalcTextSize(Font,#Text,dtparam,ref calcRect)

szText.cx = calcRect.right
szText.cy = calcRect.bottom

if szText.cx > _layoutWidth then
	szText.cx = _layoutWidth
end if
end subroutine

public function long of_settext (readonly string text);if #Text= text then return RetCode.OK

#Text= text

_of_UpdateTextSize()
of_UpdatePoints()

return RetCode.OK
end function

public function long of_setalignment (readonly alignment align);if #Alignment = align then return RetCode.OK

choose case align
	case Left!,Center!,Right!
		#Alignment = align
		of_Redraw(false)
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose
end function

public function long of_setmultiline (readonly boolean multiline);if #MultiLine = multiLine then return RetCode.OK

#MultiLine = multiLine

_of_UpdateTextSize()
of_UpdatePoints()

return RetCode.OK
end function

public function unsignedlong of_getstate ();ulong nState

if Not of_IsEnabled() then nState += Enums.STATE_DISABLED

return nState
end function

on n_cst_taskpanelbar_label.create
call super::create
this.font=create font
end on

on n_cst_taskpanelbar_label.destroy
call super::destroy
destroy(this.font)
end on

event onpaint;call super::onpaint;ulong textColor
ulong dtparam

if AncestorReturnValue = 1 then return 1

textColor	= theme.of_GetItemColor(this,theme.CLR_TEXT,of_GetState())

dtparam = Painter.DT_EXPANDTABS
if #MultiLine then
	dtparam += Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
else
	dtparam += Painter.DT_SINGLELINE + Painter.DT_VCENTER + Painter.DT_WORD_ELLIPSIS
end if
if Not KeyDown(KeyAlt!) then
	dtparam += Painter.DT_HIDEPREFIX
end if
choose case #Alignment
	case Left!
		dtparam += Painter.DT_LEFT
	case Center!
		dtparam += Painter.DT_CENTER
	case Right!
		dtparam += Painter.DT_RIGHT
end choose

Painter.of_Drawtext(hdc,Font,#Text,rcPaint,textColor,dtparam)

return 1
end event

event onupdatelayout;call super::onupdatelayout;if AncestorReturnValue = 1 then return 1
_of_UpdateTextSize()
_of_RecalcLayout()
return 0
end event

event oncalclayout;call super::oncalclayout;szLayout.cx = szText.cx
szLayout.cy = szText.cy
end event

type font from n_cst_font within n_cst_taskpanelbar_label descriptor "pb_nvo" = "true" 
end type

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent._of_UpdateTextSize()
Parent.of_UpdatePoints()
end event

