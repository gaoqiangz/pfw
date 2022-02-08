$PBExportHeader$n_cst_ribbonbar_radiobox.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_ribbonbar_radiobox from n_cst_ribbonbar_baseitem
end type
type font from n_cst_font within n_cst_ribbonbar_radiobox
end type
end forward

shared variables
n_imagelist 	__ImageList
Ulong			__RefCount = 0

//Image indexes
int		__Idx_RB_Normal
int		__Idx_RB_Hover
int		__Idx_RB_Down
int		__Idx_RBC_Normal
int		__Idx_RBC_Hover
int		__Idx_RBC_Down
end variables

global type n_cst_ribbonbar_radiobox from n_cst_ribbonbar_baseitem
unsignedinteger #type = 3
event type boolean oninitdata ( string text,  boolean checked,  string tiptext )
font font
end type
global n_cst_ribbonbar_radiobox n_cst_ribbonbar_radiobox

type variables
/*--- Properties ---*/
Public:
Boolean							#Automatic		= true
PrivateWrite		Boolean		#Checked
PrivateWrite 	String 		#Text
String								#TipText
Long								#TipTime
PrivateWrite 	Uint			#TextPosition 	= Enums.RIGHT
ProtectedWrite Alignment	#TextAlign		= Left!
PrivateWrite 	Boolean		#MultiLine

/*--- Implementation ---*/
Private:
RECTF	rcText
RECTF	rcImage
SIZEF 	szText

Ulong _TTID

Boolean _MouseOver			= false
Boolean _MouseDown			= false
Boolean _RightMouseDown	= false

//Images
Constant String	ICO_RB_NORMAL	= "pfw://zip/images[rb_normal.png]"
Constant String	ICO_RB_HOVER	= "pfw://zip/images[rb_hover.png]"
Constant String	ICO_RB_DOWN		= "pfw://zip/images[rb_down.png]"
Constant String	ICO_RBC_NORMAL	= "pfw://zip/images[rbc_normal.png]"
Constant String	ICO_RBC_HOVER	= "pfw://zip/images[rbc_hover.png]"
Constant String	ICO_RBC_DOWN	= "pfw://zip/images[rbc_down.png]"
//Sizes
Constant real ICONSIZE = 13 		//px
end variables

forward prototypes
private subroutine _of_updatetextsize ()
private subroutine _of_showtip (readonly boolean show)
public function boolean of_hasintermediatemode ()
public function boolean of_hascompactmode ()
public function long of_setchecked (readonly boolean checked, readonly boolean triggerevent)
public function long of_setchecked (readonly boolean checked)
public function long of_setmultiline (readonly boolean multiline)
public function long of_settext (readonly string text)
public function long of_settextposition (readonly unsignedinteger position)
public function long of_settextalign (readonly alignment align)
public function unsignedlong of_getstate ()
end prototypes

event type boolean oninitdata(string text, boolean checked, string tiptext);#Text = text
#Checked = checked
#TipText = tiptext

_of_UpdateTextSize()

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
	calcRect.right = 32768
	dtparam = Painter.DT_EXPANDTABS + Painter.DT_WORDBREAK
else
	dtparam = Painter.DT_EXPANDTABS + Painter.DT_SINGLELINE
end if

