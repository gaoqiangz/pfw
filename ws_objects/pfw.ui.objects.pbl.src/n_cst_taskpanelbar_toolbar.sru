$PBExportHeader$n_cst_taskpanelbar_toolbar.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_taskpanelbar_toolbar from n_cst_taskpanelbar_baseitem
end type
type itemdata from structure within n_cst_taskpanelbar_toolbar
end type
type timer from n_timer within n_cst_taskpanelbar_toolbar
end type
type font from n_cst_font within n_cst_taskpanelbar_toolbar
end type
end forward

type itemdata from structure
	integer		itemtype
	boolean		visible
	boolean		hidden
	boolean		enabled
	boolean		mouseover
	boolean		mousedown
	boolean		highlighted
	boolean		toggled
	boolean		displaytext
	boolean		multiline
	boolean		flashing
	long		flashtime
	string		text
	string		tiptext
	long		tiptime
	string		image
	integer		imageindex
	n_cst_popupmenu		popupmenu
	boolean		menuowner
	paintpane		chevron
	any		data
	string		tag
	sizef		sztext
	rectf		rctext
	rectf		rcimage
	rectf		rcpaint
end type

global type n_cst_taskpanelbar_toolbar from n_cst_taskpanelbar_baseitem
unsignedinteger #type = 5
timer timer
font font
end type
global n_cst_taskpanelbar_toolbar n_cst_taskpanelbar_toolbar

type variables
/*--- Constants ---*/
Public:
//Indexes
Constant Int IDX_CHEVRON	= -1

/*--- Properties ---*/
Public:
PrivateWrite Boolean		#TextUnderImage	= false
PrivateWrite	Alignment 	#TextAlign			= Left!
PrivateWrite real			#ItemMargin		= 2
PrivateWrite SIZEF			#IconSize

/*--- Implementation ---*/
Private:
ITEMDATA 	Items[]
PAINTPANE	Chevron
n_imagelist _ImageList

Ulong _TTID	

Int		_mouseOverIndex  	= 0
Int		_mouseDownIndex	= 0
Int		_lastPopupIndex		= 0
Ulong	_lastPopupTime		= 0

//Item types
Constant Uint ITT_NORMAL		= 0
Constant Uint ITT_DROPDOWN	= 1
Constant Uint ITT_SPLIT			= 2
//Constant Uint	ITT_SEPARATOR	= 3
//Timer ID
Constant Uint TM_FLASH	= 1
//Sizes
Constant real BUTTONCHEVRONSIZE 	= 12 	//px
Constant real TOOLBARCHEVRONSIZE 	= 14 	//px
//Props
Constant String PRP_POPUPMENUCREATOR = "{POPUPMENU_CREATOR}"
end variables

forward prototypes
private subroutine _of_showtip (readonly integer index)
private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawitemchevron (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc)
public subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation)
private subroutine _of_flashdrawitem (readonly integer index)
private subroutine _of_updatetextsize ()
private subroutine _of_updatetextsize (readonly integer index)
public function long of_removeall ()
public function integer of_getlastvisible ()
public function integer of_getfirstvisible ()
public function integer of_getcount ()
public function integer of_addseparator ()
public function long of_visible (readonly integer index, readonly boolean visible)
public function long of_toggle (readonly integer index, readonly boolean toggled)
public function long of_settiptime (readonly integer index, readonly long tiptime)
public function long of_settiptext (readonly integer index, readonly string tiptext)
public function long of_settextunderimage (readonly boolean textunderimage)
public function long of_settext (readonly integer index, readonly string text)
public function long of_settag (readonly integer index, readonly string tag)
public function long of_setmultiline (readonly integer index, readonly boolean multiline)
public function long of_setimage (readonly integer index, readonly string image)
public function long of_setdata (readonly integer index, readonly any data)
public function long of_remove (readonly integer index)
public function boolean of_isvisible (readonly integer index)
public function boolean of_istoggled (readonly integer index)
public function boolean of_ismultiline (readonly integer index)
public function boolean of_ishighlighted (readonly integer index)
public function boolean of_isflashing (readonly integer index)
public function boolean of_isenabled (readonly integer index)
public function boolean of_isdisplaytext (readonly integer index)
public function integer of_insertseparator (readonly integer index)
public function integer of_insertbutton (readonly integer index, readonly string text, readonly string image, readonly string tiptext)
public function integer of_insertbutton (readonly integer index, readonly string text, readonly string image)
public function long of_highlight (readonly integer index, readonly boolean highlighted)
public function string of_gettiptext (readonly integer index)
public function string of_gettext (readonly integer index)
public function string of_gettag (readonly integer index)
public function integer of_getpreviousvisible (readonly integer index)
public function long of_getpopupmenu (readonly integer index, ref n_cst_popupmenu popupmenu)
public function integer of_getnextvisible (readonly integer index)
public function integer of_getindex (readonly string itemtext)
public function integer of_getindex (readonly n_cst_popupmenu popupmenu)
public function string of_getimage (readonly integer index)
public function any of_getdata (readonly integer index)
public function long of_flash (readonly integer index, readonly long flashtime)
public function long of_enable (readonly integer index, readonly boolean enabled)
public function long of_displaytextall (readonly boolean display)
public function long of_displaytext (readonly integer index, readonly boolean display)
public function integer of_addbutton (readonly string text, readonly string image)
public function integer of_addbutton (readonly string text, readonly string image, readonly string tiptext)
private subroutine _of_drawchevron (readonly unsignedlong hdc)
private subroutine _of_drawchevron (readonly boolean fadeanimation)
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu, readonly string clsname)
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu)
public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext)
public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image)
public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext)
public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image)
public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext)
public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image)
public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext)
public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image)
public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext)
public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image)
public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext)
public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image)
public function integer of_addsplitbutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext)
public function integer of_addsplitbutton (readonly string clsname, readonly string text, readonly string image)
public function integer of_addmenubutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext)
public function integer of_addmenubutton (readonly string clsname, readonly string text, readonly string image)
public function long of_setpopupmenu (readonly integer index, ref n_cst_popupmenu popupmenu)
public function long of_setpopupmenu (readonly integer index, readonly string clsname)
public function long of_settextalign (readonly alignment align)
public function unsignedlong of_getitemstate (readonly integer index)
public function unsignedlong of_getitemchevronstate (readonly integer index)
public function unsignedlong of_getchevronstate ()
public function unsignedlong of_getstate ()
public function long of_setitemmargin (readonly real margin)
private function unsignedlong _of_popupmenu (integer index, real xpos, real ypos)
private function long _of_popupmenu (real xpos, real ypos)
private function boolean _of_isoverchevron (readonly integer index, readonly real xpos, readonly real ypos)
public function integer of_indexfrompoint (readonly real xpos, readonly real ypos)
public function long of_seticonsize (readonly real width, readonly real height)
end prototypes

private subroutine _of_showtip (readonly integer index);if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _MouseCaptured then return

