$PBExportHeader$u_cst_ribbonbar.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_ribbonbar from u_cst_canvas
end type
type itemdata from structure within u_cst_ribbonbar
end type
type collapsebuttondata from structure within u_cst_ribbonbar
end type
type theme from n_cst_ribbonbar_theme within u_cst_ribbonbar
end type
type timer from n_timer within u_cst_ribbonbar
end type
end forward

type itemdata from structure
	boolean		enabled
	boolean		visible
	boolean		hidden
	boolean		displaytext
	boolean		selected
	boolean		mouseover
	boolean		highlighted
	boolean		multiline
	boolean		flashing
	long		flashtime
	string		text
	string		tiptext
	long		tiptime
	string		image
	integer		imageindex
	n_cst_ribbonbar_category		category
	sizef		sztext
	rectf		rctext
	rectf		rcimage
	rectf		rcpaint
	unsignedlong		paintpath
	unsignedlong		selectedpaintpath
end type

type collapsebuttondata from structure
	boolean		visible
	boolean		mouseover
	boolean		mousedown
	string		tiptext
	integer		imageindex
	rectf		rcimage
	rectf		rcpaint
end type

global type u_cst_ribbonbar from u_cst_canvas
integer width = 1527
integer height = 592
boolean #fadeanimation = true
event type long onncpaint ( unsignedlong hdc )
event oncapturechanged ( )
event onncmouseleave ( )
event type long onwindowsizing ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event type long onncmousemove ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onnccalcsize ( unsignedlong lpcrect )
event type long onnclbuttondown ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event type long onnchittest ( real xpos,  real ypos )
event type long ontabselectionchanging ( integer oldindex,  integer newindex )
event ontabselectionchanged ( integer oldindex,  integer newindex )
event ontabmousemove ( integer index,  real xpos,  real ypos )
event ontabmouseleave ( integer index )
event ontabmouseenter ( integer index,  real xpos,  real ypos )
event ongettabcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type long onncrbuttondown ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onncmousehover ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onmousehover ( unsignedlong vkey,  real xpos,  real ypos )
event type long onmousewheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event type long onmousehwheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event type long onpaint ( unsignedlong hdc )
event onmouseleave ( )
event ongetitemcolor ( n_cst_ribbonbar_baseitem item,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type long onitemclicking ( n_cst_ribbonbar_baseitem item )
event onitemclicked ( n_cst_ribbonbar_baseitem item )
event type long onitemrightclicking ( n_cst_ribbonbar_baseitem item )
event onitemrightclicked ( n_cst_ribbonbar_baseitem item )
event type long onitemchecking ( n_cst_ribbonbar_baseitem item )
event onitemchecked ( n_cst_ribbonbar_baseitem item )
event onitemmousemove ( n_cst_ribbonbar_baseitem item,  real xpos,  real ypos )
event onitemmouseenter ( n_cst_ribbonbar_baseitem item,  real xpos,  real ypos )
event onitemmouseleave ( n_cst_ribbonbar_baseitem item )
event onitemmousedown ( n_cst_ribbonbar_baseitem item,  real xpos,  real ypos )
event onitemmouseup ( n_cst_ribbonbar_baseitem item,  real xpos,  real ypos )
event onpanelmousemove ( n_cst_ribbonbar_panel panel,  real xpos,  real ypos )
event onpanelmouseenter ( n_cst_ribbonbar_panel panel,  real xpos,  real ypos )
event onpanelmouseleave ( n_cst_ribbonbar_panel panel )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlaunchbuttonclicking ( n_cst_ribbonbar_panel panel )
event onlaunchbuttonclicked ( n_cst_ribbonbar_panel panel )
event onlaunchbuttonmousemove ( n_cst_ribbonbar_panel panel,  real xpos,  real ypos )
event onlaunchbuttonmouseenter ( n_cst_ribbonbar_panel panel,  real xpos,  real ypos )
event onlaunchbuttonmouseleave ( n_cst_ribbonbar_panel panel )
event onlaunchbuttonmousedown ( n_cst_ribbonbar_panel panel,  real xpos,  real ypos )
event onlaunchbuttonmouseup ( n_cst_ribbonbar_panel panel,  real xpos,  real ypos )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event type long onnclbuttondblclk ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onmenuselecting ( n_cst_ribbonbar_baseitem item,  integer id )
event onmenuselected ( n_cst_ribbonbar_baseitem item,  integer id )
event type long onpopupmenu ( n_cst_ribbonbar_baseitem item,  ref real xpos,  ref real ypos,  ref unsignedlong flags )
event type long ontoolbarbuttonclicking ( n_cst_ribbonbar_toolbar rbtoolbar,  integer index )
event ontoolbarbuttonclicked ( n_cst_ribbonbar_toolbar rbtoolbar,  integer index )
event type long ontoolbarbuttonrightclicking ( n_cst_ribbonbar_toolbar rbtoolbar,  integer index )
event ontoolbarbuttonrightclicked ( n_cst_ribbonbar_toolbar rbtoolbar,  integer index )
event type long ontoolbarpopupmenu ( n_cst_ribbonbar_toolbar rbtoolbar,  integer index,  ref real xpos,  ref real ypos,  ref unsignedlong flags )
event ontoolbarbuttonmouseenter ( n_cst_ribbonbar_toolbar rbtoolbar,  integer index,  real xpos,  real ypos )
event ontoolbarbuttonmousemove ( n_cst_ribbonbar_toolbar rbtoolbar,  integer index,  real xpos,  real ypos )
event ontoolbarbuttonmouseleave ( n_cst_ribbonbar_toolbar rbtoolbar,  integer index )
event ontoolbarbuttonmousedown ( n_cst_ribbonbar_toolbar rbtoolbar,  integer index,  real xpos,  real ypos )
event ontoolbarbuttonmouseup ( n_cst_ribbonbar_toolbar rbtoolbar,  integer index,  real xpos,  real ypos )
event type long ontoolbarmenuselecting ( n_cst_ribbonbar_toolbar rbtoolbar,  integer index,  integer id )
event ontoolbarmenuselected ( n_cst_ribbonbar_toolbar rbtoolbar,  integer index,  integer id )
event ongetpanelcolor ( n_cst_ribbonbar_panel panel,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event ongetcategorycolor ( n_cst_ribbonbar_category category,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type long onncerasebkgnd ( unsignedlong hdc )
event onpopupenteridle ( unsignedinteger popuptype )
event onpopupkickidle ( unsignedinteger popuptype )
event onpopupidle ( unsignedinteger popuptype )
event type long onerasebkgnd ( unsignedlong hdc )
event type long onrbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onrbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event ongettoolbaritemcolor ( n_cst_ribbonbar_toolbar rbtoolbar,  integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event onpanelrbuttondown ( n_cst_ribbonbar_panel panel,  real xpos,  real ypos )
event onpanelrbuttonup ( n_cst_ribbonbar_panel panel,  real xpos,  real ypos )
theme theme
timer timer
end type
global u_cst_ribbonbar u_cst_ribbonbar

type prototypes

end prototypes

type variables
/*--- Constants ---*/
Public:
//Indexes
//- TabStrip indexes
Constant Int IDX_COLLAPSEBUTTON	= -1
Constant Int IDX_SCROLLBARLEFT		= -2
Constant Int IDX_SCROLLBARRIGHT	= -3

/*--- Properties ---*/
Public:
Uint		#FlashFadeTime		= 1500		//ms
Boolean	#ToolTip 				= false
Boolean	#AutoScroll				= false 		//当鼠标进入ScrollBar时自动滚动
Boolean	#CollapseWhenDBClk	= true		//当鼠标双击标签时折叠RibbonBar
Boolean	#SmoothScroll			= false 		//平滑滚动效果

/*--- Implementation ---*/
Private:
n_imagelist								_ImageList
n_imagelist								_PanelImageList
n_imagelist								_SmallImageList
n_imagelist								_LargeImageList
n_imagelist								_ArrowImageList
n_tooltip 									_ToolTip
n_cst_ribbonbar_popupcategory 	_PopupCategory
ITEMDATA								Items[]
COLLAPSEBUTTONDATA				CollapseButton
PAINTPANE								ScrollBarLeft
PAINTPANE								ScrollBarRight
RECTF										rcWnd
RECTF										rcTabStrip

Ulong	 _TTID
Ulong	 _outlinePen

Int		_mouseOverIndex 		= 0
Int		_selectedIndex			= 0
Int		_firstIndex				= 0
Int		_lastIndex				= 0
Int		_dbclkedIndex			= 0
Int		_lastPopupIndex		= 0
Ulong	_lastPopupTime		= 0
Real	_ScrollPosition 			= 0
Real	_StartPoint 				= 0
Real	_EndPoint				= 0
Real 	_LastScrollPosition	 	= 0
Real	_LastRibbonHeight		= 0
Real	_smoothScrollSize		= 0

WindowState _ParentLastWindowState

Boolean _MouseLeaveTracked 	= false
Boolean _MouseCaptured 		= false

//Hit-test code
Constant Uint HTTABSTRIP 				= 100
Constant Uint HTSCROLLBARLEFT		= 101
Constant Uint HTSCROLLBARRIGHT	= 102
Constant Uint HTCOLLAPSEBUTTON	= 103
Constant Uint HTITEM						= 204
//Timer ID
Constant Uint TM_SCROLL				= 1
Constant Uint TM_CATEGORYSCROLL	= 2
Constant Uint TM_FLASH					= 3
//Timer interval (ms)
Constant Uint TMI_SCROLL = 15
//Button icon
Constant String ICO_COLLAPSE		= "pfw://zip/images[chevron-up.svg]"
Constant String ICO_EXPAND		= "pfw://zip/images[chevron-down.svg]"
//Button tiptext
Constant String TIP_COLLAPSE 	= "折叠功能区"
Constant String TIP_EXPAND	 	= "展开功能区"
//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
Constant Uint ADJ_COLLAPSEBUTTON	= 4
Constant Uint ADJ_FIXEDTAB			= 8
//Sizes
Constant Real SCROLLBARSIZE 	= 10 		//px
Constant Real ARROWICONSIZE	= 16		//px
end variables
forward prototypes
private subroutine _of_updatetextsize ()
private subroutine _of_trackncmouseleave (readonly boolean track)
private subroutine _of_capturemouse (readonly boolean capture)
private subroutine _of_updatescrollbarpoints ()
private subroutine _of_scrollleft ()
private subroutine _of_scrollright ()
private subroutine _of_updatetextsize (readonly integer index)
private subroutine _of_updatecategoryposition (readonly integer index)
public function n_cst_ribbonbar_category of_addcategory (readonly string txt, readonly string image, readonly string tiptext)
public function n_cst_ribbonbar_category of_addcategory (readonly string txt, readonly string image)
public function n_cst_ribbonbar_category of_insertcategory (readonly integer index, readonly string txt, readonly string image, readonly string tiptext)
public function n_cst_ribbonbar_category of_insertcategory (readonly integer index, readonly string txt, readonly string image)
public function integer of_Getcount ()
public function string of_Getimage (readonly integer index)
public function integer of_getindex (readonly n_cst_ribbonbar_category category)
public function integer of_getindex (readonly string txt)
public function integer of_GetSelectedIndex ()
public function string of_Gettext (readonly integer index)
public function boolean of_Isenabled (readonly integer index)
public function boolean of_IsHighLighted (readonly integer index)
public function boolean of_Isvisible (readonly integer index)
public function integer of_select (readonly integer index)
public function unsignedlong of_getsafedc ()
public function boolean of_ispopupmode ()
public function unsignedlong of_gethandle ()
public function boolean of_Ismultiline (readonly integer index)
private subroutine _of_updatetabpoints ()
private subroutine _of_updatepoints ()
private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly boolean fadeanimation)
public function string of_gettiptext (readonly integer index)
private function boolean _of_adjustscrollposition ()
private subroutine _of_flashdrawitem (readonly integer index)
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation)
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime)
public function boolean of_isflashing (readonly integer index)
public function long of_displaytext (readonly integer index, readonly boolean display)
public function long of_displaytextall (readonly boolean display)
public function long of_enable (readonly integer index, readonly boolean benabled)
public function long of_flash (readonly integer index, readonly long flashtime)
public function long of_getcategory (readonly integer index, ref n_cst_ribbonbar_category category)
public function long of_highlight (readonly integer index, readonly boolean highlighted)
public function boolean of_isdisplaytext (readonly integer index)
public function long of_removeall ()
public function long of_setimage (readonly integer index, readonly string image)
public function long of_setmultiline (readonly integer index, readonly boolean multiline)
public function long of_settext (readonly integer index, readonly string txt)
public function long of_settiptext (readonly integer index, readonly string tiptext)
public function long of_visible (readonly integer index, readonly boolean bvisible)
public function long of_redraw (readonly boolean drawclient, readonly boolean fadeanimation)
public function long of_redraw (readonly boolean fadeanimation)
private function unsignedlong _of_popupcategory (readonly integer index)
public function long of_settiptime (readonly integer index, readonly long tiptime)
public function integer of_selectnext (readonly integer index)
public function integer of_selectprevious (readonly integer index)
public function long of_remove (readonly integer index)
public function integer of_getlastvisible ()
public function integer of_getfirstvisible ()
public function integer of_getpreviousvisible (readonly integer index)
public function integer of_getnextvisible (readonly integer index)
private subroutine _of_filltabstripbkgnd (readonly unsignedlong hdc)
private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly unsignedlong hdc)
private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawitem (integer index, readonly boolean fadeanimation)
public function any of_getdata (readonly integer index)
public function long of_setdata (readonly integer index, readonly any data)
public function string of_gettag (readonly integer index)
public function long of_settag (readonly integer index, readonly string stag)
public function long of_exitpopupmode (readonly unsignedlong exitcode)
private subroutine _of_trackncmousehover (readonly boolean track, readonly long hovertime)
private subroutine _of_trackmousehover (readonly boolean track, readonly long hovertime)
public function long of_findcategorybytag (readonly string stag, ref n_cst_ribbonbar_category foundcategory)
public function long of_finditembytag (readonly string stag, ref n_cst_ribbonbar_baseitem founditem)
public function long of_finditembytext (readonly string txt, ref n_cst_ribbonbar_baseitem founditem)
public function long of_findpanelbytag (readonly string stag, ref n_cst_ribbonbar_panel foundpanel)
public function long of_updatepoints (readonly boolean updateclient)
public function long of_updatepoints ()
public function long of_scrollto (readonly integer index, readonly long flag)
public function long of_scrollto (readonly integer index)
private subroutine _of_drawcollapsebutton (readonly unsignedlong hdc)
private subroutine _of_drawcollapsebutton (readonly boolean fadeanimation)
private subroutine _of_showtip (readonly integer index)
private subroutine _of_updatecollpasebuttonpoints ()
private function integer _of_getfirstscrollableindex ()
public function unsignedlong of_getitemstate (readonly integer index)
public function integer of_getindexbytag (readonly string stag)
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
private subroutine _of_fillbkgnd (readonly unsignedlong hdc, ref rectf rcpaint, readonly n_cst_ribbonbar_category category)
private subroutine _of_scrollposition (readonly real scrollsize)
public function integer of_indexfrompoint (readonly real xpos, readonly real ypos)
private function real _of_gettabstripsize ()
end prototypes

