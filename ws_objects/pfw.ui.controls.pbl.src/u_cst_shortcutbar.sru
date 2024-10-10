$PBExportHeader$u_cst_shortcutbar.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_shortcutbar from u_cst_canvas
end type
type itemdata from structure within u_cst_shortcutbar
end type
type theme from n_cst_shortcutbar_theme within u_cst_shortcutbar
end type
type timer from n_timer within u_cst_shortcutbar
end type
end forward

type itemdata from structure
	boolean		enabled
	boolean		visible
	boolean		hidden
	boolean		displaytext
	boolean		icontray
	boolean		selected
	boolean		mouseover
	boolean		highlighted
	boolean		multiline
	boolean		flashing
	long		flashtime
	string		text
	string		tiptext
	long		tiptime
	string		title
	string		image
	integer		imageindex
	dragobject		object
	boolean		isole
	boolean		objectowner
	unsignedlong		holdparent
	any		data
	string		tag
	sizef		sztext
	sizef		sztitle
	rectf		rctext
	rectf		rcimage
	rectf		rcpaint
end type

global type u_cst_shortcutbar from u_cst_canvas
integer width = 814
integer height = 1696
boolean #fadeanimation = true
event type long onncpaint ( unsignedlong hdc )
event oncapturechanged ( )
event onncmouseleave ( )
event type long onwindowsizing ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event type long onncmousemove ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onnccalcsize ( unsignedlong lpcrect )
event type long onnclbuttondblclk ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onnclbuttondown ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event type long onnchittest ( real xpos,  real ypos )
event type long onbuttonselectionchanging ( integer oldindex,  integer newindex )
event onbuttonselectionchanged ( integer oldindex,  integer newindex )
event onbuttonmousemove ( integer index,  real xpos,  real ypos )
event onbuttonmouseleave ( integer index )
event onbuttonmouseenter ( integer index,  real xpos,  real ypos )
event onobjectreposition ( integer index,  ref real newx,  ref real newy,  ref real newwidth,  ref real newheight )
event ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type long onpopupmenu ( integer index,  ref real xpos,  ref real ypos,  ref unsignedlong flags )
event type long onncerasebkgnd ( unsignedlong hdc )
theme theme
timer timer
end type
global u_cst_shortcutbar u_cst_shortcutbar

type prototypes

end prototypes

type variables
/*--- Constants ---*/
Public:
//Indexes
Constant Int IDX_CHEVRON	= -1

/*--- Properties ---*/
Public:
Uint		#FlashFadeTime	= 1500		//ms
Boolean	#ToolTip 			= false
Boolean	#DBClkOnSplitBar	= true		//双击SplitBar控制所有按钮状态(Button/Icontray)
Boolean	#DBClkOnButton	= true		//双击按钮控制按钮状态(Button/Icontray)

/*--- Implementation ---*/
Private:
n_imagelist		_ImageList
n_imagelist		_ImageList_Icontray
n_imagelist		_ImageList_TitleBar
n_tooltip 			_ToolTip
ITEMDATA		Items[]
PAINTPANE		Chevron
PAINTPANE		SplitBar
RECTF				rcWnd
RECTF				rcTitleBar
RECTF				rcIcontray

Ulong	 _TTID

Ulong _hCurArrow
Ulong _hCurSizeNS

Int		_mouseOverIndex 	= 0
Int		_selectedIndex		= 0
Int		_firstButton			= 0
Int		_lastButton			= 0
Ulong	_lastPopupTime	= 0

Boolean _MouseLeaveTracked 	= false
Boolean _MouseCaptured 		= false
Boolean _RedrawFlag				= true

//Hit-test code
Constant Uint HTTITLEBAR 	= 100
Constant Uint HTSPLITBAR 	= 101
Constant Uint HTICONTRAY	= 102
Constant Uint HTCHEVRON	= 103
Constant Uint HTITEM			= 104
//Timer ID
Constant Uint TM_FLASH		= 1
//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
//Sizes
Constant Real SPLITBARHEIGHT	= 8 		//px
Constant Real ICONTRAYHEIGHT	= 20 		//px (最小大小)
Constant Real CHEVRONWIDTH 	= 12		//px
end variables