if #ParentTaskPanelBar.#ToolTip and (index >= 1 and index <= UpperBound(Items)) then
	if Items[index].TipText <> "" then
		if Items[index].TipTime > 0 then
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,Items[index].TipTime)
		else
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,-1)
		end if
		_ToolTip.UpdateTipText(#ParentTaskPanelBar.#Handle,_TTID,Items[index].TipText)
		_ToolTip.UpdateToolRect(#ParentTaskPanelBar.#Handle,_TTID,Items[index].rcPaint.Left,Items[index].rcPaint.Top,Items[index].rcPaint.Right,&
											Items[index].rcPaint.Bottom)
	else
		_ToolTip.UpdateToolRect(#ParentTaskPanelBar.#Handle,_TTID,0,0,0,0)
	end if
else
	_ToolTip.UpdateToolRect(#ParentTaskPanelBar.#Handle,_TTID,0,0,0,0)
end if
end subroutine

private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc);ulong textColor
ulong dtparam

textColor	= theme.of_GetToolBarItemColor(this,index,theme.CLR_TEXT,of_GetItemState(index))

dtparam = Painter.DT_EXPANDTABS
if Items[index].MultiLine then
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

if Items[index].MouseDown or Items[index].Toggled then
	Painter.of_DrawText(hdc,Font,Items[index].Text,+&
								Items[index].rcText.left,Items[index].rcText.top + 1,Items[index].rcText.right,Items[index].rcText.bottom + 1,&
								textColor,dtparam)
else
	Painter.of_Drawtext(hdc,Font,Items[index].Text,Items[index].rcText,textColor,dtparam)
end if
end subroutine

private subroutine _of_drawitemchevron (readonly integer index, readonly unsignedlong hdc);constant real ARROWSIZE = 6
ulong lineColor,arrowColor,nState
POINTF pt1,pt2,pt3

nState = of_GetItemState(index)
lineColor 	= theme.of_GetToolBarItemColor(this,index,theme.CLR_LINE,nState)
arrowColor	= theme.of_GetToolBarItemColor(this,index,theme.CLR_ARROW,nState)

//Draw line
if Items[index].ItemType = ITT_SPLIT and ((of_IsEnabled() and Items[index].Enabled)) then
	if (Not Items[index].MouseOver and Not Items[index].MouseDown and &
		Not Items[index].Chevron.MouseDown and Not Items[index].Toggled) and &
		(Items[index].HighLighted or ((Items[index].FlashTime = -1 or Items[index].FlashTime > 0) and Items[index].flashing)) then
		if #TextUnderImage then
			Painter.DrawLine(hdc,&
							Items[index].Chevron.rcPaint.left + 1,&
							Items[index].Chevron.rcPaint.top,&
							Items[index].Chevron.rcPaint.right - 1,&
							Items[index].Chevron.rcPaint.top,&
							lineColor,Enums.LS_SOLID,&
							false,1)
		else
			Painter.DrawLine(hdc,&
							Items[index].Chevron.rcPaint.left,&
							Items[index].Chevron.rcPaint.top + 1,&
							Items[index].Chevron.rcPaint.left,&
							Items[index].Chevron.rcPaint.bottom - 1,&
							lineColor,Enums.LS_SOLID,&
							false,1)
		end if
	end if
end if

//Draw arrow
pt1.x = Items[index].Chevron.rcPaint.left + (Items[index].Chevron.rcPaint.right - Items[index].Chevron.rcPaint.left - ARROWSIZE) / 2
pt1.y = Items[index].Chevron.rcPaint.top + (Items[index].Chevron.rcPaint.bottom - Items[index].Chevron.rcPaint.top - ARROWSIZE / 2) / 2
if Items[index].Chevron.MouseDown or (Items[index].ItemType = ITT_DROPDOWN and Items[index].MouseDown) then
	pt1.y += 1
end if
pt2.x = pt1.x + ARROWSIZE
pt2.y = pt1.y
pt3.x = pt1.x + ARROWSIZE / 2
pt3.y = pt1.y + ARROWSIZE / 2

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc);ulong bkColor,borderColor,nState
ulong chevronBorderColor,chevronBkColor,nChevronState
RADIUSF rdBorder,rdChevron
RECTF paintRect

if Not Items[index].Visible or Items[index].Hidden then return

nState = of_GetItemState(index)

if Items[index].ItemType = ITT_SEPARATOR then
	borderColor = theme.of_GetToolBarItemColor(this,index,theme.CLR_LINE,nState)
	if theme.#PanelBkgndStyle = Enums.SOLID or theme.#PanelBkgndStyle = Enums.TRANSPARENT then
		Painter.DrawLine(hdc,&
								Items[index].rcPaint.left,&
								Items[index].rcPaint.top + 1,&
								Items[index].rcPaint.left,&
								Items[index].rcPaint.bottom - 1,&
								borderColor,Enums.LS_SOLID ,false,1)
	else
		Painter.DrawGradientLine(hdc,&
								Items[index].rcPaint.left,&
								Items[index].rcPaint.top + 1,&
								Items[index].rcPaint.left,&
								Items[index].rcPaint.bottom - 1,&
								0,borderColor,Enums.LS_SOLID ,true,true,1)
	end if
	return
end if

if Not BitTest(nState,Enums.STATE_DISABLED) or Items[index].Toggled then
	bkColor = theme.of_GetToolBarItemColor(this,index,theme.CLR_BKGND,nState)
	borderColor = theme.of_GetToolBarItemColor(this,index,theme.CLR_BORDER,nState)
	rdBorder = theme.#ItemRoundSize
	if Items[index].ItemType = ITT_SPLIT then
		nChevronState = of_GetItemChevronState(index)
		chevronBkColor = theme.of_GetToolBarItemColor(this,index,theme.CLR_CHEVRONBKGND,nChevronState)
		chevronBorderColor = theme.of_GetToolBarItemColor(this,index,theme.CLR_CHEVRONBORDER,nChevronState)
		if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 and BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
			if Items[index].Flashing then
				bkColor = ARGBLighten(bkColor,0.4)
			end if
		end if
		if #TextUnderImage then
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
			if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
				borderColor = ARGBDarken(borderColor,0.2)
			end if
			if BitAND(nState,Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
				Painter.ThemeFill( hdc, paintRect, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
															theme.#ItemBorderStyle,borderColor,rdBorder)
			else
				Painter.DrawThemeBorder(hdc,paintRect,borderColor,Enums.TRANSPARENT,theme.#ItemBorderStyle,rdBorder)
			end if
			Painter.ThemeFill( hdc, Items[index].Chevron.rcPaint, chevronBkColor,Enums.VERT,theme.#ItemBkgndStyle,nChevronState,false,&
													theme.#ItemBorderStyle,ARGBDarken(chevronBorderColor,0.2),rdChevron)
		elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
			if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
				borderColor = ARGBDarken(borderColor,0.2)
			end if
			Painter.DrawThemeBorder(hdc,Items[index].Chevron.rcPaint,chevronBorderColor,Enums.TRANSPARENT,theme.#ItemBorderStyle,rdChevron)
			Painter.ThemeFill( hdc, paintRect, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
														theme.#ItemBorderStyle,borderColor,rdBorder)
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
			Painter.DrawThemeBorder(hdc,Items[index].rcPaint,borderColor,Enums.TRANSPARENT,theme.#ItemBorderStyle,rdBorder)
		end if
	end if
end if

if Items[index].Chevron.Visible then
	_of_DrawItemChevron(index,hdc)
end if

if Items[index].ImageIndex > 0 then
	if Items[index].MouseDown or Items[index].Toggled then
		_ImageList.Draw(Items[index].imageindex,hdc,&
									Items[index].rcImage.left,&
									Items[index].rcImage.top + 1,&
									Not Items[index].Enabled or Not of_IsEnabled())
	else
		_ImageList.Draw(Items[index].imageindex,hdc,&
									Items[index].rcImage.left,&
									Items[index].rcImage.top,&
									Not Items[index].Enabled or Not of_IsEnabled())
	end if
end if

_of_DrawItemText(index,hdc)
end subroutine

public subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation);ulong safeDC

if index < 1 or index > UpperBound(Items) then return
if Not Items[index].visible or Items[index].Hidden then return

safeDC=of_GetSafeDC()

if safeDC > 0 then
	
	Painter.IntersectClipRect(safeDC,Items[index].rcPaint)
	
	Event OnEraseBkgnd(safeDC)
	_of_DrawItem(index,safeDC)
	
	Painter.SelectClipRgn(safeDC,0)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(Items[index].rcPaint)
	
	of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)	
	
	Painter.DeleteRgn(hUpdateRgn)
end if
end subroutine

private subroutine _of_flashdrawitem (readonly integer index);Uint nFadeTime

if index < 1 or index > UpperBound(Items) then return
if Not Items[index].visible or Items[index].Hidden then return
if Not of_IsEnabled() then return
if Not Items[index].Enabled or Items[index].MouseOver or Items[index].MouseDown or &
	Items[index].Chevron.MouseOver or Items[index].Chevron.MouseDown or Items[index].Toggled then
	return
end if

nFadeTime = #ParentTaskPanelBar.#FadeTime
#ParentTaskPanelBar.#FadeTime = #ParentTaskPanelBar.#FlashFadeTime

_of_DrawItem(index,true)

#ParentTaskPanelBar.#FadeTime = nFadeTime
end subroutine

private subroutine _of_updatetextsize ();int index

for index = 1 to UpperBound(Items)
	_of_UpdateTextSize(index)
next
end subroutine

private subroutine _of_updatetextsize (readonly integer index);real maxWidth
ulong dtparam
RECTF calcRect

if index < 1 or index > UpperBound(Items) then return
if Len(Items[index].Text) = 0 then
	Items[index].szText.cx = 0
	Items[index].szText.cy = 0
	return
end if

maxWidth =_layoutWidth - 4

if Items[index].imageindex > 0 and Not #TextUnderImage then
	maxWidth -= #IconSize.cx + 2
end if

 if Items[index].Chevron.Visible then
	maxWidth -= BUTTONCHEVRONSIZE
 end if

if Items[index].MultiLine then
	calcRect.right = maxWidth
	dtparam = Painter.DT_EXPANDTABS + Painter.DT_WORDBREAK
else
	dtparam = Painter.DT_EXPANDTABS + Painter.DT_SINGLELINE
end if

Painter.of_CalcTextSize(Font,Items[index].Text,dtparam,ref calcRect)

Items[index].szText.cx = calcRect.right
Items[index].szText.cy = calcRect.bottom

if Items[index].szText.cx > maxWidth then
	Items[index].szText.cx = maxWidth
end if
end subroutine

public function long of_removeall ();int index
ITEMDATA emptyItems[]

if UpperBound(Items) = 0 then return RetCode.OK

for index = 1 to UpperBound(Items)
	if Items[index].MenuOwner then
		Destroy Items[index].PopupMenu
	end if
next

Items = emptyItems

_mouseOverIndex = 0
_mouseDownIndex = 0

of_UpdatePoints()
_of_ShowTip(0)

return RetCode.OK
end function

public function integer of_getlastvisible ();int index

for index = UpperBound(Items) to 1 step -1
	if Items[index].Visible then return index
next

return 0
end function

public function integer of_getfirstvisible ();int index

for index = 1 to UpperBound(Items)
	if Items[index].Visible then return index
next

return 0
end function

public function integer of_getcount ();return UpperBound(Items)
end function

public function integer of_addseparator ();return of_InsertSeparator(UpperBound(Items)+1)
end function

public function long of_visible (readonly integer index, readonly boolean visible);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].visible= Visible then return RetCode.OK

Items[index].visible= Visible

of_UpdatePoints()

return RetCode.OK
end function

public function long of_toggle (readonly integer index, readonly boolean toggled);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType = ITT_DROPDOWN or Items[index].ItemType = ITT_SEPARATOR then return RetCode.E_NO_SUPPORT
if Items[index].Toggled = toggled then return RetCode.OK

Items[index].Toggled = toggled

_of_DrawItem(index,true)

return RetCode.OK
end function

public function long of_settiptime (readonly integer index, readonly long tiptime);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType = ITT_SEPARATOR then return RetCode.E_NO_SUPPORT

Items[index].TipTime = tipTime

return RetCode.OK
end function

public function long of_settiptext (readonly integer index, readonly string tiptext);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType = ITT_SEPARATOR then return RetCode.E_NO_SUPPORT

Items[index].tipText = tiptext

return RetCode.OK
end function

public function long of_settextunderimage (readonly boolean textunderimage);if #TextUnderImage = textUnderImage then return RetCode.OK

#TextUnderImage = textUnderImage

of_UpdatePoints()

return RetCode.OK
end function

public function long of_settext (readonly integer index, readonly string text);SIZEF textOldSize

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType = ITT_SEPARATOR then return RetCode.E_NO_SUPPORT
if Items[index].Text = text then return RetCode.OK

textOldSize = Items[index].szText

Items[index].Text = text

_of_UpdateTextSize(index)

if Items[index].Visible and Items[index].DisplayText then
	if textOldSize <> Items[index].szText then
		of_UpdatePoints()
	else
		_of_DrawItem(index,false)
	end if
end if

return RetCode.OK
end function

public function long of_settag (readonly integer index, readonly string tag);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[index].Tag = tag

return RetCode.OK
end function

public function long of_setmultiline (readonly integer index, readonly boolean multiline);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].MultiLine = MultiLine then return RetCode.OK

Items[index].MultiLine = MultiLine

_of_UpdateTextSize(index)

if Items[index].Visible and Items[index].DisplayText then
	of_UpdatePoints()
end if

return RetCode.OK
end function

public function long of_setimage (readonly integer index, readonly string image);int newImgIndex
boolean dirty

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType = ITT_SEPARATOR then return RetCode.E_NO_SUPPORT
if Items[index].image = image then return RetCode.OK

newImgIndex = _ImageList.AddImage(Trim(image))
if (Items[index].imageIndex > 0) <> (newImgIndex > 0) then
	dirty = true
end if

Items[index].image = image
Items[index].imageIndex = newImgIndex

if dirty then
	_of_UpdateTextSize(index)
end if

if Items[index].Visible then
	if dirty then
		of_UpdatePoints()
	else
		_of_DrawItem(index,true)
	end if
end if

return RetCode.OK
end function

public function long of_setdata (readonly integer index, readonly any data);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[index].Data = data

return RetCode.OK
end function

public function long of_remove (readonly integer index);int i
boolean bVisible
ITEMDATA newItems[]

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

if index = _mouseOverIndex then
	_mouseOverIndex = 0
end if

if index = _mouseDownIndex then
	_mouseDownIndex = 0
end if
	
bVisible = Items[index].Visible

if Items[index].MenuOwner then
	Destroy Items[index].PopupMenu
end if

for i = 1 to UpperBound(Items)
	if i = index then continue
	newItems[UpperBound(newItems) + 1] = Items[i]
next

Items = newItems

if UpperBound(Items) = 0 then
	_mouseOverIndex = 0
	_mouseDownIndex = 0
end if

if bVisible then
	of_UpdatePoints()
end if

_of_ShowTip(0)

return RetCode.OK
end function

public function boolean of_isvisible (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].visible
end function

public function boolean of_istoggled (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].Toggled
end function

public function boolean of_ismultiline (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].MultiLine
end function

public function boolean of_ishighlighted (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].HighLighted
end function

public function boolean of_isflashing (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return (Items[index].FlashTime = -1 or Items[index].FlashTime > 0)
end function

public function boolean of_isenabled (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].enabled
end function

public function boolean of_isdisplaytext (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].DisplayText
end function

public function integer of_insertseparator (readonly integer index);int i
ITEMDATA newItem

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

newItem.visible = true
newItem.ItemType = ITT_SEPARATOR
newItem.enabled = true
newItem.imageIndex = 0

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

_of_UpdateTextSize(index)
of_UpdatePoints()

return index
end function

public function integer of_insertbutton (readonly integer index, readonly string text, readonly string image, readonly string tiptext);int i
ITEMDATA newItem

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

newItem.Text = text
newItem.tipText = tiptext
newItem.enabled = true
newItem.visible = true
newItem.DisplayText = true
newItem.ItemType = ITT_NORMAL
newItem.imageIndex = 0

if len(image) > 0 then
	newItem.image = image
	newItem.imageindex = _ImageList.AddImage(Trim(image))
end if

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

_of_UpdateTextSize(index)
of_UpdatePoints()

return index
end function

public function integer of_insertbutton (readonly integer index, readonly string text, readonly string image);return of_InsertButton(index,text,image,"")
end function

public function long of_highlight (readonly integer index, readonly boolean highlighted);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType = ITT_SEPARATOR then return RetCode.E_NO_SUPPORT
if Items[index].HighLighted = highlighted then return RetCode.OK

Items[index].HighLighted = highlighted
_of_DrawItem(index,true)

return RetCode.OK
end function

public function string of_gettiptext (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].tiptext
end function

public function string of_gettext (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].text
end function

public function string of_gettag (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].Tag
end function

public function integer of_getpreviousvisible (readonly integer index);int i

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

for i = index - 1 to 1 step -1
	if Items[i].Visible then return i
next

return 0
end function

public function long of_getpopupmenu (readonly integer index, ref n_cst_popupmenu popupmenu);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

try
	PopupMenu = Items[index].PopupMenu
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(PopupMenu),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function integer of_getnextvisible (readonly integer index);int i

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

for i = index + 1 to UpperBound(Items)
	if Items[i].Visible then return i
next

return 0
end function

public function integer of_getindex (readonly string itemtext);int index

for index = 1 to UpperBound(Items)
	if Upper(ItemText)= upper(Items[index].Text) then return index
next

return 0
end function

public function integer of_getindex (readonly n_cst_popupmenu popupmenu);int index

for index = 1 to UpperBound(Items)
	if Items[index].PopupMenu = PopupMenu then 	return index
next

return 0
end function

public function string of_getimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].image
end function

public function any of_getdata (readonly integer index);Any data

if index < 1 or index > UpperBound(Items) then return data

return Items[index].data
end function

public function long of_flash (readonly integer index, readonly long flashtime);//flashtime:sec
//-1:always
//0:stop
if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType = ITT_SEPARATOR then return RetCode.E_NO_SUPPORT
if flashtime < 0 and flashtime <> -1 then return RetCode.E_INVALID_ARGUMENT
if flashtime = -1 and Items[index].flashtime = flashtime then return RetCode.OK
if flashtime = 0 and Items[index].flashtime = flashtime then return RetCode.OK
if Items[index].flashtime = flashtime * 1000 then return RetCode.OK

Items[index].FlashTime = flashtime

if Items[index].FlashTime > 0 then
	Items[index].FlashTime *= 1000	//转换为毫秒
end if

if Items[index].FlashTime = -1 or Items[index].FlashTime > 0 then
	Items[index].flashing = true
	_of_FlashDrawItem(index)
	Timer.Start(TM_FLASH,#ParentTaskPanelBar.#FlashFadeTime)
else
	Items[index].flashing = false
	_of_DrawItem(index,true)
end if

return RetCode.OK
end function

public function long of_enable (readonly integer index, readonly boolean enabled);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType = ITT_SEPARATOR then return RetCode.E_NO_SUPPORT
if Items[index].enabled = Enabled then return RetCode.OK

Items[index].enabled = Enabled
_of_DrawItem(index,true)

return RetCode.OK
end function

public function long of_displaytextall (readonly boolean display);int index

for index = 1 to UpperBound(Items)
	if Items[index].ItemType = ITT_SEPARATOR then continue
	Items[index].DisplayText = display
next

of_UpdatePoints()

return RetCode.OK
end function

public function long of_displaytext (readonly integer index, readonly boolean display);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType = ITT_SEPARATOR then return RetCode.E_NO_SUPPORT
if Items[index].DisplayText = display then return RetCode.OK

Items[index].DisplayText = display

if Items[index].Visible then
	of_UpdatePoints()
end if

return RetCode.OK
end function

public function integer of_addbutton (readonly string text, readonly string image);return of_AddButton(text,image,"")
end function

public function integer of_addbutton (readonly string text, readonly string image, readonly string tiptext);return of_InsertButton(UpperBound(Items)+1,text,image,tiptext)
end function

private subroutine _of_drawchevron (readonly unsignedlong hdc);real nX,nY
long nRow
ulong borderColor,arrowColor,bkColor,nState
RADIUSF rdBorder
Constant real ARROWSIZE = 6

if Not Chevron.Visible then return

nState = of_GetChevronState()

//Fill background
if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
	borderColor	 = theme.of_GetItemColor(this,theme.CLR_CHEVRONBORDER,nState)
	bkColor	= theme.of_GetColor(theme.CLR_CHEVRONBKGND,nState)
	rdBorder = theme.#ItemRoundSize
	Painter.ThemeFill(hdc,Chevron.rcPaint,bkColor,theme.#BkgndOrientation,theme.#ItemBkgndStyle,nState,false,theme.#ItemBorderStyle,borderColor,rdBorder)
end if

nX = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE)/2
nY = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - (ARROWSIZE / 2) - ARROWSIZE + 1)/2

if Chevron.MouseDown then
	nY += 1
end if

//Draw arrow
POINTF pt1,pt2,pt3

arrowColor = theme.of_GetItemColor(this,theme.CLR_ARROW,nState)

pt1.x = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE)/2
pt1.y = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - (ARROWSIZE / 2) - ARROWSIZE + 1) / 2 + ARROWSIZE + 1

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
	Painter.SetPixel(hdc,nX + 1,nY,arrowColor)
	Painter.SetPixel(hdc,nX + 3,nY,arrowColor)
	Painter.SetPixel(hdc,nX + 4,nY,arrowColor)
	nY += 1
	if nRow < ARROWSIZE / 2 then
		nX += 1
	else
		nX -= 1
	end if
next
end subroutine

private subroutine _of_drawchevron (readonly boolean fadeanimation);ulong safeDC

if of_IsLockUpdate() then return
if Not Chevron.Visible then return

safeDC=of_GetSafeDC()

if safeDC > 0 then
	Painter.IntersectClipRect(safeDC,Chevron.rcPaint)
		
	Event OnEraseBkgnd(safeDC)
	
	_of_DrawChevron(safeDC)
	
	Painter.SelectClipRgn(safeDC,0)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(Chevron.rcPaint)
	
	of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
end if
end subroutine

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

private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu);return _of_CreatePopupMenu(ref popupmenu,"")
end function

public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext);int i
ITEMDATA newItem

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

