$PBExportHeader$n_cst_toolbarstrip_popup.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_toolbarstrip_popup from n_cst_popupcanvas
end type
type timer from n_timer within n_cst_toolbarstrip_popup
end type
end forward

global type n_cst_toolbarstrip_popup from n_cst_popupcanvas
boolean #bordershadow = true
event oninit ( u_cst_toolbarstrip parenttoolbarstrip,  n_imagelist imagelist,  n_tooltip tooltip )
event type long oninitdata ( ref toolbaritem newitems[],  long nreason )
event type long onpaint ( unsignedlong hdc )
event type long onerasebkgnd ( unsignedlong hdc )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event onmouseleave ( )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event oncapturechanged ( )
event type boolean ontimer ( unsignedinteger id )
timer timer
end type
global n_cst_toolbarstrip_popup n_cst_toolbarstrip_popup

type variables
/*--- Constants ---*/
Public:
//Indexes
Constant Int IDX_CHEVRON	= -1

/*--- Properties ---*/
Public:
PrivateWrite u_cst_toolbarstrip #ParentToolBarStrip

/*--- Implementation ---*/
Private:
n_cst_toolbarstrip_theme	theme
n_imagelist						_ImageList
n_tooltip 							_ToolTip
TOOLBARITEM 					Items[]
PAINTPANE						Chevron
RECTF								rcPaint

Ulong _TTID	

Int 		_mouseOverIndex  	= 0
Int			_mouseDownIndex	= 0
Int			_lastPopupIndex		= 0
Ulong		_lastPopupTime		= 0

Boolean _MouseCaptured 		= false
Boolean _MouseLeaveTracked 	= false

//Item types
Constant Uint ITT_NORMAL 		= 0
Constant Uint ITT_OBJECT		= 1
Constant Uint ITT_DROPDOWN	= 2
Constant Uint ITT_SPLIT			= 3
Constant Uint ITT_LABEL			= 4
Constant Uint ITT_ICON			= 5
Constant Uint ITT_SEPARATOR	= 6
//Timer ID
Constant Uint TM_FLASH			= 1
Constant Uint TM_ANIMATION	= 2
//Timer interval (ms)
Constant Uint TMI_ANIMATION	= 15
//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
Constant Uint ADJ_CHEVRON 			= 4
//Sizes
Constant real BUTTONCHEVRONSIZE 	= 12 	//px
Constant real TOOLBARCHEVRONSIZE 	= 14 	//px
end variables

forward prototypes
private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_fillbkgnd (readonly unsignedlong hdc)
private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawitemchevron (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawchevron (readonly boolean fadeanimation)
private subroutine _of_updatepointsh ()
private subroutine _of_updatepointsv ()
private subroutine _of_showtip (readonly integer index)
private subroutine _of_drawchevron (readonly unsignedlong hdc)
private subroutine _of_trackmouseleave (readonly boolean track)
private subroutine _of_capturemouse (readonly boolean capture)
private subroutine _of_flashdrawitem (integer index)
private function boolean _of_isbutton (readonly integer index)
private subroutine _of_drawitem (readonly integer index, readonly boolean bimageonly, readonly boolean fadeanimation)
private subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation)
private function boolean _of_hasvalidimage (readonly integer index)
public function unsignedlong of_getchevronstate ()
public function unsignedlong of_getitemchevronstate (readonly integer index)
public function unsignedlong of_getitemstate (readonly integer index)
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
private function boolean _of_isoverchevron (readonly integer index, readonly real xpos, readonly real ypos)
public function integer of_indexfrompoint (readonly real xpos, readonly real ypos)
public function unsignedlong of_popup (readonly unsignedlong hwnd, readonly real xpos, readonly real ypos, readonly unsignedlong flags)
private function unsignedlong _of_popup (real xpos, real ypos)
private function unsignedlong _of_popupmenu (readonly integer index, real xpos, real ypos)
end prototypes

event oninit(u_cst_toolbarstrip parenttoolbarstrip, n_imagelist imagelist, n_tooltip tooltip);#ParentToolBarStrip = parenttoolbarstrip
theme = #ParentToolBarStrip.theme
_ImageList = imagelist
_ToolTip = tooltip
_TTID = _ToolTip.AddTool(#ParentToolBarStrip.#Handle,false,Win32.TTF_TRANSPARENT + Win32.TTF_TRACK + Win32.TTF_ABSOLUTE) 
end event

event type long oninitdata(ref toolbaritem newitems[], long nreason);int index,nCount,nNewIndex
RECTF rcScreen

nCount = UpperBound(newItems)

for index = 1 to nCount
	if newItems[index].Position = Right! then continue
	if Not newItems[index].Visible or Not newItems[index].Hidden then continue
	if newItems[index].ItemType = ITT_OBJECT then continue
	nNewIndex = UpperBound(Items) + 1
	Items[nNewIndex] = newItems[index]
	Items[nNewIndex].Hidden = false
	if nReason = 0 then
		Items[nNewIndex].ID = index
	end if
next
for index = nCount to 1 step -1
	if newItems[index].Position = Left! then continue
	if Not newItems[index].Visible or Not newItems[index].Hidden then continue
	if newItems[index].ItemType = ITT_OBJECT then continue
	nNewIndex = UpperBound(Items) + 1
	Items[nNewIndex] = newItems[index]
	Items[nNewIndex].Hidden = false
	if nReason = 0 then
		Items[nNewIndex].ID = index
	end if
next

Painter.GetScreenRect(ref rcScreen)
Painter.GetClientRect(#ParentToolBarStrip.#Handle,ref rcPaint)

if theme.#ItemOrientation = Enums.HORZ then
	rcPaint.right = rcScreen.right
	_of_UpdatePointsH()
else
	rcPaint.bottom = rcScreen.bottom
	_of_UpdatePointsV()
end if

return 0
end event

event type long onpaint(unsignedlong hdc);int index

if #LockUpdate then return 1

Event OnEraseBkgnd(hdc)

for index = 1 to UpperBound(Items)
	if Items[index].Hidden then continue
	_of_DrawItem(index, hdc)
next

if Chevron.Visible then
	_of_DrawChevron(hdc)
end if

return 1
end event

event type long onerasebkgnd(unsignedlong hdc);_of_FillBkgnd(hdc)
return 0
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);int index

if Painter.PtInRect(ref rcPaint,xpos,ypos) then
	if Not _MouseLeaveTracked then
		_of_TrackMouseLeave(true)
	end if
else
	if _MouseLeaveTracked then
		Event OnMouseLeave()
	end if
	return 0
end if

index = of_indexfrompoint(xpos,ypos)

if _mouseOverIndex <> index then
	if _mouseOverIndex>0 then
		Items[_mouseOverIndex].mouseover=false
		Items[_mouseOverIndex].Chevron.mouseover=false
		_of_DrawItem(_mouseOverIndex,true)
		_of_ShowTip(0)
		#ParentToolBarStrip.Event OnButtonMouseLeave(Items[_mouseOverIndex].ID)
	end if

	_mouseOverIndex = index
	
	if _mouseOverIndex > 0 then
		Items[_mouseOverIndex].mouseover=true
		if _of_isOverChevron(_mouseOverIndex,xpos,ypos) then
			Items[_mouseOverIndex].Chevron.mouseover=true
		else
			_of_ShowTip(_mouseOverIndex)
		end if
		_of_DrawItem(_mouseOverIndex,true)
		#ParentToolBarStrip.Event OnButtonMouseEnter(Items[_mouseOverIndex].ID,xpos,ypos)
	end if
	
elseif _mouseOverIndex>0 then
	if _of_isOverChevron(_mouseOverIndex,xpos,ypos) then
		if Not Items[_mouseOverIndex].Chevron.mouseover then
			Items[_mouseOverIndex].Chevron.mouseover=true
			_of_DrawItem(_mouseOverIndex,true)
			_of_ShowTip(0)
		end if
	else
		if Items[_mouseOverIndex].Chevron.mouseover then
			Items[_mouseOverIndex].Chevron.mouseover=false
			_of_DrawItem(_mouseOverIndex,true)
			_of_ShowTip(_mouseOverIndex)
		end if
	end if
	#ParentToolBarStrip.Event OnButtonMouseMove(Items[_mouseOverIndex].ID,xpos,ypos)
end if

if index = IDX_CHEVRON then
	if Not Chevron.MouseOVer then
		Chevron.MouseOver = true
		_of_DrawChevron(true)
		_of_ShowTip(0)
	end if
else
	if Chevron.MouseOVer then
		Chevron.MouseOver = false
		_of_DrawChevron(true)
	end if
end if

return 1
end event

event onmouseleave();if _mouseOverIndex>0 then
	Items[_mouseOverIndex].mouseover=false
	Items[_mouseOverIndex].Chevron.mouseover=false
	_of_DrawItem(_mouseOverIndex,true)
	_of_ShowTip(0)
	#ParentToolBarStrip.Event OnButtonMouseLeave(Items[_mouseOverIndex].ID)
	_mouseOverIndex = 0
end if

if Chevron.MouseOver then
	Chevron.MouseOver = false
	_of_DrawChevron(true)
end if

_of_TrackMouseLeave(false)
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);ulong pmCode
int li_mouseOverIndex

