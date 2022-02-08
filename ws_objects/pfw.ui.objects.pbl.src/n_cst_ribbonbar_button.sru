$PBExportHeader$n_cst_ribbonbar_button.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_ribbonbar_button from n_cst_ribbonbar_baseitem
end type
type font from n_cst_font within n_cst_ribbonbar_button
end type
type timer from n_timer within n_cst_ribbonbar_button
end type
end forward

shared variables

end variables

global type n_cst_ribbonbar_button from n_cst_ribbonbar_baseitem
unsignedinteger #type = 1
event type boolean oninitdata ( string text,  string smallimage,  string largeimage,  string tiptext )
font font
timer timer
end type
global n_cst_ribbonbar_button n_cst_ribbonbar_button

type variables
/*--- Properties ---*/
Public:
PrivateWrite Uint 			#Style
PrivateWrite String 		#Text
PrivateWrite String		#SmallImage
PrivateWrite String		#LargeImage
String							#TipText
Long							#TipTime
PrivateWrite	Alignment 	#TextAlign
PrivateWrite Boolean		#MultiLine
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
Int			_SmallImageIndex = 0
Int			_LargeImageIndex = 0

boolean _MenuOwner

Boolean _MouseOver			= false
Boolean _MouseDown			= false
Boolean _RightMouseDown 	= false

//Timer ID
Constant Uint TM_FLASH = 1
//Sizes
Constant real CHEVRONSIZE = 12 	//px
//Props
Constant String PRP_POPUPMENUCREATOR = "{POPUPMENU_CREATOR}"
end variables

forward prototypes
private subroutine _of_updatetextsize ()
private subroutine _of_drawtext (unsignedlong hdc)
public function boolean of_haslargemode ()
public function boolean of_hasintermediatemode ()
public function boolean of_hascompactmode ()
private subroutine _of_drawchevron (readonly unsignedlong hdc)
private subroutine _of_showtip (readonly boolean show)
private subroutine _of_fillbkgnd (readonly unsignedlong hdc)
private subroutine _of_flashredraw ()
public function boolean of_isflashing ()
public function long of_getpopupmenu (ref n_cst_popupmenu popupmenu)
public function long of_flash (readonly long flashtime)
public function long of_sethighlighted (readonly boolean highlighted)
public function long of_setimage (readonly string smallimage, readonly string largeimage)
public function long of_setmultiline (readonly boolean multiline)
public function long of_setstyle (readonly Uint style)
public function long of_settext (readonly string text)
public function long of_settoggled (readonly boolean toggled)
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu)
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu, readonly string clsname)
public function long of_setpopupmenu (ref n_cst_popupmenu popupmenu)
public function long of_setpopupmenu (readonly string clsname)
public function long of_settextalign (readonly alignment align)
public function unsignedlong of_getstate ()
public function unsignedlong of_getchevronstate ()
private function unsignedlong _of_popupmenu (real xpos, real ypos)
end prototypes

event type boolean oninitdata(string text, string smallimage, string largeimage, string tiptext);int newSmallIndex,newLargeIndex

newSmallIndex = _SmallImageList.AddImage(smallImage)
newLargeIndex = _LargeImageList.AddImage(largeImage)

if Len(Text) = 0 and newSmallIndex = 0 and newLargeIndex = 0 then return false

#SmallImage = smallImage
_SmallImageIndex = newSmallIndex

#LargeImage = largeImage
_LargeImageIndex = newLargeIndex

#Text = text
#TipText= tipText

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

private subroutine _of_drawtext (unsignedlong hdc);ulong textColor
ulong dtparam

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

