$PBExportHeader$n_cst_taskpanelbar_link.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_taskpanelbar_link from n_cst_taskpanelbar_baseitem
end type
type hoverfont from n_cst_font within n_cst_taskpanelbar_link
end type
type font from n_cst_font within n_cst_taskpanelbar_link
end type
end forward

global type n_cst_taskpanelbar_link from n_cst_taskpanelbar_baseitem
unsignedinteger #type = 6
event type boolean oninitdata ( string text,  string tiptext )
hoverfont hoverfont
font font
end type
global n_cst_taskpanelbar_link n_cst_taskpanelbar_link

type variables
/*--- Properties ---*/
Public:
PrivateWrite String 		#Text
String 						#TipText
Long							#TipTime
PrivateWrite Alignment	#TextAlign
PrivateWrite Boolean		#MultiLine

/*--- Implementation ---*/
Private:
SIZEF 	szText

ulong	_TTID

ulong _hCurHand
ulong _hCurArrow

boolean	_MouseOver		= false
boolean	_MouseDown	= false
end variables

forward prototypes
public function long of_settext (string text)
private subroutine _of_updatetextsize ()
public subroutine _of_showtip (readonly boolean show)
public function long of_settextalign (readonly alignment align)
public function long of_setmultiline (readonly boolean multiline)
public function unsignedlong of_getstate ()
end prototypes

event type boolean oninitdata(string text, string tiptext);#Text= text
#TipText = tiptext

_of_UpdateTextSize()

return true
end event

public function long of_settext (string text);if #Text= text then return RetCode.OK

#Text= text

_of_UpdateTextSize()
of_UpdatePoints()

return RetCode.OK
end function

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

if HoverFont.#WordSize.cx > Font.#WordSize.cx then
	Painter.of_CalcTextSize(HoverFont,#Text,dtparam,ref calcRect)
else
	Painter.of_CalcTextSize(Font,#Text,dtparam,ref calcRect)
end if

szText.cx = calcRect.right
szText.cy = calcRect.bottom

if szText.cx > _layoutWidth then
	szText.cx = _layoutWidth
end if
end subroutine

public subroutine _of_showtip (readonly boolean show);if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _MouseCaptured then return

if #ParentTaskPanelBar.#ToolTip and Show then
	if #TipText <> "" then
		if #TipTime > 0 then
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,#TipTime)
		else
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,-1)
		end if
		_ToolTip.UpdateTipText(#ParentTaskPanelBar.#Handle,_TTID,#TipText)
		_ToolTip.UpdateToolRect(#ParentTaskPanelBar.#Handle,_TTID,rcPaint.Left,rcPaint.Top,rcPaint.Right,&
											rcPaint.Bottom)
	else
		_ToolTip.UpdateToolRect(#ParentTaskPanelBar.#Handle,_TTID,0,0,0,0)
	end if
else
	_ToolTip.UpdateToolRect(#ParentTaskPanelBar.#Handle,_TTID,0,0,0,0)
end if
end subroutine

public function long of_settextalign (readonly alignment align);if #TextAlign = align then return RetCode.OK

choose case align
	case Left!,Center!,Right!
		#TextAlign = align
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

if _MouseOver then nState += Enums.STATE_HOVER
if _MouseDown then nState += Enums.STATE_PRESSED
if Not of_IsEnabled() then nState += Enums.STATE_DISABLED

return nState
end function

on n_cst_taskpanelbar_link.create
call super::create
this.hoverfont=create hoverfont
this.font=create font
end on

on n_cst_taskpanelbar_link.destroy
call super::destroy
destroy(this.hoverfont)
destroy(this.font)
end on

event oninit;call super::oninit;_TTID = _ToolTip.AddTool(#ParentTaskPanelBar.#Handle,false,Win32.TTF_SUBCLASS + Win32.TTF_TRANSPARENT)

_hCurArrow = Win32.LoadCursor(0,Win32.IDC_ARROW)
_HCurHand = Win32.LoadCursor(0,Win32.IDC_HAND)
end event

event destructor;call super::destructor;if _TTID > 0 then
	_ToolTip.DelTool(#ParentTaskPanelBar.#Handle,_TTID)
end if
end event

event oncapturechanged;call super::oncapturechanged;if _MouseCaptured then
	_of_CaptureMouse(false)
	_MouseDown = false
	of_Redraw(true)
	#ParentTaskPanelBar.Event OnItemMouseUp(this,0,0)
	Event OnMouseLeave()
end if
end event

event onlbuttondblclk;call super::onlbuttondblclk;return Event OnLButtonDown(vKey,xpos,ypos)
end event

event onlbuttondown;call super::onlbuttondown;if Not _MouseOver then return 1

_of_ShowTip(false)
_MouseDown = true
of_Redraw(false)
_of_CaptureMouse(true)

Win32.SetCursor(_hCurHand)

#ParentTaskPanelBar.Event OnItemMouseDown(this,xpos,ypos)

return 0
end event

event onlbuttonup;call super::onlbuttonup;if Not _MouseDown then return 1

Win32.SetCursor(_hCurArrow)

_of_CaptureMouse(false)
_MouseDown = false
of_Redraw(true)

#ParentTaskPanelBar.Event OnItemMouseUp(this,xpos,ypos)

if _MouseOver then
	if IsAllowed(#ParentTaskPanelBar.Event OnItemClicking(this)) then
		#ParentTaskPanelBar.Post Event OnItemClicked(this)
	end if
end if

return 0
end event

event onmouseleave;call super::onmouseleave;_MouseOver = false
of_Redraw(true)
_of_ShowTip(false)

Win32.SetCursor(_hCurArrow)

#ParentTaskPanelBar.Event OnItemMouseLeave(this)
end event

event onmousemove;call super::onmousemove;if Not _MouseOver then
	_MouseOver = true
	of_Redraw(true)
	_of_ShowTip(true)
	#ParentTaskPanelBar.Event OnItemMouseEnter(this,xpos,ypos)
else
	#ParentTaskPanelBar.Event OnItemMouseMove(this,xpos,ypos)
end if

Win32.SetCursor(_hCurHand)

return 1
end event

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
choose case #TextAlign
	case Left!
		dtparam += Painter.DT_LEFT
	case Center!
		dtparam += Painter.DT_CENTER
	case Right!
		dtparam += Painter.DT_RIGHT
end choose

if _MouseOver or _MouseDown then
	Painter.of_Drawtext(hdc,HoverFont,#Text,rcPaint,textColor,dtparam)
else
	Painter.of_Drawtext(hdc,Font,#Text,rcPaint,textColor,dtparam)
end if

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

type hoverfont from n_cst_font within n_cst_taskpanelbar_link descriptor "pb_nvo" = "true" 
boolean #underline = true
end type

on hoverfont.create
call super::create
end on

on hoverfont.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent._of_UpdateTextSize()
Parent.of_UpdatePoints()
end event

type font from n_cst_font within n_cst_taskpanelbar_link descriptor "pb_nvo" = "true" 
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

