$PBExportHeader$n_cst_ribbonbar_link.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_ribbonbar_link from n_cst_ribbonbar_baseitem
end type
type hoverfont from n_cst_font within n_cst_ribbonbar_link
end type
type font from n_cst_font within n_cst_ribbonbar_link
end type
end forward

global type n_cst_ribbonbar_link from n_cst_ribbonbar_baseitem
unsignedinteger #type = 6
event type boolean oninitdata ( string text,  string tiptext )
hoverfont hoverfont
font font
end type
global n_cst_ribbonbar_link n_cst_ribbonbar_link

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

boolean	_MouseOver			= false
boolean	_MouseDown		= false
boolean _RightMouseDown	= false
end variables

forward prototypes
public function boolean of_hascompactmode ()
public function boolean of_hasintermediatemode ()
private subroutine _of_updatetextsize ()
public subroutine _of_showtip (readonly boolean show)
public function long of_settext (readonly string text)
public function long of_setmultiline (readonly boolean multiline)
public function long of_settextalign (readonly alignment align)
public function unsignedlong of_getstate ()
end prototypes

event type boolean oninitdata(string text, string tiptext);#Text= text
#TipText = tiptext

_of_UpdateTextSize()

return true
end event

public function boolean of_hascompactmode ();return false
end function

public function boolean of_hasintermediatemode ();return false
end function

private subroutine _of_updatetextsize ();ulong dtparam
RECTF calcRect

if Len(#Text) = 0 then
	szText.cx = 0
	szText.cy = 0
	return
end if

if #MultiLine then
	calcRect.right = 32768
	dtparam = Painter.DT_EXPANDTABS + Painter.DT_WORDBREAK
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
end subroutine

public subroutine _of_showtip (readonly boolean show);RECTF scRect
POINTF pt
SIZEF toolSize

if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _MouseCaptured then return

if #ParentRibbonBar.#ToolTip and Show then
	if #TipText <> "" then
		Painter.GetScreenRect(ref scRect)
		Painter.GetCursorPos(ref pt)
		_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,false)
		_ToolTip.UpdateTipText(#ParentRibbonBar.#Handle,_TTID,#TipText)
		_ToolTip.GetBubbleSize(#ParentRibbonBar.#Handle,_TTID,ref toolSize.cx,ref toolSize.cy)
		if pt.x + toolSize.cx  > scRect.right then
			_ToolTip.TrackPosition( 0,scRect.right -  toolSize.cx,pt.y + 16)
		else
			_ToolTip.TrackPosition( 0,pt.x,pt.y + 16)
		end if
		if #TipTime > 0 then
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,#TipTime)
		else
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,-1)
		end if
		_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,true)
	else
		_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,false)	
	end if
else
	_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,false)
end if
end subroutine

public function long of_settext (readonly string text);if #Text= text then return RetCode.OK

#Text= text

_of_UpdateTextSize()
of_UpdatePoints()

return RetCode.OK
end function

public function long of_setmultiline (readonly boolean multiline);if #MultiLine = multiLine then return RetCode.OK

#MultiLine = multiLine

_of_UpdateTextSize()
of_UpdatePoints()

return RetCode.OK
end function

public function long of_settextalign (readonly alignment align);if #TextAlign = align then return RetCode.OK

choose case align
	case Left!,Center!,Right!
		#TextAlign = align
		of_Redraw(false)
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose
end function

public function unsignedlong of_getstate ();ulong nState

if _MouseOver then nState += Enums.STATE_HOVER
if _MouseDown then nState += Enums.STATE_PRESSED
if Not of_IsEnabled() then nState += Enums.STATE_DISABLED

return nState
end function

on n_cst_ribbonbar_link.create
call super::create
this.hoverfont=create hoverfont
this.font=create font
end on

on n_cst_ribbonbar_link.destroy
call super::destroy
destroy(this.hoverfont)
destroy(this.font)
end on

event onpaint;call super::onpaint;ulong textColor
ulong dtparam

if AncestorReturnValue = 1 then return 1

textColor	= theme.of_GetItemColor(this,theme.CLR_TEXT,of_GetState())

dtparam = Painter.DT_EXPANDTABS
if #MultiLine then
	dtparam += Painter.DT_WORDBREAK
else
	dtparam += Painter.DT_SINGLELINE + Painter.DT_VCENTER
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

