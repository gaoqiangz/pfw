$PBExportHeader$n_cst_taskpanelbar_button.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_taskpanelbar_button from n_cst_taskpanelbar_baseitem
end type
type timer from n_timer within n_cst_taskpanelbar_button
end type
type font from n_cst_font within n_cst_taskpanelbar_button
end type
end forward

global type n_cst_taskpanelbar_button from n_cst_taskpanelbar_baseitem
unsignedinteger #type = 1
event type boolean oninitdata ( string text,  string image,  string tiptext )
timer timer
font font
end type
global n_cst_taskpanelbar_button n_cst_taskpanelbar_button

type variables
/*--- Properties ---*/
Public:
PrivateWrite	Uint 			#Style
PrivateWrite	Uint			#IconPosition
PrivateWrite	String 		#Text
PrivateWrite	String			#Image
String							#TipText
Long							#TipTime
PrivateWrite	Alignment	#TextAlign
PrivateWrite	Boolean		#MultiLine
PrivateWrite	Boolean		#HighLighted
PrivateWrite	Boolean		#Toggled

/*--- Implementation ---*/
Private:
n_cst_popupmenu _PopupMenu
PAINTPANE 			Chevron
RECTF					rcText
RECTF					rcImage
SIZEF					szText

Ulong _TTID	

Boolean	_flashing
Long		_flashTime
Ulong		_lastPopupTime = 0
Int			_ImageIndex = 0

Boolean _MenuOwner

Boolean	_MouseOver		= false
Boolean	_MouseDown	= false

//Timer ID
Constant Uint TM_FLASH = 1
//Sizes
Constant real CHEVRONWIDTH = 12 	//px
//Props
Constant String PRP_POPUPMENUCREATOR = "{POPUPMENU_CREATOR}"
end variables

forward prototypes
private subroutine _of_updatetextsize ()
public subroutine _of_showtip (readonly boolean show)
public function long of_settext (readonly string text)
public function long of_setmultiline (readonly boolean multiline)
public function long of_setimage (readonly string image)
public function long of_sethighlighted (readonly boolean highlighted)
public function long of_settoggled (readonly boolean toggled)
public function long of_setstyle (readonly unsignedinteger style)
public function long of_flash (readonly long flashtime)
public function long of_getpopupmenu (ref n_cst_popupmenu popupmenu)
private subroutine _of_flashredraw ()
public function long of_seticonposition (readonly unsignedinteger position)
private subroutine _of_fillbkgnd (unsignedlong hdc)
private subroutine _of_drawtext (unsignedlong hdc)
private subroutine _of_drawchevron (unsignedlong hdc)
public function boolean of_isflashing ()
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu)
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu, readonly string clsname)
public function long of_setpopupmenu (ref n_cst_popupmenu popupmenu)
public function long of_setpopupmenu (readonly string clsname)
public function long of_settextalign (readonly alignment align)
public function unsignedlong of_getstate ()
public function unsignedlong of_getchevronstate ()
private function unsignedlong _of_popupmenu (real xpos, real ypos)
end prototypes

event type boolean oninitdata(string text, string image, string tiptext);int newIndex

newIndex = _ItemImageList.AddImage(theme.of_GetItemIcon(this,Image,0))

if Len(Text) = 0 and newIndex = 0 then return false

#Image = Image
_ImageIndex = newIndex

#Text = text
#TipText= tipText

_of_UpdateTextSize()

return true
end event

private subroutine _of_updatetextsize ();real maxWidth
ulong dtparam
RECTF calcRect

