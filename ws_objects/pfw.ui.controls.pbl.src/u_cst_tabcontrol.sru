$PBExportHeader$u_cst_tabcontrol.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabcontrol from u_cst_canvas
end type
type theme from n_cst_tabcontrol_theme within u_cst_tabcontrol
end type
type timer from n_timer within u_cst_tabcontrol
end type
end forward

global type u_cst_tabcontrol from u_cst_canvas
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
event type long onnclbuttondblclk ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onnclbuttondown ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event type long onnchittest ( real xpos,  real ypos )
event type long ontabselectionchanging ( integer oldindex,  integer newindex )
event ontabselectionchanged ( integer oldindex,  integer newindex )
event ontabmousemove ( integer index,  real xpos,  real ypos )
event ontabmouseleave ( integer index )
event ontabmouseenter ( integer index,  real xpos,  real ypos )
event onobjectreposition ( integer index,  ref real newx,  ref real newy,  ref real newwidth,  ref real newheight )
event ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type long onncrbuttondown ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onncmousehover ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long ontabclosing ( integer index )
event ontabclosed ( integer index )
event type long onmousehover ( unsignedlong vkey,  real xpos,  real ypos )
event type long onnclbuttonup ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onmousewheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event type long onmousehwheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event ontabopened ( integer index )
event type long onpopupmenu ( integer index,  ref real xpos,  ref real ypos,  ref unsignedlong flags )
event type long onncerasebkgnd ( unsignedlong hdc )
event type long ontabfloating ( integer index )
event ontabfloated ( integer index )
event type long ontabdocking ( integer index )
event ontabdocked ( integer index )
event type long onkeydown ( unsignedinteger nchar,  unsignedinteger nrepcnt,  unsignedlong nflags )
event type long ontabbegindrag ( integer index )
event ontabdragdrop ( integer index,  real xpos,  real ypos )
event type long onrbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event ontabdoubleclicked ( integer index,  real xpos,  real ypos )
event type long ontabdoubleclicking ( integer index,  real xpos,  real ypos )
event type long onncrbuttonup ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long ontabrightclicking ( integer index,  real xpos,  real ypos )
event ontabrightclicked ( integer index,  real xpos,  real ypos )
event type long ontabrightdoubleclicking ( integer index,  real xpos,  real ypos )
event ontabrightdoubleclicked ( integer index,  real xpos,  real ypos )
event type long onncrbuttondblclk ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long ontabclicking ( integer index,  real xpos,  real ypos )
event ontabclicked ( integer index,  real xpos,  real ypos )
event type long ontabmoving ( integer srcindex,  integer dstindex )
event ontabmoved ( integer srcindex,  integer dstindex )
theme theme
timer timer
end type
global u_cst_tabcontrol u_cst_tabcontrol

type prototypes
Private:
Function Boolean InitWindowPage(ulong hWnd) Library "pfw.dll" Alias for "pfwInitWindowPage"
end prototypes

type variables
/*--- Constants ---*/
Public:
//Indexes
Constant Int IDX_SCROLLBARUP		= -1
Constant Int IDX_SCROLLBARDOWN	= -2
Constant Int IDX_CHEVRON				= -3

/*--- Properties ---*/
Public:
Uint		#FlashFadeTime			= 1500		//ms
Boolean 	#ToolTip 					= false
Boolean	#AutoScroll					= false 		//当鼠标进入ScrollBar时自动滚动
Boolean	#AllowTabDrag				= false		//开启使用鼠标拖拽Tab
Boolean	#DragThumbnail			= false		//Tab拖拽时显示缩略图
Boolean	#SmoothScroll				= false 		//平滑滚动效果
Boolean	#SmoothDrag				= false		//平滑拖拽效果
Boolean	#SmoothClose				= false		//平滑关闭效果

/*--- Implementation ---*/
Private:
n_imagelist		_ImageList
n_tooltip 			_ToolTip
n_dragicon			_dragIcon
TABCONTROLITEM	Items[]
PAINTPANE				ScrollBarUp
PAINTPANE				ScrollBarDown
PAINTPANE				Chevron
RECTF						rcWnd
RECTF						rcTabStrip

Ulong _TTID	

Ulong	_outlinePen

Ulong _hCurArrow
Ulong _hCurNo
Any	_anyPageOpenParam

Int		_mouseOverIndex 		= 0
Int		_mouseDownIndex	= 0
Int		_selectedIndex			= 0
Int		_firstIndex				= 0
Int		_lastIndex				= 0
Int		_draggingIndex			= 0
Int		_dbclkedIndex			= 0
Ulong	_lastPopupTime		= 0
Real	_ScrollPosition 			= 0
Real	_StartPoint 				= 0
Real	_EndPoint				= 0
Real 	_LastScrollPosition	 	= 0
Real	_smoothScrollSize		= 0

POINTF _mouseDownPoint
POINTF _lastMousePoint

WindowState _ParentLastWindowState

Boolean _MouseLeaveTracked 	= false
Boolean _MouseCaptured 		= false
Boolean _RedrawFlag				= true

//Tip text
Constant String TIP_CLOSEBUTTON 	= "关闭"
//Hit-test code
Constant Uint HTTABSTRIP 				= 100
Constant Uint HTSCROLLBARUP			= 101
Constant Uint HTSCROLLBARDOWN	= 102
Constant Uint HTCHEVRON 				= 103
Constant Uint HTITEM						= 104
//Timer ID
Constant Uint TM_DRAG			= 1
Constant Uint TM_SCROLL		= 2
Constant Uint TM_ANIMATION	= 3
Constant Uint TM_FLASH			= 4
//Timer interval (ms)
Constant Uint TMI_DRAG			= 15
Constant Uint TMI_SCROLL		= 15
Constant Uint TMI_ANIMATION	= 15
//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
Constant Uint ADJ_CHEVRON 			= 4
//Sizes
Constant Real SCROLLBARSIZE 		= 10 		//px
Constant Real CHEVRONSIZE			= 14 		//px
Constant Real CLOSEBUTTONSIZE 	= 14		//px
Constant Real DRAGICONWIDTH	= 150	//px
Constant Real DRAGICONHEIGHT	= 100	//px
//Props
Constant String PRP_WINDOWCREATOR = "{WINDOW_CREATOR}"
end variables

