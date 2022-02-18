$PBExportHeader$u_cst_buttonlistbar.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_buttonlistbar from u_cst_canvas
end type
type itemdata from structure within u_cst_buttonlistbar
end type
type theme from n_cst_buttonlistbar_theme within u_cst_buttonlistbar
end type
type timer from n_timer within u_cst_buttonlistbar
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
	any		data
	string		tag
	sizef		sztext
	rectf		rctext
	rectf		rcimage
	rectf		rcpaint
end type

global type u_cst_buttonlistbar from u_cst_canvas
integer width = 608
integer height = 1464
boolean #fadeanimation = true
event onmouseleave ( )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event type long onpaint ( unsignedlong hdc )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onmousehover ( unsignedlong vkey,  real xpos,  real ypos )
event type long onmousewheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event type long onmousehwheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event onbuttonselectionchanged ( integer oldindex,  integer newindex )
event type long onbuttonselectionchanging ( integer oldindex,  integer newindex )
event onbuttonmouseenter ( integer index,  real xpos,  real ypos )
event onbuttonmousemove ( integer index,  real xpos,  real ypos )
event onbuttonmouseleave ( integer index )
event ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type long onwindowsize ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event oncapturechanged ( )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event type long onerasebkgnd ( unsignedlong hdc )
theme theme
timer timer
end type
global u_cst_buttonlistbar u_cst_buttonlistbar

type variables
/*--- Constants ---*/
Public:
//Indexes
Constant Int IDX_SCROLLBARUP		= -1
Constant Int IDX_SCROLLBARDOWN	= -2

/*--- Properties ---*/
Public:
Uint		#FlashFadeTime	= 1500		//ms
Boolean	#ToolTip 			= false
Boolean	#AutoScroll			= false 		//当鼠标进入ScrollBar时自动滚动
Boolean	#SmoothScroll		= false 		//平滑滚动效果

/*--- Implementation ---*/
Private:
n_imagelist 	_ImageList
n_tooltip 		_ToolTip
ITEMDATA	Items[]
PAINTPANE	ScrollBarUp
PAINTPANE	ScrollBarDown
RECTF		 	rcClient

Ulong _TTID	

Int		_mouseOverIndex 		= 0
Int		_selectedIndex			= 0
Int		_firstIndex				= 0
Int		_lastIndex				= 0
Real	_ScrollPosition 			= 0
Real	_StartPoint 				= 0
Real	_EndPoint				= 0
Real 	_LastScrollPosition	 	= 0
Real	_smoothScrollSize		= 0

WindowState _ParentLastWindowState

Boolean _MouseLeaveTracked 	= false
Boolean _MouseCaptured 		= false

//Timer ID
Constant Uint TM_SCROLL	= 1
Constant Uint TM_FLASH		= 2
//Timer interval (ms)
Constant Uint TMI_SCROLL	= 15
//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
//Sizes
Constant Real SCROLLBARSIZE 	= 10 		//px
end variables

forward prototypes
private subroutine _of_updatepointsh ()
private subroutine _of_updatepointsv ()
private subroutine _of_updatescrollbarpoints ()
private subroutine _of_showtip (readonly integer index)
public function integer of_insertbutton (readonly integer index, readonly string txt, readonly string image)
public function integer of_addbutton (readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addbutton (readonly string txt, readonly string image)
public function integer of_GetCount ()
public function integer of_getindex (readonly string txt)
public function string of_gettext (readonly integer index)
private subroutine _of_trackmouseleave (readonly boolean track)
public function string of_getimage (readonly integer index)
public function boolean of_isenabled (readonly integer index)
public function boolean of_IsHighLighted (readonly integer index)
public function boolean of_isvisible (readonly integer index)
public function integer of_getselectedindex ()
public function integer of_select (readonly integer index)
private subroutine _of_updatepoints ()
private subroutine _of_scrollup ()
private subroutine _of_scrolldown ()
private subroutine _of_updatetextsize (readonly integer index)
private subroutine _of_updatetextsize ()
private subroutine _of_capturemouse (readonly boolean capture)
public function boolean of_ismultiline (readonly integer index)
private subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation)
public function boolean of_isdisplaytext (readonly integer index)
public function string of_gettiptext (readonly integer index)
private function boolean _of_adjustscrollposition ()
private subroutine _of_flashdrawitem (readonly integer index)
public function boolean of_isflashing (readonly integer index)
public function long of_displaytext (readonly integer index, readonly boolean display)
public function long of_displaytextall (readonly boolean display)
public function long of_enable (readonly integer index, readonly boolean benabled)
public function long of_flash (readonly integer index, readonly long flashtime)
public function long of_highlight (readonly integer index, readonly boolean highlighted)
public function long of_remove (readonly integer index)
public function long of_removeall ()
public function long of_setimage (readonly integer index, readonly string image)
public function long of_setmultiline (readonly integer index, readonly boolean multiline)
public function long of_settext (readonly integer index, readonly string txt)
public function long of_settiptext (readonly integer index, readonly string tiptext)
public function long of_updatepoints ()
public function long of_visible (readonly integer index, readonly boolean bvisible)
public function long of_redraw (readonly boolean fadeanimation)
public function long of_settiptime (readonly integer index, readonly long tiptime)
public function integer of_getlastvisible ()
public function integer of_getfirstvisible ()
public function integer of_getnextvisible (readonly integer index)
public function integer of_getpreviousvisible (readonly integer index)
public function integer of_selectnext (readonly integer index)
public function integer of_selectprevious (readonly integer index)
private subroutine _of_fillbkgnd (readonly unsignedlong hdc)
private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly unsignedlong hdc)
private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly boolean fadeanimation)
public function any of_getdata (readonly integer index)
public function long of_setdata (readonly integer index, readonly any data)
public function string of_gettag (readonly integer index)
public function long of_settag (readonly integer index, readonly string stag)
private subroutine _of_trackmousehover (readonly boolean track, readonly long hovertime)
public function long of_scrollto (readonly integer index, readonly long flag)
public function long of_scrollto (readonly integer index)
public function integer of_insertbutton (readonly integer index, readonly string txt, readonly string image, readonly string tiptext)
public function unsignedlong of_getitemstate (readonly integer index)
public function integer of_getindexbytag (readonly string stag)
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
public function integer of_indexfrompoint (readonly real xpos, readonly real ypos)
private subroutine _of_scrollposition (readonly real scrollsize)
public function integer of_getindexbytip (string tip)
end prototypes

event Onmouseleave();if _mouseOverIndex>0 then
	Items[_mouseOverIndex].mouseover=false
	_of_DrawItem(_mouseOverIndex,true)
	Event OnButtonMouseLeave(_mouseOverIndex)
	_mouseOverIndex = 0
end if

if ScrollBarUp.MouseOver then
	ScrollBarUp.MouseOver = false
	_of_DrawScrollBar(ScrollBarUp,true)
	Event OnButtonMouseLeave(IDX_SCROLLBARUP)
end if

if ScrollBarDown.MouseOver then
	ScrollBarDown.MouseOver = false
	_of_DrawScrollBar(ScrollBarDown,true)
	Event OnButtonMouseLeave(IDX_SCROLLBARDOWN)
end if

_of_TrackMouseLeave(false)
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);int index

if Not _MouseLeaveTracked and Not _MouseCaptured then
	_of_TrackMouseLeave(true)
end if

index = of_indexfrompoint(xpos,ypos)