if _MouseDown or #Toggled then
	Painter.of_DrawText(hdc,Font,#Text,rcText.left,rcText.top + 1,rcText.right,rcText.bottom + 1,textColor,dtparam)
else
	Painter.of_Drawtext(hdc,Font,#Text,rcText,textColor,dtparam)
end if
end subroutine

public function boolean of_haslargemode ();return (_LargeImageIndex > 0)
end function

public function boolean of_hasintermediatemode ();return (szText.cx > 0 and (#MinDisplayMode = DPM_INTERMEDIATE or #MinDisplayMode = DPM_COMPACT))
end function

public function boolean of_hascompactmode ();return (_SmallImageIndex > 0 and #MinDisplayMode = DPM_COMPACT)
end function

private subroutine _of_drawchevron (readonly unsignedlong hdc);Constant real ARROWSIZE	=	6	//px
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
		if _DisplayMode = DPM_LARGE then
			Painter.DrawLine(hdc,&
							Chevron.rcPaint.left + 1,&
							Chevron.rcPaint.top,&
							Chevron.rcPaint.right - 1,&
							Chevron.rcPaint.top,&
							lineColor,Enums.LS_SOLID,&
							false,1)
		else
			Painter.DrawLine(hdc,&
							Chevron.rcPaint.left,&
							Chevron.rcPaint.top + 1,&
							Chevron.rcPaint.left,&
							Chevron.rcPaint.bottom - 1,&
							lineColor,Enums.LS_SOLID,&
							false,1)
		end if
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

private subroutine _of_fillbkgnd (readonly unsignedlong hdc);ulong bkColor,borderColor,nState
ulong chevronBorderColor,chevronBkColor,nChevronState
RADIUSF rdBorder,rdChevron
RECTF paintRect

nState = of_GetState()
if BitTest(nState,Enums.STATE_DISABLED) and Not #Toggled then return

bkColor = theme.of_GetItemColor(this,theme.CLR_BKGND,nState)
borderColor = theme.of_GetItemColor(this,theme.CLR_BORDER,nState)

if #Style = Enums.BTS_SPLIT then
	rdBorder = theme.#ItemRoundSize
	nChevronState = of_GetChevronState()
	chevronBkColor = theme.of_GetItemColor(this,theme.CLR_CHEVRONBKGND,nChevronState)
	chevronBorderColor = theme.of_GetItemColor(this,theme.CLR_CHEVRONBORDER,nChevronState)
	if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 and BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
		if _Flashing then
			bkColor = ARGBLighten(bkColor,0.4)
		end if
	end if
	if _DisplayMode = DPM_LARGE then
		rdBorder.leftBottom = 0
		rdBorder.rightBottom = 0
		rdChevron.leftBottom = theme.#ItemRoundSize.leftBottom
		rdChevron.rightBottom = theme.#ItemRoundSize.rightBottom
		paintRect = rcPaint
		paintRect.bottom = Chevron.rcPaint.top + 1
	else
		rdBorder.rightTop = 0
		rdBorder.rightBottom = 0
		rdChevron.rightTop = theme.#ItemRoundSize.rightTop
		rdChevron.rightBottom = theme.#ItemRoundSize.rightBottom
		paintRect = rcPaint
		paintRect.right = Chevron.rcPaint.left + 1
	end if
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
		Painter.DrawThemeBorder(hdc,rcPaint,borderColor,Enums.TRANSPARENT,theme.#ItemBorderStyle,theme.#ItemRoundSize)
	end if
else
	if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
		if _Flashing then
			bkColor = ARGBLighten(bkColor,0.4)
		end if
	end if
	if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
		Painter.ThemeFill( hdc, rcPaint, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
													theme.#ItemBorderStyle,borderColor,theme.#ItemRoundSize)
	elseif _Flashing then
		Painter.DrawThemeBorder(hdc,rcPaint,borderColor,Enums.TRANSPARENT,theme.#ItemBorderStyle,theme.#ItemRoundSize)
	end if
end if
end subroutine

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
	
	of_ReleaseDC(safeDC,hUpdateRgn,#ParentRibbonBar.#FlashFadeTime)
	
	Painter.DeleteRgn(hUpdateRgn)
	
end if
end subroutine

public function boolean of_isflashing ();return (_flashTime = -1 or _flashTime > 0)
end function

public function long of_getpopupmenu (ref n_cst_popupmenu popupmenu);try
	PopupMenu = _PopupMenu
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(PopupMenu),RetCode.OK,RetCode.E_INVALID_OBJECT)
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
	Timer.Start(TM_FLASH,#ParentRibbonBar.#FlashFadeTime)
else
	_flashing = false
	of_Redraw(true)
end if

return RetCode.OK
end function

public function long of_sethighlighted (readonly boolean highlighted);if #HighLighted = HighLighted then return RetCode.OK

#HighLighted = HighLighted

of_Redraw(true)

return RetCode.OK
end function

public function long of_setimage (readonly string smallimage, readonly string largeimage);int newSmallIndex,newLargeIndex
boolean dirty

if #SmallImage= smallImage and #LargeImage = largeImage then return RetCode.OK

newSmallIndex = _SmallImageList.AddImage(smallImage)
newLargeIndex = _LargeImageList.AddImage(largeImage)

if szText.cx = 0 and newSmallIndex = 0 and newLargeIndex = 0 then return RetCode.E_INVALID_IMAGE
if newSmallIndex = 0 and ((Not of_HasLargeMode() or newLargeIndex = 0) and Not of_HasIntermediateMode()) then return RetCode.E_INVALID_IMAGE
if newLargeIndex = 0 and (#AlwaysLargeMode or (Not of_HasIntermediateMode()  and (Not of_HasCompactMode() or newSmallIndex = 0 ))) then return RetCode.E_INVALID_IMAGE

if (_SmallImageIndex  > 0) <> (newSmallIndex > 0) or (_LargeImageIndex > 0) <> (newLargeIndex > 0) then
	dirty = true
end if

#SmallImage = smallImage
_SmallImageIndex = newSmallIndex

#LargeImage = largeImage
_LargeImageIndex = newLargeIndex

if dirty then
	of_UpdatePoints()
else
	of_Redraw(true)
end if

return RetCode.OK
end function

public function long of_setmultiline (readonly boolean multiline);if #MultiLine = multiLine then return RetCode.OK

#MultiLine = multiLine

_of_UpdateTextSize()
of_UpdatePoints()

return RetCode.OK
end function

public function long of_setstyle (readonly Uint style);if style = Enums.BTS_DROPDOWN and #Toggled then return RetCode.FAILED
if #Style = style then return RetCode.OK

#Style = style

if #Style = Enums.BTS_DROPDOWN or #Style = Enums.BTS_SPLIT then
	Chevron.Visible = true
else
	Chevron.Visible = false
end if

of_UpdatePoints()

return RetCode.OK
end function

public function long of_settext (readonly string text);if Len(text) = 0 and (Not of_HasLargeMode() and Not of_HasCompactMode()) then return RetCode.E_INVALID_ARGUMENT
if #Text= text then return RetCode.OK

#Text= text

_of_UpdateTextSize()
of_UpdatePoints()

return RetCode.OK
end function

public function long of_settoggled (readonly boolean toggled);if #Style = Enums.BTS_DROPDOWN then return RetCode.E_NO_SUPPORT
if #Toggled = toggled then return RetCode.OK

#Toggled = toggled

of_Redraw(true)

return RetCode.OK
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

_PopupMenu.of_SetToolTip(#ParentRibbonBar.#ToolTip)
_PopupMenu.theme.of_SetTheme(theme)

if _DisplayMode = DPM_LARGE then
	xpos = rcPaint.left
	ypos = rcPaint.bottom
else
	if #Style = Enums.BTS_DROPDOWN then
		xpos = rcPaint.left
		ypos = rcPaint.bottom
	else
		xpos = Chevron.rcPaint.left
		ypos = Chevron.rcPaint.bottom
	end if
end if

pmFlags = Win32.TPM_LEFTALIGN + Win32.TPM_TOPALIGN
if IsPrevented(#ParentRibbonBar.Event OnPopupMenu(this,ref xpos,ref ypos,ref pmFlags)) then return 0

rtCode = _PopupMenu.of_Popup(#ParentPanel.of_GetHandle(),xpos,ypos,pmFlags)

_lastPopupTime = Cpu()

return rtCode

end function

on n_cst_ribbonbar_button.create
call super::create
this.font=create font
this.timer=create timer
end on

on n_cst_ribbonbar_button.destroy
call super::destroy
destroy(this.font)
destroy(this.timer)
end on

event destructor;call super::destructor;if _MenuOwner then
	Destroy _PopupMenu
end if

if _TTID > 0 then
	_ToolTip.DelTool(#ParentRibbonBar.#Handle,_TTID)
end if
end event

event onthemechanged;call super::onthemechanged;choose case eventflag
	case theme.EVT_THEME,&
		theme.EVT_SMALLICONSIZE,&
		theme.EVT_SMALLICONSIZE
		_of_RecalcLayout()
end choose
end event

event onscroll;call super::onscroll;if AncestorReturnValue = 1 then return 1

if szText.cx > 0 then
	Painter.OffsetRect(ref rcText,scrollSize,0)
end if
if _SmallImageIndex > 0 or _LargeImageIndex > 0 then
	Painter.OffsetRect(ref rcImage,scrollSize,0)
end if
if Chevron.Visible then
	Painter.OffsetRect(ref Chevron.rcPaint,scrollSize,0)
end if

return 0
end event

event onpaint;call super::onpaint;POINTF ptImage

if AncestorReturnValue = 1 then return 1

_of_FillBkgnd(hdc)

ptImage.x = rcImage.left
ptImage.y = rcImage.top

if _MouseDown or #Toggled then
	ptImage.y += 1
end if

choose case _DisplayMode
	case DPM_LARGE
		_LargeImageList.Draw(_LargeImageIndex,hdc,&
										ptImage.x,&
										ptImage.y,&
										Not of_IsEnabled())
		if szText.cx > 0 then
			_of_DrawText(hdc)
		end if
	case DPM_INTERMEDIATE
		if _SmallImageIndex > 0 then
			_SmallImageList.Draw(_SmallImageIndex,hdc,&
											ptImage.x,&
											ptImage.y,&
											Not of_IsEnabled())
		end if
		_of_DrawText(hdc)
	case DPM_COMPACT
		_SmallImageList.Draw(_SmallImageIndex,hdc,&
										ptImage.x,&
										ptImage.y,&
										Not of_IsEnabled())
end choose

if Chevron.Visible then
	_of_DrawChevron(hdc)
end if

return 1
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
	#ParentRibbonBar.Event OnItemMouseEnter(this,xpos,ypos)
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
	#ParentRibbonBar.Event OnItemMouseMove(this,xpos,ypos)
end if

return 0
end event

event onmouseleave;call super::onmouseleave;_MouseOver = false
Chevron.MouseOver = false
of_Redraw(true)
_of_ShowTip(false)

#ParentRibbonBar.Event OnItemMouseLeave(this)
end event

event oncapturechanged;call super::oncapturechanged;if _MouseCaptured then
	_of_CaptureMouse(false)
	_MouseDown = false
	_RightMouseDown = false
	Chevron.MouseDown = false
	of_Redraw(true)
	#ParentRibbonBar.Event OnItemMouseUp(this,0,0)
	Event OnMouseLeave()
end if
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
		#ParentRibbonBar.Event OnItemMouseDown(this,xpos,ypos)
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
		if IsAllowed(#ParentRibbonBar.Event OnMenuSelecting(this,pmCode)) then
			#ParentPanel.of_ExitPopupMode(0,true)
			#ParentRibbonBar.Post Event OnMenuSelected(this,pmCode)
		end if
	end if
else
	_of_ShowTip(false)
	_MouseDown = true
	of_Redraw(false)
	_of_CaptureMouse(true)
	#ParentRibbonBar.Event OnItemMouseDown(this,xpos,ypos)
end if

return 0
end event

event onlbuttonup;call super::onlbuttonup;if Not _MouseDown then return 1

_of_CaptureMouse(false)
_MouseDown = false
of_Redraw(true)

#ParentRibbonBar.Event OnItemMouseUp(this,xpos,ypos)

if _MouseOver and Not Chevron.MouseOver then
	if IsAllowed(#ParentRibbonBar.Event OnItemClicking(this)) then
		#ParentPanel.of_ExitPopupMode(0,true)
		#ParentRibbonBar.Post Event OnItemClicked(this)
	end if
end if

return 0
end event

event ontimer;call super::ontimer;int index

if id = TM_FLASH then
	if _flashTime = 0 then return false
	if _flashTime > 0 then
		_flashTime -= #ParentRibbonBar.#FlashFadeTime
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

event onlbuttondblclk;call super::onlbuttondblclk;return Event OnLButtonDown(vKey,xpos,ypos)
end event

event oninit;call super::oninit;_TTID = _ToolTip.AddTool(#ParentRibbonBar.#Handle,false,Win32.TTF_TRANSPARENT + Win32.TTF_TRACK + Win32.TTF_ABSOLUTE)
end event

event oncalclayout;call super::oncalclayout;if of_HasLargeMode() then
	szLayouts[DPM_LARGE].cx = 4 + theme.#LargeIconSize.cx + 4
	if szLayouts[DPM_LARGE].cx < (2+ szText.cx + 2) then
		szLayouts[DPM_LARGE].cx = 2+ szText.cx + 2
	end if
	szLayouts[DPM_LARGE].cy = _layoutHeight
end if
if of_HasIntermediateMode() then
	szLayouts[DPM_INTERMEDIATE].cx = 2 + szText.cx + 2
	szLayouts[DPM_INTERMEDIATE].cy = 2 + szText.cy + 2
	if _SmallImageIndex > 0 then
		szLayouts[DPM_INTERMEDIATE].cx += theme.#SmallIconSize.cx + 2
		if szLayouts[DPM_INTERMEDIATE].cy < (2+ theme.#SmallIconSize.cy + 2) then
			szLayouts[DPM_INTERMEDIATE].cy = 2+ theme.#SmallIconSize.cy + 2
		end if
	end if
	if Chevron.Visible then
		szLayouts[DPM_INTERMEDIATE].cx += CHEVRONSIZE
	end if
end if
if of_HasCompactMode() then
	szLayouts[DPM_COMPACT].cx = 2+ theme.#SmallIconSize.cx + 2
	szLayouts[DPM_COMPACT].cy = 2+ theme.#SmallIconSize.cy + 2
	if Chevron.Visible then
		szLayouts[DPM_COMPACT].cx += CHEVRONSIZE
	end if
end if
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

if _MouseOver and Not Chevron.MouseOver then
	if IsAllowed(#ParentRibbonBar.Event OnItemRightClicking(this)) then
		//#ParentPanel.of_ExitPopupMode(0,true)
		#ParentRibbonBar.Post Event OnItemRightClicked(this)
	end if
end if

return 0
end event

event onreposition;call super::onreposition;if AncestorReturnValue = 1 then return 1

choose case _DisplayMode
	case DPM_LARGE
		if szText.cx > 0 then
			rcImage.left = rcPaint.left + (rcPaint.right - rcPaint.left - theme.#LargeIconSize.cx) / 2
			rcImage.top = rcPaint.top + (rcPaint.bottom - rcPaint.top - theme.#LargeIconSize.cy - szText.cy - 2) / 2
			rcImage.right = rcImage.left + theme.#LargeIconSize.cx
			rcImage.bottom = rcImage.top + theme.#LargeIconSize.cy
			rcText.left = rcPaint.left + 2
			rcText.top = rcImage.bottom + 2
			rcText.right = rcPaint.right - 2
			rcText.bottom = rcPaint.bottom - 2
		else
			rcImage.left = rcPaint.left + (rcPaint.right - rcPaint.left - theme.#LargeIconSize.cx) / 2
			rcImage.top = rcPaint.top + (rcPaint.bottom - rcPaint.top - theme.#LargeIconSize.cy) / 2
			rcImage.right = rcImage.left + theme.#LargeIconSize.cx
			rcImage.bottom = rcImage.top + theme.#LargeIconSize.cy
		end if
		if Chevron.Visible then
			Chevron.rcPaint = rcPaint
			Chevron.rcPaint.top = rcPaint.bottom - CHEVRONSIZE
			if rcText.bottom > Chevron.rcPaint.top - 2 then
				rcText.bottom = Chevron.rcPaint.top - 2
			end if
		end if
	case DPM_INTERMEDIATE
		if _SmallImageIndex > 0 then
			rcImage.left = rcPaint.left + 2
			rcImage.top = rcPaint.top + (rcPaint.bottom - rcPaint.top - theme.#SmallIconSize.cy) / 2
			rcImage.right = rcImage.left + theme.#SmallIconSize.cx
			rcImage.bottom = rcImage.top + theme.#SmallIconSize.cy
			rcText.left = rcImage.right + 2
			rcText.top = rcPaint.top + 2
			rcText.right = rcPaint.right - 2
			rcText.bottom = rcPaint.bottom - 2
		else
			rcText.left = rcPaint.left + 2
			rcText.top = rcPaint.top + 2
			rcText.right = rcPaint.right - 2
			rcText.bottom = rcPaint.bottom - 2
		end if
		if Chevron.Visible then
			Chevron.rcPaint = rcPaint
			Chevron.rcPaint.left = rcPaint.right - CHEVRONSIZE
			if rcText.right > Chevron.rcPaint.left - 2 then
				rcText.right = Chevron.rcPaint.left - 2
			end if
		end if
	case DPM_COMPACT
		rcImage.left = rcPaint.left + 2
		rcImage.top = rcPaint.top + (rcPaint.bottom - rcPaint.top - theme.#SmallIconSize.cy) / 2
		rcImage.right = rcImage.left + theme.#SmallIconSize.cx
		rcImage.bottom = rcImage.top + theme.#SmallIconSize.cy
		if Chevron.Visible then
			Chevron.rcPaint = rcPaint
			Chevron.rcPaint.left = rcPaint.right - CHEVRONSIZE
		end if
end choose

return 0
end event

type font from n_cst_font within n_cst_ribbonbar_button descriptor "pb_nvo" = "true" 
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

type timer from n_timer within n_cst_ribbonbar_button descriptor "pb_nvo" = "true" 
end type

event ontimer;call super::ontimer;return Parent.Event OnTimer(id)
end event

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

