$PBExportHeader$n_cst_window_mdiclient.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_window_mdiclient from nonvisualobject
end type
type itemdata from structure within n_cst_window_mdiclient
end type
type sysbuttondata from structure within n_cst_window_mdiclient
end type
type timer from n_timer within n_cst_window_mdiclient
end type
type theme from n_cst_window_mdiclient_theme within n_cst_window_mdiclient
end type
end forward

type itemdata from structure
	boolean		enabled
	boolean		visible
	boolean		hidden
	boolean		selected
	boolean		mouseover
	string		text
	string		tiptext
	string		image
	integer		imageindex
	s_cst_window		window
	sizef		sztext
	rectf		rcimage
	rectf		rctext
	rectf		rcpaint
	unsignedlong		paintpath
	real		offsetposition
end type

type sysbuttondata from structure
	unsignedinteger		itemtype
	boolean		enabled
	boolean		visible
	boolean		hidden
	boolean		mouseover
	boolean		mousedown
	string		tiptext
	integer		imageindex
	rectf		rcimage
	rectf		rcpaint
end type

global type n_cst_window_mdiclient from nonvisualobject
event oninit ( unsignedlong hwnd,  s_cst_window parentwindow )
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
event type long onncmousehover ( unsignedlong hittestcode,  real xpos,  real ypos )
event type long onmousehover ( unsignedlong vkey,  real xpos,  real ypos )
event type long onmousewheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event onthemechanged ( unsignedinteger eventflag )
event type boolean ontimer ( unsignedinteger id )
event type long onncerasebkgnd ( unsignedlong hdc )
event type long onchildnotify ( unsignedlong hwndchild,  unsignedlong ncode )
event onchildcreate ( unsignedlong hwndchild )
event onchilddestroy ( unsignedlong hwndchild )
event type long onchildactivate ( unsignedlong hwnddeactivated,  unsignedlong hwndactivated )
event type long onpaint ( unsignedlong hdc )
event type long onerasebkgnd ( unsignedlong hdc )
event type long oncreatescrollbar ( unsignedlong lpsbci,  boolean bvert )
event type long ondrawscrollbar ( unsignedlong hdc,  unsignedlong lpsbdi,  boolean bvert,  long flags )
event type boolean onquerypropbool ( string prop )
event type long onclosequery ( )
event onclose ( )
event type long onmousehwheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event type long onrbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onkeydown ( unsignedinteger nchar,  unsignedinteger nrepcnt,  unsignedlong nflags )
timer timer
theme theme
end type
global n_cst_window_mdiclient n_cst_window_mdiclient

type prototypes
Private:
Function Ulong SendMessageMDIGetActive(ulong hWnd,ulong uMsg,ulong wparam,ref ulong lparam) Library "user32.dll" Alias for "SendMessageW"
end prototypes

type variables
//* Copyright (c) 2013 - 2017
//* 著作权由金千枝（深圳）软件技术有限公司所有。著作权人保留一切权利。
//* 
//* 这份授权条款，在满足下列条件的前提下，允许使用者再发布经过或未经过
//* 修改的、源代码或二进制形式的本软件：
//* 
//* 1. 源代码的再发布，必须保留原来代码中的版权声明、这几条许可条件细目
//*    和下面的免责声明。
//* 2. 二进制形式的再发布，必须在随同提供的文档和其它媒介中，复制原来的
//*    版权声明、这几条许可条件细目和下面的免责声明。
//* 3. 所有使用到本软件功能的产品及宣传材料，都必须包还含下列之交待文字：
//*        “本产品内含有由金千枝（深圳）软件技术有限公司及其软件贡献者所开发的软件。”
//* 4. 如果没有特殊的事前书面许可，原作者的组织名称，和贡献者名字，都不能
//*    用于支持或宣传从既有软件派生的产品。
//* 
//* 免责声明：此软件由金千枝（深圳）软件技术有限公司和贡献者以“即此”方式提供，无论明示或
//* 暗示的，包括但不限于间接的关于基于某种目的的适销性、实用性，在此皆明示
//* 不予保证。在任何情况下，由于使用此软件造成的，直接、间接、连带、特别、
//* 惩戒或因此而造成的损害（包括但不限于获得替代品及服务，无法使用，丢失数
//* 据，损失盈利或业务中断），无论此类损害是如何造成的，基于何种责任推断，
//* 是否属于合同范畴，严格赔偿责任或民事侵权行为（包括疏忽和其他原因），即
//* 使预先被告知此类损害可能发生，金千枝（深圳）软件技术有限公司和贡献者均不承担任何责任。
//================================================================

/*--- Properties ---*/
Public:
PrivateWrite Ulong				#Handle
PrivateWrite	 s_cst_window	#ParentWindow
PrivateWrite Boolean			#Transparent		= false
Boolean							#AutoScroll			= false 		//当鼠标进入ScrollBar时自动滚动
Boolean							#AllowTabDrag		= false		//开启使用鼠标拖拽Tab
Boolean							#SmoothScroll		= false 		//平滑滚动效果
Boolean							#SmoothDrag		= false		//平滑拖拽效果

/*--- Implementation ---*/
Private:
n_canvas					_Canvas
n_imagelist				_ImageList
n_imagelist				_ImageList_Button
n_tooltip					_ToolTip
ITEMDATA				Items[]
SYSBUTTONDATA		SysButtons[]
PAINTPANE				ScrollBarLeft
PAINTPANE				ScrollBarRight
RECTF 						rcWnd
RECTF						rcTabStrip

Boolean _sheetCreating
Boolean _sheetClosing

Boolean _showTabStripBar

Ulong _TTID	
Ulong	_outlinePen

Int		_mouseOverIndex 		= 0
Int		_mouseDownIndex	= 0
Int		_selectedIndex			= 0
Int		_firstIndex				= 0
Int		_lastIndex				= 0
Int		_draggingIndex			= 0
Ulong	_lastPopupTime		= 0
real	_ScrollPosition 			= 0
real	_StartPoint 				= 0
real	_EndPoint				= 0
real 	_LastScrollPosition	 	= 0
real	_smoothScrollSize		= 0
real	_sysButtonWidth 		= 0

POINTF _mouseDownPoint
POINTF _lastMousePoint

WindowState _ParentLastWindowState

Boolean _MouseLeaveTracked 	= false
Boolean _MouseCaptured 		= false

//Indexes
Constant Int IDX_SCROLLBARLEFT		= -1
Constant Int IDX_SCROLLBARRIGHT	= -2
//--System button indexes
Constant Int IDX_CLOSE			= 1
Constant Int IDX_RESTORE		= 2
Constant Int IDX_MINI			= 3
Constant Int IDX_SHEETLIST	= 4
//System Button types
Constant Uint SBT_CLOSE 			= 0
Constant Uint SBT_RESTORE		= 1
Constant Uint SBT_MINI 				= 2
Constant Uint SBT_SHEETLIST		= 3
//System button icon
Constant String ICO_CLOSE 		= "pfw://zip/images[btn_mdi_close.png]"
Constant String ICO_RESTORE 		= "pfw://zip/images[btn_mdi_restore.png]"
Constant String ICO_MINI 			= "pfw://zip/images[btn_mdi_mini.png]"
Constant String ICO_SHEETLIST	= "pfw://zip/images[btn_mdi_option.png]"
//System button tiptext
Constant String TIP_CLOSE 			= "关闭"
Constant String TIP_RESTORE 		= "还原"
Constant String TIP_MINI 			= "最小化"
Constant String TIP_SHEETLIST	=	 "窗口列表"
//Sheetlist popupmenu id
Constant Ulong MID_CASCADE		= 100
Constant Ulong MID_LAYER			= 101
Constant Ulong MID_VTILE			= 102
Constant Ulong MID_HTILE			= 103
Constant Ulong MID_ARRGICON	= 104
Constant Ulong MID_CLOSEALL		= 105
Constant Ulong MID_SHEETLIST	= 200
//Sheetlist popupmenu text
Constant String TXT_CASCADE		= "层叠排列"
Constant String TXT_LAYER 		= "平铺排列"
Constant String TXT_VTILE 			= "水平排列"
Constant String TXT_HTILE 			= "垂直排列"
Constant String TXT_ARRGICON	= "排列图标"
Constant String TXT_CLOSEALL	= "关闭所有窗口"
//Sheetlist popupmenu icon
Constant String ICO_CASCADE 		= "Cascade!"
Constant String ICO_LAYER 			= "Layer!"
Constant String ICO_VTILE 			= "Tile!"
Constant String ICO_HTILE 			= "Horizontal!"
Constant String ICO_ARRGICON	= "ArrangeIcons!"
Constant String ICO_CLOSEALL		= "Close!"
//Sheetlist popupmenu tiptext
Constant String TIP_CASCADE 	= "层叠排列"
Constant String TIP_LAYER 		= "平铺排列"
Constant String TIP_VTILE 		= "水平排列"
Constant String TIP_HTILE 		= "垂直排列"
Constant String TIP_ARRGICON	= "排列图标"
Constant String TIP_CLOSEALL	= "关闭所有窗口"
//Child notify codes
Constant Uint NCD_RESTORED					= 1
Constant Uint NCD_MAXIMIZED					= 2
Constant Uint NCD_MINIMIZED					= 3
Constant Uint NCD_TITLECHANGED			= 4
Constant Uint NCD_ICONCHANGED				= 5
Constant Uint NCD_SYSBUTTONCHANGED	= 6
//Hit-test code
Constant Uint HTTABSTRIP 				= 100
Constant Uint HTSCROLLBARLEFT		= 101
Constant Uint HTSCROLLBARRIGHT	= 102
Constant Uint HTSYSBUTTON			= 103
Constant Uint HTITEM						= 200
//Timer ID
Constant Uint TM_DRAG		= 1
Constant Uint TM_SCROLL	= 2
//Timer interval (ms)
Constant Uint TMI_DRAG		= 15
Constant Uint TMI_SCROLL	= 15
//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
Constant Uint ADJ_SYSBUTTON			= 4
//Sizes
Constant real SCROLLBARSIZE 	= 10 		//px
Constant real SYSBTNICONSIZE 	= 16 		//px
end variables