forward prototypes
private subroutine _of_updatetextsize ()
public function integer of_GetCount ()
public function string of_getimage (readonly integer index)
private subroutine _of_trackncmouseleave (readonly boolean track)
private subroutine _of_showtip (readonly integer index)
public function integer of_getindex (readonly string txt)
public function string of_gettext (readonly integer index)
public function boolean of_isenabled (readonly integer index)
public function boolean of_IsHighLighted (readonly integer index)
private subroutine _of_capturemouse (readonly boolean capture)
public function integer of_getselectedindex ()
private subroutine _of_updatepointstop ()
private subroutine _of_updatescrollbarpoints ()
private subroutine _of_updatepoints ()
public function boolean of_islocked (readonly integer index)
public function boolean of_isvisible (readonly integer index)
public function integer of_select (readonly integer index)
private subroutine _of_updateobjectposition (readonly integer index)
private subroutine _of_scrollup ()
private subroutine _of_scrolldown ()
private subroutine _of_updatepointsbottom ()
private subroutine _of_updatepointsleft ()
private subroutine _of_updatepointsright ()
public function boolean of_isdraggingmode ()
private subroutine _of_updatetextsize (readonly integer index)
public function boolean of_ismultiline (readonly integer index)
private subroutine _of_drawchevron (readonly boolean fadeanimation)
public function boolean of_isdisplaytext (readonly integer index)
public function string of_gettiptext (readonly integer index)
private function boolean _of_adjustscrollposition ()
public function boolean of_isusedanimatedimage (readonly integer index)
public function string of_getanimatedimage (readonly integer index)
public function boolean of_isflashing (readonly integer index)
private function boolean _of_hasvalidimage (readonly integer index)
public function long of_displaytext (readonly integer index, readonly boolean display)
public function long of_displaytextall (readonly boolean display)
public function long of_enable (readonly integer index, readonly boolean benabled)
public function long of_flash (readonly integer index, readonly long flashtime)
public function long of_highlight (readonly integer index, readonly boolean highlighted)
public function long of_lock (readonly integer index, readonly boolean locked)
public function long of_move (readonly integer srcindex, readonly integer dstindex)
public function long of_removeall ()
public function long of_setanimatedimage (readonly integer index, readonly string amimage)
public function long of_setimage (readonly integer index, readonly string image)
public function long of_setmultiline (readonly integer index, readonly boolean multiline)
public function long of_settext (readonly integer index, readonly string txt)
public function long of_settiptext (readonly integer index, readonly string tiptext)
public function long of_updatepoints ()
public function long of_useanimatedimage (readonly integer index, readonly boolean used)
public function long of_visible (readonly integer index, readonly boolean bvisible)
public function long of_redraw (readonly boolean fadeanimation)
public function integer of_getindexbyclassname (readonly string clsname)
public function long of_settiptime (readonly integer index, readonly long tiptime)
public function boolean of_isfloated (readonly integer index)
public function integer of_selectnext (readonly integer index)
public function integer of_selectprevious (readonly integer index)
public function integer of_getnextvisible (readonly integer index)
public function integer of_getpreviousvisible (readonly integer index)
public function integer of_getfirstvisible ()
public function integer of_getlastvisible ()
public function long of_showfloatwindow (readonly integer index)
public function long of_hidefloatwindow (readonly integer index)
public function long of_dock (readonly integer index)
public function long of_float (readonly integer index)
public function long of_float (readonly integer index, readonly string floatwndcls)
public function integer of_getdraggingindex ()
public function string of_getclassname (readonly integer index)
public function integer of_insertobject (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_insertobject (readonly integer index, readonly string clsname)
public function integer of_insertobject (readonly integer index, readonly string clsname, readonly string txt, readonly string image)
public function integer of_addobject (readonly string clsname, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addobject (readonly string clsname, readonly string txt, readonly string image)
public function integer of_addobject (readonly string clsname)
public function integer of_insertobject (readonly integer index, ref dragobject object, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_insertobject (readonly integer index, ref dragobject object, readonly string txt, readonly string image)
public function integer of_insertobject (readonly integer index, ref dragobject object)
public function integer of_addobject (ref dragobject object, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addobject (ref dragobject object, readonly string txt, readonly string image)
public function integer of_addobject (ref dragobject object)
public function integer of_insertpage (readonly integer index, ref u_cst_tabpage page, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_insertpage (readonly integer index, ref u_cst_tabpage page, readonly string txt, readonly string image)
public function integer of_insertpage (readonly integer index, ref u_cst_tabpage page)
public function integer of_addpage (ref u_cst_tabpage page, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addpage (ref u_cst_tabpage page, readonly string txt, readonly string image)
public function integer of_addpage (ref u_cst_tabpage page)
public function integer of_getindex (readonly dragobject object)
public function long of_getobject (readonly integer index, ref dragobject object)
public function long of_getpage (readonly integer index, ref u_cst_tabpage page)
private subroutine _of_fillbkgnd (readonly unsignedlong hdc)
private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawitemclosebutton (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawchevron (readonly unsignedlong hdc)
private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_flashdrawitem (readonly integer index)
private subroutine _of_drawitem (readonly integer index, readonly boolean bimageonly, readonly boolean fadeanimation)
private subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation)
public function long of_setdata (readonly integer index, readonly any data)
public function any of_getdata (readonly integer index)
public function string of_gettag (readonly integer index)
public function long of_settag (readonly integer index, readonly string stag)
private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly boolean fadeanimation)
private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly unsignedlong hdc)
private subroutine _of_trackncmousehover (readonly boolean track, readonly long hovertime)
private subroutine _of_trackmousehover (readonly boolean track, readonly long hovertime)
private function boolean _of_openwindow (ref window objectw, readonly string clsname)
private function boolean _of_openwindow (ref window objectw)
private function boolean _of_closewindow (readonly window objectW)
private function boolean _of_iswindowcreator (readonly window objectW)
public function integer of_getindex (readonly window objectw)
public function long of_getwindow (readonly integer index, ref window objectw)
public function long of_getpagew (readonly integer index, ref s_cst_tabpagew pagew)
public function integer of_addwindowwithparm (ref window objectw, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addwindowwithparm (ref window objectw, readonly any aparm, readonly string txt, readonly string image)
public function integer of_addwindowwithparm (ref window objectw, readonly any aparm)
public function integer of_addwindowwithparm (readonly string clsname, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addwindowwithparm (readonly string clsname, readonly any aparm, readonly string txt, readonly string image)
public function integer of_addwindowwithparm (readonly string clsname, readonly any aparm)
public function integer of_addwindow (ref window objectw, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addwindow (ref window objectw, readonly string txt, readonly string image)
public function integer of_addwindow (ref window objectw)
public function integer of_addwindow (readonly string clsname, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addwindow (readonly string clsname, readonly string txt, readonly string image)
public function integer of_addwindow (readonly string clsname)
public function integer of_insertwindowwithparm (readonly integer index, ref window objectw, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_insertwindowwithparm (readonly integer index, ref window objectw, readonly any aparm, readonly string txt, readonly string image)
public function integer of_insertwindowwithparm (readonly integer index, ref window objectw, readonly any aparm)
public function integer of_insertwindowwithparm (readonly integer index, readonly string clsname, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_insertwindowwithparm (readonly integer index, readonly string clsname, readonly any aparm, readonly string txt, readonly string image)
public function integer of_insertwindowwithparm (readonly integer index, readonly string clsname, readonly any aparm)
public function integer of_insertwindow (readonly integer index, ref window objectw, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_insertwindow (readonly integer index, ref window objectw, readonly string txt, readonly string image)
public function integer of_insertwindow (readonly integer index, ref window objectw)
public function integer of_insertwindow (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_insertwindow (readonly integer index, readonly string clsname, readonly string txt, readonly string image)
public function integer of_insertwindow (readonly integer index, readonly string clsname)
public function integer of_addpagewwithparm (ref s_cst_tabpagew pagew, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addpagewwithparm (ref s_cst_tabpagew pagew, readonly any aparm, readonly string txt, readonly string image)
public function integer of_addpagewwithparm (ref s_cst_tabpagew pagew, readonly any aparm)
public function integer of_addpagew (ref s_cst_tabpagew pagew, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addpagew (ref s_cst_tabpagew pagew, readonly string txt, readonly string image)
public function integer of_addpagew (ref s_cst_tabpagew pagew)
public function integer of_insertpagewwithparm (readonly integer index, ref s_cst_tabpagew pagew, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_insertpagewwithparm (readonly integer index, ref s_cst_tabpagew pagew, readonly any aparm, readonly string txt, readonly string image)
public function integer of_insertpagewwithparm (readonly integer index, ref s_cst_tabpagew pagew, readonly any aparm)
public function integer of_insertpagew (readonly integer index, ref s_cst_tabpagew pagew, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_insertpagew (readonly integer index, ref s_cst_tabpagew pagew, readonly string txt, readonly string image)
public function integer of_insertpagew (readonly integer index, ref s_cst_tabpagew pagew)
public function boolean of_iswindow (readonly integer index)
public function boolean of_ispage (readonly integer index)
public function boolean of_ispagew (readonly integer index)
public function long of_removeall (readonly boolean bforce)
public function long of_remove (readonly integer index, boolean bforce)
public function long of_remove (readonly integer index)
public function long of_scrollto (readonly integer index, readonly long flag)
public function long of_scrollto (readonly integer index)
public function integer setredraw (boolean f)
public function integer of_insertpagewithparm (readonly integer index, ref u_cst_tabpage page, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_insertpagewithparm (readonly integer index, ref u_cst_tabpage page, readonly any aparm, readonly string txt, readonly string image)
public function integer of_insertpagewithparm (readonly integer index, ref u_cst_tabpage page, readonly any aparm)
public function integer of_insertpagewithparm (readonly integer index, readonly string clsname, readonly any aparm, readonly string txt, readonly string image)
public function integer of_insertpagewithparm (readonly integer index, readonly string clsname, readonly any aparm)
public function integer of_insertpagewithparm (readonly integer index, readonly string clsname, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_insertpagewithparm (ref u_cst_tabpage page, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addpagewithparm (readonly string clsname, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addpagewithparm (ref u_cst_tabpage page, readonly any aparm, readonly string txt, readonly string image)
public function integer of_addpagewithparm (ref u_cst_tabpage page, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext)
public function integer of_addpagewithparm (ref u_cst_tabpage page, readonly any aparm)
public function integer of_addpagewithparm (readonly string clsname, readonly any aparm, readonly string txt, readonly string image)
public function integer of_addpagewithparm (readonly string clsname, readonly any aparm)
public function unsignedlong of_getchevronstate ()
public function unsignedlong of_getitemstate (readonly integer index)
public function unsignedlong of_getitemclosebuttonstate (readonly integer index)
public function integer of_getindexbytag (readonly string stag)
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
private function unsignedlong _of_popupmenu (real xpos, real ypos)
public function integer of_indexfrompoint (readonly real xpos, readonly real ypos)
private function boolean _of_isoverclosebutton (readonly integer index, readonly real xpos, readonly real ypos)
public function long of_float (readonly integer index, readonly real floatx, readonly real floaty, readonly string floatwndcls)
public function long of_float (readonly integer index, readonly real floatx, readonly real floaty, readonly real floatwidth, readonly real floatheight, readonly string floatwndcls)
public function long of_float (readonly integer index, readonly real floatx, readonly real floaty)
private subroutine _of_offsetitemposition (readonly integer index, readonly real offsetsize)
private function real _of_gettabstripsize ()
private subroutine _of_scrollposition (readonly real scrollsize)
private function boolean _of_openwindowwithparm (ref window objectw, readonly any aparm, readonly string clsname)
private function boolean _of_openwindowwithparm (ref window objectw, readonly any aparm)
end prototypes

event type long onncpaint(unsignedlong hdc);int index,nSelectedIndex
RECTF tabStripRect

if #LockUpdate then return 1

Event OnNcEraseBkgnd(hdc)

if theme.#TabStripBar then
	if ScrollBarUp.visible then
		_of_DrawScrollBar(ScrollBarUp,hdc)
		Painter.ExcludeClipRect(hdc,ScrollBarUp.rcPaint)
	end if
	if ScrollBarDown.visible then
		_of_DrawScrollBar(ScrollBarDown,hdc)
		Painter.ExcludeClipRect(hdc,ScrollBarDown.rcPaint)
	end if
	if Chevron.visible then
		_of_DrawChevron(hdc)
		Painter.ExcludeClipRect(hdc,Chevron.rcPaint)
	end if
		
	tabStripRect = rcTabStrip
	_of_AdjustRect(ref tabStripRect,ADJ_BORDER + ADJ_CHEVRON)
	
	Painter.IntersectClipRect(hdc,tabStripRect)

	for index = 1 to UpperBound(Items)
		if Not Items[index].visible or Items[index].Hidden or Items[index].Floated or Items[index].PaintPath = 0 then continue
		if index = _selectedIndex then
			nSelectedIndex = index
			continue
		end if
		_of_DrawItem(index,hdc)
	next
	if nSelectedIndex > 0 then
		_of_DrawItem(nSelectedIndex,hdc)
	end if
	
	Painter.SelectClipRgn(hdc,0)
end if

return 1
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
	if _mouseDownIndex>0 then
		if Items[_mouseDownIndex].CloseButton.mousedown then
			Items[_mouseDownIndex].CloseButton.mousedown=false
			_of_DrawItem(_mouseDownIndex,true)
		end if
		_mouseDownIndex = 0
	end if
	if _draggingIndex > 0 then				//Dragging mode
		if _dragIcon.IsDragging() then
			_dragIcon.EndDrag()
		end if
		of_ScrollTo(_draggingIndex)
		if #SmoothDrag then
			Timer.Start(TM_DRAG,TMI_DRAG)
		else
			_of_OffsetItemPosition(_draggingIndex,-Items[_draggingIndex].OffsetPosition)
			Items[_draggingIndex].OffsetPosition = 0
			of_Redraw(false)
		end if
		_draggingIndex = 0
	end if
	Event OnNcMouseLeave()
end if
end event

event Onncmouseleave();if Not _MouseCaptured then
	if _mouseOverIndex>0 then
		Items[_mouseOverIndex].mouseover=false
		Items[_mouseOverIndex].closebutton.mouseover=false
		if Items[_mouseOverIndex].CloseButton.Visible then
			if Not (BitAND(theme.#TabCloseButton,theme.TBC_SHOW) > 0) and &
				Not (BitAND(theme.#TabCloseButton,theme.TBC_SELECTED) > 0 and Items[_mouseOverIndex].Selected) and &
				Not Items[_mouseOverIndex].CloseButton.MouseDown then
				Items[_mouseOverIndex].CloseButton.Visible = false
			end if
		end if
		_of_DrawItem(_mouseOverIndex,true)
		Event OnTabMouseLeave(_mouseOverIndex)
		_mouseOverIndex = 0
	end if
	
	if ScrollBarUp.MouseOver then
		ScrollBarUp.MouseOver = false
		_of_DrawScrollBar(ScrollBarUp,true)
	end if
	
	if ScrollBarDown.MouseOver then
		ScrollBarDown.MouseOver = false
		_of_DrawScrollBar(ScrollBarDown,true)
	end if
	
	if Chevron.MouseOver then
		Chevron.MouseOver = false
		_of_DrawChevron(true)
	end if
end if

_of_ShowTip(0)

_of_TrackNcMouseLeave(false)
end event

event type long onwindowsizing(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);rcWnd.right = newWidth
rcWnd.bottom = newHeight
rcTabStrip = rcWnd

choose case theme.#TabPosition
	case TabsOnLeft!
		rcTabStrip.Right 	= _of_GetTabStripSize()
		rcTabStrip.left += theme.#TabStripOffset.left
		rcTabStrip.top += theme.#TabStripOffset.top
		rcTabStrip.bottom -= theme.#TabStripOffset.bottom
	case TabsOnTop!
		rcTabStrip.Bottom =  _of_GetTabStripSize()
		rcTabStrip.left += theme.#TabStripOffset.left
		rcTabStrip.top += theme.#TabStripOffset.top
		rcTabStrip.right -= theme.#TabStripOffset.right
	case TabsOnRight!
		rcTabStrip.Left 		= rcWnd.right - _of_GetTabStripSize()
		rcTabStrip.top += theme.#TabStripOffset.top
		rcTabStrip.right -= theme.#TabStripOffset.right
		rcTabStrip.bottom -= theme.#TabStripOffset.bottom
	case TabsOnBottom!
		rcTabStrip.Top 	= rcWnd.bottom - _of_GetTabStripSize()
		rcTabStrip.left += theme.#TabStripOffset.left
		rcTabStrip.right -= theme.#TabStripOffset.right
		rcTabStrip.bottom -= theme.#TabStripOffset.bottom
end choose

_of_UpdateObjectPosition(_selectedIndex)

if theme.#TabStripBar then
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
end if

return 0
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);int index
long hitTestCode
real offsetSize
RECTF wndRect
RECTF origRect
RECTF adjustedRect
RECTF scWorkArea
POINTF pt

if Not _MouseCaptured then return 0

Painter.GetWindowRect(#Handle,ref wndRect)
Painter.GetCursorPos(ref pt)
xpos = pt.x - wndRect.left
ypos = pt.y - wndRect.top

if of_IsDraggingMode()	then				//Dragging mode
	
	if _dragIcon.IsDragging() then
		Painter.GetScreenWorkArea(ref scWorkArea)
		if Painter.PtInRect(ref scWorkArea,pt.x,pt.y) then
			Win32.SetCursor(_hCurArrow)
		else
			Win32.SetCursor(_hCurNo)
		end if
		_dragIcon.DragMove(pt.x,pt.y + 16)
	end if
	
	if Painter.PtInRect(rcTabStrip,xpos,ypos) or vKey = 0 then
		
		if ScrollBarUp.Visible and vKey = WinMsg.MK_LBUTTON then
			if Painter.PtInRect(ScrollBarUp.rcPaint,xpos,ypos) then
				_of_TrackMouseHover(true,100)
				return 0
			end if
		end if
		
		if ScrollBarDown.Visible and vKey = WinMsg.MK_LBUTTON then
			if Painter.PtInRect(ScrollBarDown.rcPaint,xpos,ypos) then
				_of_TrackMouseHover(true,100)
				return 0
			end if
		end if
		
		if vKey = 0 then
			_smoothScrollSize = 0
			Timer.Stop(TM_SCROLL)
		end if
		
		adjustedRect = rcTabStrip
		_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)
		
		Painter.CopyRect(ref origRect,ref Items[_draggingIndex].rcPaint)
		
		if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
			
			Painter.OffsetRect(ref origRect,0,-Items[_draggingIndex].OffsetPosition)
			
			if origRect.Top + (ypos - _mouseDownPoint.y) <= adjustedRect.Top then
				offsetSize = (adjustedRect.Top - origRect.Top) - Items[_draggingIndex].OffsetPosition
			elseif origRect.Bottom + (ypos - _mouseDownPoint.y) >= adjustedRect.Bottom then
				offsetSize = (adjustedRect.Bottom - origRect.Bottom) - Items[_draggingIndex].OffsetPosition
			else
				offsetSize = (ypos - _mouseDownPoint.y) - Items[_draggingIndex].OffsetPosition
			end if
			if offsetSize <> 0 then
				_of_OffsetItemPosition(_draggingIndex,offsetSize)
				Items[_draggingIndex].OffsetPosition += offsetSize
				of_Redraw(false)
			end if
			
			if Abs(ypos - _lastMousePoint.y) > 4 then	//降低鼠标移动的敏感度
				if ypos > _lastMousePoint.y then		//Bottom dragging
					
					for index = UpperBound(Items) to _draggingIndex + 1 step -1
						if Not Items[index].Visible then continue
						if Items[index].Floated then continue
				//		if Items[index].OffsetPosition <> 0 then continue
						if Items[_draggingIndex].rcPaint.Bottom > Items[index].rcPaint.Top + (Items[index].rcPaint.Bottom - Items[index].rcPaint.Top) / 2 then
							if IsSucceeded(of_Move(_draggingIndex,index)) then
								exit
							end if
						end if
					next
					
				else												//Top draggging
					
					for index = 1 to _draggingIndex - 1
						if Not Items[index].Visible then continue
						if Items[index].Floated then continue
					//	if Items[index].OffsetPosition <> 0 then continue
						if Items[_draggingIndex].rcPaint.Top < Items[index].rcPaint.Top + (Items[index].rcPaint.Bottom - Items[index].rcPaint.Top) / 2 then
							if IsSucceeded(of_Move(_draggingIndex,index)) then
								exit
							end if
						end if
					next
					
				end if
				_lastMousePoint.y = ypos
			end if
		else
			
			Painter.OffsetRect(ref origRect,-Items[_draggingIndex].OffsetPosition,0)
			
			if origRect.Left + (xpos - _mouseDownPoint.x) <= adjustedRect.Left then
				offsetSize = (adjustedRect.Left - origRect.Left) - Items[_draggingIndex].OffsetPosition
			elseif origRect.Right + (xpos - _mouseDownPoint.x) >= adjustedRect.Right then
				offsetSize = (adjustedRect.Right - origRect.Right) - Items[_draggingIndex].OffsetPosition
			else
				offsetSize = (xpos - _mouseDownPoint.x) - Items[_draggingIndex].OffsetPosition
			end if
			if offsetSize <> 0 then
				_of_OffsetItemPosition(_draggingIndex,offsetSize)
				Items[_draggingIndex].OffsetPosition += offsetSize
				of_Redraw(false)
			end if
			
			if Abs(xpos - _lastMousePoint.x) > 4 then	//降低鼠标移动的敏感度
				if xpos > _lastMousePoint.x then		//Right dragging
					
					for index = UpperBound(Items) to _draggingIndex + 1 step -1
						if Not Items[index].Visible then continue
						if Items[index].Floated then continue
					//	if Items[index].OffsetPosition <> 0 then continue
						if Items[_draggingIndex].rcPaint.Right > Items[index].rcPaint.Left + (Items[index].rcPaint.Right - Items[index].rcPaint.Left) / 2 then
							if IsSucceeded(of_Move(_draggingIndex,index)) then
								exit
							end if
						end if
					next
					
				else												//Left draggging
					
					for index = 1 to _draggingIndex - 1
						if Not Items[index].Visible then continue
						if Items[index].Floated then continue
						//if Items[index].OffsetPosition <> 0 then continue
						if Items[_draggingIndex].rcPaint.Left < Items[index].rcPaint.Left + (Items[index].rcPaint.Right - Items[index].rcPaint.Left) / 2 then
							if IsSucceeded(of_Move(_draggingIndex,index)) then
								exit
							end if
						end if
					next
					
				end if
				_lastMousePoint.x = xpos
			end if
		end if
	end if
	
elseif ScrollBarUp.MouseDown or ScrollBarDown.MouseDown or _mouseDownIndex > 0 then
	
	hitTestCode = Event OnNcHitTest(xpos,ypos)
		
	if IsNull(hitTestCode) then
		hitTestCode = 0
	end if
	
	Event OnNcMouseMove(hitTestCode,xpos,ypos)
end if
return 0
end event

event type long onncmousemove(unsignedlong hittestcode, real xpos, real ypos);int index
POINTF pt

if of_IsDraggingMode() then return 1

if Not _MouseLeaveTracked and Not _MouseCaptured then
	_of_TrackNcMouseLeave(true)
end if

if #AllowTabDrag and _mouseDownIndex > 0	and KeyDown(KeyLeftButton!)  and Not KeyDown(KeyRightButton!) then
	if Not Items[_mouseDownIndex].CloseButton.MouseOver and &
		Not Items[_mouseDownIndex].CloseButton.MouseDown then
		if Abs(xpos - _mouseDownPoint.x) > 4 or Abs(ypos - _mouseDownPoint.y) > 4 then
			if IsAllowed(Event OnTabBeginDrag(_mouseDownIndex)) then
				_draggingIndex = _mouseDownIndex
				if #DragThumbnail then
					ulong hWndThumb
					Painter.GetCursorPos(ref pt)
					if Items[_draggingIndex].IsWindow then
						hWndThumb = Handle(Items[_draggingIndex].ObjectW)
					else
						hWndThumb = Handle(Items[_draggingIndex].Object)
					end if
					_dragIcon.BeginDragEx(hWndThumb,pt.x,pt.y + 16,DRAGICONWIDTH,DRAGICONHEIGHT,200,theme.of_GetColor(theme.CLR_BORDER,0))
				end if
				_lastMousePoint.x = xpos
				_lastMousePoint.y = ypos
				_of_CaptureMouse(true)
				return 1
			end if
		end if
	end if
end if

if hitTestCode > HTITEM then
	index = hitTestCode - HTITEM
end if

if _mouseOverIndex <> index then
	if _mouseOverIndex>0 then
		Items[_mouseOverIndex].mouseover=false
		Items[_mouseOverIndex].CloseButton.mouseover=false
		if Items[_mouseOverIndex].CloseButton.Visible then
			if Not (BitAND(theme.#TabCloseButton,theme.TBC_SHOW) > 0) and &
				Not (BitAND(theme.#TabCloseButton,theme.TBC_SELECTED) > 0 and Items[_mouseOverIndex].Selected) and &
				Not Items[_mouseOverIndex].CloseButton.MouseDown then
				Items[_mouseOverIndex].CloseButton.Visible = false
			end if
		end if
		_of_DrawItem(_mouseOverIndex,true)
		_of_ShowTip(0)
		Event OnTabMouseLeave(_mouseOverIndex)
	end if

	_mouseOverIndex = index
	
	if index > 0 then
		Items[index].mouseover=true
		if Not Items[index].Locked and theme.#TabCloseButton <> theme.TBC_HIDE then
			if (BitAND(theme.#TabCloseButton,theme.TBC_SHOW) > 0) or &
				(BitAND(theme.#TabCloseButton,theme.TBC_SELECTED) > 0 and Items[index].Selected) or &
				(BitAND(theme.#TabCloseButton,theme.TBC_MOUSEOVER) > 0 and Items[index].MouseOver) then
				Items[index].CloseButton.Visible = true
				if _of_isOverCloseButton(index,xpos,ypos) then
					Items[index].CloseButton.mouseover=true
				else
					Items[index].CloseButton.mouseover=false
				end if
			else
				Items[index].CloseButton.Visible = false
			end if
		else
			Items[index].CloseButton.Visible = false
		end if
		_of_DrawItem(index,true)
		_of_ShowTip(_mouseOverIndex)
		Event OnTabMouseEnter(index,xpos,ypos)
	end if
	
elseif _mouseOverIndex>0 then
	if _of_isOverCloseButton(_mouseOverIndex,xpos,ypos) then
		if Not Items[_mouseOverIndex].CloseButton.mouseover then
			Items[_mouseOverIndex].CloseButton.mouseover=true
			_of_DrawItem(_mouseOverIndex,true)
			_of_ShowTip(_mouseOverIndex)
		end if
	else
		if Items[_mouseOverIndex].CloseButton.mouseover then
			Items[_mouseOverIndex].CloseButton.mouseover=false
			_of_DrawItem(_mouseOverIndex,true)
			_of_ShowTip(_mouseOverIndex)
		end if
	end if
	Event OnTabMouseMove(_mouseOverIndex,xpos,ypos)
end if

if hitTestCode = HTSCROLLBARUP then
	if Not ScrollBarUp.MouseOver then
		ScrollBarUp.MouseOver = true
		_of_DrawScrollBar(ScrollBarUp,true)
		_of_ShowTip(0)
		if #AutoScroll then
			_of_TrackNcMouseHover(true,100)
		end if
	elseif ScrollBarUp.MouseDown then
		_of_TrackMouseHover(true,100)
	end if
else
	if ScrollBarUp.MouseOver then
		ScrollBarUp.MouseOver = false
		_of_DrawScrollBar(ScrollBarUp,true)
	end if
end if

if hitTestCode = HTSCROLLBARDOWN then
	if Not ScrollBarDown.MouseOver then
		ScrollBarDown.MouseOver = true
		_of_DrawScrollBar(ScrollBarDown,true)
		_of_ShowTip(0)
		if #AutoScroll then
			_of_TrackNcMouseHover(true,100)
		end if
	elseif ScrollBarDown.MouseDown then
		_of_TrackMouseHover(true,100)
	end if
else
	if ScrollBarDown.MouseOver then
		ScrollBarDown.MouseOver = false
		_of_DrawScrollBar(ScrollBarDown,true)
	end if
end if

if hitTestCode = HTCHEVRON then
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

event type long onnccalcsize(unsignedlong lpcrect);real offsetSize,fBorderSize
RECTF cRect

Painter.CopyRect(ref cRect,lpcRect)

if theme.#BorderStyle = Enums.BS_SOLID then
	fBorderSize = P2DX(1)
	Painter.InflateRect(ref cRect,-fBorderSize,-fBorderSize)
	offsetSize = fBorderSize
end if

if theme.#TabStripBar then
	choose case theme.#TabPosition
		case TabsOnLeft!
			cRect.left += _of_GetTabStripSize() - offsetSize
		case TabsOnTop!
			cRect.top += _of_GetTabStripSize() - offsetSize
		case TabsOnRight!
			cRect.right -= _of_GetTabStripSize()  - offsetSize
		case TabsOnBottom!
			cRect.bottom -= _of_GetTabStripSize() - offsetSize
	end choose
end if

Painter.CopyRect(lpcRect,ref cRect)

return 0
end event

event type long onnclbuttondblclk(unsignedlong hittestcode, real xpos, real ypos);int li_dbclkedIndex
boolean bDBClicked

if _dbclkedIndex > 0 then
	if _dbclkedIndex = of_IndexFromPoint(xpos,ypos) then
		if Not Items[_dbclkedIndex].CloseButton.MouseOver then
			bDBClicked = true
		end if
	end if
end if

li_dbclkedIndex = _dbclkedIndex
_dbclkedIndex = 0

if bDBClicked then
	if IsAllowed(Event OnTabDoubleClicking(li_dbclkedIndex,xpos,ypos)) then
		Event OnTabDoubleClicked(li_dbclkedIndex,xpos,ypos)
	end if
else
	Event OnNcLButtonDown(hittestcode,xpos,ypos)
end if

return 0
end event

event type long onnclbuttondown(unsignedlong hittestcode, real xpos, real ypos);if Not _MouseLeaveTracked or Timer.IsRunning(TM_SCROLL)  or Timer.IsRunning(TM_DRAG) then
	Event	OnNcMouseMove(hittestcode,xpos,ypos)
end if

_mouseDownIndex = 0
_dbclkedIndex = 0

if Not #AutoScroll then
	if ScrollBarUp.MouseOver then
		ScrollBarUp.MouseDown = true
		_of_DrawScrollBar(ScrollBarUp,false)
		_of_CaptureMouse(true)
		_of_TrackNcMouseHover(true,500)
		_of_ScrollUp()
		return 0
	end if
	
	if ScrollBarDown.MouseOver then
		ScrollBarDown.MouseDown = true
		_of_DrawScrollBar(ScrollBarDown,false)
		_of_CaptureMouse(true)
		_of_TrackNcMouseHover(true,500)
		_of_ScrollDown()
		return 0
	end if
end if

if Chevron.MouseOver then
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
		//激活Float窗口
		//感谢Coffee反馈此BUG
		//2015-05-04
		if of_IsFloated(pmCode) then
			of_ShowFloatWindow(pmCode)
		else
			of_Select(pmCode)
		end if
	end if
	return 0
end if

if _mouseOverIndex > 0 then
	_mouseDownIndex = _mouseOverIndex
	_mouseDownPoint.x = xpos
	_mouseDownPoint.y = ypos
	if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
		_mouseDownPoint.y -= Items[_mouseDownIndex].OffsetPosition
	else
		_mouseDownPoint.x -= Items[_mouseDownIndex].OffsetPosition
	end if
	
	_of_ShowTip(0)
	if Items[_mouseOverIndex].CloseButton.MouseOver then
		Items[_mouseOverIndex].CloseButton.mousedown=true
		_of_DrawItem(_mouseOverIndex,false)
		_of_CaptureMouse(true)
	else
		_dbclkedIndex = _mouseOverIndex
		of_Select(_mouseOverIndex)
	end if
end if

return 0
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);boolean bTabDragDrop
RECTF wndRect
RECTF scWorkArea
POINTF pt

if Not _MouseCaptured then return 0

if of_IsDraggingMode() then
	Painter.GetWindowRect(#Handle,ref wndRect)
	Painter.GetCursorPos(ref pt)
	xpos = pt.x - wndRect.left
	ypos = pt.y - wndRect.top
	
	if _dragIcon.IsDragging() then
		_dragIcon.EndDrag()
	end if
	if Painter.PtInRect(rcTabStrip,xpos,ypos) then
		if ScrollBarUp.Visible or ScrollBarDown.Visible then
			Event OnMouseMove(0,0,0)
		end if
	end if
	Painter.GetScreenWorkArea(ref scWorkArea)
	if Painter.PtInRect(ref scWorkArea,pt.x,pt.y) then
		bTabDragDrop = true
	end if
end if

_of_CaptureMouse(false)
_of_TrackNcMouseLeave(true)

if ScrollBarUp.MouseDown then
	ScrollBarUp.MouseDown = false
	_of_DrawScrollBar(ScrollBarUp,true)
end if

if ScrollBarDown.MouseDown then
	ScrollBarDown.MouseDown = false
	_of_DrawScrollBar(ScrollBarDown,true)
end if

if _mouseDownIndex > 0 then
	if Items[_mouseDownIndex].CloseButton.MouseDown then
		Items[_mouseDownIndex].CloseButton.MouseDown = false
		if Not (BitAND(theme.#TabCloseButton,theme.TBC_SHOW) > 0) and &
			Not (BitAND(theme.#TabCloseButton,theme.TBC_SELECTED) > 0 and Items[_mouseDownIndex].Selected) and &
			Not (BitAND(theme.#TabCloseButton,theme.TBC_MOUSEOVER) > 0 and Items[_mouseDownIndex].MouseOver) then
			Items[_mouseDownIndex].CloseButton.Visible = false
		end if
		_of_DrawItem(_mouseDownIndex,true)
		if Items[_mouseDownIndex].CloseButton.MouseOver then		//CloseButton clicked
			of_Remove(_mouseDownIndex)
		end if
	end if
	if _draggingIndex > 0 then				//Dragging mode
		if bTabDragDrop then
			Event OnTabDragDrop(_draggingIndex,pt.x,pt.y)
		end if
		if Not Items[_draggingIndex].Floated then
			of_ScrollTo(_draggingIndex)
			if Items[_draggingIndex].OffsetPosition <> 0 then
				if #SmoothDrag then
					Timer.Start(TM_DRAG,TMI_DRAG)
				else
					_of_OffsetItemPosition(_draggingIndex,-Items[_draggingIndex].OffsetPosition)
					Items[_draggingIndex].OffsetPosition = 0
					of_Redraw(false)
				end if
			end if
		end if
		_draggingIndex = 0
	end if
	_mouseDownIndex = 0
end if
	
return 0
end event

event type long onnchittest(real xpos, real ypos);int index

index = of_IndexFromPoint(xpos,ypos)

choose case index
	case IDX_SCROLLBARUP
		return HTSCROLLBARUP
	case IDX_SCROLLBARDOWN
		return HTSCROLLBARDOWN
	case IDX_CHEVRON
		return HTCHEVRON
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

event type long onncrbuttondown(unsignedlong hittestcode, real xpos, real ypos);if Not _MouseLeaveTracked or Timer.IsRunning(TM_SCROLL)  or Timer.IsRunning(TM_DRAG) then
	Event	OnNcMouseMove(hittestcode,xpos,ypos)
end if

_mouseDownIndex = 0
_dbclkedIndex = 0

if _mouseOverIndex > 0 then
	_of_ShowTip(0)
	if Not Items[_mouseOverIndex].CloseButton.MouseOver then
		_mouseDownIndex = _mouseOverIndex
		_dbclkedIndex = _mouseOverIndex
	end if
end if

return 0
end event

event type long onncmousehover(unsignedlong hittestcode, real xpos, real ypos);boolean trackMouseHover

if ScrollBarUp.visible and HitTestCode = HTSCROLLBARUP and &
	(#AutoScroll or ScrollBarUp.MouseDown) then
	_of_ScrollUp()
	trackMouseHover = true
end if

if ScrollBarDown.visible and HitTestCode = HTSCROLLBARDOWN and &
	(#AutoScroll or ScrollBarDown.MouseDown) then
	_of_ScrollDown()
	trackMouseHover = true
end if

if #SmoothScroll then
	_of_TrackNcMouseHover(trackMouseHover,100)
else
	_of_TrackNcMouseHover(trackMouseHover,200)
end if

return 0
end event

event type long onmousehover(unsignedlong vkey, real xpos, real ypos);boolean trackMouseHover = false
RECTF wndRect
POINTF pt

if Not _MouseCaptured then return 0

Painter.GetWindowRect(#Handle,ref wndRect)
Painter.GetCursorPos(ref pt)
xpos = pt.x - wndRect.left
ypos = pt.y - wndRect.top

if ScrollBarUp.visible and Painter.PtInRect(ScrollBarUp.rcPaint,xpos,ypos) and &
	(#AutoScroll or ScrollBarUp.MouseDown or (of_IsDraggingMode() and vkey = WinMsg.MK_LBUTTON)) then
	_of_ScrollUp()
	trackMouseHover = true
end if

if ScrollBarDown.visible and Painter.PtInRect(ScrollBarDown.rcPaint,xpos,ypos) and &
	(#AutoScroll or ScrollBarDown.MouseDown or (of_IsDraggingMode() and vkey = WinMsg.MK_LBUTTON)) then
	_of_ScrollDown()
	trackMouseHover = true
end if

if #SmoothScroll then
	_of_TrackMouseHover(trackMouseHover,100)
else
	_of_TrackMouseHover(trackMouseHover,200)
end if

return 0
end event

event type long onnclbuttonup(unsignedlong hittestcode, real xpos, real ypos);int li_mouseDownIndex
boolean bClicked

if _mouseDownIndex > 0 then
	if _mouseDownIndex = of_IndexFromPoint(xpos,ypos) then
		if Not Items[_mouseDownIndex].CloseButton.MouseOver then
			bClicked = true
		end if
	end if
end if

li_mouseDownIndex = _mouseDownIndex
_mouseDownIndex = 0

if bClicked then
	if IsAllowed(Event OnTabClicking(li_mouseDownIndex,xpos,ypos)) then
		Event OnTabClicked(li_mouseDownIndex,xpos,ypos)
	end if
end if

return 0
end event

event type long onmousewheel(unsignedlong vkey, long zdelta, real xpos, real ypos);int i,steps

if Not Painter.PtInRect(rcTabStrip,xpos,ypos) then return 0

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

if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then return 0
if Not Painter.PtInRect(rcTabStrip,xpos,ypos) then return 0

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

event type long onncerasebkgnd(unsignedlong hdc);if #LockUpdate then return 1

_of_FillBkgnd(hdc)

return 1
end event

event type long onkeydown(unsignedinteger nchar, unsignedinteger nrepcnt, unsignedlong nflags);if KeyDown(KeyEscape!) and of_IsDraggingMode() then
	if _dragIcon.IsDragging() then
		_dragIcon.EndDrag()
	end if
	of_ScrollTo(_draggingIndex)
	if Items[_draggingIndex].OffsetPosition <> 0 then
		if #SmoothDrag then
			Timer.Start(TM_DRAG,TMI_DRAG)
		else
			_of_OffsetItemPosition(_draggingIndex,-Items[_draggingIndex].OffsetPosition)
			Items[_draggingIndex].OffsetPosition = 0
			of_Redraw(false)
		end if
	end if
	_draggingIndex = 0
	_mouseDownIndex = 0
	_of_CaptureMouse(false)
	_of_TrackNcMouseLeave(true)
end if

return 0
end event

event type long onrbuttondown(unsignedlong vkey, real xpos, real ypos);if of_IsDraggingMode() then
	if _dragIcon.IsDragging() then
		_dragIcon.EndDrag()
	end if
	of_ScrollTo(_draggingIndex)
	if Items[_draggingIndex].OffsetPosition <> 0 then
		if #SmoothDrag then
			Timer.Start(TM_DRAG,TMI_DRAG)
		else
			_of_OffsetItemPosition(_draggingIndex,-Items[_draggingIndex].OffsetPosition)
			Items[_draggingIndex].OffsetPosition = 0
			of_Redraw(false)
		end if
	end if
	_draggingIndex = 0
	_mouseDownIndex = 0
	_of_CaptureMouse(false)
	_of_TrackNcMouseLeave(true)
end if

return 0
end event

event type long onncrbuttonup(unsignedlong hittestcode, real xpos, real ypos);int li_mouseDownIndex
boolean bClicked

if _mouseDownIndex > 0 then
	if _mouseDownIndex = of_IndexFromPoint(xpos,ypos) then
		if Not Items[_mouseDownIndex].CloseButton.MouseOver then
			bClicked = true
		end if
	end if
end if

li_mouseDownIndex = _mouseDownIndex
_mouseDownIndex = 0

if bClicked then
	if IsAllowed(Event OnTabRightClicking(li_mouseDownIndex,xpos,ypos)) then
		Event OnTabRightClicked(li_mouseDownIndex,xpos,ypos)
	end if
end if

return 0
end event

event type long onncrbuttondblclk(unsignedlong hittestcode, real xpos, real ypos);int li_dbclkedIndex
boolean bDBClicked

if _dbclkedIndex > 0 then
	if _dbclkedIndex = of_IndexFromPoint(xpos,ypos) then
		if Not Items[_dbclkedIndex].CloseButton.MouseOver then
			bDBClicked = true
		end if
	end if
end if

li_dbclkedIndex = _dbclkedIndex
_dbclkedIndex = 0

if bDBClicked then
	if IsAllowed(Event OnTabRightDoubleClicking(li_dbclkedIndex,xpos,ypos)) then
		Event OnTabRightDoubleClicked(li_dbclkedIndex,xpos,ypos)
	end if
else
	Event OnNcRButtonDown(hittestcode,xpos,ypos)
end if

return 0
end event

private subroutine _of_updatetextsize ();int index

for index = 1 to UpperBound(Items)
	_of_UpdateTextSize(index)
next
end subroutine

public function integer of_GetCount ();return UpperBound(Items)
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

private subroutine _of_showtip (readonly integer index);string tipText
RECTF scRect
SIZEF toolSize
POINTF pt

if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _MouseCaptured then return

if #ToolTip and (index > 0 and index <= UpperBound(Items)) then
	if Items[index].CloseButton.MouseOver then
		tipText = I18N(Enums.I18N_CAT_TABCONTROL,TIP_CLOSEBUTTON)
	else
		tipText = Items[index].tipText
	end if
	if tipText <> "" then
		Painter.GetScreenRect(ref scRect)
		Painter.GetCursorPos(ref pt)
		_ToolTip.TrackActivate(#Handle,_TTID,false)
		_ToolTip.UpdateTipText(#Handle,_TTID,tipText)
		_ToolTip.GetBubbleSize(#Handle,_TTID,ref toolSize.cx,ref toolSize.cy)
		if pt.x + toolSize.cx  > scRect.right then
			_ToolTip.TrackPosition( 0,scRect.right -  toolSize.cx,pt.y + 16)
		else
			_ToolTip.TrackPosition( 0,pt.x,pt.y + 16)
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

private subroutine _of_updatepointstop ();int	index
real ll_x,ll_top
real itemSize
real maxSize
real offsetSize
real fBorderOffsetSize
RECTF adjustedRect,tabStripRect

adjustedRect = rcTabStrip
tabStripRect = rcTabStrip
_of_AdjustRect(ref tabStripRect,ADJ_BORDER + ADJ_CHEVRON)
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

fBorderOffsetSize = P2DY(1)

ll_x=adjustedRect.left + _ScrollPosition

_StartPoint = ll_x

_firstIndex = 0
_lastIndex = 0

for index = 1 to UpperBound(Items)
	if Not Items[index].Visible or Items[index].Floated then
		Items[index].OffsetPosition = 0
		continue
	end if
	
	Painter.ResetPath(Items[index].PaintPath)
	Painter.SetPathFillMode(Items[index].PaintPath,1)
	
	if Items[index].Selected then
		ll_top = adjustedRect.top
	else
		ll_top = adjustedRect.top + 4
	end if
	
	itemSize = tabStripRect.bottom - ll_top
	
	if theme.#TabStyle = theme.TBS_OFFICE then
		ll_x += 10
	end if
	
	ll_x += Items[index].OffsetPosition
	
	if _of_HasValidImage(index) then
		if Items[index].DisplayText and Items[index].szText.cx > 0 then
			choose case theme.#IconPosition
				case Enums.LEFT
					//Set rcImage
					Items[index].rcImage.left		= ll_x + 2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
					Items[index].rcImage.top		= ll_top + (itemSize - theme.#IconSize.cy) / 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cx
					//Set rcText
					Items[index].rcText.left 			= Items[index].rcImage.right + 2
					Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
					Items[index].rcText.top			= ll_top + (itemSize - Items[index].szText.cy) / 2
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
					Items[index].rcImage.top		= ll_top + 2
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
					Items[index].rcImage.top		= ll_top + (itemSize - theme.#IconSize.cy) / 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cx
					//Set rcText
					Items[index].rcText.left 			= ll_x + 2
					Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
					Items[index].rcText.top			= ll_top + (itemSize - Items[index].szText.cy) / 2
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
					Items[index].rcText.top			= ll_top + 2
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
			Items[index].rcImage.top		= ll_top + (itemSize - theme.#IconSize.cy) / 2
			Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
		end if
	elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
		Painter.SetRectEmpty(Items[index].rcImage)
		//Set rcText
		Items[index].rcText.left 		= ll_x  + 2
		Items[index].rcText.right 	= Items[index].rcText.left  + Items[index].szText.cx
		Items[index].rcText.top		= ll_top + (itemSize - Items[index].szText.cy) / 2
		Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
	else
		Painter.SetRectEmpty(Items[index].rcImage)
		Painter.SetRectEmpty(Items[index].rcText)
	end if
	
	if theme.#TabStyle = theme.TBS_OFFICE then
		ll_x -= 10
	end if
	
	//Set rcPaint
	Items[index].rcPaint.left 			= ll_x
	if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
		Items[index].rcPaint.right = Max(Items[index].rcText.right, Items[index].rcImage.right) + 2
	elseif Not Painter.IsRectEmpty(Items[index].rcText) then
		Items[index].rcPaint.right = Items[index].rcText.right + 2
	elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
		Items[index].rcPaint.right = Items[index].rcImage.right + 2
	else
		Items[index].rcPaint.right = Items[index].rcPaint.left + 4
	end if
	Items[index].rcPaint.top 			= ll_top
	Items[index].rcPaint.bottom 	= tabStripRect.bottom - fBorderOffsetSize
	if Items[index].Selected then
		Items[index].rcPaint.bottom += 2
	end if
	
	//Set CloseButton
	if Not Items[index].Locked and theme.#TabCloseButton <> theme.TBC_HIDE then
		if (BitAND(theme.#TabCloseButton,theme.TBC_SHOW)) > 0 or &
			(BitAND(theme.#TabCloseButton,theme.TBC_SELECTED) > 0 and Items[index].Selected) then
			Items[index].CloseButton.Visible = true
			Items[index].CloseButton.rcPaint.left 		= Items[index].rcPaint.right + 2
			Items[index].CloseButton.rcPaint.right 	= Items[index].CloseButton.rcPaint.left + CLOSEBUTTONSIZE
			Items[index].CloseButton.rcPaint.top 		= Items[index].rcPaint.top + (Items[index].rcPaint.bottom - Items[index].rcPaint.top - CLOSEBUTTONSIZE)/2
			Items[index].CloseButton.rcPaint.bottom = Items[index].CloseButton.rcPaint.top + CLOSEBUTTONSIZE
			Items[index].rcPaint.right = Items[index].CloseButton.rcPaint.right + 2
		else
			Items[index].CloseButton.Visible = Items[index].MouseOver
			Items[index].CloseButton.rcPaint.left 		= Items[index].rcPaint.right - 2 - CLOSEBUTTONSIZE
			Items[index].CloseButton.rcPaint.right 	= Items[index].CloseButton.rcPaint.left + CLOSEBUTTONSIZE
			Items[index].CloseButton.rcPaint.top 		= Items[index].rcPaint.top + (Items[index].rcPaint.bottom - Items[index].rcPaint.top - CLOSEBUTTONSIZE)/2
			Items[index].CloseButton.rcPaint.bottom = Items[index].CloseButton.rcPaint.top + CLOSEBUTTONSIZE
		end if
	else
		Painter.SetRectEmpty(Items[index].CloseButton.rcPaint)
		Items[index].CloseButton.Visible = false
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
			if Not Painter.IsRectEmpty(Items[index].CloseButton.rcPaint) then
				Painter.OffsetRect(Items[index].CloseButton.rcPaint,offsetSize,0 )
			end if
			Items[index].rcPaint.right += offsetSize
		end if
	end if
	
	if Items[index].rcPaint.right <= tabStripRect.left or Items[index].rcPaint.left >= tabStripRect.right then
		Items[index].Hidden = true
	else
		Items[index].Hidden = false
	end if
	
	_EndPoint = Items[index].rcPaint.right - Items[index].OffsetPosition
	
	choose case theme.#TabStyle
			
		case theme.TBS_REGULAR
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.Left,Items[index].rcPaint.bottom,Items[index].rcPaint.Left,Items[index].rcPaint.top + 2)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.Left,Items[index].rcPaint.top,4,4,180,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.Left + 2,Items[index].rcPaint.top,Items[index].rcPaint.right - 2 - 1,Items[index].rcPaint.top)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.right - 4 - 1,Items[index].rcPaint.top,4,4,270,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.top + 2,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom)
			
			ll_x = _EndPoint + 2
			
		case theme.TBS_OFFICE
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.Left,Items[index].rcPaint.bottom,Items[index].rcPaint.Left + 10,Items[index].rcPaint.top + 3)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.Left + 10 + 1,Items[index].rcPaint.top,3,3,180,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.Left + 10 + 3,Items[index].rcPaint.top,Items[index].rcPaint.right - 2 - 1,Items[index].rcPaint.top)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.right - 4 - 1,Items[index].rcPaint.top,4,4,270,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.top + 2,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom)
			
			ll_x = _EndPoint - 6
			
		case theme.TBS_RIBBON
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.Left,Items[index].rcPaint.bottom,Items[index].rcPaint.Left,Items[index].rcPaint.top + 2)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.Left,Items[index].rcPaint.top,4,4,180,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.Left + 2,Items[index].rcPaint.top,Items[index].rcPaint.right - 2 - 1,Items[index].rcPaint.top)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.right - 4 - 1,Items[index].rcPaint.top,4,4,270,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.top + 2,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom)
			
			ll_x = _EndPoint + 2
			
		case theme.TBS_SOLID
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.bottom,Items[index].rcPaint.left,Items[index].rcPaint.top)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top,Items[index].rcPaint.right - 1,Items[index].rcPaint.top)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.top,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom)
			
			ll_x = _EndPoint - 1
			
		case theme.TBS_OFFICE2013
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.bottom,Items[index].rcPaint.left,Items[index].rcPaint.top)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top,Items[index].rcPaint.right - 1,Items[index].rcPaint.top)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.top,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom)
			
			ll_x = _EndPoint + 2
	end choose
	
	if _firstIndex = 0 then
		_firstIndex = index
	end if
	_lastIndex = index
next
end subroutine

private subroutine _of_updatescrollbarpoints ();RECTF adjustedRect,tabStripRect

tabStripRect = rcTabStrip
adjustedRect = rcTabStrip

_of_AdjustRect(ref tabStripRect,ADJ_CHEVRON)
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
	if Ceiling(_StartPoint) < Ceiling(adjustedRect.top) then
		ScrollBarUp.visible = true
		ScrollBarUp.rcPaint.left = tabStripRect.left
		ScrollBarUp.rcPaint.right = tabStripRect.right
		ScrollBarUp.rcPaint.top = tabStripRect.top
		ScrollBarUp.rcPaint.bottom = ScrollBarUp.rcPaint.top + SCROLLBARSIZE
	else
		ScrollBarUp.visible = false
	end if
	
	if Ceiling(_EndPoint) > Ceiling(adjustedRect.bottom) then
		ScrollBarDown.visible = true
		ScrollBarDown.rcPaint.left = tabStripRect.left
		ScrollBarDown.rcPaint.right = tabStripRect.right
		ScrollBarDown.rcPaint.top 	= tabStripRect.bottom - SCROLLBARSIZE
		ScrollBarDown.rcPaint.bottom = ScrollBarDown.rcPaint.top + SCROLLBARSIZE
		if Chevron.Visible then
			ScrollBarDown.rcPaint.bottom += 1
		end if
	else
		ScrollBarDown.visible = false
	end if
else
	if Ceiling(_StartPoint) < Ceiling(adjustedRect.left) then
		ScrollBarUp.visible = true
		ScrollBarUp.rcPaint.left = tabStripRect.left
		ScrollBarUp.rcPaint.right = ScrollBarUp.rcPaint.left + SCROLLBARSIZE
		ScrollBarUp.rcPaint.top = tabStripRect.top
		ScrollBarUp.rcPaint.bottom = tabStripRect.bottom
	else
		ScrollBarUp.visible = false
	end if
	
	if Ceiling(_EndPoint) > Ceiling(adjustedRect.right) then
		ScrollBarDown.visible = true
		ScrollBarDown.rcPaint.left = tabStripRect.right - SCROLLBARSIZE
		ScrollBarDown.rcPaint.right = ScrollBarDown.rcPaint.left + SCROLLBARSIZE
		ScrollBarDown.rcPaint.top 	= tabStripRect.top
		ScrollBarDown.rcPaint.bottom = tabStripRect.bottom
		if Chevron.Visible then
			ScrollBarDown.rcPaint.right += 1
		end if
	else
		ScrollBarDown.visible = false
	end if
end if
end subroutine

private subroutine _of_updatepoints ();if #LockUpdate then return
if Not theme.#TabStripBar then return

if theme.#TabListButton and UpperBound(Items) > 0 then
	Chevron.Visible = true
	if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
		Chevron.rcPaint.left = rcTabStrip.left
		Chevron.rcPaint.right = rcTabStrip.right
		Chevron.rcPaint.top = rcTabStrip.bottom - CHEVRONSIZE
		Chevron.rcPaint.bottom = rcTabStrip.bottom
	else
		Chevron.rcPaint.left = rcTabStrip.right - CHEVRONSIZE
		Chevron.rcPaint.right = rcTabStrip.right
		Chevron.rcPaint.top = rcTabStrip.top
		Chevron.rcPaint.bottom = rcTabStrip.bottom
	end if
else
	Chevron.Visible = false
end if

choose case theme.#TabPosition
	case TabsOnLeft!
		_of_UpdatePointsLeft()
	case TabsOnTop!
		_of_UpdatePointsTop()
	case TabsOnRight!
		_of_UpdatePointsRight()
	case TabsOnBottom!
		_of_UpdatePointsBottom()
end choose

if Not _of_AdjustScrollPosition() then
	_of_UpdateScrollBarPoints()
end if
end subroutine

public function boolean of_islocked (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].Locked
end function

public function boolean of_isvisible (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].visible
end function

public function integer of_select (readonly integer index);int oldSelectedIndex

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not Items[index].Visible or Not Items[index].Enabled or Items[index].Floated then return RetCode.FAILED
if index = _selectedIndex then return _selectedIndex

oldSelectedIndex = _selectedIndex

if oldSelectedIndex > 0 then
	if Items[oldSelectedIndex].IsPage then
		if IsPrevented(Items[oldSelectedIndex].Page.Event OnDeactivating()) then return RetCode.FAILED
	elseif Items[oldSelectedIndex].IsPageW then
		if IsPrevented(Items[oldSelectedIndex].PageW.Event OnDeactivating()) then return RetCode.FAILED
	end if
end if
if Items[index].IsPage then
	if IsPrevented(Items[index].Page.Event OnActivating()) then return RetCode.FAILED
elseif Items[index].IsPageW then
	if IsPrevented(Items[index].PageW.Event OnActivating()) then return RetCode.FAILED
end if
if IsPrevented(Event OnTabSelectionChanging(oldSelectedIndex,index)) then return RetCode.FAILED

_selectedIndex = index

if _RedrawFlag then Super::SetRedraw(false)

if oldSelectedIndex > 0 then
	Items[oldSelectedIndex].selected=false
end if

Items[_selectedIndex].selected = true

_of_UpdatePoints()
_of_UpdateObjectPosition(_selectedIndex)

if Items[_selectedIndex].IsWindow then
	Items[_selectedIndex].ObjectW.Show()
	Items[_selectedIndex].ObjectW.BringToTop = true
	Items[_selectedIndex].ObjectW.SetFocus()
else
	Items[_selectedIndex].Object.Show()
	Items[_selectedIndex].Object.BringToTop = true
	Items[_selectedIndex].Object.SetFocus()
end if

if oldSelectedIndex > 0 then
	if Not Items[oldSelectedIndex].Floated then
		if Items[oldSelectedIndex].IsWindow then
			Items[oldSelectedIndex].ObjectW.Hide()
			Items[oldSelectedIndex].ObjectW.Move(-32768,-32768)
		else
			Items[oldSelectedIndex].Object.Hide()
			Items[oldSelectedIndex].Object.Move(-32768,-32768)
		end if
	end if
end if

if _RedrawFlag then Super::SetRedraw(true)

of_ScrollTo(_selectedIndex)

if oldSelectedIndex > 0 then
	if Items[oldSelectedIndex].IsPage then
		Items[oldSelectedIndex].Page.Event OnDeactivated()
	elseif Items[oldSelectedIndex].IsWindow then
		Items[oldSelectedIndex].ObjectW.Event Deactivate()
	end if
end if
if Items[_selectedIndex].IsPage then
	Items[_selectedIndex].Page.Event OnActivated()
elseif Items[_selectedIndex].IsWindow then
	Items[_selectedIndex].ObjectW.Event Activate()
end if
Event OnTabSelectionChanged(oldSelectedIndex,_selectedIndex)

return _selectedIndex
end function

private subroutine _of_updateobjectposition (readonly integer index);real newX,newY
real objectWidth,objectHeight
real offsetSize,fBorderSize
RECTF wndRect

if index < 1 or index > UpperBound(Items) then return

wndRect = rcWnd

if theme.#BorderStyle = Enums.BS_SOLID then
	fBorderSize = P2DX(1)
	Painter.InflateRect(ref wndRect,-fBorderSize,-fBorderSize)
	offsetSize = fBorderSize
end if

choose case theme.#TabPosition
	case TabsOnLeft!,TabsOnRight!
		objectWidth = P2DX(D2PX(wndRect.right - wndRect.left) - D2PX(_of_GetTabStripSize())) + offsetSize
		objectHeight = wndRect.bottom - wndRect.top
	case TabsOnTop!,TabsOnBottom!
		objectWidth = wndRect.right - wndRect.left
		objectHeight = P2DY(D2PY(wndRect.bottom - wndRect.top) - D2PY(_of_GetTabStripSize())) + offsetSize
end choose

if Items[index].IsPage then
	Items[index].Page.Event OnReposition(ref newX,ref newY,ref objectWidth,ref objectHeight)
elseif Items[index].IsPageW then
	Items[index].PageW.Event OnReposition(ref newX,ref newY,ref objectWidth,ref objectHeight)
end if
Event OnObjectReposition(index,ref newX,ref newY,ref objectWidth,ref objectHeight)

if Items[index].IsWindow then
	Win32.SetWindowPos(Handle(Items[index].objectW),D2PX(newX),D2PY(newY),D2PX(objectWidth),D2PY(objectHeight))
else
	if Items[index].IsOLE then
		Items[index].Object.Move(D2UX(newX),D2UY(newY))
		Items[index].Object.Resize(D2UX(objectWidth),D2UY(objectHeight))
	else
		Win32.SetWindowPos(Handle(Items[index].object),D2PX(newX),D2PY(newY),D2PX(objectWidth),D2PY(objectHeight))
	end if
end if
end subroutine

private subroutine _of_scrollup ();int index
real offsetSize
boolean bNeedScroll
RECTF adjustedRect

if Not ScrollBarUp.visible then return

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

if _smoothScrollSize > 0 then
	offsetSize = _smoothScrollSize
end if

if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
	for index = UpperBound(Items) to  1 step -1
		if Not Items[index].visible then continue
		if Items[index].Floated then continue
		if index = _draggingIndex then continue
		if index = _firstIndex then
			if (Items[index].rcPaint.Top - Items[index].OffsetPosition) + offsetSize < adjustedRect.top then
				bNeedScroll = true
			end if
		else
			if (Items[index].rcPaint.Top - Items[index].OffsetPosition) + offsetSize < ScrollBarUp.rcPaint.Bottom + 1 then
				bNeedScroll = true
			end if
		end if
		if bNeedScroll then
			of_ScrollTo(index,Enums.SF_BACKWARD)
			return
		end if
	next
else
	for index = UpperBound(Items) to  1 step -1
		if Not Items[index].visible then continue
		if Items[index].Floated then continue
		if index = _draggingIndex then continue
		if index = _firstIndex then
			if (Items[index].rcPaint.Left - Items[index].OffsetPosition) + offsetSize < adjustedRect.Left then
				bNeedScroll = true
			end if
		else
			if (Items[index].rcPaint.Left - Items[index].OffsetPosition) + offsetSize < ScrollBarUp.rcPaint.Right + 1 then
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

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

if _smoothScrollSize < 0 then
	offsetSize = _smoothScrollSize
end if

if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
	for index = 1 to UpperBound(Items)
		if Not Items[index].visible then continue
		if Items[index].Floated then continue
		if index = _draggingIndex then continue
		if index = _lastIndex then
			if (Items[index].rcPaint.Bottom - Items[index].OffsetPosition)  + offsetSize > adjustedRect.bottom then
				bNeedScroll = true
			end if
		else
			if (Items[index].rcPaint.Bottom - Items[index].OffsetPosition)  + offsetSize > ScrollBarDown.rcPaint.Top - 1 then
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
		if Items[index].Floated then continue
		if index = _draggingIndex then continue
		if index = _lastIndex then
			if (Items[index].rcPaint.Right - Items[index].OffsetPosition)  + offsetSize > adjustedRect.Right then
				bNeedScroll = true
			end if
		else
			if (Items[index].rcPaint.Right - Items[index].OffsetPosition) + offsetSize > ScrollBarDown.rcPaint.Left - 1 then
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

private subroutine _of_updatepointsbottom ();int	index
real ll_x,ll_bottom
real itemSize
real maxSize
real offsetSize
real fBorderOffsetSize
RECTF adjustedRect,tabStripRect

adjustedRect = rcTabStrip
tabStripRect = rcTabStrip
_of_AdjustRect(ref tabStripRect,ADJ_BORDER + ADJ_CHEVRON)
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

fBorderOffsetSize = P2DY(1)

ll_x=adjustedRect.left + _ScrollPosition

_StartPoint = ll_x

_firstIndex = 0
_lastIndex = 0

for index = 1 to UpperBound(Items)
	if Not Items[index].Visible or Items[index].Floated then
		Items[index].OffsetPosition = 0
		continue
	end if
	
	Painter.ResetPath(Items[index].PaintPath)
	Painter.SetPathFillMode(Items[index].PaintPath,1)
	
	if Items[index].Selected then
		ll_bottom = adjustedRect.bottom
	else
		ll_bottom = adjustedRect.bottom - 4
	end if
	
	itemSize = ll_bottom - tabStripRect.top
	
	if theme.#TabStyle = theme.TBS_OFFICE then
		ll_x += 10
	end if
	
	ll_x += Items[index].OffsetPosition
	
	if _of_HasValidImage(index) then
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
					if (ll_bottom - Items[index].rcText.top) > Items[index].szText.cy then
						Items[index].rcText.top 		+= (ll_bottom - Items[index].rcText.top - Items[index].szText.cy) / 2
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
					Items[index].rcImage.top		= ll_bottom - 2 - theme.#IconSize.cy
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
	
	if theme.#TabStyle = theme.TBS_OFFICE then
		ll_x -= 10
	end if
	
	//Set rcPaint
	Items[index].rcPaint.left 			= ll_x
	if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
		Items[index].rcPaint.right = Max(Items[index].rcText.right, Items[index].rcImage.right) + 2
	elseif Not Painter.IsRectEmpty(Items[index].rcText) then
		Items[index].rcPaint.right = Items[index].rcText.right + 2
	elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
		Items[index].rcPaint.right = Items[index].rcImage.right + 2
	else
		Items[index].rcPaint.right = Items[index].rcPaint.left + 4
	end if
	Items[index].rcPaint.top 			= tabStripRect.Top + fBorderOffsetSize
	Items[index].rcPaint.bottom 	= ll_bottom
	if Items[index].Selected then
		Items[index].rcPaint.top -= 2
	end if
	
	//Set CloseButton
	if Not Items[index].Locked and theme.#TabCloseButton <> theme.TBC_HIDE then
		if (BitAND(theme.#TabCloseButton,theme.TBC_SHOW)) > 0 or &
			(BitAND(theme.#TabCloseButton,theme.TBC_SELECTED) > 0 and Items[index].Selected) then
			Items[index].CloseButton.Visible = true
			Items[index].CloseButton.rcPaint.left 		= Items[index].rcPaint.right + 2
			Items[index].CloseButton.rcPaint.right 	= Items[index].CloseButton.rcPaint.left + CLOSEBUTTONSIZE
			Items[index].CloseButton.rcPaint.top 		= Items[index].rcPaint.top + (Items[index].rcPaint.bottom - Items[index].rcPaint.top - CLOSEBUTTONSIZE)/2
			Items[index].CloseButton.rcPaint.bottom = Items[index].CloseButton.rcPaint.top + CLOSEBUTTONSIZE
			Items[index].rcPaint.right = Items[index].CloseButton.rcPaint.right + 2
		else
			Items[index].CloseButton.Visible = Items[index].MouseOver
			Items[index].CloseButton.rcPaint.left 		= Items[index].rcPaint.right - 2 - CLOSEBUTTONSIZE
			Items[index].CloseButton.rcPaint.right 	= Items[index].CloseButton.rcPaint.left + CLOSEBUTTONSIZE
			Items[index].CloseButton.rcPaint.top 		= Items[index].rcPaint.top + (Items[index].rcPaint.bottom - Items[index].rcPaint.top - CLOSEBUTTONSIZE)/2
			Items[index].CloseButton.rcPaint.bottom = Items[index].CloseButton.rcPaint.top + CLOSEBUTTONSIZE
		end if
	else
		Items[index].CloseButton.Visible = false
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
			if Not Painter.IsRectEmpty(Items[index].CloseButton.rcPaint) then
				Painter.OffsetRect(Items[index].CloseButton.rcPaint,offsetSize,0 )
			end if
			Items[index].rcPaint.right += offsetSize
		end if
	end if
	
	if Items[index].rcPaint.right <= tabStripRect.left or Items[index].rcPaint.left >= tabStripRect.right then
		Items[index].Hidden = true
	else
		Items[index].Hidden = false
	end if
	
	_EndPoint = Items[index].rcPaint.right - Items[index].OffsetPosition
	
	choose case theme.#TabStyle
			
		case theme.TBS_REGULAR
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.Left,Items[index].rcPaint.top,Items[index].rcPaint.Left,Items[index].rcPaint.bottom - 2)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.Left,Items[index].rcPaint.bottom - 4 - 1,4,4,90,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.Left + 2,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.right - 2 - 1,Items[index].rcPaint.bottom - 1)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.right - 4 - 1,Items[index].rcPaint.bottom - 4 - 1,4,4,0,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - 2 - 1,Items[index].rcPaint.right - 1,Items[index].rcPaint.top)
			
			ll_x = _EndPoint + 2
			
		case theme.TBS_OFFICE
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.Left,Items[index].rcPaint.top,Items[index].rcPaint.Left + 10,Items[index].rcPaint.bottom - 3 - 1)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.Left + 10 + 1,Items[index].rcPaint.bottom - 3 - 1,3,3,90,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.Left + 10  + 3,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.right - 2 - 1,Items[index].rcPaint.bottom - 1)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.right - 4 - 1,Items[index].rcPaint.bottom - 4 - 1,4,4,0,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - 2,Items[index].rcPaint.right - 1,Items[index].rcPaint.top)
			
			ll_x = _EndPoint - 6
			
		case theme.TBS_RIBBON
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.Left,Items[index].rcPaint.top,Items[index].rcPaint.Left,Items[index].rcPaint.bottom - 2)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.Left,Items[index].rcPaint.bottom - 4 - 1,4,4,90,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.Left + 2,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.right - 2 - 1,Items[index].rcPaint.bottom - 1)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.right - 4 - 1,Items[index].rcPaint.bottom - 4 - 1,4,4,0,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - 2 - 1,Items[index].rcPaint.right - 1,Items[index].rcPaint.top)
			
			ll_x = _EndPoint + 2
			
		case theme.TBS_SOLID
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 1)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - 1)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.right - 1,Items[index].rcPaint.top)
			
			ll_x = _EndPoint - 1
			
		case theme.TBS_OFFICE2013
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 1)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - 1)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.right - 1,Items[index].rcPaint.top)
			
			ll_x = _EndPoint + 2
	end choose
	
	if _firstIndex = 0 then
		_firstIndex = index
	end if
	_lastIndex = index
next
end subroutine

private subroutine _of_updatepointsleft ();int	index
real ll_y,ll_left
real itemSize
real offsetSize
real maxSize
real fBorderOffsetSize
RECTF adjustedRect,tabStripRect

adjustedRect = rcTabStrip
tabStripRect = rcTabStrip
_of_AdjustRect(ref tabStripRect,ADJ_BORDER + ADJ_CHEVRON)
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

fBorderOffsetSize = P2DX(1)

ll_y=adjustedRect.top + _ScrollPosition

_StartPoint = ll_y

_firstIndex = 0
_lastIndex = 0

for index = 1 to UpperBound(Items)
	if Not Items[index].Visible or Items[index].Floated then
		Items[index].OffsetPosition = 0
		continue
	end if
	
	Painter.ResetPath(Items[index].PaintPath)
	Painter.SetPathFillMode(Items[index].PaintPath,1)
	
	if Items[index].Selected then
		ll_left = adjustedRect.left
	else
		ll_left = adjustedRect.left + 4
	end if
	
	itemSize = tabStripRect.right - ll_left
	
	if theme.#TabStyle = theme.TBS_OFFICE then
		ll_y += 10
	end if
	
	ll_y += Items[index].OffsetPosition
	
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
					Items[index].rcImage.left		= ll_left  + 2
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
					Items[index].rcImage.left		= ll_left  + (itemSize - theme.#IconSize.cx)/2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
					Items[index].rcImage.top		= ll_y + 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
					//Set rcText
					Items[index].rcText.left 			= ll_left  + 2
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
					Items[index].rcText.left 			= ll_left + 2
					Items[index].rcText.right 		= Items[index].rcImage.left - 2
					Items[index].rcText.top			= ll_y + 2 + (maxSize - Items[index].szText.cy) / 2
					Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
				case Enums.BOTTOM
					//Set rcImage
					Items[index].rcImage.left		= ll_left  + (itemSize - theme.#IconSize.cx)/2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
					Items[index].rcImage.top		= ll_y + 2 + Items[index].szText.cy + 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
					//Set rcText
					Items[index].rcText.left 			= ll_left  + 2
					Items[index].rcText.right 		= adjustedRect.right  - 2
					Items[index].rcText.top			= ll_y + 2
					Items[index].rcText.bottom 		= Items[index].rcImage.top - 2
			end choose
		else
			Painter.SetRectEmpty(Items[index].rcText)
			//Set rcImage
			Items[index].rcImage.left		= ll_left  + (itemSize - theme.#IconSize.cx)/2
			Items[index].rcImage.right		= Items[index].rcImage.left + theme.#IconSize.cx
			Items[index].rcImage.top		= ll_y + 2
			Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
		end if
	elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
		Painter.SetRectEmpty(Items[index].rcImage)
		//Set rcText
		Items[index].rcText.left 		= ll_left  + 2 
		Items[index].rcText.right 	= adjustedRect.right - 2
		Items[index].rcText.top		= ll_y + 2
		Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
	else
		Painter.SetRectEmpty(Items[index].rcImage)
		Painter.SetRectEmpty(Items[index].rcText)
	end if
	
	if theme.#TabStyle = theme.TBS_OFFICE then
		ll_y -= 10
	end if
	
	//Set rcPaint
	Items[index].rcPaint.left 		= ll_left
	Items[index].rcPaint.right 	= tabStripRect.right - fBorderOffsetSize
	Items[index].rcPaint.top 		= ll_y
	if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
		Items[index].rcPaint.bottom = Max(Items[index].rcText.bottom, Items[index].rcImage.bottom) + 2
	elseif Not Painter.IsRectEmpty(Items[index].rcText) then
		Items[index].rcPaint.bottom = Items[index].rcText.bottom + 2
	elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
		Items[index].rcPaint.bottom = Items[index].rcImage.bottom + 2
	else
		Items[index].rcPaint.bottom = Items[index].rcPaint.top + 4
	end if
	if Items[index].Selected then
		Items[index].rcPaint.right += 2
	end if
	
	//Set CloseButton
	if Not Items[index].Locked and theme.#TabCloseButton <> theme.TBC_HIDE then
		if (BitAND(theme.#TabCloseButton,theme.TBC_SHOW)) > 0 or &
			(BitAND(theme.#TabCloseButton,theme.TBC_SELECTED) > 0 and Items[index].Selected) then
			Items[index].CloseButton.Visible = true
			Items[index].CloseButton.rcPaint.left 		= Items[index].rcPaint.left + (Items[index].rcPaint.right - Items[index].rcPaint.left - CLOSEBUTTONSIZE)/2
			Items[index].CloseButton.rcPaint.right 	= Items[index].CloseButton.rcPaint.left + CLOSEBUTTONSIZE
			Items[index].CloseButton.rcPaint.top 		= Items[index].rcPaint.bottom + 2
			Items[index].CloseButton.rcPaint.bottom = Items[index].CloseButton.rcPaint.top + CLOSEBUTTONSIZE
			Items[index].rcPaint.bottom = Items[index].CloseButton.rcPaint.bottom + 2
		else
			Items[index].CloseButton.Visible = Items[index].MouseOver
			Items[index].CloseButton.rcPaint.left 		= Items[index].rcPaint.left + (Items[index].rcPaint.right - Items[index].rcPaint.left - CLOSEBUTTONSIZE)/2
			Items[index].CloseButton.rcPaint.right 	= Items[index].CloseButton.rcPaint.left + CLOSEBUTTONSIZE
			Items[index].CloseButton.rcPaint.top 		= Items[index].rcPaint.bottom - 2 - CLOSEBUTTONSIZE
			Items[index].CloseButton.rcPaint.bottom = Items[index].CloseButton.rcPaint.top + CLOSEBUTTONSIZE
		end if
	else
		Items[index].CloseButton.Visible = false
	end if
	
	if theme.#FixedSize then
		if Items[index].rcPaint.bottom - Items[index].rcPaint.top < theme.#ItemMinSize then
			offsetSize = theme.#ItemMinSize - (Items[index].rcPaint.bottom - Items[index].rcPaint.top)
			if Not Painter.IsRectEmpty(Items[index].rcImage) then
				Painter.OffsetRect(Items[index].rcImage,0,offsetSize / 2 )
			end if
			if Not Painter.IsRectEmpty(Items[index].rcText) then
				Painter.OffsetRect(Items[index].rcText,0,offsetSize / 2)
			end if
			if Not Painter.IsRectEmpty(Items[index].CloseButton.rcPaint) then
				Painter.OffsetRect(Items[index].CloseButton.rcPaint,0,offsetSize )
			end if
			Items[index].rcPaint.bottom += offsetSize
		end if
	end if
	
	if Items[index].rcPaint.bottom <= tabStripRect.top or Items[index].rcPaint.top >= tabStripRect.bottom then
		Items[index].Hidden = true
	else
		Items[index].Hidden = false
	end if
	
	_EndPoint = Items[index].rcPaint.bottom - Items[index].OffsetPosition
	
	choose case theme.#TabStyle
			
		case theme.TBS_REGULAR
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right,Items[index].rcPaint.top,Items[index].rcPaint.left + 2,Items[index].rcPaint.top)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top,4,4,180,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top + 2,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 2 - 1)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 4 - 1,4,4,90,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left + 2,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.right,Items[index].rcPaint.bottom - 1)
			
			ll_y = _EndPoint + 2
			
		case theme.TBS_OFFICE
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right,Items[index].rcPaint.top,Items[index].rcPaint.left + 3,Items[index].rcPaint.top + 10)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top + 10 + 1,3,3,180,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top + 10 + 3,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 2 - 1)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 4 - 1,4,4,90,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left + 2,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.right,Items[index].rcPaint.bottom - 1)
			
			ll_y = _EndPoint - 6
			
		case theme.TBS_RIBBON
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right,Items[index].rcPaint.top,Items[index].rcPaint.left + 2,Items[index].rcPaint.top)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top,4,4,180,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top + 2,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 2 - 1)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 4 - 1,4,4,90,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left + 2,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.right,Items[index].rcPaint.bottom - 1)
			
			ll_y = _EndPoint + 2
			
		case theme.TBS_SOLID
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right,Items[index].rcPaint.top,Items[index].rcPaint.left,Items[index].rcPaint.top)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 1)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.right,Items[index].rcPaint.bottom - 1)
			
			ll_y = _EndPoint - 1
			
		case theme.TBS_OFFICE2013
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right,Items[index].rcPaint.top,Items[index].rcPaint.left,Items[index].rcPaint.top)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 1)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.right,Items[index].rcPaint.bottom - 1)
			
			ll_y = _EndPoint + 2
	end choose
	
	if _firstIndex = 0 then
		_firstIndex = index
	end if
	_lastIndex = index
next
end subroutine

private subroutine _of_updatepointsright ();int	index
real ll_y,ll_right
real itemSize
real offsetSize
real maxSize
real fBorderOffsetSize
RECTF adjustedRect,tabStripRect

adjustedRect = rcTabStrip
tabStripRect = rcTabStrip
_of_AdjustRect(ref tabStripRect,ADJ_BORDER + ADJ_CHEVRON)
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

fBorderOffsetSize = P2DX(1)

ll_y=adjustedRect.top + _ScrollPosition

_StartPoint = ll_y

_firstIndex = 0
_lastIndex = 0

for index = 1 to UpperBound(Items)
	if Not Items[index].Visible or Items[index].Floated then
		Items[index].OffsetPosition = 0
		continue
	end if
	
	Painter.ResetPath(Items[index].PaintPath)
	Painter.SetPathFillMode(Items[index].PaintPath,1)
	
	if Items[index].Selected then
		ll_right = adjustedRect.right
	else
		ll_right = adjustedRect.right - 4
	end if
	
	itemSize = ll_right - tabStripRect.left
	
	if theme.#TabStyle = theme.TBS_OFFICE then
		ll_y += 10
	end if
	
	ll_y += Items[index].OffsetPosition
	
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
					Items[index].rcImage.left		= adjustedRect.left  + 2
					Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
					Items[index].rcImage.top		= ll_y + 2 + (maxSize - theme.#IconSize.cy) / 2
					Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
					//Set rcText
					Items[index].rcText.left 			= Items[index].rcImage.right + 2
					Items[index].rcText.right 		= ll_right - 2
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
					Items[index].rcText.right 		= ll_right  - 2
					Items[index].rcText.top			= Items[index].rcImage.bottom + 2
					Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
				case Enums.RIGHT
					if Items[index].szText.cy > theme.#IconSize.cy then
						maxSize = Items[index].szText.cy
					else
						maxSize = theme.#IconSize.cy
					end if
					//Set rcImage
					Items[index].rcImage.left		= ll_right  - 2 - theme.#IconSize.cx
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
					Items[index].rcText.right 		= ll_right  - 2
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
		Items[index].rcText.right 	= ll_right - 2
		Items[index].rcText.top		= ll_y + 2
		Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
	else
		Painter.SetRectEmpty(Items[index].rcImage)
		Painter.SetRectEmpty(Items[index].rcText)
	end if
	
	if theme.#TabStyle = theme.TBS_OFFICE then
		ll_y -= 10
	end if
	
	//Set rcPaint
	Items[index].rcPaint.left 		= tabStripRect.left + fBorderOffsetSize
	Items[index].rcPaint.right 	= ll_right
	Items[index].rcPaint.top 		= ll_y
	if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
		Items[index].rcPaint.bottom = Max(Items[index].rcText.bottom, Items[index].rcImage.bottom) + 2
	elseif Not Painter.IsRectEmpty(Items[index].rcText) then
		Items[index].rcPaint.bottom = Items[index].rcText.bottom + 2
	elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
		Items[index].rcPaint.bottom = Items[index].rcImage.bottom + 2
	else
		Items[index].rcPaint.bottom = Items[index].rcPaint.top + 4
	end if
	if Items[index].Selected then
		Items[index].rcPaint.left -= 2
	end if
	
	//Set CloseButton rect
	if Not Items[index].Locked and theme.#TabCloseButton <> theme.TBC_HIDE then
		if (BitAND(theme.#TabCloseButton,theme.TBC_SHOW)) > 0 or &
			(BitAND(theme.#TabCloseButton,theme.TBC_SELECTED) > 0 and Items[index].Selected) then
			Items[index].CloseButton.Visible = true
			Items[index].CloseButton.rcPaint.left 		= Items[index].rcPaint.left + (Items[index].rcPaint.right - Items[index].rcPaint.left - CLOSEBUTTONSIZE)/2 + 1
			Items[index].CloseButton.rcPaint.right 	= Items[index].CloseButton.rcPaint.left + CLOSEBUTTONSIZE
			Items[index].CloseButton.rcPaint.top 		= Items[index].rcPaint.bottom + 2
			Items[index].CloseButton.rcPaint.bottom = Items[index].CloseButton.rcPaint.top + CLOSEBUTTONSIZE
			Items[index].rcPaint.bottom = Items[index].CloseButton.rcPaint.bottom + 2
		else
			Items[index].CloseButton.Visible = Items[index].MouseOver
			Items[index].CloseButton.rcPaint.left 		= Items[index].rcPaint.left + (Items[index].rcPaint.right - Items[index].rcPaint.left - CLOSEBUTTONSIZE)/2 + 1
			Items[index].CloseButton.rcPaint.right 	= Items[index].CloseButton.rcPaint.left + CLOSEBUTTONSIZE
			Items[index].CloseButton.rcPaint.top 		= Items[index].rcPaint.bottom - 2 - CLOSEBUTTONSIZE
			Items[index].CloseButton.rcPaint.bottom = Items[index].CloseButton.rcPaint.top + CLOSEBUTTONSIZE
		end if
	else
		Items[index].CloseButton.Visible = false
	end if
	
	if theme.#FixedSize then
		if Items[index].rcPaint.bottom - Items[index].rcPaint.top < theme.#ItemMinSize then
			offsetSize = theme.#ItemMinSize - (Items[index].rcPaint.bottom - Items[index].rcPaint.top)
			if Not Painter.IsRectEmpty(Items[index].rcImage) then
				Painter.OffsetRect(Items[index].rcImage,0,offsetSize / 2 )
			end if
			if Not Painter.IsRectEmpty(Items[index].rcText) then
				Painter.OffsetRect(Items[index].rcText,0,offsetSize / 2)
			end if
			if Not Painter.IsRectEmpty(Items[index].CloseButton.rcPaint) then
				Painter.OffsetRect(Items[index].CloseButton.rcPaint,0,offsetSize )
			end if
			Items[index].rcPaint.bottom += offsetSize
		end if
	end if
	
	if Items[index].rcPaint.bottom <= tabStripRect.top or Items[index].rcPaint.top >= tabStripRect.bottom then
		Items[index].Hidden = true
	else
		Items[index].Hidden = false
	end if
	
	_EndPoint = Items[index].rcPaint.bottom - Items[index].OffsetPosition
	
	choose case theme.#TabStyle
			
		case theme.TBS_REGULAR
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top,Items[index].rcPaint.right - 2 - 1,Items[index].rcPaint.top)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.right - 4 - 1,Items[index].rcPaint.top,4,4,270,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.top + 2,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - 2 - 1)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.right - 4 - 1,Items[index].rcPaint.bottom - 4 - 1,4,4,0,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 2 - 1,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 1)
			
			ll_y = _EndPoint + 2
			
		case theme.TBS_OFFICE
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top,Items[index].rcPaint.right - 3 - 1,Items[index].rcPaint.top + 10)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.right - 3 - 1,Items[index].rcPaint.top + 10 + 1,3,3,270,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.top + 10 + 3,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - 2 - 1)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.right - 4 - 1,Items[index].rcPaint.bottom - 4 - 1,4,4,0,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 2 - 1,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 1)
			
			ll_y = _EndPoint - 6
			
		case theme.TBS_RIBBON
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top,Items[index].rcPaint.right - 2 - 1,Items[index].rcPaint.top)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.right - 4 - 1,Items[index].rcPaint.top,4,4,270,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.top + 2,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - 2 - 1)
			Painter.AddPathArc(Items[index].PaintPath,Items[index].rcPaint.right - 4 - 1,Items[index].rcPaint.bottom - 4 - 1,4,4,0,90)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 2 - 1,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 1)
			
			ll_y = _EndPoint + 2
			
		case theme.TBS_SOLID
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top,Items[index].rcPaint.right - 1,Items[index].rcPaint.top)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.top,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - 1)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 1)
			
			ll_y = _EndPoint - 1
			
		case theme.TBS_OFFICE2013
			
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.left,Items[index].rcPaint.top,Items[index].rcPaint.right - 1,Items[index].rcPaint.top)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.top,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - 1)
			Painter.AddPathLine(Items[index].PaintPath,Items[index].rcPaint.right - 1,Items[index].rcPaint.bottom - 1,Items[index].rcPaint.left,Items[index].rcPaint.bottom - 1)
			
			ll_y = _EndPoint + 2
	end choose
	
	if _firstIndex = 0 then
		_firstIndex = index
	end if
	_lastIndex = index
next
end subroutine

public function boolean of_isdraggingmode ();return (_draggingIndex > 0 and _MouseCaptured)
end function

private subroutine _of_updatetextsize (readonly integer index);long borderMargin
ulong dtparam
n_cst_font ln_calcFont
RECTF	clientRect
RECTF	calcRect

if index < 1 or index > UpperBound(Items) then return
if Len(Items[index].text) = 0 then
	Items[index].szText.cx = 0
	Items[index].szText.cy = 0
	return
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

choose case theme.#TabPosition
	case TabsOnLeft!
		borderMargin = theme.#BorderMargin.left
	case TabsOnTop!
		borderMargin = theme.#BorderMargin.top
	case TabsOnRight!
		borderMargin = theme.#BorderMargin.right
	case TabsOnBottom!
		borderMargin = theme.#BorderMargin.bottom
end choose

if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
	if theme.#TextOrientation = Enums.HORZ then
		calcRect.right = theme.#TabStripSize - borderMargin - 4
		if _of_HasValidImage(index) and (theme.#IconPosition = Enums.LEFT or theme.#IconPosition = Enums.RIGHT) then
			calcRect.right -= theme.#IconSize.cx + 2
		end if
		Painter.of_CalcTextSize(ln_calcFont,Items[index].Text,dtparam,ref calcRect)
	else
		Painter.of_CalcVertTextSize(ln_calcFont,Items[index].Text,dtparam,ref calcRect)
	end if
	Items[index].szText.cx = calcRect.right
	Items[index].szText.cy = calcRect.bottom
	if _of_HasValidImage(index) and (theme.#IconPosition = Enums.LEFT or theme.#IconPosition = Enums.RIGHT) then
		if Items[index].szText.cx > theme.#TabStripSize - borderMargin - 4 - 2 - theme.#IconSize.cx then
			Items[index].szText.cx = theme.#TabStripSize  - borderMargin - 4 - 2 - theme.#IconSize.cx
		end if
	else
		if Items[index].szText.cx > theme.#TabStripSize - borderMargin - 4 then
			Items[index].szText.cx = theme.#TabStripSize  - borderMargin - 4
		end if
	end if
else
	if theme.#TextOrientation = Enums.HORZ then
		calcRect.right = rcTabStrip.right - rcTabStrip.left - 4
		Painter.of_CalcTextSize(ln_calcFont,Items[index].Text,dtparam,ref calcRect)
	else
		Painter.of_CalcVertTextSize(ln_calcFont,Items[index].Text,dtparam,ref calcRect)
	end if
	Items[index].szText.cx = calcRect.right
	Items[index].szText.cy = calcRect.bottom
	if _of_HasValidImage(index) and (theme.#IconPosition = Enums.TOP or theme.#IconPosition = Enums.BOTTOM) then
		if Items[index].szText.cy > theme.#TabStripSize - borderMargin - theme.#IconSize.cy - 2 - 4 then
			Items[index].szText.cy = theme.#TabStripSize - borderMargin - theme.#IconSize.cy - 2 - 4
		end if
	else
		if Items[index].szText.cy > theme.#TabStripSize - borderMargin - 4 then
			Items[index].szText.cy = theme.#TabStripSize - borderMargin - 4
		end if
	end if
end if

if Items[index].szText.cx < 0 then Items[index].szText.cx = 0
if  Items[index].szText.cy < 0 then Items[index].szText.cy = 0
end subroutine

public function boolean of_ismultiline (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].MultiLine
end function

private subroutine _of_drawchevron (readonly boolean fadeanimation);ulong safeDC
RECTF adjustedRect

if #LockUpdate then return
if Not Visible then return
if Not theme.#TabStripBar then return
if Not Chevron.Visible then return

safeDC=GetSafeNcDC()

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER)

Painter.IntersectClipRect(safeDC,adjustedRect)

Painter.IntersectClipRect(safeDC,Chevron.rcPaint)
if ScrollBarDown.visible then
	Painter.ExcludeClipRect(safeDC,ScrollBarDown.rcPaint)
end if

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnNcEraseBkgnd(safeDC)

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

public function boolean of_isdisplaytext (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].DisplayText
end function

public function string of_gettiptext (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].tiptext
end function

private function boolean _of_adjustscrollposition ();RECTF adjustedRect

if _ScrollPosition = 0 then return false

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
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

public function boolean of_isusedanimatedimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].UseAnimatedImage
end function

public function string of_getanimatedimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].amimage
end function

public function boolean of_isflashing (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return (Items[index].FlashTime = -1 or Items[index].FlashTime > 0)
end function

private function boolean _of_hasvalidimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

if Items[index].UseAnimatedImage then
	return (Items[index].AnimatedImage.GetFrameCount() > 0)
else
	return (Items[index].imageIndex > 0)
end if
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

public function long of_lock (readonly integer index, readonly boolean locked);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].Locked = locked then return RetCode.OK

Items[index].Locked = locked

if Items[index].Floated then
	Items[index].FloatWnd.Event OnTabLock(locked)
else
	if Items[index].Visible then
		of_UpdatePoints()
	end if
end if

return RetCode.OK
end function

public function long of_move (readonly integer srcindex, readonly integer dstindex);int index,i
real offsetPosition
TABCONTROLITEM srcItem,origItems[]

if srcIndex < 1 or srcIndex > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if dstIndex < 1 or dstIndex > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if srcIndex = dstIndex then return RetCode.FAILED
if IsPrevented(Event OnTabMoving(srcIndex,dstIndex)) then return RetCode.FAILED

origItems = Items
srcItem = Items[srcIndex]

if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
	
	if srcIndex < dstIndex then						//向上移动
		for index = srcIndex to dstIndex - 1
			if #SmoothDrag and Items[index + 1].Visible and srcItem.Visible then
				for i = index to srcIndex step -1
					if origItems[i].Floated then continue
					if origItems[i].Visible then
						Items[index + 1].OffsetPosition = Items[index + 1].rcPaint.Top - (origItems[i].rcPaint.Bottom - origItems[i].OffsetPosition)  + (srcItem.rcPaint.Bottom - srcItem.rcPaint.Top)
						exit
					end if
				next
			end if
			Items[index] = Items[index + 1]
		next
		if srcIndex = _draggingIndex then
			offsetPosition = (origItems[dstIndex].rcPaint.Top - origItems[dstIndex].OffsetPosition - (srcItem.rcPaint.Bottom - srcItem.OffsetPosition)) + (origItems[dstIndex].rcPaint.Bottom - origItems[dstIndex].rcPaint.Top)
			_mouseDownPoint.y += offsetPosition
			srcItem.OffsetPosition -= offsetPosition
			_draggingIndex = dstIndex
		elseif #SmoothDrag and srcItem.Visible then
			for i = dstIndex to srcIndex + 1 step - 1
				if origItems[i].Floated then continue
				if origItems[i].Visible then
					srcItem.OffsetPosition = (srcItem.rcPaint.Bottom - (origItems[i].rcPaint.Top - origItems[i].OffsetPosition)) -  (origItems[i].rcPaint.Bottom - origItems[i].rcPaint.Top)
					exit
				end if
			next
		end if
	else													//向下移动
		for index = srcIndex to dstIndex + 1 step - 1
			if #SmoothDrag and Items[index - 1].Visible and srcItem.Visible then
				for i = index to srcIndex
					if origItems[i].Floated then continue
					if origItems[i].Visible then
						Items[index - 1].OffsetPosition = (Items[index - 1].rcPaint.Bottom - (origItems[i].rcPaint.Top - origItems[i].OffsetPosition)) - (srcItem.rcPaint.Bottom - srcItem.rcPaint.Top)
						exit
					end if
				next
			end if
			Items[index] = Items[index - 1]
		next
		if srcIndex = _draggingIndex then
			offsetPosition = (origItems[dstIndex].rcPaint.Bottom - origItems[dstIndex].OffsetPosition - (srcItem.rcPaint.Top - srcItem.OffsetPosition)) - (origItems[dstIndex].rcPaint.Bottom - origItems[dstIndex].rcPaint.Top)
			_mouseDownPoint.y += offsetPosition
			srcItem.OffsetPosition -= offsetPosition
			_draggingIndex = dstIndex
		elseif #SmoothDrag and srcItem.Visible then
			for i = dstIndex to srcIndex - 1
				if origItems[i].Floated then continue
				if origItems[i].Visible then
					srcItem.OffsetPosition = (srcItem.rcPaint.Top - (origItems[i].rcPaint.Bottom - origItems[i].OffsetPosition)) +  (origItems[i].rcPaint.Bottom - origItems[i].rcPaint.Top)
					exit
				end if
			next
		end if
	end if
	
else
	
	if srcIndex < dstIndex then							//向左移动
		for index = srcIndex to dstIndex - 1
			if #SmoothDrag and Items[index + 1].Visible and srcItem.Visible then
				for i = index to srcIndex step -1
					if origItems[i].Floated then continue
					if origItems[i].Visible then
						Items[index + 1].OffsetPosition = Items[index + 1].rcPaint.Left - (origItems[i].rcPaint.Right - origItems[i].OffsetPosition)  + (srcItem.rcPaint.Right - srcItem.rcPaint.Left)
						exit
					end if
				next
			end if
			Items[index] = Items[index + 1]
		next
		if srcIndex = _draggingIndex then
			offsetPosition = (origItems[dstIndex].rcPaint.Left - origItems[dstIndex].OffsetPosition - (srcItem.rcPaint.Right - srcItem.OffsetPosition)) + (origItems[dstIndex].rcPaint.Right - origItems[dstIndex].rcPaint.Left)
			_mouseDownPoint.x += offsetPosition
			srcItem.OffsetPosition -= offsetPosition
			_draggingIndex = dstIndex
		elseif #SmoothDrag and srcItem.Visible then
			for i = dstIndex to srcIndex + 1 step - 1
				if origItems[i].Floated then continue
				if origItems[i].Visible then
					srcItem.OffsetPosition = (srcItem.rcPaint.Right - (origItems[i].rcPaint.Left - origItems[i].OffsetPosition)) -  (origItems[i].rcPaint.Right - origItems[i].rcPaint.Left)
					exit
				end if
			next
		end if
	else														//向右移动
		for index = srcIndex to dstIndex + 1 step - 1
			if #SmoothDrag and Items[index - 1].Visible and srcItem.Visible then
				for i = index to srcIndex
					if origItems[i].Floated then continue
					if origItems[i].Visible then
						Items[index - 1].OffsetPosition = (Items[index - 1].rcPaint.Right - (origItems[i].rcPaint.Left - origItems[i].OffsetPosition)) - (srcItem.rcPaint.Right - srcItem.rcPaint.Left)
						exit
					end if
				next
			end if
			Items[index] = Items[index - 1]
		next
		if srcIndex = _draggingIndex then
			offsetPosition = (origItems[dstIndex].rcPaint.Right - origItems[dstIndex].OffsetPosition - (srcItem.rcPaint.Left - srcItem.OffsetPosition)) - (origItems[dstIndex].rcPaint.Right - origItems[dstIndex].rcPaint.Left)
			_mouseDownPoint.x += offsetPosition
			srcItem.OffsetPosition -= offsetPosition
			_draggingIndex = dstIndex
		elseif #SmoothDrag and srcItem.Visible then
			for i = dstIndex to srcIndex - 1
				if origItems[i].Floated then continue
				if origItems[i].Visible then
					srcItem.OffsetPosition = (srcItem.rcPaint.Left - (origItems[i].rcPaint.Right - origItems[i].OffsetPosition)) +  (origItems[i].rcPaint.Right - origItems[i].rcPaint.Left)
					exit
				end if
			next
		end if
	end if

end if

Items[dstIndex] = srcItem

if _selectedIndex > srcIndex and _selectedIndex <= dstIndex then
	_selectedIndex --
elseif _selectedIndex < srcIndex and _selectedIndex >= dstIndex then
	_selectedIndex ++
elseif _selectedIndex = srcIndex then
	_selectedIndex = dstIndex
end if
if _mouseOverIndex > srcIndex and _mouseOverIndex <= dstIndex then
	_mouseOverIndex --
elseif _mouseOverIndex < srcIndex and _mouseOverIndex >= dstIndex then
	_mouseOverIndex ++
elseif _mouseOverIndex = srcIndex then
	_mouseOverIndex = dstIndex
end if
if _mouseDownIndex > srcIndex and _mouseDownIndex <= dstIndex then
	_mouseDownIndex --
elseif _mouseDownIndex < srcIndex and _mouseDownIndex >= dstIndex then
	_mouseDownIndex ++
elseif _mouseDownIndex = srcIndex then
	_mouseDownIndex = dstIndex
end if

if srcItem.Visible then
	if #SmoothDrag then
		_of_UpdatePoints()
		Timer.Start(TM_DRAG,TMI_DRAG)
	else
		of_UpdatePoints()
	end if
end if

Event OnTabMoved(srcIndex,dstIndex)

return RetCode.OK
end function

public function long of_removeall ();return of_RemoveAll(false)
end function

public function long of_setanimatedimage (readonly integer index, readonly string amimage);int frameCount
boolean rt

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].AMImage = amimage then return RetCode.OK

Items[index].AMImage = amimage

if Not IsValidObject(Items[index].AnimatedImage) then
	Items[index].AnimatedImage = create n_image
	Items[index].AnimatedImage.ShareImage(true)
	Items[index].AnimatedImage.SetImageSize(theme.#IconSize.cx,theme.#IconSize.cy)
end if

frameCount = Items[index].AnimatedImage.GetFrameCount()
rt = Items[index].AnimatedImage.Load(amimage)

if Items[index].UseAnimatedImage then
	if (frameCount > 0) <> rt then
		_of_UpdateTextSize(index)
		if Items[index].Visible then
			of_UpdatePoints()
		end if
	else
		_of_DrawItem(index,true,false)
	end if
	Timer.Start(TM_ANIMATION,TMI_ANIMATION)
end if

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

if Items[index].Floated then
	Items[index].FloatWnd.Icon = image
else
	if Items[index].Visible then
		if dirty then
			of_UpdatePoints()
		else
			_of_DrawItem(index,true,false)
		end if
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

if Items[index].Floated then
	Items[index].FloatWnd.Title = txt
else
	if Items[index].Visible and Items[index].DisplayText then
		if textOldSize <> Items[index].szText then
			of_UpdatePoints()
		else
			_of_DrawItem(index,false)
		end if
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
if Not theme.#TabStripBar then
	if _SelectedIndex = 0 then
		of_SelectNext(0)
	end if
	return RetCode.OK
end if

_of_UpdatePoints()
of_Redraw(false)

if _SelectedIndex = 0 then
	of_SelectNext(0)
end if

return RetCode.OK
end function

public function long of_useanimatedimage (readonly integer index, readonly boolean used);int frameCount

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not IsValidObject(Items[index].AnimatedImage) then return RetCode.E_INVALID_OBJECT
if Items[index].UseAnimatedImage = used then return RetCode.OK

Items[index].UseAnimatedImage = used
frameCount = Items[index].AnimatedImage.GetFrameCount()

if (Items[index].imageIndex > 0) <> (frameCount > 0) then
	_of_UpdateTextSize(index)
	if Items[index].Visible then
		of_UpdatePoints()
	end if
else
	_of_DrawItem(index,true,false)
end if

if Items[index].UseAnimatedImage and frameCount > 0 then
	Timer.Start(TM_ANIMATION,TMI_ANIMATION)
end if

return RetCode.OK
end function

public function long of_visible (readonly integer index, readonly boolean bvisible);int i
real offsetSize
boolean bLockUpdate

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].Visible = bVisible then return RetCode.OK

if Items[index].Floated then
	Items[index].Visible = bVisible
	if bVisible then
		Items[index].FloatWnd.Show()
	else
		Items[index].FloatWnd.Hide()
	end if
else
	Items[index].Visible = bVisible
	
	if Not bVisible then
		if Items[index].IsWindow then
			Items[index].ObjectW.Hide()
			Items[index].ObjectW.Move(-32768,-32768)
		else
			Items[index].Object.Hide()
			Items[index].Object.Move(-32768,-32768)
		end if
	end if
	
	if #LockUpdate then
		if index = _SelectedIndex and Not bVisible then
			Items[_SelectedIndex].Selected = false
			_SelectedIndex = 0
		end if
		return RetCode.OK
	end if
	
	if #SmoothClose and Not bVisible then
		for i = index + 1 to UpperBound(Items)
			if Items[i].Floated then continue
			if Items[i].visible then
				if offsetSize = 0 then
					if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
						offsetSize = ((Items[i].rcPaint.top - Items[i].OffsetPosition) -  (Items[index].rcPaint.bottom  - Items[index].OffsetPosition)) + (Items[index].rcPaint.bottom - Items[index].rcPaint.top)
					else
						offsetSize = ((Items[i].rcPaint.left - Items[i].OffsetPosition) -  (Items[index].rcPaint.right  - Items[index].OffsetPosition)) + (Items[index].rcPaint.right - Items[index].rcPaint.left)
					end if
				end if
				Items[i].OffsetPosition += offsetSize
			end if
		next
		if offsetSize <> 0 then
			Timer.Start(TM_DRAG,TMI_DRAG)
		end if
	end if
	
	bLockUpdate = #LockUpdate
	#LockUpdate = true
	
	if index = _SelectedIndex and Not bVisible then
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
end if

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
	if Items[index].IsWindow then
		if ClassName(Items[index].ObjectW) = Lower(clsName) then return index
	else
		if ClassName(Items[index].Object) = Lower(clsName) then return index
	end if
next

return 0
end function

public function long of_settiptime (readonly integer index, readonly long tiptime);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[index].TipTime = tipTime

return RetCode.OK
end function

public function boolean of_isfloated (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].Floated
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

public function long of_showfloatwindow (readonly integer index);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not Items[index].Floated then return RetCode.E_NO_SUPPORT
if Not Items[index].FloatWnd.Visible then return RetCode.FAILED
	
if Items[index].FloatWnd.wf_IsMinimized() then
	Items[index].FloatWnd.wf_SetWindowState(Normal!)
end if
Win32.BringWindowToTop(Items[index].FloatWnd.#Handle)

return RetCode.OK
end function

public function long of_hidefloatwindow (readonly integer index);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not Items[index].Floated then return RetCode.E_NO_SUPPORT
if Not Items[index].FloatWnd.Visible then return RetCode.FAILED
	
Items[index].FloatWnd.wf_SetWindowState(Minimized!)

return RetCode.OK
end function

public function long of_dock (readonly integer index);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not Items[index].Floated then return RetCode.OK
if Items[index].IsPage then
	if IsPrevented(Items[index].Page.Event OnDocking()) then return RetCode.FAILED
elseif Items[index].IsPageW then
	if IsPrevented(Items[index].PageW.Event OnDocking()) then return RetCode.FAILED
end if
if IsPrevented(Event OnTabDocking(index)) then return RetCode.FAILED

Items[index].Floated = false
Items[index].FloatWnd.Event OnDetach()
Items[index].FloatWnd.Hide()
if Items[index].IsWindow then
	Items[index].ObjectW.Hide()
	Win32.SetParent(Handle(Items[index].ObjectW),#Handle)
else
	Items[index].Object.Hide()
	Win32.SetParent(Handle(Items[index].Object),#Handle)
end if

if Items[index].Visible then
	if #SmoothDrag then
		int i
		real offsetSize
		_of_UpdatePoints()
		for i = index + 1 to UpperBound(Items)
			if Items[i].Floated then continue
			if Items[i].visible then
				if offsetSize = 0 then
					if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
						offsetSize = ((Items[i].rcPaint.top - Items[i].OffsetPosition) -  Items[index].rcPaint.bottom) + (Items[index].rcPaint.bottom - Items[index].rcPaint.top)
					else
						offsetSize = ((Items[i].rcPaint.left - Items[i].OffsetPosition) -  Items[index].rcPaint.right) + (Items[index].rcPaint.right - Items[index].rcPaint.left)
					end if
				end if
				Items[i].OffsetPosition -= offsetSize
			end if
		next
		if offsetSize <> 0 then
			Timer.Start(TM_DRAG,TMI_DRAG)
		end if
	end if
	of_UpdatePoints()
end if

if _SelectedIndex = 0 then
	of_Select(index)
end if

if Items[index].IsPage then
	Items[index].Page.Post Event OnDocked()
elseif Items[index].IsPageW then
	Items[index].PageW.Post Event OnDocked()
end if
Event OnTabDocked(index)

return RetCode.OK
end function

public function long of_float (readonly integer index);return of_Float(index,-32768,-32768,-1,-1,"")
end function

public function long of_float (readonly integer index, readonly string floatwndcls);return of_Float(index,-32768,-32768,-1,-1,floatWndCls)
end function

public function integer of_getdraggingindex ();return _draggingIndex
end function

public function string of_getclassname (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

if Items[index].IsWindow then
	return ClassName(Items[index].ObjectW)
else
	return ClassName(Items[index].Object)
end if
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

public function integer of_insertobject (readonly integer index, readonly string clsname);return of_InsertObject(index,clsName,"","","")
end function

public function integer of_insertobject (readonly integer index, readonly string clsname, readonly string txt, readonly string image);return of_InsertObject(index,clsName,txt,image,"")
end function

public function integer of_addobject (readonly string clsname, readonly string txt, readonly string image, readonly string tiptext);return of_InsertObject(UpperBound(Items)+1,clsName,txt,image,tiptext)
end function

public function integer of_addobject (readonly string clsname, readonly string txt, readonly string image);return of_AddObject(clsName,txt,image,"")
end function

public function integer of_addobject (readonly string clsname);return of_AddObject(clsName,"","","")
end function

public function integer of_insertobject (readonly integer index, ref dragobject object, readonly string txt, readonly string image, readonly string tiptext);int itemIndex
int i
TABCONTROLITEM newItem
Constant String CLS_TABPAGE = "u_cst_tabpage"

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

itemIndex = of_GetIndex(object)

if itemIndex > 0 then return itemIndex

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

newItem.Object = object
if IsAncestor(object,CLS_TABPAGE) then
	newItem.IsPage = true
	newItem.Page = object
	newItem.Page.Event OnInit(this)
elseif IsOLEControl(object) then
	newItem.IsOLE = true
end if

newItem.enabled = true
newItem.visible = true
newItem.displaytext = true
newItem.useanimatedimage = false
newItem.ParentTabControl = this

if Len(txt) = 0 and Len(image) = 0 and Len(tiptext) = 0 and IsAncestor(object,"userobject") then
	UserObject uo
	uo = object
	newItem.Text = uo.Text
	newItem.tipText = uo.PowerTipText
	newItem.image = uo.PictureName
else
	newItem.Text = txt
	newItem.tipText = tiptext
	newItem.image = image
end if

if Len(newItem.image) > 0 then
	newItem.imageindex = _ImageList.AddImage(Trim(newItem.image))
end if

Painter.CreatePath(1,ref newItem.PaintPath)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

if index <= _selectedIndex then
	_selectedIndex += 1
end if

if Items[index].IsPage then
	Items[index].Page.Event OnOpened(_anyPageOpenParam)
end if
Event OnTabOpened(index)

_of_UpdateTextSize(index)
of_UpdatePoints()

if _SelectedIndex = 0 and Not #LockUpdate then
	of_Select(index)
end if

return index
end function

public function integer of_insertobject (readonly integer index, ref dragobject object, readonly string txt, readonly string image);return of_InsertObject(index,ref object,txt,image,"")
end function

public function integer of_insertobject (readonly integer index, ref dragobject object);return of_InsertObject(index,ref object,"","","")
end function

public function integer of_addobject (ref dragobject object, readonly string txt, readonly string image, readonly string tiptext);return of_InsertObject(UpperBound(Items)+1,ref object,txt,image,tiptext)
end function

public function integer of_addobject (ref dragobject object, readonly string txt, readonly string image);return of_AddObject(ref object,txt,image,"")
end function

public function integer of_addobject (ref dragobject object);return of_AddObject(ref object,"","","")
end function

public function integer of_insertpage (readonly integer index, ref u_cst_tabpage page, readonly string txt, readonly string image, readonly string tiptext);return of_InsertObject(index,ref page,txt,image,tipText)
end function

public function integer of_insertpage (readonly integer index, ref u_cst_tabpage page, readonly string txt, readonly string image);return of_InsertPage(index,ref page,txt,image,"")
end function

public function integer of_insertpage (readonly integer index, ref u_cst_tabpage page);return of_InsertPage(index,ref page,"","","")
end function

public function integer of_addpage (ref u_cst_tabpage page, readonly string txt, readonly string image, readonly string tiptext);return of_InsertPage(UpperBound(Items)+1,ref page,txt,image,tiptext)
end function

public function integer of_addpage (ref u_cst_tabpage page, readonly string txt, readonly string image);return of_AddObject(ref page,txt,image)
end function

public function integer of_addpage (ref u_cst_tabpage page);return of_AddObject(ref page)
end function

public function integer of_getindex (readonly dragobject object);int index

for index = 1 to UpperBound(Items)
	if Items[index].IsWindow then continue
	if Items[index].Object = object then return index
next

return 0
end function

public function long of_getobject (readonly integer index, ref dragobject object);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].IsWindow then return RetCode.E_INVALID_TYPE

try
	object = Items[index].object
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(object),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function long of_getpage (readonly integer index, ref u_cst_tabpage page);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not Items[index].IsPage then return RetCode.E_INVALID_TYPE

return of_GetObject(index,ref page)
end function

private subroutine _of_fillbkgnd (readonly unsignedlong hdc);ulong borderColor,bkColor,transparentColor
real fBorderSize
RECTF rcPaint,cliRect

fBorderSize = P2DX(1)
borderColor = theme.of_GetColor(theme.CLR_BORDER,0)

if theme.#TabStripBar then
	bkColor	= theme.of_GetColor(theme.CLR_TABSTRIPBKGND,0)
	transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,0)
	
	rcPaint = rcWnd
	choose case theme.#TabPosition
		case TabsOnLeft!
			rcPaint.Right 	= theme.#TabStripSize
		case TabsOnTop!
			rcPaint.Bottom =  theme.#TabStripSize
		case TabsOnRight!
			rcPaint.Left 	= rcWnd.right - theme.#TabStripSize
		case TabsOnBottom!
			rcPaint.Top 	= rcWnd.bottom - theme.#TabStripSize
	end choose
	
	//填充透明色
	if transparentColor <> 0 then
		Painter.of_FillRect( hdc, rcPaint,  transparentColor,false,0) 
	end if
	
	Painter.ThemeFill(hdc,rcTabStrip,bkColor,theme.#BkgndOrientation,theme.#BkgndStyle,0,false,&
												theme.#TabStripBorderStyle,borderColor,0)
	
	if theme.#BorderStyle = Enums.BS_NONE and theme.#TabStripBorderStyle = Enums.BS_NONE then
		choose case theme.#TabPosition
			case TabsOnLeft!
				Painter.DrawLine(hdc,&
							rcTabStrip.right - fBorderSize,&
							rcPaint.top,&
							rcTabStrip.right - fBorderSize,&
							rcPaint.bottom,&
							borderColor,Enums.LS_SOLID,&
							false,fBorderSize)
			case TabsOnTop!
				Painter.DrawLine(hdc,&
							rcPaint.left,&
							rcTabStrip.bottom - fBorderSize,&
							rcPaint.right,&
							rcTabStrip.bottom - fBorderSize,&
							borderColor,Enums.LS_SOLID,&
							false,fBorderSize)
			case TabsOnRight!
				Painter.DrawLine(hdc,&
							rcTabStrip.left,&
							rcPaint.top,&
							rcTabStrip.left,&
							rcPaint.bottom,&
							borderColor,Enums.LS_SOLID,&
							false,fBorderSize)
			case TabsOnBottom!
				Painter.DrawLine(hdc,&
							rcPaint.left,&
							rcTabStrip.top,&
							rcPaint.right,&
							rcTabStrip.top,&
							borderColor,Enums.LS_SOLID,&
							false,fBorderSize)
		end choose
	else
		cliRect = rcWnd
		choose case theme.#TabPosition
			case TabsOnLeft!
				cliRect.left = rcTabStrip.right - fBorderSize
			case TabsOnTop!
				cliRect.top = rcTabStrip.bottom - fBorderSize
			case TabsOnRight!
				cliRect.right = rcTabStrip.left + fBorderSize
			case TabsOnBottom!
				cliRect.bottom = rcTabStrip.top + fBorderSize
		end choose
		Painter.DrawThemeBorder(hdc,cliRect,borderColor,theme.#BkgndStyle,theme.#BorderStyle,0)
	end if
else
	Painter.DrawThemeBorder(hdc,rcWnd,borderColor,theme.#BkgndStyle,theme.#BorderStyle,0)
end if
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

if theme.#TextOrientation = Enums.HORZ then
	if Items[index].Selected then
		Painter.of_Drawtext(hdc,theme.SelectedFont,Items[index].text,Items[index].rcText,textColor,dtparam)
	else
		Painter.of_Drawtext(hdc,theme.Font,Items[index].text,Items[index].rcText,textColor,dtparam)
	end if
else
	if Items[index].Selected then
		Painter.of_DrawVerticalText(hdc,theme.SelectedFont,Items[index].text,Items[index].rcText,textColor,dtparam)
	else
		Painter.of_DrawVerticalText(hdc,theme.Font,Items[index].text,Items[index].rcText,textColor,dtparam)
	end if
end if
end subroutine

private subroutine _of_drawitemclosebutton (readonly integer index, readonly unsignedlong hdc);ulong borderColor,closeColor,bkColor,nState
RADIUSF rdBorder

nState = of_GetItemCloseButtonState(index)
closeColor = theme.of_GetItemColor(index,theme.CLR_CLOSE,nState)

//Fill background
if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
	bkColor = theme.of_GetItemColor(index,theme.CLR_CLOSEBTNBKGND,nState)
	borderColor = theme.of_GetItemColor(index,theme.CLR_CLOSEBTNBORDER,nState)
	if theme.#TabStyle = theme.TBS_SOLID then
		Painter.ThemeFill(hdc,Items[index].CloseButton.rcPaint,bkColor,theme.#BkgndOrientation,theme.#ItemBkgndStyle,nState,false,&
												Enums.BS_SOLID,borderColor,0)
	else
		rdBorder.leftTop = 3
		rdBorder.rightTop = 3
		rdBorder.leftBottom = 3
		rdBorder.rightBottom = 3
		Painter.ThemeFill(hdc,Items[index].CloseButton.rcPaint,bkColor,theme.#BkgndOrientation,theme.#ItemBkgndStyle,nState,false,&
												Enums.BS_ROUND,borderColor,rdBorder)
	end if
end if
//Draw close
Painter.DrawLine(hdc,&
			Items[index].CloseButton.rcPaint.left + 4,&
			Items[index].CloseButton.rcPaint.top + 4,&
			Items[index].CloseButton.rcPaint.right - 4,&
			Items[index].CloseButton.rcPaint.bottom - 4,&
			closeColor,Enums.LS_SOLID,&
			false,2)
Painter.DrawLine(hdc,&
			Items[index].CloseButton.rcPaint.left + 4,&
			Items[index].CloseButton.rcPaint.bottom - 4,&
			Items[index].CloseButton.rcPaint.right - 4,&
			Items[index].CloseButton.rcPaint.top + 4,&
			closeColor,Enums.LS_SOLID,&
			false,2)
end subroutine

private subroutine _of_drawchevron (readonly unsignedlong hdc);ulong borderColor,arrowColor,bkColor,nState
Constant real ARROWSIZE = 6

if Not Chevron.Visible then return

nState = of_GetChevronState()
borderColor = theme.of_GetColor(theme.CLR_CHEVRONBORDER,nState)

if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 or ScrollBarDown.Visible then
	bkColor	= theme.of_GetColor(theme.CLR_CHEVRONBKGND,nState)
	Painter.ThemeFill(hdc,Chevron.rcPaint,bkColor,theme.#BkgndOrientation,theme.#ItemBkgndStyle,nState,false,Enums.BS_SOLID,borderColor,0)
end if

//Draw arrow
POINTF pt1,pt2,pt3

arrowColor = theme.of_GetColor(theme.CLR_ARROW,nState)

//if theme.#TabPosition = TabsOnTop! or theme.#TabPosition = TabsOnBottom! then
	pt1.x = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE)/2
	pt1.y = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - ARROWSIZE / 2) / 2
/*else
	pt1.x = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE)/2 
	pt1.y = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - ARROWSIZE / 2)/2
end if*/

if Chevron.MouseDown then
	pt1.y += 1
end if

pt2.x = pt1.x + ARROWSIZE
pt2.y = pt1.y
pt3.x = pt1.x + ARROWSIZE / 2
pt3.y = pt1.y + ARROWSIZE / 2

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc);long dcState
ulong borderColor,bkColor,bkColor2,nState

if Not Items[index].visible or Items[index].Hidden or Items[index].Floated or Items[index].PaintPath = 0 then return

nState = of_GetItemState(index)
bkColor = theme.of_GetItemColor(index,theme.CLR_BKGND,nState)
borderColor	= theme.of_GetItemColor(index,theme.CLR_BORDER,nState)

/* Fill background and draw border */
choose case theme.#TabPosition
		case TabsOnLeft!
			if Items[index].Selected then
				bkColor2 = theme.of_GetItemColor(index,theme.CLR_CLIENTBKGND,nState)
				if theme.#ItemBkgndStyle = Enums.SOLID then
					Painter.FillPath(hdc,Items[index].PaintPath,bkColor2,bkColor2,Enums.HORZ,false,true,borderColor)
					dcState = Painter.SaveDC(hdc)
					Painter.IntersectClipRect( hdc, Items[index].rcPaint.left,Items[index].rcPaint.top,Items[index].rcPaint.left + 2,Items[index].rcPaint.bottom)
					Painter.FillPath(hdc,Items[index].PaintPath,bkColor,bkColor,Enums.HORZ,false,true,bkColor)
					Painter.RestoreDC(hdc,dcState)
				else
					if theme.#ItemBkgndStyle = Enums.TRANSPARENT  then
						Painter.FillPath(hdc,Items[index].PaintPath,0,bkColor2,Enums.HORZ,false,true,0)
					else
						Painter.FillPath(hdc,Items[index].PaintPath,bkColor,bkColor2,Enums.HORZ,false,true,0)
					end if
					Painter.DrawThemeBorder(hdc,Items[index].PaintPath,borderColor,theme.#ItemBkgndStyle)
				end if
			elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_HIGHLIGHTED) <> 0 or (theme.#TabStyle <> theme.TBS_RIBBON and theme.#TabStyle <> theme.TBS_OFFICE2013) or Items[index].flashing then
				if BitAND(nState,Enums.STATE_HOVER) = 0 then
					if Items[index].Flashing then
						bkColor = ARGBLighten(bkColor,0.4)
					end if
				end if
				if theme.#ItemBkgndStyle = Enums.XP or theme.#ItemBkgndStyle = Enums.VISTAORIGINAL then
					Painter.ThemeFill(hdc,Items[index].PaintPath,bkColor,Enums.HORZ,theme.#ItemBkgndStyle,nState,true,&
										true,borderColor)
				else
					Painter.ThemeFill(hdc,Items[index].PaintPath,bkColor,Enums.HORZ,theme.#ItemBkgndStyle,nState,false,&
										true,borderColor)
				end if
			end if
		case TabsOnTop!
			if Items[index].Selected then
				bkColor2 = theme.of_GetItemColor(index,theme.CLR_CLIENTBKGND,nState)
				if theme.#ItemBkgndStyle = Enums.SOLID then
					Painter.FillPath(hdc,Items[index].PaintPath,bkColor2,bkColor2,Enums.VERT,false,true,borderColor)
					dcState = Painter.SaveDC(hdc)
					Painter.IntersectClipRect( hdc, Items[index].rcPaint.left,Items[index].rcPaint.top,Items[index].rcPaint.right,Items[index].rcPaint.top + 2)
					Painter.FillPath(hdc,Items[index].PaintPath,bkColor,bkColor,Enums.VERT,false,true,bkColor)
					Painter.RestoreDC(hdc,dcState)
				else
					if theme.#ItemBkgndStyle = Enums.TRANSPARENT  then
						Painter.FillPath(hdc,Items[index].PaintPath,0,bkColor2,Enums.VERT,false,true,0)
					else
						Painter.FillPath(hdc,Items[index].PaintPath,bkColor,bkColor2,Enums.VERT,false,true,0)
					end if
					Painter.DrawThemeBorder(hdc,Items[index].PaintPath,borderColor,theme.#ItemBkgndStyle)
				end if
			elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_HIGHLIGHTED) <> 0 or (theme.#TabStyle <> theme.TBS_RIBBON and theme.#TabStyle <> theme.TBS_OFFICE2013) or Items[index].flashing then
				if BitAND(nState,Enums.STATE_HOVER) = 0 then
					if Items[index].Flashing then
						bkColor = ARGBLighten(bkColor,0.4)
					end if
				end if
				if theme.#ItemBkgndStyle = Enums.XP or theme.#ItemBkgndStyle = Enums.VISTAORIGINAL then
					Painter.ThemeFill(hdc,Items[index].PaintPath,bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,true,&
										true,borderColor)
				else
					Painter.ThemeFill(hdc,Items[index].PaintPath,bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
										true,borderColor)
				end if
			end if
		case TabsOnRight!
			if Items[index].Selected then
				bkColor2 = theme.of_GetItemColor(index,theme.CLR_CLIENTBKGND,nState)
				if theme.#ItemBkgndStyle = Enums.SOLID then
					Painter.FillPath(hdc,Items[index].PaintPath,bkColor2,bkColor2,Enums.HORZ,false,true,borderColor)
					dcState = Painter.SaveDC(hdc)
					Painter.IntersectClipRect( hdc, Items[index].rcPaint.right - 2,Items[index].rcPaint.top,Items[index].rcPaint.right,Items[index].rcPaint.bottom)
					Painter.FillPath(hdc,Items[index].PaintPath,bkColor,bkColor,Enums.HORZ,false,true,bkColor)
					Painter.RestoreDC(hdc,dcState)
				else
					if theme.#ItemBkgndStyle = Enums.TRANSPARENT  then
						Painter.FillPath(hdc,Items[index].PaintPath,bkColor2,0,Enums.HORZ,false,true,0)
					else
						Painter.FillPath(hdc,Items[index].PaintPath,bkColor2,bkColor,Enums.HORZ,false,true,0)
					end if
					Painter.DrawThemeBorder(hdc,Items[index].PaintPath,borderColor,theme.#ItemBkgndStyle)
				end if
			elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_HIGHLIGHTED) <> 0 or (theme.#TabStyle <> theme.TBS_RIBBON and theme.#TabStyle <> theme.TBS_OFFICE2013) or Items[index].flashing then
				if BitAND(nState,Enums.STATE_HOVER) = 0 then
					if Items[index].Flashing then
						bkColor = ARGBLighten(bkColor,0.4)
					end if
				end if
				Painter.ThemeFill(hdc,Items[index].PaintPath,bkColor,Enums.HORZ,theme.#ItemBkgndStyle,nState,false,&
									true,borderColor)
			end if
		case TabsOnBottom!
			if Items[index].Selected then
				bkColor2 = theme.of_GetItemColor(index,theme.CLR_CLIENTBKGND,nState)
				if theme.#ItemBkgndStyle = Enums.SOLID then
					Painter.FillPath(hdc,Items[index].PaintPath,bkColor2,bkColor2,Enums.VERT,false,true,borderColor)
					dcState = Painter.SaveDC(hdc)
					Painter.IntersectClipRect( hdc, Items[index].rcPaint.left,Items[index].rcPaint.bottom - 2,Items[index].rcPaint.right,Items[index].rcPaint.bottom)
					Painter.FillPath(hdc,Items[index].PaintPath,bkColor,bkColor,Enums.VERT,false,true,bkColor)
					Painter.RestoreDC(hdc,dcState)
				else
					if theme.#ItemBkgndStyle = Enums.TRANSPARENT  then
						Painter.FillPath(hdc,Items[index].PaintPath,bkColor2,0,Enums.VERT,false,true,0)
					else
						Painter.FillPath(hdc,Items[index].PaintPath,bkColor2,bkColor,Enums.VERT,false,true,0)
					end if
					Painter.DrawThemeBorder(hdc,Items[index].PaintPath,borderColor,theme.#ItemBkgndStyle)
				end if
			elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_HIGHLIGHTED) <> 0 or (theme.#TabStyle <> theme.TBS_RIBBON and theme.#TabStyle <> theme.TBS_OFFICE2013) or Items[index].flashing then
				if BitAND(nState,Enums.STATE_HOVER) = 0 then
					if Items[index].Flashing then
						bkColor = ARGBLighten(bkColor,0.4)
					end if
				end if
				Painter.ThemeFill(hdc,Items[index].PaintPath,bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
									true,borderColor)
			end if
end choose

/* Draw text and image*/
if Items[index].UseAnimatedImage then
	Items[index].AnimatedImage.Draw(hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].enabled )
elseif Items[index].imageIndex > 0 then
	_ImageList.Draw(Items[index].imageindex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].Enabled)
end if

if Items[index].DisplayText and Items[index].szText.cx>0 then
	_of_DrawItemText(index,hdc)
end if

if Items[index].CloseButton.visible then
	_of_DrawItemCloseButton(index,hdc)
end if
end subroutine

private subroutine _of_flashdrawitem (readonly integer index);Uint nFadeTime

if #LockUpdate then return
if Not Visible then return
if Not theme.#TabStripBar then return
if index < 1 or index > UpperBound(Items) then return
if Not Items[index].visible then return
if Items[index].Floated then return
if Items[index].hidden then return
if Not Items[index].Enabled or Items[index].MouseOver or Items[index].Selected then
	return
end if

nFadeTime = #FadeTime
#FadeTime = #FlashFadeTime

_of_DrawItem(index,true)

#FadeTime = nFadeTime
end subroutine

private subroutine _of_drawitem (readonly integer index, readonly boolean bimageonly, readonly boolean fadeanimation);ulong safeDC
RECTF adjustedRect

if #LockUpdate then return
if Not Visible then return
if Not theme.#TabStripBar then return
if index < 1 or index > UpperBound(Items) then return
if Not Items[index].visible then return
if Items[index].Floated then return
if Items[index].hidden then return

safeDC=GetSafeNcDC()

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_CHEVRON)

Painter.IntersectClipRect(safeDC,adjustedRect)
if bImageOnly then
	Painter.IntersectClipRect(safeDC,Items[index].rcImage)
else
	Painter.IntersectClipRect(safeDC,Items[index].rcPaint)
end if

if ScrollBarUp.Visible then
	Painter.ExcludeClipRect(safeDC,ScrollBarUp.rcPaint)
end if
if ScrollBarDown.Visible then
	Painter.ExcludeClipRect(safeDC,ScrollBarDown.rcPaint)
end if

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnNcEraseBkgnd(safeDC)

int i,beginIndex,endIndex,nSelectedIndex
beginIndex = index
endIndex = index
if theme.#TabStyle = theme.TBS_OFFICE or theme.#TabStyle = theme.TBS_SOLID then
	if beginIndex > 1 then
		beginIndex --
	end if
	if endIndex < UpperBound(Items) then
		endIndex ++
	end if
end if

for i = beginIndex to endIndex
	if i = _selectedIndex then
		nSelectedIndex = i
		continue
	end if
	_of_DrawItem(i,safeDC)
next
if nSelectedIndex > 0 then
	_of_DrawItem(nSelectedIndex,safeDC)
end if

if of_IsDraggingMode() and _draggingIndex < beginIndex or _draggingIndex > endIndex then
	_of_DrawItem(_draggingIndex,safeDC)
end if

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

private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly boolean fadeanimation);ulong safeDC
RECTF adjustedRect

if #LockUpdate then return
if Not Visible then return
if Not theme.#TabStripBar then return
if Not ScrollBar.Visible then return

safeDC=GetSafeNcDC()

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER)

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

private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly unsignedlong hdc);ulong borderColor,bkColor,arrowColor,nState
Uint orientation
POINTF pt1,pt2,pt3
Constant real ARROWSIZE = 6

if Not Scrollbar.Visible then return

if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
	orientation = Enums.VERT
else
	orientation = Enums.HORZ
end if

if ScrollBar.MouseOver then nState += Enums.STATE_HOVER
if ScrollBar.MouseDown then nState += Enums.STATE_PRESSED

bkColor = theme.of_GetColor(theme.CLR_SCROLLBARBKGND,nState)
borderColor = theme.of_GetColor(theme.CLR_BORDER,nState)
arrowColor = theme.of_GetColor(theme.CLR_ARROW,nState)

//Fill background
Painter.ThemeFill(hdc,Scrollbar.rcPaint,bkColor,orientation,theme.#ItemBkgndStyle,nState,false,&
										Enums.BS_SOLID,borderColor,0)
										
if orientation = Enums.VERT then
	//Draw arrow
	if ScrollBar = ScrollBarDown then		//箭头向下
		pt1.x = Scrollbar.rcPaint.left + (Scrollbar.rcPaint.right - Scrollbar.rcPaint.left - ARROWSIZE)/2
		pt1.y = Scrollbar.rcPaint.top + (Scrollbar.rcPaint.bottom - Scrollbar.rcPaint.top - ARROWSIZE / 2) / 2 
		pt2.x = pt1.x + ARROWSIZE
		pt2.y = pt1.y
		pt3.x = pt1.x + ARROWSIZE / 2
		pt3.y = pt1.y + ARROWSIZE / 2
	else						//箭头向上
		pt1.x = Scrollbar.rcPaint.left + (Scrollbar.rcPaint.right - Scrollbar.rcPaint.left - ARROWSIZE)/2 + ARROWSIZE/2
		pt1.y = Scrollbar.rcPaint.top + (Scrollbar.rcPaint.bottom - Scrollbar.rcPaint.top - ARROWSIZE / 2 ) / 2
		pt2.x = pt1.x + ARROWSIZE / 2
		pt2.y = pt1.y + ARROWSIZE / 2
		pt3.x = pt1.x - ARROWSIZE / 2
		pt3.y = pt1.y + ARROWSIZE / 2
	end if
else
	//Draw arrow
	if ScrollBar = ScrollBarDown then		//箭头向右
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
end if

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

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
if #SmoothScroll then
	tme.dwhovertime = 80
else
	tme.dwhovertime = 200
end if

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(tme)
end subroutine

private function boolean _of_openwindow (ref window objectw, readonly string clsname);long nvl
SetNull(nvl)
return _of_OpenWindowWithParm(ref objectW,nvl,clsName)
end function

private function boolean _of_openwindow (ref window objectw);long nvl
SetNull(nvl)
return _of_OpenWindowWithParm(ref objectW,nvl,"")
end function

private function boolean _of_closewindow (readonly window objectW);if Not IsValidObject(objectW) then return false
if Not _of_IsWindowCreator(objectW) then return false

Win32.RemoveProp(Handle(objectW),PRP_WINDOWCREATOR)

return (Close(objectW) = 1)
end function

private function boolean _of_iswindowcreator (readonly window objectW);if Not IsValidObject(objectW) then return false

return (Win32.GetProp(Handle(objectW),PRP_WINDOWCREATOR) = 1)
end function

public function integer of_getindex (readonly window objectw);int index

for index = 1 to UpperBound(Items)
	if Not Items[index].IsWindow then continue
	if Items[index].ObjectW = objectW then return index
next

return 0
end function

public function long of_getwindow (readonly integer index, ref window objectw);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not Items[index].IsWindow then return RetCode.E_INVALID_TYPE

try
	objectW = Items[index].objectW
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(objectW),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function long of_getpagew (readonly integer index, ref s_cst_tabpagew pagew);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not Items[index].IsPageW then return RetCode.E_INVALID_TYPE

return of_GetWindow(index,ref pageW)
end function

public function integer of_addwindowwithparm (ref window objectw, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext);return of_InsertWindowWithParm(UpperBound(Items) + 1,ObjectW,aparm,txt,image,tipText)
end function

public function integer of_addwindowwithparm (ref window objectw, readonly any aparm, readonly string txt, readonly string image);return of_AddWindowWithParm(ObjectW,aparm,txt,image,"")
end function

public function integer of_addwindowwithparm (ref window objectw, readonly any aparm);return of_AddWindowWithParm(ObjectW,aparm,"","'","")
end function

public function integer of_addwindowwithparm (readonly string clsname, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext);return of_InsertWindowWithParm(UpperBound(Items)+1,clsName,aparm,txt,image,tiptext)
end function

public function integer of_addwindowwithparm (readonly string clsname, readonly any aparm, readonly string txt, readonly string image);return of_AddWindowWithParm(clsName,aparm,txt,image,"")
end function

public function integer of_addwindowwithparm (readonly string clsname, readonly any aparm);return of_AddWindowWithParm(clsName,aparm,"","","")
end function

public function integer of_addwindow (ref window objectw, readonly string txt, readonly string image, readonly string tiptext);return of_InsertWindow(UpperBound(Items) + 1,ObjectW,txt,image,tipText)
end function

public function integer of_addwindow (ref window objectw, readonly string txt, readonly string image);return of_AddWindow(ObjectW,txt,image,"")
end function

public function integer of_addwindow (ref window objectw);return of_AddWindow(ObjectW,"","","")
end function

public function integer of_addwindow (readonly string clsname, readonly string txt, readonly string image, readonly string tiptext);return of_InsertWindow(UpperBound(Items) + 1,clsName,txt,image,tipText)
end function

public function integer of_addwindow (readonly string clsname, readonly string txt, readonly string image);return of_AddWindow(clsName,txt,image,"")
end function

public function integer of_addwindow (readonly string clsname);return of_AddWindow(clsName,"","","")
end function

public function integer of_insertwindowwithparm (readonly integer index, ref window objectw, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext);int itemIndex
int i
TABCONTROLITEM newItem
Constant String CLS_TABPAGEW = "s_cst_tabpagew"

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

itemIndex = of_GetIndex(objectW)

if itemIndex > 0 then return itemIndex

if Not IsValidObject(objectW) then
	if Not _of_OpenWindowWithParm(ref objectW,aparm) then return RetCode.E_INVALID_OBJECT
	newItem.ObjectOwner = true
elseif _of_IsWindowCreator(objectW) then
	newItem.ObjectOwner = true
end if

objectW.Hide()

InitWindowPage(Handle(objectW))

if Win32.GetParent(Handle(objectW)) <> #Handle then
	newItem.hOldParent = Win32.SetParent(Handle(objectW),#Handle)
end if

newItem.objectW = objectW
newItem.IsWindow = true

if IsAncestor(objectW,CLS_TABPAGEW) then
	newItem.IsPageW = true
	newItem.PageW = objectW
	newItem.PageW.Event OnInit(this)
end if

newItem.enabled = true
newItem.visible = true
newItem.displaytext = true
newItem.useanimatedimage = false
newItem.ParentTabControl = this

if Len(txt) = 0 and Len(image) = 0 and Len(tiptext) = 0 then
	newItem.Text = objectW.Title
	newItem.image = objectW.Icon
else
	newItem.Text = txt
	newItem.tipText = tiptext
	newItem.image = image
end if

if Len(newItem.image) > 0 then
	newItem.imageindex = _ImageList.AddImage(Trim(newItem.image))
end if

Painter.CreatePath(1,ref newItem.PaintPath)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

if index <= _selectedIndex then
	_selectedIndex += 1
end if

if Items[index].IsPageW then
	Items[index].PageW.Event OnOpened()
end if
Event OnTabOpened(index)

_of_UpdateTextSize(index)
of_UpdatePoints()

if _SelectedIndex = 0 and Not #LockUpdate then
	of_Select(index)
end if

return index
end function

public function integer of_insertwindowwithparm (readonly integer index, ref window objectw, readonly any aparm, readonly string txt, readonly string image);return of_InsertWindowWithParm(index,objectW,aparm,txt,image,"")
end function

public function integer of_insertwindowwithparm (readonly integer index, ref window objectw, readonly any aparm);return of_InsertWindowWithParm(index,objectW,aparm,"","","")
end function

public function integer of_insertwindowwithparm (readonly integer index, readonly string clsname, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext);int newIndex
Window lw

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE
if Not _of_OpenWindowWithParm(ref lw,aparm,clsName) then return RetCode.E_INVALID_TYPE

newIndex = of_InsertWindow(index,ref lw,txt,image,tipText)
if newIndex <= 0 then
	_of_CloseWindow(lw)
end if

return newIndex
end function

public function integer of_insertwindowwithparm (readonly integer index, readonly string clsname, readonly any aparm, readonly string txt, readonly string image);return of_InsertWindowWithParm(index,clsName,aparm,txt,image,"")
end function

public function integer of_insertwindowwithparm (readonly integer index, readonly string clsname, readonly any aparm);return of_InsertWindowWithParm(index,clsName,aparm,"","","")
end function

public function integer of_insertwindow (readonly integer index, ref window objectw, readonly string txt, readonly string image, readonly string tiptext);long nvl
SetNull(nvl)
return of_InsertWindowWithParm(index,ref objectW,nvl,txt,image,tipText)
end function

public function integer of_insertwindow (readonly integer index, ref window objectw, readonly string txt, readonly string image);return of_InsertWindow(index,objectW,txt,image,"")
end function

public function integer of_insertwindow (readonly integer index, ref window objectw);return of_InsertWindow(index,objectW,"","","")
end function

public function integer of_insertwindow (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly string tiptext);long nvl
SetNull(nvl)
return of_InsertWindowWithParm(index,clsName,nvl,txt,image,tipText)
end function

public function integer of_insertwindow (readonly integer index, readonly string clsname, readonly string txt, readonly string image);return of_InsertWindow(index,clsName,txt,image,"")
end function

public function integer of_insertwindow (readonly integer index, readonly string clsname);return of_InsertWindow(index,clsName,"","","")
end function

public function integer of_addpagewwithparm (ref s_cst_tabpagew pagew, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext);return of_AddWindowWithParm(pageW,aparm,txt,image,tipText)
end function

public function integer of_addpagewwithparm (ref s_cst_tabpagew pagew, readonly any aparm, readonly string txt, readonly string image);return of_AddWindowWithParm(pageW,aparm,txt,image,"")
end function

public function integer of_addpagewwithparm (ref s_cst_tabpagew pagew, readonly any aparm);return of_AddWindowWithParm(pageW,aparm,"","","")
end function

public function integer of_addpagew (ref s_cst_tabpagew pagew, readonly string txt, readonly string image, readonly string tiptext);return of_AddWindow(pageW,txt,image,tipText)
end function

public function integer of_addpagew (ref s_cst_tabpagew pagew, readonly string txt, readonly string image);return of_AddWindow(pageW,txt,image,"")
end function

public function integer of_addpagew (ref s_cst_tabpagew pagew);return of_AddWindow(pageW,"","","")
end function

public function integer of_insertpagewwithparm (readonly integer index, ref s_cst_tabpagew pagew, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext);return of_InsertWindowWithParm(index,pageW,aparm,txt,image,tipText)
end function

public function integer of_insertpagewwithparm (readonly integer index, ref s_cst_tabpagew pagew, readonly any aparm, readonly string txt, readonly string image);return of_InsertWindowWithParm(index,pageW,aparm,txt,image,"")
end function

public function integer of_insertpagewwithparm (readonly integer index, ref s_cst_tabpagew pagew, readonly any aparm);return of_InsertWindowWithParm(index,pageW,aparm,"","","")
end function

public function integer of_insertpagew (readonly integer index, ref s_cst_tabpagew pagew, readonly string txt, readonly string image, readonly string tiptext);return of_InsertWindow(index,pageW,txt,image,tipText)
end function

public function integer of_insertpagew (readonly integer index, ref s_cst_tabpagew pagew, readonly string txt, readonly string image);return of_InsertWindow(index,pageW,txt,image,"")
end function

public function integer of_insertpagew (readonly integer index, ref s_cst_tabpagew pagew);return of_InsertWindow(index,pageW,"","","")
end function

public function boolean of_iswindow (readonly integer index);if index < 1 or index > UpperBound(Items) then return false
return Items[index].IsWindow
end function

public function boolean of_ispage (readonly integer index);if index < 1 or index > UpperBound(Items) then return false
return Items[index].IsPage
end function

public function boolean of_ispagew (readonly integer index);if index < 1 or index > UpperBound(Items) then return false
return Items[index].IsPageW
end function

public function long of_removeall (readonly boolean bforce);int index
boolean bLockUpdate
TABCONTROLITEM emptyItems[]

//Query
if Not bForce then
	for index = UpperBound(Items) to 1 step -1
		if Items[index].Locked then return RetCode.FAILED
		if Items[index].IsPage then
			if IsPrevented(Items[index].Page.Event OnCloseQuery()) then return RetCode.FAILED
		elseif Items[index].IsWindow then
			if IsPrevented(Items[index].ObjectW.Event CloseQuery()) then return RetCode.FAILED
		end if
		if IsPrevented(Event OnTabClosing(index)) then return RetCode.FAILED
	next
end if

//Remove
bLockUpdate = #LockUpdate
#LockUpdate = true
if _RedrawFlag then Super::SetRedraw(false)

for index = UpperBound(Items) to 1 step -1
	if Items[index].Floated then
		if Items[index].IsWindow then
			Items[index].ObjectW.Hide()
			if Items[index].hOldParent > 0 then
				Win32.SetParent(Handle(Items[index].ObjectW),Items[index].hOldParent)
			else
				Win32.SetParent(Handle(Items[index].ObjectW),#Handle)
			end if
			if Items[index].ObjectOwner then
				_of_CloseWindow(Items[index].ObjectW)
			end if
		else
			Items[index].Object.Hide()
			if Items[index].IsPage then
				Items[index].Page.Event OnClose()
			end if
			if Items[index].hOldParent > 0 then
				Win32.SetParent(Handle(Items[index].Object),Items[index].hOldParent)
			else
				Win32.SetParent(Handle(Items[index].Object),#Handle)
			end if
			if Items[index].ObjectOwner then
				_of_CloseUserObject(Items[index].Object)
			end if
		end if
		if IsValidObject(Items[index].FloatWnd) then
			Items[index].FloatWnd.Event OnCloseWindow()
		end if
	else
		if Items[index].IsWindow then
			Items[index].ObjectW.Hide()
			if Items[index].hOldParent > 0 then
				Win32.SetParent(Handle(Items[index].ObjectW),Items[index].hOldParent)
			end if
			if Items[index].ObjectOwner then
				_of_CloseWindow(Items[index].ObjectW)
			end if
		else
			Items[index].Object.Hide()
			if Items[index].IsPage then
				Items[index].Page.Event OnClose()
			end if
			if Items[index].hOldParent > 0 then
				Win32.SetParent(Handle(Items[index].Object),Items[index].hOldParent)
			end if
			if Items[index].ObjectOwner then
				_of_CloseUserObject(Items[index].Object)
			end if
		end if
	end if
	
	if IsValidObject(Items[index].AnimatedImage) then
		Destroy Items[index].AnimatedImage
	end if
	Painter.DeletePath(Items[index].PaintPath)
	
	Event OnTabClosed(index)
next

Items = emptyItems

_selectedIndex = 0
_mouseOverIndex = 0
_ScrollPosition = 0
_StartPoint = 0
_EndPoint = 0
SetNull(_LastScrollPosition)

#LockUpdate = bLockUpdate
_of_UpdatePoints()
if _RedrawFlag then Super::SetRedraw(true)

_of_ShowTip(0)

return RetCode.OK
end function

public function long of_remove (readonly integer index, boolean bforce);int i
real offsetSize
boolean bVisible
boolean bLockUpdate
TABCONTROLITEM newItems[]

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

if Items[index].Floated and IsValidObject(Items[index].FloatWnd) then
	if Items[index].FloatWnd.wf_IsClosing() then
		bForce = true
	end if
end if

if Not bForce then
	if Items[index].Locked then return RetCode.FAILED
	if Items[index].IsPage then
		if IsPrevented(Items[index].Page.Event OnCloseQuery()) then return RetCode.FAILED
	elseif Items[index].IsWindow then
		if IsPrevented(Items[index].ObjectW.Event CloseQuery()) then return RetCode.FAILED
	end if
	if IsPrevented(Event OnTabClosing(index)) then return RetCode.FAILED
end if

if Items[index].Floated then
	if index < _SelectedIndex then
		_SelectedIndex -= 1
	end if
	
	if Items[index].IsWindow then
		Items[index].ObjectW.Hide()
		if Items[index].hOldParent > 0 then
			Win32.SetParent(Handle(Items[index].ObjectW),Items[index].hOldParent)
		else
			Win32.SetParent(Handle(Items[index].ObjectW),#Handle)
		end if
		if Items[index].ObjectOwner then
			_of_CloseWindow(Items[index].ObjectW)
		end if
	else
		Items[index].Object.Hide()
		if Items[index].IsPage then
			Items[index].Page.Event OnClose()
		end if
		if Items[index].hOldParent > 0 then
			Win32.SetParent(Handle(Items[index].Object),Items[index].hOldParent)
		else
			Win32.SetParent(Handle(Items[index].Object),#Handle)
		end if
		if Items[index].ObjectOwner then
			_of_CloseUserObject(Items[index].Object)
		end if
	end if
	
	if IsValidObject(Items[index].FloatWnd) then
		Items[index].FloatWnd.Event OnCloseWindow()
	end if
	
	if IsValidObject(Items[index].AnimatedImage) then
		Destroy Items[index].AnimatedImage
	end if
	Painter.DeletePath(Items[index].PaintPath)
	
	for i = 1 to UpperBound(Items)
		if i = index then continue
		newItems[UpperBound(newItems) + 1] = Items[i]
	next
else
	if index = _mouseOverIndex then
		_mouseOverIndex = 0
	end if
	if index = _mouseDownIndex then
		_mouseDownIndex = 0
	end if
	
	bVisible = Items[index].visible
	if bVisible then
		bLockUpdate = #LockUpdate
		#LockUpdate = true
		if _RedrawFlag then Super::SetRedraw(false)
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
	
	if Items[index].IsWindow then
		Items[index].ObjectW.Hide()
		if Items[index].hOldParent > 0 then
			Win32.SetParent(Handle(Items[index].ObjectW),Items[index].hOldParent)
		end if
		if Items[index].ObjectOwner then
			_of_CloseWindow(Items[index].ObjectW)
		end if
	else
		Items[index].Object.Hide()
		if Items[index].IsPage then
			Items[index].Page.Event OnClose()
		end if
		if Items[index].hOldParent > 0 then
			Win32.SetParent(Handle(Items[index].Object),Items[index].hOldParent)
		end if
		if Items[index].ObjectOwner then
			_of_CloseUserObject(Items[index].Object)
		end if
	end if
	
	if IsValidObject(Items[index].AnimatedImage) then
		Destroy Items[index].AnimatedImage
	end if
	Painter.DeletePath(Items[index].PaintPath)
	
	for i = 1 to UpperBound(Items)
		if i = index then continue
		if #SmoothClose and bVisible and i > index then
			if Items[i].visible and Not Items[i].Floated then
				if offsetSize = 0 then
					if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
						offsetSize = ((Items[i].rcPaint.top - Items[i].OffsetPosition) -  (Items[index].rcPaint.bottom  - Items[index].OffsetPosition)) + (Items[index].rcPaint.bottom - Items[index].rcPaint.top)
					else
						offsetSize = ((Items[i].rcPaint.left - Items[i].OffsetPosition) -  (Items[index].rcPaint.right  - Items[index].OffsetPosition)) + (Items[index].rcPaint.right - Items[index].rcPaint.left)
					end if
				end if
				Items[i].OffsetPosition += offsetSize
			end if
		end if
		newItems[UpperBound(newItems) + 1] = Items[i]
	next
end if

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
	_of_UpdatePoints()
	if _RedrawFlag then Super::SetRedraw(true)
end if

if #SmoothClose and offsetSize <> 0 then
	Timer.Start(TM_DRAG,TMI_DRAG)
end if
	
_of_ShowTip(0)

Event OnTabClosed(index)

return RetCode.OK
end function

public function long of_remove (readonly integer index);return of_Remove(index,false)
end function

public function long of_scrollto (readonly integer index, readonly long flag);real scrollSize
RECTF adjustedRect

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not theme.#TabStripBar then return RetCode.FAILED
if Not Items[index].visible then return RetCode.FAILED
if Items[index].Floated then return RetCode.FAILED
if Not ScrollBarUp.Visible and Not ScrollBarDown.Visible then return RetCode.FAILED

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)
			
if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
	choose case flag
		case Enums.SF_FORWARD
			if ScrollBarDown.Visible then
				if index = _lastIndex then
					if Items[index].rcPaint.Bottom - Items[index].OffsetPosition > adjustedRect.Bottom then
						scrollSize = adjustedRect.Bottom - (Items[index].rcPaint.Bottom  - Items[index].OffsetPosition)
					end if
				else
					if Items[index].rcPaint.Bottom  - Items[index].OffsetPosition > ScrollBarDown.rcPaint.Top - 1 then
						scrollSize = (ScrollBarDown.rcPaint.Top - 1 ) - (Items[index].rcPaint.Bottom  - Items[index].OffsetPosition)
					end if
				end if
			end if
		case Enums.SF_BACKWARD
			if ScrollBarUp.Visible then
				if index = _firstIndex then
					if Items[index].rcPaint.Top  - Items[index].OffsetPosition < adjustedRect.top then
						scrollSize = adjustedRect.top - (Items[index].rcPaint.Top  - Items[index].OffsetPosition)
					end if
				else
					if Items[index].rcPaint.Top  - Items[index].OffsetPosition < ScrollBarUp.rcPaint.Bottom + 1 then
						scrollSize = (ScrollBarUp.rcPaint.Bottom + 1) - (Items[index].rcPaint.Top  - Items[index].OffsetPosition)
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
					if Items[index].rcPaint.Right - Items[index].OffsetPosition > adjustedRect.right then
						scrollSize = adjustedRect.right - (Items[index].rcPaint.Right  - Items[index].OffsetPosition)
					end if
				else
					if Items[index].rcPaint.Right - Items[index].OffsetPosition > ScrollBarDown.rcPaint.Left - 1 then
						scrollSize = (ScrollBarDown.rcPaint.Left - 1) - (Items[index].rcPaint.Right  - Items[index].OffsetPosition)
					end if
				end if
			end if
		case Enums.SF_BACKWARD
			if ScrollBarUp.Visible then
				if index = _firstIndex then
					if Items[index].rcPaint.Left  - Items[index].OffsetPosition < adjustedRect.Left then
						scrollSize = adjustedRect.Left - (Items[index].rcPaint.Left  - Items[index].OffsetPosition)
					end if
				else
					if Items[index].rcPaint.Left  - Items[index].OffsetPosition < ScrollBarUp.rcPaint.Right + 1 then
						scrollSize = (ScrollBarUp.rcPaint.Right + 1) - (Items[index].rcPaint.Left - Items[index].OffsetPosition)
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

public function integer setredraw (boolean f);_RedrawFlag = f
return Super::SetRedraw(f)
end function

public function integer of_insertpagewithparm (readonly integer index, ref u_cst_tabpage page, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext);int nIndex
any anyOld

anyOld = _anyPageOpenParam
_anyPageOpenParam = aparm

nIndex = of_InsertObject(index,ref page,txt,image,tipText)

_anyPageOpenParam = anyOld

return nIndex
end function

public function integer of_insertpagewithparm (readonly integer index, ref u_cst_tabpage page, readonly any aparm, readonly string txt, readonly string image);return of_InsertPageWithParm(index,ref page,aparm,txt,image,"")
end function

public function integer of_insertpagewithparm (readonly integer index, ref u_cst_tabpage page, readonly any aparm);return of_InsertPageWithParm(index,ref page,aparm,"","","")
end function

public function integer of_insertpagewithparm (readonly integer index, readonly string clsname, readonly any aparm, readonly string txt, readonly string image);return of_InsertPageWithParm(index,clsName,aparm,txt,image,"")
end function

public function integer of_insertpagewithparm (readonly integer index, readonly string clsname, readonly any aparm);return of_InsertPageWithParm(index,clsName,aparm,"","","")
end function

public function integer of_insertpagewithparm (readonly integer index, readonly string clsname, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext);int nIndex
any anyOld

anyOld = _anyPageOpenParam
_anyPageOpenParam = aparm

nIndex = of_InsertObject(index,clsName,txt,image,tipText)

_anyPageOpenParam = anyOld

return nIndex
end function

public function integer of_insertpagewithparm (ref u_cst_tabpage page, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext);return of_InsertPageWithParm(UpperBound(Items) + 1,ref page,aparm,txt,image,tipText)
end function

public function integer of_addpagewithparm (readonly string clsname, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext);return of_InsertPageWithParm(UpperBound(Items)+1,clsName,aparm,txt,image,tiptext)
end function

public function integer of_addpagewithparm (ref u_cst_tabpage page, readonly any aparm, readonly string txt, readonly string image);return of_AddPageWithParm(ref page,aparm,txt,image,"")
end function

public function integer of_addpagewithparm (ref u_cst_tabpage page, readonly any aparm, readonly string txt, readonly string image, readonly string tiptext);return of_InsertPageWithParm(UpperBound(Items)+1,ref page,aparm,txt,image,tiptext)
end function

public function integer of_addpagewithparm (ref u_cst_tabpage page, readonly any aparm);return of_AddPageWithParm(ref page,aparm,"","","")
end function

public function integer of_addpagewithparm (readonly string clsname, readonly any aparm, readonly string txt, readonly string image);return of_AddPageWithParm(clsName,aparm,txt,image,"")
end function

public function integer of_addpagewithparm (readonly string clsname, readonly any aparm);return of_AddPageWithParm(clsName,aparm,"","","")
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
if index = _draggingIndex  then nState += Enums.STATE_DRAGGING
if Not Items[index].Enabled then nState += Enums.STATE_DISABLED

return nState
end function

public function unsignedlong of_getitemclosebuttonstate (readonly integer index);ulong nState

if index < 1 or index > UpperBound(Items) then return 0

if Items[index].CloseButton.MouseOver  then nState += Enums.STATE_HOVER
if Items[index].CloseButton.MouseDown  then nState += Enums.STATE_PRESSED

return nState
end function

public function integer of_getindexbytag (readonly string stag);int index

for index = 1 to UpperBound(Items)
	if Items[index].tag = stag then return index
next

return 0
end function

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

choose case theme.#TabPosition
	case TabsOnLeft!
		if BitAND(flags,ADJ_BORDER) > 0 then
			if theme.#TabStripBorderStyle = Enums.BS_SOLID then
				fBorderSize = P2DX(1)
				adjRect.left += fBorderSize
				adjRect.top += fBorderSize
				adjRect.Bottom -= fBorderSize
			end if
		end if
		if BitAND(flags,ADJ_BORDERMARGIN) > 0 then
			adjRect.left += theme.#BorderMargin.left
			adjRect.top += theme.#BorderMargin.top
			adjRect.bottom -= theme.#BorderMargin.bottom
		end if
	case TabsOnTop!
		if BitAND(flags,ADJ_BORDER) > 0 then
			if theme.#TabStripBorderStyle = Enums.BS_SOLID then
				fBorderSize = P2DX(1)
				adjRect.left += fBorderSize
				adjRect.top += fBorderSize
				adjRect.right -= fBorderSize
			end if
		end if
		if BitAND(flags,ADJ_BORDERMARGIN) > 0 then
			adjRect.left += theme.#BorderMargin.left
			adjRect.top += theme.#BorderMargin.top
			adjRect.right -= theme.#BorderMargin.right
		end if
	case TabsOnRight!
		if BitAND(flags,ADJ_BORDER) > 0 then
			if theme.#TabStripBorderStyle = Enums.BS_SOLID then
				fBorderSize = P2DX(1)
				adjRect.top += fBorderSize
				adjRect.right -= fBorderSize
				adjRect.Bottom -= fBorderSize
			end if
		end if
		if BitAND(flags,ADJ_BORDERMARGIN) > 0 then
			adjRect.top += theme.#BorderMargin.top
			adjRect.right -= theme.#BorderMargin.right
			adjRect.bottom -= theme.#BorderMargin.bottom
		end if
	case TabsOnBottom!
		if BitAND(flags,ADJ_BORDER) > 0 then
			if theme.#TabStripBorderStyle = Enums.BS_SOLID then
				fBorderSize = P2DX(1)
				adjRect.left += fBorderSize
				adjRect.right -= fBorderSize
				adjRect.Bottom -= fBorderSize
			end if
		end if
		if BitAND(flags,ADJ_BORDERMARGIN) > 0 then
			adjRect.left += theme.#BorderMargin.left
			adjRect.right -= theme.#BorderMargin.right
			adjRect.bottom -= theme.#BorderMargin.bottom
		end if
end choose

if BitAND(flags,ADJ_CHEVRON) > 0 then
	if Chevron.visible then
		if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
			adjRect.Bottom -= Chevron.rcPaint.bottom - Chevron.rcPaint.top
		else
			adjRect.Right -= Chevron.rcPaint.right - Chevron.rcPaint.left
		end if
	end if
end if
end subroutine

private function unsignedlong _of_popupmenu (real xpos, real ypos);//Chevron menu
ulong rtCode
ulong pmFlags
int count, index
n_cst_popupmenu ln_menu
RECTF wndRect

if Not Chevron.visible then return 0

Painter.GetWindowRect(#Handle,ref wndRect)

choose case theme.#TabPosition
	case TabsOnLeft!
		xpos = wndRect.left + Chevron.rcPaint.Right + 1
		ypos = wndRect.top + Chevron.rcPaint.Bottom
		pmFlags = Win32.TPM_LEFTALIGN + Win32.TPM_BOTTOMALIGN
	case TabsOnTop!
		xpos = wndRect.left + Chevron.rcPaint.Right
		ypos = wndRect.top + Chevron.rcPaint.Bottom + 1
		pmFlags = Win32.TPM_RIGHTALIGN + Win32.TPM_TOPALIGN
	case TabsOnRight!
		xpos = wndRect.left + Chevron.rcPaint.Left - 1
		ypos = wndRect.top + Chevron.rcPaint.Bottom
		pmFlags = Win32.TPM_RIGHTALIGN + Win32.TPM_BOTTOMALIGN
	case TabsOnBottom!
		xpos = wndRect.left + Chevron.rcPaint.Right
		ypos = wndRect.top + Chevron.rcPaint.Top - 1
		pmFlags = Win32.TPM_RIGHTALIGN + Win32.TPM_BOTTOMALIGN
end choose

if IsPrevented(Event OnPopupMenu(IDX_CHEVRON,ref xpos,ref ypos,ref pmFlags)) then return 0

ln_menu = Create n_cst_popupmenu
ln_menu.of_SetToolTip(#ToolTip)
ln_menu.theme.of_SetTheme(theme)
ln_menu.theme.of_SetIconSize(theme.#IconSize.cx,theme.#IconSize.cy)
ln_menu.theme.Font.of_SetFont(theme.font)

count = UpperBound(Items)

for index = 1 to count
	if Not Items[index].Visible then continue
	ln_menu.of_AddMenu(Items[index].text,Items[index].image,Items[index].tipText,Items[index].Enabled,index)
next

ln_Menu.of_CheckRadios(1,count,_selectedIndex,false,true)

rtCode = ln_menu.of_Popup(xpos,ypos,pmFlags)

_lastPopupTime = Cpu()

Destroy ln_menu

return rtCode
end function

public function integer of_indexfrompoint (readonly real xpos, readonly real ypos);int index

if Not theme.#TabStripBar then return 0
if Not Painter.PtInRect(rcTabStrip,xpos,ypos) then return 0

if ScrollBarUp.Visible then
	if Painter.PtInRect(ScrollBarUp.rcPaint,xpos,ypos) then
		return IDX_SCROLLBARUP
	end if
end if

if ScrollBarDown.Visible then
	if Painter.PtInRect(ScrollBarDown.rcPaint,xpos,ypos) then
		return IDX_SCROLLBARDOWN
	end if
end if

if Chevron.Visible then
	if Painter.PtInRect(Chevron.rcPaint,xpos,ypos) then
		return IDX_CHEVRON
	end if
end if

if _mouseOverIndex > 0 then
	if Items[_mouseOverIndex].Visible and Items[_mouseOverIndex].Enabled and Not Items[_mouseOverIndex].Hidden and Not Items[_mouseOverIndex].Floated then
		if Painter.PtInRect(Items[_mouseOverIndex].rcPaint,xpos,ypos) then
			if Painter.IsVisiblePathPoint(Items[_mouseOverIndex].PaintPath,xpos,ypos) then return _mouseOverIndex
			if Painter.IsOutlineVisiblePathPoint(Items[_mouseOverIndex].PaintPath,xpos,ypos,_outlinePen) then return _mouseOverIndex
		end if
	end if
end if

for index = UpperBound(Items) to  1 step -1
	if index = _mouseOverIndex then continue
	if Not Items[index].visible or Not Items[index].enabled or Items[index].hidden or Items[index].Floated then continue
	if Painter.PtInRect(Items[index].rcPaint,xpos,ypos) then
		if Painter.IsVisiblePathPoint(Items[index].PaintPath,xpos,ypos) then return index
		if Painter.IsOutlineVisiblePathPoint(Items[index].PaintPath,xpos,ypos,_outlinePen) then return index
	end if
next

return 0
end function

private function boolean _of_isoverclosebutton (readonly integer index, readonly real xpos, readonly real ypos);if index < 1 or index > UpperBound(Items) then
	return false
end if

if Items[index].enabled and Items[index].visible and Items[index].CloseButton.visible and Not Items[index].Locked and Not Items[index].Floated then
	if Painter.PtInRect(Items[index].CloseButton.rcPaint,xpos,ypos) then
		return true
	end if
end if
return false
end function

public function long of_float (readonly integer index, readonly real floatx, readonly real floaty, readonly string floatwndcls);return of_Float(index,floatX,floatY,-1,-1,floatWndCls)
end function

public function long of_float (readonly integer index, readonly real floatx, readonly real floaty, readonly real floatwidth, readonly real floatheight, readonly string floatwndcls);//感谢Coffee(2054131@qq.com)完善该功能
//2015-05-02
int i
long rtCode
real offsetSize
boolean bLockUpdate
RECTF itemRect

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].Floated then return RetCode.OK
if Items[index].IsPage then
	if IsPrevented(Items[index].Page.Event OnFloating()) then return RetCode.FAILED
elseif Items[index].IsPageW then
	if IsPrevented(Items[index].PageW.Event OnFloating()) then return RetCode.FAILED
end if
if IsPrevented(Event OnTabFloating(index)) then return RetCode.FAILED

itemRect = Items[index].rcPaint
if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
	Painter.OffsetRect(ref itemRect,0,-Items[index].OffsetPosition)
else
	Painter.OffsetRect(ref itemRect,-Items[index].OffsetPosition,0)
end if

Items[index].FloatPos.x = floatX
Items[index].FloatPos.y = floatY
Items[index].FloatSize.cx = floatWidth
Items[index].FloatSize.cy = floatHeight

bLockUpdate = #LockUpdate
#LockUpdate = true
Items[index].Floated = true
if IsValidObject(Items[index].FloatWnd) then
	Items[index].FloatWnd.Event OnAttach(Items[index])
	Items[index].FloatWnd.Show()
else
	try
		if Len(Trim(floatWndCls)) = 0  then
			rtCode = OpenWithParm(ref Items[index].FloatWnd,Items[index]/*,#ParentWindow*/)
		else
			rtCode = OpenWithParm(ref Items[index].FloatWnd,Items[index],floatWndCls/*,#ParentWindow*/)
		end if
	catch(Throwable ex)
		rtCode = -1
	end try
	if rtCode <> 1 then
		#LockUpdate = false
		Items[index].Floated = false
		return RetCode.E_INVALID_TYPE
	end if
end if
#LockUpdate = bLockUpdate

if index = _SelectedIndex then		//窗口打开时尝试过选择其它标签
	_SelectedIndex = 0
end if

if Items[index].Visible then
	if #SmoothClose then
		for i = index + 1 to UpperBound(Items)
			if Items[i].Floated then continue
			if Items[i].visible then
				if offsetSize = 0 then
					if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
						offsetSize = ((Items[i].rcPaint.top - Items[i].OffsetPosition) -  itemRect.bottom) + (itemRect.bottom - itemRect.top)
					else
						offsetSize = ((Items[i].rcPaint.left - Items[i].OffsetPosition) -  itemRect.right) + (itemRect.right - itemRect.left)
					end if
				end if
				Items[i].OffsetPosition += offsetSize
			end if
		next
		if offsetSize <> 0 then
			Timer.Start(TM_DRAG,TMI_DRAG)
		end if
	end if
	of_UpdatePoints()
end if

if Items[index].IsPage then
	Items[index].Page.Post Event OnFloated()
elseif Items[index].IsPageW then
	Items[index].PageW.Post Event OnFloated()
end if
Event OnTabFloated(index)

return RetCode.OK
end function

public function long of_float (readonly integer index, readonly real floatx, readonly real floaty);return of_Float(index,floatX,floatY,-1,-1,"")
end function

private subroutine _of_offsetitemposition (readonly integer index, readonly real offsetsize);ulong matrix
RECTF tabStripRect

if index < 1 or index > UpperBound(Items) then return
if Not Items[index].visible then return
if Items[index].Floated then return
if offsetSize = 0 then return

tabStripRect = rcTabStrip
_of_AdjustRect(ref tabStripRect,ADJ_BORDER + ADJ_CHEVRON)

Painter.CreateMatrix(ref matrix)

if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
	if Not Painter.IsRectEmpty(Items[index].rcImage) then
		Painter.OffsetRect(Items[index].rcImage,0,offsetSize )
	end if
	if Not Painter.IsRectEmpty(Items[index].rcText) then
		Painter.OffsetRect(Items[index].rcText ,0,offsetSize)
	end if
	if Not Painter.IsRectEmpty(Items[index].CloseButton.rcPaint) then
		Painter.OffsetRect(Items[index].CloseButton.rcPaint ,0,offsetSize)
	end if
	if Not Painter.IsRectEmpty(Items[index].rcPaint) then
		Painter.OffsetRect(Items[index].rcPaint,0,offsetSize )
	end if
	
	Painter.TranslateMatrix(matrix,0,offsetSize,0)
	Painter.TransformPath(Items[index].PaintPath,matrix)
	
	if Items[index].rcPaint.bottom <= tabStripRect.top or Items[index].rcPaint.top >= tabStripRect.bottom then
		Items[index].Hidden = true
	else
		Items[index].Hidden = false
	end if
else
	if Not Painter.IsRectEmpty(Items[index].rcImage) then
		Painter.OffsetRect(Items[index].rcImage,offsetSize,0 )
	end if
	if Not Painter.IsRectEmpty(Items[index].rcText) then
		Painter.OffsetRect(Items[index].rcText,offsetSize ,0)
	end if
	if Not Painter.IsRectEmpty(Items[index].CloseButton.rcPaint) then
		Painter.OffsetRect(Items[index].CloseButton.rcPaint,offsetSize ,0)
	end if
	if Not Painter.IsRectEmpty(Items[index].rcPaint) then
		Painter.OffsetRect(Items[index].rcPaint,offsetSize,0 )
	end if
	
	Painter.TranslateMatrix(matrix,offsetSize,0,0)
	Painter.TransformPath(Items[index].PaintPath,matrix)
	
	if Items[index].rcPaint.right <= tabStripRect.left or Items[index].rcPaint.left >= tabStripRect.right then
		Items[index].Hidden = true
	else
		Items[index].Hidden = false
	end if
end if

Painter.DeleteMatrix(matrix)
end subroutine

private function real _of_gettabstripsize ();if theme.#TabStripBar then
	return theme.#TabStripSize
else
	return 0
end if
end function

private subroutine _of_scrollposition (readonly real scrollsize);int index
real scrollPosition
RECTF adjustedRect

if scrollSize = 0 then return

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

scrollPosition = _ScrollPosition

if scrollSize > 0 then		//Scroll up
	if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
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
elseif scrollSize < 0 then	//Scroll down
	if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
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

if _ScrollPosition <> scrollPosition then
	scrollPosition = _ScrollPosition - scrollPosition
	_StartPoint += scrollPosition
	_EndPoint += scrollPosition
	_of_UpdateScrollBarPoints()
	
	if theme.#TabPosition = TabsOnLeft! or theme.#TabPosition = TabsOnRight! then
		if of_IsDraggingMode()  then
			_mouseDownPoint.y += scrollPosition
			_lastMousePoint.y += scrollPosition
		end if
		for index = 1 to UpperBound(Items)
			if Not Items[index].visible then continue
			if Items[index].Floated then continue
			if index = _DraggingIndex then
				Items[index].OffsetPosition -= scrollPosition
				continue
			end if
			_of_OffsetItemPosition(index,scrollPosition)
		next
	else
		if of_IsDraggingMode()  then
			_mouseDownPoint.x += scrollPosition
			_lastMousePoint.x += scrollPosition
		end if
		for index = 1 to UpperBound(Items)
			if Not Items[index].visible then continue
			if Items[index].Floated then continue
			if index = _DraggingIndex then
				Items[index].OffsetPosition -= scrollPosition
				continue
			end if
			_of_OffsetItemPosition(index,scrollPosition)
		next
	end if
end if
end subroutine

private function boolean _of_openwindowwithparm (ref window objectw, readonly any aparm, readonly string clsname);if IsNull(aparm) then
	if Len(clsName) = 0 then
		OpenWithParm(objectW,this,#ParentWindow)
	else
		OpenWithParm(objectW,this,clsName,#ParentWindow)
	end if
else
	choose case ClassName(aparm)
		case "string"
			string sParam
			sParam = aparm
			if Len(clsName) = 0 then
				OpenWithParm(objectW,sParam,#ParentWindow)
			else
				OpenWithParm(objectW,sParam,clsName,#ParentWindow)
			end if
		case "integer","long","longlong","unsignedinteger","unsignedlong","decimal","double","real"
			double dParam
			dParam = aparm
			if Len(clsName) = 0 then
				OpenWithParm(objectW,dParam,#ParentWindow)
			else
				OpenWithParm(objectW,dParam,clsName,#ParentWindow)
			end if
		case "time","date","datetime"
			return false
		case else
			powerobject poParam
			poParam = aparm
			if Len(clsName) = 0 then
				OpenWithParm(objectW,poParam,#ParentWindow)
			else
				OpenWithParm(objectW,poParam,clsName,#ParentWindow)
			end if
	end choose
end if

if IsValidObject(objectW) then
	Win32.SetProp(Handle(objectW),PRP_WINDOWCREATOR,1)
	return true
else
	return false
end if
end function

private function boolean _of_openwindowwithparm (ref window objectw, readonly any aparm);return _of_OpenWindowWithParm(ref objectW,aparm,"")
end function

on u_cst_tabcontrol.create
call super::create
this.theme=create theme
this.timer=create timer
end on

on u_cst_tabcontrol.destroy
call super::destroy
destroy(this.theme)
destroy(this.timer)
end on

event oninit;call super::oninit;_ImageList = Create n_imagelist
_ImageList.ShareImage(true)
_ImageList.SetImageSize(theme.#IconSize.cx,theme.#IconSize.cy)
_dragIcon = Create n_dragicon

Painter.CreatePen(0,1,2,ref _outlinePen)

_hCurArrow = Win32.LoadCursor(0,Win32.IDC_ARROW)
_hCurNo = Win32.LoadCursor(0,Win32.IDC_NO)

_ToolTip = Create n_tooltip
_ToolTip.CreateToolTip(#Handle)
_TTID = _ToolTip.AddTool(#Handle,false,/*Win32.TTF_IDISHWND +*/ Win32.TTF_TRANSPARENT + Win32.TTF_TRACK + Win32.TTF_ABSOLUTE)

SetNull(_LastScrollPosition)

UpdateFrame()
end event

event onuninit;call super::onuninit;int index

for index = UpperBound(Items) to 1 step -1
	if Items[index].Floated then
		if Items[index].IsWindow then
			if IsValidObject(Items[index].ObjectW) then
				Items[index].ObjectW.Hide()
				if Items[index].hOldParent > 0 then
					Win32.SetParent(Handle(Items[index].ObjectW),Items[index].hOldParent)
				else
					Win32.SetParent(Handle(Items[index].ObjectW),#Handle)
				end if
				if Items[index].ObjectOwner then
					_of_CloseWindow(Items[index].ObjectW)
				end if
			end if
		else
			if IsValidObject(Items[index].Object) then
				Items[index].Object.Hide()
				if Items[index].hOldParent > 0 then
					Win32.SetParent(Handle(Items[index].Object),Items[index].hOldParent)
				else
					Win32.SetParent(Handle(Items[index].Object),#Handle)
				end if
				if Items[index].ObjectOwner then
					_of_CloseUserObject(Items[index].Object)
				end if
			end if
		end if
		if IsValidObject(Items[index].FloatWnd) then
			Items[index].FloatWnd.Event OnCloseWindow()
		end if
	else
		if Items[index].IsWindow then
			if IsValidObject(Items[index].ObjectW) then
				Items[index].ObjectW.Hide()
				if Items[index].hOldParent > 0 then
					Win32.SetParent(Handle(Items[index].ObjectW),Items[index].hOldParent)
				end if
				if Items[index].ObjectOwner then
					_of_CloseWindow(Items[index].ObjectW)
				end if
			end if
		else
			if IsValidObject(Items[index].Object) then
				Items[index].Object.Hide()
				if Items[index].hOldParent > 0 then
					Win32.SetParent(Handle(Items[index].Object),Items[index].hOldParent)
				end if
				if Items[index].ObjectOwner then
					_of_CloseUserObject(Items[index].Object)
				end if
			end if
		end if
	end if
	
	if IsValidObject(Items[index].AnimatedImage) then
		Destroy Items[index].AnimatedImage
	end if
	Painter.DeletePath(Items[index].PaintPath)
	
	Event OnTabClosed(index)
next

Painter.DeletePen(_outlinePen)

Destroy _ImageList
Destroy _dragIcon

if _TTID > 0 then
	_ToolTip.DelTool(#Handle,_TTID)
end if

Destroy _ToolTip
end event

type uo_logo from u_cst_canvas`uo_logo within u_cst_tabcontrol
string tag = "TabControl"
end type

type theme from n_cst_tabcontrol_theme within u_cst_tabcontrol descriptor "pb_nvo" = "true" 
end type

on theme.create
call super::create
end on

on theme.destroy
call super::destroy
end on

event ongetitemcolor;call super::ongetitemcolor;if index > 0 then
	if Items[index].IsPage then
		Items[index].Page.Event OnGetColor(colorFlag,state,ref color)
		if IsNull(color) then
			Parent.Event OnGetItemColor(index,colorFlag,state,ref color)
		end if
		if IsNull(color) and colorFlag = theme.CLR_CLIENTBKGND then
			color = Painter.GetPBColorA(Items[index].Page.TabBackColor)
		end if
	elseif Items[index].IsPageW then
		Items[index].PageW.Event OnGetColor(colorFlag,state,ref color)
		if IsNull(color) then
			Parent.Event OnGetItemColor(index,colorFlag,state,ref color)
		end if
		if IsNull(color) and colorFlag = theme.CLR_CLIENTBKGND then
			color = Painter.GetPBColorA(Items[index].PageW.BackColor)
		end if
	else
		Parent.Event OnGetItemColor(index,colorFlag,state,ref color)
	end if
else
	Parent.Event OnGetItemColor(index,colorFlag,state,ref color)
end if
end event

event ongetcolor;call super::ongetcolor;Parent.Event OnGetColor(colorFlag,state,ref color)
end event

event onthemechanged;call super::onthemechanged;int index
boolean dirty,bFrameChanged

choose case eventFlag
	case EVT_THEME
		dirty = true
		bFrameChanged = true
		_ScrollPosition = 0
	case EVT_BORDERSTYLE
		dirty = true
		bFrameChanged = true
	case EVT_FONT
		_of_UpdateTextSize()
		dirty = true
	case EVT_TABPOSITION
		dirty = true
		bFrameChanged = true
	case EVT_TABSTRIPBAR
		if theme.#TabStripBar then
			Timer.Start(TM_ANIMATION,TMI_ANIMATION)
		else
			Timer.Stop(TM_ANIMATION)
		end if
		dirty = true
		_ScrollPosition = 0
		bFrameChanged = true
	case EVT_TABLISTBUTTON
		dirty = true
	case EVT_TABCLOSEBUTTON
		dirty = true
	case EVT_TABSTYLE
		dirty = true
	case EVT_TEXTORIENTATION
		_of_UpdateTextSize()
		dirty = true
	case EVT_TEXTALIGN
		dirty = true
	case EVT_ICONPOSITION
		_of_UpdateTextSize()
		dirty = true
	case EVT_ICONSIZE
		_of_UpdateTextSize()
		_ImageList.SetImageSize(#IconSize.cx,#IconSize.cy)
		for index = 1 to UpperBound(Items)
			if IsValidObject(Items[index].AnimatedImage) then
				Items[index].AnimatedImage.SetImageSize(#IconSize.cx,#IconSize.cy)
			end if
		next
		dirty = true
	case EVT_ITEMMINSIZE
		if #FixedSize then
			dirty = true
		end if
	case EVT_FIXEDSIZE
		dirty = true
	case EVT_TABSTRIPBORDERSTYLE
		dirty = true
	case EVT_TABSTRIPSIZE
		dirty = true
		bFrameChanged = true
	case EVT_TABSTRIPOFFSET
		dirty = true
		bFrameChanged = true
	case EVT_BORDERMARGIN
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
		of_UpdatePoints()
		of_ScrollTo(_selectedIndex)
	end if
else
	of_Redraw(true)
end if

for index = 1 to UpperBound(Items)
	if Items[index].Floated then
		Items[index].FloatWnd.Event OnTabThemeChanged(eventFlag)
	end if
	if Items[index].IsPage then
		Items[index].Page.Event OnThemeChanged(eventFlag)
	elseif Items[index].IsPageW then
		Items[index].PageW.Event OnThemeChanged(eventFlag)
	end if
next

Parent.Event OnThemeChanged(eventFlag)
end event

type timer from n_timer within u_cst_tabcontrol descriptor "pb_nvo" = "true" 
end type

event ontimer;int index
real offsetSize
boolean bContinue
long hittestCode
RECTF wndRect
POINTF pt

if id = TM_DRAG then
	for index = 1 to UpperBound(Items)
		if index = _draggingIndex then continue
		if Items[index].OffsetPosition > 0 then
			offsetSize = (Items[index].OffsetPosition / 10) + 2
			if Items[index].OffsetPosition - offsetSize < 0 then
				offsetSize = Items[index].OffsetPosition
			end if
			_of_OffsetItemPosition(index,-offsetSize)
			Items[index].OffsetPosition += -offsetSize
			bContinue = true
		elseif Items[index].OffsetPosition < 0 then
			offsetSize = (Items[index].OffsetPosition / 10) - 2
			if Items[index].OffsetPosition - offsetSize > 0 then
				offsetSize = Items[index].OffsetPosition
			end if
			_of_OffsetItemPosition(index,-offsetSize)
			Items[index].OffsetPosition += -offsetSize
			bContinue = true
		end if
	next
	
	if bContinue then
		of_Redraw(false)
	elseif _MouseLeaveTracked then
		Painter.GetWindowRect(#Handle,ref wndRect)
		Painter.GetCursorPos(ref pt)
		
		hittestCode = Event OnNcHitTest(pt.x - wndRect.left,pt.y - wndRect.top)
		Event OnNcMouseMove(hittestCode,pt.x - wndRect.left,pt.y - wndRect.top)
	end if
	
	return bContinue
	
elseif id = TM_SCROLL then
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
	
	if (_smoothScrollSize = 0 or scrollSize = 0) then
		if _MouseLeaveTracked then
			Painter.GetWindowRect(#Handle,ref wndRect)
			Painter.GetCursorPos(ref pt)
			
			hittestCode = Event OnNcHitTest(pt.x - wndRect.left,pt.y - wndRect.top)
			Event OnNcMouseMove(hittestCode,pt.x - wndRect.left,pt.y - wndRect.top)
		elseif of_IsDraggingMode() then
			Event OnMouseMove(0,0,0)
		end if
		//Stop timer
		return false
	end if
	
	return true
	
elseif id = TM_ANIMATION then
	boolean needRedraw
	for index = 1 to UpperBound(Items)
		if Not Items[index].UseAnimatedImage then continue
		if Not Items[index].AnimatedImage.IsPlaying() then continue
		bContinue = true
		if Not Items[index].Visible or Items[index].Hidden then continue
		if Items[index].AnimatedImage.IsFrameChanged() then
			Items[index].AnimatedImage.NextFrame()
			if Not of_IsDraggingMode() and Timer.IsRunning(TM_DRAG) then
				needRedraw = true
				exit
			else
				_of_DrawItem(index,true,false)
			end if
		end if
	next
	if needRedraw then
		of_Redraw(false)
	end if
	return bContinue
	
elseif id = TM_FLASH then
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
	
end if

return false
end event

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