if _mouseOverIndex <> index then
	if _mouseOverIndex > 0 then
		Items[_mouseOverIndex].mouseover=false
		_of_DrawItem(_mouseOverIndex,true)
		_of_ShowTip(0)
		Event OnButtonMouseLeave(_mouseOverIndex)
	end if

	_mouseOverIndex = index
	
	if _mouseOverIndex > 0 then
		Items[_mouseOverIndex].mouseover=true
		_of_DrawItem(_mouseOverIndex,true)
		_of_ShowTip(_mouseOverIndex)
		Event OnButtonMouseEnter(_mouseOverIndex,xpos,ypos)
	end if
	
elseif _mouseOverIndex > 0 then
	Event OnButtonMouseMove(_mouseOverIndex,xpos,ypos)
end if

if index = IDX_SCROLLBARUP then
	if Not ScrollBarUp.MouseOver then
		ScrollBarUp.MouseOver = true
		_of_DrawScrollBar(ScrollBarUp,true)
		_of_ShowTip(0)
		if #AutoScroll then
			_of_TrackMouseHover(true,50)
		end if
		Event OnButtonMouseEnter(IDX_SCROLLBARUP,xpos,ypos)
	else
		if ScrollBarUp.MouseDown then
			_of_TrackMouseHover(true,50)
		end if
		Event OnButtonMouseMove(IDX_SCROLLBARUP,xpos,ypos)
	end if
else											
	if ScrollBarUp.MouseOver then
		ScrollBarUp.MouseOver = false
		_of_DrawScrollBar(ScrollBarUp,true)
		Event OnButtonMouseLeave(IDX_SCROLLBARUP)
	end if
end if

if index = IDX_SCROLLBARDOWN then
	if Not ScrollBarDown.MouseOver then
		ScrollBarDown.MouseOver = true
		_of_DrawScrollBar(ScrollBarDown,true)
		_of_ShowTip(0)
		if #AutoScroll then
			_of_TrackMouseHover(true,50)
		end if
		Event OnButtonMouseEnter(IDX_SCROLLBARDOWN,xpos,ypos)
	else
		if ScrollBarDown.MouseDown then
			_of_TrackMouseHover(true,50)
		end if
		Event OnButtonMouseMove(IDX_SCROLLBARDOWN,xpos,ypos)
	end if
else
	if ScrollBarDown.MouseOver then
		ScrollBarDown.MouseOver = false
		_of_DrawScrollBar(ScrollBarDown,true)
		Event OnButtonMouseLeave(IDX_SCROLLBARDOWN)
	end if
end if
	
return 0
end event

event type long onpaint(unsignedlong hdc);int index

if #LockUpdate then return 1

Event OnEraseBkgnd(hdc)

if ScrollBarUp.visible then
	_of_DrawScrollBar(ScrollBarUp,hdc)
	Painter.ExcludeClipRect(hdc,ScrollBarUp.rcPaint)
end if
if ScrollBarDown.visible then
	_of_DrawScrollBar(ScrollBarDown,hdc)
	Painter.ExcludeClipRect(hdc,ScrollBarDown.rcPaint)
end if

for index = 1 to UpperBound(Items)
	if Not Items[index].Visible or Items[index].Hidden then continue
	_of_DrawItem(index, hdc)
next

Painter.SelectClipRgn(hdc,0)

return 1
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);if Not _MouseLeaveTracked or Timer.IsRunning(TM_SCROLL)  then
	Event	OnMouseMove(vkey,xpos,ypos)
end if

if Not #AutoScroll then
	if ScrollBarUp.MouseOver then
		ScrollBarUp.MouseDown = true
		_of_DrawScrollBar(ScrollBarUp,false)
		_of_CaptureMouse(true)
		_of_TrackMouseHover(true,500)
		_of_ScrollUp()
		return 0
	end if
	
	if ScrollBarDown.MouseOver then
		ScrollBarDown.MouseDown = true
		_of_DrawScrollBar(ScrollBarDown,false)
		_of_CaptureMouse(true)
		_of_TrackMouseHover(true,500)
		_of_ScrollDown()
		return 0
	end if
end if

if _mouseOverIndex > 0 then
	of_Select(_mouseOverIndex)
end if

return 0
end event

event type long onmousehover(unsignedlong vkey, real xpos, real ypos);boolean trackMouseHover = false

if ScrollBarUp.visible and Painter.PtInRect(ScrollBarUp.rcPaint,xpos,ypos) and &
	(#AutoScroll or ScrollBarUp.MouseDown) then
	_of_ScrollUp()
	trackMouseHover = true
end if

if ScrollBarDown.visible and Painter.PtInRect(ScrollBarDown.rcPaint,xpos,ypos) and &
	(#AutoScroll or ScrollBarDown.MouseDown) then
	_of_ScrollDown()
	trackMouseHover = true
end if

if #SmoothScroll then
	_of_TrackMouseHover(trackMouseHover,50)
else
	_of_TrackMouseHover(trackMouseHover,200)
end if



return 0
end event

event type long onmousewheel(unsignedlong vkey, long zdelta, real xpos, real ypos);int i,steps

if Not Painter.PtInRect(rcClient,xpos,ypos) then return 0

steps = Abs(zdelta)/WinMsg.WHEEL_DELTA

if (zdelta > 0 and ScrollBarUp.visible)  then
	for i = 1 to steps
		_of_ScrollUp()
	next
elseif (zdelta < 0 and ScrollBarDown.visible) then
	for i = 1 to steps
		_of_ScrollDown()
	next
end if

return 1
end event

event type long onmousehwheel(unsignedlong vkey, long zdelta, real xpos, real ypos);int i,steps

if theme.#ItemOrientation = Enums.VERT then return 0
if Not Painter.PtInRect(rcClient,xpos,ypos) then return 0

steps = Abs(zdelta)/WinMsg.WHEEL_DELTA

if (zdelta < 0 and ScrollBarUp.visible)  then
	for i = 1 to steps
		_of_ScrollUp()
	next
elseif (zdelta > 0 and ScrollBarDown.visible) then
	for i = 1 to steps
		_of_ScrollDown()
	next
end if

return 1
end event

event type long onwindowsize(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);rcClient.right = newWidth
rcClient.bottom = newHeight

if theme.#ItemOrientation = Enums.VERT and WidthChanged then
	_of_UpdateTextSize()
elseif theme.#ItemOrientation = Enums.HORZ and HeightChanged then
	_of_UpdateTextSize()
end if

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

of_ScrollTo(_SelectedIndex)

return 0
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);return Event OnLButtonDown(vkey,xpos,ypos)
end event

event Oncapturechanged();if _MouseCaptured then
	_of_CaptureMouse(false)
	if ScrollBarUp.MouseDown then
		ScrollBarUp.MouseDown = false
		_of_DrawScrollBar(ScrollBarUp,true)
	end if
	if ScrollBarDown.MouseDown then
		ScrollBarDown.MouseDown = false
		_of_DrawScrollBar(ScrollBarDown,true)
	end if
	Event OnMouseLeave()
end if
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if Not _MouseCaptured then return 0

if ScrollBarUp.MouseDown then
	ScrollBarUp.MouseDown = false
	_of_DrawScrollBar(ScrollBarUp,true)
end if

if ScrollBarDown.MouseDown then
	ScrollBarDown.MouseDown = false
	_of_DrawScrollBar(ScrollBarDown,true)
end if

_of_CaptureMouse(false)
_of_TrackMouseLeave(true)

return 0
end event

event type long onerasebkgnd(unsignedlong hdc);if #LockUpdate then return 1

_of_FillBkgnd(hdc)

return 1
end event

private subroutine _of_updatepointsh ();int	index
real ll_x
real itemSize
real maxSize
real offsetSize
RECTF adjustedRect,clientRect

clientRect = rcClient
adjustedRect = rcClient
_of_AdjustRect(ref clientRect,ADJ_BORDER)		//用于判断Item是否在客户区
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)	//获取偏移边框大小后的可用客户区