if Not _MouseLeaveTracked  then
	Event	OnMouseMove(vkey,xpos,ypos)
end if

if _mouseOverIndex > 0 then
	li_mouseOverIndex = _mouseOverIndex
	_of_ShowTip(0)
	
	if (Items[li_mouseOverIndex].ItemType = ITT_DROPDOWN and Items[li_mouseOverIndex].MouseOver) or&
		(Items[li_mouseOverIndex].ItemType = ITT_SPLIT and Items[li_mouseOverIndex].Chevron.MouseOver) then
		if _lastPopupIndex = li_mouseOverIndex and Cpu() - _lastPopupTime < 100 then
			return 0
		end if
		
		if Items[li_mouseOverIndex].ItemType = ITT_SPLIT then
			Items[li_mouseOverIndex].Chevron.mousedown=true
		else
			Items[li_mouseOverIndex].mousedown=true
		end if
		_of_DrawItem(li_mouseOverIndex,false)
		
		#ParentToolBarStrip.Event OnButtonMouseDown(Items[li_mouseOverIndex].ID,xpos,ypos)
		if Not IsValid(this) then return 0
		
		pmCode = _of_PopupMenu(li_mouseOverIndex,xpos,ypos)
		
		if Items[li_mouseOverIndex].ItemType = ITT_SPLIT then
			Items[li_mouseOverIndex].Chevron.mousedown=false
		else
			Items[li_mouseOverIndex].mousedown=false
		end if
		_of_DrawItem(li_mouseOverIndex,true)
		
		if pmCode > 0 then
			if IsAllowed(#ParentToolBarStrip.Event OnMenuSelecting(Items[li_mouseOverIndex].ID,pmCode)) then
				if Not IsValid(this) then return 0
				ClosePopup(Items[li_mouseOverIndex].ID,true)
				#ParentToolBarStrip.Event OnMenuSelected(Items[li_mouseOverIndex].ID,pmCode)
				if Not IsValid(this) then return 0
			end if
		end if
	else
		_mouseDownIndex = li_mouseOverIndex
		Items[_mouseDownIndex].mousedown=true
		_of_DrawItem(_mouseDownIndex,false)
		_of_CaptureMouse(true)
		#ParentToolBarStrip.Event OnButtonMouseDown(Items[_mouseDownIndex].ID,xpos,ypos)
		if Not IsValid(this) then return 0
	end if
end if

if Chevron.MouseOver then
	if _lastPopupIndex = IDX_CHEVRON and Cpu() - _lastPopupTime < 100 then
		return 0
	end if
	Chevron.MouseDown = true
	_of_DrawChevron(false)
	
	pmCode = _of_Popup(xpos,ypos)
	
	Chevron.MouseDown = false
	_of_DrawChevron(true)
	
	if pmCode <> 0 then
		ClosePopup(pmCode,true)
	end if
end if

return 0
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);int nMouseDownIndex

if Not _MouseCaptured then return 0

_of_CaptureMouse(false)
_of_TrackMouseLeave(true)

if _mouseDownIndex > 0 then
	nMouseDownIndex = _mouseDownIndex
	_mouseDownIndex = 0
	
	Items[nMouseDownIndex].MouseDown = false
	_of_DrawItem(nMouseDownIndex,true)
	
	#ParentToolBarStrip.Event OnButtonMouseUp(Items[nMouseDownIndex].ID,xpos,ypos)
	if Not IsValid(this) then return 0
	
	if nMouseDownIndex = _mouseOverIndex and Not Items[nMouseDownIndex].Chevron.MouseOver then		//Clicked
		if IsAllowed(#ParentToolBarStrip.Event OnButtonclicking(Items[nMouseDownIndex].ID)) then
			if Not IsValid(this) then return 0
			ClosePopup(Items[nMouseDownIndex].ID,true)
			#ParentToolBarStrip.Event OnButtonclicked(Items[nMouseDownIndex].ID)
		end if
	end if
end if

return 0
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);return Event OnLButtonDown(vkey,xpos,ypos)
end event

event oncapturechanged();if _MouseCaptured then
	_of_CaptureMouse(false)
	if Chevron.MouseDown then
		Chevron.MouseDown = false
		_of_DrawChevron(true)
	end if
	if _mouseDownIndex>0 then
		Items[_mouseDownIndex].mousedown=false
		_of_DrawItem(_mouseDownIndex,true)
		#ParentToolBarStrip.Event OnButtonMouseUp(Items[_mouseDownIndex].ID,0,0)
		_mouseDownIndex = 0
	end if
	Event OnMouseLeave()
end if
end event

event type boolean ontimer(unsignedinteger id);int index
boolean bContinue

if id = TM_FLASH then
	for index = 1 to UpperBound(Items)
		if Items[index].FlashTime = 0 then continue
		if Items[index].Hidden then continue
		if Items[index].FlashTime > 0 then
			Items[index].FlashTime -= #ParentToolBarStrip.#FlashFadeTime
			if Items[index].FlashTime < 0 then
				Items[index].FlashTime = 0
			end if
		end if
		Items[index].flashing = (Not Items[index].flashing and Items[index].flashTime <> 0)
		_of_FlashDrawItem(index)
		if Items[index].FlashTime <> 0 then
			bContinue = true
		end if
	next