event onmousemove;call super::onmousemove;if Not _MouseOver then
	_MouseOver = true
	of_Redraw(true)
	_of_ShowTip(true)
	#ParentRibbonBar.Event OnItemMouseEnter(this,xpos,ypos)
else
	#ParentRibbonBar.Event OnItemMouseMove(this,xpos,ypos)
end if

Win32.SetCursor(_hCurHand)
		
return 1
end event

event onlbuttondown;call super::onlbuttondown;if Not _MouseOver then return 1

_of_ShowTip(false)
_MouseDown = true
of_Redraw(false)
_of_CaptureMouse(true)

Win32.SetCursor(_hCurHand)

#ParentRibbonBar.Event OnItemMouseDown(this,xpos,ypos)

return 0
end event

event onlbuttonup;call super::onlbuttonup;if Not _MouseDown then return 1

Win32.SetCursor(_hCurArrow)

_of_CaptureMouse(false)
_MouseDown = false
of_Redraw(true)

#ParentRibbonBar.Event OnItemMouseUp(this,xpos,ypos)

if _MouseOver then
	if IsAllowed(#ParentRibbonBar.Event OnItemClicking(this)) then
		#ParentPanel.of_ExitPopupMode(0,true)
		#ParentRibbonBar.Post Event OnItemClicked(this)
	end if
end if

return 0
end event

event onmouseleave;call super::onmouseleave;_MouseOver = false
of_Redraw(true)
_of_ShowTip(false)

Win32.SetCursor(_hCurArrow)

#ParentRibbonBar.Event OnItemMouseLeave(this)
end event

event oncapturechanged;call super::oncapturechanged;if _MouseCaptured then
	_of_CaptureMouse(false)
	_MouseDown = false
	_RightMouseDown = false
	of_Redraw(true)
	#ParentRibbonBar.Event OnItemMouseUp(this,0,0)
	Event OnMouseLeave()
end if
end event

event destructor;call super::destructor;if _TTID > 0 then
	_ToolTip.DelTool(#ParentRibbonBar.#Handle,_TTID)
end if
end event

event onlbuttondblclk;call super::onlbuttondblclk;return Event OnLButtonDown(vKey,xpos,ypos)
end event

event oninit;call super::oninit;_TTID = _ToolTip.AddTool(#ParentRibbonBar.#Handle,false,Win32.TTF_TRANSPARENT + Win32.TTF_TRACK + Win32.TTF_ABSOLUTE)

_hCurArrow = Win32.LoadCursor(0,Win32.IDC_ARROW)
_HCurHand = Win32.LoadCursor(0,Win32.IDC_HAND)
end event

event oncalclayout;call super::oncalclayout;szLayouts[DPM_LARGE].cx = szText.cx
szLayouts[DPM_LARGE].cy = szText.cy
szLayouts[DPM_INTERMEDIATE].cx = 0
szLayouts[DPM_INTERMEDIATE].cy = 0
szLayouts[DPM_COMPACT] = szLayouts[DPM_INTERMEDIATE]
end event

event onrbuttonup;call super::onrbuttonup;if Not _RightMouseDown then return 1

_of_CaptureMouse(false)
_RightMouseDown = false

#ParentRibbonBar.Event OnItemMouseUp(this,xpos,ypos)

if _MouseOver then
	if IsAllowed(#ParentRibbonBar.Event OnItemRightClicking(this)) then
		//#ParentPanel.of_ExitPopupMode(0,true)
		#ParentRibbonBar.Post Event OnItemRightClicked(this)
	end if
end if

return 0
end event

event onrbuttondown;call super::onrbuttondown;if Not _MouseOver then return 1

_of_ShowTip(false)
_RightMouseDown = true
_of_CaptureMouse(true)
#ParentRibbonBar.Event OnItemMouseDown(this,xpos,ypos)

return 0
end event

type hoverfont from n_cst_font within n_cst_ribbonbar_link descriptor "pb_nvo" = "true" 
boolean #underline = true
end type

event onfontchanged;call super::onfontchanged;Parent._of_UpdateTextSize()
Parent.of_UpdatePoints()
end event

on hoverfont.create
call super::create
end on

on hoverfont.destroy
call super::destroy
end on

type font from n_cst_font within n_cst_ribbonbar_link descriptor "pb_nvo" = "true" 
end type

event onfontchanged;call super::onfontchanged;Parent._of_UpdateTextSize()
Parent.of_UpdatePoints()
end event

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