if Not IsValidObject(PopupMenu) then
	if Not _of_CreatePopupMenu(ref PopupMenu) then return RetCode.E_INVALID_OBJECT
	newItem.MenuOwner = true
	PopupMenu.#Tag = ""
elseif PopupMenu.#Tag = PRP_POPUPMENUCREATOR then
	newItem.MenuOwner = true
	PopupMenu.#Tag = ""
end if

newItem.Text = text
newItem.tipText = tiptext
newItem.enabled = true
newItem.visible = true
newItem.DisplayText = true
newItem.ItemType = ITT_SPLIT
newItem.PopupMenu = PopupMenu
newItem.Chevron.Visible = true
newItem.imageIndex = 0

if len(image) > 0 then
	newItem.image = image
	newItem.imageindex = _ImageList.AddImage(Trim(image))
end if

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

_of_UpdateTextSize(index)
of_UpdatePoints()

return index
end function

public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image);return of_InsertSplitButton(index,popupmenu,text,image,"")
end function

public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext);int i
ITEMDATA newItem

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

if Not IsValidObject(PopupMenu) then
	if Not _of_CreatePopupMenu(ref PopupMenu) then return RetCode.E_INVALID_OBJECT
	newItem.MenuOwner = true
	PopupMenu.#Tag = ""