forward prototypes
public function long of_redraw (readonly boolean drawclient, readonly boolean fadeanimation)
public function long of_activatesheet (readonly integer index)
public function long of_getactivesheet (ref s_cst_window sheet)
public function boolean of_isactivesheetmaximized ()
public function long of_getsheet (readonly integer index, ref s_cst_window sheet)
public function integer of_getsheetcount ()
public function integer of_getsheetindex (readonly s_cst_window sheet)
public function long of_arrangesheets (readonly arrangetypes atype)
public function long of_closesheet (readonly integer index)
public function long of_closesheets ()
private subroutine _of_refreshsysbutton ()
public function long of_updatepoints ()
private subroutine _of_updatesysbuttonpoints ()
private function integer _of_insertitem (readonly integer index, readonly s_cst_window window)
private function integer _of_additem (readonly s_cst_window window)
private subroutine _of_updatetextsize (readonly integer index)
private subroutine _of_updatetextsize ()
private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation)
private subroutine _of_capturemouse (readonly boolean capture)
private subroutine _of_trackmousehover (readonly boolean track, readonly long hovertime)
private subroutine _of_trackncmousehover (readonly boolean track, readonly long hovertime)
private subroutine _of_trackncmouseleave (readonly boolean track)
public function int of_getsheets (ref s_cst_window sheets[])
private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly unsignedlong hdc)
private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly boolean fadeanimation)
private subroutine _of_drawsysbutton (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawsysbutton (readonly integer index, readonly boolean fadeanimation)
private subroutine _of_updatescrollbarpoints ()
private function boolean _of_adjustscrollposition ()
private subroutine _of_updatepoints ()
public function long of_scrollto (readonly integer index, readonly long flag)
public function long of_redraw (readonly boolean fadeanimation)
public function integer of_getsheetindex (readonly unsignedlong hwnd)
private subroutine _of_updatetabpoints ()
private subroutine _of_scrollleft ()
private subroutine _of_scrollright ()
private subroutine _of_showtip (readonly integer index)
public function long of_move (readonly integer srcindex, readonly integer dstindex)
public function boolean of_isdraggingmode ()
public function long of_select (readonly integer index)
public function long of_scrollto (readonly integer index)
public function integer of_opensheet (ref s_cst_window sheet, readonly string wndtype, readonly integer indexbefore, readonly arrangeopen aopentype)
public function integer of_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly string wndtype, readonly integer indexbefore, readonly arrangeopen aopentype)
private function unsignedlong _of_getactivesheet (ref boolean ismaximized)
private function ulong _of_getactivesheet ()
public function long of_closesheet (readonly s_cst_window sheet)
public function long of_settransparent (readonly boolean transparent, readonly boolean bredraw)
public function long of_settransparent (readonly boolean transparent)
public function long of_updateparentbkgnd (readonly boolean bredraw)
public function boolean of_istabstripbarvisible ()
public function unsignedlong of_getitemstate (readonly integer index)
private subroutine _of_adjustrect (ref rectf adjrect, unsignedlong flags)
private subroutine _of_scrollposition (real scrollsize)
private subroutine _of_offsetitemposition (readonly integer index, readonly real offsetsize)
private function integer _of_indexfrompoint (readonly real xpos, readonly real ypos, ref boolean issysbutton)
private function unsignedlong _of_popupsheetlist (real xpos, real ypos)
end prototypes

event oninit(unsignedlong hwnd, s_cst_window parentwindow);#Handle = hWnd
#ParentWindow = parentWindow

Painter.CreatePen(0,1,2,ref _outlinePen)