Painter.of_CalcTextSize(Font,#Text,dtparam,ref calcRect)

szText.cx = calcRect.right
szText.cy = calcRect.bottom
end subroutine

private subroutine _of_showtip (readonly boolean show);RECTF scRect
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

public function boolean of_hasintermediatemode ();return false
end function

public function boolean of_hascompactmode ();return false
end function

public function long of_setchecked (readonly boolean checked, readonly boolean triggerevent);if #Checked = Checked then return RetCode.OK
if triggerEvent then
	if IsPrevented(#ParentRibbonBar.Event OnItemChecking(this)) then return RetCode.FAILED
end if

#Checked = Checked
of_Redraw(false)
	
if triggerEvent then
	#ParentRibbonBar.Event OnItemChecked(this)
end if

return RetCode.OK
end function

public function long of_setchecked (readonly boolean checked);return of_SetChecked(checked,false)
end function

public function long of_setmultiline (readonly boolean multiline);if #MultiLine = multiLine then return RetCode.OK

#MultiLine = multiLine

_of_UpdateTextSize()
of_UpdatePoints()

return RetCode.OK
end function

public function long of_settext (readonly string text);if #Text= text then return RetCode.OK

#Text= text

_of_UpdateTextSize()
of_UpdatePoints()

return RetCode.OK
end function

public function long of_settextposition (readonly unsignedinteger position);if #TextPosition = position then return RetCode.OK

choose case position
	case Enums.LEFT,Enums.RIGHT
		#TextPosition = position
		of_UpdatePoints()
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose
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
if #Checked then nState += Enums.STATE_CHECKED
if Not of_IsEnabled() then nState += Enums.STATE_DISABLED

return nState
end function

on n_cst_ribbonbar_radiobox.create
call super::create
this.font=create font
end on

on n_cst_ribbonbar_radiobox.destroy
call super::destroy
destroy(this.font)
end on

event constructor;call super::constructor;__RefCount ++
if __RefCount = 1 then
	__ImageList = Create n_imagelist
	__ImageList.SetImageSize(ICONSIZE,ICONSIZE)
	__Idx_RB_Normal 		= __ImageList.AddImage(ICO_RB_NORMAL)
	__Idx_RB_Hover 		= __ImageList.AddImage(ICO_RB_HOVER)
	__Idx_RB_Down 		= __ImageList.AddImage(ICO_RB_DOWN)
	__Idx_RBC_Normal	= __ImageList.AddImage(ICO_RBC_NORMAL)
	__Idx_RBC_Hover 		= __ImageList.AddImage(ICO_RBC_HOVER)
	__Idx_RBC_Down 		= __ImageList.AddImage(ICO_RBC_DOWN)
end if
end event

event destructor;call super::destructor;__RefCount --
if __RefCount = 0 then
	Destroy __ImageList
end if

if _TTID > 0 then
	_ToolTip.DelTool(#ParentRibbonBar.#Handle,_TTID)
end if
end event

event onscroll;call super::onscroll;if AncestorReturnValue = 1 then return 1

Painter.OffsetRect(ref rcImage,scrollSize,0)
if szText.cx > 0 then
	Painter.OffsetRect(ref rcText,scrollSize,0)
end if

return 0
end event

event onreposition;call super::onreposition;if AncestorReturnValue = 1 then return 1

if #TextPosition = Enums.LEFT then
	rcImage.left		= rcPaint.right - ICONSIZE
	rcImage.right	= rcImage.left + ICONSIZE
	rcImage.top		= rcPaint.top + (rcPaint.bottom - rcPaint.top - ICONSIZE) / 2
	rcImage.bottom= rcImage.top + ICONSIZE
	if szText.cx > 0 then
		rcText.left		= rcPaint.left
		rcText.right		= rcImage.left - 2
		rcText.top		= rcPaint.top + (rcPaint.bottom - rcPaint.top - szText.cy)/2
		rcText.bottom	= rcText.top + szText.cy
	end if
else
	rcImage.left = rcPaint.left
	rcImage.top = rcPaint.top + (rcPaint.bottom - rcPaint.top - ICONSIZE) / 2
	rcImage.right = rcImage.left + ICONSIZE
	rcImage.bottom = rcImage.top + ICONSIZE
	
	if szText.cx > 0 then
		rcText.left = rcImage.right + 2
		rcText.top = rcPaint.top
		rcText.right = rcPaint.right
		rcText.bottom = rcPaint.bottom
	end if
end if

return 0
end event

event onmousemove;call super::onmousemove;if Not _MouseOver then
	_MouseOver = true
	of_Redraw(true)
	_of_ShowTip(true)
	#ParentRibbonBar.Event OnItemMouseEnter(this,xpos,ypos)
else
	#ParentRibbonBar.Event OnItemMouseMove(this,xpos,ypos)
end if

return 0
end event

event onmouseleave;call super::onmouseleave;_MouseOver = false
of_Redraw(true)
_of_ShowTip(false)

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

event onlbuttondown;call super::onlbuttondown;if Not _MouseOver then return 1

_of_ShowTip(false)
_MouseDown = true
of_Redraw(false)
_of_CaptureMouse(true)

#ParentRibbonBar.Event OnItemMouseDown(this,xpos,ypos)

return 0
end event

event onlbuttonup;call super::onlbuttonup;if Not _MouseDown then return 1

_of_CaptureMouse(false)
_MouseDown = false
of_Redraw(true)

#ParentRibbonBar.Event OnItemMouseUp(this,xpos,ypos)

if _MouseOver then
	#ParentPanel.of_ExitPopupMode(0,true)
	if IsAllowed(#ParentRibbonBar.Event OnItemChecking(this)) then
		if #Automatic and Not #Checked then
		//	of_SetChecked(true)
			#ParentPanel.of_CheckRadios(1,#ParentPanel.of_GetCount(),#ParentPanel.of_GetIndex(this),true)
		end if
		#ParentRibbonBar.Post Event OnItemChecked(this)
	end if
end if

return 0
end event

event onpaint;call super::onpaint;ulong textColor
ulong dtparam

if AncestorReturnValue = 1 then return 1

if #Checked then
	if _MouseDown then
		__ImageList.Draw(__Idx_RBC_Down,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not of_IsEnabled())
	elseif _MouseOver then
		__ImageList.Draw(__Idx_RBC_Hover,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not of_IsEnabled())
	else
		__ImageList.Draw(__Idx_RBC_Normal,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not of_IsEnabled())
	end if
else
	if _MouseDown then
		__ImageList.Draw(__Idx_RB_Down,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not of_IsEnabled())
	elseif _MouseOver then
		__ImageList.Draw(__Idx_RB_Hover,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not of_IsEnabled())
	else
		__ImageList.Draw(__Idx_RB_Normal,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not of_IsEnabled())
	end if
end if

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

Painter.of_Drawtext(hdc,Font,#Text,rcText,textColor,dtparam)

return 1
end event

event onlbuttondblclk;call super::onlbuttondblclk;return Event OnLButtonDown(vKey,xpos,ypos)
end event

event oninit;call super::oninit;_TTID = _ToolTip.AddTool(#ParentRibbonBar.#Handle,false,Win32.TTF_TRANSPARENT + Win32.TTF_TRACK + Win32.TTF_ABSOLUTE)
end event

event oncalclayout;call super::oncalclayout;szLayouts[DPM_LARGE].cx = ICONSIZE
if szText.cx > 0 then
	szLayouts[DPM_LARGE].cx += 2 + szText.cx
end if
if szText.cy > ICONSIZE then
	szLayouts[DPM_LARGE].cy = szText.cy
else
	szLayouts[DPM_LARGE].cy = ICONSIZE
end if
szLayouts[DPM_INTERMEDIATE].cx = 0
szLayouts[DPM_INTERMEDIATE].cy = 0
szLayouts[DPM_COMPACT] = szLayouts[DPM_INTERMEDIATE]
end event

event onrbuttondown;call super::onrbuttondown;if Not _MouseOver then return 1

_of_ShowTip(false)
_RightMouseDown = true
_of_CaptureMouse(true)
#ParentRibbonBar.Event OnItemMouseDown(this,xpos,ypos)

return 0
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

type font from n_cst_font within n_cst_ribbonbar_radiobox descriptor "pb_nvo" = "true" 
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