elseif PopupMenu.#Tag = PRP_POPUPMENUCREATOR then
	newItem.MenuOwner = true
	PopupMenu.#Tag = ""
end if

newItem.Text = text
newItem.tipText = tiptext
newItem.enabled = true
newItem.visible = true
newItem.DisplayText = true
newItem.ItemType = ITT_DROPDOWN
newItem.PopupMenu = PopupMenu
newItem.Chevron.Visible = true
newItem.imageIndex = 0

if len(image) > 0 then
	newItem.image = image
	newItem.imageindex = _ImageList.AddImage(Trim(image))
end if

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

_of_UpdateTextSize(index)
of_UpdatePoints()

return index
end function

public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image);return of_InsertMenuButton(index,popupmenu,text,image,"")
end function

public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext);return of_InsertMenuButton(UpperBound(Items)+1,PopupMenu,text,image,tiptext)
end function

public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image);return of_AddMenuButton(popupmenu,text,image,"")
end function

public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext);return of_InsertSplitButton(UpperBound(Items)+1,PopupMenu,text,image,tiptext)
end function

public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image);return of_AddSplitButton(popupmenu,text,image,"")
end function

public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext);int newIndex
n_cst_popupmenu popupMenu

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE
if Not _of_CreatePopupMenu(ref popupMenu,clsName) then return RetCode.E_INVALID_TYPE