elseif id = TM_ANIMATION then
	for index = 1 to UpperBound(Items)
		if Not Items[index].UseAnimatedImage then continue
		if Not Items[index].AnimatedImage.IsPlaying() then continue
		bContinue = true
		if Not Items[index].Visible or Items[index].Hidden then continue
		if Items[index].AnimatedImage.IsFrameChanged() then
			Items[index].AnimatedImage.NextFrame()
			_of_DrawItem(index,true,false)
		end if
	next
end if

return bContinue
end event

private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc);ulong bkColor,borderColor,nState
ulong chevronBorderColor,chevronBkColor,nChevronState
RADIUSF rdBorder,rdChevron
RECTF paintRect

if Not Items[index].Visible or Items[index].Hidden then return

nState = of_GetItemState(index)

choose case Items[index].ItemType
	case ITT_LABEL					//Label
		_of_DrawItemText(index,hdc)
	case ITT_ICON						//Icon
		if Items[index].UseAnimatedImage then
			Items[index].AnimatedImage.Draw(hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].enabled )
		else
			_ImageList.Draw(Items[index].imageindex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].Enabled)
		end if
	case ITT_SEPARATOR			//Separator
		borderColor = theme.of_GetItemColor(Items[index].ID,theme.CLR_LINE,nState)
		if theme.#ItemOrientation = Enums.HORZ then
			if theme.#BkgndStyle = Enums.SOLID then
				Painter.of_DrawLine(hdc,&
							Items[index].rcPaint.left,&
							Items[index].rcPaint.top,&
							Items[index].rcPaint.left,&
							Items[index].rcPaint.bottom,&
							borderColor,false,1)
			else
				Painter.of_DrawGradientLine(hdc,&
							Items[index].rcPaint.left,&
							Items[index].rcPaint.top,&
							Items[index].rcPaint.left,&
							Items[index].rcPaint.bottom,&
							borderColor,true,true,1)
			end if
		else
			if theme.#BkgndStyle = Enums.SOLID then
				Painter.of_DrawLine(hdc,&
							Items[index].rcPaint.left,&
							Items[index].rcPaint.top,&
							Items[index].rcPaint.right,&
							Items[index].rcPaint.top,&
							borderColor,false,1)
			else
				Painter.of_DrawGradientLine(hdc,&
							Items[index].rcPaint.left,&
							Items[index].rcPaint.top,&
							Items[index].rcPaint.right,&
							Items[index].rcPaint.top,&
							borderColor,true,true,1)
			end if
		end if
	case else									//Button
		//Fill background
		if Items[index].enabled or Items[index].toggled then
			bkColor = theme.of_GetItemColor(Items[index].ID,theme.CLR_BKGND,nState)
			borderColor = theme.of_GetItemColor(Items[index].ID,theme.CLR_BORDER,nState)
			rdBorder = theme.#ItemRoundSize
			if Items[index].ItemType = ITT_SPLIT then
				nChevronState = of_GetItemChevronState(index)
				chevronBkColor = theme.of_GetItemColor(Items[index].ID,theme.CLR_CHEVRONBKGND,nChevronState)
				chevronBorderColor = theme.of_GetItemColor(Items[index].ID,theme.CLR_CHEVRONBORDER,nChevronState)
				if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 and BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
					if Items[index].Flashing then
						bkColor = ARGBLighten(bkColor,0.4)
					end if
				end if
				if theme.#ItemOrientation = Enums.VERT then
					rdBorder.leftBottom = 0
					rdBorder.rightBottom = 0
					rdChevron.leftBottom = theme.#ItemRoundSize.leftBottom
					rdChevron.rightBottom = theme.#ItemRoundSize.rightBottom
					paintRect = Items[index].rcPaint
					paintRect.bottom = Items[index].Chevron.rcPaint.top + 1
				else
					rdBorder.rightTop = 0
					rdBorder.rightBottom = 0
					rdChevron.rightTop = theme.#ItemRoundSize.rightTop
					rdChevron.rightBottom = theme.#ItemRoundSize.rightBottom
					paintRect = Items[index].rcPaint
					paintRect.right = Items[index].Chevron.rcPaint.left + 1
				end if
				if BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
					if BitAND(nState,Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
						Painter.ThemeFill( hdc, paintRect, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
																	theme.#ItemBorderStyle,ARGBDarken(borderColor,0.2),rdBorder)
					else
						Painter.DrawThemeBorder(hdc,paintRect,borderColor,Enums.TRANSPARENT,theme.#ItemBorderStyle,rdBorder)
					end if
					Painter.ThemeFill( hdc, Items[index].Chevron.rcPaint, chevronBkColor,Enums.VERT,theme.#ItemBkgndStyle,nChevronState,false,&
															theme.#ItemBorderStyle,ARGBDarken(chevronBorderColor,0.2),rdChevron)
				elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
					Painter.DrawThemeBorder(hdc,Items[index].Chevron.rcPaint,chevronBorderColor,Enums.TRANSPARENT,theme.#ItemBorderStyle,rdChevron)
					if BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
						Painter.ThemeFill( hdc, paintRect, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
																	theme.#ItemBorderStyle,ARGBDarken(borderColor,0.2),rdBorder)
					else
						Painter.ThemeFill( hdc, paintRect, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
																	theme.#ItemBorderStyle,borderColor,rdBorder)
					end if
				elseif Items[index].Flashing then
					rdBorder = theme.#ItemRoundSize
					Painter.DrawThemeBorder(hdc,Items[index].rcPaint,borderColor,Enums.TRANSPARENT,theme.#ItemBorderStyle,rdBorder)
				end if
			else
				if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
					if Items[index].Flashing then
						bkColor = ARGBLighten(bkColor,0.4)
					end if
				end if
				if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
					Painter.ThemeFill( hdc, Items[index].rcPaint, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
																theme.#ItemBorderStyle,borderColor,rdBorder)
				elseif Items[index].Flashing then
					rdBorder = theme.#ItemRoundSize
					Painter.DrawThemeBorder(hdc,Items[index].rcPaint,borderColor,Enums.TRANSPARENT,theme.#ItemBorderStyle,rdBorder)
				end if
			end if
		end if
		//Draw image
		if Items[index].UseAnimatedImage then
			if Items[index].MouseDown or Items[index].Toggled then
				Items[index].AnimatedImage.Draw(hdc, Items[index].rcImage.left ,Items[index].rcImage.top + 1,Not Items[index].enabled )
			else
				Items[index].AnimatedImage.Draw(hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].enabled )
			end if
		else
			if Items[index].imageIndex > 0 then
				if Items[index].MouseDown or Items[index].Toggled then
					_ImageList.Draw(Items[index].imageindex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top + 1,Not Items[index].Enabled)
				else
					_ImageList.Draw(Items[index].imageindex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].Enabled)
				end if
			end if
		end if
		//Draw text
		if Items[index].DisplayText and Items[index].szText.cx>0 then
			_of_DrawItemText(index,hdc)
		end if
		//Draw chevron
		if Items[index].Chevron.Visible then
			_of_DrawItemChevron(index,hdc)
		end if
end choose
end subroutine

private subroutine _of_fillbkgnd (readonly unsignedlong hdc);uint bkgndStyle,borderStyle
ulong transparentColor

transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,0)

//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, rcPaint,  transparentColor,false,0) 
end if

bkgndStyle = theme.#BkgndStyle
if bkgndStyle = Enums.TRANSPARENT then
	bkgndStyle = Enums.SOLID
end if
borderStyle = theme.#BorderStyle
if borderStyle = Enums.BS_RAISED then
	borderStyle = Enums.BS_SOLID
end if

Painter.ThemeFill( hdc, rcPaint, theme.of_GetColor(theme.CLR_BKGND,0),theme.#BkgndOrientation,bkgndStyle,0,false,&
										borderStyle,theme.of_GetColor(theme.CLR_BORDER,0),theme.#RoundSize)
end subroutine

private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc);ulong textColor
ulong dtparam

textColor	= theme.of_GetItemColor(Items[index].ID,theme.CLR_TEXT,of_GetItemState(index))

dtparam = Painter.DT_EXPANDTABS
if Items[index].MultiLine then
	dtparam += Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
else
	dtparam += Painter.DT_SINGLELINE + Painter.DT_VCENTER + Painter.DT_WORD_ELLIPSIS
end if
if Not KeyDown(KeyAlt!) then
	dtparam += Painter.DT_HIDEPREFIX
end if
choose case theme.#TextAlign
	case Left!
		dtparam += Painter.DT_LEFT
	case Center!
		dtparam += Painter.DT_CENTER
	case Right!
		dtparam += Painter.DT_RIGHT
end choose

if theme.#TextOrientation = Enums.HORZ then
	if Items[index].MouseDown or Items[index].Toggled then
		Painter.of_Drawtext(hdc,theme.Font,Items[index].text,Items[index].rcText.left,Items[index].rcText.top + 1,Items[index].rcText.right,Items[index].rcText.bottom + 1,textColor,dtparam)
	else
		Painter.of_Drawtext(hdc,theme.Font,Items[index].text,Items[index].rcText,textColor,dtparam)
	end if
else
	if Items[index].MouseDown or Items[index].Toggled then
		Painter.of_DrawVerticalText(hdc,theme.Font,Items[index].text,Items[index].rcText.left,Items[index].rcText.top + 1,Items[index].rcText.right,Items[index].rcText.bottom + 1,textColor,dtparam)
	else
		Painter.of_DrawVerticalText(hdc,theme.Font,Items[index].text,Items[index].rcText,textColor,dtparam)
	end if
end if
end subroutine

private subroutine _of_drawitemchevron (readonly integer index, readonly unsignedlong hdc);constant real ARROWSIZE = 6
ulong lineColor,arrowColor,nState
POINTF pt1,pt2,pt3

nState = of_GetItemState(index)
lineColor 	= theme.of_GetItemColor(index,theme.CLR_LINE,nState)
arrowColor	= theme.of_GetItemColor(index,theme.CLR_ARROW,nState)

//Draw line
if Items[index].ItemType = ITT_SPLIT and (Items[index].Enabled) then
	if (Not Items[index].MouseOver and Not Items[index].MouseDown and &
		Not Items[index].Chevron.MouseDown and Not Items[index].Toggled) and &
		(Items[index].HighLighted or ((Items[index].FlashTime = -1 or Items[index].FlashTime > 0) and Items[index].flashing)) then
		if theme.#ItemOrientation = Enums.HORZ then
			Painter.DrawLine(hdc,&
						Items[index].Chevron.rcPaint.left,&
						Items[index].Chevron.rcPaint.top + 1,&
						Items[index].Chevron.rcPaint.left,&
						Items[index].Chevron.rcPaint.bottom - 1,&
						lineColor,Enums.LS_SOLID,&
						false,1)
		else
			Painter.DrawLine(hdc,&
						Items[index].Chevron.rcPaint.left + 1,&
						Items[index].Chevron.rcPaint.top,&
						Items[index].Chevron.rcPaint.right - 1,&
						Items[index].Chevron.rcPaint.top,&
						lineColor,Enums.LS_SOLID,&
						false,1)
		end if
	end if
end if

//Draw arrow
pt1.x = Items[index].Chevron.rcPaint.left + (Items[index].Chevron.rcPaint.right - Items[index].Chevron.rcPaint.left - ARROWSIZE) / 2
pt1.y = Items[index].Chevron.rcPaint.top + (Items[index].Chevron.rcPaint.bottom - Items[index].Chevron.rcPaint.top - ARROWSIZE / 2) / 2
if Items[index].Chevron.mousedown or (Items[index].ItemType = ITT_DROPDOWN and Items[index].mousedown) then
	pt1.y += 1
end if
pt2.x = pt1.x + ARROWSIZE
pt2.y = pt1.y
pt3.x = pt1.x + ARROWSIZE / 2
pt3.y = pt1.y + ARROWSIZE / 2

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

private subroutine _of_drawchevron (readonly boolean fadeanimation);ulong safeDC
RECTF paintRect

if #LockUpdate then return
if Not Chevron.Visible then return

safeDC=GetSafeDC()

paintRect = rcPaint
_of_AdjustRect(ref paintRect,ADJ_BORDER)

Painter.IntersectClipRect(safeDC,paintRect)

Painter.IntersectClipRect(safeDC,Chevron.rcPaint)

Event OnEraseBkgnd(safeDC)

_of_DrawChevron(safeDC)

Painter.SelectClipRgn(safeDC,0)

ulong hUpdateRgn

hUpdateRgn = Painter.CreateRectRgn(Chevron.rcPaint)

if FadeAnimation then
	ReleaseDC(safeDC,hUpdateRgn,#FadeTime)
else
	ReleaseDC(safeDC,hUpdateRgn)
end if

Painter.DeleteRgn(hUpdateRgn)
end subroutine

private subroutine _of_updatepointsh ();int index
real ll_left
real itemSize
real maxSize
real offsetSize
boolean someHidden
RECTF paintRect

paintRect = rcPaint
_of_AdjustRect(ref paintRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

ll_left		= paintRect.left
itemSize = paintRect.bottom - paintRect.top

for index = 1 to UpperBound(Items)
	if someHidden then
		Items[index].hidden = true
		continue
	end if
	
	choose case Items[index].ItemType
		case ITT_LABEL				//Label
			//Set rcText
			Items[index].rcText.left 		= ll_left
			Items[index].rcText.right 	= Items[index].rcText.left  + Items[index].szText.cx
			Items[index].rcText.top		= paintRect.top + (itemSize - Items[index].szText.cy) / 2
			Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
			//Set rcPaint
			Painter.CopyRect(ref Items[index].rcPaint,ref Items[index].rcText)
		case ITT_ICON					//Icon
			//Set rcImage
			Items[index].rcImage.left		= ll_left
			Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
			Items[index].rcImage.top		= paintRect.top + (itemSize - theme.#IconSize.cy) / 2
			Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
			//Set rcPaint
			Painter.CopyRect(ref Items[index].rcPaint,ref Items[index].rcImage)
		case ITT_SEPARATOR		//Separator
			Items[index].rcPaint.left		= ll_left
			Items[index].rcPaint.right	= Items[index].rcPaint.left + 1
			Items[index].rcPaint.top		= paintRect.top + 1
			Items[index].rcPaint.bottom	= paintRect.bottom - 1
		case else							//Button
			if _of_HasValidImage(index) then
				if Items[index].DisplayText and Items[index].szText.cx > 0 then
					choose case theme.#IconPosition
						case Enums.LEFT
							//Set rcImage
							Items[index].rcImage.left		= ll_left + 2
							Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
							Items[index].rcImage.top		= paintRect.top + (itemSize - theme.#IconSize.cy) / 2
							Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cx
							//Set rcText
							Items[index].rcText.left 			= Items[index].rcImage.right + 2
							Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
							Items[index].rcText.top			= paintRect.top + (itemSize - Items[index].szText.cy) / 2
							Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
						case Enums.TOP
							if Items[index].szText.cx > theme.#IconSize.cx then
								maxSize = Items[index].szText.cx
							else
								maxSize = theme.#IconSize.cx
							end if
							//Set rcImage
							Items[index].rcImage.left		= ll_left + 2 + (maxSize - theme.#IconSize.cx)/2
							Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
							Items[index].rcImage.top		= paintRect.top + 2
							Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
							//Set rcText
							Items[index].rcText.left 			= ll_left  + 2 + (maxSize - Items[index].szText.cx) / 2
							Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
							Items[index].rcText.top			= Items[index].rcImage.bottom + 2
							if (paintRect.bottom - Items[index].rcText.top) > Items[index].szText.cy then
								Items[index].rcText.top 		+= (paintRect.bottom - Items[index].rcText.top - Items[index].szText.cy) / 2
							end if
							Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
						case Enums.RIGHT
							//Set rcImage
							Items[index].rcImage.left		= ll_left + 2 + Items[index].szText.cx + 2
							Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
							Items[index].rcImage.top		= paintRect.top + (itemSize - theme.#IconSize.cy) / 2
							Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cx
							//Set rcText
							Items[index].rcText.left 			= ll_left + 2
							Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
							Items[index].rcText.top			= paintRect.top + (itemSize - Items[index].szText.cy) / 2
							Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
						case Enums.BOTTOM
							if Items[index].szText.cx > theme.#IconSize.cx then
								maxSize = Items[index].szText.cx
							else
								maxSize = theme.#IconSize.cx
							end if
							//Set rcImage
							Items[index].rcImage.left		= ll_left + 2 + (maxSize - theme.#IconSize.cx)/2
							Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
							Items[index].rcImage.top		= paintRect.bottom - 2 - theme.#IconSize.cy
							Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
							//Set rcText
							Items[index].rcText.left 			= ll_left  + 2 + (maxSize - Items[index].szText.cx) / 2
							Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
							Items[index].rcText.top			= paintRect.top + 2
							if (Items[index].rcImage.top - 2 - Items[index].rcText.top) > Items[index].szText.cy then
								Items[index].rcText.top 		+= (Items[index].rcImage.top - 2 - Items[index].rcText.top - Items[index].szText.cy) / 2
							end if
							Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
					end choose
				else
					Painter.SetRectEmpty(Items[index].rcText)
					//Set rcImage
					Items[index].rcImage.left		= ll_left + 2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
					Items[index].rcImage.top		= paintRect.top + (itemSize - theme.#IconSize.cy) / 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
				end if
			elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
				Painter.SetRectEmpty(Items[index].rcImage)
				//Set rcText
				Items[index].rcText.left 		= ll_left  + 2
				Items[index].rcText.right 	= Items[index].rcText.left  + Items[index].szText.cx
				Items[index].rcText.top		= paintRect.top + (itemSize - Items[index].szText.cy) / 2
				Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
			else
				Painter.SetRectEmpty(Items[index].rcImage)
				Painter.SetRectEmpty(Items[index].rcText)
			end if
			
			//Set rcPaint
			Items[index].rcPaint.left = ll_left
			if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
				Items[index].rcPaint.right = Max(Items[index].rcText.right, Items[index].rcImage.right) + 2
			elseif Not Painter.IsRectEmpty(Items[index].rcText) then
				Items[index].rcPaint.right = Items[index].rcText.right + 2
			elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
				Items[index].rcPaint.right = Items[index].rcImage.right + 2
			else
				Items[index].rcPaint.right = Items[index].rcPaint.left + 4
			end if
			Items[index].rcPaint.top			= paintRect.top
			Items[index].rcPaint.bottom		= paintRect.bottom
			
			//Set chevron
			if Items[index].Chevron.Visible then
				Items[index].Chevron.rcPaint.left 		= Items[index].rcPaint.right
				Items[index].Chevron.rcPaint.right		= Items[index].Chevron.rcPaint.left + BUTTONCHEVRONSIZE
				Items[index].Chevron.rcPaint.top		= paintRect.top
				Items[index].Chevron.rcPaint.bottom	= paintRect.bottom
				Items[index].rcPaint.right 				= Items[index].Chevron.rcPaint.right	
			end if
			
			if theme.#FixedSize then
				if Items[index].rcPaint.right - Items[index].rcPaint.left < theme.#ItemMinSize then
					offsetSize = theme.#ItemMinSize - (Items[index].rcPaint.right - Items[index].rcPaint.left)
					if Not Painter.IsRectEmpty(Items[index].rcImage) then
						choose case theme.#IconPosition
							case Enums.LEFT
								if Painter.IsRectEmpty(Items[index].rcText) then
									Painter.OffsetRect(Items[index].rcImage,offsetSize / 2,0 )
								end if
							case Enums.TOP
								Painter.OffsetRect(Items[index].rcImage,offsetSize / 2,0 )
							case Enums.RIGHT
								if Painter.IsRectEmpty(Items[index].rcText) then
									Painter.OffsetRect(Items[index].rcImage,offsetSize / 2,0 )
								else
									Painter.OffsetRect(Items[index].rcImage,offsetSize,0 )
								end if
							case Enums.BOTTOM
								Painter.OffsetRect(Items[index].rcImage,offsetSize / 2,0 )
						end choose
					end if
					if Not Painter.IsRectEmpty(Items[index].rcText) then
						Items[index].rcText.right += offsetSize
					end if
					if Items[index].Chevron.Visible then
						Painter.OffsetRect(Items[index].Chevron.rcPaint,offsetSize,0 )
					end if
					Items[index].rcPaint.right += offsetSize
				end if
			end if
	end choose
		
	if Items[index].rcPaint.right > paintRect.right then
		Items[index].hidden = true
		someHidden = true
	else
		Items[index].hidden = false
	end if
	if Not Items[index].hidden then
		ll_left = Items[index].rcPaint.right + theme.#ItemMargin
	end if
next

rcPaint.right = ll_left - theme.#ItemMargin + theme.#BorderMargin.right
if theme.#BorderStyle = Enums.BS_SOLID or theme.#BorderStyle = Enums.BS_RAISED then
	rcPaint.right += 1
end if

if someHidden then
	rcPaint.right += TOOLBARCHEVRONSIZE
	Chevron.visible = true
	Chevron.rcPaint.left = rcPaint.right - TOOLBARCHEVRONSIZE
	Chevron.rcPaint.right = rcPaint.right
	Chevron.rcPaint.top	= rcPaint.top
	Chevron.rcPaint.bottom = rcPaint.bottom
end if
end subroutine

private subroutine _of_updatepointsv ();int index
long ll_top
int itemSize
int maxSize
int offsetSize
boolean someHidden
RECTF paintRect

paintRect = rcPaint
_of_AdjustRect(ref paintRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

ll_top		= paintRect.top
itemSize = paintRect.right - paintRect.left

for index = 1 to UpperBound(Items)
	if someHidden then
		Items[index].hidden = true
		continue
	end if
	
	choose case Items[index].ItemType
		case ITT_LABEL				//Label
			//Set rcText
			Items[index].rcText.left 		= paintRect.left
			Items[index].rcText.right 	= paintRect.right
			Items[index].rcText.top		= ll_top
			Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
			//Set rcPaint
			Painter.CopyRect(ref Items[index].rcPaint,ref Items[index].rcText)
		case ITT_ICON					//Icon
			//Set rcImage
			Items[index].rcImage.left		= paintRect.left  + (itemSize - theme.#IconSize.cx)/2
			Items[index].rcImage.right		= Items[index].rcImage.left + theme.#IconSize.cx
			Items[index].rcImage.top		= ll_top
			Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
			//Set rcPaint
			Painter.CopyRect(ref Items[index].rcPaint,ref Items[index].rcImage)
		case ITT_SEPARATOR		//Separator
			Items[index].rcPaint.left		= paintRect.left + 1
			Items[index].rcPaint.right	= paintRect.right - 1
			Items[index].rcPaint.top		= ll_top
			Items[index].rcPaint.bottom	= Items[index].rcPaint.top + 1
		case else							//Button
			if _of_HasValidImage(index) then
				if Items[index].DisplayText and Items[index].szText.cx > 0 then
					choose case theme.#IconPosition
						case Enums.LEFT
							if Items[index].szText.cy > theme.#IconSize.cy then
								maxSize = Items[index].szText.cy
							else
								maxSize = theme.#IconSize.cy
							end if
							//Set rcImage
							Items[index].rcImage.left		= paintRect.left  + 2
							Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
							Items[index].rcImage.top		= ll_top + 2 + (maxSize - theme.#IconSize.cy) / 2
							Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
							//Set rcText
							Items[index].rcText.left 			= Items[index].rcImage.right + 2
							Items[index].rcText.right 		= paintRect.right - 2
							Items[index].rcText.top			= ll_top + 2 + (maxSize - Items[index].szText.cy) / 2
							Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
						case Enums.TOP
							//Set rcImage
							Items[index].rcImage.left		= paintRect.left  + (itemSize - theme.#IconSize.cx)/2
							Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
							Items[index].rcImage.top		= ll_top + 2
							Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
							//Set rcText
							Items[index].rcText.left 			= paintRect.left  + 2
							Items[index].rcText.right 		= paintRect.right  - 2
							Items[index].rcText.top			= Items[index].rcImage.bottom + 2
							Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
						case Enums.RIGHT
							if Items[index].szText.cy > theme.#IconSize.cy then
								maxSize = Items[index].szText.cy
							else
								maxSize = theme.#IconSize.cy
							end if
							//Set rcImage
							Items[index].rcImage.left		= paintRect.right  - 2 - theme.#IconSize.cx
							Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
							Items[index].rcImage.top		= ll_top + 2 + (maxSize - theme.#IconSize.cy) / 2
							Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
							//Set rcText
							Items[index].rcText.left 			= paintRect.left + 2
							Items[index].rcText.right 		= Items[index].rcImage.left - 2
							Items[index].rcText.top			= ll_top + 2 + (maxSize - Items[index].szText.cy) / 2
							Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
						case Enums.BOTTOM
							//Set rcImage
							Items[index].rcImage.left		= paintRect.left  + (itemSize - theme.#IconSize.cx)/2
							Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
							Items[index].rcImage.top		= ll_top + 2 + Items[index].szText.cy + 2
							Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
							//Set rcText
							Items[index].rcText.left 			= paintRect.left  + 2
							Items[index].rcText.right 		= paintRect.right  - 2
							Items[index].rcText.top			= ll_top + 2
							Items[index].rcText.bottom 		= Items[index].rcImage.top - 2
					end choose
				else
					Painter.SetRectEmpty(Items[index].rcText)
					//Set rcImage
					Items[index].rcImage.left		= paintRect.left  + (itemSize - theme.#IconSize.cx)/2
					Items[index].rcImage.right		= Items[index].rcImage.left + theme.#IconSize.cx
					Items[index].rcImage.top		= ll_top + 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
				end if
			elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
				Painter.SetRectEmpty(Items[index].rcImage)
				//Set rcText
				Items[index].rcText.left 		= paintRect.left  + 2 
				Items[index].rcText.right 	= paintRect.right - 2
				Items[index].rcText.top		= ll_top + 2
				Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
			else
				Painter.SetRectEmpty(Items[index].rcImage)
				Painter.SetRectEmpty(Items[index].rcText)
			end if
			
			//Set rcPaint
			Items[index].rcPaint.left			= paintRect.left
			Items[index].rcPaint.right		= paintRect.right
			Items[index].rcPaint.top			= ll_top
			if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
				Items[index].rcPaint.bottom = Max(Items[index].rcText.bottom, Items[index].rcImage.bottom) + 2
			elseif Not Painter.IsRectEmpty(Items[index].rcText) then
				Items[index].rcPaint.bottom = Items[index].rcText.bottom + 2
			elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
				Items[index].rcPaint.bottom = Items[index].rcImage.bottom + 2
			else
				Items[index].rcPaint.bottom = Items[index].rcPaint.top + 4
			end if
			
			//Set chevron
			if Items[index].Chevron.Visible then
				Items[index].Chevron.rcPaint.left		= paintRect.left
				Items[index].Chevron.rcPaint.right		= paintRect.right
				Items[index].Chevron.rcPaint.top		= Items[index].rcPaint.bottom
				Items[index].Chevron.rcPaint.bottom	= Items[index].Chevron.rcPaint.top + BUTTONCHEVRONSIZE
				Items[index].rcPaint.bottom 			= Items[index].Chevron.rcPaint.bottom
			end if
			
			if theme.#FixedSize then
				if Items[index].rcPaint.bottom - Items[index].rcPaint.top < theme.#ItemMinSize then
					offsetSize = theme.#ItemMinSize - (Items[index].rcPaint.bottom - Items[index].rcPaint.top)
					if Not Painter.IsRectEmpty(Items[index].rcImage) then
						Painter.OffsetRect(Items[index].rcImage,0,offsetSize / 2 )
					end if
					if Not Painter.IsRectEmpty(Items[index].rcText) then
						Painter.OffsetRect(Items[index].rcText,0,offsetSize / 2 )
					end if
					if Items[index].Chevron.Visible then
						Painter.OffsetRect(Items[index].Chevron.rcPaint,0,offsetSize )
					end if
					Items[index].rcPaint.bottom += offsetSize
				end if
			end if
	end choose
	
	if Items[index].rcPaint.bottom > paintRect.bottom then
		Items[index].hidden = true
		someHidden = true
	else
		Items[index].hidden = false
	end if
	if Not Items[index].hidden then
		ll_top = Items[index].rcPaint.bottom + theme.#ItemMargin
	end if
next

rcPaint.bottom = ll_top - theme.#ItemMargin + theme.#BorderMargin.bottom
if theme.#BorderStyle = Enums.BS_SOLID or theme.#BorderStyle = Enums.BS_RAISED then
	rcPaint.bottom += 1
end if

if someHidden then
	rcPaint.bottom += TOOLBARCHEVRONSIZE
	Chevron.visible = true
	Chevron.rcPaint.left	= rcPaint.left
	Chevron.rcPaint.right = rcPaint.right
	Chevron.rcPaint.top	= rcPaint.bottom  - TOOLBARCHEVRONSIZE
	Chevron.rcPaint.bottom = rcPaint.bottom
end if
end subroutine

private subroutine _of_showtip (readonly integer index);RECTF wndRect
RECTF scRect
SIZEF toolSize

if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return

if #ParentToolBarStrip.#ToolTip and (index > 0 and index <= UpperBound(Items)) then
	if Items[index].tipText <> "" then
		Painter.GetWindowRect(GetHandle(),ref wndRect)
		Painter.GetScreenRect(ref scRect)
		_ToolTip.TrackActivate(#ParentToolBarStrip.#Handle,_TTID,false)
		_ToolTip.UpdateTipText(#ParentToolBarStrip.#Handle,_TTID,Items[index].tipText)
		_ToolTip.GetBubbleSize(#ParentToolBarStrip.#Handle,_TTID,ref toolSize.cx,ref toolSize.cy)
		if wndRect.left + Items[index].rcPaint.left + toolSize.cx  > scRect.right then
			_ToolTip.TrackPosition( 0,scRect.right -  toolSize.cx,wndRect.top + Items[index].rcPaint.bottom + 2)
		else
			_ToolTip.TrackPosition( 0,wndRect.left + Items[index].rcPaint.left ,wndRect.top + Items[index].rcPaint.bottom + 2)
		end if
		if Items[index].TipTime > 0 then
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,Items[index].TipTime)
		else
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,-1)
		end if
		_ToolTip.TrackActivate(#ParentToolBarStrip.#Handle,_TTID,true)
	else
		_ToolTip.TrackActivate(#ParentToolBarStrip.#Handle,_TTID,false)	
	end if
else
	_ToolTip.TrackActivate(#ParentToolBarStrip.#Handle,_TTID,false)
end if
end subroutine

private subroutine _of_drawchevron (readonly unsignedlong hdc);real nX,nY
long nRow
ulong borderColor,arrowColor,bkColor,nState
Constant real ARROWSIZE = 6

if Not Chevron.Visible then return

nState = of_GetChevronState()
borderColor = theme.of_GetColor(theme.CLR_BORDER,0)

if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
	bkColor	= theme.of_GetColor(theme.CLR_CHEVRONBKGND,nState)
	Painter.ThemeFill(hdc,Chevron.rcPaint,bkColor,theme.#BkgndOrientation,theme.#ItemBkgndStyle,nState,false,Enums.BS_SOLID,borderColor,0)
end if

if theme.#ItemOrientation = Enums.HORZ then
	nX = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE)/2
	nY = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - (ARROWSIZE / 2) - ARROWSIZE + 1)/2
else
	nX = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE * 2 + 2)/2
	nY = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - ARROWSIZE)/2
end if

if Chevron.MouseDown then
	nY += 1
end if

//Draw arrow
POINTF pt1,pt2,pt3

if theme.#ItemOrientation = Enums.HORZ then
	pt1.x = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE)/2
	pt1.y = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - (ARROWSIZE / 2) - ARROWSIZE + 1) / 2 + ARROWSIZE + 1
else
	pt1.x = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE * 2 + 2)/2 + ARROWSIZE + 2
	pt1.y = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - ARROWSIZE / 2)/2
end if

if Chevron.MouseDown then
	pt1.y += 1
end if

pt2.x = pt1.x + ARROWSIZE
pt2.y = pt1.y
pt3.x = pt1.x + ARROWSIZE / 2
pt3.y = pt1.y + ARROWSIZE / 2

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
//--------------------

for nRow = 1 to ARROWSIZE - 1
	Painter.SetPixel(hdc,nX,nY,arrowColor)
	Painter.SetPixel(hdc,nX + P2DX(1),nY,arrowColor)
	Painter.SetPixel(hdc,nX + P2DX(3),nY,arrowColor)
	Painter.SetPixel(hdc,nX + P2DX(4),nY,arrowColor)
	nY += P2DY(1)
	if nRow < ARROWSIZE / 2 then
		nX += P2DX(1)
	else
		nX -= P2DX(1)
	end if
next
end subroutine

private subroutine _of_trackmouseleave (readonly boolean track);TRACKMOUSEEVENT tme

if _MouseLeaveTracked=track then return

_MouseLeaveTracked=track

tme.cbsize = 16
tme.dwflags = Win32.TME_LEAVE
tme.hwndtrack = GetHandle()
tme.dwhovertime = 0

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(tme)
end subroutine

private subroutine _of_capturemouse (readonly boolean capture);_MouseCaptured = capture
end subroutine

private subroutine _of_flashdrawitem (integer index);Uint nFadeTime

if #LockUpdate then return
if index < 1 or index > UpperBound(Items) then return
if Items[index].hidden then return
if Not Items[index].Enabled or Items[index].MouseOver or Items[index].MouseDown or &
	Items[index].Chevron.MouseOver or Items[index].Chevron.MouseDown or Items[index].Toggled then
	return
end if

nFadeTime = #FadeTime
#FadeTime = #ParentToolBarStrip.#FlashFadeTime

_of_DrawItem(index,true)

#FadeTime = nFadeTime
end subroutine

private function boolean _of_isbutton (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

choose case Items[index].ItemType
	case ITT_LABEL,ITT_ICON,ITT_SEPARATOR,ITT_OBJECT
		return false
end choose

return true
end function

private subroutine _of_drawitem (readonly integer index, readonly boolean bimageonly, readonly boolean fadeanimation);ulong safeDC

if #LockUpdate then return
if index < 1 or index > UpperBound(Items) then return
if Items[index].hidden then return
if Items[index].ItemType = ITT_OBJECT then return

safeDC=GetSafeDC()

if safeDC = 0 then return

if bImageOnly then
	Painter.IntersectClipRect(safeDC,Items[index].rcImage)
else
	Painter.IntersectClipRect(safeDC,Items[index].rcPaint)
end if

Event OnEraseBkgnd(safeDC)

_of_DrawItem(index,safeDC)

Painter.SelectClipRgn(safeDC,0)

ulong hUpdateRgn

if bImageOnly then
	hUpdateRgn = Painter.CreateRectRgn(Items[index].rcImage)
else
	hUpdateRgn = Painter.CreateRectRgn(Items[index].rcPaint)
end if

if FadeAnimation then
	ReleaseDC(safeDC,hUpdateRgn,#FadeTime)
else
	ReleaseDC(safeDC,hUpdateRgn)
end if

Painter.DeleteRgn(hUpdateRgn)
end subroutine

private subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation);_of_DrawItem(index,false,fadeAnimation)
end subroutine

private function boolean _of_hasvalidimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

if Items[index].UseAnimatedImage then
	return (Items[index].AnimatedImage.GetFrameCount() > 0)
else
	return (Items[index].imageIndex > 0)
end if
end function

public function unsignedlong of_getchevronstate ();ulong nState

if Chevron.MouseDown then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if Chevron.MouseOver then nState += Enums.STATE_HOVER
end if

return nState
end function

public function unsignedlong of_getitemchevronstate (readonly integer index);ulong nState

if index < 1 or index > UpperBound(Items) then return 0

if Items[index].Chevron.MouseDown then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if Items[index].Chevron.MouseOver then nState += Enums.STATE_HOVER
end if

return nState
end function

public function unsignedlong of_getitemstate (readonly integer index);ulong nState

if index < 1 or index > UpperBound(Items) then return 0

if Items[index].Toggled or (Items[index].ItemType = ITT_DROPDOWN and Items[index].MouseDown) then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if Items[index].MouseOver and Not Items[index].Chevron.MouseOver  then nState += Enums.STATE_HOVER
	if Items[index].MouseDown then nState += Enums.STATE_PRESSED
end if
if Items[index].Highlighted then nState += Enums.STATE_HIGHLIGHTED
if Items[index].FlashTime = -1 or Items[index].FlashTime > 0 then nState += Enums.STATE_FLASHING
if Not Items[index].Enabled then nState += Enums.STATE_DISABLED

return nState
end function

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if BitAND(flags,ADJ_BORDER) > 0 then
	if theme.#BorderStyle = Enums.BS_SOLID or theme.#BorderStyle = Enums.BS_RAISED then
		fBorderSize = P2DX(1)
		Painter.InflateRect(ref adjRect,-fBorderSize,-fBorderSize)
	end if
end if

if BitAND(flags,ADJ_BORDERMARGIN) > 0 then
	adjRect.left += theme.#BorderMargin.left
	adjRect.top += theme.#BorderMargin.top
	adjRect.right -= theme.#BorderMargin.right
	adjRect.bottom -= theme.#BorderMargin.bottom
end if

if BitAND(flags,ADJ_CHEVRON) > 0 then
	if theme.#ItemOrientation = Enums.HORZ then
		adjRect.right -= TOOLBARCHEVRONSIZE
	else
		adjRect.bottom -= TOOLBARCHEVRONSIZE
	end if
end if
end subroutine

private function boolean _of_isoverchevron (readonly integer index, readonly real xpos, readonly real ypos);if index < 1 or index > UpperBound(Items) then return false

if Items[index].enabled and Not Items[index].hidden and Items[index].ItemType = ITT_SPLIT then
	if Painter.PtInRect(Items[index].Chevron.rcPaint,xpos,ypos) then
		return true
	end if
end if

return false
end function

public function integer of_indexfrompoint (readonly real xpos, readonly real ypos);int index

if Not Painter.PtInRect(rcPaint,xpos,ypos) then return 0

if Chevron.Visible then
	if Painter.PtInRect(Chevron.rcPaint,xpos,ypos) then
		return IDX_CHEVRON
	end if
end if

if _mouseOverIndex > 0 then
	if Items[_mouseOverIndex].Enabled and Not Items[_mouseOverIndex].Hidden then
		if Painter.PtInRect(Items[_mouseOverIndex].rcPaint,xpos,ypos) then
			return _mouseOverIndex
		end if
	end if
end if

for index = 1 to UpperBound(Items)
	if index = _mouseOverIndex then continue
	if Items[index].hidden or Not Items[index].enabled or Not _of_IsButton(index) then continue
	
	if Painter.PtInRect(Items[index].rcPaint,xpos,ypos) then
		return index
	end if

next

return 0
end function

public function unsignedlong of_popup (readonly unsignedlong hwnd, readonly real xpos, readonly real ypos, readonly unsignedlong flags);#FadeAnimation = #ParentToolBarStrip.#FadeAnimation
#FadeTime = #ParentToolBarStrip.#FadeTime

return PopupEx(hWnd,xpos,ypos,rcPaint.right,rcPaint.bottom,false,flags)
end function

private function unsignedlong _of_popup (real xpos, real ypos);int count,index
ulong rtCode
ulong pFlags
n_cst_toolbarstrip_popup ln_popup

ln_popup = Create n_cst_toolbarstrip_popup
ln_popup.Event OnInit(#ParentToolBarStrip,_ImageList,_ToolTip)
ln_popup.Event OnInitData(Items,1)

if theme.#ItemOrientation = Enums.HORZ then
	xpos = Chevron.rcPaint.Right
	ypos = Chevron.rcPaint.Bottom - 1
	pFlags = Win32.TPM_RIGHTALIGN + Win32.TPM_TOPALIGN + Win32.TPM_WORKAREA
else
	xpos = Chevron.rcPaint.Right - 1
	ypos = Chevron.rcPaint.Bottom
	pFlags = Win32.TPM_LEFTALIGN + Win32.TPM_BOTTOMALIGN + Win32.TPM_WORKAREA
end if

rtCode = ln_popup.of_Popup(GetHandle(),xpos,ypos,pFlags)
if Not IsValid(this) then return rtCode

Destroy ln_popup

_lastPopupIndex = IDX_CHEVRON
_lastPopupTime = Cpu()

return rtCode
end function

private function unsignedlong _of_popupmenu (readonly integer index, real xpos, real ypos);//Item chevron menu
ulong rtCode
ulong pmFlags

if index < 1 or index > UpperBound(Items) then return 0
if Not IsValidObject(Items[index].PopupMenu) then return 0

Items[index].PopupMenu.of_SetToolTip(#ParentToolBarStrip.#ToolTip)
Items[index].PopupMenu.theme.of_SetTheme(theme)

if theme.#ItemOrientation = Enums.HORZ then
	if Items[index].ItemType = ITT_DROPDOWN then
		xpos = Items[index].rcPaint.Left
		ypos = Items[index].rcPaint.Bottom
	elseif Items[index].ItemType = ITT_SPLIT then
		xpos = Items[index].Chevron.rcPaint.Left
		ypos = Items[index].Chevron.rcPaint.Bottom
	end if
else
	if Items[index].ItemType = ITT_DROPDOWN then
		xpos = Items[index].rcPaint.Right
		ypos = Items[index].rcPaint.Top
	elseif Items[index].ItemType = ITT_SPLIT then
		xpos = Items[index].Chevron.rcPaint.Right
		ypos = Items[index].Chevron.rcPaint.Top
	end if
end if

pmFlags = Win32.TPM_LEFTALIGN + Win32.TPM_TOPALIGN
if IsPrevented(#ParentToolBarStrip.Event OnPopupMenu(Items[index].ID,ref xpos,ref ypos,ref pmFlags)) then return 0
if Not IsValid(this) then return 0

rtCode = Items[index].PopupMenu.of_Popup(GetHandle(),xpos,ypos,pmFlags)
if Not IsValid(this) then return rtCode

_lastPopupIndex = index
_lastPopupTime = Cpu()

return rtCode
end function

on n_cst_toolbarstrip_popup.create
call super::create
this.timer=create timer
end on

on n_cst_toolbarstrip_popup.destroy
call super::destroy
destroy(this.timer)
end on

event destructor;call super::destructor;if _TTID > 0 then
	_ToolTip.DelTool(#ParentToolBarStrip.#Handle,_TTID)
end if
end event

event onpopup;call super::onpopup;if popup then
	Timer.Start(TM_FLASH,#ParentToolBarStrip.#FlashFadeTime)
	Timer.Start(TM_ANIMATION,TMI_ANIMATION)
else
	Timer.Stop(TM_FLASH)
	Timer.Stop(TM_ANIMATION)
end if
return 0
end event

type timer from n_timer within n_cst_toolbarstrip_popup descriptor "pb_nvo" = "true" 
end type

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

event ontimer;call super::ontimer;return Parent.Event OnTimer(id)
end event