event type long onncpaint(unsignedlong hdc);int index,nCount,nStartIndex
RECTF tabStripRect

if #LockUpdate then return 1
if Not theme.#TabStripBar then return 1
	
Event OnNcEraseBkgnd(hdc)

Painter.IntersectClipRect(hdc,rcTabStrip)

if ScrollBarLeft.visible then
	_of_DrawScrollBar(ScrollBarLeft,hdc)
	Painter.ExcludeClipRect(hdc,ScrollBarLeft.rcPaint)
end if
if ScrollBarRight.visible then
	_of_DrawScrollBar(ScrollBarRight,hdc)
	Painter.ExcludeClipRect(hdc,ScrollBarRight.rcPaint)
end if

if CollapseButton.Visible then
	_of_DrawCollapseButton(hdc)
end if

tabStripRect = rcTabStrip
_of_AdjustRect(ref tabStripRect,ADJ_BORDER + ADJ_COLLAPSEBUTTON)

Painter.IntersectClipRect(hdc,tabStripRect)

nCount = UpperBound(Items)
if theme.#FixedFirstTab and nCount > 0 then
	if Items[1].visible and Items[1].PaintPath <> 0 then
		_of_DrawItem(1, hdc)
		_of_AdjustRect(ref tabStripRect,ADJ_FIXEDTAB)
		Painter.IntersectClipRect(hdc,tabStripRect)
	end if
	nStartIndex = 2
else
	nStartIndex = 1
end if

for index = nStartIndex to nCount
	if Not Items[index].visible or Items[index].Hidden or Items[index].PaintPath = 0 then continue
	_of_DrawItem(index, hdc)
next

Painter.SelectClipRgn(hdc,0)

return 1
end event

event oncapturechanged();if _MouseCaptured then
	_of_CaptureMouse(false)
	if ScrollBarLeft.MouseDown then
		ScrollBarLeft.MouseDown = false
		_of_DrawScrollBar(ScrollBarLeft,true)
	end if
	if ScrollBarRight.MouseDown then
		ScrollBarRight.MouseDown = false
		_of_DrawScrollBar(ScrollBarRight,true)
	end if
	if CollapseButton.MouseDown then
		CollapseButton.MouseDown = false
		_of_DrawCollapseButton(true)
	end if
	Event OnNcMouseLeave()
elseif _selectedIndex > 0 then
	if Items[_selectedIndex].Visible then
		Items[_selectedIndex].Category.Event OnCaptureChanged()
	end if
end if
end event

event onncmouseleave();if Not _MouseCaptured then
	if _mouseOverIndex>0 then
		Items[_mouseOverIndex].mouseover=false
		_of_DrawItem(_mouseOverIndex,true)
		Event OnTabMouseLeave(_mouseOverIndex)
	end if
	_mouseOverIndex = 0
	
	if ScrollBarLeft.MouseOver then
		ScrollBarLeft.MouseOver = false
		_of_DrawScrollBar(ScrollBarLeft,true)
	end if
	if ScrollBarRight.MouseOver then
		ScrollBarRight.MouseOver = false
		_of_DrawScrollBar(ScrollBarRight,true)
	end if
	if CollapseButton.MouseOver then
		CollapseButton.MouseOver = false
		_of_DrawCollapseButton(true)
	end if
	
end if

_of_ShowTip(0)

_of_TrackNcMouseLeave(false)
end event

event type long onwindowsizing(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);rcWnd.right = newWidth
rcWnd.bottom = newHeight

if theme.#TabStripBar then
	rcTabStrip 			= rcWnd
	rcTabStrip.Bottom = _of_GetTabStripSize()
	
	rcTabStrip.left += theme.#TabStripOffset.left
	rcTabStrip.top += theme.#TabStripOffset.top
	rcTabStrip.right -= theme.#TabStripOffset.right
	
	if #ParentWindow.WindowState <> Minimized! then
		if _ParentLastWindowState <> #ParentWindow.WindowState then
			if Not IsNull(_LastScrollPosition) then
				_ScrollPosition = _LastScrollPosition
				SetNull(_LastScrollPosition)
			else
				_LastScrollPosition = _ScrollPosition
			end if
			_ParentLastWindowState = #ParentWindow.WindowState
		end if
	end if

	_of_UpdatePoints()
	of_ScrollTo(_selectedIndex)
else
	Painter.SetRectEmpty(ref rcTabStrip)
end if

if _selectedIndex > 0 and Not theme.#RibbonCollapsed  then
	_of_UpdateCategoryPosition(_selectedIndex)
end if