newIndex = of_InsertSplitButton(index,ref popupMenu,text,image,tipText)
if newIndex <= 0 then
	Destroy popupMenu
end if

return newIndex
end function

public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image);return of_InsertSplitButton(index,clsName,text,image,"")
end function

public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext);int newIndex
n_cst_popupmenu popupMenu

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE
if Not _of_CreatePopupMenu(ref popupMenu,clsName) then return RetCode.E_INVALID_TYPE

newIndex = of_InsertMenuButton(index,ref popupMenu,text,image,tipText)
if newIndex <= 0 then
	Destroy popupMenu
end if

return newIndex
end function

public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image);return of_InsertMenuButton(index,clsName,text,image,"")
end function

public function integer of_addsplitbutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext);return of_InsertSplitButton(UpperBound(Items)+1,clsName,text,image,tiptext)
end function

public function integer of_addsplitbutton (readonly string clsname, readonly string text, readonly string image);return of_AddSplitButton(clsName,text,image,"")
end function

public function integer of_addmenubutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext);return of_InsertMenuButton(UpperBound(Items)+1,clsName,text,image,tiptext)
end function

public function integer of_addmenubutton (readonly string clsname, readonly string text, readonly string image);return of_AddMenuButton(clsName,text,image,"")
end function

public function long of_setpopupmenu (readonly integer index, ref n_cst_popupmenu popupmenu);boolean bOwner

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType <> ITT_DROPDOWN and Items[index].ItemType <> ITT_SPLIT then return RetCode.E_NO_SUPPORT
if IsValidObject(PopupMenu) and Items[index].PopupMenu = PopupMenu then return RetCode.OK

if Not IsValidObject(PopupMenu) then
	if Not _of_CreatePopupMenu(ref PopupMenu) then return RetCode.E_INVALID_OBJECT
	bOwner = true
	PopupMenu.#Tag = ""
elseif PopupMenu.#Tag = PRP_POPUPMENUCREATOR then
	bOwner = true
	PopupMenu.#Tag = ""
end if

if Items[index].MenuOwner then
	Destroy Items[index].PopupMenu
end if

Items[index].PopupMenu = PopupMenu
Items[index].MenuOwner = bOwner

return RetCode.OK
end function

public function long of_setpopupmenu (readonly integer index, readonly string clsname);long rtCode
n_cst_popupmenu popupMenu

if Not _of_CreatePopupMenu(ref popupMenu,clsName) then return RetCode.E_INVALID_TYPE

rtCode = of_SetPopupMenu(index,ref popupMenu)
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
if Not Items[index].Enabled or Not of_IsEnabled() then nState += Enums.STATE_DISABLED

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

public function unsignedlong of_getchevronstate ();ulong nState

if Chevron.MouseDown then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if Chevron.MouseOver then nState += Enums.STATE_HOVER
end if

return nState
end function

public function unsignedlong of_getstate ();ulong nState

if Not of_IsEnabled() then nState += Enums.STATE_DISABLED

return nState
end function

public function long of_setitemmargin (readonly real margin);if #ItemMargin = margin then return RetCode.OK

#ItemMargin = margin

of_UpdatePoints()

return RetCode.OK
end function

private function unsignedlong _of_popupmenu (integer index, real xpos, real ypos);ulong rtCode
ulong pmFlags

if index < 1 or index > UpperBound(Items) then return 0
if Not IsValidObject(Items[index].PopupMenu) then return 0