if Len(#Text) = 0 then
	szText.cx = 0
	szText.cy = 0
	return
end if

maxWidth =_layoutWidth - 4

if _imageindex > 0 then
	choose case #IconPosition
		case Enums.LEFT,Enums.RIGHT
			maxWidth -= theme.#ItemIconSize.cx + 2
	end choose
end if

 if Chevron.Visible then
	maxWidth -= CHEVRONWIDTH
 end if

if #MultiLine then
	calcRect.right = maxWidth
	dtparam = Painter.DT_EXPANDTABS + Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
else
	dtparam = Painter.DT_EXPANDTABS + Painter.DT_SINGLELINE
end if

Painter.of_CalcTextSize(Font,#Text,dtparam,ref calcRect)

szText.cx = calcRect.right
szText.cy = calcRect.bottom

if szText.cx > maxWidth then
	szText.cx = maxWidth
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

public function long of_setimage (readonly string image);int newIndex
boolean dirty

if #Image= Image then return RetCode.OK

newIndex = _ItemImageList.AddImage(theme.of_GetItemIcon(this,Image,0))

if szText.cx = 0 and newIndex = 0 then return RetCode.E_INVALID_IMAGE

if (_ImageIndex  > 0) <> (newIndex > 0) then
	dirty = true
end if

#Image = Image
_ImageIndex = newIndex

if dirty then
	of_UpdatePoints()
else
	of_Redraw(true)
end if

return RetCode.OK
end function

public function long of_sethighlighted (readonly boolean highlighted);if #HighLighted = HighLighted then return RetCode.OK

#HighLighted = HighLighted

of_Redraw(true)

return RetCode.OK
end function

public function long of_settoggled (readonly boolean toggled);if #Style = Enums.BTS_DROPDOWN then return RetCode.E_NO_SUPPORT
if #Toggled = toggled then return RetCode.OK

#Toggled = toggled

of_Redraw(true)

return RetCode.OK
end function

public function long of_setstyle (readonly unsignedinteger style);if style = Enums.BTS_DROPDOWN and #Toggled then return RetCode.FAILED
if #Style = style then return RetCode.OK

#Style = style

if #Style = Enums.BTS_DROPDOWN or #Style = Enums.BTS_SPLIT then
	Chevron.Visible = true
else
	Chevron.Visible = false
end if

_of_UpdateTextSize()
of_UpdatePoints()

return RetCode.OK
end function

public function long of_flash (readonly long flashtime);//_flashTime:sec
//-1:always
//0:stop
if flashTime < 0 and flashTime <> -1 then return RetCode.E_INVALID_ARGUMENT
if _flashTime = -1 and flashTime = _flashTime then return RetCode.OK
if _flashTime = 0 and flashTime = _flashTime then return RetCode.OK
if _flashTime = flashTime * 1000 then return RetCode.OK

_flashTime = flashTime

if _flashTime > 0 then
	_flashTime *= 1000	//转换为毫秒
end if

if _flashTime = -1 or _flashTime > 0 then
	_flashing = true
	_of_FlashRedraw()
	Timer.Start(TM_FLASH,#ParentTaskPanelBar.#FlashFadeTime)
else
	_flashing = false
	of_Redraw(true)
end if

return RetCode.OK
end function

public function long of_getpopupmenu (ref n_cst_popupmenu popupmenu);try
	PopupMenu = _PopupMenu
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(PopupMenu),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

private subroutine _of_flashredraw ();ulong safeDC

if Not of_IsEnabled() or _MouseOver or _MouseDown or &
	Chevron.MouseOver or Chevron.MouseDown or #Toggled then
	return
end if

safeDC=of_GetSafeDC()

if safeDC > 0 then

	Event OnEraseBkgnd(safeDC)
	Event OnPaint(safeDC)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(rcPaint)
	
	of_ReleaseDC(safeDC,hUpdateRgn,#ParentTaskPanelBar.#FlashFadeTime)
	
	Painter.DeleteRgn(hUpdateRgn)
	
end if
end subroutine

public function long of_seticonposition (readonly unsignedinteger position);if #IconPosition = position then return RetCode.OK

choose case position
	case Enums.LEFT,Enums.TOP,Enums.RIGHT,Enums.BOTTOM
		#IconPosition = position
		_of_UpdateTextSize()
		of_UpdatePoints()
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose
end function

private subroutine _of_fillbkgnd (unsignedlong hdc);ulong bkColor,borderColor,nState
ulong chevronBorderColor,chevronBkColor,nChevronState
RADIUSF rdBorder,rdChevron
RECTF paintRect

nState = of_GetState()
if BitTest(nState,Enums.STATE_DISABLED) and Not #Toggled then return

bkColor = theme.of_GetItemColor(this,theme.CLR_BKGND,nState)
borderColor = theme.of_GetItemColor(this,theme.CLR_BORDER,nState)

rdBorder = theme.#ItemRoundSize

if #Style = Enums.BTS_SPLIT then
	nChevronState = of_GetChevronState()
	chevronBkColor = theme.of_GetItemColor(this,theme.CLR_CHEVRONBKGND,nChevronState)
	chevronBorderColor = theme.of_GetItemColor(this,theme.CLR_CHEVRONBORDER,nChevronState)
	if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 and BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
		if _Flashing then
			bkColor = ARGBLighten(bkColor,0.4)
		end if
	end if
	rdBorder.rightTop = 0
	rdBorder.rightBottom = 0
	rdChevron.rightTop = theme.#ItemRoundSize.rightTop
	rdChevron.rightBottom = theme.#ItemRoundSize.rightBottom
	paintRect = rcPaint
	paintRect.right = Chevron.rcPaint.left + 1
	if BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
		if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
			borderColor = ARGBDarken(borderColor,0.2)
		end if
		if BitAND(nState,Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
			Painter.ThemeFill( hdc, paintRect, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
														theme.#ItemBorderStyle,borderColor,rdBorder)
		else
			Painter.DrawThemeBorder(hdc,paintRect,borderColor,Enums.TRANSPARENT,theme.#ItemBorderStyle,rdBorder)
		end if
		Painter.ThemeFill( hdc, Chevron.rcPaint, chevronBkColor,Enums.VERT,theme.#ItemBkgndStyle,nChevronState,false,&
												theme.#ItemBorderStyle,ARGBDarken(chevronBorderColor,0.2),rdChevron)
	elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
		if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
			borderColor = ARGBDarken(borderColor,0.2)
		end if
		Painter.DrawThemeBorder(hdc,Chevron.rcPaint,chevronBorderColor,Enums.TRANSPARENT,theme.#ItemBorderStyle,rdChevron)
		Painter.ThemeFill( hdc, paintRect, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
													theme.#ItemBorderStyle,borderColor,rdBorder)
	elseif _Flashing then
		rdBorder = theme.#ItemRoundSize
		Painter.DrawThemeBorder(hdc,rcPaint,borderColor,Enums.TRANSPARENT,theme.#ItemBorderStyle,rdBorder)
	end if
else
	if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
		if _Flashing then
			bkColor = ARGBLighten(bkColor,0.4)
		end if
	end if
	if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
		Painter.ThemeFill( hdc, rcPaint, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
													theme.#ItemBorderStyle,borderColor,rdBorder)
	elseif _Flashing then
		rdBorder = theme.#ItemRoundSize
		Painter.DrawThemeBorder(hdc,rcPaint,borderColor,Enums.TRANSPARENT,theme.#ItemBorderStyle,rdBorder)
	end if
end if
end subroutine

private subroutine _of_drawtext (unsignedlong hdc);ulong textColor
ulong dtparam

textColor	= theme.of_GetItemColor(this,theme.CLR_TEXT,of_GetState())

dtparam = Painter.DT_EXPANDTABS
if #MultiLine then
	dtparam += Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
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

if _MouseDown or #Toggled then
	Painter.of_DrawText(hdc,Font,#Text,rcText.left,rcText.top + 1,rcText.right,rcText.bottom + 1,textColor,dtparam)
else
	Painter.of_Drawtext(hdc,Font,#Text,rcText,textColor,dtparam)
end if
end subroutine

private subroutine _of_drawchevron (unsignedlong hdc);Constant real ARROWSIZE	=	6	//px
ulong lineColor,arrowColor,nState
POINTF pt1,pt2,pt3

if Not Chevron.Visible then return

nState = of_GetState()
lineColor 	= theme.of_GetItemColor(this,theme.CLR_LINE,nState)
arrowColor	= theme.of_GetItemColor(this,theme.CLR_ARROW,nState)

//Draw line
if #Style = Enums.BTS_SPLIT and of_IsEnabled() then
	if (Not _MouseOver and Not _MouseDown and &
		Not Chevron.MouseDown and Not Chevron.MouseDown and Not #Toggled) and &
		(#HighLighted or ((_flashTime = -1 or _flashTime > 0) and _flashing)) then
		Painter.DrawLine(hdc,&
						Chevron.rcPaint.left,&
						Chevron.rcPaint.top + 1,&
						Chevron.rcPaint.left,&
						Chevron.rcPaint.bottom - 1,&
						lineColor,Enums.LS_SOLID,&
						false,1)
	end if
end if

//Draw arrow
pt1.x = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE) / 2
pt1.y = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - ARROWSIZE / 2) / 2
if Chevron.MouseDown or (#Style = Enums.BTS_DROPDOWN and _MouseDown) then
	pt1.y += 1
end if
pt2.x = pt1.x + ARROWSIZE
pt2.y = pt1.y
pt3.x = pt1.x + ARROWSIZE / 2
pt3.y = pt1.y + ARROWSIZE / 2

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

public function boolean of_isflashing ();return (_flashTime = -1 or _flashTime > 0)
end function

private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu);return _of_CreatePopupMenu(ref popupmenu,"")
end function

private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu, readonly string clsname);n_cst_popupmenu ln_menu

try
	if Len(clsName) = 0 then
		ln_menu = Create n_cst_popupmenu
	else
		ln_menu = Create Using clsName
	end if
	popupmenu = ln_menu
	popupmenu.#Tag = PRP_POPUPMENUCREATOR
catch(Throwable ex)
	if IsValidObject(ln_menu) then
		Destroy ln_menu
	end if
	return false
end try

return IsValidObject(popupmenu)
end function

public function long of_setpopupmenu (ref n_cst_popupmenu popupmenu);boolean bOwner

if #Style <> Enums.BTS_DROPDOWN and #Style <> Enums.BTS_SPLIT then return RetCode.E_NO_SUPPORT
if IsValidObject(PopupMenu) and _PopupMenu = PopupMenu then return RetCode.OK

if Not IsValidObject(PopupMenu) then
	if Not _of_CreatePopupMenu(ref PopupMenu) then return RetCode.E_INVALID_OBJECT
	bOwner = true
	PopupMenu.#Tag = ""
elseif PopupMenu.#Tag = PRP_POPUPMENUCREATOR then
	bOwner = true
	PopupMenu.#Tag = ""
end if

if _MenuOwner then
	Destroy _PopupMenu
end if

_PopupMenu = PopupMenu
_MenuOwner = bOwner

return RetCode.OK
end function

public function long of_setpopupmenu (readonly string clsname);long rtCode
n_cst_popupmenu popupMenu

if Not _of_CreatePopupMenu(ref popupMenu,clsName) then return RetCode.E_INVALID_TYPE

rtCode = of_SetPopupMenu(ref popupMenu)
if IsFailed(rtCode) then
	Destroy popupMenu
end if

return rtCode
end function

public function long of_settextalign (readonly alignment align);if #TextAlign = align then return RetCode.OK

choose case align
	case Left!,Center!,Right!
		#TextAlign = align
		
		of_Redraw(false)
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function unsignedlong of_getstate ();ulong nState

if #Toggled or (#Style = Enums.BTS_DROPDOWN and _MouseDown) then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if _MouseOver and Not Chevron.MouseOver  then nState += Enums.STATE_HOVER
	if _MouseDown then nState += Enums.STATE_PRESSED
end if
if #Highlighted then nState += Enums.STATE_HIGHLIGHTED
if _flashTime = -1 or _flashTime > 0 then nState += Enums.STATE_FLASHING
if Not of_IsEnabled() then nState += Enums.STATE_DISABLED

return nState
end function

public function unsignedlong of_getchevronstate ();ulong nState

if Chevron.MouseDown then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if Chevron.MouseOver then nState += Enums.STATE_HOVER
end if

return nState
end function

private function unsignedlong _of_popupmenu (real xpos, real ypos);ulong rtCode
ulong pmFlags

if Not IsValidObject(_PopupMenu) then return 0

_PopupMenu.of_SetToolTip(#ParentTaskPanelBar.#ToolTip)
_PopupMenu.theme.of_SetTheme(theme)

if #Style = Enums.BTS_DROPDOWN then
	xpos = rcPaint.left
	ypos = rcPaint.bottom
else
	xpos = Chevron.rcPaint.left
	ypos = Chevron.rcPaint.bottom
end if

pmFlags = Win32.TPM_LEFTALIGN + Win32.TPM_TOPALIGN
if IsPrevented(#ParentTaskPanelBar.Event OnPopupMenu(this,ref xpos,ref ypos,ref pmFlags)) then return 0

rtCode = _PopupMenu.of_Popup(#ParentTaskPanelBar.#Handle,xpos,ypos,pmFlags)

_lastPopupTime = Cpu()

return rtCode
end function

on n_cst_taskpanelbar_button.create
call super::create
this.timer=create timer
this.font=create font
end on

on n_cst_taskpanelbar_button.destroy
call super::destroy
destroy(this.timer)
destroy(this.font)
end on

event oninit;call super::oninit;_TTID = _ToolTip.AddTool(#ParentTaskPanelBar.#Handle,false,Win32.TTF_SUBCLASS + Win32.TTF_TRANSPARENT)
end event

event destructor;call super::destructor;if _MenuOwner then
	Destroy _PopupMenu
end if

if _TTID > 0 then
	_ToolTip.DelTool(#ParentTaskPanelBar.#Handle,_TTID)
end if
end event

event oncapturechanged;call super::oncapturechanged;if _MouseCaptured then
	_of_CaptureMouse(false)
	_MouseDown = false
	if Chevron.MouseDown then
		Chevron.MouseDown = false
	end if
	of_Redraw(true)
	#ParentTaskPanelBar.Event OnItemMouseUp(this,0,0)
	Event OnMouseLeave()
end if
end event

event onlbuttondblclk;call super::onlbuttondblclk;return Event OnLButtonDown(vKey,xpos,ypos)
end event

event onlbuttondown;call super::onlbuttondown;if Not _MouseOver then return 1

if #Style = Enums.BTS_DROPDOWN or &
	(#Style = Enums.BTS_SPLIT and Chevron.MouseOver) then
	ulong pmCode
	
	if Cpu() - _lastPopupTime < 100 then
		return 1
	end if
	
	_of_ShowTip(false)
	
	if #Style = Enums.BTS_SPLIT then
		Chevron.MouseDown = true
	else
		_MouseDown = true
		#ParentTaskPanelBar.Event OnItemMouseDown(this,xpos,ypos)
	end if
	of_Redraw(false)
	
	pmCode = _of_PopupMenu(xpos,ypos)
		
	if #Style = Enums.BTS_SPLIT then
		Chevron.MouseDown = false
	else
		_MouseDown = false
	end if
	of_Redraw(true)
	
	if pmCode > 0 then
		if IsAllowed(#ParentTaskPanelBar.Event OnMenuSelecting(this,pmCode)) then
			#ParentTaskPanelBar.Post Event OnMenuSelected(this,pmCode)
		end if
	end if
else
	_of_ShowTip(false)
	_MouseDown = true
	of_Redraw(false)
	_of_CaptureMouse(true)
	#ParentTaskPanelBar.Event OnItemMouseDown(this,xpos,ypos)
end if

return 0
end event

event onlbuttonup;call super::onlbuttonup;if Not _MouseDown then return 1

_of_CaptureMouse(false)
_MouseDown = false
of_Redraw(true)

#ParentTaskPanelBar.Event OnItemMouseUp(this,xpos,ypos)

if _MouseOver and Not Chevron.MouseOver then
	if IsAllowed(#ParentTaskPanelBar.Event OnItemClicking(this)) then
		#ParentTaskPanelBar.Post Event OnItemClicked(this)
	end if
end if

return 0
end event

event onmouseleave;call super::onmouseleave;_MouseOver = false
Chevron.MouseOver = false
of_Redraw(true)
_of_ShowTip(false)

#ParentTaskPanelBar.Event OnItemMouseLeave(this)
end event

event onmousemove;call super::onmousemove;if Not _MouseOver then
	_MouseOver = true
	if Chevron.Visible and #Style = Enums.BTS_SPLIT then
		if Painter.PtInRect(ref Chevron.rcPaint,xpos,ypos) then
			Chevron.MouseOver = true
		else
			_of_ShowTip(true)
		end if
	else
		_of_ShowTip(true)
	end if
	of_Redraw(true)
	#ParentTaskPanelBar.Event OnItemMouseEnter(this,xpos,ypos)
else
	if Chevron.Visible and #Style = Enums.BTS_SPLIT then
		if Painter.PtInRect(ref Chevron.rcPaint,xpos,ypos) then
			if Not Chevron.MouseOver then
				Chevron.MouseOver = true
				of_Redraw(true)
				_of_ShowTip(false)
			end if
		else
			if Chevron.MouseOver then
				Chevron.MouseOver = false
				of_Redraw(true)
				_of_ShowTip(true)
			end if
		end if
	end if
	#ParentTaskPanelBar.Event OnItemMouseMove(this,xpos,ypos)
end if

return 0
end event

event onpaint;call super::onpaint;if AncestorReturnValue = 1 then return 1

_of_FillBkgnd(hdc)

if _ImageIndex > 0 then
	if _MouseDown or #Toggled then
		_ItemImageList.Draw(_ImageIndex,hdc,&
										rcImage.left,&
										rcImage.top + 1,&
										Not of_IsEnabled())
	else
		_ItemImageList.Draw(_ImageIndex,hdc,&
										rcImage.left,&
										rcImage.top,&
										Not of_IsEnabled())
	end if
end if
_of_DrawText(hdc)

if Chevron.Visible then
	_of_DrawChevron(hdc)
end if

return 1
end event

event onscroll;call super::onscroll;if AncestorReturnValue = 1 then return 1

if szText.cx > 0 then
	Painter.OffsetRect(ref rcText,0,scrollSize)
end if
if _ImageIndex > 0 then
	Painter.OffsetRect(ref rcImage,0,scrollSize)
end if
if Chevron.Visible then
	Painter.OffsetRect(ref Chevron.rcPaint,0,scrollSize)
end if

return 0
end event

event onthemechanged;call super::onthemechanged;choose case eventflag
	case theme.EVT_THEME,&
		theme.EVT_ITEMICONSIZE
		_of_UpdateTextSize()
		_of_RecalcLayout()
end choose
end event

event onupdatelayout;call super::onupdatelayout;if AncestorReturnValue = 1 then return 1
_of_UpdateTextSize()
_of_RecalcLayout()
return 0
end event

event ontimer;call super::ontimer;int index

if id = TM_FLASH then
	if _flashTime = 0 then return false
	if _flashTime > 0 then
		_flashTime -= #ParentTaskPanelBar.#FlashFadeTime
		if _flashTime < 0 then
			_flashTime = 0
		end if
	end if
	_flashing = (Not _flashing and _FlashTime <> 0)
	_of_FlashRedraw()
	return (_flashTime <> 0)
end if

return true
end event

event onreposition;call super::onreposition;real itemWidth,itemHeight
RECTF paintRect

if AncestorReturnValue = 1 then return 1

paintRect = rcPaint

Painter.InflateRect(ref paintRect,-2,-2)
if Chevron.Visible then
	paintRect.right -= CHEVRONWIDTH
end if

itemWidth = rcPaint.right - rcPaint.left
itemHeight = rcPaint.bottom - rcPaint.top

if _imageindex > 0 then
	if szText.cx > 0 then
		choose case #IconPosition
			case Enums.LEFT
				//Set rcImage
				rcImage.left		= paintRect.left
				rcImage.right	= rcImage.left + theme.#ItemIconSize.cx
				rcImage.top		= paintRect.top + (itemHeight - theme.#ItemIconSize.cy) / 2 //取中间
				rcImage.bottom= rcImage.top + theme.#ItemIconSize.cy
				//Set rcText
				rcText.left		= rcImage.right + 2
				rcText.right		= paintRect.right
				rcText.top		= paintRect.top + (itemHeight - szText.cy)/2	//取中间
				rcText.bottom	= rcText.top + szText.cy
			case Enums.TOP
				//Set rcImage
				rcImage.left		= paintRect.left + (itemWidth - theme.#ItemIconSize.cx)/2 	//取中间
				rcImage.right	= rcImage.left + theme.#ItemIconSize.cx
				rcImage.top		= paintRect.top
				rcImage.bottom= rcImage.top + theme.#ItemIconSize.cy
				//Set rcText
				rcText.left		= paintRect.left
				rcText.right		= paintRect.right
				rcText.top		= rcImage.bottom + 2
				if (paintRect.bottom - rcText.top) > szText.cy then
					rcText.top 	+= (paintRect.bottom - rcText.top  - szText.cy)/2 //取中间
				end if
				rcText.bottom	= rcText.top + szText.cy
			case Enums.RIGHT
				//Set rcImage
				rcImage.left		= paintRect.right - theme.#ItemIconSize.cx
				rcImage.right	= rcImage.left + theme.#ItemIconSize.cx
				rcImage.top		= paintRect.top + (itemHeight - theme.#ItemIconSize.cy) / 2 //取中间
				rcImage.bottom= rcImage.top + theme.#ItemIconSize.cy
				//Set rcText
				rcText.left		= paintRect.left
				rcText.right		= rcImage.left - 2
				rcText.top		= paintRect.top + (itemHeight - szText.cy)/2	//取中间
				rcText.bottom	= rcText.top + szText.cy
			case Enums.BOTTOM
				//Set rcImage
				rcImage.left		= paintRect.left + (itemWidth - theme.#ItemIconSize.cx)/2 	//取中间
				rcImage.right	= rcImage.left + theme.#ItemIconSize.cx
				rcImage.top		= paintRect.bottom - theme.#ItemIconSize.cy
				rcImage.bottom= rcImage.top + theme.#ItemIconSize.cy
				//Set rcText
				rcText.left		= paintRect.left
				rcText.right		= paintRect.right
				rcText.top		= paintRect.top
				if (rcImage.top - 2 - rcText.top) > szText.cy then
					rcText.top 	+= (rcImage.top - 2 - rcText.top  - szText.cy)/2 //取中间
				end if
				rcText.bottom	= rcText.top + szText.cy
		end choose
	else
		//Set rcImage
		rcImage.left		= paintRect.left + (itemWidth - theme.#ItemIconSize.cx)/2 	//取中间
		rcImage.right	= rcImage.left + theme.#ItemIconSize.cx
		rcImage.top		= paintRect.top + (itemHeight - theme.#ItemIconSize.cy) / 2 //取中间
		rcImage.bottom= rcImage.top + theme.#ItemIconSize.cy
	end if
elseif szText.cx > 0 then
	//Set rcText
	rcText.left		= paintRect.left
	rcText.right		= paintRect.right
	rcText.top		= paintRect.top + (itemHeight - szText.cy)/2	//取中间
	rcText.bottom	= rcText.top + szText.cy
end if

//Set chevron
if Chevron.Visible then
	Chevron.rcPaint.left		= rcPaint.right - CHEVRONWIDTH
	Chevron.rcPaint.right		= rcPaint.right
	Chevron.rcPaint.top		= rcPaint.top
	Chevron.rcPaint.bottom	= rcPaint.bottom
end if

return 0
end event

event oncalclayout;call super::oncalclayout;if _imageindex > 0 then
	if szText.cx > 0 then
		choose case #IconPosition
			case Enums.LEFT,Enums.RIGHT
				szLayout.cx = 2 + theme.#ItemIconSize.cx + 2 + szText.cx + 2
				if szText.cy > theme.#ItemIconSize.cy then
					szLayout.cy = 2 + szText.cy + 2
				else
					szLayout.cy = 2 + theme.#ItemIconSize.cy + 2
				end if
			case Enums.TOP,Enums.BOTTOM
				if szText.cx > theme.#ItemIconSize.cx then
					szLayout.cx = 2 + szText.cx + 2
				else
					szLayout.cx = 2 + theme.#ItemIconSize.cx + 2
				end if
				szLayout.cy = 2 + theme.#ItemIconSize.cy + 2 + szText.cy + 2
		end choose
	else
		szLayout.cx = 2 + theme.#ItemIconSize.cx + 2
		szLayout.cy = 2 + theme.#ItemIconSize.cy + 2
	end if
elseif szText.cx > 0 then
	szLayout.cx = 2 + szText.cx + 2
	szLayout.cy = 2 + szText.cy + 2
end if

if Chevron.Visible then
	szLayout.cx += CHEVRONWIDTH
end if
end event

type timer from n_timer within n_cst_taskpanelbar_button descriptor "pb_nvo" = "true" 
end type

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

event ontimer;call super::ontimer;return Parent.Event OnTimer(id)
end event

type font from n_cst_font within n_cst_taskpanelbar_button descriptor "pb_nvo" = "true" 
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