ll_x=adjustedRect.left + _ScrollPosition
itemSize = adjustedRect.bottom - adjustedRect.top

_StartPoint = ll_x

_firstIndex = 0
_lastIndex = 0

for index = 1 to UpperBound(Items)
	if Not Items[index].Visible then continue
	
	if Items[index].imageIndex > 0 then
		if Items[index].DisplayText and Items[index].szText.cx > 0 then
			choose case theme.#IconPosition
				case Enums.LEFT
					//Set rcImage
					Items[index].rcImage.left		= ll_x + 2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
					Items[index].rcImage.top		= adjustedRect.top + (itemSize - theme.#IconSize.cy) / 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cx
					//Set rcText
					Items[index].rcText.left 			= Items[index].rcImage.right + 2
					Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
					Items[index].rcText.top			= adjustedRect.top + (itemSize - Items[index].szText.cy) / 2
					Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
				case Enums.TOP
					if Items[index].szText.cx > theme.#IconSize.cx then
						maxSize = Items[index].szText.cx
					else
						maxSize = theme.#IconSize.cx
					end if
					//Set rcImage
					Items[index].rcImage.left		= ll_x + 2 + (maxSize - theme.#IconSize.cx)/2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
					Items[index].rcImage.top		= adjustedRect.top + 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
					//Set rcText
					Items[index].rcText.left 			= ll_x  + 2 + (maxSize - Items[index].szText.cx) / 2
					Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
					Items[index].rcText.top			= Items[index].rcImage.bottom + 2
					if (adjustedRect.bottom - Items[index].rcText.top) > Items[index].szText.cy then
						Items[index].rcText.top 		+= (adjustedRect.bottom - Items[index].rcText.top - Items[index].szText.cy) / 2
					end if
					Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
				case Enums.RIGHT
					//Set rcImage
					Items[index].rcImage.left		= ll_x + 2 + Items[index].szText.cx + 2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
					Items[index].rcImage.top		= adjustedRect.top + (itemSize - theme.#IconSize.cy) / 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cx
					//Set rcText
					Items[index].rcText.left 			= ll_x + 2
					Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
					Items[index].rcText.top			= adjustedRect.top + (itemSize - Items[index].szText.cy) / 2
					Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
				case Enums.BOTTOM
					if Items[index].szText.cx > theme.#IconSize.cx then
						maxSize = Items[index].szText.cx
					else
						maxSize = theme.#IconSize.cx
					end if
					//Set rcImage
					Items[index].rcImage.left		= ll_x + 2 + (maxSize - theme.#IconSize.cx)/2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
					Items[index].rcImage.top		= adjustedRect.bottom - 2 - theme.#IconSize.cy
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
					//Set rcText
					Items[index].rcText.left 			= ll_x  + 2 + (maxSize - Items[index].szText.cx) / 2
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
			Items[index].rcImage.left		= ll_x + 2
			Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
			Items[index].rcImage.top		= adjustedRect.top + (itemSize - theme.#IconSize.cy) / 2
			Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
		end if
	elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
		Painter.SetRectEmpty(Items[index].rcImage)
		//Set rcText
		Items[index].rcText.left 		= ll_x  + 2
		Items[index].rcText.right 	= Items[index].rcText.left  + Items[index].szText.cx
		Items[index].rcText.top		= adjustedRect.top + (itemSize - Items[index].szText.cy) / 2
		Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
	else
		Painter.SetRectEmpty(Items[index].rcImage)
		Painter.SetRectEmpty(Items[index].rcText)
	end if
	
	//Set rcPaint
	Items[index].rcPaint.left			= ll_x
	if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
		Items[index].rcPaint.right = Max(Items[index].rcText.right, Items[index].rcImage.right) + 2
	elseif Not Painter.IsRectEmpty(Items[index].rcText) then
		Items[index].rcPaint.right = Items[index].rcText.right + 2
	elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
		Items[index].rcPaint.right = Items[index].rcImage.right + 2
	else
		Items[index].rcPaint.right = Items[index].rcPaint.left + 4
	end if
	Items[index].rcPaint.top 			= adjustedRect.top
	Items[index].rcPaint.bottom 	= adjustedRect.bottom
	
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
			Items[index].rcPaint.right += offsetSize
		end if
	end if
	
	if Items[index].rcPaint.right <= clientRect.left or Items[index].rcPaint.left >= clientRect.right then
		Items[index].Hidden = true
	else
		Items[index].Hidden = false
	end if
	
	_EndPoint = Items[index].rcPaint.right
	
	ll_x = Items[index].rcPaint.right + theme.#ItemMargin
	
	if _firstIndex = 0 then
		_firstIndex = index
	end if
	_lastIndex = index
	
next
end subroutine

private subroutine _of_updatepointsv ();int	index
real ll_y
real itemSize
real maxSize
real offsetSize
RECTF adjustedRect,clientRect

clientRect = rcClient	
adjustedRect = rcClient
_of_AdjustRect(ref clientRect,ADJ_BORDER)		//用于判断Item是否在客户区
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)	//获取偏移边框大小后的可用客户区

ll_y=adjustedRect.top + _ScrollPosition
itemSize = adjustedRect.right - adjustedRect.left

_StartPoint = ll_y

_firstIndex = 0
_lastIndex = 0

for index = 1 to UpperBound(Items)
	if Not Items[index].Visible then continue
	
	if Items[index].imageIndex > 0 then
		if Items[index].DisplayText and Items[index].szText.cx > 0 then
			choose case theme.#IconPosition
				case Enums.LEFT
					if Items[index].szText.cy > theme.#IconSize.cy then
						maxSize = Items[index].szText.cy
					else
						maxSize = theme.#IconSize.cy
					end if
					//Set rcImage
					Items[index].rcImage.left		= adjustedRect.left  + 2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
					Items[index].rcImage.top		= ll_y + 2 + (maxSize - theme.#IconSize.cy) / 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
					//Set rcText
					Items[index].rcText.left 			= Items[index].rcImage.right + 2
					Items[index].rcText.right 		= adjustedRect.right - 2
					Items[index].rcText.top			= ll_y + 2 + (maxSize - Items[index].szText.cy) / 2
					Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
				case Enums.TOP
					//Set rcImage
					Items[index].rcImage.left		= adjustedRect.left  + (itemSize - theme.#IconSize.cx)/2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
					Items[index].rcImage.top		= ll_y + 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
					//Set rcText
					Items[index].rcText.left 			= adjustedRect.left  + 2
					Items[index].rcText.right 		= adjustedRect.right  - 2
					Items[index].rcText.top			= Items[index].rcImage.bottom + 2
					Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
				case Enums.RIGHT
					if Items[index].szText.cy > theme.#IconSize.cy then
						maxSize = Items[index].szText.cy
					else
						maxSize = theme.#IconSize.cy
					end if
					//Set rcImage
					Items[index].rcImage.left		= adjustedRect.right  - 2 - theme.#IconSize.cx
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
					Items[index].rcImage.top		= ll_y + 2 + (maxSize - theme.#IconSize.cy) / 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
					//Set rcText
					Items[index].rcText.left 			= adjustedRect.left + 2
					Items[index].rcText.right 		= Items[index].rcImage.left - 2
					Items[index].rcText.top			= ll_y + 2 + (maxSize - Items[index].szText.cy) / 2
					Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
				case Enums.BOTTOM
					//Set rcImage
					Items[index].rcImage.left		= adjustedRect.left  + (itemSize - theme.#IconSize.cx)/2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
					Items[index].rcImage.top		= ll_y + 2 + Items[index].szText.cy + 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
					//Set rcText
					Items[index].rcText.left 			= adjustedRect.left  + 2
					Items[index].rcText.right 		= adjustedRect.right  - 2
					Items[index].rcText.top			= ll_y + 2
					Items[index].rcText.bottom 		= Items[index].rcImage.top - 2
			end choose
		else
			Painter.SetRectEmpty(Items[index].rcText)
			//Set rcImage
			Items[index].rcImage.left		= adjustedRect.left  + (itemSize - theme.#IconSize.cx)/2
			Items[index].rcImage.right		= Items[index].rcImage.left + theme.#IconSize.cx
			Items[index].rcImage.top		= ll_y + 2
			Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
		end if
	elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
		Painter.SetRectEmpty(Items[index].rcImage)
		//Set rcText
		Items[index].rcText.left 		= adjustedRect.left  + 2 
		Items[index].rcText.right 	= adjustedRect.right - 2
		Items[index].rcText.top		= ll_y + 2
		Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
	else
		Painter.SetRectEmpty(Items[index].rcImage)
		Painter.SetRectEmpty(Items[index].rcText)
	end if
	
	//Set rcPaint
	Items[index].rcPaint.left = adjustedRect.left
	Items[index].rcPaint.right = adjustedRect.right
	Items[index].rcPaint.top = ll_y
	if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
		Items[index].rcPaint.bottom = Max(Items[index].rcText.bottom, Items[index].rcImage.bottom) + 2
	elseif Not Painter.IsRectEmpty(Items[index].rcText) then
		Items[index].rcPaint.bottom = Items[index].rcText.bottom + 2
	elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
		Items[index].rcPaint.bottom = Items[index].rcImage.bottom + 2
	else
		Items[index].rcPaint.bottom = Items[index].rcPaint.top + 4
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
			Items[index].rcPaint.bottom += offsetSize
		end if
	end if
	
	if Items[index].rcPaint.bottom <= clientRect.top or Items[index].rcPaint.top >= clientRect.bottom then
		Items[index].Hidden = true
	else
		Items[index].Hidden = false
	end if
	
	_EndPoint = Items[index].rcPaint.bottom
	
	ll_y = Items[index].rcPaint.bottom + theme.#ItemMargin
	
	if _firstIndex = 0 then
		_firstIndex = index
	end if
	_lastIndex = index
next
end subroutine

private subroutine _of_updatescrollbarpoints ();RECTF adjustedRect

adjustedRect = rcClient
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if theme.#ItemOrientation = Enums.VERT then
	if Long(_StartPoint) < Long(adjustedRect.top) then
		ScrollBarUp.visible = true
		ScrollBarUp.rcPaint.left = rcClient.left
		ScrollBarUp.rcPaint.right = rcClient.right
		ScrollBarUp.rcPaint.top = rcClient.top
		ScrollBarUp.rcPaint.bottom = SCROLLBARSIZE
		if theme.#BorderStyle = Enums.BS_RAISED then
			ScrollBarUp.rcPaint.right -= 1
		end if
	else
		ScrollBarUp.visible = false
	end if
	
	if Long(_EndPoint) > Long(adjustedRect.bottom) then
		ScrollBarDown.visible = true
		ScrollBarDown.rcPaint.left = rcClient.left
		ScrollBarDown.rcPaint.right = rcClient.right
		ScrollBarDown.rcPaint.top 	= rcClient.bottom - SCROLLBARSIZE
		ScrollBarDown.rcPaint.bottom = rcClient.bottom
		if theme.#BorderStyle = Enums.BS_RAISED then
			ScrollBarDown.rcPaint.right -= 1
			ScrollBarDown.rcPaint.bottom -= 1
		end if
	else
		ScrollBarDown.visible = false
	end if
else
	if Long(_StartPoint) < Long(adjustedRect.left) then
		ScrollBarUp.visible = true
		ScrollBarUp.rcPaint.left = rcClient.left
		ScrollBarUp.rcPaint.right = SCROLLBARSIZE
		ScrollBarUp.rcPaint.top = rcClient.top
		ScrollBarUp.rcPaint.bottom = rcClient.bottom
		if theme.#BorderStyle = Enums.BS_RAISED then
			ScrollBarUp.rcPaint.bottom -= 1
		end if
	else
		ScrollBarUp.visible = false
	end if
	
	if Long(_EndPoint) > Long(adjustedRect.right) then
		ScrollBarDown.visible = true
		ScrollBarDown.rcPaint.left = rcClient.right - SCROLLBARSIZE
		ScrollBarDown.rcPaint.right = rcClient.right
		ScrollBarDown.rcPaint.top 	= rcClient.top
		ScrollBarDown.rcPaint.bottom = rcClient.bottom
		if theme.#BorderStyle = Enums.BS_RAISED then
			ScrollBarDown.rcPaint.right -= 1
			ScrollBarDown.rcPaint.bottom -= 1
		end if
	else
		ScrollBarDown.visible = false
	end if
end if
end subroutine

private subroutine _of_showtip (readonly integer index);if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return

if #ToolTip and index > 0 and index <= UpperBound(Items) then
	if Items[index].tipText <> "" then
		if Items[index].TipTime > 0 then
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,Items[index].TipTime)
		else
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,-1)
		end if
		_ToolTip.UpdateTipText(#Handle,_TTID,Items[index].tipText)
		_ToolTip.UpdateToolRect(#Handle,_TTID,Items[index].rcPaint.Left,Items[index].rcPaint.Top,Items[index].rcPaint.Right,&
											Items[index].rcPaint.Bottom)
	else
		_ToolTip.UpdateToolRect(#Handle,_TTID,0,0,0,0)								
	end if
else
	_ToolTip.UpdateToolRect(#Handle,_TTID,0,0,0,0)
end if
end subroutine

public function integer of_insertbutton (readonly integer index, readonly string txt, readonly string image);return of_InsertButton(index,txt,image,"")
end function

public function integer of_addbutton (readonly string txt, readonly string image, readonly string tiptext);return of_InsertButton(UpperBound(Items) + 1,txt,image,tipText)
end function

public function integer of_addbutton (readonly string txt, readonly string image);return of_AddButton(txt,image,"")
end function

public function integer of_GetCount ();return UpperBound(Items)
end function

public function integer of_getindex (readonly string txt);int index

for index = 1 to UpperBound(Items)
	if Upper(Items[index].Text) = Upper(txt) then return index
next

return 0
end function

public function string of_gettext (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].text
end function

private subroutine _of_trackmouseleave (readonly boolean track);TRACKMOUSEEVENT tme

if _MouseLeaveTracked=track then return

_MouseLeaveTracked=track

tme.cbsize = 16
tme.dwflags = Win32.TME_LEAVE
tme.hwndtrack = #Handle
tme.dwhovertime = 0

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(tme)

end subroutine

public function string of_getimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].image
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

public function integer of_getselectedindex ();return _selectedIndex
end function

public function integer of_select (readonly integer index);//index:0 为不选中任何项
int oldSelectedIndex

if index = _selectedIndex then return _selectedIndex
if index >= 1 and index <= UpperBound(Items) then
	if Not Items[index].Visible or Not Items[index].Enabled then return RetCode.FAILED
elseif index <> 0 then
	return RetCode.E_INVALID_ARGUMENT
end if

oldSelectedIndex = _selectedIndex

if IsPrevented(Event OnButtonSelectionChanging(oldSelectedIndex,index)) then return RetCode.FAILED

if oldSelectedIndex > 0 then
	Items[oldSelectedIndex].selected=false
	_of_DrawItem(oldSelectedIndex,true)
end if
if index >= 1 and index <= UpperBound(Items) then
	Items[index].selected = true
	_of_DrawItem(index,false)
end if
_selectedIndex = index

of_ScrollTo(_selectedIndex)

Event OnButtonSelectionChanged(oldSelectedIndex,_selectedIndex)

return _selectedIndex
end function

private subroutine _of_updatepoints ();if #LockUpdate then return

if theme.#ItemOrientation = Enums.VERT then
	_of_UpdatePointsV()
else
	_of_UpdatePointsH()
end if

if Not _of_AdjustScrollPosition() then
	_of_UpdateScrollBarPoints()
end if
end subroutine

private subroutine _of_scrollup ();int index
real offsetSize
boolean bNeedScroll
RECTF adjustedRect

if Not ScrollBarUp.visible then return

adjustedRect = rcClient
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)
			
if _smoothScrollSize > 0 then
	offsetSize = _smoothScrollSize
end if

if theme.#ItemOrientation = Enums.VERT then
	for index = UpperBound(Items) to 1 step -1
		if Not Items[index].visible then continue
		if index = _firstIndex then
			if Items[index].rcPaint.Top + offsetSize <  adjustedRect.top then
				bNeedScroll = true
			end if
		else
			if Items[index].rcPaint.Top + offsetSize < ScrollBarUp.rcPaint.Bottom + 1 then
				bNeedScroll = true
			end if
		end if
		if bNeedScroll then
			of_ScrollTo(index,Enums.SF_BACKWARD)
			return
		end if
	next
else
	for index = UpperBound(Items) to 1 step -1
		if Not Items[index].visible then continue
		if index = _firstIndex then
			if Items[index].rcPaint.Left + offsetSize <  adjustedRect.left then
				bNeedScroll = true
			end if
		else
			if Items[index].rcPaint.Left + offsetSize < ScrollBarUp.rcPaint.Right + 1 then
				bNeedScroll = true
			end if
		end if
		if bNeedScroll then
			of_ScrollTo(index,Enums.SF_BACKWARD)
			return
		end if
	next
end if
end subroutine

private subroutine _of_scrolldown ();int index
real offsetSize
boolean bNeedScroll
RECTF adjustedRect

if Not ScrollBarDown.visible then return

adjustedRect = rcClient
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if _smoothScrollSize < 0 then
	offsetSize = _smoothScrollSize
end if

if theme.#ItemOrientation = Enums.VERT then
	for index = 1 to UpperBound(Items)
		if Not Items[index].visible then continue
		if index = _lastIndex then
			if Items[index].rcPaint.Bottom + offsetSize > adjustedRect.bottom then
				bNeedScroll = true
			end if
		else
			if Items[index].rcPaint.Bottom + offsetSize > ScrollBarDown.rcPaint.Top - 1 then
				bNeedScroll = true
			end if
		end if
		if bNeedScroll then
			of_ScrollTo(index,Enums.SF_FORWARD)
			return
		end if
	next
else
	for index = 1 to UpperBound(Items)
		if Not Items[index].visible then continue
		if index = _lastIndex then
			if Items[index].rcPaint.Right + offsetSize > adjustedRect.Right then
				bNeedScroll = true
			end if
		else
			if Items[index].rcPaint.Right + offsetSize > ScrollBarDown.rcPaint.Left - 1 then
				bNeedScroll = true
			end if
		end if
		if bNeedScroll then
			of_ScrollTo(index,Enums.SF_FORWARD)
			return
		end if
	next
end if
end subroutine

private subroutine _of_updatetextsize (readonly integer index);ulong dtparam
n_cst_font ln_calcFont
RECTF calcRect
RECTF	adjustedRect

if index < 1 or index > UpperBound(Items) then return
if Len(items[index].Text) = 0 then
	Items[index].szText.cx = 0
	Items[index].szText.cy = 0
	return
end if

adjustedRect = rcClient
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

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

if theme.#ItemOrientation = Enums.VERT then
	calcRect.right = adjustedRect.right - adjustedRect.left - 4
	if items[index].imageIndex > 0 then
		if (theme.#IconPosition = Enums.LEFT or theme.#IconPosition = Enums.RIGHT) then
			calcRect.right -= theme.#IconSize.cx + 2
			Painter.of_CalcTextSize(ln_calcFont,Items[index].Text,dtparam,ref calcRect)
			if calcRect.right > adjustedRect.right - adjustedRect.left - 4 - theme.#IconSize.cx - 2 then
				calcRect.right = adjustedRect.right - adjustedRect.left - 4 - theme.#IconSize.cx - 2
			end if
		else
			Painter.of_CalcTextSize(ln_calcFont,Items[index].Text,dtparam,ref calcRect)
			if calcRect.right > adjustedRect.right - adjustedRect.left - 4 then
				calcRect.right = adjustedRect.right - adjustedRect.left - 4
			end if
		end if
	else
		Painter.of_CalcTextSize(ln_calcFont,Items[index].Text,dtparam,ref calcRect)
		if calcRect.right > adjustedRect.right - adjustedRect.left - 4 then
			calcRect.right = adjustedRect.right - adjustedRect.left - 4
		end if
	end if
else
	calcRect.right = adjustedRect.right  - adjustedRect.left - 4
	Painter.of_CalcTextSize(ln_calcFont,Items[index].Text,dtparam,ref calcRect)
	if items[index].imageIndex > 0 and (theme.#IconPosition = Enums.TOP or theme.#IconPosition = Enums.BOTTOM) then
		if calcRect.bottom > (adjustedRect.bottom - adjustedRect.top) - theme.#IconSize.cy - 2 - 4 then
			calcRect.bottom = (adjustedRect.bottom - adjustedRect.top) - theme.#IconSize.cy - 2 - 4
		end if
	else
		if calcRect.bottom > adjustedRect.bottom - adjustedRect.top - 4 then
			calcRect.bottom = adjustedRect.bottom - adjustedRect.top - 4
		end if
	end if
end if

items[index].szText.cx = calcRect.right
items[index].szText.cy = calcRect.bottom

if Items[index].szText.cx < 0 then Items[index].szText.cx = 0
if  Items[index].szText.cy < 0 then Items[index].szText.cy = 0
end subroutine

private subroutine _of_updatetextsize ();int index

for index=1 to UpperBound(items)
	_of_UpdateTextSize(index)
next
end subroutine

private subroutine _of_capturemouse (readonly boolean capture);if _MouseCaptured = capture then return

_MouseCaptured = capture

if capture then
	Win32.SetCapture(#Handle)
else
	Win32.ReleaseCapture()
end if
end subroutine

public function boolean of_ismultiline (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].MultiLine
end function

private subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation);ulong safeDC

if #LockUpdate then return
if Not Visible then return
if index < 1 or index > UpperBound(Items) then return
if Not Items[index].visible or Items[index].hidden then return

safeDC=GetSafeDC()

Painter.IntersectClipRect(safeDC,Items[index].rcPaint)

if ScrollBarUp.Visible then
	Painter.ExcludeClipRect(safeDC,ScrollBarUp.rcPaint)
end if
if ScrollBarDown.Visible then
	Painter.ExcludeClipRect(safeDC,ScrollBarDown.rcPaint)
end if

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnEraseBkgnd(safeDC)

_of_DrawItem(index, safeDC)

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

public function boolean of_isdisplaytext (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].DisplayText
end function

public function string of_gettiptext (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].tiptext
end function

private function boolean _of_adjustscrollposition ();RECTF	adjustedRect

if _ScrollPosition = 0 then return false

adjustedRect = rcClient
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if theme.#ItemOrientation = Enums.VERT then
	if _EndPoint < adjustedRect.bottom and _ScrollPosition < 0 then
		_of_ScrollPosition(adjustedRect.bottom - _EndPoint)
		return true
	end if
else
	if _EndPoint < adjustedRect.right and _ScrollPosition < 0 then
		_of_ScrollPosition(adjustedRect.right - _EndPoint)
		return true
	end if
end if

return false
end function

private subroutine _of_flashdrawitem (readonly integer index);Uint nFadeTime

if #LockUpdate then return
if Not Visible then return
if index < 1 or index > UpperBound(Items) then return
if Not Items[index].visible or Items[index].hidden then return
if Not Items[index].Enabled or Items[index].MouseOver or Items[index].Selected then
	return
end if

nFadeTime = #FadeTime
#FadeTime = #FlashFadeTime

_of_DrawItem(index,true)

#FadeTime = nFadeTime
end subroutine

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

public function long of_highlight (readonly integer index, readonly boolean highlighted);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].HighLighted = highlighted then return RetCode.OK

Items[index].HighLighted = highlighted
_of_DrawItem(index,true)

return RetCode.OK
end function

public function long of_remove (readonly integer index);int i
boolean bVisible
ITEMDATA newItems[]

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

if index = _SelectedIndex then
	_SelectedIndex = 0
elseif index < _SelectedIndex then
	_SelectedIndex -= 1
end if

if index = _mouseOverIndex then
	_mouseOverIndex = 0
end if

bVisible = Items[index].Visible

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
	of_UpdatePoints()
end if

_of_ShowTip(0)

return RetCode.OK
end function

public function long of_removeall ();ITEMDATA emptyItems[]

Items = emptyItems

_selectedIndex = 0
_mouseOverIndex = 0
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
		_of_DrawItem(index,false)
	end if
end if

return RetCode.OK
end function

public function long of_setmultiline (readonly integer index, readonly boolean multiline);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].MultiLine = multiline then return RetCode.OK

Items[index].MultiLine = multiline

_of_UpdateTextSize(index)
if Items[index].Visible then
	of_UpdatePoints()
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

public function long of_updatepoints ();if #LockUpdate then return RetCode.FAILED

_of_UpdatePoints()
of_Redraw(false)

return RetCode.OK
end function

public function long of_visible (readonly integer index, readonly boolean bvisible);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].Visible = bVisible then return RetCode.OK

Items[index].Visible = bVisible
of_UpdatePoints()

return RetCode.OK
end function

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC

if #LockUpdate then return RetCode.FAILED
if Not Visible then return RetCode.OK

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

return RetCode.OK
end function

public function long of_settiptime (readonly integer index, readonly long tiptime);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[index].TipTime = tipTime

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

private subroutine _of_fillbkgnd (readonly unsignedlong hdc);ulong transparentColor

transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,0)
//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, rcClient,  transparentColor,false,0) 
end if

Painter.ThemeFill( hdc, rcClient, theme.of_GetColor(theme.CLR_BKGND,0),theme.#BkgndOrientation,theme.#BkgndStyle,0,false,&
										theme.#BorderStyle,theme.of_GetColor(theme.CLR_BORDER,0),theme.#RoundSize)
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

if Items[index].Selected then
	Painter.of_Drawtext(hdc,theme.SelectedFont,Items[index].text,Items[index].rcText,textColor,dtparam)
else
	Painter.of_Drawtext(hdc,theme.Font,Items[index].text,Items[index].rcText,textColor,dtparam)
end if
end subroutine

private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc);ulong bkColor,borderColor,nState

if Not Items[index].Visible or Items[index].Hidden then return

nState = of_GetItemState(index)
borderColor = theme.of_GetItemColor(index,theme.CLR_BORDER,nState)

if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_HIGHLIGHTED + Enums.STATE_SELECTED) <> 0 then
	bkColor = theme.of_GetItemColor(index,theme.CLR_BKGND,nState)
	if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_SELECTED) = 0 then
		if Items[index].Flashing then
			bkColor = ARGBLighten(bkColor,0.4)
		end if
	end if
	Painter.ThemeFill(hdc,Items[index].rcPaint,bkColor,theme.#BkgndOrientation,theme.#ItemBkgndStyle,nState,false,&
							theme.#ItemBorderStyle,borderColor,theme.#ItemRoundSize)
elseif Items[index].Flashing then
	Painter.DrawThemeBorder(hdc,Items[index].rcPaint,borderColor,Enums.TRANSPARENT,theme.#ItemBorderStyle,theme.#ItemRoundSize)
end if

if Items[index].imageIndex > 0 then
	_ImageList.Draw(Items[index].imageindex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].enabled)
end if

if Items[index].DisplayText and Items[index].szText.cx>0 then
	_of_DrawItemText(index,hdc)
end if
end subroutine

private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly unsignedlong hdc);ulong borderColor,bkColor,arrowColor,nState
POINTF pt1,pt2,pt3
Constant real ARROWSIZE = 6

if Not ScrollBar.Visible then return

borderColor = theme.of_GetColor(theme.CLR_BORDER,0)
arrowColor = theme.of_GetColor(theme.CLR_ARROW,0)

if ScrollBar.MouseOver then nState += Enums.STATE_HOVER
if ScrollBar.MouseDown then nState += Enums.STATE_PRESSED

bkColor = theme.of_GetColor(theme.CLR_SCROLLBARBKGND,nState)
Painter.ThemeFill(hdc,ScrollBar.rcPaint,bkColor,theme.#ItemOrientation,theme.#ItemBkgndStyle,nState,false,&
								Enums.BS_SOLID,borderColor,0)

//Draw arrow
if theme.#ItemOrientation = Enums.VERT then
	if ScrollBar = ScrollBarDown then		//箭头向下
		pt1.x = ScrollBar.rcPaint.left + (ScrollBar.rcPaint.right - ScrollBar.rcPaint.left - ARROWSIZE)/2
		pt1.y = ScrollBar.rcPaint.top + (ScrollBar.rcPaint.bottom - ScrollBar.rcPaint.top - ARROWSIZE / 2) / 2 
		pt2.x = pt1.x + ARROWSIZE
		pt2.y = pt1.y
		pt3.x = pt1.x + ARROWSIZE / 2
		pt3.y = pt1.y + ARROWSIZE / 2
	else						//箭头向上
		pt1.x = ScrollBar.rcPaint.left + (ScrollBar.rcPaint.right - ScrollBar.rcPaint.left - ARROWSIZE)/2 + ARROWSIZE/2
		pt1.y = ScrollBar.rcPaint.top + (ScrollBar.rcPaint.bottom - ScrollBar.rcPaint.top - ARROWSIZE / 2 ) / 2
		pt2.x = pt1.x + ARROWSIZE / 2
		pt2.y = pt1.y + ARROWSIZE / 2
		pt3.x = pt1.x - ARROWSIZE / 2
		pt3.y = pt1.y + ARROWSIZE / 2
	end if
else
	if ScrollBar = ScrollBarDown then		//箭头向右
		pt1.x = ScrollBar.rcPaint.left + (ScrollBar.rcPaint.right - ScrollBar.rcPaint.left - ARROWSIZE / 2) / 2
		pt1.y = ScrollBar.rcPaint.top + (ScrollBar.rcPaint.bottom - ScrollBar.rcPaint.top - ARROWSIZE) / 2
		pt2.x = pt1.x + ARROWSIZE / 2
		pt2.y = pt1.y + ARROWSIZE / 2
		pt3.x = pt1.x
		pt3.y = pt1.y + ARROWSIZE
	else						//箭头向左
		pt1.x = ScrollBar.rcPaint.left + (ScrollBar.rcPaint.right - ScrollBar.rcPaint.left - ARROWSIZE / 2) / 2
		pt1.y = ScrollBar.rcPaint.top + (ScrollBar.rcPaint.bottom - ScrollBar.rcPaint.top - ARROWSIZE ) / 2  + ARROWSIZE/2
		pt2.x = pt1.x + ARROWSIZE / 2
		pt2.y = pt1.y - ARROWSIZE / 2
		pt3.x = pt1.x + ARROWSIZE / 2
		pt3.y = pt1.y + ARROWSIZE / 2
	end if
end if

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly boolean fadeanimation);ulong safeDC
RECTF adjustedRect

if #LockUpdate then return
if Not Visible then return
if Not ScrollBar.Visible then return

safeDC=GetSafeDC()

adjustedRect = rcClient
_of_AdjustRect(ref adjustedRect,ADJ_BORDER)

Painter.IntersectClipRect(safeDC,adjustedRect)

Painter.IntersectClipRect(safeDC,ScrollBar.rcPaint)

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnEraseBkgnd(safeDC)

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

public function any of_getdata (readonly integer index);Any data

if index < 1 or index > UpperBound(Items) then return data

return Items[index].data
end function

public function long of_setdata (readonly integer index, readonly any data);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[index].Data = data

return RetCode.OK
end function

public function string of_gettag (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].Tag
end function

public function long of_settag (readonly integer index, readonly string stag);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[index].Tag = stag

return RetCode.OK
end function

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

public function long of_scrollto (readonly integer index, readonly long flag);real scrollSize
RECTF adjustedRect

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not Items[index].visible then return RetCode.FAILED
if Not ScrollBarUp.Visible and Not ScrollBarDown.Visible then return RetCode.FAILED

adjustedRect = rcClient
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if theme.#ItemOrientation = Enums.VERT then
	choose case flag
		case Enums.SF_FORWARD
			if ScrollBarDown.Visible then
				if index = _lastIndex then
					if Items[index].rcPaint.Bottom > adjustedRect.bottom then
						scrollSize = adjustedRect.bottom - Items[index].rcPaint.Bottom
					end if
				else
					if Items[index].rcPaint.Bottom > ScrollBarDown.rcPaint.Top - 1 then
						scrollSize = (ScrollBarDown.rcPaint.Top - 1 ) - Items[index].rcPaint.Bottom
					end if
				end if
			end if
		case Enums.SF_BACKWARD
			if ScrollBarUp.Visible then
				if index = _firstIndex then
					if Items[index].rcPaint.Top < adjustedRect.top then
						scrollSize = adjustedRect.top - Items[index].rcPaint.Top
					end if
				else
					if Items[index].rcPaint.Top < ScrollBarUp.rcPaint.Bottom + 1 then
						scrollSize = (ScrollBarUp.rcPaint.Bottom + 1) - Items[index].rcPaint.Top
					end if
				end if
			end if
		case else
			return RetCode.E_INVALID_ARGUMENT
	end choose
else
	choose case flag
		case Enums.SF_FORWARD
			if ScrollBarDown.Visible then
				if index = _lastIndex then
					if Items[index].rcPaint.Right > adjustedRect.Right then
						scrollSize = adjustedRect.Right - Items[index].rcPaint.Right
					end if
				else
					if Items[index].rcPaint.Right > ScrollBarDown.rcPaint.Left - 1 then
						scrollSize = (ScrollBarDown.rcPaint.Left - 1) - Items[index].rcPaint.Right
					end if
				end if
			end if
		case Enums.SF_BACKWARD
			if ScrollBarUp.Visible then
				if index = _firstIndex then
					if Items[index].rcPaint.Left < adjustedRect.left then
						scrollSize = adjustedRect.left - Items[index].rcPaint.Left
					end if
				else
					if Items[index].rcPaint.Left < ScrollBarUp.rcPaint.Right + 1 then
						scrollSize = (ScrollBarUp.rcPaint.Right + 1) - Items[index].rcPaint.Left
					end if
				end if
			end if
		case else
			return RetCode.E_INVALID_ARGUMENT
	end choose
end if

if scrollSize <> 0 then
	if #SmoothScroll then
		_smoothScrollSize = scrollSize
		Timer.Start(TM_SCROLL,TMI_SCROLL)
	else
		_of_ScrollPosition(scrollSize)
		of_Redraw(false)
		if _MouseLeaveTracked then
			RECTF wndRect
			POINTF pt
			
			Painter.GetWindowRect(#Handle,ref wndRect)
			Painter.GetCursorPos(ref pt)
			Event OnMouseMove(0,pt.x - wndRect.left,pt.y - wndRect.top)
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

rtCode = RetCode.FAILED
if ScrollBarDown.Visible then
	rtCode = of_ScrollTo(index,Enums.SF_FORWARD)
end if
if rtCode = RetCode.FAILED then
	if ScrollBarUp.Visible then
		rtCode = of_ScrollTo(index,Enums.SF_BACKWARD)
	end if
end if

return rtCode
end function

public function integer of_insertbutton (readonly integer index, readonly string txt, readonly string image, readonly string tiptext);int i
ITEMDATA newItem

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

newItem.Text = txt
newItem.tipText = tipText
newItem.DisplayText = true
newItem.enabled = true
newItem.visible = true

if len(image) > 0 then
	newItem.image = image
	newItem.imageindex = _ImageList.AddImage(Trim(image))
end if

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

if index <= _selectedIndex then
	_selectedIndex += 1
end if

_of_UpdateTextSize(index)

of_UpdatePoints()

return index
end function

public function unsignedlong of_getitemstate (readonly integer index);ulong nState

if index < 1 or index > UpperBound(Items) then return 0

if Items[index].MouseOver then nState += Enums.STATE_HOVER
if Items[index].Highlighted then nState += Enums.STATE_HIGHLIGHTED
if Items[index].Selected then nState += Enums.STATE_CURRENT + Enums.STATE_SELECTED + Enums.STATE_PRESSED
if Items[index].FlashTime = -1 or Items[index].FlashTime > 0 then nState += Enums.STATE_FLASHING
if Not Items[index].Enabled then nState += Enums.STATE_DISABLED

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
	//偏移边框的间隔
	adjRect.left += theme.#BorderMargin.left
	adjRect.top += theme.#BorderMargin.top
	adjRect.right -= theme.#BorderMargin.right
	adjRect.bottom -= theme.#BorderMargin.bottom
end if
end subroutine

public function integer of_indexfrompoint (readonly real xpos, readonly real ypos);int index

if Not Painter.PtInRect(rcClient,xpos,ypos) then return 0

if ScrollBarUp.visible then
	if Painter.PtInRect(ScrollBarUp.rcPaint,xpos,ypos) then
		return IDX_SCROLLBARUP
	end if
end if

if ScrollBarDown.visible then
	if Painter.PtInRect(ScrollBarDown.rcPaint,xpos,ypos) then
		return IDX_SCROLLBARDOWN
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
	if Not Items[index].visible or Items[index].Hidden or Not Items[index].enabled then continue
		
	if Painter.PtInRect(Items[index].rcPaint,xpos,ypos) then
		return index
	end if

next

return 0
end function

private subroutine _of_scrollposition (readonly real scrollsize);int	index
real scrollPosition
RECTF adjustedRect,clientRect

if scrollSize = 0 then return

clientRect = rcClient	
adjustedRect = rcClient
_of_AdjustRect(ref clientRect,ADJ_BORDER)		//用于判断Item是否在客户区
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

scrollPosition = _ScrollPosition

if scrollSize > 0 then		//Scroll to up
	if theme.#ItemOrientation = Enums.VERT then
		if _StartPoint + scrollSize < adjustedRect.top then
			_ScrollPosition += scrollSize
		else
			_ScrollPosition = 0
		end if
	else
		if _StartPoint + scrollSize < adjustedRect.left then
			_ScrollPosition += scrollSize
		else
			_ScrollPosition = 0
		end if
	end if
elseif scrollSize < 0 then	//Scroll to down
	if theme.#ItemOrientation = Enums.VERT then
		if adjustedRect.bottom - _EndPoint  < scrollSize then
			_ScrollPosition += scrollSize
		else
			_ScrollPosition += adjustedRect.bottom - _EndPoint
		end if
	else
		if adjustedRect.right - _EndPoint < scrollSize then
			_ScrollPosition += scrollSize
		else
			_ScrollPosition += adjustedRect.right - _EndPoint 
		end if
	end if
end if

if scrollPosition <> _ScrollPosition then
	scrollPosition = _ScrollPosition - scrollPosition
	_StartPoint += scrollPosition
	_EndPoint += scrollPosition
	_of_UpdateScrollBarPoints()
	
	if theme.#ItemOrientation = Enums.VERT then
		for index = 1 to UpperBound(Items)
			if Not Items[index].visible then continue
			if Not Painter.IsRectEmpty(Items[index].rcText) then
				Painter.OffsetRect(ref Items[index].rcText,0,scrollPosition)
			end if
			if Not Painter.IsRectEmpty(Items[index].rcImage) then
				Painter.OffsetRect(ref Items[index].rcImage,0,scrollPosition)
			end if
			if Not Painter.IsRectEmpty(Items[index].rcPaint) then
				Painter.OffsetRect(ref Items[index].rcPaint,0,scrollPosition)
				if Items[index].rcPaint.bottom <= clientRect.top or Items[index].rcPaint.top >= clientRect.bottom then
					Items[index].Hidden = true
				else
					Items[index].Hidden = false
				end if
			end if
		next
	else
		for index = 1 to UpperBound(Items)
			if Not Items[index].visible then continue
			if Not Painter.IsRectEmpty(Items[index].rcText) then
				Painter.OffsetRect(ref Items[index].rcText,scrollPosition,0)
			end if
			if Not Painter.IsRectEmpty(Items[index].rcImage) then
				Painter.OffsetRect(ref Items[index].rcImage,scrollPosition,0)
			end if
			if Not Painter.IsRectEmpty(Items[index].rcPaint) then
				Painter.OffsetRect(ref Items[index].rcPaint,scrollPosition,0)
				if Items[index].rcPaint.right <= clientRect.left or Items[index].rcPaint.left >= clientRect.right then
					Items[index].Hidden = true
				else
					Items[index].Hidden = false
				end if
			end if
		next
	end if
end if
end subroutine

public function integer of_getindexbytip (string tip);int index

for index = 1 to UpperBound(Items)
	if Items[index].tiptext = tip then return index
next

return 0
end function

on u_cst_buttonlistbar.create
call super::create
this.theme=create theme
this.timer=create timer
end on

on u_cst_buttonlistbar.destroy
call super::destroy
destroy(this.theme)
destroy(this.timer)
end on

event oninit;call super::oninit;_ImageList = Create n_imagelist
_ImageList.ShareImage(true)
_ImageList.SetImageSize(theme.#IconSize.cx,theme.#IconSize.cy)

_ToolTip = Create n_tooltip
_ToolTip.CreateToolTip(#Handle)
_TTID = _ToolTip.AddTool(#Handle,false,Win32.TTF_SUBCLASS + Win32.TTF_TRANSPARENT)

SetNull(_LastScrollPosition)

Painter.GetClientRect(#Handle,ref rcClient)
end event

event onuninit;call super::onuninit;Destroy _ImageList

if _TTID > 0 then
	_ToolTip.DelTool(#Handle,_TTID)
end if

Destroy _ToolTip
Timer.StopAll()
end event

type uo_logo from u_cst_canvas`uo_logo within u_cst_buttonlistbar
string tag = "ButtonlistBar"
end type

type theme from n_cst_buttonlistbar_theme within u_cst_buttonlistbar descriptor "pb_nvo" = "true" 
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
	case EVT_ITEMORIENTATION
		_of_UpdateTextSize()
		dirty = true
	case EVT_TEXTALIGN
		dirty = true
	case EVT_ICONPOSITION
		_of_UpdateTextSize()
		dirty = true
	case EVT_FIXEDSIZE
		dirty = true
	case EVT_ITEMMINSIZE
		if theme.#FixedSize then
			dirty = true
		end if
	case EVT_ITEMMARGIN
		dirty = true
	case EVT_ICONSIZE
		_ImageList.SetImageSize(#IconSize.cx,#IconSize.cy)
		dirty = true
	case EVT_BORDERMARGIN
		_of_UpdateTextSize()
		dirty = true
	case EVT_SELECTEDFONT
		_of_UpdateTextSize()
		dirty = true
end choose

if dirty then
	of_UpdatePoints()
else
	of_Redraw(true)
end if

Parent.Event OnThemeChanged(eventFlag)
end event

event ongetcolor;call super::ongetcolor;Parent.Event OnGetColor(colorFlag,state,ref color)
end event

event ongetitemcolor;call super::ongetitemcolor;Parent.Event OnGetItemColor(index,colorFlag,state,ref color)
end event

type timer from n_timer within u_cst_buttonlistbar descriptor "pb_nvo" = "true" 
end type

event ontimer;if id = TM_SCROLL then
	real scrollSize
	
	if _smoothScrollSize = 0 or (Not ScrollBarUp.Visible and Not ScrollBarDown.Visible) then
		_smoothScrollSize = 0
		return false
	end if
	
	if _smoothScrollSize > 0 and ScrollBarUp.Visible then
		scrollSize = Ceiling(_smoothScrollSize / 10) + 2
		if _smoothScrollSize - scrollSize < 0 then
			scrollSize = _smoothScrollSize
		end if
		_smoothScrollSize -= scrollSize
	end if
	
	if _smoothScrollSize < 0 and ScrollBarDown.Visible then
		scrollSize = Ceiling(_smoothScrollSize / 10) - 2
		if _smoothScrollSize - scrollSize > 0 then
			scrollSize = _smoothScrollSize
		end if
		_smoothScrollSize -= scrollSize
	end if
	
	if scrollSize <> 0 then
		_of_ScrollPosition(scrollSize)
		of_Redraw(false)
	end if
	if (_smoothScrollSize = 0 or scrollSize = 0) and _MouseLeaveTracked then
		RECTF wndRect
		POINTF pt
		
		_smoothScrollSize = 0
		
		Painter.GetWindowRect(#Handle,ref wndRect)
		Painter.GetCursorPos(ref pt)
		Event OnMouseMove(0,pt.x - wndRect.left,pt.y - wndRect.top)
		//Stop timer
		return false
	end if
	
	return true
elseif id = TM_FLASH then
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