Items[index].PopupMenu.of_SetToolTip(#ParentTaskPanelBar.#ToolTip)
Items[index].PopupMenu.theme.of_SetTheme(theme)

if Items[index].ItemType = ITT_DROPDOWN then
	xpos = Items[index].rcPaint.left
	ypos = Items[index].rcPaint.bottom
else
	xpos = Items[index].Chevron.rcPaint.left
	ypos = Items[index].Chevron.rcPaint.bottom
end if

pmFlags = Win32.TPM_LEFTALIGN + Win32.TPM_TOPALIGN
if IsPrevented(#ParentTaskPanelBar.Event OnToolBarPopupMenu(this,index,ref xpos,ref ypos,ref pmFlags)) then return 0

rtCode = Items[index].PopupMenu.of_Popup(#ParentTaskPanelBar.#Handle,xpos,ypos,pmFlags)
if rtCode > 0 then
	if IsAllowed(#ParentTaskPanelBar.Event OnToolBarMenuSelecting(this,index,rtCode)) then
		#ParentTaskPanelBar.Post Event OnToolBarMenuSelected(this,index,rtCode)
	end if
end if
		
_lastPopupIndex = index
_lastPopupTime = Cpu()

return rtCode
end function

private function long _of_popupmenu (real xpos, real ypos);int count,index
ulong rtCode
ulong pmFlags
n_cst_popupmenu ln_menu

if Not Chevron.visible then return 0

ln_menu = Create n_cst_popupmenu
ln_menu.of_SetToolTip(#ParentTaskPanelBar.#ToolTip)
ln_menu.theme.of_SetTheme(theme)
ln_menu.theme.of_SetIconSize(#IconSize.cx,#IconSize.cy)
ln_menu.theme.Font.of_SetFont(font)

count = UpperBound(Items)

for index = 1 to count
	if Not Items[index].Visible or Not Items[index].Hidden then continue
	if Items[index].ItemType = ITT_SEPARATOR then
		ln_menu.of_AddSeparator()
	elseif Items[index].ItemType = ITT_DROPDOWN or Items[index].ItemType = ITT_SPLIT then
		ln_menu.of_AddSubMenu(Items[index].PopupMenu,Items[index].text,Items[index].Image,Items[index].tipText,&
										Items[index].ItemType = ITT_SPLIT,Items[index].Enabled,index)
	else
		ln_menu.of_AddMenu(Items[index].text,Items[index].Image,Items[index].tipText,&
										Items[index].Enabled,index)
		if Items[index].Toggled then
			ln_menu.of_Check(index,false,true)
		end if
	end if
next

xpos = Chevron.rcPaint.Right + 2
ypos = Chevron.rcPaint.Bottom
pmFlags = Win32.TPM_RIGHTALIGN + Win32.TPM_TOPALIGN

#ParentTaskPanelBar.Event OnToolBarPopupMenu(this,IDX_CHEVRON,ref xpos,ref ypos,ref pmFlags)
rtCode = ln_menu.of_Popup(#ParentTaskPanelBar.#Handle,xpos,ypos,pmFlags)

if rtCode > 0 then
	rtCode = ln_menu.of_GetLastSelectID()
	if rtCode > 0 then
		if IsAllowed(#ParentTaskPanelBar.Event OnToolBarButtonClicking(this,rtCode)) then
			#ParentTaskPanelBar.Post Event OnToolBarButtonClicked(this,rtCode)
		end if
	else
		n_cst_popupmenu ln_subMenuSelect,ln_subMenuSelect2,ln_subMenu
		if IsSucceeded(ln_menu.of_GetLastSelectSubMenu(ref ln_subMenuSelect)) then
			rtCode = ln_subMenuSelect.of_GetLastSelectID()
			if rtCode > 0 then
				int nSelectIndex
				for index = ln_menu.of_GetCount() to 1 step -1
					if IsSucceeded(ln_menu.of_GetSubMenu(index,true,ref ln_subMenu)) then
						if ln_subMenu = ln_subMenuSelect then
							nSelectIndex = ln_menu.of_GetID(index)
							exit
						else
							if IsSucceeded(ln_subMenu.of_GetLastSelectSubMenu(ref ln_subMenuSelect2)) then
								if ln_subMenuSelect = ln_subMenuSelect2 then
									nSelectIndex = ln_menu.of_GetID(index)
									exit
								end if
							end if
						end if
					end if
				next
				if nSelectIndex = 0 then
					nSelectIndex = IDX_CHEVRON
				end if
				if IsAllowed(#ParentTaskPanelBar.Event OnToolBarMenuSelecting(this,nSelectIndex,rtCode)) then
					#ParentTaskPanelBar.Post Event OnToolBarMenuSelected(this,nSelectIndex,rtCode)
				end if
			end if
		end if
	end if
end if

Destroy ln_menu

_lastPopupIndex = IDX_CHEVRON
_lastPopupTime = Cpu()

return rtCode
end function

private function boolean _of_isoverchevron (readonly integer index, readonly real xpos, readonly real ypos);if index < 1 or index > UpperBound(Items) then return false

if Items[index].enabled and Items[index].visible and Items[index].ItemType = ITT_SPLIT then
	if Painter.PtInRect(Items[index].Chevron.rcPaint,xpos,ypos) then
		return true
	end if
end if

return false
end function

public function integer of_indexfrompoint (readonly real xpos, readonly real ypos);int index

if Not of_IsVisible() or Not of_IsEnabled() then return 0
if Not Painter.PtInRect(rcPaint,xpos,ypos) then return 0

if Chevron.Visible then
	if Painter.PtInRect(Chevron.rcPaint,xpos,ypos) then
		return IDX_CHEVRON
	end if
end if

if _mouseOverIndex > 0 then
	if Items[_mouseOverIndex].Visible and Not Items[_mouseOverIndex].Hidden and Items[_mouseOverIndex].Enabled then
		if Painter.PtInRect(Items[_mouseOverIndex].rcPaint,xpos,ypos) then
			return _mouseOverIndex
		end if
	end if
end if

for index = 1 to UpperBound(Items)
	if index = _mouseOverIndex then continue
	if Not Items[index].visible or Items[index].Hidden or Not Items[index].enabled then continue
	if Items[index].ItemType = ITT_SEPARATOR then continue
	
	if Painter.PtInRect(Items[index].rcPaint,xpos,ypos) then
		return index
	end if

next

return 0
end function

public function long of_seticonsize (readonly real width, readonly real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if #IconSize.cx = width and #IconSize.cy = height then return RetCode.OK

#IconSize.cx = width
#IconSize.cy = height

_ImageList.SetImageSize(#IconSize.cx,#IconSize.cy)

of_UpdatePoints()

return RetCode.OK
end function

on n_cst_taskpanelbar_toolbar.create
call super::create
this.timer=create timer
this.font=create font
end on

on n_cst_taskpanelbar_toolbar.destroy
call super::destroy
destroy(this.timer)
destroy(this.font)
end on

event onupdatelayout;call super::onupdatelayout;if AncestorReturnValue = 1 then return 1
_of_UpdateTextSize()
_of_RecalcLayout()
return 0
end event

event oncapturechanged;call super::oncapturechanged;if _MouseCaptured then
	_of_CaptureMouse(false)
	if Chevron.MouseDown then
		Chevron.MouseDown = false
		_of_DrawChevron(true)
		#ParentTaskPanelBar.Event OnToolBarButtonMouseUp(this,IDX_CHEVRON,0,0)
	end if
	if _mouseDownIndex>0 then
		Items[_mouseDownIndex].mousedown=false
		_of_DrawItem(_mouseDownIndex,true)
		#ParentTaskPanelBar.Event OnToolBarButtonMouseUp(this,_mouseDownIndex,0,0)
		_mouseDownIndex = 0
	end if
	Event OnMouseLeave()
end if
end event

event constructor;call super::constructor;#IconSize.cx = Enums.SMALL
#IconSize.cy = Enums.SMALL

_ImageList = Create n_imagelist

_ImageList.ShareImage(true)
_ImageList.SetImageSize(#IconSize.cx,#IconSize.cy)
end event

event destructor;call super::destructor;int index

for index = 1 to UpperBound(Items)
	if Items[index].MenuOwner then
		Destroy Items[index].PopupMenu
	end if
next

Destroy _ImageList

if _TTID > 0 then
	_ToolTip.DelTool(#ParentTaskPanelBar.#Handle,_TTID)
end if
end event

event oninit;call super::oninit;_TTID = _ToolTip.AddTool(#ParentTaskPanelBar.#Handle,false,Win32.TTF_SUBCLASS + Win32.TTF_TRANSPARENT)
end event

event onlbuttondblclk;call super::onlbuttondblclk;return Event OnLButtonDown(vKey,xpos,ypos)
end event

event onlbuttondown;call super::onlbuttondown;int li_mouseOverIndex

if _mouseOverIndex = 0 then return 1

li_mouseOverIndex = _mouseOverIndex

if li_mouseOverIndex > 0 then
	if (Items[li_mouseOverIndex].ItemType = ITT_DROPDOWN and Items[li_mouseOverIndex].MouseOver) or&
		(Items[li_mouseOverIndex].ItemType = ITT_SPLIT and Items[li_mouseOverIndex].Chevron.MouseOver) then
		
		if _lastPopupIndex = li_mouseOverIndex and Cpu() - _lastPopupTime < 100 then
			return 1
		end if
		
		_of_ShowTip(0)
		
		if Items[li_mouseOverIndex].ItemType = ITT_SPLIT then
			Items[li_mouseOverIndex].Chevron.mousedown=true
		else
			Items[li_mouseOverIndex].mousedown=true
			#ParentTaskPanelBar.Event OnToolBarButtonMouseDown(this,li_mouseOverIndex,xpos,ypos)
		end if
		_of_DrawItem(li_mouseOverIndex,false)
		
		_of_PopupMenu(li_mouseOverIndex,xpos,ypos)
		
		if Items[li_mouseOverIndex].ItemType = ITT_SPLIT then
			Items[li_mouseOverIndex].Chevron.mousedown=false
		else
			Items[li_mouseOverIndex].mousedown=false
		end if
		_of_DrawItem(li_mouseOverIndex,true)
	else
		_of_ShowTip(0)
		Items[li_mouseOverIndex].mousedown=true
		_of_DrawItem(li_mouseOverIndex,false)
		_mouseDownIndex = li_mouseOverIndex
		_of_CaptureMouse(true)
		
		#ParentTaskPanelBar.Event OnToolBarButtonMouseDown(this,_mouseDownIndex,xpos,ypos)
	end if
end if

if Chevron.MouseOver then
	if _lastPopupIndex = IDX_CHEVRON and Cpu() - _lastPopupTime < 100 then
		return 0
	end if
	Chevron.MouseDown = true
	_of_DrawChevron(false)
	
	#ParentTaskPanelBar.Event OnToolBarButtonMouseDown(this,IDX_CHEVRON,xpos,ypos)
	_of_PopupMenu(xpos,ypos)
	
	Chevron.MouseDown = false
	_of_DrawChevron(true)
end if

return 0
end event

event onlbuttonup;call super::onlbuttonup;if Not _MouseCaptured then return 0

_of_CaptureMouse(false)

if _mouseDownIndex > 0 then
	Items[_mouseDownIndex].MouseDown = false
	_of_DrawItem(_mouseDownIndex,true)
	
	#ParentTaskPanelBar.Event OnToolBarButtonMouseUp(this,_mouseDownIndex,xpos,ypos)
	
	if _mouseDownIndex = _mouseOverIndex and Not Items[_mouseDownIndex].Chevron.MouseOver then		//Clicked
		if IsAllowed(#ParentTaskPanelBar.Event OnToolBarButtonClicking(this,_mouseDownIndex)) then
			#ParentTaskPanelBar.Post Event OnToolBarButtonClicked(this,_mouseDownIndex)
		end if
	end if
	
	_mouseDownIndex = 0
end if

return 0
end event

event onmouseleave;call super::onmouseleave;if _mouseOverIndex>0 then
	Items[_mouseOverIndex].mouseover=false
	Items[_mouseOverIndex].Chevron.mouseover=false
	_of_DrawItem(_mouseOverIndex,true)
	#ParentTaskPanelBar.Event  OnToolBarButtonMouseLeave(this,_mouseOverIndex)
	_mouseOverIndex = 0
end if

if Chevron.MouseOver then
	Chevron.MouseOver = false
	_of_DrawChevron(true)
	#ParentTaskPanelBar.Event  OnToolBarButtonMouseLeave(this,IDX_CHEVRON)
end if

_of_ShowTip(0)
end event

event onmousemove;call super::onmousemove;int index
	
index = of_indexfrompoint(xpos,ypos)

if _mouseOverIndex <> index then
	
	if _mouseOverIndex>0 then
		Items[_mouseOverIndex].mouseover=false
		Items[_mouseOverIndex].Chevron.mouseover=false
		_of_DrawItem(_mouseOverIndex,true)
		_of_ShowTip(0)
		#ParentTaskPanelBar.Event  OnToolBarButtonMouseLeave(this,_mouseOverIndex)
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
		#ParentTaskPanelBar.Event  OnToolBarButtonMouseEnter(this,_mouseOverIndex,xpos,ypos)
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
	#ParentTaskPanelBar.Event  OnToolBarButtonMouseMove(this,_mouseOverIndex,xpos,ypos)
end if

if index = IDX_CHEVRON then
	if Not Chevron.MouseOVer then
		Chevron.MouseOver = true
		_of_DrawChevron(true)
		_of_ShowTip(0)
		#ParentTaskPanelBar.Event  OnToolBarButtonMouseMove(this,IDX_CHEVRON,xpos,ypos)
	else
		#ParentTaskPanelBar.Event  OnToolBarButtonMouseEnter(this,IDX_CHEVRON,xpos,ypos)
	end if
else
	if Chevron.MouseOVer then
		Chevron.MouseOver = false
		_of_DrawChevron(true)
		#ParentTaskPanelBar.Event  OnToolBarButtonMouseLeave(this,IDX_CHEVRON)
	end if
end if

return 1
end event

event onpaint;call super::onpaint;int index

if AncestorReturnValue = 1 then return 1

for index = 1 to UpperBound(Items)
	if Not Items[index].Visible or Items[index].Hidden then continue
	_of_DrawItem(index,hdc)
next

if Chevron.Visible then
	_of_DrawChevron(hdc)
end if

return 1
end event

event onreposition;call super::onreposition;int index
real maxWidth
real xpos
boolean bSomeHidden

if AncestorReturnValue = 1 then return 1

xpos = rcPaint.left

if Chevron.Visible then
	Chevron.rcPaint.left = rcPaint.right - TOOLBARCHEVRONSIZE
	Chevron.rcPaint.right = rcPaint.right
	Chevron.rcPaint.top	= rcPaint.top
	Chevron.rcPaint.bottom = rcPaint.bottom
end if

for index = 1 to UpperBound(Items)
	if Not Items[index].Visible then continue
	if bSomeHidden then
		Items[index].Hidden = true
		continue
	end if
	if Items[index].ItemType = ITT_SEPARATOR then
		Items[index].rcPaint.left = xpos
		Items[index].rcPaint.top = rcPaint.top
		Items[index].rcPaint.right = Items[index].rcPaint.left + 1
		Items[index].rcPaint.bottom = rcPaint.bottom
	else
		Items[index].rcPaint.left = xpos
		Items[index].rcPaint.top = rcPaint.top
		Items[index].rcPaint.right = xpos
		Items[index].rcPaint.bottom = rcPaint.bottom
		if Items[index].DisplayText and Items[index].szText.cx > 0 then
			if Items[index].ImageIndex > 0 then
				if #TextUnderImage then
					if Items[index].szText.cx > #IconSize.cx then
						maxWidth = Items[index].szText.cx
					else
						maxWidth = #IconSize.cx
					end if
					Items[index].rcImage.left = Items[index].rcPaint.left + 2 + (maxWidth - #IconSize.cx) / 2
					Items[index].rcImage.top = Items[index].rcPaint.top + 2
					Items[index].rcImage.right = Items[index].rcImage.left + #IconSize.cx
					Items[index].rcImage.bottom = Items[index].rcImage.top + #IconSize.cy
					Items[index].rcText.left = Items[index].rcPaint.left + 2 + (maxWidth - Items[index].szText.cx) / 2
					Items[index].rcText.top = Items[index].rcImage.bottom + 2
					Items[index].rcText.right = Items[index].rcText.left + Items[index].szText.cx
					Items[index].rcText.bottom = Items[index].rcPaint.bottom - 2
					if Items[index].rcText.right > Items[index].rcImage.right then
						Items[index].rcPaint.right = Items[index].rcText.right + 2
					else
						Items[index].rcPaint.right = Items[index].rcImage.right + 2
					end if
				else
					Items[index].rcImage.left = Items[index].rcPaint.left + 2
					Items[index].rcImage.top = Items[index].rcPaint.top + 2
					Items[index].rcImage.right = Items[index].rcImage.left + #IconSize.cx
					Items[index].rcImage.bottom = Items[index].rcImage.top + #IconSize.cy
					Items[index].rcText.left = Items[index].rcImage.right + 2
					Items[index].rcText.top = Items[index].rcPaint.top + 2
					Items[index].rcText.right = Items[index].rcText.left + Items[index].szText.cx
					Items[index].rcText.bottom = Items[index].rcText.top + Items[index].szText.cy
					Items[index].rcPaint.right = Items[index].rcText.right + 2
				end if
			else
				Items[index].rcText.left = Items[index].rcPaint.left + 2
				Items[index].rcText.top = Items[index].rcPaint.top + 2
				Items[index].rcText.right = Items[index].rcText.left + Items[index].szText.cx
				Items[index].rcText.bottom = Items[index].rcPaint.bottom - 2
				Items[index].rcPaint.right = Items[index].rcText.right + 2
			end if
		elseif Items[index].ImageIndex > 0 then
			Items[index].rcImage.left = Items[index].rcPaint.left + 2
			if #TextUnderImage and Items[index].Chevron.visible then
				Items[index].rcImage.top = Items[index].rcPaint.top + (Items[index].rcPaint.bottom - Items[index].rcPaint.top - BUTTONCHEVRONSIZE - #IconSize.cy) / 2
			else
				Items[index].rcImage.top = Items[index].rcPaint.top + (Items[index].rcPaint.bottom - Items[index].rcPaint.top - #IconSize.cy) / 2
			end if
			Items[index].rcImage.right = Items[index].rcImage.left + #IconSize.cx
			Items[index].rcImage.bottom = Items[index].rcImage.top + #IconSize.cy
			Items[index].rcPaint.right = Items[index].rcImage.right + 2
		else
			Painter.SetRectEmpty(Items[index].rcImage)
			Painter.SetRectEmpty(Items[index].rcText)
			Items[index].rcPaint.right = Items[index].rcPaint.left + 4
		end if
		if Items[index].Chevron.visible then
			if #TextUnderImage then
				Items[index].Chevron.rcPaint.left = Items[index].rcPaint.left
				Items[index].Chevron.rcPaint.top = Items[index].rcPaint.bottom - BUTTONCHEVRONSIZE
				Items[index].Chevron.rcPaint.right = Items[index].rcPaint.right
				Items[index].Chevron.rcPaint.bottom = Items[index].rcPaint.bottom
				if Items[index].rcText.bottom > Items[index].Chevron.rcPaint.top - 2 then
					Items[index].rcText.bottom = Items[index].Chevron.rcPaint.top - 2
				end if
			else
				Items[index].Chevron.rcPaint.left = Items[index].rcPaint.right
				Items[index].Chevron.rcPaint.top = Items[index].rcPaint.top
				Items[index].Chevron.rcPaint.right = Items[index].Chevron.rcPaint.left + BUTTONCHEVRONSIZE
				Items[index].Chevron.rcPaint.bottom = Items[index].rcPaint.bottom
				Items[index].rcPaint.right = Items[index].Chevron.rcPaint.right
			end if
		end if
	end if
	if Chevron.Visible then
		if Items[index].rcPaint.right > Chevron.rcPaint.left then
			Items[index].Hidden = true
			bSomeHidden = true
			continue
		end if
	end if
	xpos = Items[index].rcPaint.right + #ItemMargin
next

return 0
end event

event onscroll;call super::onscroll;int index

if AncestorReturnValue = 1 then return 1

for index = 1 to UpperBound(Items)
	if Not Items[index].Visible or Items[index].Hidden then continue
	if Items[index].DisplayText and Items[index].szText.cx > 0 then
		Painter.OffsetRect(ref Items[index].rcText,0,scrollSize)
	end if
	if Items[index].ImageIndex > 0 then
		Painter.OffsetRect(ref Items[index].rcImage,0,scrollSize)
	end if
	if Items[index].Chevron.Visible then
		Painter.OffsetRect(ref Items[index].Chevron.rcPaint,0,scrollSize)
	end if
	Painter.OffsetRect(ref Items[index].rcPaint,0,scrollSize)
next

if Chevron.Visible then
	Painter.OffsetRect(ref Chevron.rcPaint,0,scrollSize)
end if
	
return 0
end event

event ontimer;call super::ontimer;int index

if id = TM_FLASH then
	boolean bFlash
	for index = 1 to UpperBound(Items)
		if Items[index].FlashTime = 0 then continue
		if Items[index].FlashTime > 0 then
			Items[index].FlashTime -= #ParentTaskPanelBar.#FlashFadeTime
			if Items[index].FlashTime < 0 then
				Items[index].FlashTime = 0
			end if
		end if
		Items[index].flashing = (Not Items[index].flashing and Items[index].flashTime <> 0)
		_of_FlashDrawItem(index)
		if Items[index].FlashTime <> 0 then
			bFlash = true
		end if
	next
	return bFlash
end if

return true
end event

event oncalclayout;call super::oncalclayout;int index,visibleCount

szLayout.cx = 0
szLayout.cy = 0
Chevron.Visible = false

for index = 1 to UpperBound(Items)
	if Not Items[index].visible then continue
	if Chevron.Visible then
		Items[index].Hidden = true
		continue
	end if
	if Items[index].ItemType = ITT_SEPARATOR then
		szLayout.cx += 1
		continue
	end if
	if Items[index].DisplayText and Items[index].szText.cx > 0 then
		if Items[index].ImageIndex > 0 then
			if #TextUnderImage then
				if Items[index].szText.cx > #IconSize.cx then
					szLayout.cx += 2 + Items[index].szText.cx + 2
				else
					szLayout.cx += 2 + #IconSize.cx + 2
				end if
				if Items[index].Chevron.visible then
					if szLayout.cy < 2 + #IconSize.cy + 2 + Items[index].szText.cy + 2 + BUTTONCHEVRONSIZE then
						szLayout.cy = 2 + #IconSize.cy + 2 + Items[index].szText.cy + 2 + BUTTONCHEVRONSIZE
					end if
				else
					if szLayout.cy < 2 + #IconSize.cy + 2 + Items[index].szText.cy + 2 then
						szLayout.cy = 2 + #IconSize.cy + 2 + Items[index].szText.cy + 2
					end if
				end if
			else
				szLayout.cx += 2 + #IconSize.cx + 2 + Items[index].szText.cx + 2
				if Items[index].Chevron.visible then
					szLayout.cx += BUTTONCHEVRONSIZE
				end if
				if szLayout.cy < 2 + #IconSize.cy + 2 then
					szLayout.cy = 2 + #IconSize.cy + 2
				end if
			end if
		else
			szLayout.cx += 2 + Items[index].szText.cx + 2
			if #TextUnderImage and Items[index].Chevron.visible then
				if szLayout.cy < 2 + Items[index].szText.cy + 2 + BUTTONCHEVRONSIZE then
					szLayout.cy = 2 + Items[index].szText.cy + 2 + BUTTONCHEVRONSIZE
				end if
			else
				if Items[index].Chevron.visible then
					szLayout.cx += BUTTONCHEVRONSIZE
				end if
				if szLayout.cy < 2 + Items[index].szText.cy + 2 then
					szLayout.cy = 2 + Items[index].szText.cy + 2
				end if
			end if
		end if
	elseif Items[index].ImageIndex > 0 then
		szLayout.cx += 2 + #IconSize.cx + 2
		if #TextUnderImage and Items[index].Chevron.visible then
			if szLayout.cy < 2 + #IconSize.cy + 2 + BUTTONCHEVRONSIZE then
				szLayout.cy = 2 + #IconSize.cy + 2 + BUTTONCHEVRONSIZE
			end if
		else
			if Items[index].Chevron.visible then
				szLayout.cx += BUTTONCHEVRONSIZE
			end if
			if szLayout.cy < 2 + #IconSize.cy + 2 then
				szLayout.cy = 2 + #IconSize.cy + 2
			end if
		end if
	else
		szLayout.cx += 4
	end if
	if szLayout.cx > _layoutWidth then
		szLayout.cx = _layoutWidth
		Chevron.Visible = true
		Items[index].Hidden = true
		continue
	end if
	visibleCount += 1
next

if szLayout.cy < 4 then
	szLayout.cy = 4
end if

if visibleCount > 0 and Not Chevron.Visible then
	szLayout.cx += (visibleCount - 1) * #ItemMargin
end if
end event

type timer from n_timer within n_cst_taskpanelbar_toolbar descriptor "pb_nvo" = "true" 
end type

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

event ontimer;call super::ontimer;return Parent.Event OnTimer(id)
end event

type font from n_cst_font within n_cst_taskpanelbar_toolbar descriptor "pb_nvo" = "true" 
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