_ToolTip.CreateToolTip(#Handle)
_TTID = _ToolTip.AddTool(#Handle,false,Win32.TTF_TRANSPARENT + Win32.TTF_TRACK + Win32.TTF_ABSOLUTE)

/*--- Init system buttons ---*/
//Add close button
SysButtons[IDX_CLOSE].ItemType			= SBT_CLOSE
SysButtons[IDX_CLOSE].Enabled			= true
SysButtons[IDX_CLOSE].ImageIndex		= _ImageList_Button.AddImage(ICO_CLOSE)
SysButtons[IDX_CLOSE].TipText			= I18N(Enums.I18N_CAT_WINDOW,TIP_CLOSE)
//Add max button
SysButtons[IDX_RESTORE].ItemType		= SBT_RESTORE
SysButtons[IDX_RESTORE].Enabled		= true
SysButtons[IDX_RESTORE].ImageIndex	= _ImageList_Button.AddImage(ICO_RESTORE)
SysButtons[IDX_RESTORE].TipText		= I18N(Enums.I18N_CAT_WINDOW,TIP_RESTORE)
//Add min button
SysButtons[IDX_MINI].ItemType			= SBT_MINI
SysButtons[IDX_MINI].Enabled				= true
SysButtons[IDX_MINI].ImageIndex			= _ImageList_Button.AddImage(ICO_MINI)
SysButtons[IDX_MINI].TipText				= I18N(Enums.I18N_CAT_WINDOW,TIP_MINI)
//Add window list button
SysButtons[IDX_SHEETLIST].ItemType	= SBT_SHEETLIST
SysButtons[IDX_SHEETLIST].Enabled		= true
SysButtons[IDX_SHEETLIST].ImageIndex= _ImageList_Button.AddImage(ICO_SHEETLIST)
SysButtons[IDX_SHEETLIST].TipText		= I18N(Enums.I18N_CAT_WINDOW,TIP_SHEETLIST)
/*-------------------------------*/

_Canvas.Attach(this,#Handle)
end event

event type long onncpaint(unsignedlong hdc);int index,nCount,nSelectedIndex
RECTF tabStripRect

Event OnNcEraseBkgnd(hdc)

if Not _showTabStripBar then return 1

if ScrollBarLeft.visible then
	_of_DrawScrollBar(ScrollBarLeft,hdc)
	Painter.ExcludeClipRect(hdc,ScrollBarLeft.rcPaint)
end if
if ScrollBarRight.visible then
	_of_DrawScrollBar(ScrollBarRight,hdc)
	Painter.ExcludeClipRect(hdc,ScrollBarRight.rcPaint)
end if

nCount = UpperBound(SysButtons)
for index = 1 to nCount
	if Not SysButtons[index].visible or SysButtons[index].Hidden then continue
	_of_DrawSysButton(index,hdc)
next

tabStripRect = rcTabStrip
_of_AdjustRect(ref tabStripRect,ADJ_BORDER + ADJ_SYSBUTTON)

Painter.IntersectClipRect(hdc,tabStripRect)

nCount = UpperBound(Items)
for index = 1 to nCount
	if Not Items[index].visible or Items[index].Hidden or Items[index].PaintPath = 0 then continue
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
	if _mouseDownIndex < 0 then
		SysButtons[-_mouseDownIndex].MouseDown = false
		_of_DrawSysButton(-_mouseDownIndex,true)
	end if
	_mouseDownIndex = 0
	if _draggingIndex > 0 then				//Dragging mode
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

event onncmouseleave();if Not _MouseCaptured then
	if _mouseOverIndex > 0 then
		Items[_mouseOverIndex].mouseover=false
		_of_DrawItem(_mouseOverIndex,true)
		_of_ShowTip(0)
	elseif _mouseOverIndex < 0 then
		SysButtons[-_mouseOverIndex].mouseover=false
		_of_DrawSysButton(-_mouseOverIndex,true)
		_of_ShowTip(0)
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
end if

_of_ShowTip(0)

_of_TrackNcMouseLeave(false)
end event

event type long onwindowsizing(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);rcWnd.right = newWidth
rcWnd.bottom = newHeight
rcTabStrip = rcWnd
rcTabStrip.Bottom =  theme.#TabStripSize

_showTabStripBar = of_IsActiveSheetMaximized()
if _showTabStripBar then
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
	of_ScrollTo(_selectedIndex,Enums.SF_FORWARD)
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
	if Painter.PtInRect(rcTabStrip,xpos,ypos) or vKey = 0 then
		if ScrollBarLeft.Visible and vKey = WinMsg.MK_LBUTTON then
			if Painter.PtInRect(ScrollBarLeft.rcPaint,xpos,ypos) then
				_of_TrackMouseHover(true,100)
				return 0
			end if
		end if
		if ScrollBarRight.Visible and vKey = WinMsg.MK_LBUTTON then
			if Painter.PtInRect(ScrollBarRight.rcPaint,xpos,ypos) then
				_of_TrackMouseHover(true,100)
				return 0
			end if
		end if
		if vKey = 0 then
			_smoothScrollSize = 0
			Timer.Stop(TM_SCROLL)
		end if
		
		adjustedRect = rcTabStrip
		_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_SYSBUTTON)
		
		Painter.CopyRect(ref origRect,ref Items[_draggingIndex].rcPaint)
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
			if xpos > _lastMousePoint.x then			//Right dragging
				for index = UpperBound(Items) to _draggingIndex + 1 step -1
					if Not Items[index].Visible then continue
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
	
elseif ScrollBarLeft.MouseDown or ScrollBarRight.MouseDown or _mouseDownIndex <> 0 then
	
	hitTestCode = Event OnNcHitTest(xpos,ypos)
		
	if IsNull(hitTestCode) then
		hitTestCode = 0
	end if
	
	Event OnNcMouseMove(hitTestCode,xpos,ypos)
end if
return 0
end event

event type long onncmousemove(unsignedlong hittestcode, real xpos, real ypos);int index
POINT pt

if of_IsDraggingMode() then return 1

if Not _MouseLeaveTracked and Not _MouseCaptured then
	_of_TrackNcMouseLeave(true)
end if

if #AllowTabDrag and _mouseDownIndex > 0	and KeyDown(KeyLeftButton!)  and Not KeyDown(KeyRightButton!) then
	if Abs(xpos - _mouseDownPoint.x) > 4 or Abs(ypos - _mouseDownPoint.y) > 4 then
		_draggingIndex = _mouseDownIndex
		_lastMousePoint.x = xpos
		_lastMousePoint.y = ypos
		_of_CaptureMouse(true)
		return 1
	end if
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

if hitTestCode > HTITEM then
	index = hitTestCode - HTITEM
	if _mouseOverIndex <> index then
		if _mouseOverIndex > 0 then
			Items[_mouseOverIndex].mouseover=false
			_of_DrawItem(_mouseOverIndex,true)
			_of_ShowTip(0)
		elseif _mouseOverIndex < 0 then
			SysButtons[-_mouseOverIndex].mouseover=false
			_of_DrawSysButton(-_mouseOverIndex,true)
			_of_ShowTip(0)
		end if
		_mouseOverIndex = index
		if index > 0 then
			Items[index].mouseover=true
			_of_DrawItem(index,true)
			_of_ShowTip(_mouseOverIndex)
		end if
	end if
elseif hitTestCode > HTSYSBUTTON and hitTestCode < HTITEM then
	index = hitTestCode - HTSYSBUTTON
	if _mouseOverIndex <> -index then
		if _mouseOverIndex > 0 then
			Items[_mouseOverIndex].mouseover=false
			_of_DrawItem(_mouseOverIndex,true)
			_of_ShowTip(0)
		elseif _mouseOverIndex < 0 then
			SysButtons[-_mouseOverIndex].mouseover=false
			_of_DrawSysButton(-_mouseOverIndex,true)
			_of_ShowTip(0)
		end if
		_mouseOverIndex = -index
		if index > 0 then
			SysButtons[index].mouseover=true
			_of_DrawSysButton(index,true)
			_of_ShowTip(_mouseOverIndex)
		end if
	end if
else
	if _mouseOverIndex > 0 then
		Items[_mouseOverIndex].mouseover=false
		_of_DrawItem(_mouseOverIndex,true)
		_of_ShowTip(0)
	elseif _mouseOverIndex < 0 then
		SysButtons[-_mouseOverIndex].mouseover=false
		_of_DrawSysButton(-_mouseOverIndex,true)
		_of_ShowTip(0)
	end if
	_mouseOverIndex = 0
end if

return 1
end event

event type long onnccalcsize(unsignedlong lpcrect);int offsetSize
RECTF cRect

Painter.CopyRect(ref cRect,lpcRect)

if theme.#BorderStyle <> Enums.BS_NONE then
	Painter.InflateRect(ref cRect,-1,-1)
	offsetSize = 1
end if

if _showTabStripBar then
	cRect.top += theme.#TabStripSize - offsetSize
end if

Painter.CopyRect(lpcRect,ref cRect)

return 0
end event

event type long onnclbuttondblclk(unsignedlong hittestcode, real xpos, real ypos);return Event OnNcLButtonDown(hitTestCode,xpos,ypos)
end event

event type long onnclbuttondown(unsignedlong hittestcode, real xpos, real ypos);if Not _MouseLeaveTracked or Timer.IsRunning(TM_SCROLL)  or Timer.IsRunning(TM_DRAG) then
	Event	OnNcMouseMove(hittestcode,xpos,ypos)
end if

_mouseDownIndex = 0

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

if _mouseOverIndex > 0 then
	_mouseDownIndex = _mouseOverIndex
	_mouseDownPoint.x = xpos
	_mouseDownPoint.y = ypos
	_mouseDownPoint.x -= Items[_mouseDownIndex].OffsetPosition
	_of_ShowTip(0)
	of_Select(_mouseOverIndex)
elseif _mouseOverIndex < 0 then
	if _mouseOverIndex = -IDX_SHEETLIST then
		ulong pmCode
		if Cpu() - _lastPopupTime < 100 then
			return 0
		end if
		SysButtons[IDX_SHEETLIST].MouseDown = true
		_of_DrawSysButton(IDX_SHEETLIST,false)
		pmCode = _of_PopupSheetList(xpos,ypos)
		SysButtons[IDX_SHEETLIST].MouseDown = false
		_of_DrawSysButton(IDX_SHEETLIST,true)
		
		if pmCode > 0 then
			choose case pmCode
				case MID_CASCADE
					of_ArrangeSheets(Cascade!)
				case MID_LAYER
					of_ArrangeSheets(Layer!)
				case MID_VTILE
					of_ArrangeSheets(Tile!)
				case MID_HTILE
					of_ArrangeSheets(TileHorizontal!)
				case MID_ARRGICON
					of_ArrangeSheets(Icons!)
				case MID_CLOSEALL
					Post of_CloseSheets()
				case else
					of_Select(pmCode - MID_SHEETLIST)
			end choose
		end if
	else
		_mouseDownIndex = _mouseOverIndex
		SysButtons[-_mouseOverIndex].MouseDown = true
		_of_DrawSysButton(-_mouseOverIndex,false)
		_of_ShowTip(0)
		_of_CaptureMouse(true)
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
	
	if Painter.PtInRect(rcTabStrip,xpos,ypos) then
		if ScrollBarLeft.Visible or ScrollBarRight.Visible then
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

if ScrollBarLeft.MouseDown then
	ScrollBarLeft.MouseDown = false
	_of_DrawScrollBar(ScrollBarLeft,true)
end if

if ScrollBarRight.MouseDown then
	ScrollBarRight.MouseDown = false
	_of_DrawScrollBar(ScrollBarRight,true)
end if

if _mouseDownIndex > 0 then
	if _draggingIndex > 0 then				//Dragging mode
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
	end if
elseif _mouseDownIndex < 0 then
	SysButtons[-_mouseDownIndex].MouseDown = false
	_of_DrawSysButton(-_mouseDownIndex,true)
	if SysButtons[-_mouseDownIndex].MouseOver and _selectedIndex > 0 then
		choose case -_mouseDownIndex
			case IDX_CLOSE
				of_CloseSheet(_selectedIndex)
			case IDX_RESTORE
				Items[_selectedIndex].Window.wf_SetWindowStateAsync(Normal!)
			case IDX_MINI
				Items[_selectedIndex].Window.wf_SetWindowStateAsync(Minimized!)
		end choose
	end if
end if
_mouseDownIndex = 0
	
return 0
end event

event type long onnchittest(real xpos, real ypos);int index
boolean bIsSysButton

index = _of_IndexFromPoint(xpos,ypos,ref bIsSysButton)

choose case index
	case IDX_SCROLLBARLEFT
		return HTSCROLLBARLEFT
	case IDX_SCROLLBARRIGHT
		return HTSCROLLBARRIGHT
	case else
		if bIsSysButton then
			return HTSYSBUTTON + index
		elseif index > 0 then
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

event type long onmousehover(unsignedlong vkey, real xpos, real ypos);boolean trackMouseHover = false
RECTF wndRect
POINTF pt

if Not _MouseCaptured then return 0

Painter.GetWindowRect(#Handle,ref wndRect)
Painter.GetCursorPos(ref pt)
xpos = pt.x - wndRect.left
ypos = pt.y - wndRect.top

if ScrollBarLeft.visible and Painter.PtInRect(ScrollBarLeft.rcPaint,xpos,ypos) and &
	(#AutoScroll or ScrollBarLeft.MouseDown or (of_IsDraggingMode() and vkey = WinMsg.MK_LBUTTON)) then
	_of_ScrollLeft()
	trackMouseHover = true
end if

if ScrollBarRight.visible and Painter.PtInRect(ScrollBarRight.rcPaint,xpos,ypos) and &
	(#AutoScroll or ScrollBarRight.MouseDown or (of_IsDraggingMode() and vkey = WinMsg.MK_LBUTTON)) then
	_of_ScrollRight()
	trackMouseHover = true
end if

if #SmoothScroll then
	_of_TrackMouseHover(trackMouseHover,100)
else
	_of_TrackMouseHover(trackMouseHover,200)
end if

return 0
end event

event type long onmousewheel(unsignedlong vkey, long zdelta, real xpos, real ypos);int i,steps

if Not Painter.PtInRect(rcTabStrip,xpos,ypos) then return 0

steps = Abs(zdelta)/WinMsg.WHEEL_DELTA

if (zdelta > 0 and ScrollBarLeft.visible)  then
	for i = 1 to steps
		_of_ScrollLeft()
	next
elseif (zdelta < 0 and ScrollBarRight.visible) then
	for i = 1 to steps
		_of_ScrollRight()
	next
end if

return 1
end event

event type boolean ontimer(unsignedinteger id);int index
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
	
	if _smoothScrollSize = 0 or (Not ScrollBarLeft.Visible and Not ScrollBarRight.Visible) then
		_smoothScrollSize = 0
		return false
	end if
	
	if _smoothScrollSize > 0 and ScrollBarLeft.Visible then
		scrollSize = _smoothScrollSize / 10 + 2
		if _smoothScrollSize - scrollSize < 0 then
			scrollSize = _smoothScrollSize
		end if
		_smoothScrollSize -= scrollSize
	end if
	
	if _smoothScrollSize < 0 and ScrollBarRight.Visible then
		scrollSize =_smoothScrollSize / 10 - 2
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
		_smoothScrollSize = 0
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
end if

return false
end event

event type long onncerasebkgnd(unsignedlong hdc);ulong borderColor,bkColor,transparentColor
RECTF cliRect

borderColor = theme.of_GetColor(theme.CLR_BORDER,0)

if _showTabStripBar then
	bkColor	= theme.of_GetColor(theme.CLR_TABSTRIPBKGND,0)
	
	transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,0)
	//填充透明色
	if transparentColor <> 0 then
		Painter.of_FillRect( hdc, rcTabStrip,  transparentColor,false,0) 
	end if
	
	Painter.ThemeFill(hdc,rcTabStrip,bkColor,theme.#BkgndOrientation,theme.#BkgndStyle,0,false,theme.#TabStripBorderStyle,borderColor,0)
	
	if theme.#TabStripBorderStyle = Enums.BS_NONE then
		Painter.DrawLine(hdc,&
					rcTabStrip.left,&
					rcTabStrip.bottom - 1,&
					rcTabStrip.right,&
					rcTabStrip.bottom - 1,&
					borderColor,Enums.LS_SOLID,&
					false,1)
	end if
	
	if theme.#BorderStyle <> Enums.BS_NONE then
		cliRect = rcWnd
		cliRect.top = rcTabStrip.bottom - 1
		Painter.DrawThemeBorder(hdc,cliRect,borderColor,theme.#BkgndStyle,theme.#BorderStyle,0)
	end if
else
	bkColor = Painter.GetPBColorA(#ParentWindow.BackColor)
	Painter.ThemeFill(hdc,rcWnd,bkColor,theme.#BkgndOrientation,theme.#BkgndStyle,0,false,theme.#BorderStyle,borderColor,0)
end if

#ParentWindow.Event OnMDIClientNcEraseBkgnd(hdc)

return 1
end event

event type long onchildnotify(unsignedlong hwndchild, unsignedlong ncode);int index
s_cst_window lw_Active

if _sheetCreating then return 0

index = of_GetSheetIndex(hWndChild)
if index = 0 then return 0

choose case nCode
	case NCD_RESTORED,NCD_MAXIMIZED,NCD_MINIMIZED
		if Items[index].Selected then
			_of_RefreshSysButton()
			_Canvas.UpdateFrame()
			of_ScrollTo(_selectedIndex)
		end if
	case NCD_TITLECHANGED
		Items[index].Text = Items[index].Window.Title
		Items[index].TipText = Items[index].Window.Title
		_of_UpdateTextSize(index)
		of_UpdatePoints()
	case NCD_SYSBUTTONCHANGED
		if Items[index].Selected and Win32.IsZoomed(hWndChild) then
			_of_RefreshSysButton()
			of_UpdatePoints()
		end if
end choose

return 0
end event

event onchilddestroy(unsignedlong hwndchild);int index,nCount
ulong hWndActive
boolean bActiveMaximized
ITEMDATA newItems[]
//(hWndChild = 0)来自of_CloseSheets

if _sheetClosing then return

nCount = UpperBound(Items)
for index = 1 to nCount
	if IsValidObject(Items[index].Window) then
		if Items[index].Window.#Handle <> hWndChild then
			newItems[UpperBound(newItems)+1] = Items[index]
		else
			Painter.DeletePath(Items[index].PaintPath)
		end if
	else
		Painter.DeletePath(Items[index].PaintPath)
	end if
next

Items = newItems

hWndActive = _of_GetActiveSheet(ref bActiveMaximized)
_selectedIndex = 0
nCount = UpperBound(Items)
for index = 1 to nCount
	if Items[index].Window.#Handle = hWndActive then
		Items[index].Selected = true
		_selectedIndex = index
	else
		Items[index].Selected = false
	end if
next

#ParentWindow.Event OnMDIChildDestroy(hWndChild)

_of_RefreshSysButton()
if _showTabStripBar <> bActiveMaximized then
	_Canvas.UpdateFrame()
else
	of_UpdatePoints()
end if
end event

event type long onchildactivate(unsignedlong hwnddeactivated, unsignedlong hwndactivated);int index

if _sheetCreating or _sheetClosing then return 0

index = of_GetSheetIndex(hWndActivated)
if index = 0 then return 0
if index <> _selectedIndex then
	if _selectedIndex > 0 then
		Items[_selectedIndex].selected=false
	end if
	_selectedIndex = index
	Items[_selectedIndex].selected = true
end if

#ParentWindow.Event OnMDIChildActivate(hWndDeactivated,hWndActivated)

_of_RefreshSysButton()
if _showTabStripBar <> of_IsActiveSheetMaximized() then
	_Canvas.UpdateFrame()
else
	of_UpdatePoints()
end if

return 0
end event

event type long onpaint(unsignedlong hdc);return Event OnEraseBkgnd(hdc)
end event

event type long onerasebkgnd(unsignedlong hdc);RECTF rcClient

Painter.GetClientRect(#Handle,ref rcClient)

Painter.of_FillRect( hdc, rcClient, theme.of_GetColor(theme.CLR_BKGND,0),false,0)

#ParentWindow.Event OnMDIClientEraseBkgnd(hdc)
return 1
end event

event type long oncreatescrollbar(unsignedlong lpsbci, boolean bvert);SCROLLBARCREATEINFO sbCreateInfo

Win32.CopyScrollBarCreateInfo(ref sbCreateInfo,lpsbci,Win32.SIZEOF_SCROLLBARCREATEINFO)

sbCreateInfo.fBarSize = theme.#ScrollBarSize
sbCreateInfo.fArrowSize = theme.#ScrollBarArrowSize
sbCreateInfo.rcBorderMargin = theme.#ScrollBarBorderMargin

Win32.CopyScrollBarCreateInfo(lpsbci,ref sbCreateInfo,Win32.SIZEOF_SCROLLBARCREATEINFO)

return 1
end event

event type long ondrawscrollbar(unsignedlong hdc, unsignedlong lpsbdi, boolean bvert, long flags);SCROLLBARDRAWINFO sbDrawInfo

Win32.CopyScrollBarDrawInfo(ref sbDrawInfo,lpsbdi,Win32.SIZEOF_SCROLLBARDRAWINFO)

Painter.of_FillRect( hdc, sbDrawInfo.rcPaint, theme.of_GetColor(theme.CLR_BKGND,0),false,0)

Painter.of_DrawScrollBar(hdc,sbDrawInfo,bVert,flags,theme,theme.#ScrollBarBorderStyle,theme.#ScrollBarRoundSize)

return 1
end event

event type boolean onquerypropbool(string prop);choose case prop
	case "hscrollbar"
		return #ParentWindow.HScrollBar
	case "vscrollbar"
		return #ParentWindow.VScrollBar
	case "fadeanimation"
		return #ParentWindow.#FadeAnimation
end choose
return false
end event

event type long onclosequery();int nIndex,nCount

nCount = UpperBound(Items)
for nIndex = 1 to nCount
	if IsValidObject(Items[nIndex].Window) then
		if Items[nIndex].Window.Event CloseQuery() = 1 then return 1
	end if
next

return 0
end event

event onclose();int nIndex,nCount

nCount = UpperBound(Items)
for nIndex = 1 to nCount
	if IsValidObject(Items[nIndex].Window) then
		Items[nIndex].Window.Event OnClose()
	end if
next
end event

event type long onmousehwheel(unsignedlong vkey, long zdelta, real xpos, real ypos);int i,steps

if Not Painter.PtInRect(rcTabStrip,xpos,ypos) then return 0

steps = Abs(zdelta)/WinMsg.WHEEL_DELTA

if (zdelta < 0 and ScrollBarLeft.visible)  then
	for i = 1 to steps
		_of_ScrollLeft()
	next
elseif (zdelta > 0 and ScrollBarRight.visible) then
	for i = 1 to steps
		_of_ScrollRight()
	next
end if

return 1
end event

event type long onrbuttondown(unsignedlong vkey, real xpos, real ypos);if of_IsDraggingMode() then
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

event type long onkeydown(unsignedinteger nchar, unsignedinteger nrepcnt, unsignedlong nflags);if KeyDown(KeyEscape!) and of_IsDraggingMode() then
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

public function long of_redraw (readonly boolean drawclient, readonly boolean fadeanimation);ulong safeDC

safeDC=_Canvas.GetSafeNcDC()

if #Transparent then
	_Canvas.FillParentBkgnd(safeDC)
end if

Event OnNcPaint(safeDC)

if FadeAnimation then
	_Canvas.ReleaseDC(safeDC,0,#ParentWindow.#FadeTime)
else
	_Canvas.ReleaseDC(safeDC,0)
end if

if DrawClient then
	safeDC=_Canvas.GetSafeDC()
	
	Event OnPaint(safeDC)
	
	if FadeAnimation then
		_Canvas.ReleaseDC(safeDC,0,#ParentWindow.#FadeTime)
	else
		_Canvas.ReleaseDC(safeDC,0)
	end if
end if

return RetCode.OK
end function

public function long of_activatesheet (readonly integer index);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
return of_Select(index)
end function

public function long of_getactivesheet (ref s_cst_window sheet);if _selectedIndex = 0 then return RetCode.FAILED
if Not IsValidObject(Items[_selectedIndex].Window) then return RetCode.E_INVALID_OBJECT

try
	sheet = Items[_selectedIndex].Window
catch(Throwable ex)
	return RetCode.E_INVALID_OBJECT
end try

return iif(IsValidObject(sheet),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function boolean of_isactivesheetmaximized ();ulong hWnd
boolean bIsMaximized

hWnd = _of_GetActiveSheet(ref bIsMaximized)
return bIsMaximized
end function

public function long of_getsheet (readonly integer index, ref s_cst_window sheet);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

try
	sheet = Items[index].Window
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(sheet),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function integer of_getsheetcount ();return UpperBound(Items)
end function

public function integer of_getsheetindex (readonly s_cst_window sheet);if Not IsValidObject(sheet) then return RetCode.E_INVALID_OBJECT
return of_GetSheetIndex(sheet.#Handle)
end function

public function long of_arrangesheets (readonly arrangetypes atype);Win32.SetRedraw(#Handle,false)
choose case aType
	case Cascade!
		Send(#Handle,WinMsg.WM_MDICASCADE,0,0)
	case Layer!
		#ParentWindow.ArrangeSheets(Layer!)
	case Tile!
		Send(#Handle,WinMsg.WM_MDITILE,0,0)
	case TileHorizontal!
		Send(#Handle,WinMsg.WM_MDITILE,1,0)
	case Icons!
		Send(#Handle,WinMsg.WM_MDIICONARRANGE,0,0)
end choose
Win32.SetRedraw(#Handle,true)

return RetCode.OK
end function

public function long of_closesheet (readonly integer index);ulong hWnd,hWndActive

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

hWnd = Items[index].Window.#Handle

Win32.SetRedraw(#Handle,false)
_sheetClosing = true
Close(Items[index].Window)
_sheetClosing = false
if Not IsValidObject(Items[index].Window) then
	hWndActive = _of_GetActiveSheet()
	if hWndActive <> 0 then
		Event OnChildActivate(hWnd,hWndActive)
	end if
	Event OnChildDestroy(hWnd)
end if
Win32.SetRedraw(#Handle,true)

return RetCode.OK
end function

public function long of_closesheets ();int index,nCount,hWndActive
boolean bLockUpdate

nCount = UpperBound(Items)
if nCount = 0 then return RetCode.OK

Win32.SetRedraw(#Handle,false)
bLockUpdate = #ParentWindow.#LockUpdate
#ParentWindow.#LockUpdate = true
_sheetClosing = true
for index = 1 to nCount
	if Not IsValidObject(Items[index].Window) then continue
	if Close(Items[index].Window) = -1 then exit
next
_sheetClosing = false
#ParentWindow.#LockUpdate = bLockUpdate
hWndActive = _of_GetActiveSheet()
if hWndActive <> 0 then
	Event OnChildActivate(0,hWndActive)
end if
Event OnChildDestroy(0)
Win32.SetRedraw(#Handle,true)

return RetCode.OK
end function

private subroutine _of_refreshsysbutton ();s_cst_window lw_Active

if of_IsActiveSheetMaximized() then
	lw_Active = Items[_selectedIndex].Window
	SysButtons[IDX_CLOSE].Visible			= lw_Active.CaptionBar.of_IsVisible(lw_Active.CaptionBar.IDX_CLOSE)
	SysButtons[IDX_CLOSE].Enabled		= lw_Active.CaptionBar.of_IsEnabled(lw_Active.CaptionBar.IDX_CLOSE)
	SysButtons[IDX_RESTORE].Visible		= lw_Active.CaptionBar.of_IsVisible(lw_Active.CaptionBar.IDX_MAX)
	SysButtons[IDX_RESTORE].Enabled	= lw_Active.CaptionBar.of_IsEnabled(lw_Active.CaptionBar.IDX_MAX)
	SysButtons[IDX_MINI].Visible			= lw_Active.CaptionBar.of_IsVisible(lw_Active.CaptionBar.IDX_MINI)
	SysButtons[IDX_MINI].Enabled			= lw_Active.CaptionBar.of_IsEnabled(lw_Active.CaptionBar.IDX_MINI)
	SysButtons[IDX_SHEETLIST].Visible 	= theme.#SheetListButton
else
	SysButtons[IDX_CLOSE].Visible 		= false
	SysButtons[IDX_RESTORE].Visible 	= false
	SysButtons[IDX_MINI].Visible 			= false
	SysButtons[IDX_SHEETLIST].Visible 	= false
end if
end subroutine

public function long of_updatepoints ();if Not _showTabStripBar then return RetCode.OK

_of_UpdatePoints()
of_Redraw(false)

return RetCode.OK
end function

private subroutine _of_updatesysbuttonpoints ();int index
real ll_right
boolean bSomeHidden
RECTF paintRect
Constant real ITEMMARGIN = 1

paintRect = rcTabStrip
_of_AdjustRect(ref paintRect,ADJ_BORDER)

ll_right	= paintRect.right
_sysButtonWidth = 0

for index = 1 to UpperBound(SysButtons)
	if Not SysButtons[index].visible then continue
	if bSomeHidden then
		SysButtons[index].Hidden = true
		continue
	end if
	
	//Set rcImage
	SysButtons[index].rcImage.left 		= ll_right - 2 - SYSBTNICONSIZE
	SysButtons[index].rcImage.right 	= SysButtons[index].rcImage.left + SYSBTNICONSIZE
	SysButtons[index].rcImage.top 		= paintRect.top + (paintRect.bottom - paintRect.top - SYSBTNICONSIZE) / 2
	SysButtons[index].rcImage.bottom = SysButtons[index].rcImage.top + SYSBTNICONSIZE
	//Set rcPaint
	SysButtons[index].rcPaint.left 		= SysButtons[index].rcImage.left - 2
	SysButtons[index].rcPaint.right 		= SysButtons[index].rcImage.right + 2
	SysButtons[index].rcPaint.top 		= SysButtons[index].rcImage.top - 2
	SysButtons[index].rcPaint.bottom	= SysButtons[index].rcImage.bottom + 2
	
	if SysButtons[index].rcPaint.left - paintRect.left < SCROLLBARSIZE * 2 then
		SysButtons[index].Hidden = true
		bSomeHidden = true
	else
		SysButtons[index].Hidden = false
	end if
	
	if Not SysButtons[index].Hidden then
		_sysButtonWidth = paintRect.right - SysButtons[index].rcPaint.left
		ll_right = SysButtons[index].rcPaint.left - ITEMMARGIN
	end if
next
end subroutine

private function integer _of_insertitem (readonly integer index, readonly s_cst_window window);int i
ITEMDATA newItem

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE
if Not IsValidObject(window) then return RetCode.E_INVALID_OBJECT

newItem.Enabled = true
newItem.Visible = window.visible
newItem.Window = window
newItem.Text = window.Title
newItem.TipText = window.Title
newItem.Image = window.Icon
newItem.ImageIndex = _ImageList.AddImage(window.Icon)
Painter.CreatePath(1,ref newItem.PaintPath)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

_of_UpdateTextSize(index)

if index <= _selectedIndex then
	_selectedIndex += 1
end if

of_UpdatePoints()

return index
end function

private function integer _of_additem (readonly s_cst_window window);return _of_InsertItem(UpperBound(Items) + 1,window)
end function

private subroutine _of_updatetextsize (readonly integer index);ulong dtparam
n_cst_font ln_calcFont
RECTF	clientRect
RECTF	calcRect

if index < 1 or index > UpperBound(Items) then return
if Len(Items[index].text) = 0 then
	Items[index].szText.cx = 0
	Items[index].szText.cy = 0
	return
end if

dtparam = Painter.DT_EXPANDTABS + Painter.DT_SINGLELINE

if theme.SelectedFont.#WordSize.cx >= theme.Font.#WordSize.cx then
	ln_calcFont = theme.SelectedFont
else
	ln_calcFont = theme.Font
end if

calcRect.right = rcTabStrip.right - rcTabStrip.left - 4
Painter.of_CalcTextSize(ln_calcFont,Items[index].Text,dtparam,ref calcRect)
Items[index].szText.cx = calcRect.right
Items[index].szText.cy = calcRect.bottom

if Items[index].ImageIndex > 0 and (theme.#IconPosition = Enums.TOP or theme.#IconPosition = Enums.BOTTOM) then
	if Items[index].szText.cy > theme.#TabStripSize - theme.#BorderMargin.top - theme.#IconSize.cy - 2 - 4 then
		Items[index].szText.cy = theme.#TabStripSize - theme.#BorderMargin.top - theme.#IconSize.cy - 2 - 4
	end if
else
	if Items[index].szText.cy > theme.#TabStripSize - theme.#BorderMargin.top - 4 then
		Items[index].szText.cy = theme.#TabStripSize - theme.#BorderMargin.top - 4
	end if
end if

if Items[index].szText.cx < 0 or Items[index].szText.cy < 0 then
	Items[index].szText.cx = 0
	Items[index].szText.cy = 0
end if
end subroutine

private subroutine _of_updatetextsize ();int index

for index = UpperBound(Items) to 1 step -1
	_of_UpdateTextSize(index)
next
end subroutine

private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc);long dcState
ulong borderColor,bkColor,bkColor2,nState

if Not Items[index].Visible or Items[index].Hidden or Items[index].PaintPath = 0 then return

nState = of_GetItemState(index)
bkColor = theme.of_GetItemColor(index,theme.CLR_BKGND,nState)
borderColor	= theme.of_GetItemColor(index,theme.CLR_BORDER,nState)

/* Fill background and draw border */
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
elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_HIGHLIGHTED) <> 0 or theme.#TabStyle <> theme.TBS_RIBBON then
	if theme.#ItemBkgndStyle = Enums.XP or theme.#ItemBkgndStyle = Enums.VISTAORIGINAL then
		Painter.ThemeFill(hdc,Items[index].PaintPath,bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,true,&
							true,borderColor)
	else
		Painter.ThemeFill(hdc,Items[index].PaintPath,bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
							true,borderColor)
	end if
end if

/* Draw text and image*/
if Items[index].imageIndex > 0 then
	_ImageList.Draw(Items[index].imageindex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].Enabled)
end if

if Items[index].szText.cx>0 then
	_of_DrawItemText(index,hdc)
end if
end subroutine

private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc);ulong textColor
ulong dtparam

textColor	= theme.of_GetItemColor(index,theme.CLR_TEXT,of_GetItemState(index))

dtparam = Painter.DT_EXPANDTABS + Painter.DT_SINGLELINE + Painter.DT_VCENTER + Painter.DT_WORD_ELLIPSIS
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

private subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation);ulong safeDC
RECTF adjustedRect

if Not Items[index].visible then return
if Items[index].hidden then return

safeDC=_Canvas.GetSafeNcDC()

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_SYSBUTTON)

Painter.IntersectClipRect(safeDC,adjustedRect)
Painter.IntersectClipRect(safeDC,Items[index].rcPaint)

if ScrollBarLeft.Visible then
	Painter.ExcludeClipRect(safeDC,ScrollBarLeft.rcPaint)
end if
if ScrollBarRight.Visible then
	Painter.ExcludeClipRect(safeDC,ScrollBarRight.rcPaint)
end if

if #Transparent then
	_Canvas.FillParentBkgnd(safeDC)
end if

Event OnNcEraseBkgnd(safeDC)

int i,beginIndex,endIndex,nSelectedIndex
beginIndex = index
endIndex = index
if theme.#TabStyle = theme.TBS_OFFICE then
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

hUpdateRgn = Painter.CreateRectRgn(Items[index].rcPaint)

if FadeAnimation then
	_Canvas.ReleaseDC(safeDC,hUpdateRgn,#ParentWindow.#FadeTime)
else
	_Canvas.ReleaseDC(safeDC,hUpdateRgn)
end if

Painter.DeleteRgn(hUpdateRgn)

end subroutine

private subroutine _of_capturemouse (readonly boolean capture);if _MouseCaptured = capture then return

_MouseCaptured = capture

if capture then
	Win32.SetCapture(#Handle)
else
	Win32.ReleaseCapture()
end if
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

public function int of_getsheets (ref s_cst_window sheets[]);int index,nCount

nCount = UpperBound(Items)
for index = 1 to nCount
	sheets[index] = Items[index].Window
next

return nCount
end function

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

private subroutine _of_drawscrollbar (ref paintpane scrollbar, readonly boolean fadeanimation);ulong safeDC
RECTF adjustedRect

if Not ScrollBar.Visible then return

safeDC=_Canvas.GetSafeNcDC()

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER)

Painter.IntersectClipRect(safeDC,adjustedRect)
Painter.IntersectClipRect(safeDC,ScrollBar.rcPaint)

if #Transparent then
	_Canvas.FillParentBkgnd(safeDC)
end if

Event OnNcEraseBkgnd(safeDC)

_of_DrawScrollBar(ScrollBar,safeDC)

Painter.SelectClipRgn(safeDC,0)

ulong hUpdateRgn

hUpdateRgn = Painter.CreateRectRgn(ScrollBar.rcPaint)

if FadeAnimation then
	_Canvas.ReleaseDC(safeDC,hUpdateRgn,#ParentWindow.#FadeTime)
else
	_Canvas.ReleaseDC(safeDC,hUpdateRgn)
end if

Painter.DeleteRgn(hUpdateRgn)
end subroutine

private subroutine _of_drawsysbutton (readonly integer index, readonly unsignedlong hdc);ulong borderColor,bkColor,nState
uint borderStyle
RADIUSF rdBorder

if Not SysButtons[index].visible then return

if SysButtons[index].MouseOver then nState += Enums.STATE_HOVER
if SysButtons[index].MouseDown then nState += Enums.STATE_PRESSED
if Not SysButtons[index].Enabled then nState += Enums.STATE_DISABLED

if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
	bkColor	= theme.of_GetColor(theme.CLR_SYSBTNBKGND,nState)
	borderColor = theme.of_GetColor(theme.CLR_SYSBTNBORDER,nState)
	if theme.#TabStyle = theme.TBS_SOLID then
		borderStyle = Enums.BS_ROUND
	else
		borderStyle = Enums.BS_SOLID
	end if
	rdBorder.leftTop = 2
	rdBorder.rightTop = 2
	rdBorder.leftBottom = 2
	rdBorder.rightBottom = 2
	Painter.ThemeFill(hdc,SysButtons[index].rcPaint,bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
						borderStyle,borderColor,rdBorder)
end if

// Draw image
if SysButtons[index].MouseDown then
	_ImageList_Button.Draw(SysButtons[index].imageIndex,hdc, SysButtons[index].rcImage.left ,SysButtons[index].rcImage.top + 1,Not SysButtons[index].Enabled)
else
	_ImageList_Button.Draw(SysButtons[index].imageIndex,hdc, SysButtons[index].rcImage.left ,SysButtons[index].rcImage.top,Not SysButtons[index].Enabled)
end if
end subroutine

private subroutine _of_drawsysbutton (readonly integer index, readonly boolean fadeanimation);ulong safeDC
RECTF adjustedRect

if Not SysButtons[index].visible then return
if SysButtons[index].hidden then return

safeDC=_Canvas.GetSafeNcDC()

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER)

Painter.IntersectClipRect(safeDC,adjustedRect)
Painter.IntersectClipRect(safeDC,SysButtons[index].rcPaint)

if #Transparent then
	_Canvas.FillParentBkgnd(safeDC)
end if

Event OnNcEraseBkgnd(safeDC)

_of_DrawSysButton(index,safeDC)

Painter.SelectClipRgn(safeDC,0)

ulong hUpdateRgn

hUpdateRgn = Painter.CreateRectRgn(SysButtons[index].rcPaint)

if FadeAnimation then
	_Canvas.ReleaseDC(safeDC,hUpdateRgn,#ParentWindow.#FadeTime)
else
	_Canvas.ReleaseDC(safeDC,hUpdateRgn)
end if

Painter.DeleteRgn(hUpdateRgn)

end subroutine

private subroutine _of_updatescrollbarpoints ();RECTF adjustedRect,tabStripRect

tabStripRect = rcTabStrip
adjustedRect = rcTabStrip

_of_AdjustRect(ref tabStripRect,ADJ_SYSBUTTON)
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_SYSBUTTON)

if theme.#TabStripBorderStyle <> Enums.BS_NONE then
	tabStripRect.right -= 1
end if

if _StartPoint < adjustedRect.left then
	ScrollBarLeft.visible = true
	ScrollBarLeft.rcPaint.left = tabStripRect.left
	ScrollBarLeft.rcPaint.right = ScrollBarLeft.rcPaint.left + SCROLLBARSIZE
	ScrollBarLeft.rcPaint.top = tabStripRect.top
	ScrollBarLeft.rcPaint.bottom = tabStripRect.bottom
else
	ScrollBarLeft.visible = false
end if

if _EndPoint > adjustedRect.right then
	ScrollBarRight.visible = true
	ScrollBarRight.rcPaint.left = tabStripRect.right - SCROLLBARSIZE
	ScrollBarRight.rcPaint.right = ScrollBarRight.rcPaint.left + SCROLLBARSIZE
	ScrollBarRight.rcPaint.top 	= tabStripRect.top
	ScrollBarRight.rcPaint.bottom = tabStripRect.bottom
else
	ScrollBarRight.visible = false
end if
end subroutine

private function boolean _of_adjustscrollposition ();RECTF adjustedRect

if _ScrollPosition = 0 then return false

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_SYSBUTTON)

if _EndPoint < adjustedRect.right and _ScrollPosition < 0 then
	_of_ScrollPosition(adjustedRect.right - _EndPoint)
	return true
end if

return false
end function

private subroutine _of_updatepoints ();if Not _showTabStripBar then return

_of_UpdateSysButtonPoints()
_of_UpdateTabPoints()

if Not _of_AdjustScrollPosition() then
	_of_UpdateScrollBarPoints()
end if
end subroutine

public function long of_scrollto (readonly integer index, readonly long flag);real scrollSize
RECTF adjustedRect

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not of_IsActiveSheetMaximized() then return RetCode.FAILED
if Not Items[index].visible then return RetCode.FAILED
if Not ScrollBarLeft.Visible and Not ScrollBarRight.Visible then return RetCode.FAILED

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_SYSBUTTON)

choose case flag
	case Enums.SF_FORWARD
		if ScrollBarRight.Visible then
			if index = _lastIndex then
				if Items[index].rcPaint.Right - Items[index].OffsetPosition > adjustedRect.right then
					scrollSize = adjustedRect.right - (Items[index].rcPaint.Right  - Items[index].OffsetPosition)
				end if
			else
				if Items[index].rcPaint.Right - Items[index].OffsetPosition > ScrollBarRight.rcPaint.Left - 1 then
					scrollSize = (ScrollBarRight.rcPaint.Left - 1) - (Items[index].rcPaint.Right  - Items[index].OffsetPosition)
				end if
			end if
		end if
	case Enums.SF_BACKWARD
		if ScrollBarLeft.Visible then
			if index = _firstIndex then
				if Items[index].rcPaint.Left  - Items[index].OffsetPosition < adjustedRect.Left then
					scrollSize = adjustedRect.Left - (Items[index].rcPaint.Left  - Items[index].OffsetPosition)
				end if
			else
				if Items[index].rcPaint.Left  - Items[index].OffsetPosition < ScrollBarLeft.rcPaint.Right + 1 then
					scrollSize = (ScrollBarLeft.rcPaint.Right + 1) - (Items[index].rcPaint.Left - Items[index].OffsetPosition)
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

public function long of_redraw (readonly boolean fadeanimation);return of_Redraw(false,fadeAnimation)
end function

public function integer of_getsheetindex (readonly unsignedlong hwnd);int index

for index = UpperBound(Items) to 1 step -1
	if Not IsValidObject(Items[index].Window) then continue
	if Items[index].Window.#Handle = hWnd then return index
next

return 0
end function

private subroutine _of_updatetabpoints ();int	index,nCount
real ll_x,ll_top
real itemSize
real maxSize
real offsetSize
RECTF adjustedRect,tabStripRect

adjustedRect = rcTabStrip
tabStripRect = rcTabStrip
_of_AdjustRect(ref tabStripRect,ADJ_BORDER + ADJ_SYSBUTTON)
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_SYSBUTTON)
		
ll_x=adjustedRect.left + _ScrollPosition

_StartPoint = ll_x

_firstIndex = 0
_lastIndex = 0

nCount = UpperBound(Items)
for index = 1 to nCount
	if Not Items[index].Visible then
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
	
	if Items[index].ImageIndex > 0 then
		if Items[index].szText.cx > 0 then
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
	elseif Items[index].szText.cx > 0 then
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
	Items[index].rcPaint.bottom 	= tabStripRect.bottom - 1
	if Items[index].Selected then
		Items[index].rcPaint.bottom += 1
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
			
			ll_x = _EndPoint - 1//+ 2
	end choose
	
	if _firstIndex = 0 then
		_firstIndex = index
	end if
	_lastIndex = index
next
end subroutine

private subroutine _of_scrollleft ();int index
real offsetSize
boolean bNeedScroll
RECTF adjustedRect

if Not ScrollBarLeft.visible then return

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_SYSBUTTON)

if _smoothScrollSize > 0 then
	offsetSize = _smoothScrollSize
end if

for index = UpperBound(Items) to  1 step -1
	if Not Items[index].visible then continue
	if index = _draggingIndex then continue
	if index = _firstIndex then
		if (Items[index].rcPaint.Left - Items[index].OffsetPosition) + offsetSize < adjustedRect.Left then
			bNeedScroll = true
		end if
	else
		if (Items[index].rcPaint.Left - Items[index].OffsetPosition) + offsetSize < ScrollBarLeft.rcPaint.Right + 1 then
			bNeedScroll = true
		end if
	end if
	if bNeedScroll then
		of_ScrollTo(index,Enums.SF_BACKWARD)
		return
	end if
next
end subroutine

private subroutine _of_scrollright ();int index
real offsetSize
boolean bNeedScroll
RECTF adjustedRect

if Not ScrollBarRight.visible then return

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_SYSBUTTON)

if _smoothScrollSize < 0 then
	offsetSize = _smoothScrollSize
end if

for index = 1 to UpperBound(Items)
	if Not Items[index].visible then continue
	if index = _draggingIndex then continue
	if index = _lastIndex then
		if (Items[index].rcPaint.Right - Items[index].OffsetPosition)  + offsetSize > adjustedRect.Right then
			bNeedScroll = true
		end if
	else
		if (Items[index].rcPaint.Right - Items[index].OffsetPosition) + offsetSize > ScrollBarRight.rcPaint.Left - 1 then
			bNeedScroll = true
		end if
	end if
	if bNeedScroll then
		of_ScrollTo(index,Enums.SF_FORWARD)
		return
	end if
next
end subroutine

private subroutine _of_showtip (readonly integer index);string tipText
RECTF scRect
SIZEF toolSize
POINTF pt

if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _MouseCaptured then return
if Not #ParentWindow.#ToolTip then return

if index > 0 then
	tipText = Items[index].tipText
elseif index < 0 then
	tipText = SysButtons[-index].tipText
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
	_ToolTip.TrackActivate(#Handle,_TTID,true)
else
	_ToolTip.TrackActivate(#Handle,_TTID,false)	
end if
end subroutine

public function long of_move (readonly integer srcindex, readonly integer dstindex);int index,i
real offsetPosition
ITEMDATA srcItem,origItems[]

if srcIndex < 1 or srcIndex > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if dstIndex < 1 or dstIndex > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if srcIndex = dstIndex then return RetCode.FAILED

origItems = Items
srcItem = Items[srcIndex]

if srcIndex < dstIndex then							//向左移动
	for index = srcIndex to dstIndex - 1
		if #SmoothDrag and Items[index + 1].Visible and srcItem.Visible then
			for i = index to srcIndex step -1
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
			if origItems[i].Visible then
				srcItem.OffsetPosition = (srcItem.rcPaint.Left - (origItems[i].rcPaint.Right - origItems[i].OffsetPosition)) +  (origItems[i].rcPaint.Right - origItems[i].rcPaint.Left)
				exit
			end if
		next
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

return RetCode.OK
end function

public function boolean of_isdraggingmode ();return (_draggingIndex > 0 and _MouseCaptured)
end function

public function long of_select (readonly integer index);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not Items[index].Visible or Not Items[index].Enabled then return RetCode.FAILED
if index = _selectedIndex then return RetCode.OK

if Items[index].Window.#Handle <> _of_GetActiveSheet() then
	if _selectedIndex > 0 then
		Items[_selectedIndex].selected=false
	end if
	Items[index].selected = true
	_selectedIndex = index
	_of_UpdatePoints()
	Win32.SetRedraw(#Handle,false)
	Send(#Handle,WinMsg.WM_MDIACTIVATE,Items[index].Window.#Handle,0)
	Win32.SetRedraw(#Handle,true)
else
	if _selectedIndex > 0 then
		Items[_selectedIndex].selected=false
	end if
	_selectedIndex = index
	Items[_selectedIndex].selected = true
	of_UpdatePoints()
end if

of_ScrollTo(_selectedIndex)

return RetCode.OK
end function

public function long of_scrollto (readonly integer index);long rtCode

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

public function integer of_opensheet (ref s_cst_window sheet, readonly string wndtype, readonly integer indexbefore, readonly arrangeopen aopentype);int index
long rtCode
ulong hWndActivated

index = of_GetSheetIndex(sheet)
if index > 0 then return index

hWndActivated = _of_GetActiveSheet()

Win32.SetRedraw(#Handle,false)
_sheetCreating = true
if Len(wndType) > 0 then
	rtCode = OpenSheet(ref sheet,wndType,#ParentWindow,0,aOpenType)
else
	rtCode = OpenSheet(ref sheet,#ParentWindow,0,aOpenType)
end if
if rtCode = 1 then
	if indexBefore > 0 and indexBefore <= UpperBound(Items) then
		index = _of_InsertItem(indexBefore,sheet)
	else
		index = _of_AddItem(sheet)
	end if
end if
_sheetCreating = false
if hWndActivated <> _of_GetActiveSheet() then
	Event OnChildActivate(hWndActivated,_of_GetActiveSheet())
end if
Win32.SetRedraw(#Handle,true)

return index
end function

public function integer of_opensheetwithparm (ref s_cst_window sheet, readonly any parm, readonly string wndtype, readonly integer indexbefore, readonly arrangeopen aopentype);int index
long rtCode
string sParm
double dParm
ulong hWndActivated
PowerObject poParm

index = of_GetSheetIndex(sheet)
if index > 0 then return index

hWndActivated = _of_GetActiveSheet()

Win32.SetRedraw(#Handle,false)
_sheetCreating = true
try
	if Len(wndType) > 0 then
		choose case ClassName(parm)
			case "string"
				sParm = parm
				rtCode = OpenSheetWithParm(sheet,sParm,wndType,#ParentWindow,0,aOpenType)
			case "integer","long","longlong","unsignedinteger","unsignedlong","decimal","double","real"
				dParm = parm
				rtCode = OpenSheetWithParm(sheet,dParm,wndType,#ParentWindow,0,aOpenType)
			case "time","date","datetime"
				return RetCode.E_INVALID_ARGUMENT
			case else
				poParm = parm
				rtCode = OpenSheetWithParm(sheet,poParm,wndType,#ParentWindow,0,aOpenType)
		end choose
	else
		choose case ClassName(parm)
			case "string"
				sParm = parm
				rtCode = OpenSheetWithParm(sheet,sParm,#ParentWindow,0,aOpenType)
			case "integer","long","longlong","unsignedinteger","unsignedlong","decimal","double","real"
				dParm = parm
				rtCode = OpenSheetWithParm(sheet,dParm,#ParentWindow,0,aOpenType)
			case "time","date","datetime"
				return RetCode.E_INVALID_ARGUMENT
			case else
				poParm = parm
				rtCode = OpenSheetWithParm(sheet,poParm,#ParentWindow,0,aOpenType)
		end choose
	end if
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
finally
	if rtCode = 1 then
		if indexBefore > 0 and indexBefore <= UpperBound(Items) then
			index = _of_InsertItem(indexBefore,sheet)
		else
			index = _of_AddItem(sheet)
		end if
	end if
	_sheetCreating = false
	if hWndActivated <> _of_GetActiveSheet() then
		Event OnChildActivate(hWndActivated,_of_GetActiveSheet())
	end if
	Win32.SetRedraw(#Handle,true)
end try

return index
end function

private function unsignedlong _of_getactivesheet (ref boolean ismaximized);ulong hWnd,nState
hWnd = SendMessageMDIGetActive(#Handle,WinMsg.WM_MDIGETACTIVE,0,ref nState)
isMaximized = (nState = 1)
return hWnd
end function

private function ulong _of_getactivesheet ();boolean bIsMaximized
return _of_GetActiveSheet(ref bIsMaximized)
end function

public function long of_closesheet (readonly s_cst_window sheet);return of_CloseSheet(of_GetSheetIndex(sheet))
end function

public function long of_settransparent (readonly boolean transparent, readonly boolean bredraw);if #Transparent = transparent then return RetCode.OK

#Transparent = transparent
if #Transparent then
	Win32.UpdateParentBkgnd(#Handle,false)
end if
if bRedraw then
	of_Redraw(false,false)
end if

return RetCode.OK
end function

public function long of_settransparent (readonly boolean transparent);return of_SetTransparent(transparent,true)
end function

public function long of_updateparentbkgnd (readonly boolean bredraw);if Not #Transparent then return RetCode.E_NO_SUPPORT

Win32.UpdateParentBkgnd(#Handle,bRedraw)

return RetCode.OK
end function

public function boolean of_istabstripbarvisible ();return _showTabStripBar
end function

public function unsignedlong of_getitemstate (readonly integer index);ulong nState

if index < 1 or index > UpperBound(Items) then return 0

if Items[index].MouseOver  then nState += Enums.STATE_HOVER
if Items[index].Selected then nState += Enums.STATE_CURRENT + Enums.STATE_SELECTED + Enums.STATE_PRESSED
if Not Items[index].Enabled then nState += Enums.STATE_DISABLED

return nState
end function

private subroutine _of_adjustrect (ref rectf adjrect, unsignedlong flags);real fBorderSize

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

if BitAND(flags,ADJ_SYSBUTTON) > 0 then
	adjRect.right -= _sysButtonWidth
end if
end subroutine

private subroutine _of_scrollposition (real scrollsize);int index
real scrollPosition
RECTF adjustedRect

if scrollSize = 0 then return

adjustedRect = rcTabStrip
_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_SYSBUTTON)

scrollPosition = _ScrollPosition

if scrollSize > 0 then		//Scroll left
	if _StartPoint + scrollSize <= adjustedRect.left then
		_ScrollPosition += scrollSize
	else
		_ScrollPosition = 0
	end if
elseif scrollSize < 0 then	//Scroll right
	if adjustedRect.right - _EndPoint <= scrollSize then
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
	
	if of_IsDraggingMode()  then
		_mouseDownPoint.x += scrollPosition
		_lastMousePoint.x += scrollPosition
	end if
	for index = 1 to UpperBound(Items)
		if Not Items[index].visible then continue
		if index = _DraggingIndex then
			Items[index].OffsetPosition -= scrollPosition
			continue
		end if
		_of_OffsetItemPosition(index,scrollPosition)
	next
end if
end subroutine

private subroutine _of_offsetitemposition (readonly integer index, readonly real offsetsize);ulong matrix
RECTF tabStripRect

if Not Items[index].visible then return
if offsetSize = 0 then return

tabStripRect = rcTabStrip
_of_AdjustRect(ref tabStripRect,ADJ_BORDER + ADJ_SYSBUTTON)

Painter.CreateMatrix(ref matrix)

if Not Painter.IsRectEmpty(Items[index].rcImage) then
	Painter.OffsetRect(Items[index].rcImage,offsetSize,0 )
end if
if Not Painter.IsRectEmpty(Items[index].rcText) then
	Painter.OffsetRect(Items[index].rcText,offsetSize ,0)
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

Painter.DeleteMatrix(matrix)
end subroutine

private function integer _of_indexfrompoint (readonly real xpos, readonly real ypos, ref boolean issysbutton);int index
RECTF tabStripRect

if Not _showTabStripBar then return 0
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

if _mouseOverIndex < 0 then
	if SysButtons[-_mouseOverIndex].Visible and SysButtons[-_mouseOverIndex].Enabled and Not SysButtons[-_mouseOverIndex].Hidden then
		if Painter.PtInRect(SysButtons[-_mouseOverIndex].rcPaint,xpos,ypos) then
			isSysButton = true
			return -_mouseOverIndex
		end if
	end if
end if
for index = UpperBound(SysButtons) to  1 step -1
	if index = -_mouseOverIndex then continue
	if Not SysButtons[index].visible or Not SysButtons[index].enabled or SysButtons[index].hidden then continue
	if Painter.PtInRect(SysButtons[index].rcPaint,xpos,ypos) then
		isSysButton = true
		return index
	end if
next

tabStripRect = rcTabStrip
_of_AdjustRect(ref tabStripRect,ADJ_BORDER + ADJ_SYSBUTTON)

if Painter.PtInRect(tabStripRect,xpos,ypos) then
	if _mouseOverIndex > 0 then
		if Items[_mouseOverIndex].Visible and Items[_mouseOverIndex].Enabled and Not Items[_mouseOverIndex].Hidden then
			if Painter.PtInRect(Items[_mouseOverIndex].rcPaint,xpos,ypos) then
				if Painter.IsVisiblePathPoint(Items[_mouseOverIndex].PaintPath,xpos,ypos) then return _mouseOverIndex
				if Painter.IsOutlineVisiblePathPoint(Items[_mouseOverIndex].PaintPath,xpos,ypos,_outlinePen) then return _mouseOverIndex
			end if
		end if
	end if
	for index = UpperBound(Items) to  1 step -1
		if index = _mouseOverIndex then continue
		if Not Items[index].visible or Not Items[index].enabled or Items[index].hidden then continue
		if Painter.PtInRect(Items[index].rcPaint,xpos,ypos) then
			if Painter.IsVisiblePathPoint(Items[index].PaintPath,xpos,ypos) then return index
			if Painter.IsOutlineVisiblePathPoint(Items[index].PaintPath,xpos,ypos,_outlinePen) then return index
		end if
	next
end if

return 0
end function

private function unsignedlong _of_popupsheetlist (real xpos, real ypos);ulong rtCode
int index,nCount,indexCheck
n_cst_popupmenu pmMenu
RECTF wndRect
Constant Uint OPTMENUCOUNT 	= 7

if Not SysButtons[IDX_SHEETLIST].Visible then return 0

pmMenu = Create n_cst_popupmenu
pmMenu.theme.of_SetTheme(theme)
pmMenu.theme.Font.of_SetFont(theme.Font)
pmMenu.theme.of_SetIconSize(theme.#IconSize.cx,theme.#IconSize.cy)
pmMenu.of_SetToolTip(#ParentWindow.#ToolTip)

pmMenu.of_AddMenu(I18N(Enums.I18N_CAT_WINDOW,TXT_CASCADE),ICO_CASCADE,I18N(Enums.I18N_CAT_WINDOW,TIP_CASCADE),MID_CASCADE)			//1
pmMenu.of_AddMenu(I18N(Enums.I18N_CAT_WINDOW,TXT_LAYER),ICO_LAYER,I18N(Enums.I18N_CAT_WINDOW,TIP_LAYER),MID_LAYER)							//2
pmMenu.of_AddMenu(I18N(Enums.I18N_CAT_WINDOW,TXT_VTILE),ICO_VTILE,I18N(Enums.I18N_CAT_WINDOW,TIP_VTILE),MID_VTILE)								//3
pmMenu.of_AddMenu(I18N(Enums.I18N_CAT_WINDOW,TXT_HTILE),ICO_HTILE,I18N(Enums.I18N_CAT_WINDOW,TIP_HTILE),MID_HTILE)								//4
pmMenu.of_AddMenu(I18N(Enums.I18N_CAT_WINDOW,TXT_ARRGICON),ICO_ARRGICON,I18N(Enums.I18N_CAT_WINDOW,TIP_ARRGICON),MID_ARRGICON)	//5
pmMenu.of_AddMenu(I18N(Enums.I18N_CAT_WINDOW,TXT_CLOSEALL),ICO_CLOSEALL,I18N(Enums.I18N_CAT_WINDOW,TIP_CLOSEALL),MID_CLOSEALL)		//6
pmMenu.of_AddSeparator()																																									//7

//Append sheet list
nCount = UpperBound(Items)
for index = 1 to nCount
	pmMenu.of_AddMenu(String(index)+" "+Items[index].Text,Items[index].Image,Items[index].Text,MID_SHEETLIST + index)
	if Items[index].Selected then
		indexCheck = index + OPTMENUCOUNT
	end if
next
if indexCheck > 0 then
	pmMenu.of_CheckRadios(OPTMENUCOUNT + 1,pmMenu.of_GetCount(),indexCheck,true,true)
end if

Painter.GetWindowRect(#Handle,ref wndRect)

xpos = wndRect.left + SysButtons[IDX_SHEETLIST].rcPaint.Left
ypos = wndRect.top + SysButtons[IDX_SHEETLIST].rcPaint.Bottom + 1

rtCode = pmMenu.of_Popup(xpos,ypos,Win32.TPM_LEFTALIGN + Win32.TPM_TOPALIGN)

Destroy pmMenu

_lastPopupTime = Cpu()

return rtCode
end function

on n_cst_window_mdiclient.create
call super::create
this.timer=create timer
this.theme=create theme
TriggerEvent( this, "constructor" )
end on

on n_cst_window_mdiclient.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.timer)
destroy(this.theme)
end on

event constructor;_ImageList = Create n_imagelist
_ImageList.ShareImage(true)
_ImageList.SetImageSize(theme.#IconSize.cx,theme.#IconSize.cy)

_ImageList_Button = Create n_imagelist
_ImageList_Button.ShareImage(true)
_ImageList_Button.SetImageSize(SYSBTNICONSIZE,SYSBTNICONSIZE)

_ToolTip = Create n_tooltip
_Canvas = Create n_canvas
end event

event destructor;int index

for index = UpperBound(Items) to 1 step -1
	Painter.DeletePath(Items[index].PaintPath)
next

if _TTID > 0 then
	_ToolTip.DelTool(#Handle,_TTID)
end if
Destroy _ToolTip

Painter.DeletePen(_outlinePen)

Destroy _ImageList
Destroy _ImageList_Button

_Canvas.Detach()
Destroy _Canvas
end event

type timer from n_timer within n_cst_window_mdiclient descriptor "pb_nvo" = "true" 
end type

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

event ontimer;call super::ontimer;return Parent.Event OnTimer(id)
end event

type theme from n_cst_window_mdiclient_theme within n_cst_window_mdiclient descriptor "pb_nvo" = "true" 
end type

on theme.create
call super::create
end on

on theme.destroy
call super::destroy
end on

event ongetitemcolor;call super::ongetitemcolor;#ParentWindow.Event OnMDIClientGetItemColor(index,colorFlag,state,ref color)
end event

event ongetcolor;call super::ongetcolor;#ParentWindow.Event OnMDIClientGetColor(colorFlag,state,ref color)
end event

event onthemechanged;call super::onthemechanged;boolean dirty,bFrameChanged

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
	case EVT_SHEETLISTBUTTON
		dirty = true
	case EVT_TABSTYLE
		dirty = true
	case EVT_TEXTALIGN
		dirty = true
	case EVT_ICONPOSITION
		_of_UpdateTextSize()
		dirty = true
	case EVT_ICONSIZE
		_of_UpdateTextSize()
		_ImageList.SetImageSize(#IconSize.cx,#IconSize.cy)
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
	case EVT_BORDERMARGIN
		dirty = true
	case EVT_SELECTEDFONT
		_of_UpdateTextSize()
		dirty = true
end choose

if dirty then
	if bFrameChanged then
		_of_UpdateTextSize()
		_Canvas.UpdateFrame()
	else
		of_UpdatePoints()
		of_ScrollTo(_selectedIndex)
	end if
else
	of_Redraw(true)
end if

#ParentWindow.Event OnMDIClientThemeChanged(eventFlag)
end event