forward prototypes
public function integer of_GetCount ()
private subroutine _of_updateiconpoints ()
public function integer of_getindex (readonly dragobject object)
public function boolean of_IsHidden (readonly integer index)
private function integer _of_calcitemheight (readonly integer index)
public function integer of_addobject (ref dragobject object, readonly string txt, readonly string image)
public function integer of_insertobject (readonly integer index, ref dragobject object, readonly string txt, readonly string image)
public function integer of_addobject (readonly string clsname, readonly string txt, readonly string image)
public function integer of_insertobject (readonly integer index, readonly string clsname, readonly string txt, readonly string image)
public function string of_getimage (readonly integer index)
private subroutine _of_trackncmouseleave (readonly boolean track)
private subroutine _of_showtip (readonly integer index)
public function integer of_getindex (readonly string txt)
public function string of_gettext (readonly integer index)
public function boolean of_isenabled (readonly integer index)
public function boolean of_IsHighLighted (readonly integer index)
public function boolean of_isvisible (readonly integer index)
private subroutine _of_capturemouse (readonly boolean capture)
public function integer of_getselectedindex ()
private subroutine _of_updatebuttonpoints ()
private subroutine _of_updateobjectposition (readonly integer index)
private subroutine _of_updatepoints ()
public function integer of_select (readonly integer index)
private subroutine _of_updatetextsize (readonly integer index)
private subroutine _of_updatetextsize ()
public function boolean of_ismultiline (readonly integer index)
private subroutine _of_drawchevron (readonly boolean fadeanimation)
private subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation)
private subroutine _of_drawsplitbar (readonly boolean fadeanimation)
private subroutine _of_drawtitle (readonly boolean fadeanimation)
private subroutine _of_updatetitletextsize (readonly integer index)
private subroutine _of_updatetitletextsize ()
public function string of_gettiptext (readonly integer index)
private subroutine _of_flashdrawitem (readonly integer index)
public function string of_gettitle (readonly integer index)
public function boolean of_isflashing (readonly integer index)
public function long of_displaytext (readonly integer index, readonly boolean display)
public function long of_displaytextall (readonly boolean display)
public function long of_enable (readonly integer index, readonly boolean benabled)
public function long of_flash (readonly integer index, readonly long flashtime)
public function long of_getobject (readonly integer index, ref dragobject object)
public function long of_hide (readonly integer index)
public function long of_hideall ()
public function long of_highlight (readonly integer index, readonly boolean highlighted)
public function boolean of_isdisplaytext (readonly integer index)
public function long of_removeall ()
public function long of_setimage (readonly integer index, readonly string image)
public function long of_setmultiline (readonly integer index, readonly boolean multiline)
public function long of_settext (readonly integer index, readonly string txt)
public function long of_settiptext (readonly integer index, readonly string tiptext)
public function long of_settitle (readonly integer index, readonly string title)
public function long of_show (readonly integer index)
public function long of_showall ()
public function long of_updatepoints ()
public function long of_visible (readonly integer index, readonly boolean bvisible)
public function long of_redraw (readonly boolean fadeanimation)
public function integer of_getindexbyclassname (readonly string clsname)
public function long of_settiptime (readonly integer index, readonly long tiptime)
public function string of_getclassname (readonly integer index)
public function integer of_getfirstvisible ()
public function integer of_getlastvisible ()
public function integer of_getnextvisible (readonly integer index)
public function integer of_getpreviousvisible (readonly integer index)
private subroutine _of_fillbkgnd (readonly unsignedlong hdc)
private subroutine _of_fillicontray (readonly unsignedlong hdc)
private subroutine _of_filltitlebar (readonly unsignedlong hdc)
private subroutine _of_drawtitle (readonly integer index, unsignedlong hdc)
private subroutine _of_drawsplitbar (readonly unsignedlong hdc)
private subroutine _of_drawchevron (readonly unsignedlong hdc)
private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc)
public function long of_setdata (readonly integer index, readonly any data)
public function any of_getdata (readonly integer index)
public function string of_gettag (readonly integer index)
public function long of_settag (readonly integer index, readonly string stag)
public function integer of_selectnext (readonly integer index)
public function integer of_selectprevious (readonly integer index)
public function long of_remove (readonly integer index)
public function integer setredraw (boolean f)
public function integer of_insertobject (readonly integer index, ref dragobject object, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_insertobject (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addobject (ref dragobject object, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addobject (readonly string clsname, readonly string txt, readonly string image, readonly string tiptext)
public function unsignedlong of_getchevronstate ()
public function unsignedlong of_getitemstate (readonly integer index)
public function unsignedlong of_getsplitbarstate ()
public function integer of_getindexbytag (readonly string stag)
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
private function unsignedlong _of_popupmenu (real xpos, real ypos)
public function integer of_indexfrompoint (readonly real xpos, readonly real ypos)
end prototypes

event type long onncpaint(unsignedlong hdc);int index
RECTF wndRect

if #LockUpdate then return 1

Event OnNcEraseBkgnd(hdc)

wndRect = rcWnd
_of_AdjustRect(ref wndRect,ADJ_BORDER)

Painter.IntersectClipRect(hdc,wndRect)

if Theme.#TitleBar then
	_of_FillTitleBar(hdc)
	if _SelectedIndex > 0 and _selectedIndex <= UpperBound(Items) then
		_of_DrawTitle(_SelectedIndex,hdc)
	end if
	Painter.ExcludeClipRect(hdc,rcTitleBar)
end if

if Theme.#SplitBar then
	_of_DrawSplitBar(hdc)
	Painter.ExcludeClipRect(hdc,SplitBar.rcPaint)
end if

_of_FillIcontray(hdc)

if Chevron.Visible then
	_of_DrawChevron(hdc)
end if

for index = 1 to UpperBound(Items)
	if Not Items[index].Visible or Items[index].Hidden then continue
	_of_DrawItem(index, hdc)
next

Painter.SelectClipRgn(hdc,0)

return 1
end event

event Oncapturechanged();if _MouseCaptured then
	_of_CaptureMouse(false)
	if SplitBar.MouseDown then
		SplitBar.MouseDown = false
		_of_DrawSplitBar(true)
	end if
	if Chevron.MouseDown then
		Chevron.MouseDown = false
		_of_DrawChevron(true)
	end if
	Event OnNcMouseLeave()
end if
end event

event Onncmouseleave();if _mouseOverIndex>0 then
	Items[_mouseOverIndex].mouseover=false
	_of_DrawItem(_mouseOverIndex,true)
	Event OnButtonMouseLeave(_mouseOverIndex)
	_mouseOverIndex = 0
end if

if SplitBar.MouseOver then
	SplitBar.MouseOver = false
	_of_DrawSplitBar(true)
end if
		
if Chevron.MouseOver then
	Chevron.MouseOver = false
	_of_DrawChevron(true)
	Event OnButtonMouseLeave(IDX_CHEVRON)
end if

_of_ShowTip(0)

_of_TrackNcMouseLeave(false)

end event

event type long onwindowsizing(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);rcWnd.right = newWidth
rcWnd.bottom = newHeight

if widthChanged then
	_of_UpdateTextSize()
	_of_UpdateTitleTextSize()
end if

_of_UpdatePoints()

return 0
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);//SplitBar dragging
real splitLinePoint
RECTF wndRect
POINTF pt

if Not _MouseCaptured then return 0

Painter.GetWindowRect(#Handle,ref wndRect)
Painter.GetCursorPos(ref pt)
pt.x -= wndRect.left
pt.y -= wndRect.top

splitLinePoint = SplitBar.rcPaint.top + (SplitBar.rcPaint.bottom - SplitBar.rcPaint.top) / 2
if pt.y > splitLinePoint then
	if _lastButton > 0 then
		if  (pt.y - splitLinePoint) >= _of_CalcItemHeight(_lastButton) then
			of_Hide(_lastButton)
		end if
	end if
elseif pt.y < splitLinePoint then
	if _lastButton + 1 <= UpperBound(Items) then
		if  (splitLinePoint - pt.y) >= _of_CalcItemHeight(_lastButton + 1) then
			of_Show(_lastButton + 1)
		end if
	end if
end if
if Painter.PtInRect(SplitBar.rcPaint,pt.x,pt.y) then
	if Not SplitBar.MouseOver then
		SplitBar.MouseOver = true
		_of_DrawSplitBar(true)
	end if
else
	if SplitBar.MouseOver then
		SplitBar.MouseOver = false
		_of_DrawSplitBar(true)
	end if
end if
return 1
end event

event type long onncmousemove(unsignedlong hittestcode, real xpos, real ypos);int index

if Not _MouseLeaveTracked then
	_of_TrackNcMouseLeave(true)
end if

if hitTestCode > HTITEM then
	index = hitTestCode - HTITEM
end if

if _mouseOverIndex <> index then
	if _mouseOverIndex>0 then
		Items[_mouseOverIndex].mouseover=false
		_of_DrawItem(_mouseOverIndex,true)
		_of_ShowTip(0)
		Event OnButtonMouseLeave(_mouseOverIndex)
	end if

	_mouseOverIndex = index
	
	if index > 0 then
		Items[index].mouseover=true
		_of_DrawItem(index,true)
		_of_ShowTip(_mouseOverIndex)
		Event OnButtonMouseEnter(index,xpos,ypos)
	end if
	
elseif _mouseOverIndex>0 then
	Event OnButtonMouseMove(_mouseOverIndex,xpos,ypos)
end if

if hitTestCode = HTSPLITBAR then
	Win32.SetCursor(_hCurSizeNS)
	if Not SplitBar.MouseOver then
		SplitBar.MouseOver = true
		_of_DrawSplitBar(true)
		_of_ShowTip(0)
	end if
else
	Win32.SetCursor(_hCurArrow)
	if SplitBar.MouseOver then
		SplitBar.MouseOver = false
		_of_DrawSplitBar(true)
	end if
end if

if hitTestCode = HTCHEVRON then
	if Not Chevron.MouseOVer then
		Chevron.MouseOver = true
		_of_DrawChevron(true)
		_of_ShowTip(0)
		Event OnButtonMouseEnter(IDX_CHEVRON,xpos,ypos)
	else
		Event OnButtonMouseMove(IDX_CHEVRON,xpos,ypos)
	end if
else
	if Chevron.MouseOVer then
		Chevron.MouseOver = false
		_of_DrawChevron(true)
		Event OnButtonMouseLeave(IDX_CHEVRON)
	end if
end if
	
return 1
end event

event type long onnccalcsize(unsignedlong lpcrect);real fBorderSize
RECTF cRect

Painter.CopyRect(ref cRect,lpcRect)

if theme.#BorderStyle = Enums.BS_SOLID then
	fBorderSize = P2DX(1)
	cRect.left += fBorderSize
	if Not Theme.#TitleBar then
		cRect.top += fBorderSize
	end if
	cRect.right -= fBorderSize
elseif theme.#BorderStyle = Enums.BS_RAISED then
	fBorderSize = P2DX(1)
	cRect.right -= fBorderSize * 2
	cRect.bottom -= fBorderSize
end if

if Theme.#TitleBar then
	cRect.top += (rcTitleBar.bottom - rcTitleBar.top)
end if

if theme.#SplitBar then
	cRect.bottom -= (rcIcontray.bottom - SplitBar.rcPaint.top)
else
	if _firstButton > 0 then
		cRect.bottom -= (rcIcontray.bottom - Items[_firstButton].rcPaint.top)
	else
		cRect.bottom -= (rcIcontray.bottom - rcIcontray.top)
	end if
end if

if cRect.bottom - cRect.top < 0 then
	cRect.bottom = cRect.top
end if

Painter.CopyRect(lpcRect,ref cRect)

return 0
end event

event type long onnclbuttondblclk(unsignedlong hittestcode, real xpos, real ypos);if hitTestCode = HTSPLITBAR and #DBClkOnSplitBar then
	if _firstButton > 0 then
		of_HideAll()
	else
		of_ShowAll()
	end if
	return 0
end if

int index
if hitTestCode >= HTITEM and #DBClkOnButton then
	index = hitTestCode - HTITEM
	if index > 0 then
		Items[index].MouseOver = false
		_mouseOverIndex = 0
		if Items[index].Icontray then
			of_Show(index)
		else
			of_Hide(index)
		end if
	end if
end if

return 0
end event

event type long onnclbuttondown(unsignedlong hittestcode, real xpos, real ypos);if Not _MouseLeaveTracked  then
	Event	OnNcMouseMove(hittestcode,xpos,ypos)
end if

if _mouseOverIndex > 0 then
	_of_ShowTip(0)
	of_Select(_mouseOverIndex)
elseif hitTestCode = HTSPLITBAR then
	SplitBar.MouseDown = true
	_of_DrawSplitBar(false)
	_of_CaptureMouse(true)
	Win32.SetCursor(_hCurSizeNS)
elseif hitTestCode = HTCHEVRON then
	ulong pmCode
	
	if Cpu() - _lastPopupTime < 100 then
		return 0
	end if
	
	Chevron.MouseDown = true
	_of_DrawChevron(false)
	pmCode = _of_PopupMenu(xpos,ypos)
	Chevron.MouseDown = false
	_of_DrawChevron(true)

	if pmCode > 0 and  pmCode <=UpperBound(Items) then
		of_Select(pmCode)
	end if
end if

return 0
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if Not _MouseCaptured then return 0

Win32.SetCursor(_hCurArrow)

_of_CaptureMouse(false)
_of_TrackNcMouseLeave(true)

if SplitBar.MouseDown then
	SplitBar.MouseDown = false
	_of_DrawSplitBar(true)
end if

return 0
end event

event type long onnchittest(real xpos, real ypos);int index

if theme.#TitleBar then
	if Painter.PtInRect(rcTitleBar,xpos,ypos) then
		return HTTITLEBAR
	end if
end if

if theme.#SplitBar then
	if Painter.PtInRect(SplitBar.rcPaint,xpos,ypos) then
		return HTSPLITBAR
	end if
end if

index = of_IndexFromPoint(xpos,ypos)

choose case index
	case IDX_CHEVRON
		return HTCHEVRON
	case else
		if index > 0 then
			return HTITEM + index
		end if
end choose

if Painter.PtInRect(rcIcontray,xpos,ypos) then
	return HTICONTRAY
end if

long nvl
SetNull(nvl)
return nvl
end event

event type long onncerasebkgnd(unsignedlong hdc);if #LockUpdate then return 1

_of_FillBkgnd(hdc)

return 1
end event

public function integer of_GetCount ();return UpperBound(Items)
end function

private subroutine _of_updateiconpoints ();int index
int lastVisible
real itemSize
real li_x
boolean someHidden
RECTF icontrayRect

icontrayRect = rcIcontray
icontrayRect.left += theme.#IcontrayBorderMargin.left
icontrayRect.top += theme.#IcontrayBorderMargin.top
icontrayRect.right -= theme.#IcontrayBorderMargin.right
icontrayRect.bottom -= theme.#IcontrayBorderMargin.bottom

itemSize = icontrayRect.bottom - icontrayRect.top

if theme.#IcontrayIconRTL then
	li_x = icontrayRect.right
else
	li_x = icontrayRect.left
end if

for index = 1 to UpperBound(Items)
	if Not Items[index].visible then continue
	if Not Items[index].icontray then continue
	if someHidden then
		Items[index].hidden = true
		continue
	end if
	
	Painter.SetRectEmpty(Items[index].rcText)
	
	if theme.#IcontrayIconRTL then
		//Set rcImage
		Items[index].rcImage.left		= li_x - 2 - theme.#IcontrayIconSize.cx
		Items[index].rcImage.right		= Items[index].rcImage.left + theme.#IcontrayIconSize.cx
		Items[index].rcImage.top		= icontrayRect.top + (itemSize - theme.#IcontrayIconSize.cy)/2	//取中间
		Items[index].rcImage.bottom	= Items[index].rcImage.top + theme.#IcontrayIconSize.cy
		//Set rcPaint
		Items[index].rcPaint.left 		= Items[index].rcImage.left - 2
		Items[index].rcPaint.right	= Items[index].rcImage.right + 2
		Items[index].rcPaint.top		= Items[index].rcImage.top - 2
		Items[index].rcPaint.bottom	= Items[index].rcImage.bottom + 2
		
		if Items[index].rcPaint.left < icontrayRect.left then
			Items[index].hidden = true
			someHidden = true
		else
			Items[index].hidden = false
			lastVisible = index
		end if
		
		li_x = Items[index].rcPaint.left - theme.#IcontrayItemMargin
	else
		//Set rcImage
		Items[index].rcImage.left		= li_x + 2
		Items[index].rcImage.right		= Items[index].rcImage.left + theme.#IcontrayIconSize.cx
		Items[index].rcImage.top		= icontrayRect.top + (itemSize - theme.#IcontrayIconSize.cy)/2	//取中间
		Items[index].rcImage.bottom	= Items[index].rcImage.top + theme.#IcontrayIconSize.cy
		//Set rcPaint
		Items[index].rcPaint.left 		= Items[index].rcImage.left - 2
		Items[index].rcPaint.right	= Items[index].rcImage.right + 2
		Items[index].rcPaint.top		= Items[index].rcImage.top - 2
		Items[index].rcPaint.bottom	= Items[index].rcImage.bottom + 2
		
		if Items[index].rcPaint.right > icontrayRect.right then
			Items[index].hidden = true
			someHidden = true
		else
			Items[index].hidden = false
			lastVisible = index
		end if
		
		li_x = Items[index].rcPaint.right + theme.#IcontrayItemMargin
	end if
next

Chevron.visible = someHidden

if Chevron.visible and lastVisible > 0 then
	if theme.#IcontrayIconRTL then
		 if Items[lastVisible].rcPaint.left < rcIcontray.left + CHEVRONWIDTH then
			Items[lastVisible].hidden = true
		end if
	else
		 if Items[lastVisible].rcPaint.right > rcIcontray.right - CHEVRONWIDTH then
			Items[lastVisible].hidden = true
		end if
	end if
end if
end subroutine

public function integer of_getindex (readonly dragobject object);int index

for index = 1 to UpperBound(Items)
	if Items[index].object = object then return index
next

return 0
end function

public function boolean of_IsHidden (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].icontray
end function

private function integer _of_calcitemheight (readonly integer index);//用于SplitBar拖拽
if index < 1 or index > UpperBound(Items) then return 0

if Items[index].Icontray then	//如果Item为Icontray则计算其所需要的高度
	real itemHeight
	
	itemHeight = 2
	if Items[index].DisplayText and Items[index].szText.cx > 0 then
		if theme.#IconPosition = Enums.TOP or theme.#IconPosition = Enums.BOTTOM then
			itemHeight += Items[index].szText.cy + theme.#IconSize.cy + 2
		else
			if Items[index].szText.cy > theme.#IconSize.cy then
				itemHeight += Items[index].szText.cy
			else
				itemHeight += theme.#IconSize.cy
			end if
		end if
	else
		itemHeight += theme.#IconSize.cy
	end if
	itemHeight += 2
	
	if theme.#FixedSize then
		if itemHeight< theme.#ItemMinSize then
			itemHeight = theme.#ItemMinSize
		end if
	end if
	return itemHeight
else
	return Items[index].rcPaint.bottom - Items[index].rcPaint.top
end if
end function

public function integer of_addobject (ref dragobject object, readonly string txt, readonly string image);return of_Addobject(ref object,txt,image,"")
end function

public function integer of_insertobject (readonly integer index, ref dragobject object, readonly string txt, readonly string image);return of_InsertObject(index,ref object,txt,image,"")
end function

public function integer of_addobject (readonly string clsname, readonly string txt, readonly string image);return of_Addobject(clsName,txt,image,"")
end function

public function integer of_insertobject (readonly integer index, readonly string clsname, readonly string txt, readonly string image);return of_InsertObject(index,clsName,txt,image,"")
end function

public function string of_getimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].image
end function

private subroutine _of_trackncmouseleave (readonly boolean track);TRACKMOUSEEVENT tme

if _MouseLeaveTracked=track then return

_MouseLeaveTracked=track

tme.cbsize = 16
tme.dwflags = Win32.TME_LEAVE + Win32.TME_NONCLIENT
tme.hwndtrack = #Handle
tme.dwhovertime = 0

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(tme)
end subroutine

private subroutine _of_showtip (readonly integer index);RECTF wndRect
RECTF scRect
SIZEF toolSize

if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return

if #ToolTip and (index > 0 and index <= UpperBound(Items)) then
	if Items[index].tipText <> "" then
		Painter.GetWindowRect(#Handle,ref wndRect)
		Painter.GetScreenRect(ref scRect)
		_ToolTip.TrackActivate(#Handle,_TTID,false)
		_ToolTip.UpdateTipText(#Handle,_TTID,Items[index].tipText)
		_ToolTip.GetBubbleSize(#Handle,_TTID,ref toolSize.cx,ref toolSize.cy)
		if wndRect.left + Items[index].rcPaint.Right + toolSize.cx  > scRect.right then
			_ToolTip.TrackPosition( 0,wndRect.left + Items[index].rcPaint.left -  toolSize.cx,wndRect.top + Items[index].rcPaint.Top + (Items[index].rcPaint.Bottom - Items[index].rcPaint.Top - toolSize.cy) / 2)
		else
			_ToolTip.TrackPosition( 0,wndRect.left + Items[index].rcPaint.Right ,wndRect.top + Items[index].rcPaint.Top + (Items[index].rcPaint.Bottom - Items[index].rcPaint.Top - toolSize.cy) / 2)
		end if
		if Items[index].TipTime > 0 then
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,Items[index].TipTime)
		else
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,-1)
		end if
		_ToolTip.TrackActivate(#Handle,_TTID,true)
	else
		_ToolTip.TrackActivate(#Handle,_TTID,false)	
	end if
else
	_ToolTip.TrackActivate(#Handle,_TTID,false)
end if
end subroutine

public function integer of_getindex (readonly string txt);int index

for index = 1 to UpperBound(Items)
	if Upper(Items[index].Text) = Upper(txt) then return index
next

return 0
end function

public function string of_gettext (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].text
end function

public function boolean of_isenabled (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].enabled
end function

public function boolean of_IsHighLighted (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].HighLighted
end function

public function boolean of_isvisible (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].visible
end function

private subroutine _of_capturemouse (readonly boolean capture);if _MouseCaptured = capture then return

_MouseCaptured = capture

if capture then
	Win32.SetCapture(#Handle)
else
	Win32.ReleaseCapture()
end if
end subroutine

public function integer of_getselectedindex ();return _selectedIndex
end function

private subroutine _of_updatebuttonpoints ();int index
real ll_y
real maxSize
real offsetSize
real fBorderSize
RECTF adjustedRect

adjustedRect = rcWnd

_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

fBorderSize = P2DY(1)
ll_y  = rcIcontray.top + fBorderSize

_firstButton = 0
_lastButton = 0

for index = UpperBound(Items) to 1 step -1
	if Not Items[index].visible then continue
	if Items[index].icontray then continue
	if _lastButton = 0 then
		_lastButton = index
	end if
	_firstButton = index
	
	Items[index].hidden = false
	
	if Items[index].DisplayText and Items[index].szText.cx > 0 then
		choose case theme.#IconPosition
			case Enums.LEFT
				if Items[index].szText.cy > theme.#IconSize.cy then
					maxSize = Items[index].szText.cy
				else
					maxSize = theme.#IconSize.cy
				end if
				//Set rcImage
				Items[index].rcImage.left		= adjustedRect.left 
				Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
				Items[index].rcImage.top		= ll_y - 2  - theme.#IconSize.cy - (maxSize - theme.#IconSize.cy) / 2
				Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
				//Set rcText
				Items[index].rcText.left 			= Items[index].rcImage.right + 2
				Items[index].rcText.right 		= adjustedRect.right
				Items[index].rcText.top			= ll_y - 2 - Items[index].szText.cy - (maxSize - Items[index].szText.cy) / 2
				Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
			case Enums.TOP
				//Set rcImage
				Items[index].rcImage.left		= adjustedRect.left  + (adjustedRect.right  - adjustedRect.left - theme.#IconSize.cx)/2
				Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
				Items[index].rcImage.top		= ll_y - 2 - Items[index].szText.cy - 2 - theme.#IconSize.cy
				Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
				//Set rcText
				Items[index].rcText.left 			= adjustedRect.left
				Items[index].rcText.right 		= adjustedRect.right
				Items[index].rcText.top			= Items[index].rcImage.bottom + 2
				Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
			case Enums.RIGHT
				if Items[index].szText.cy > theme.#IconSize.cy then
					maxSize = Items[index].szText.cy
				else
					maxSize = theme.#IconSize.cy
				end if
				//Set rcImage
				Items[index].rcImage.left		= adjustedRect.right - theme.#IconSize.cx
				Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
				Items[index].rcImage.top		= ll_y - 2  - theme.#IconSize.cy - (maxSize - theme.#IconSize.cy) / 2
				Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
				//Set rcText
				Items[index].rcText.left 			= adjustedRect.left
				Items[index].rcText.right 		= Items[index].rcImage.left - 2
				Items[index].rcText.top			= ll_y - 2 - Items[index].szText.cy - (maxSize - Items[index].szText.cy) / 2
				Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
			case Enums.BOTTOM
				//Set rcImage
				Items[index].rcImage.left		= adjustedRect.left  + (adjustedRect.right  - adjustedRect.left - theme.#IconSize.cx)/2
				Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
				Items[index].rcImage.top		= ll_y - 2 - theme.#IconSize.cy
				Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
				//Set rcText
				Items[index].rcText.left 			= adjustedRect.left
				Items[index].rcText.right 		= adjustedRect.right
				Items[index].rcText.top			= Items[index].rcImage.top - 2 - Items[index].szText.cy
				Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
		end choose
	else
		Painter.SetRectEmpty(Items[index].rcText)
		//Set rcImage
		Items[index].rcImage.left		= adjustedRect.left  + (adjustedRect.right  - adjustedRect.left - theme.#IconSize.cx)/2
		Items[index].rcImage.right		= Items[index].rcImage.left + theme.#IconSize.cx
		Items[index].rcImage.top		= ll_y - 2 - theme.#IconSize.cy
		Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
	end if
	
	//Set rcPaint
	Items[index].rcPaint.left		= rcWnd.left
	Items[index].rcPaint.right	= rcWnd.right
	if Not Painter.IsRectEmpty(Items[index].rcText) and Items[index].rcText.top < Items[index].rcImage.top then
		Items[index].rcPaint.top	= Items[index].rcText.top - 2
	else
		Items[index].rcPaint.top	= Items[index].rcImage.top - 2
	end if
	Items[index].rcPaint.bottom	= ll_y
	
	if theme.#BorderStyle = Enums.BS_RAISED then
		Items[index].rcPaint.right -= fBorderSize
	end if
	
	if theme.#FixedSize then
		if Items[index].rcPaint.bottom - Items[index].rcPaint.top < theme.#ItemMinSize then
			offsetSize = theme.#ItemMinSize - (Items[index].rcPaint.bottom - Items[index].rcPaint.top)
			if Not Painter.IsRectEmpty(Items[index].rcImage) then
				Painter.OffsetRect(Items[index].rcImage,0,-(offsetSize / 2) )
			end if
			if Not Painter.IsRectEmpty(Items[index].rcText) then
				Painter.OffsetRect(Items[index].rcText,0,-(offsetSize / 2) )
			end if
			Items[index].rcPaint.top -= offsetSize
		end if
	end if
	
	ll_y = Items[index].rcPaint.top + fBorderSize
next
end subroutine

private subroutine _of_updateobjectposition (readonly integer index);real newX,newY
real objectWidth,objectHeight
RECTF wndRect

if index < 1 or index > UpperBound(Items) then return
if Not IsValidObject(Items[index].object) then return

wndRect = rcWnd
_of_AdjustRect(ref wndRect,ADJ_BORDER)

objectWidth = wndRect.right - wndRect.left
if theme.#SplitBar then
	if Theme.#TitleBar then
		objectHeight = P2DY(D2PY(SplitBar.rcPaint.top) - D2PY(rcTitleBar.bottom))
	else
		objectHeight = P2DY(D2PY(SplitBar.rcPaint.top) - D2PY(wndRect.top))
	end if
else
	if _firstButton > 0 then
		if Theme.#TitleBar then
			objectHeight = P2DY(D2PY(Items[_firstButton].rcPaint.top) - D2PY(rcTitleBar.bottom))
		else
			objectHeight = P2DY(D2PY(Items[_firstButton].rcPaint.top) - D2PY(wndRect.top))
		end if
	else
		if Theme.#TitleBar then
			objectHeight = P2DY(D2PY(rcIcontray.top) - D2PY(rcTitleBar.bottom))
		else
			objectHeight = P2DY(D2PY(rcIcontray.top) - D2PY(wndRect.top))
		end if
	end if
end if

Event OnobjectReposition(index,ref newX,ref newY,ref objectWidth,ref objectHeight)
if Items[index].IsOLE then
	Items[index].Object.Move(D2UX(newX),D2UY(newY))
	Items[index].Object.Resize(D2UX(objectWidth),D2UY(objectHeight))
else
	Win32.SetWindowPos(Handle(Items[index].object),D2PX(newX),D2PY(newY),D2PX(objectWidth),D2PY(objectHeight))
end if
end subroutine

private subroutine _of_updatepoints ();real fBorderSize

if #LockUpdate then return

fBorderSize = P2DX(1)

//Set icontray
rcIcontray = rcWnd
if theme.#BorderStyle = Enums.BS_RAISED then
	rcIcontray.right -= fBorderSize
	rcIcontray.bottom -= fBorderSize
end if
if theme.#IcontrayBorderMargin.top + theme.#IcontrayIconSize.cy + 4 + theme.#IcontrayBorderMargin.bottom > ICONTRAYHEIGHT then
	rcIcontray.top = rcIcontray.bottom - (theme.#IcontrayBorderMargin.top + theme.#IcontrayIconSize.cy + 4 + theme.#IcontrayBorderMargin.bottom)
else
	rcIcontray.top = rcIcontray.bottom - ICONTRAYHEIGHT
end if

//Set chevron
Chevron.rcPaint = rcIcontray
if theme.#IcontrayIconRTL then
	Chevron.rcPaint.right = CHEVRONWIDTH
else
	Chevron.rcPaint.left = rcIcontray.right - CHEVRONWIDTH
end if

_of_UpdateButtonPoints()
_of_UpdateIconPoints()

//Set splitbar
if theme.#SplitBar then
	SplitBar.rcPaint = rcWnd
	if _firstButton > 0 then
		SplitBar.rcPaint.top = Items[_firstButton].rcPaint.top - SPLITBARHEIGHT
		SplitBar.rcPaint.bottom = SplitBar.rcPaint.top + SPLITBARHEIGHT + fBorderSize
	else
		SplitBar.rcPaint.top = rcIcontray.top - SPLITBARHEIGHT
		SplitBar.rcPaint.bottom = SplitBar.rcPaint.top + SPLITBARHEIGHT + fBorderSize
	end if
	if theme.#BorderStyle = Enums.BS_RAISED then
		SplitBar.rcPaint.right -= fBorderSize
	end if
end if

//Set titlebar
if Theme.#TitleBar then
	rcTitleBar = rcWnd
	if theme.#TitleBarHeight > 0 then
		rcTitleBar.bottom = theme.#TitleBarHeight
	else
		if _selectedIndex > 0 then
			if theme.#TitleBarIconSize.cy + 4 > rcTitleBar.bottom then
				rcTitleBar.bottom = (theme.#TitleBarIconSize.cy + 4)
			end if
			if Items[_selectedIndex].szTitle.cy + 4 > rcTitleBar.bottom then
				rcTitleBar.bottom = (Items[_selectedIndex].szTitle.cy + 4)
			end if
		end if
	end if
	if theme.#BorderStyle = Enums.BS_RAISED then
		rcTitleBar.right -= fBorderSize
	end if
end if

_of_UpdateobjectPosition(_SelectedIndex)
end subroutine

public function integer of_select (readonly integer index);int oldSelectedIndex

if index = _selectedIndex then return _selectedIndex
if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not Items[index].Visible or Not Items[index].Enabled then return RetCode.FAILED

oldSelectedIndex = _selectedIndex

if IsPrevented(Event OnButtonSelectionChanging(oldSelectedIndex,index)) then return RetCode.FAILED

_selectedIndex = index

if _RedrawFlag then Super::SetRedraw(false)

if oldSelectedIndex > 0 then
	Items[oldSelectedIndex].selected=false
end if

Items[_selectedIndex].selected = true
Items[_selectedIndex].object.Show()
Items[_selectedIndex].Object.BringToTop = true

if oldSelectedIndex > 0 then
	Items[oldSelectedIndex].object.Hide()
	Items[oldSelectedIndex].Object.Move(-32768,-32768)
end if

UpdateFrame()

if _RedrawFlag then Super::SetRedraw(true)

Event OnButtonSelectionChanged(oldSelectedIndex,_selectedIndex)

return _selectedIndex
end function

private subroutine _of_updatetextsize (readonly integer index);ulong dtparam
n_cst_font ln_calcFont
RECTF calcRect
RECTF wndRect

if index < 1 or index > UpperBound(Items) then return
if Len(Items[index].text) = 0 then
	Items[index].szText.cx = 0
	Items[index].szText.cy = 0
	return
end if

wndRect = rcWnd
_of_AdjustRect(ref wndRect,ADJ_BORDER + ADJ_BORDERMARGIN)

calcRect.right = wndRect.right - wndRect.left

if theme.#IconPosition = Enums.LEFT or theme.#IconPosition = Enums.RIGHT then
	calcRect.right -= theme.#IconSize.cx + 2
end if

dtparam = Painter.DT_EXPANDTABS
if Items[index].MultiLine then
	dtparam += Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
else
	dtparam += Painter.DT_SINGLELINE
end if

if theme.SelectedFont.#WordSize.cx >= theme.Font.#WordSize.cx then
	ln_calcFont = theme.SelectedFont
else
	ln_calcFont = theme.Font
end if

Painter.of_CalcTextSize(ln_calcFont,Items[index].text,dtparam,ref calcRect)

Items[index].szText.cx = calcRect.right
Items[index].szText.cy = calcRect.bottom

if Items[index].szText.cx < 0 then Items[index].szText.cx = 0
if  Items[index].szText.cy < 0 then Items[index].szText.cy = 0
end subroutine

private subroutine _of_updatetextsize ();int index

for index = 1 to UpperBound(Items)
	_of_UpdateTextSize(index)
next
end subroutine

public function boolean of_ismultiline (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].MultiLine
end function

private subroutine _of_drawchevron (readonly boolean fadeanimation);ulong safeDC
RECTF wndRect

if #LockUpdate then return
if Not Visible then return
if Not Chevron.Visible then return

safeDC=GetSafeNcDC()

wndRect = rcWnd
_of_AdjustRect(ref wndRect,ADJ_BORDER)

Painter.IntersectClipRect(safeDC,wndRect)
Painter.IntersectClipRect(safeDC,Chevron.rcPaint)

if Theme.#TitleBar then
	Painter.ExcludeClipRect(safeDC,rcTitleBar)
end if

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnNcEraseBkgnd(safeDC)

_of_FillIcontray(safedc)
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

private subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation);ulong safeDC
RECTF wndRect

if #LockUpdate then return
if Not Visible then return
if index < 1 or index > UpperBound(Items) then return
if Not Items[index].visible then return
if Items[index].hidden then return

safeDC=GetSafeNcDC()

wndRect = rcWnd
_of_AdjustRect(ref wndRect,ADJ_BORDER)

Painter.IntersectClipRect(safeDC,wndRect)
Painter.IntersectClipRect(safeDC,Items[index].rcPaint)
if Theme.#TitleBar then
	Painter.ExcludeClipRect(safeDC,rcTitleBar)
end if
if Theme.#SplitBar then
	Painter.ExcludeClipRect(safeDC,SplitBar.rcPaint)
end if

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnNcEraseBkgnd(safeDC)

if Items[index].Icontray then
	_of_FillIcontray(safeDC)
end if

_of_DrawItem(index,safeDC)

Painter.SelectClipRgn(safeDC,0)

ulong hUpdateRgn

hUpdateRgn = Painter.CreateRectRgn(Items[index].rcPaint)

if FadeAnimation then
	ReleaseDC(safeDC,hUpdateRgn,#FadeTime)
else
	ReleaseDC(safeDC,hUpdateRgn)
end if

Painter.DeleteRgn(hUpdateRgn)


end subroutine

private subroutine _of_drawsplitbar (readonly boolean fadeanimation);ulong safeDC
RECTF wndRect

if #LockUpdate then return
if Not Visible then return
if Not theme.#SplitBar then return
	
safeDC=GetSafeNcDC()

wndRect = rcWnd
_of_AdjustRect(ref wndRect,ADJ_BORDER)

Painter.IntersectClipRect(safeDC,wndRect)
Painter.IntersectClipRect(safeDC,SplitBar.rcPaint)

if Theme.#TitleBar then
	Painter.ExcludeClipRect(safeDC,rcTitleBar)
end if

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnNcEraseBkgnd(safeDC)

_of_DrawSplitBar(safeDC)

Painter.SelectClipRgn(safeDC,0)

ulong hUpdateRgn

hUpdateRgn = Painter.CreateRectRgn(SplitBar.rcPaint)

if FadeAnimation then
	ReleaseDC(safeDC,hUpdateRgn,#FadeTime)
else
	ReleaseDC(safeDC,hUpdateRgn)
end if

Painter.DeleteRgn(hUpdateRgn)
end subroutine

private subroutine _of_drawtitle (readonly boolean fadeanimation);ulong safeDC
RECTF wndRect

if #LockUpdate then return
if Not Visible then return
if Not Theme.#TitleBar then return

safeDC=GetSafeNcDC()

wndRect = rcWnd
_of_AdjustRect(ref wndRect,ADJ_BORDER)

Painter.IntersectClipRect(safeDC,wndRect)
Painter.IntersectClipRect(safeDC,rcTitleBar)

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnNcEraseBkgnd(safeDC)

_of_FillTitleBar(safeDC)

if _SelectedIndex > 0 and _selectedIndex <= UpperBound(Items) then
	_of_DrawTitle(_SelectedIndex,safeDC)
end if

Painter.SelectClipRgn(safeDC,0)

ulong hUpdateRgn

hUpdateRgn = Painter.CreateRectRgn(rcTitleBar)

if FadeAnimation then
	ReleaseDC(safeDC,hUpdateRgn,#FadeTime)
else
	ReleaseDC(safeDC,hUpdateRgn)
end if

Painter.DeleteRgn(hUpdateRgn)
end subroutine

private subroutine _of_updatetitletextsize (readonly integer index);ulong dtparam
RECTF calcRect
RECTF wndRect

if index < 1 or index > UpperBound(Items) then return
if Len(Items[index].Title) = 0 then
	Items[index].szTitle.cx = 0
	Items[index].szTitle.cy = 0
	return
end if

wndRect = rcWnd

_of_AdjustRect(ref wndRect,ADJ_BORDER + ADJ_BORDERMARGIN)

calcRect.right = wndRect.right - wndRect.left - theme.#TitleBarIconSize.cx - 2

dtparam = Painter.DT_EXPANDTABS
dtparam += Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING

Painter.of_CalcTextSize(theme.TitleFont,Items[index].Title,dtparam,ref calcRect)

Items[index].szTitle.cx = calcRect.right
Items[index].szTitle.cy = calcRect.bottom
end subroutine

private subroutine _of_updatetitletextsize ();int index

for index = 1 to UpperBound(Items)
	_of_UpdateTitleTextSize(index)
next
end subroutine

public function string of_gettiptext (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].tiptext
end function

private subroutine _of_flashdrawitem (readonly integer index);Uint nFadeTime

if #LockUpdate then return
if Not Visible then return
if index < 1 or index > UpperBound(Items) then return
if Not Items[index].visible then return
if Items[index].hidden then return
if Not Items[index].Enabled or Items[index].MouseOver or Items[index].Selected then
	return
end if

nFadeTime = #FadeTime
#FadeTime = #FlashFadeTime

_of_DrawItem(index,true)

#FadeTime = nFadeTime
end subroutine

public function string of_gettitle (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].Title
end function

public function boolean of_isflashing (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return (Items[index].FlashTime = -1 or Items[index].FlashTime > 0)
end function

public function long of_displaytext (readonly integer index, readonly boolean display);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].DisplayText = display then return RetCode.OK

Items[index].DisplayText = display

if Items[index].Visible then
	of_UpdatePoints()
end if

return RetCode.OK
end function

public function long of_displaytextall (readonly boolean display);int index

for index = 1 to UpperBound(Items)
	Items[index].DisplayText = display
next

of_UpdatePoints()

return RetCode.OK
end function

public function long of_enable (readonly integer index, readonly boolean benabled);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].Enabled = bEnabled then return RetCode.OK

Items[index].Enabled = bEnabled
_of_DrawItem(index,true)

return RetCode.OK
end function

public function long of_flash (readonly integer index, readonly long flashtime);//flashtime:sec
//-1:always
//0:stop
if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
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
	Timer.Start(TM_FLASH,#FlashFadeTime)
else
	Items[index].flashing = false
	_of_DrawItem(index,true)
end if

return RetCode.OK
end function

public function long of_getobject (readonly integer index, ref dragobject object);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

try
	object = Items[index].object
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(object),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function long of_hide (readonly integer index);int li_index

if index<1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].icontray then return RetCode.OK

for li_index = index to UpperBound(Items)
	Items[li_index].icontray = true
next

if Items[index].Visible then
	of_UpdatePoints()
end if

return RetCode.OK
end function

public function long of_hideall ();int index

for index = 1 to UpperBound(Items)
	Items[index].icontray = true
next

of_UpdatePoints()

return RetCode.OK
end function

public function long of_highlight (readonly integer index, readonly boolean highlighted);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].HighLighted = highlighted then return RetCode.OK

Items[index].HighLighted = highlighted
_of_DrawItem(index,true)

return RetCode.OK
end function

public function boolean of_isdisplaytext (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].DisplayText
end function

public function long of_removeall ();int index
boolean bLockUpdate
ITEMDATA emptyItems[]

bLockUpdate = #LockUpdate
#LockUpdate = true
if _RedrawFlag then Super::SetRedraw(false)

for index = 1 to UpperBound(Items)
	if IsValidObject(Items[index].object) then
		Items[index].object.Hide()
		if Items[index].hOldParent > 0 then
			Win32.SetParent(Handle(Items[index].object),Items[index].hOldParent)
		end if
		if Items[index].objectOwner then
			_of_CloseUserObject(Items[index].object)
		end if
	end if
next

Items = emptyItems

_selectedIndex = 0
_mouseOverIndex = 0
_firstButton = 0
_lastButton = 0

#LockUpdate = bLockUpdate
UpdateFrame()
if _RedrawFlag then Super::SetRedraw(true)

_of_ShowTip(0)

return RetCode.OK
end function

public function long of_setimage (readonly integer index, readonly string image);int newImgIndex

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].image = image then return RetCode.OK

newImgIndex = _ImageList.AddImage(theme.of_GetItemIcon(index,image,0))

if newImgindex = 0 then return RetCode.E_INVALID_IMAGE

Items[index].image = image
Items[index].imageIndex = newImgIndex

_ImageList_TitleBar.AddImage(theme.of_GetItemIcon(index,image,0))
_ImageList_Icontray.AddImage(theme.of_GetItemIcon(index,image,0))

if Items[index].Visible then
	_of_DrawItem(index,false)
	
	if index = _selectedIndex and theme.#TitleBar then
		_of_DrawTitle(false)
	end if
end if

return RetCode.OK
end function

public function long of_setmultiline (readonly integer index, readonly boolean multiline);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].MultiLine = multiline then return RetCode.OK

Items[index].MultiLine = multiline

_of_UpdateTextSize(index)

if Items[index].Visible and Items[index].DisplayText then
	of_UpdatePoints()
end if

return RetCode.OK
end function

public function long of_settext (readonly integer index, readonly string txt);SIZEF textOldSize

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].Text = txt then return RetCode.OK

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

public function long of_settiptext (readonly integer index, readonly string tiptext);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].tipText = tipText then return RetCode.OK

Items[index].tipText = tipText

return RetCode.OK
end function

public function long of_settitle (readonly integer index, readonly string title);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].Title = title then return RetCode.OK

Items[index].Title = title

_of_UpdateTitleTextSize(index)

if Items[index].Visible then
	of_UpdatePoints()
end if
	
return RetCode.OK
end function

public function long of_show (readonly integer index);int li_index

if index<1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not Items[index].icontray then return RetCode.OK

for li_index = 1 to index
	Items[li_index].icontray = false
next

if Items[index].Visible then
	of_UpdatePoints()
end if

return RetCode.OK
end function

public function long of_showall ();int index

for index = 1 to UpperBound(Items)
	Items[index].icontray = false
next

of_UpdatePoints()

return RetCode.OK
end function

public function long of_updatepoints ();if #LockUpdate then return RetCode.FAILED

if _RedrawFlag then Super::SetRedraw(false)

UpdateFrame()

if _RedrawFlag then Super::SetRedraw(true)

return RetCode.OK
end function

public function long of_visible (readonly integer index, readonly boolean bvisible);boolean bLockUpdate

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].Visible = bVisible then return RetCode.OK

Items[index].Visible = bVisible

if Not bVisible then
	Items[index].Object.Hide()
	Items[index].Object.Move(-32768,-32768)
end if

bLockUpdate = #LockUpdate
#LockUpdate = true

if index = _SelectedIndex and Not Items[index].Visible then
	if index = of_SelectNext(index) then
		if index = of_SelectPrevious(index) then
			_SelectedIndex = 0
		end if
	end if
end if

if _SelectedIndex = 0 then
	of_Select(index)
end if

#LockUpdate = bLockUpdate
of_UpdatePoints()

return RetCode.OK
end function

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC

if #LockUpdate then return RetCode.FAILED
if Not Visible then return RetCode.OK

safeDC=GetSafeNcDC()

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnNcPaint(safeDC)

if FadeAnimation then
	ReleaseDC(safeDC,0,#FadeTime)
else
	ReleaseDC(safeDC,0)
end if

return RetCode.OK
end function

public function integer of_getindexbyclassname (readonly string clsname);int index

for index = 1 to UpperBound(Items)
	if ClassName(Items[index].Object) = Lower(clsName) then return index
next

return 0
end function

public function long of_settiptime (readonly integer index, readonly long tiptime);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[index].TipTime = tipTime

return RetCode.OK
end function

public function string of_getclassname (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return ClassName(Items[index].Object)
end function

public function integer of_getfirstvisible ();int index

for index = 1 to UpperBound(Items)
	if Items[index].Visible then return index
next

return 0
end function

public function integer of_getlastvisible ();int index

for index = UpperBound(Items) to 1 step -1
	if Items[index].Visible then return index
next

return 0
end function

public function integer of_getnextvisible (readonly integer index);int i

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

for i = index + 1 to UpperBound(Items)
	if Items[i].Visible then return i
next

return 0
end function

public function integer of_getpreviousvisible (readonly integer index);int i

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

for i = index - 1 to 1 step -1
	if Items[i].Visible then return i
next

return 0
end function

private subroutine _of_fillbkgnd (readonly unsignedlong hdc);ulong transparentColor

transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,0)
//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, rcWnd,  transparentColor,false,0) 
end if

Painter.ThemeFill( hdc, rcWnd, theme.of_GetColor(theme.CLR_BKGND,0),theme.#BkgndOrientation,theme.#BkgndStyle,0,false,&
										theme.#BorderStyle,theme.of_GetColor(theme.CLR_BORDER,0),0)
end subroutine

private subroutine _of_fillicontray (readonly unsignedlong hdc);Painter.ThemeFill( hdc, rcIcontray, theme.of_GetColor(theme.CLR_BKGND,0),theme.#BkgndOrientation,theme.#BkgndStyle,0,false,&
										Enums.BS_SOLID,theme.of_GetColor(theme.CLR_BORDER,0),0)
end subroutine

private subroutine _of_filltitlebar (readonly unsignedlong hdc);Painter.ThemeFill( hdc, rcTitleBar, theme.of_GetColor(theme.CLR_TITLEBARBKGND,0),theme.#BkgndOrientation,theme.#BkgndStyle,0,false,&
										Enums.BS_SOLID,theme.of_GetColor(theme.CLR_TITLEBARBORDER,0),0)
end subroutine

private subroutine _of_drawtitle (readonly integer index, unsignedlong hdc);ulong textColor
ulong dtparam
RECTF rcText

textColor = theme.of_GetColor(theme.CLR_TITLE,0)

dtparam = Painter.DT_EXPANDTABS
dtparam += Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
choose case theme.#TitleBarTextAlign
	case Left!
		dtparam += Painter.DT_LEFT
	case Center!
		dtparam += Painter.DT_CENTER
	case Right!
		dtparam += Painter.DT_RIGHT
end choose

if theme.#TitleBarIconAlign = Left! then
	_ImageList_TitleBar.Draw(Items[index].imageindex,hdc,rcTitleBar.left + 4 ,rcTitleBar.top + (rcTitleBar.bottom - rcTitleBar.top - theme.#TitleBarIconSize.cy)/2,&
					false)
	rcText.left = rcTitleBar.left + 4 + theme.#TitleBarIconSize.cx + 4
	rcText.top = rcTitleBar.top + (rcTitleBar.bottom - rcTitleBar.top - Items[index].szTitle.cy) / 2
	rcText.right = rcTitleBar.right - 4
	rcText.bottom = rcTitleBar.bottom
elseif theme.#TitleBarIconAlign = Center! then
	_ImageList_TitleBar.Draw(Items[index].imageindex,hdc,rcTitleBar.left + (rcTitleBar.right - rcTitleBar.left - (theme.#TitleBarIconSize.cx + 4 + Items[index].szTitle.cx)) / 2,rcTitleBar.top + (rcTitleBar.bottom - rcTitleBar.top - theme.#TitleBarIconSize.cy)/2,&
					false)
	rcText.left = rcTitleBar.left + (rcTitleBar.right - rcTitleBar.left - (theme.#TitleBarIconSize.cx + 4 + Items[index].szTitle.cx)) / 2 + theme.#TitleBarIconSize.cx + 4
	rcText.top = rcTitleBar.top + (rcTitleBar.bottom - rcTitleBar.top - Items[index].szTitle.cy) / 2
	rcText.right = rcTitleBar.right - 4
	rcText.bottom = rcTitleBar.bottom
elseif theme.#TitleBarIconAlign = Right! then
	_ImageList_TitleBar.Draw(Items[index].imageindex,hdc,rcTitleBar.right - 4 - theme.#TitleBarIconSize.cx ,rcTitleBar.top + (rcTitleBar.bottom - rcTitleBar.top - theme.#TitleBarIconSize.cy)/2,&
					false)
	rcText.left = rcTitleBar.left + 4
	rcText.top = rcTitleBar.top + (rcTitleBar.bottom - rcTitleBar.top - Items[index].szTitle.cy) / 2
	rcText.right = rcTitleBar.right - theme.#TitleBarIconSize.cx - 4
	rcText.bottom = rcTitleBar.bottom
end if

Painter.of_Drawtext(hdc,theme.TitleFont,Items[index].Title,rcText,textColor,dtparam)
end subroutine

private subroutine _of_drawsplitbar (readonly unsignedlong hdc);ulong borderColor,bkColor,lineColor,lineColorLighten,nState

nState = of_GetSplitBarState()
bkColor = theme.of_GetColor(theme.CLR_SPLITBARBKGND,nState)
borderColor = theme.of_GetColor(theme.CLR_SPLITBARBORDER,nState)

lineColor = theme.of_GetColor(theme.CLR_LINE,nState)
lineColorLighten = ARGBLighten(lineColor,0.9)

Painter.ThemeFill(hdc,SplitBar.rcPaint,bkColor,theme.#BkgndOrientation,theme.#ItemBkgndStyle,nState,false,Enums.BS_SOLID,borderColor,0)

int index
RECTF dotRect

Constant real DOTSIZE 	= 2	//px
Constant real DOTMARGIN	= 3	//px
Constant real DOTCOUNT 	= 6	//px

dotRect.left = SplitBar.rcPaint.left + (SplitBar.rcPaint.right - SplitBar.rcPaint.left - (DOTSIZE * DOTCOUNT + DOTMARGIN *( DOTCOUNT - 1))) / 2
dotRect.top = SplitBar.rcPaint.top + (SplitBar.rcPaint.bottom - SplitBar.rcPaint.top - DOTSIZE) / 2
dotRect.right = dotRect.left + DOTSIZE
dotRect.bottom = dotRect.top + DOTSIZE

for index = 1 to DOTCOUNT
	Painter.OffsetRect(ref dotRect,1,1)
	Painter.of_FillRect(hdc,dotRect,lineColorLighten,false,0)
	Painter.OffsetRect(ref dotRect,-1,-1)
	Painter.of_FillRect(hdc,dotRect,lineColor,false,0)
	Painter.OffsetRect(ref dotRect,DOTSIZE + DOTMARGIN,0)
next
end subroutine

private subroutine _of_drawchevron (readonly unsignedlong hdc);real nX,nY
long nRow
ulong borderColor,arrowColor,bkColor,nState
Constant real ARROWSIZE = 6

if Not Chevron.Visible then return

nState = of_GetChevronState()
borderColor = theme.of_GetColor(theme.CLR_CHEVRONBORDER,nState)

if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
	bkColor	= theme.of_GetColor(theme.CLR_CHEVRONBKGND,nState)
	Painter.ThemeFill(hdc,Chevron.rcPaint,bkColor,theme.#BkgndOrientation,theme.#ItemBkgndStyle,nState,false,Enums.BS_SOLID,borderColor,0)
end if

nX = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE)/2
nY = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - (ARROWSIZE / 2) - ARROWSIZE + 1)/2
	
if Chevron.MouseDown then
	nY += 1
end if

arrowColor = theme.of_GetColor(theme.CLR_ARROW,nState)
if theme.#IcontrayIconRTL then
	nX += ARROWSIZE / 2 - 1
	for nRow = ARROWSIZE - 1 to 1 step -1
		Painter.SetPixel(hdc,nX,nY,arrowColor)
		Painter.SetPixel(hdc,nX + P2DX(1),nY,arrowColor)
		Painter.SetPixel(hdc,nX + P2DX(3),nY,arrowColor)
		Painter.SetPixel(hdc,nX + P2DX(4),nY,arrowColor)
		nY += P2DY(1)
		if nRow <= ARROWSIZE / 2 then
			nX += P2DX(1)
		else
			nX -= P2DX(1)
		end if
	next
else
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
end if

//Draw arrow
POINTF pt1,pt2,pt3

arrowColor = theme.of_GetColor(theme.CLR_ARROW,nState)

pt1.x = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE)/2
pt1.y = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - (ARROWSIZE / 2) - ARROWSIZE + 1)/2 + ARROWSIZE + 1

if Chevron.MouseDown then
	pt1.y += 1
end if

pt2.x = pt1.x + ARROWSIZE
pt2.y = pt1.y
pt3.x = pt1.x + ARROWSIZE / 2
pt3.y = pt1.y + ARROWSIZE / 2

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc);ulong textColor
ulong dtparam

textColor	= theme.of_GetItemColor(index,theme.CLR_TEXT,of_GetItemState(index))

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

if  Items[index].Selected then
	Painter.of_Drawtext(hdc,theme.SelectedFont,Items[index].text,Items[index].rcText,textColor,dtparam)
else
	Painter.of_Drawtext(hdc,theme.Font,Items[index].text,Items[index].rcText,textColor,dtparam)
end if
end subroutine

private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc);ulong nBorderStyle
ulong borderColor,bkColor,nState

if Not Items[index].Visible or Items[index].Hidden then return

nState = of_GetItemState(index)
bkColor	= theme.of_GetItemColor(index,theme.CLR_BKGND,nState)
borderColor	= theme.of_GetItemColor(index,theme.CLR_BORDER,nState)

if Items[index].Icontray then
	nBorderStyle = theme.#ItemBorderStyle
else
	nBorderStyle = Enums.BS_SOLID
end if

if Not Items[index].Icontray or BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED + Enums.STATE_SELECTED) <> 0 then
	if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
		if Items[index].Flashing then
			bkColor = ARGBLighten(bkColor,0.4)
		end if
	end if
	Painter.ThemeFill(hdc,Items[index].rcPaint,bkColor,theme.#BkgndOrientation,theme.#ItemBkgndStyle,nState,false,&
								nBorderStyle,borderColor,theme.#ItemRoundSize)
end if

if Items[index].Icontray then
	_ImageList_Icontray.Draw(Items[index].imageindex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].enabled)
else
	//非Icontray状态使用普通图标
	//感谢Coffee反馈这个BUG
	//2015.04.14
	_ImageList.Draw(Items[index].imageindex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].enabled)
end if

if Not Items[index].Icontray and Items[index].DisplayText and Items[index].szText.cx>0 then
	_of_DrawItemText(index,hdc)
end if
end subroutine

public function long of_setdata (readonly integer index, readonly any data);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[index].Data = data

return RetCode.OK
end function

public function any of_getdata (readonly integer index);Any data

if index < 1 or index > UpperBound(Items) then return data

return Items[index].data
end function

public function string of_gettag (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].Tag
end function

public function long of_settag (readonly integer index, readonly string stag);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[index].Tag = stag

return RetCode.OK
end function

public function integer of_selectnext (readonly integer index);int i

if index < 0 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

for i = index + 1 to UpperBound(Items)
	if of_Select(i) > 0 then
		exit
	end if
next
	
return _SelectedIndex
end function

public function integer of_selectprevious (readonly integer index);int i

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_BOUND

for i = index - 1 to 1 step -1
	if of_Select(i) > 0 then
		exit
	end if
next
	
return _SelectedIndex
end function

public function long of_remove (readonly integer index);int i
boolean bVisible,bFrameChanged
boolean bLockUpdate
ITEMDATA newItems[]

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

if index = _mouseOverIndex then
	_mouseOverIndex = 0
end if

bVisible = Items[index].visible

if bVisible then
	bLockUpdate = #LockUpdate
	#LockUpdate = true
end if

if index = _SelectedIndex then
	if index = of_SelectNext(index) then
		if index = of_SelectPrevious(index) then
			_SelectedIndex = 0
		end if
	end if
end if

if index < _SelectedIndex then
	_SelectedIndex -= 1
end if

bFrameChanged = ((bVisible and Not Items[index].icontray) or Items[index].object.visible)

if bFrameChanged then
	if _RedrawFlag then Super::SetRedraw(false)
end if

if IsValidObject(Items[index].object) then
	Items[index].object.Hide()
	if Items[index].hOldParent > 0 then
		Win32.SetParent(Handle(Items[index].object),Items[index].hOldParent)
	end if
	if Items[index].objectOwner then
		_of_CloseUserObject(Items[index].object)
	end if
end if

for i = 1 to UpperBound(Items)
	if i = index then continue
	newItems[UpperBound(newItems) + 1] = Items[i]
next

Items = newItems

if UpperBound(Items) = 0 then
	_selectedIndex = 0
	_mouseOverIndex = 0
	_firstButton = 0
	_lastButton = 0
end if

if bFrameChanged then
	#LockUpdate = bLockUpdate
	UpdateFrame()
	if _RedrawFlag then Super::SetRedraw(true)
elseif bVisible then
	#LockUpdate = bLockUpdate
	_of_UpdatePoints()
	if _RedrawFlag then Super::SetRedraw(true)
end if

_of_ShowTip(0)

return RetCode.OK
end function

public function integer setredraw (boolean f);_RedrawFlag = f
return Super::SetRedraw(f)
end function

public function integer of_insertobject (readonly integer index, ref dragobject object, readonly string txt, readonly string image, readonly string tiptext);int i,itemIndex
ITEMDATA newItem

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE
if Len(image) = 0 then return RetCode.E_INVALID_IMAGE

itemIndex = of_GetIndex(object)

if itemIndex > 0 then return itemIndex

newItem.Text = txt
newItem.Title = txt
newItem.tipText = tipText
newItem.enabled = true
newItem.visible = true
newItem.displaytext = true
newItem.icontray = false

if Not IsValidObject(object) then
	if Not _of_OpenUserObject(ref object) then return RetCode.E_INVALID_OBJECT
	newItem.objectOwner = true
elseif _of_IsObjectCreator(object) then
	newItem.objectOwner = true
end if

object.Hide()

if Win32.GetParent(Handle(object)) <> #Handle then
	newItem.hOldParent = Win32.SetParent(Handle(object),#Handle)
end if

newItem.object = object
if IsOLEControl(object) then
	newItem.IsOLE = true
end if

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

if index <= _selectedIndex then
	_selectedIndex += 1
end if

if len(image) > 0 then
	Items[index].image = image
	Items[index].imageindex = _ImageList.AddImage(theme.of_GetItemIcon(index,image,0))
	if Items[index].imageIndex > 0 then
		_ImageList_TitleBar.AddImage(theme.of_GetItemIcon(index,image,0))
		_ImageList_Icontray.AddImage(theme.of_GetItemIcon(index,image,0))
	end if
end if

_of_UpdateTextSize(index)
_of_UpdateTitleTextSize(index)
of_UpdatePoints()

if _SelectedIndex = 0 then
	of_Select(index)
end if

return index
end function

public function integer of_insertobject (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly string tiptext);int newIndex
DragObject object

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

if Not _of_OpenUserObject(ref Object,clsName) then return RetCode.E_INVALID_TYPE

newIndex = of_InsertObject(index,ref Object,txt,image,tipText)
if newIndex <= 0 then
	_of_CloseUserObject(object)
end if

return newIndex
end function

public function integer of_addobject (ref dragobject object, readonly string txt, readonly string image, readonly string tiptext);return of_Insertobject(UpperBound(Items)+1,ref object,txt,image,tiptext)
end function

public function integer of_addobject (readonly string clsname, readonly string txt, readonly string image, readonly string tiptext);return of_Insertobject(UpperBound(Items)+1,clsName,txt,image,tiptext)
end function

public function unsignedlong of_getchevronstate ();ulong nState

if Chevron.MouseDown then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if Chevron.MouseOver then nState += Enums.STATE_HOVER
end if

return nState
end function

public function unsignedlong of_getitemstate (readonly integer index);ulong nState

if index < 1 or index > UpperBound(Items) then return 0

if Items[index].MouseOver  then nState += Enums.STATE_HOVER
if Items[index].Selected then nState += Enums.STATE_CURRENT + Enums.STATE_SELECTED + Enums.STATE_PRESSED
if Items[index].Highlighted then nState += Enums.STATE_HIGHLIGHTED
if Items[index].FlashTime = -1 or Items[index].FlashTime > 0 then nState += Enums.STATE_FLASHING
if Not Items[index].Enabled then nState += Enums.STATE_DISABLED

return nState
end function

public function unsignedlong of_getsplitbarstate ();ulong nState

if SplitBar.MouseDown then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if SplitBar.MouseOver then nState += Enums.STATE_HOVER
end if

return nState
end function

public function integer of_getindexbytag (readonly string stag);int index

for index = 1 to UpperBound(Items)
	if Items[index].tag = stag then return index
next

return 0
end function

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if BitAND(flags,ADJ_BORDER) > 0 then
	fBorderSize = P2DX(1)
	if theme.#BorderStyle = Enums.BS_SOLID then
		Painter.InflateRect(ref adjRect,-fBorderSize,-fBorderSize)
	elseif theme.#BorderStyle = Enums.BS_RAISED then
		adjRect.right -= fBorderSize * 2
		adjRect.bottom -= fBorderSize * 2
	end if
end if

if BitAND(flags,ADJ_BORDERMARGIN) > 0 then
	adjRect.left += theme.#BorderMargin.left
	adjRect.right -= theme.#BorderMargin.right
end if
end subroutine

private function unsignedlong _of_popupmenu (real xpos, real ypos);//Chevron menu
ulong rtCode
ulong pmFlags
int count, index,firstId
n_cst_popupmenu ln_menu
RECTF wndRect

if Not Chevron.visible then return 0

Painter.GetWindowRect(#Handle,ref wndRect)

if theme.#IcontrayIconRTL then
	xpos = wndRect.left
	ypos = wndRect.top + Chevron.rcPaint.Bottom + 2
	pmFlags = Win32.TPM_RIGHTALIGN + Win32.TPM_BOTTOMALIGN
else
	xpos = wndRect.left + Chevron.rcPaint.Right
	ypos = wndRect.top + Chevron.rcPaint.Bottom + 2
	pmFlags = Win32.TPM_LEFTALIGN + Win32.TPM_BOTTOMALIGN
end if

if IsPrevented(Event OnPopupMenu(IDX_CHEVRON,ref xpos,ref ypos,ref pmFlags)) then return 0
if Not IsValid(this) then return 0

ln_menu = Create n_cst_popupmenu
ln_menu.of_SetToolTip(#ToolTip)
ln_menu.theme.of_SetTheme(theme)
ln_menu.theme.of_SetIconSize(theme.#IcontrayIconSize.cx,theme.#IcontrayIconSize.cy)
ln_menu.theme.Font.of_SetFont(theme.font)

count = UpperBound(Items)

for index = 1 to count
	if Not Items[index].Visible or Not Items[index].Hidden then continue
	if firstId = 0 then
		firstId = index
	end if
	ln_menu.of_AddMenu(Items[index].text,Items[index].image,Items[index].tipText,Items[index].Enabled,index)
next

ln_Menu.of_CheckRadios(firstId,count,_selectedIndex,false,true)

rtCode = ln_menu.of_Popup(xpos,ypos,pmFlags)
if Not IsValid(this) then return rtCode

_lastPopupTime = Cpu()

Destroy ln_menu

return rtCode
end function

public function integer of_indexfrompoint (readonly real xpos, readonly real ypos);int index

if Not Painter.PtInRect(rcWnd,xpos,ypos) then return 0

if Chevron.Visible then
	if Painter.PtInRect(Chevron.rcPaint,xpos,ypos) then
		return IDX_CHEVRON
	end if
end if

if _mouseOverIndex > 0 then
	if Items[_mouseOverIndex].Visible and Items[_mouseOverIndex].Enabled and Not Items[_mouseOverIndex].Hidden then
		if Painter.PtInRect(Items[_mouseOverIndex].rcPaint,xpos,ypos) then
			return _mouseOverIndex
		end if
	end if
end if

for index = 1 to UpperBound(Items)
	if index = _mouseOverIndex then continue
	if Not Items[index].visible or Not Items[index].enabled or Items[index].hidden then continue
		
	if Painter.PtInRect(Items[index].rcPaint,xpos,ypos) then
		return index
	end if

next

return 0
end function

on u_cst_shortcutbar.create
call super::create
this.theme=create theme
this.timer=create timer
end on

on u_cst_shortcutbar.destroy
call super::destroy
destroy(this.theme)
destroy(this.timer)
end on

event oninit;call super::oninit;_ImageList_TitleBar = Create n_imagelist
_ImageList_Icontray = Create n_imagelist
_ImageList = Create n_imagelist
_ImageList_TitleBar.ShareImage(true)
_ImageList_Icontray.ShareImage(true)
_ImageList.ShareImage(true)
_ImageList_TitleBar.SetImageSize(theme.#TitleBarIconSize.cx,theme.#TitleBarIconSize.cy)
_ImageList_Icontray.SetImageSize(theme.#IcontrayIconSize.cx,theme.#IcontrayIconSize.cy)
_ImageList.SetImageSize(theme.#IconSize.cx,theme.#IconSize.cy)

_hCurArrow = Win32.LoadCursor(0,Win32.IDC_ARROW)
_hCurSizeNS = Win32.LoadCursor(0,Win32.IDC_SIZENS)

//Init tooptip control
_ToolTip = Create n_tooltip
_ToolTip.CreateToolTip(#Handle)
_TTID = _ToolTip.AddTool(#Handle,false,Win32.TTF_IDISHWND + Win32.TTF_TRANSPARENT + Win32.TTF_TRACK + Win32.TTF_ABSOLUTE)

UpdateFrame()
end event

event onuninit;call super::onuninit;int index

for index = 1 to UpperBound(Items)
	if IsValidObject(Items[index].object) then
		Items[index].object.Hide()
		if Items[index].hOldParent > 0 then
			Win32.SetParent(Handle(Items[index].object),Items[index].hOldParent)
		end if
		if Items[index].objectOwner then
			_of_CloseUserObject(Items[index].object)
		end if
	end if
next

Destroy _ImageList_TitleBar
Destroy _ImageList_Icontray
Destroy _ImageList

if _TTID > 0 then
	_ToolTip.DelTool(#Handle,_TTID)
end if

Destroy _ToolTip
Timer.StopAll()
end event

type uo_logo from u_cst_canvas`uo_logo within u_cst_shortcutbar
string tag = "ShortcutBar"
end type

type theme from n_cst_shortcutbar_theme within u_cst_shortcutbar descriptor "pb_nvo" = "true" 
end type

on theme.create
call super::create
end on

on theme.destroy
call super::destroy
end on

event onthemechanged;call super::onthemechanged;boolean dirty

choose case eventFlag
	case EVT_THEME
		_of_UpdateTextSize()
		dirty = true
	case EVT_BORDERSTYLE
		dirty = true
	case EVT_FONT
		_of_UpdateTextSize()
		dirty = true
	case EVT_TITLEBAR
		dirty = true
	case EVT_TITLEBARHEIGHT
		dirty = true
	case EVT_SPLITBAR
		dirty = true
	case EVT_ICONTRAYICONRTL
		dirty = true
	case EVT_ICONPOSITION
		_of_UpdateTextSize()
		dirty = true
	case EVT_TEXTALIGN
		dirty = true
	case EVT_FIXEDSIZE
		dirty = true
	case EVT_ITEMMINSIZE
		if theme.#FixedSize then
			dirty = true
		end if
	case EVT_TITLEBARICONSIZE
		_ImageList_TitleBar.SetImageSize(#TitleBarIconSize.cx,#TitleBarIconSize.cy)
		dirty = true
	case EVT_ICONTRAYICONSIZE
		_ImageList_Icontray.SetImageSize(#IcontrayIconSize.cx,#IcontrayIconSize.cy)
		dirty = true
	case EVT_ICONSIZE
		_ImageList.SetImageSize(#IconSize.cx,#IconSize.cy)
		_of_UpdateTextSize()
		dirty = true
	case EVT_ICONTRAYITEMMARGIN
		dirty = true
	case EVT_BORDERMARGIN
		_of_UpdateTextSize()
		dirty = true
	case EVT_ICONTRAYBORDERMARGIN
		dirty = true
	case EVT_SELECTEDFONT
		_of_UpdateTextSize()
		dirty = true
	case EVT_TITLEFONT
		_of_UpdateTitleTextSize()
		dirty = true
end choose

if dirty then
	of_UpdatePoints()
else
	if eventFlag = EVT_TITLEBARTEXTALIGN or eventFlag = EVT_TITLEBARICONALIGN then
		_of_DrawTitle(false)
	else
		of_Redraw(true)
	end if
end if

Parent.Event OnThemeChanged(eventFlag)
end event

event ongetcolor;call super::ongetcolor;Parent.Event OnGetColor(colorFlag,state,ref color)
end event

event ongetitemcolor;call super::ongetitemcolor;Parent.Event OnGetItemColor(index,colorFlag,state,ref color)
end event

type timer from n_timer within u_cst_shortcutbar descriptor "pb_nvo" = "true" 
end type

event ontimer;if id = TM_FLASH then
	int index
	boolean bContinue
	for index = 1 to UpperBound(Items)
		if Items[index].FlashTime = 0 then continue
		if Items[index].FlashTime > 0 then
			Items[index].FlashTime -= #FlashFadeTime
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
	return bContinue
end if

return false
end event

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