return 0
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);if _MouseCaptured then
	long hittestCode
	RECTF wndRect
	POINTF pt
	
	Painter.GetWindowRect(#Handle,ref wndRect)
	Painter.GetCursorPos(ref pt)
	xpos = pt.x - wndRect.left
	ypos = pt.y - wndRect.top
	
	hittestCode = Event OnNcHitTest(xpos,ypos)
	if IsNull(hittestCode) then
		hittestCode = 0
	end if
	Event OnNcMouseMove(hittestCode,xpos,ypos)
elseif _selectedIndex > 0 then
	if Items[_selectedIndex].Visible and Items[_selectedIndex].Category.#Enabled then
		return Items[_selectedIndex].Category.Event OnMouseMove(vkey,xpos,ypos)
	end if
end if

return 0
end event

event type long onncmousemove(unsignedlong hittestcode, real xpos, real ypos);int index

if hitTestCode > HTSCROLLBARRIGHT then
	index = hitTestCode - HTITEM
end if

if Not _MouseLeaveTracked and Not _MouseCaptured then
	_of_TrackNcMouseLeave(true)
end if

if hitTestCode = HTSCROLLBARLEFT then
	if Not ScrollBarLeft.MouseOver then
		ScrollBarLeft.MouseOver = true
		_of_DrawScrollBar(ScrollBarLeft,true)
		_of_ShowTip(0)
		if #AutoScroll then
			_of_TrackNcMouseHover(true,100)
		end if
	elseif ScrollBarLeft.MouseDown then
		_of_TrackMouseHover(true,100)
	end if
else
	if ScrollBarLeft.MouseOver then
		ScrollBarLeft.MouseOver = false
		_of_DrawScrollBar(ScrollBarLeft,true)
	end if
end if

if hitTestCode = HTSCROLLBARRIGHT then
	if Not ScrollBarRight.MouseOver then
		ScrollBarRight.MouseOver = true
		_of_DrawScrollBar(ScrollBarRight,true)
		_of_ShowTip(0)
		if #AutoScroll then
			_of_TrackNcMouseHover(true,100)
		end if
	elseif ScrollBarRight.MouseDown then
		_of_TrackMouseHover(true,100)
	end if
else
	if ScrollBarRight.MouseOver then
		ScrollBarRight.MouseOver = false
		_of_DrawScrollBar(ScrollBarRight,true)
	end if
end if

if hitTestCode = HTCOLLAPSEBUTTON then
	if Not CollapseButton.MouseOver then
		CollapseButton.MouseOver = true
		_of_DrawCollapseButton(true)
		_of_ShowTip(IDX_COLLAPSEBUTTON)
	end if
else
	if CollapseButton.MouseOver then
		CollapseButton.MouseOver = false
		_of_DrawCollapseButton(true)
	end if
end if

if _mouseOverIndex <> index then
	if _mouseOverIndex>0 then
		Items[_mouseOverIndex].mouseover=false
		_of_DrawItem(_mouseOverIndex,true)
		_of_ShowTip(0)
		Event OnTabMouseLeave(_mouseOverIndex)
	end if
	
	_mouseOverIndex = index

	if _mouseOverIndex > 0 then
		Items[_mouseOverIndex].mouseover=true
		_of_DrawItem(_mouseOverIndex,true)
		_of_ShowTip(_mouseOverIndex)
		Event OnTabMouseEnter(_mouseOverIndex,xpos,ypos)
	end if
else
	if _mouseOverIndex>0 then
		if Not Items[_mouseOverIndex].mouseover then
			Items[_mouseOverIndex].mouseover=true
			_of_DrawItem(_mouseOverIndex,true)
			_of_ShowTip(_mouseOverIndex)
		end if
		Event OnTabMouseMove(_mouseOverIndex,xpos,ypos)
	end if
end if

return 1
end event

event type long onnccalcsize(unsignedlong lpcrect);RECTF cRect

Painter.CopyRect(ref cRect,lpcRect)

cRect.top += _of_GetTabStripSize()

Painter.CopyRect(lpcRect,ref cRect)

return 0
end event

event type long onnclbuttondown(unsignedlong hittestcode, real xpos, real ypos);if of_IsPopupMode() then
	choose case hitTestCode
		case HTSCROLLBARLEFT
			_of_ScrollLeft()
		case HTSCROLLBARRIGHT
			_of_ScrollRight()
	end choose
else
	if Not _MouseLeaveTracked  or Timer.IsRunning(TM_SCROLL) then
		Event	OnNcMouseMove(hittestcode,xpos,ypos)
	end if
	
	if Not #AutoScroll then
		if ScrollBarLeft.MouseOver then
			ScrollBarLeft.MouseDown = true
			_of_DrawScrollBar(ScrollBarLeft,false)
			_of_CaptureMouse(true)
			_of_TrackNcMouseHover(true,500)
			_of_ScrollLeft()
			return 0
		end if
		
		if ScrollBarRight.MouseOver then
			ScrollBarRight.MouseDown = true
			_of_DrawScrollBar(ScrollBarRight,false)
			_of_CaptureMouse(true)
			_of_TrackNcMouseHover(true,500)
			_of_ScrollRight()
			return 0
		end if
	end if
	
	if CollapseButton.MouseOver then
		CollapseButton.MouseDown = true
		_of_DrawCollapseButton(false)
		_of_ShowTip(0)
		_of_CaptureMouse(true)
		return 0
	end if
	
	if _mouseOverIndex > 0 then
		_of_ShowTip(0)
		if _mouseOverIndex = _selectedIndex then
			_dbclkedIndex = _mouseOverIndex
		else
			_dbclkedIndex = 0
		end if
		of_Select(_mouseOverIndex)
	end if
end if

return 0
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if _MouseCaptured then
	_of_CaptureMouse(false)
	_of_TrackNcMouseLeave(true)
	if ScrollBarLeft.MouseDown then
		ScrollBarLeft.MouseDown = false
		_of_DrawScrollBar(ScrollBarLeft,true)
	end if
	if ScrollBarRight.MouseDown then
		ScrollBarRight.MouseDown = false
		_of_DrawScrollBar(ScrollBarRight,true)
	end if
	if CollapseButton.MouseDown then
		CollapseButton.MouseDown = false
		_of_DrawCollapseButton(true)
		if CollapseButton.MouseOver then
			theme.of_SetRibbonCollapsed(Not theme.#RibbonCollapsed)
		end if
	end if
elseif _selectedIndex > 0 then
	if Items[_selectedIndex].Visible and Items[_selectedIndex].Category.#Enabled then
		return Items[_selectedIndex].Category.Event OnLButtonUp(vkey,xpos,ypos)
	end if
end if

return 0
end event

event type long onnchittest(real xpos, real ypos);int index

index = of_IndexFromPoint(xpos,ypos)

choose case index
	case IDX_COLLAPSEBUTTON
		return HTCOLLAPSEBUTTON
	case IDX_SCROLLBARLEFT
		return HTSCROLLBARLEFT
	case IDX_SCROLLBARRIGHT
		return HTSCROLLBARRIGHT
	case else
		if index > 0 then
			return HTITEM + index
		end if
end choose

if Painter.PtInRect(rcTabStrip,xpos,ypos) then
	return HTTABSTRIP
end if

long nvl
SetNull(nvl)
return nvl
end event

event type long onncmousehover(unsignedlong hittestcode, real xpos, real ypos);boolean trackMouseHover

if ScrollBarLeft.visible and HitTestCode = HTSCROLLBARLEFT and &
	(#AutoScroll or ScrollBarLeft.MouseDown) then
	_of_ScrollLeft()
	trackMouseHover = true
end if

if ScrollBarRight.visible and HitTestCode = HTSCROLLBARRIGHT and &
	(#AutoScroll or ScrollBarRight.MouseDown) then
	_of_ScrollRight()
	trackMouseHover = true
end if

if #SmoothScroll then
	_of_TrackNcMouseHover(trackMouseHover,100)
else
	_of_TrackNcMouseHover(trackMouseHover,200)
end if

return 0
end event

event type long onmousehover(unsignedlong vkey, real xpos, real ypos);if _MouseCaptured then
	boolean trackMouseHover = false
	RECTF wndRect
	POINTF pt
	
	Painter.GetWindowRect(#Handle,ref wndRect)
	Painter.GetCursorPos(ref pt)
	xpos = pt.x - wndRect.left
	ypos = pt.y - wndRect.top
	
	if ScrollBarLeft.visible and Painter.PtInRect(ScrollBarLeft.rcPaint,xpos,ypos) and &
		(#AutoScroll or ScrollBarLeft.MouseDown) then
		_of_ScrollLeft()
		trackMouseHover = true
	end if
	
	if ScrollBarRight.visible and Painter.PtInRect(ScrollBarRight.rcPaint,xpos,ypos) and &
		(#AutoScroll or ScrollBarRight.MouseDown) then
		_of_ScrollRight()
		trackMouseHover = true
	end if
	
	if #SmoothScroll then
		_of_TrackMouseHover(trackMouseHover,100)
	else
		_of_TrackMouseHover(trackMouseHover,200)
	end if
elseif _selectedIndex > 0 then
	if Items[_selectedIndex].Visible then
		return Items[_selectedIndex].Category.Event OnMouseHover(vkey,xpos,ypos)
	end if
end if

return 0
end event

event type long onmousewheel(unsignedlong vkey, long zdelta, real xpos, real ypos);int i,steps

if Not Painter.PtInRect(rcWnd,xpos,ypos) then return 0

steps = Abs(zdelta)/WinMsg.WHEEL_DELTA

if Painter.PtInRect(rcTabStrip,xpos,ypos) then
	if (zdelta > 0 and ScrollBarLeft.visible)  then
		for i = 1 to steps
			_of_ScrollLeft()
		next
	elseif (zdelta < 0 and ScrollBarRight.visible) then
		for i = 1 to steps
			_of_ScrollRight()
		next
	end if
elseif _selectedIndex > 0 then
	if Items[_selectedIndex].Visible then
		RECTF wndRect,clientRect
		Painter.GetWindowRect(#Handle,ref wndRect)
		Painter.GetClientRect(#Handle,ref clientRect)
		Painter.ClientToScreen(#Handle,ref clientRect)
		Painter.OffsetRect(ref clientRect,wndRect.left,wndRect.top)
		return Items[_selectedIndex].Category.Event OnMouseWheel(vkey,zdelta,xpos - clientRect.left,ypos - clientRect.top)
	end if
end if

return 1
end event

event type long onmousehwheel(unsignedlong vkey, long zdelta, real xpos, real ypos);int i,steps

if Not Painter.PtInRect(rcWnd,xpos,ypos) then return 0

steps = Abs(zdelta)/WinMsg.WHEEL_DELTA

if Painter.PtInRect(rcTabStrip,xpos,ypos) then
	if (zdelta < 0 and ScrollBarLeft.visible)  then
		for i = 1 to steps
			_of_ScrollLeft()
		next
	elseif (zdelta > 0 and ScrollBarRight.visible) then
		for i = 1 to steps
			_of_ScrollRight()
		next
	end if
elseif _selectedIndex > 0 then
	if Items[_selectedIndex].Visible then
		RECTF wndRect,clientRect
		Painter.GetWindowRect(#Handle,ref wndRect)
		Painter.GetClientRect(#Handle,ref clientRect)
		Painter.ClientToScreen(#Handle,ref clientRect)
		Painter.OffsetRect(ref clientRect,wndRect.left,wndRect.top)
		return Items[_selectedIndex].Category.Event OnMouseHWheel(vkey,zdelta,xpos - clientRect.left,ypos - clientRect.top)
	end if
end if

return 1
end event

event type long onpaint(unsignedlong hdc);if #LockUpdate then return 1
if theme.#RibbonCollapsed then return 1

Event OnEraseBkgnd(hdc)

if _selectedIndex > 0 then
	if Items[_selectedIndex].Visible then
		return Items[_selectedIndex].Category.Event OnPaint(hdc)
	end if
end if

return 1
end event

event Onmouseleave();if _selectedIndex > 0 then
	Items[_selectedIndex].Category.Event OnMouseLeave()
end if
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);if _selectedIndex > 0 then
	if Items[_selectedIndex].Visible and Items[_selectedIndex].Category.#Enabled then
		return Items[_selectedIndex].Category.Event OnLButtonDown(vkey,xpos,ypos)
	end if
end if
return 0
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);if _selectedIndex > 0 then
	if Items[_selectedIndex].Visible and Items[_selectedIndex].Category.#Enabled then
		return Items[_selectedIndex].Category.Event OnLButtonDBLClk(vkey,xpos,ypos)
	end if
end if
return 0
end event

event type long onnclbuttondblclk(unsignedlong hittestcode, real xpos, real ypos);int index

index = hitTestCode - HTITEM

if #CollapseWhenDBClk and index > 0 then
	if index = _dbclkedIndex or (index = _selectedIndex and theme.#RibbonCollapsed) then
		theme.of_SetRibbonCollapsed(Not theme.#RibbonCollapsed)
	end if
else
	Event OnNcLButtonDown(hittestcode,xpos,ypos)
end if
_dbclkedIndex = 0
return 0
end event

event type long onncerasebkgnd(unsignedlong hdc);if #LockUpdate then return 1

_of_FillTabStripBkgnd(hdc)

return 1
end event

event type long onerasebkgnd(unsignedlong hdc);n_cst_ribbonbar_category category
RECTF paintRect

if #LockUpdate then return 1

Painter.GetClientRect(#Handle,ref paintRect)

if _selectedIndex > 0 then
	if Items[_selectedIndex].Visible then
		category = Items[_selectedIndex].Category
		category.of_GetPaintRect(ref paintRect)
	end if
end if

_of_FillBkgnd(hdc,paintRect,category)

return 1
end event

event type long onrbuttondown(unsignedlong vkey, real xpos, real ypos);if _selectedIndex > 0 then
	if Items[_selectedIndex].Visible and Items[_selectedIndex].Category.#Enabled then
		return Items[_selectedIndex].Category.Event OnRButtonDown(vkey,xpos,ypos)
	end if
end if
return 0
end event

event type long onrbuttonup(unsignedlong vkey, real xpos, real ypos);if _selectedIndex > 0 then
	if Items[_selectedIndex].Visible and Items[_selectedIndex].Category.#Enabled then
		return Items[_selectedIndex].Category.Event OnRButtonUp(vkey,xpos,ypos)
	end if
end if

return 0
end event

private subroutine _of_updatetextsize ();int index

for index = 1 to UpperBound(Items)
	_of_UpdateTextSize(index)
next
end subroutine

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

private subroutine _of_capturemouse (readonly boolean capture);if _MouseCaptured = capture then return
	
_MouseCaptured = capture

if Not of_IsPopupMode() then
	if capture then
		Win32.SetCapture(#Handle)
	else
		Win32.ReleaseCapture()
	end if
end if
end subroutine

private subroutine _of_updatescrollbarpoints ();RECTF adjustedRect,tabStripRect

tabStripRect = rcTabStrip
adjustedRect = rcTabStrip

_of_AdjustRect(ref tabStripRect, ADJ_COLLAPSEBUTTON + ADJ_FIXEDTAB)
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_COLLAPSEBUTTON + ADJ_FIXEDTAB)

if theme.#TabStripBorderStyle <> Enums.BS_NONE then
	tabStripRect.right -= P2DX(1)
end if

if Ceiling(_StartPoint) < Ceiling(adjustedRect.left) then
	ScrollBarLeft.visible = true
	ScrollBarLeft.rcPaint.left = tabStripRect.left
	ScrollBarLeft.rcPaint.right = ScrollBarLeft.rcPaint.left + SCROLLBARSIZE
	ScrollBarLeft.rcPaint.top = tabStripRect.top
	ScrollBarLeft.rcPaint.bottom = tabStripRect.bottom
else
	ScrollBarLeft.visible = false
end if

if Ceiling(_EndPoint) > Ceiling(adjustedRect.right) then
	ScrollBarRight.visible = true
	ScrollBarRight.rcPaint.left = tabStripRect.right - SCROLLBARSIZE
	ScrollBarRight.rcPaint.right = ScrollBarRight.rcPaint.left + SCROLLBARSIZE
	ScrollBarRight.rcPaint.top 	= tabStripRect.top
	ScrollBarRight.rcPaint.bottom = tabStripRect.bottom
else
	ScrollBarRight.visible = false
end if
end subroutine

private subroutine _of_scrollleft ();int index,nFristScrollableIndex
real offsetSize
boolean bNeedScroll
RECTF adjustedRect

if Not ScrollBarLeft.visible then return

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_COLLAPSEBUTTON + ADJ_FIXEDTAB)
		
if _smoothScrollSize > 0 then
	offsetSize = _smoothScrollSize
end if

nFristScrollableIndex = _of_GetFirstScrollableIndex()
for index = UpperBound(Items) to  nFristScrollableIndex step -1
	if Not Items[index].visible then continue
	if index = _firstIndex then
		if Items[index].rcPaint.Left + offsetSize < adjustedRect.left then
			bNeedScroll = true
		end if
	else
		if Items[index].rcPaint.Left + offsetSize < ScrollBarLeft.rcPaint.Right + 1 then
			bNeedScroll = true
		end if
	end if
	if bNeedScroll then
		of_ScrollTo(index,Enums.SF_BACKWARD)
		return
	end if
next
end subroutine

private subroutine _of_scrollright ();int index,nCount
real offsetSize
boolean bNeedScroll
RECTF adjustedRect

if Not ScrollBarRight.visible then return

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_COLLAPSEBUTTON + ADJ_FIXEDTAB)
		
if _smoothScrollSize < 0 then
	offsetSize = _smoothScrollSize
end if

nCount = UpperBound(Items)
for index = _of_GetFirstScrollableIndex() to nCount
	if Not Items[index].visible then continue
	if index = _lastIndex then
		if Items[index].rcPaint.Right + offsetSize > adjustedRect.right then
			bNeedScroll = true
		end if
	else
		if Items[index].rcPaint.Right + offsetSize > ScrollBarRight.rcPaint.Left - 1 then
			bNeedScroll = true
		end if
	end if
	if bNeedScroll then
		of_ScrollTo(index,Enums.SF_FORWARD)
		return
	end if
next
end subroutine

private subroutine _of_updatetextsize (readonly integer index);ulong dtparam
n_cst_font ln_calcFont
RECTF calcRect

if Len(Items[index].text) = 0 then
	Items[index].szText.cx = 0
	Items[index].szText.cy = 0
	return
end if

calcRect.right = rcTabStrip.right - rcTabStrip.left - 4

dtparam = Painter.DT_EXPANDTABS
if Items[index].MultiLine then
	dtparam += Painter.DT_WORDBREAK
else
	dtparam += Painter.DT_SINGLELINE
end if

if theme.SelectedFont.#WordSize.cx >= theme.Font.#WordSize.cx then
	ln_calcFont = theme.SelectedFont
else
	ln_calcFont = theme.Font
end if

Painter.of_CalcTextSize(ln_calcFont,Items[index].text,dtparam,ref calcRect)

if items[index].imageIndex > 0 and (theme.#TabIconPosition = Enums.TOP or theme.#TabIconPosition = Enums.BOTTOM) then
	if calcRect.bottom > (theme.#TabStripSize - theme.#TabStripBorderMargin.Top) - theme.#TabIconSize.cy - 2 - 4 then
		calcRect.bottom = (theme.#TabStripSize - theme.#TabStripBorderMargin.Top) - theme.#TabIconSize.cy - 2 - 4
	end if
else
	if calcRect.bottom > theme.#TabStripSize - theme.#TabStripBorderMargin.Top then
		calcRect.bottom = theme.#TabStripSize - theme.#TabStripBorderMargin.Top
	end if
end if

Items[index].szText.cx = calcRect.right
Items[index].szText.cy = calcRect.bottom

if Items[index].szText.cx < 0 then Items[index].szText.cx = 0
if  Items[index].szText.cy < 0 then Items[index].szText.cy = 0
end subroutine

private subroutine _of_updatecategoryposition (readonly integer index);real ribbonHeight

if index < 1 or index > UpperBound(Items) then return

if theme.#RibbonCollapsed then
	ribbonHeight = _LastRibbonHeight
else
	ribbonHeight = rcWnd.bottom
end if

Items[index].Category.Event OnResize(rcWnd.right,P2DY(D2PY(ribbonHeight) - D2PY(_of_GetTabStripSize())))
end subroutine

public function n_cst_ribbonbar_category of_addcategory (readonly string txt, readonly string image, readonly string tiptext);return of_InsertCategory(UpperBound(Items)+1,txt,image,tiptext)
end function

public function n_cst_ribbonbar_category of_addcategory (readonly string txt, readonly string image);return of_AddCategory(txt,image,"")
end function

public function n_cst_ribbonbar_category of_insertcategory (readonly integer index, readonly string txt, readonly string image, readonly string tiptext);int i
ITEMDATA newTab
n_cst_ribbonbar_category newCategory

SetNull(newCategory)

if index < 1 or index > UpperBound(Items) + 1 then return newCategory

newTab.Text = txt
newTab.tipText = tipText
newTab.enabled = true
newTab.visible = true
newTab.displaytext = true
newTab.imageindex = 0

if len(image) > 0 then
	newTab.image = image
	newTab.imageindex = _ImageList.AddImage(theme.of_GetTabIcon(index,image,0))
end if

newCategory = create n_cst_ribbonbar_category
newCategory.Event OnInit(this,_ToolTip,_PanelImageList,_SmallImageList,_LargeImageList)
if Not newCategory.Event OnInitData(txt,image) then
	Destroy newCategory
	SetNull(newCategory)
	return newCategory
end if
newTab.Category = newCategory

Painter.CreatePath(1,newTab.PaintPath)
Painter.CreatePath(1,newTab.SelectedPaintPath)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newTab

if index <= _selectedIndex then
	_selectedIndex += 1
end if

_of_UpdateTextSize(index)
_of_UpdatePoints()
of_Redraw(false,false)

if _SelectedIndex = 0 then
	of_Select(index)
end if

return newCategory
end function

public function n_cst_ribbonbar_category of_insertcategory (readonly integer index, readonly string txt, readonly string image);return of_InsertCategory(index,txt,image,"")
end function

public function integer of_Getcount ();return UpperBound(Items)
end function

public function string of_Getimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].image
end function

public function integer of_getindex (readonly n_cst_ribbonbar_category category);int index

if Not IsValidObject(category) then return RetCode.E_INVALID_OBJECT

for index = 1 to UpperBound(Items)
	if Items[index].Category = category then return index
next

return 0
end function

public function integer of_getindex (readonly string txt);int index

for index = 1 to UpperBound(Items)
	if Upper(Items[index].Text) = Upper(txt) then return index
next

return 0
end function

public function integer of_GetSelectedIndex ();return _selectedIndex
end function

public function string of_Gettext (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].text
end function

public function boolean of_Isenabled (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].enabled
end function

public function boolean of_IsHighLighted (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].HighLighted
end function

public function boolean of_Isvisible (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].visible
end function

public function integer of_select (readonly integer index);int oldSelectedIndex

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not Items[index].Visible or Not Items[index].Enabled then return RetCode.FAILED
if index = _selectedIndex then
	if theme.#RibbonCollapsed and Not of_IsPopupMode() then
		_of_UpdateCategoryPosition(index)
		_of_PopupCategory(_selectedIndex)
	end if
	return _selectedIndex
end if

oldSelectedIndex = _selectedIndex

if IsPrevented(Event OnTabSelectionChanging(oldSelectedIndex,index)) then return RetCode.FAILED

_selectedIndex = index

if oldSelectedIndex > 0 then
	Items[oldSelectedIndex].selected=false
	Items[oldSelectedIndex].Category.Event OnHiddenChanged(true)
	_of_DrawItem(oldSelectedIndex,true)
end if

Items[_selectedIndex].selected = true
_of_DrawItem(_selectedIndex,false)

Items[_selectedIndex].Category.Event OnHiddenChanged(false)
_of_UpdateCategoryPosition(_selectedIndex)
Items[_selectedIndex].Category.of_Redraw(false)

of_ScrollTo(_selectedIndex)

Event OnTabSelectionChanged(oldSelectedIndex,_selectedIndex)

if theme.#RibbonCollapsed then
	_of_PopupCategory(_selectedIndex)
end if

return _selectedIndex
end function

public function unsignedlong of_getsafedc ();ulong safeDC

if #LockUpdate then return 0

if of_IsPopupMode() then
	safeDC = _PopupCategory.GetSafeDC()
elseif Not theme.#RibbonCollapsed then
	safeDC = GetSafeDC()
end if

return safeDC
end function

public function boolean of_ispopupmode ();return _PopupCategory.IsPopupMode()
end function

public function unsignedlong of_gethandle ();if of_IsPopupMode() then
	return _PopupCategory.GetHandle()
else
	return #Handle
end if
end function

public function boolean of_Ismultiline (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].MultiLine
end function

private subroutine _of_updatetabpoints ();int	index,nCount
real ll_x
real itemSize
real maxSize
real offsetSize
real fBorderOffsetSize
boolean bFixedFirstTab
RECTF adjustedRect,tabStripRect

adjustedRect = rcTabStrip
tabStripRect = rcTabStrip
_of_AdjustRect(ref tabStripRect,ADJ_BORDER + ADJ_COLLAPSEBUTTON)
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_COLLAPSEBUTTON)

fBorderOffsetSize = P2DY(1)

itemSize = tabStripRect.bottom - adjustedRect.top

nCount = UpperBound(Items)

if theme.#FixedFirstTab and nCount > 0 then
	if Items[1].Visible then
		ll_x=adjustedRect.left
		bFixedFirstTab = true
	else
		ll_x=adjustedRect.left + _ScrollPosition
		_StartPoint = ll_x
	end if
else
	ll_x=adjustedRect.left + _ScrollPosition
	_StartPoint = ll_x
	_EndPoint = _StartPoint
end if

_firstIndex = 0
_lastIndex = 0

for index = 1 to nCount
	if Not Items[index].Visible then continue
	
	if Items[index].imageIndex > 0 then
		if Items[index].DisplayText and Items[index].szText.cx > 0 then
			choose case theme.#TabIconPosition
				case Enums.LEFT
					//Set rcImage
					Items[index].rcImage.left		= ll_x + theme.#TabPadding
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#TabIconSize.cx
					Items[index].rcImage.top		= adjustedRect.top + (itemSize - theme.#TabIconSize.cy) / 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#TabIconSize.cx
					//Set rcText
					Items[index].rcText.left 			= Items[index].rcImage.right + 2
					Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
					Items[index].rcText.top			= adjustedRect.top + (itemSize - Items[index].szText.cy) / 2
					Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
				case Enums.TOP
					if Items[index].szText.cx > theme.#TabIconSize.cx then
						maxSize = Items[index].szText.cx
					else
						maxSize = theme.#TabIconSize.cx
					end if
					//Set rcImage
					Items[index].rcImage.left		= ll_x + theme.#TabPadding + (maxSize - theme.#TabIconSize.cx)/2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#TabIconSize.cx
					Items[index].rcImage.top		= adjustedRect.top + 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#TabIconSize.cy
					//Set rcText
					Items[index].rcText.left 			= ll_x  + theme.#TabPadding + (maxSize - Items[index].szText.cx) / 2
					Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
					Items[index].rcText.top			= Items[index].rcImage.bottom + 2
					if (adjustedRect.bottom - Items[index].rcText.top) > Items[index].szText.cy then
						Items[index].rcText.top 		+= (adjustedRect.bottom - Items[index].rcText.top - Items[index].szText.cy) / 2
					end if
					Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
				case Enums.RIGHT
					//Set rcImage
					Items[index].rcImage.left		= ll_x + theme.#TabPadding + Items[index].szText.cx + 2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#TabIconSize.cx
					Items[index].rcImage.top		= adjustedRect.top + (itemSize - theme.#TabIconSize.cy) / 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#TabIconSize.cx
					//Set rcText
					Items[index].rcText.left 			= ll_x + theme.#TabPadding
					Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
					Items[index].rcText.top			= adjustedRect.top + (itemSize - Items[index].szText.cy) / 2
					Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
				case Enums.BOTTOM
					if Items[index].szText.cx > theme.#TabIconSize.cx then
						maxSize = Items[index].szText.cx
					else
						maxSize = theme.#TabIconSize.cx
					end if
					//Set rcImage
					Items[index].rcImage.left		= ll_x + theme.#TabPadding + (maxSize - theme.#TabIconSize.cx)/2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#TabIconSize.cx
					Items[index].rcImage.top		= adjustedRect.bottom - 2 - theme.#TabIconSize.cy
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#TabIconSize.cy
					//Set rcText
					Items[index].rcText.left 			= ll_x  + theme.#TabPadding + (maxSize - Items[index].szText.cx) / 2
					Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
					Items[index].rcText.top			= adjustedRect.top + 2
					if (Items[index].rcImage.top - 2 - Items[index].rcText.top) > Items[index].szText.cy then
						Items[index].rcText.top 		+= (Items[index].rcImage.top - 2 - Items[index].rcText.top - Items[index].szText.cy) / 2
					end if
					Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
			end choose
		else
			Painter.SetRectEmpty(Items[index].rcText)
			//Set rcImage
			Items[index].rcImage.left		= ll_x + theme.#TabPadding
			Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#TabIconSize.cx
			Items[index].rcImage.top		= adjustedRect.top + (itemSize - theme.#TabIconSize.cy) / 2
			Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#TabIconSize.cy
		end if
	elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
		Painter.SetRectEmpty(Items[index].rcImage)
		//Set rcText
		Items[index].rcText.left 		= ll_x  + theme.#TabPadding
		Items[index].rcText.right 	= Items[index].rcText.left  + Items[index].szText.cx
		Items[index].rcText.top		= adjustedRect.top + (itemSize - Items[index].szText.cy) / 2
		Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
	else
		Painter.SetRectEmpty(Items[index].rcImage)
		Painter.SetRectEmpty(Items[index].rcText)
	end if
	
	//Set rcPaint
	Items[index].rcPaint.left 			= ll_x
	if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
		Items[index].rcPaint.right = Max(Items[index].rcText.right, Items[index].rcImage.right) + theme.#TabPadding
	elseif Not Painter.IsRectEmpty(Items[index].rcText) then
		Items[index].rcPaint.right = Items[index].rcText.right + theme.#TabPadding
	elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
		Items[index].rcPaint.right = Items[index].rcImage.right + theme.#TabPadding
	else
		Items[index].rcPaint.right = Items[index].rcPaint.left + theme.#TabPadding * 2
	end if
	Items[index].rcPaint.top 			= adjustedRect.top
	Items[index].rcPaint.bottom 	= tabStripRect.bottom
	
	if theme.#TabFixedSize then
		if Items[index].rcPaint.right - Items[index].rcPaint.left < theme.#TabMinSize then
			offsetSize = theme.#TabMinSize - (Items[index].rcPaint.right - Items[index].rcPaint.left)
			if Not Painter.IsRectEmpty(Items[index].rcImage) then
				choose case theme.#TabIconPosition
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
			Items[index].rcPaint.right += offsetSize
		end if
	end if
	
	//Set paint path
	if theme.#TabStyle = theme.TBS_OFFICE2007 then
		Painter.ResetPath(Items[index].PaintPath)
		Painter.SetPathFillMode(Items[index].PaintPath,1)
		Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.Left,Items[index].rcPaint.bottom - fBorderOffsetSize,Items[index].rcPaint.Left,Items[index].rcPaint.top + 2)
		Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.Left,Items[index].rcPaint.top,4,4,180,90)
		Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.Left + 2,Items[index].rcPaint.top,Items[index].rcPaint.right - 2 - 1,Items[index].rcPaint.top)
		Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.right - 4 - 1,Items[index].rcPaint.top,4,4,270,90)
		Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.top + 2,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - fBorderOffsetSize)
		Painter.ResetPath(Items[index].SelectedPaintPath)
		Painter.SetPathFillMode(Items[index].SelectedPaintPath,1)
		Painter.AddPathLine(Items[index].SelectedPaintPath,Items[index].rcPaint.Left,Items[index].rcPaint.bottom,Items[index].rcPaint.Left,Items[index].rcPaint.top + 2)
		Painter.AddPathArc(Items[index].SelectedPaintPath,Items[index].rcPaint.Left,Items[index].rcPaint.top,4,4,180,90)
		Painter.AddPathLine(Items[index].SelectedPaintPath,Items[index].rcPaint.Left + 2,Items[index].rcPaint.top,Items[index].rcPaint.right - 2 - 1,Items[index].rcPaint.top)
		Painter.AddPathArc(Items[index].SelectedPaintPath,Items[index].rcPaint.right - 4 - 1,Items[index].rcPaint.top,4,4,270,90)
		Painter.AddPathLine(Items[index].SelectedPaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.top + 2,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom)
	end if
	
	if bFixedFirstTab then
		bFixedFirstTab = false
		Items[index].Hidden = false
		ll_x = Items[index].rcPaint.right + theme.#TabMargin + _ScrollPosition
		_StartPoint = ll_x
		_EndPoint = _StartPoint
		continue
	end if
	
	if Items[index].rcPaint.right <= tabStripRect.left or Items[index].rcPaint.left >= tabStripRect.right then
		Items[index].Hidden = true
	else
		Items[index].Hidden = false
	end if
	
	_EndPoint = Items[index].rcPaint.right
	
	ll_x = _EndPoint + theme.#TabMargin
	
	if _firstIndex = 0 then
		_firstIndex = index
	end if
	_lastIndex = index
next
end subroutine

private subroutine _of_updatepoints ();if #LockUpdate then return
if Not theme.#TabStripBar then return

_of_UpdateCollpaseButtonPoints()
_of_UpdateTabPoints()

if Not _of_AdjustScrollPosition() then
	_of_UpdateScrollBarPoints()
end if
end subroutine

private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly boolean fadeanimation);ulong safeDC
RECTF adjustedRect

if #LockUpdate then return
if Not Visible then return
if Not theme.#TabStripBar then return
if Not ScrollBar.Visible then return

safeDC=GetSafeNcDC()

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_COLLAPSEBUTTON + ADJ_FIXEDTAB)

Painter.IntersectClipRect(safeDC,adjustedRect)
Painter.IntersectClipRect(safeDC,ScrollBar.rcPaint)

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnNcEraseBkgnd(safeDC)

_of_DrawScrollBar(ScrollBar,safeDC)

Painter.SelectClipRgn(safeDC,0)

ulong hUpdateRgn

hUpdateRgn = Painter.CreateRectRgn(ScrollBar.rcPaint)

if FadeAnimation then
	ReleaseDC(safeDC,hUpdateRgn,#FadeTime)
else
	ReleaseDC(safeDC,hUpdateRgn)
end if

Painter.DeleteRgn(hUpdateRgn)
end subroutine

public function string of_gettiptext (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].tiptext
end function

private function boolean _of_adjustscrollposition ();RECTF adjustedRect

if _ScrollPosition = 0 then return false

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_COLLAPSEBUTTON + ADJ_FIXEDTAB)

if _EndPoint < adjustedRect.right and _ScrollPosition < 0 then
	_of_ScrollPosition(adjustedRect.right - _EndPoint)
	return true
end if

return false
end function

private subroutine _of_flashdrawitem (readonly integer index);Uint nFadeTime

if #LockUpdate then return
if Not Visible then return
if Not theme.#TabStripBar then return
if Not Items[index].visible or Items[index].hidden then return
if Not Items[index].Enabled or Items[index].MouseOver or Items[index].Selected then return

nFadeTime = #FadeTime
#FadeTime = #FlashFadeTime

_of_DrawItem(index,true)

#FadeTime = nFadeTime
end subroutine

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation);if FadeAnimation then
	return of_ReleaseDC(hdc,hrgn,#FadeTime)
else
	return of_ReleaseDC(hdc,hrgn,0)
end if
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime);if of_IsPopupMode() then
	return _PopupCategory.of_ReleaseDC(hdc,hrgn,FadeTime)
else
	Painter.SelectClipRgn(hdc,0)
	return ReleaseDC(hdc,hrgn,FadeTime)
end if
end function

public function boolean of_isflashing (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return (Items[index].FlashTime = -1 or Items[index].FlashTime > 0)
end function

public function long of_displaytext (readonly integer index, readonly boolean display);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].DisplayText = display then return RetCode.OK

Items[index].DisplayText = display

if Items[index].Visible then
	_of_UpdatePoints()
	of_Redraw(false,false)
end if

return RetCode.OK
end function

public function long of_displaytextall (readonly boolean display);int index

for index = 1 to UpperBound(Items)
	Items[index].DisplayText = display
next

_of_UpdatePoints()
of_Redraw(false,false)

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

public function long of_getcategory (readonly integer index, ref n_cst_ribbonbar_category category);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

try
	category = Items[index].Category
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(category),RetCode.OK,RetCode.E_INVALID_OBJECT)
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
ITEMDATA emptyItems[]

of_ExitPopupMode(0)

//Remove
for index = UpperBound(Items) to 1 step -1
	Destroy Items[index].Category
	Painter.DeletePath(Items[index].PaintPath)
	Painter.DeletePath(Items[index].SelectedPaintPath)
next

Items = emptyItems

_mouseOverIndex = 0
_selectedIndex = 0
_firstIndex = 0
_lastIndex = 0
_dbclkedIndex = 0
_lastPopupIndex = 0

_ScrollPosition = 0
_StartPoint = 0
_EndPoint = 0
SetNull(_LastScrollPosition)

of_UpdatePoints()

_of_ShowTip(0)

return RetCode.OK
end function

public function long of_setimage (readonly integer index, readonly string image);int newImgIndex
boolean dirty

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].image = image then return RetCode.OK

newImgIndex = _ImageList.AddImage(theme.of_GetTabIcon(index,image,0))
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
		_of_DrawItem(index,false)
	end if
end if

Items[index].Category.Event OnSetImage(image)

return RetCode.OK
end function

public function long of_setmultiline (readonly integer index, readonly boolean multiline);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].MultiLine = multiline then return RetCode.OK

Items[index].MultiLine = multiline

_of_UpdateTextSize(index)

if Items[index].Visible then
	_of_UpdatePoints()
	of_Redraw(false,false)
end if

return RetCode.OK
end function

public function long of_settext (readonly integer index, readonly string txt);SIZEF textOldSize

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].Text = txt then return RetCode.OK

textOldSize = Items[index].szText

Items[index].Text = txt

_of_UpdateTextSize(index)

if Items[index].Visible and Items[index].DisplayText then
	if textOldSize <> Items[index].szText then
		_of_UpdatePoints()
		of_Redraw(false,false)
	else
		_of_DrawItem(index,false)
	end if
end if

Items[index].Category.Event OnSetText(txt)

return RetCode.OK
end function

public function long of_settiptext (readonly integer index, readonly string tiptext);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].tipText = tipText then return RetCode.OK
Items[index].tipText = tipText
return RetCode.OK
end function

public function long of_visible (readonly integer index, readonly boolean bvisible);boolean bLockUpdate

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].Visible = bVisible then return RetCode.OK

bLockUpdate = #LockUpdate
#LockUpdate = true

Items[index].Visible = bVisible
Items[index].Category.Event OnVisibleChanged(bVisible)

if index = _SelectedIndex and Not Items[index].Visible then
	if index = _SelectedIndex then
		of_ExitPopupMode(0)
	end if
	if index = of_SelectNext(index) then
		if index = of_SelectPrevious(index) then
			Items[_SelectedIndex].Selected = false
			_SelectedIndex = 0
		end if
	end if
end if

if _SelectedIndex = 0 and bVisible then
	of_Select(index)
end if

#LockUpdate = bLockUpdate
of_UpdatePoints()

return RetCode.OK
end function

public function long of_redraw (readonly boolean drawclient, readonly boolean fadeanimation);ulong safeDC

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

if DrawClient then
	safeDC=GetSafeDC()
	
	if #Transparent then
		FillParentBkgnd(safeDC)
	end if

	Event OnPaint(safeDC)
	
	if FadeAnimation then
		ReleaseDC(safeDC,0,#FadeTime)
	else
		ReleaseDC(safeDC,0)
	end if
end if

return RetCode.OK
end function

public function long of_redraw (readonly boolean fadeanimation);return of_Redraw(true,fadeAnimation)
end function

private function unsignedlong _of_popupcategory (readonly integer index);ulong rtCode

if Not theme.#RibbonCollapsed then return 0
if index < 1 or index > UpperBound(Items) then return 0
if Not Items[index].Visible or Not Items[index].Enabled then return 0
if _lastPopupIndex = index and Cpu() - _lastPopupTime < 100 then return 0

_PopupCategory.Event OnSetCategory(Items[index].Category)
_of_DrawItem(index,false)

if of_IsPopupMode() then

	_lastPopupIndex = index
	_lastPopupTime = Cpu()
	
	return rtCode
else
	_lastPopupindex = 0
	
	rtCode = _PopupCategory.of_Popup(0,0)
	
	if _lastPopupindex = 0 then	//在弹出期间没有再次进入此函数并修改此值
		_lastPopupIndex = index
	end if
	_lastPopupTime = Cpu()
	
	_of_DrawItem(_lastPopupIndex,true)
end if

return rtCode
end function

public function long of_settiptime (readonly integer index, readonly long tiptime);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
Items[index].TipTime = tipTime
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
boolean bVisible
boolean bLockUpdate
ITEMDATA newItems[]

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

of_ExitPopupMode(0)

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

Destroy Items[index].Category
Painter.DeletePath(Items[index].PaintPath)
Painter.DeletePath(Items[index].SelectedPaintPath)

for i = 1 to UpperBound(Items)
	if i = index then continue
	newItems[UpperBound(newItems) + 1] = Items[i]
next

Items = newItems

if UpperBound(Items) = 0 then
	_selectedIndex = 0
	_ScrollPosition = 0
	_StartPoint = 0
	_EndPoint = 0
	SetNull(_LastScrollPosition)
end if

if bVisible then
	#LockUpdate = bLockUpdate
	of_UpdatePoints()
end if

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

public function integer of_getpreviousvisible (readonly integer index);int i

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

for i = index - 1 to 1 step -1
	if Items[i].Visible then return i
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

private subroutine _of_filltabstripbkgnd (readonly unsignedlong hdc);ulong borderColor,bkColor,transparentColor
RECTF rcPaint

if Not theme.#TabStripBar then return

borderColor = theme.of_GetColor(theme.CLR_BORDER,0)

bkColor	= theme.of_GetColor(theme.CLR_TABSTRIPBKGND,0)
transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,0)

rcPaint = rcWnd
rcPaint.bottom = rcTabStrip.bottom

//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, rcPaint,  transparentColor,false,0) 
end if

Painter.ThemeFill(hdc,rcTabStrip,bkColor,theme.#BkgndOrientation,theme.#TabStripBkgndStyle,0,false,&
											theme.#TabStripBorderStyle,borderColor,0)

if theme.#TabStripBorderStyle = Enums.BS_NONE then
	real fBoderSize
	fBoderSize = P2DY(1)
	Painter.DrawLine(hdc,&
					rcPaint.left,&
					rcTabStrip.bottom - fBoderSize,&
					rcPaint.right,&
					rcTabStrip.bottom - fBoderSize,&
					borderColor,Enums.LS_SOLID,&
					false,fBoderSize)
end if
end subroutine

private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc);ulong textColor
ulong dtparam

textColor	= theme.of_GetTabColor(index,theme.CLR_TEXT,of_GetItemState(index))

dtparam = Painter.DT_EXPANDTABS
if Items[index].MultiLine then
	dtparam += Painter.DT_WORDBREAK
else
	dtparam += Painter.DT_SINGLELINE  + Painter.DT_VCENTER //+ Painter.DT_WORD_ELLIPSIS
end if
choose case theme.#TextAlign
	case Left!
		dtparam += Painter.DT_LEFT
	case Center!
		dtparam += Painter.DT_CENTER
	case Right!
		dtparam += Painter.DT_RIGHT
end choose

if Items[index].Selected and (Not theme.#RibbonCollapsed or (theme.#RibbonCollapsed and Items[index].Category.of_IsPopupMode())) then
	Painter.of_Drawtext(hdc,theme.SelectedFont,Items[index].text,Items[index].rcText,textColor,dtparam)
else
	Painter.of_Drawtext(hdc,theme.Font,Items[index].text,Items[index].rcText,textColor,dtparam)
end if
end subroutine

private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly unsignedlong hdc);ulong borderColor,bkColor,arrowColor,nState
POINTF pt1,pt2,pt3
Constant real ARROWSIZE = 6

if Not Scrollbar.Visible then return

if ScrollBar.MouseOver then nState += Enums.STATE_HOVER
if ScrollBar.MouseDown then nState += Enums.STATE_PRESSED

bkColor = theme.of_GetColor(theme.CLR_SCROLLBARBKGND,nState)
borderColor = theme.of_GetColor(theme.CLR_BORDER,nState)
arrowColor = theme.of_GetColor(theme.CLR_ARROW,nState)

//Fill background
Painter.ThemeFill(hdc,Scrollbar.rcPaint,bkColor,Enums.HORZ,theme.#ItemBkgndStyle,nState,false,&
										Enums.BS_SOLID,borderColor,0)

//Draw arrow
if ScrollBar = ScrollBarRight then		//箭头向右
	pt1.x = Scrollbar.rcPaint.left + (Scrollbar.rcPaint.right - Scrollbar.rcPaint.left - ARROWSIZE / 2) / 2
	pt1.y = Scrollbar.rcPaint.top + (Scrollbar.rcPaint.bottom - Scrollbar.rcPaint.top - ARROWSIZE) / 2
	pt2.x = pt1.x + ARROWSIZE / 2
	pt2.y = pt1.y + ARROWSIZE / 2
	pt3.x = pt1.x
	pt3.y = pt1.y + ARROWSIZE
else						//箭头向左
	pt1.x = Scrollbar.rcPaint.left + (Scrollbar.rcPaint.right - Scrollbar.rcPaint.left - ARROWSIZE / 2) / 2
	pt1.y = Scrollbar.rcPaint.top + (Scrollbar.rcPaint.bottom - Scrollbar.rcPaint.top - ARROWSIZE ) / 2  + ARROWSIZE/2
	pt2.x = pt1.x + ARROWSIZE / 2
	pt2.y = pt1.y - ARROWSIZE / 2
	pt3.x = pt1.x + ARROWSIZE / 2
	pt3.y = pt1.y + ARROWSIZE / 2
end if

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc);long dcState
ulong borderColor,bkColor,bkColor2,nState
real lightenScale = 0
real fLineSize

if Not Items[index].visible or Items[index].Hidden or Items[index].PaintPath = 0 then return

choose case theme.#BkgndStyle
	case Enums.XP
		lightenScale = 0.8
	case Enums.VISTAEMBOSSED,Enums.VISTAORIGINAL
		lightenScale = 0.8
	case Enums.VISTAGLASS
		lightenScale = 1.0
end choose

nState = of_GetItemState(index)
bkColor = theme.of_GetTabColor(index,theme.CLR_BKGND,nState)
borderColor	= theme.of_GetTabColor(index,theme.CLR_BORDER,nState)

choose case theme.#TabStyle
	case theme.TBS_OFFICE2007																											/*---- OFFICE2007 ----*/
		if Items[index].Selected and (Not theme.#RibbonCollapsed or Items[index].Category.of_IsPopupMode()) then
			bkColor2 = ARGBLighten(theme.of_GetCategoryColor(Items[index].Category,theme.CLR_BKGND,0),lightenScale)
			if theme.#TabBkgndStyle = Enums.SOLID then
				Painter.FillPath(hdc,Items[index].SelectedPaintPath,bkColor2,bkColor2,Enums.VERT,false,true,borderColor)
				dcState = Painter.SaveDC(hdc)
				Painter.IntersectClipRect( hdc, Items[index].rcPaint.left,Items[index].rcPaint.top,Items[index].rcPaint.right,Items[index].rcPaint.top + 2)
				Painter.FillPath(hdc,Items[index].SelectedPaintPath,bkColor,bkColor,Enums.VERT,false,true,bkColor)
				Painter.RestoreDC(hdc,dcState)
			else
				if theme.#TabBkgndStyle = Enums.TRANSPARENT  then
					Painter.FillPath(hdc,Items[index].SelectedPaintPath,0,bkColor2,Enums.VERT,false,true,0)
				else
					Painter.FillPath(hdc,Items[index].SelectedPaintPath,bkColor,bkColor2,Enums.VERT,false,true,0)
				end if
				Painter.DrawThemeBorder(hdc,Items[index].SelectedPaintPath,borderColor,theme.#TabBkgndStyle)
			end if
		elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_HIGHLIGHTED) <> 0 or Items[index].flashing then
			if BitAND(nState,Enums.STATE_HOVER) = 0 then
				if Items[index].Flashing then
					bkColor = ARGBLighten(bkColor,0.4)
				end if
			end if
			if theme.#TabBkgndStyle = Enums.XP or theme.#TabBkgndStyle = Enums.VISTAORIGINAL then
				Painter.ThemeFill(hdc,Items[index].PaintPath,bkColor,Enums.VERT,theme.#TabBkgndStyle,nState,true,&
									true,borderColor)
			else
				Painter.ThemeFill(hdc,Items[index].PaintPath,bkColor,Enums.VERT,theme.#TabBkgndStyle,nState,false,&
									true,borderColor)
			end if
		end if
	case theme.TBS_OFFICE2013																											/*---- OFFICE2013 ----*/
		if Items[index].Selected and (Not theme.#RibbonCollapsed or Items[index].Category.of_IsPopupMode()) then
			bkColor2 = ARGBLighten(theme.of_GetCategoryColor(Items[index].Category,theme.CLR_BKGND,0),lightenScale)
			if theme.#TabBkgndStyle = Enums.SOLID then
				Painter.FillRect(hdc,&
					Items[index].rcPaint.left,&
					Items[index].rcPaint.top,&
					Items[index].rcPaint.right,&
					Items[index].rcPaint.bottom + 1,&
					bkColor2,bkColor2,Enums.VERT,false,true,borderColor)
				Painter.FillRect(hdc,&
					Items[index].rcPaint.left,&
					Items[index].rcPaint.top,&
					Items[index].rcPaint.right,&
					Items[index].rcPaint.top + 2,&
					bkColor,bkColor,Enums.VERT,false,false,0)
			else
				if theme.#TabBkgndStyle = Enums.TRANSPARENT then
					Painter.FillRect(hdc,&
						Items[index].rcPaint.left,&
						Items[index].rcPaint.top,&
						Items[index].rcPaint.right,&
						Items[index].rcPaint.bottom,&
						0,bkColor2,Enums.VERT,false,false,0)
				else
					Painter.FillRect(hdc,&
						Items[index].rcPaint.left,&
						Items[index].rcPaint.top,&
						Items[index].rcPaint.right,&
						Items[index].rcPaint.bottom,&
						bkColor,bkColor2,Enums.VERT,false,false,0)
				end if
				RECTF rcSelectedPaint
				Painter.CopyRect(ref rcSelectedPaint,ref Items[index].rcPaint)
				rcSelectedPaint.bottom += 2
				Painter.DrawThemeBorder(hdc,rcSelectedPaint,borderColor,theme.#TabBkgndStyle,Enums.BS_SOLID,0)
			end if
		elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_HIGHLIGHTED) <> 0 or Items[index].flashing then
			if BitAND(nState,Enums.STATE_HOVER) = 0 then
				if Items[index].Flashing then
					bkColor = ARGBLighten(bkColor,0.4)
				end if
			end if
			if theme.#TabBkgndStyle = Enums.XP or theme.#TabBkgndStyle = Enums.VISTAORIGINAL then
				Painter.ThemeFill(hdc,Items[index].rcPaint,bkColor,Enums.VERT,theme.#TabBkgndStyle,nState,true,&
									Enums.BS_SOLID,borderColor,0)
			else
				Painter.ThemeFill(hdc,Items[index].rcPaint,bkColor,Enums.VERT,theme.#TabBkgndStyle,nState,false,&
									Enums.BS_SOLID,borderColor,0)
			end if
		end if
	case theme.TBS_WPS2012																												/*---- WPS2012 ----*/
		fLineSize = P2DX(1)
		if Items[index].Selected and (Not theme.#RibbonCollapsed or Items[index].Category.of_IsPopupMode()) then
			bkColor2 = ARGBLighten(theme.of_GetCategoryColor(Items[index].Category,theme.CLR_BKGND,0),lightenScale)
			Painter.FillRect(hdc,&
				Items[index].rcPaint.left,&
				Items[index].rcPaint.top,&
				Items[index].rcPaint.right,&
				Items[index].rcPaint.bottom - 1,&
				0,bkColor,Enums.VERT,true,false,0)
			Painter.DrawGradientLine(hdc,&
				Items[index].rcPaint.left,&
				Items[index].rcPaint.top,&
				Items[index].rcPaint.left,&
				Items[index].rcPaint.bottom - 1,&
				0,borderColor,Enums.LS_SOLID ,false,false,fLineSize)
			Painter.DrawGradientLine(hdc,&
				Items[index].rcPaint.right - fLineSize,&
				Items[index].rcPaint.top,&
				Items[index].rcPaint.right - fLineSize,&
				Items[index].rcPaint.bottom - 1,&
				0,borderColor,Enums.LS_SOLID ,false,false,fLineSize)
			POINTF pt1,pt2,pt3
			pt1.x = Items[index].rcPaint.left + (Items[index].rcPaint.right - Items[index].rcPaint.left) / 2
			pt1.y = Items[index].rcPaint.bottom - 8
			pt2.x = pt1.x - 6
			pt2.y = Items[index].rcPaint.bottom
			pt3.x = pt1.x + 6
			pt3.y = pt2.y
			Painter.FillTriangle(hdc,pt1,pt2,pt3,bkColor2,bkColor2,Enums.VERT,false,true,borderColor)
		elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_HIGHLIGHTED) <> 0 or Items[index].flashing then
			if BitAND(nState,Enums.STATE_HOVER) = 0 then
				if Items[index].Flashing then
					bkColor = ARGBLighten(bkColor,0.4)
				end if
			end if
			Painter.FillRect(hdc,&
				Items[index].rcPaint.left,&
				Items[index].rcPaint.top + (Items[index].rcPaint.bottom - Items[index].rcPaint.top) / 2,&
				Items[index].rcPaint.right,&
				Items[index].rcPaint.bottom - 1,&
				0,bkColor,Enums.VERT,false,false,0)
			Painter.DrawGradientLine(hdc,&
				Items[index].rcPaint.left,&
				Items[index].rcPaint.top,&
				Items[index].rcPaint.left,&
				Items[index].rcPaint.bottom - 1,&
				0,borderColor,Enums.LS_SOLID ,false,false,fLineSize)
			Painter.DrawGradientLine(hdc,&
				Items[index].rcPaint.right - fLineSize,&
				Items[index].rcPaint.top,&
				Items[index].rcPaint.right - fLineSize,&
				Items[index].rcPaint.bottom - 1,&
				0,borderColor,Enums.LS_SOLID ,false,false,fLineSize)
		end if
	case theme.TBS_WPS2013																												/*---- WPS2013 ----*/
		if Items[index].Selected and (Not theme.#RibbonCollapsed or Items[index].Category.of_IsPopupMode()) then
			Painter.FillRect(hdc,&
				Items[index].rcPaint.left,&
				Items[index].rcPaint.bottom - 4,&
				Items[index].rcPaint.right,&
				Items[index].rcPaint.bottom - 1,&
				bkColor,bkColor,Enums.VERT,true,false,0)
		elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_HIGHLIGHTED) <> 0 or Items[index].flashing then
			if BitAND(nState,Enums.STATE_HOVER) = 0 then
				if Items[index].Flashing then
					bkColor = ARGBLighten(bkColor,0.4)
				end if
			end if
			Painter.FillRect(hdc,&
				Items[index].rcPaint.left,&
				Items[index].rcPaint.bottom - 4,&
				Items[index].rcPaint.right,&
				Items[index].rcPaint.bottom - 1,&
				bkColor,bkColor,Enums.VERT,true,false,0)
		end if
end choose

if Items[index].imageIndex > 0 then
	_ImageList.Draw(Items[index].imageindex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].Enabled)
end if

if Items[index].DisplayText and Items[index].szText.cx>0 then
	_of_DrawItemText(index,hdc)
end if
end subroutine

private subroutine _of_drawitem (integer index, readonly boolean fadeanimation);ulong safeDC
ulong hUpdateRgn
RECTF adjustedRect

if #LockUpdate then return
if Not Visible then return
if Not theme.#TabStripBar then return
if Not Items[index].visible then return
if Items[index].hidden then return

safeDC=GetSafeNcDC()

adjustedRect = rcTabStrip
if theme.#FixedFirstTab and index = 1 then
	_of_AdjustRect(ref adjustedRect, ADJ_COLLAPSEBUTTON)
else
	_of_AdjustRect(ref adjustedRect, ADJ_COLLAPSEBUTTON + ADJ_FIXEDTAB)
end if

Painter.IntersectClipRect(safeDC,adjustedRect)
Painter.IntersectClipRect(safeDC,Items[index].rcPaint)

if ScrollBarLeft.Visible then
	Painter.ExcludeClipRect(safeDC,ScrollBarLeft.rcPaint)
end if
if ScrollBarRight.Visible then
	adjustedRect.left = ScrollBarRight.rcPaint.left
	Painter.ExcludeClipRect(safeDC,adjustedRect)
end if

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnNcEraseBkgnd(safeDC)

_of_DrawItem(index,safeDC)

Painter.SelectClipRgn(safeDC,0)

hUpdateRgn = Painter.CreateRectRgn(Items[index].rcPaint)

if FadeAnimation then
	ReleaseDC(safeDC,hUpdateRgn,#FadeTime)
else
	ReleaseDC(safeDC,hUpdateRgn)
end if

Painter.DeleteRgn(hUpdateRgn)
end subroutine

public function any of_getdata (readonly integer index);Any data

if index < 1 or index > UpperBound(Items) then return data

return Items[index].Category.#Data
end function

public function long of_setdata (readonly integer index, readonly any data);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[index].Category.#Data = data

return RetCode.OK
end function

public function string of_gettag (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].Category.#Tag
end function

public function long of_settag (readonly integer index, readonly string stag);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[index].Category.#Tag = stag

return RetCode.OK
end function

public function long of_exitpopupmode (readonly unsignedlong exitcode);if _PopupCategory.ClosePopup(exitcode,true) then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

private subroutine _of_trackncmousehover (readonly boolean track, readonly long hovertime);TRACKMOUSEEVENT tme

tme.cbsize = 16
tme.dwflags = Win32.TME_HOVER + Win32.TME_NONCLIENT
tme.hwndtrack = #Handle
tme.dwhovertime = hoverTime

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(tme)

end subroutine

private subroutine _of_trackmousehover (readonly boolean track, readonly long hovertime);TRACKMOUSEEVENT tme

tme.cbsize = 16
tme.dwflags = Win32.TME_HOVER
tme.hwndtrack = #Handle
tme.dwhovertime = hoverTime

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(tme)
end subroutine

public function long of_findcategorybytag (readonly string stag, ref n_cst_ribbonbar_category foundcategory);int index
boolean bFound
n_cst_ribbonbar_category category

if Len(sTag) = 0 then return RetCode.E_INVALID_ARGUMENT

for index = 1 to UpperBound(Items)
	if Items[index].category.#Tag = sTag then
		category = Items[index].category
		bFound = true
		exit
	end if
next

if bFound then
	try
		foundcategory = category
	catch(Throwable ex)
		return RetCode.E_INVALID_ARGUMENT
	end try
	return iif(IsValidObject(foundcategory),RetCode.OK,RetCode.E_INVALID_OBJECT)
else
	return RetCode.E_OBJECT_NOT_FOUND
end if
end function

public function long of_finditembytag (readonly string stag, ref n_cst_ribbonbar_baseitem founditem);int index
boolean bFound

if Len(sTag) = 0 then return RetCode.E_INVALID_ARGUMENT

for index = 1 to UpperBound(Items)
	if IsSucceeded(Items[index].category.of_FindItemByTag(sTag,ref foundItem)) then
		bFound = true
		exit
	end if
next

if bFound then
	return iif(IsValidObject(foundItem),RetCode.OK,RetCode.E_INVALID_OBJECT)
else
	return RetCode.E_OBJECT_NOT_FOUND
end if
end function

public function long of_finditembytext (readonly string txt, ref n_cst_ribbonbar_baseitem founditem);int index
boolean bFound

if Len(txt) = 0 then return RetCode.E_INVALID_ARGUMENT

for index = 1 to UpperBound(Items)
	if IsSucceeded(Items[index].category.of_FindItemByText(txt,ref foundItem)) then
		bFound = true
		exit
	end if
next

if bFound then
	return iif(IsValidObject(foundItem),RetCode.OK,RetCode.E_INVALID_OBJECT)
else
	return RetCode.E_OBJECT_NOT_FOUND
end if
end function

public function long of_findpanelbytag (readonly string stag, ref n_cst_ribbonbar_panel foundpanel);int index
boolean bFound

if Len(sTag) = 0 then return RetCode.E_INVALID_ARGUMENT

for index = 1 to UpperBound(Items)
	if IsSucceeded(Items[index].category.of_FindPanelByTag(sTag,ref foundPanel)) then
		bFound = true
		exit
	end if
next

if bFound then
	return iif(IsValidObject(foundPanel),RetCode.OK,RetCode.E_INVALID_OBJECT)
else
	return RetCode.E_OBJECT_NOT_FOUND
end if
end function

public function long of_updatepoints (readonly boolean updateclient);boolean bRedraw

if #LockUpdate then return RetCode.FAILED

if theme.#TabStripBar then
	_of_UpdatePoints()
	bRedraw = true
end if

if updateClient then
	if _selectedIndex > 0 then
		_of_UpdateCategoryPosition(_selectedIndex)
	end if
	bRedraw = true
end if

if bRedraw then
	of_Redraw(true,false)
end if

return RetCode.OK
end function

public function long of_updatepoints ();return of_UpdatePoints(true)
end function

public function long of_scrollto (readonly integer index, readonly long flag);real scrollSize
RECTF adjustedRect

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not theme.#TabStripBar then return RetCode.FAILED
if Not Items[index].visible then return RetCode.FAILED
if Not ScrollBarLeft.Visible and Not ScrollBarRight.Visible then return RetCode.FAILED
if theme.#FixedFirstTab and index = 1 then return RetCode.FAILED

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_COLLAPSEBUTTON + ADJ_FIXEDTAB)

choose case flag
	case Enums.SF_FORWARD
		if ScrollBarRight.Visible then
			if index = _lastIndex then
				if Items[index].rcPaint.Right > adjustedRect.right then
					scrollSize = adjustedRect.right - Items[index].rcPaint.Right
				end if
			else
				if Items[index].rcPaint.Right > ScrollBarRight.rcPaint.Left - 1 then
					scrollSize = (ScrollBarRight.rcPaint.Left - 1) - Items[index].rcPaint.Right
				end if
			end if
		end if
	case Enums.SF_BACKWARD
		if ScrollBarLeft.Visible then
			if index = _firstIndex then
				if Items[index].rcPaint.Left < adjustedRect.left then
					scrollSize = adjustedRect.left - Items[index].rcPaint.Left
				end if
			else
				if Items[index].rcPaint.Left < ScrollBarLeft.rcPaint.Right + 1 then
					scrollSize = (ScrollBarLeft.rcPaint.Right + 1) - Items[index].rcPaint.Left
				end if
			end if
		end if
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

if scrollSize <> 0 then
	if #SmoothScroll then
		_smoothScrollSize = scrollSize
		Timer.Start(TM_SCROLL,TMI_SCROLL)
	else
		_of_ScrollPosition(scrollSize)
		of_Redraw(false,false)
		if _MouseLeaveTracked then
			long hittestCode
			RECTF wndRect
			POINTF pt
			
			Painter.GetWindowRect(#Handle,ref wndRect)
			Painter.GetCursorPos(ref pt)
			
			hittestCode = Event OnNcHitTest(pt.x - wndRect.left,pt.y - wndRect.top)
			Event OnNcMouseMove(hittestCode,pt.x - wndRect.left,pt.y - wndRect.top)
		end if
	end if
	SetNull(_LastScrollPosition)
	return RetCode.OK
else
	if _smoothScrollSize > 0 then
		_smoothScrollSize = 0
		Timer.Stop(TM_SCROLL)
		SetNull(_LastScrollPosition)
	end if
	return RetCode.FAILED
end if
end function

public function long of_scrollto (readonly integer index);long rtCode

if theme.#FixedFirstTab and index = 1 then return RetCode.FAILED

rtCode = RetCode.FAILED
if ScrollBarRight.Visible then
	rtCode = of_ScrollTo(index,Enums.SF_FORWARD)
end if
if rtCode = RetCode.FAILED then
	if ScrollBarLeft.Visible then
		rtCode = of_ScrollTo(index,Enums.SF_BACKWARD)
	end if
end if

return rtCode
end function

private subroutine _of_drawcollapsebutton (readonly unsignedlong hdc);ulong borderColor,bkColor,nState

if Not CollapseButton.visible then return

if CollapseButton.MouseOver then nState += Enums.STATE_HOVER
if CollapseButton.MouseDown then nState += Enums.STATE_PRESSED

if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
	bkColor = theme.of_GetColor(theme.CLR_SYSBTNBKGND,nState)
	borderColor = theme.of_GetColor(theme.CLR_SYSBTNBORDER,nState)
	Painter.ThemeFill(hdc,CollapseButton.rcPaint,bkColor,theme.#BkgndOrientation,theme.#TabBkgndStyle,nState,false,&
						theme.#ItemBorderStyle,borderColor,theme.#ItemRoundSize)
end if

// Draw image
if CollapseButton.MouseDown then
	_ArrowImageList.Draw(CollapseButton.imageIndex,hdc, CollapseButton.rcImage.left ,CollapseButton.rcImage.top + 1,false)
else
	_ArrowImageList.Draw(CollapseButton.imageIndex,hdc, CollapseButton.rcImage.left ,CollapseButton.rcImage.top,false)
end if
end subroutine

private subroutine _of_drawcollapsebutton (readonly boolean fadeanimation);ulong safeDC
ulong hUpdateRgn
RECTF adjustedRect

if #LockUpdate then return
if Not Visible then return
if Not theme.#TabStripBar then return
if Not CollapseButton.visible then return

safeDC=GetSafeNcDC()

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect, ADJ_BORDER)

Painter.IntersectClipRect(safeDC,adjustedRect)
Painter.IntersectClipRect(safeDC,CollapseButton.rcPaint)

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnNcEraseBkgnd(safeDC)

_of_DrawCollapseButton(safeDC)

Painter.SelectClipRgn(safeDC,0)

hUpdateRgn = Painter.CreateRectRgn(CollapseButton.rcPaint)

if FadeAnimation then
	ReleaseDC(safeDC,hUpdateRgn,#FadeTime)
else
	ReleaseDC(safeDC,hUpdateRgn)
end if

Painter.DeleteRgn(hUpdateRgn)
end subroutine

private subroutine _of_showtip (readonly integer index);boolean bShow
RECTF scRect
SIZEF toolSize
POINTF pt

if Not #ToolTip then return
if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _MouseCaptured then return

_ToolTip.TrackActivate(#Handle,_TTID,false)

choose case index
	case IDX_COLLAPSEBUTTON
		_ToolTip.UpdateTipText(#Handle,_TTID,CollapseButton.TipText)
		_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,-1)
		bShow = true
	case else
		if index > 0 and index <= UpperBound(Items) then
			if Items[index].tipText <> "" then
				_ToolTip.UpdateTipText(#Handle,_TTID,Items[index].tipText)
				if Items[index].TipTime > 0 then
					_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,Items[index].TipTime)
				else
					_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,-1)
				end if
				bShow = true
			end if
		end if
end choose

if bShow then
	Painter.GetScreenRect(ref scRect)
	Painter.GetCursorPos(ref pt)

	_ToolTip.GetBubbleSize(#Handle,_TTID,ref toolSize.cx,ref toolSize.cy)
	
	if pt.x + toolSize.cx  > scRect.right then
		_ToolTip.TrackPosition( 0,scRect.right -  toolSize.cx,pt.y + 16)
	else
		_ToolTip.TrackPosition( 0,pt.x,pt.y + 16)
	end if
	
	_ToolTip.TrackActivate(#Handle,_TTID,true)
end if
end subroutine

private subroutine _of_updatecollpasebuttonpoints ();real ll_x
real itemSize
RECTF tabStripRect

if Not CollapseButton.Visible then return

tabStripRect = rcTabStrip
_of_AdjustRect(ref tabStripRect,ADJ_BORDER)

ll_x = tabStripRect.Right
itemSize = tabStripRect.bottom - tabStripRect.top

//Set rcImage
CollapseButton.rcImage.left 		= ll_x - 2 - ARROWICONSIZE
CollapseButton.rcImage.right 	= CollapseButton.rcImage.left + ARROWICONSIZE
CollapseButton.rcImage.top 		= tabStripRect.top + (itemSize - ARROWICONSIZE) / 2
CollapseButton.rcImage.bottom 	= CollapseButton.rcImage.top + ARROWICONSIZE
//Set rcPaint
CollapseButton.rcPaint.left 		= CollapseButton.rcImage.left - 2
CollapseButton.rcPaint.right 		= ll_x
CollapseButton.rcPaint.top 		= CollapseButton.rcImage.top - 2
CollapseButton.rcPaint.bottom 	= CollapseButton.rcImage.bottom + 2
end subroutine

private function integer _of_getfirstscrollableindex ();if theme.#FixedFirstTab then
	return 2
else
	return 1
end if
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

public function integer of_getindexbytag (readonly string stag);int index

for index = 1 to UpperBound(Items)
	if Items[index].Category.#Tag = stag then return index
next

return 0
end function

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if BitAND(flags,ADJ_BORDER) > 0 then
	if theme.#TabStripBorderStyle <> Enums.BS_NONE then
		fBorderSize = P2DX(1)
		adjRect.left += fBorderSize
		adjRect.top += fBorderSize
		adjRect.right -= fBorderSize
	end if
end if

if BitAND(flags,ADJ_BORDERMARGIN) >0 then
	adjRect.left += theme.#TabStripBorderMargin.left
	adjRect.top += theme.#TabStripBorderMargin.top
	adjRect.right -= theme.#TabStripBorderMargin.right
end if

if BitAND(flags,ADJ_COLLAPSEBUTTON) > 0 then
	if CollapseButton.Visible then
		adjRect.Right -= CollapseButton.rcPaint.right - CollapseButton.rcPaint.left
	end if
end if

if BitAND(flags,ADJ_FIXEDTAB) > 0 and theme.#FixedFirstTab then
	if UpperBound(Items) > 0 then
		if Items[1].Visible then
			adjRect.Left = Items[1].rcPaint.right + theme.#TabMargin
		end if
	end if
end if
end subroutine

private subroutine _of_fillbkgnd (readonly unsignedlong hdc, ref rectf rcpaint, readonly n_cst_ribbonbar_category category);ulong bkColor,borderColor,transparentColor
RECTF rcBkgnd

if IsValidObject(category) then
	transparentColor = theme.of_GetCategoryColor(category,theme.CLR_TRANSPARENT,0)
	bkColor = theme.of_GetCategoryColor(category,theme.CLR_BKGND,0)
	borderColor = theme.of_GetCategoryColor(category,theme.CLR_BORDER,0)
else
	transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,0)
	bkColor = theme.of_GetColor(theme.CLR_BKGND,0)
	borderColor = theme.of_GetColor(theme.CLR_BORDER,0)
end if

//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, rcPaint, transparentColor, false,0) 
end if

rcBkgnd = rcPaint
if theme.#TabStripBar then
	rcBkgnd.top -= 2
end if

if theme.#BorderShadow and theme.#ShadowSize > 0 then
	rcBkgnd.bottom -= theme.#ShadowSize
	if IsValidObject(category) then
		if Not category.of_IsPopupMode() then
			Painter.FillRect( hdc, rcPaint.left,rcBkgnd.bottom,rcPaint.right,rcPaint.bottom,  ToARGB(128,ToRGB(borderColor)),  0,Enums.VERT,false,false,0)
		end if
	else
		Painter.FillRect( hdc, rcPaint.left,rcBkgnd.bottom,rcPaint.right,rcPaint.bottom,  ToARGB(128,ToRGB(borderColor)),  0,Enums.VERT,false,false,0)
	end if
end if

Painter.ThemeFill(hdc,rcBkgnd,bkColor,theme.#BkgndOrientation,theme.#BkgndStyle,0,false,Enums.BS_SOLID,borderColor,0)
end subroutine

private subroutine _of_scrollposition (readonly real scrollsize);int index,nCount
real scrollPosition
ulong matrix
RECTF adjustedRect,tabStripRect

if scrollSize = 0 then return

tabStripRect = rcTabStrip
adjustedRect = rcTabStrip
_of_AdjustRect(ref tabStripRect,ADJ_BORDER + ADJ_COLLAPSEBUTTON + ADJ_FIXEDTAB)
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_COLLAPSEBUTTON + ADJ_FIXEDTAB)

scrollPosition = _ScrollPosition

if scrollSize > 0 then		//Scroll to left
	if _StartPoint + scrollSize < adjustedRect.left then
		_ScrollPosition += scrollSize
	else
		_ScrollPosition = 0
	end if
elseif scrollSize < 0 then	//Scroll to right
	if adjustedRect.right - _EndPoint < scrollSize then
		_ScrollPosition += scrollSize
	else
		_ScrollPosition += adjustedRect.right - _EndPoint 
	end if
end if

if _ScrollPosition <> scrollPosition then
	scrollPosition = _ScrollPosition - scrollPosition
	_StartPoint += scrollPosition
	_EndPoint += scrollPosition
	_of_UpdateScrollBarPoints()
	
	if theme.#TabStyle = theme.TBS_OFFICE2007 then
		Painter.CreateMatrix(ref matrix)
		Painter.TranslateMatrix(matrix,scrollPosition,0,0)
	end if
	
	nCount = UpperBound(Items)
	for index = _of_GetFirstScrollableIndex() to nCount
		if Not Items[index].visible then continue
		if Not Painter.IsRectEmpty(Items[index].rcImage) then
			Painter.OffsetRect(Items[index].rcImage,scrollPosition,0 )
		end if
		if Not Painter.IsRectEmpty(Items[index].rcText) then
			Painter.OffsetRect(Items[index].rcText,scrollPosition ,0)
		end if
		if Not Painter.IsRectEmpty(Items[index].rcPaint) then
			Painter.OffsetRect(Items[index].rcPaint,scrollPosition,0 )
			if Items[index].rcPaint.right <= tabStripRect.left or Items[index].rcPaint.left >= tabStripRect.right then
				Items[index].Hidden = true
			else
				Items[index].Hidden = false
			end if
		end if
		if matrix > 0 then
			Painter.TransformPath(Items[index].PaintPath,matrix)
			Painter.TransformPath(Items[index].SelectedPaintPath,matrix)
		end if
	next
	if matrix > 0 then
		Painter.DeleteMatrix(matrix)
	end if
end if
end subroutine

public function integer of_indexfrompoint (readonly real xpos, readonly real ypos);int index,nCount,nStartIndex
RECTF tabStripRect

if Not theme.#TabStripBar then return 0
if Not Painter.PtInRect(rcTabStrip,xpos,ypos) then return 0

if ScrollBarLeft.Visible then
	if Painter.PtInRect(ScrollBarLeft.rcPaint,xpos,ypos) then
		return IDX_SCROLLBARLEFT
	end if
end if

if ScrollBarRight.Visible then
	if Painter.PtInRect(ScrollBarRight.rcPaint,xpos,ypos) then
		return IDX_SCROLLBARRIGHT
	end if
end if

if CollapseButton.Visible then
	if Painter.PtInRect(CollapseButton.rcPaint,xpos,ypos) then
		return IDX_COLLAPSEBUTTON
	end if
end if

nCount = UpperBound(Items)
if theme.#FixedFirstTab and nCount > 0 then
	if Items[1].Visible and Items[1].Enabled and Not Items[1].Hidden then
		if Painter.PtInRect(Items[1].rcPaint,xpos,ypos) then
			return 1
		end if
	end if
	nStartIndex = 2
else
	nStartIndex = 1
end if

tabStripRect = rcTabStrip
_of_AdjustRect(ref tabStripRect,ADJ_BORDER + ADJ_COLLAPSEBUTTON + ADJ_FIXEDTAB)

if Painter.PtInRect(tabStripRect,xpos,ypos) then
	if _mouseOverIndex >= nStartIndex then
		if Items[_mouseOverIndex].Visible and Items[_mouseOverIndex].Enabled and Not Items[_mouseOverIndex].Hidden then
			if Painter.PtInRect(Items[_mouseOverIndex].rcPaint,xpos,ypos) then
				return _mouseOverIndex
			end if
		end if
	end if
	for index = nStartIndex to nCount
		if index = _mouseOverIndex then continue
		if Not Items[index].visible or Items[index].Hidden or Not Items[index].enabled then continue
		if Painter.PtInRect(Items[index].rcPaint,xpos,ypos) then
			return index
		end if
	next
end if

return 0
end function

private function real _of_gettabstripsize ();if theme.#TabStripBar then
	return theme.#TabStripSize
else
	return 0
end if
end function

on u_cst_ribbonbar.create
call super::create
this.theme=create theme
this.timer=create timer
end on

on u_cst_ribbonbar.destroy
call super::destroy
destroy(this.theme)
destroy(this.timer)
end on

event oninit;call super::oninit;_ImageList = Create n_imagelist
_PanelImageList = Create n_imagelist
_SmallImageList = Create n_imagelist
_LargeImageList = Create n_imagelist
_ArrowImageList = Create n_imagelist

_ImageList.ShareImage(true)
_PanelImageList.ShareImage(true)
_SmallImageList.ShareImage(true)
_LargeImageList.ShareImage(true)
_ArrowImageList.ShareImage(true)

_ImageList.SetImageSize(theme.#TabIconSize.cx,theme.#TabIconSize.cy)
_PanelImageList.SetImageSize(theme.#PanelIconSize.cx,theme.#PanelIconSize.cy)
_SmallImageList.SetImageSize(theme.#SmallIconSize.cx,theme.#SmallIconSize.cy)
_LargeImageList.SetImageSize(theme.#LargeIconSize.cx,theme.#LargeIconSize.cy)
_ArrowImageList.SetImageSize(ARROWICONSIZE,ARROWICONSIZE)

_ArrowImageList.AddImage(theme.of_GetIcon(ICO_COLLAPSE,0))
_ArrowImageList.AddImage(theme.of_GetIcon(ICO_EXPAND,0))

Painter.CreatePen(0,1,2,ref _outlinePen)

_ToolTip = Create n_tooltip
_ToolTip.CreateToolTip(#Handle)
_TTID = _ToolTip.AddTool(#Handle,false,/*Win32.TTF_IDISHWND +*/ Win32.TTF_TRANSPARENT + Win32.TTF_TRACK + Win32.TTF_ABSOLUTE)

_PopupCategory = Create n_cst_ribbonbar_popupcategory
_PopupCategory.Event OnInit(this)

SetNull(_LastScrollPosition)

CollapseButton.Visible = theme.#CollapseButton
CollapseButton.ImageIndex = 1
CollapseButton.TipText = I18N(Enums.I18N_CAT_RIBBONBAR,TIP_COLLAPSE)

UpdateFrame()
end event

event onuninit;call super::onuninit;int index

for index = UpperBound(Items) to 1 step -1
	Destroy Items[index].Category
	Painter.DeletePath(Items[index].PaintPath)
	Painter.DeletePath(Items[index].SelectedPaintPath)
next

Painter.DeletePen(_outlinePen)

Destroy _PopupCategory
Destroy _ImageList
Destroy _PanelImageList
Destroy _SmallImageList
Destroy _LargeImageList
Destroy _ArrowImageList

if _TTID > 0 then
	_ToolTip.DelTool(#Handle,_TTID)
end if
Destroy _ToolTip
Timer.StopAll()
end event

type uo_logo from u_cst_canvas`uo_logo within u_cst_ribbonbar
string tag = "RibbonBar"
end type

type theme from n_cst_ribbonbar_theme within u_cst_ribbonbar descriptor "pb_nvo" = "true" 
end type

on theme.create
call super::create
end on

on theme.destroy
call super::destroy
end on

event ongetcolor;call super::ongetcolor;Parent.Event OnGetColor(colorFlag,state,ref color)
end event

event ongetitemcolor;call super::ongetitemcolor;Parent.Event OnGetItemColor(item,colorFlag,state,ref color)
end event

event onthemechanged;call super::onthemechanged;int index
boolean dirty,bFrameChanged,categoryEvent

choose case eventFlag
	case EVT_THEME
		dirty = true
		bFrameChanged = true
		categoryEvent = true
		_ScrollPosition = 0
	case EVT_BORDERSTYLE
		dirty = true
		bFrameChanged = true
	case EVT_TABSTRIPBORDERSTYLE
		dirty = true
		bFrameChanged = true
	case EVT_RIBBONSTYLE
		categoryEvent = true
	case EVT_TABSTYLE
		dirty = true
	case EVT_TEXTALIGN
		dirty = true
	case EVT_TABICONPOSITION
		_of_UpdateTextSize()
		dirty = true
	case EVT_TABSTRIPBAR
		dirty = true
		bFrameChanged = true
		_ScrollPosition = 0
	case EVT_COLLAPSEBUTTON
		dirty = true
		CollapseButton.Visible = #CollapseButton
	case EVT_RIBBONCOLLAPSED
		real ribbonbarHeight
		if theme.#RibbonCollapsed then
			_LastRibbonHeight = rcWnd.bottom
			ribbonbarHeight = _of_GetTabStripSize()
			CollapseButton.ImageIndex = 2
			CollapseButton.TipText = I18N(Enums.I18N_CAT_RIBBONBAR,TIP_EXPAND)
		else
			ribbonbarHeight = _LastRibbonHeight
			if of_IsPopupMode() then
				_PopupCategory.ClosePopup(0,true)
			end if
			CollapseButton.ImageIndex = 1
			CollapseButton.TipText = I18N(Enums.I18N_CAT_RIBBONBAR,TIP_COLLAPSE)
		end if
		Win32.SetWindowPos(#Handle,0,0,0,D2PX(rcWnd.right),D2PY(ribbonbarHeight),Win32.SWP_NOACTIVATE+ Win32.SWP_NOMOVE + Win32.SWP_NOZORDER)
	case EVT_BORDERSHADOW
		categoryEvent = true
	case EVT_TABICONSIZE
		_of_UpdateTextSize()
		_ImageList.SetImageSize(#TabIconSize.cx,#TabIconSize.cy)
		dirty = true
	case EVT_PANELBORDERSTYLE
		categoryEvent = true
	case EVT_ITEMBORDERSTYLE
		categoryEvent = true
	case EVT_PANELICONSIZE
		categoryEvent = true
		_PanelImageList.SetImageSize(#PanelIconSize.cx,#PanelIconSize.cy)
	case EVT_SMALLICONSIZE
		categoryEvent = true
		_SmallImageList.SetImageSize(#SmallIconSize.cx,#SmallIconSize.cy)
	case EVT_LARGEICONSIZE
		categoryEvent = true
		_LargeImageList.SetImageSize(#LargeIconSize.cx,#LargeIconSize.cy)
	case EVT_TABMINSIZE
		if #TabFixedSize then
			dirty = true
		end if
	case EVT_FIXEDFIRSTTAB
		dirty = true
	case EVT_TABFIXEDSIZE
		dirty = true
	case EVT_TABSTRIPSIZE
		dirty = true
		bFrameChanged = true
	case EVT_TABMARGIN
		dirty = true
	case EVT_TABPADDING
		dirty = true
	case EVT_PANELMARGIN
		categoryEvent = true
	case EVT_SHADOWSIZE
		categoryEvent = true
	case EVT_BORDERMARGIN
		categoryEvent = true
	case EVT_TABSTRIPBORDERMARGIN
		dirty = true
		bFrameChanged = true
	case EVT_TABSTRIPOFFSET
		dirty = true
		bFrameChanged = true
	case EVT_FONT
		_of_UpdateTextSize()
		dirty = true
	case EVT_SELECTEDFONT
		_of_UpdateTextSize()
		dirty = true
end choose

if dirty then
	if bFrameChanged then
		_of_UpdateTextSize()
		UpdateFrame()
	else
		_of_UpdatePoints()
		of_Redraw(false,false)
	end if
elseif Not categoryEvent then
	of_Redraw(true,true)
end if

if categoryEvent then
	for index = 1 to UpperBound(Items)
		Items[index].Category.Event OnThemeChanged(eventFlag)
	next
end if

if of_IsPopupMode() then
	_PopupCategory.Event OnThemeChanged(eventFlag)
end if

Parent.Event OnThemeChanged(eventFlag)
end event

event ongetpanelcolor;call super::ongetpanelcolor;Parent.Event OnGetPanelColor(panel,colorFlag,state,ref color)
end event

event ongetcategorycolor;call super::ongetcategorycolor;Parent.Event OnGetCategoryColor(category,colorFlag,state,ref color)
end event

event ongettabcolor;call super::ongettabcolor;Parent.Event OnGetTabColor(index,colorFlag,state,ref color)
end event

event ongettoolbaritemcolor;call super::ongettoolbaritemcolor;Parent.Event OnGetToolBarItemColor(toolbar,index,colorFlag,state,ref color)
end event

type timer from n_timer within u_cst_ribbonbar descriptor "pb_nvo" = "true" 
end type

event ontimer;int index

if id = TM_SCROLL then
	real scrollSize
	real offsetSize
	
	if _smoothScrollSize = 0 or (Not ScrollBarLeft.Visible and Not ScrollBarRight.Visible) then
		_smoothScrollSize = 0
		return false
	end if
	
	if _smoothScrollSize > 0 and ScrollBarLeft.Visible then
		scrollSize = Ceiling(_smoothScrollSize / 10) + 2
		if _smoothScrollSize - scrollSize < 0 then
			scrollSize = _smoothScrollSize
		end if
		_smoothScrollSize -= scrollSize
	end if
	
	if _smoothScrollSize < 0 and ScrollBarRight.Visible then
		scrollSize = Ceiling(_smoothScrollSize / 10) - 2
		if _smoothScrollSize - scrollSize > 0 then
			scrollSize = _smoothScrollSize
		end if
		_smoothScrollSize -= scrollSize
	end if
	
	if scrollSize <> 0 then
		_of_ScrollPosition(scrollSize)
		of_Redraw(false,false)
	end if
	
	if (_smoothScrollSize = 0 or scrollSize = 0) and _MouseLeaveTracked then
		long hittestCode
		RECTF wndRect
		POINTF pt
		
		_smoothScrollSize = 0
		
		Painter.GetWindowRect(#Handle,ref wndRect)
		Painter.GetCursorPos(ref pt)
		
		hittestCode = Event OnNcHitTest(pt.x - wndRect.left,pt.y - wndRect.top)
		Event OnNcMouseMove(hittestCode,pt.x - wndRect.left,pt.y - wndRect.top)
		//Stop timer
		return false
	end if
	
	return true
elseif id = TM_FLASH then
	boolean bContinue
	for index = 1 to UpperBound(Items)
		if Items[index].FlashTime = 0 then continue
		if Items[index].FlashTime > 0 then
			Items[index].FlashTime -= #FlashFadeTime
			if Items[index].FlashTime < 0 then
				Items[index].FlashTime = 0
			end if
		end if
		Items[index].flashing = (Not Items[index].flashing and Items[index].FlashTime <> 0)
		_of_FlashDrawItem(index)
		if Items[index].FlashTime <> 0 then
			bContinue = true
		end if
	next
	return bContinue
elseif id = TM_CATEGORYSCROLL and _selectedIndex > 0 then
	if Items[_selectedIndex].Visible then
		return Items[_selectedIndex].Category.Event OnTimer(id)
	end if
end if

return false
end event

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

