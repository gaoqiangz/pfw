$PBExportHeader$n_cst_ribbonbar_popuppanel.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_ribbonbar_popuppanel from n_cst_popupcanvas
end type
end forward

global type n_cst_ribbonbar_popuppanel from n_cst_popupcanvas
boolean #bordershadow = true
event type long onpaint ( unsignedlong hdc )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event oninit ( n_cst_ribbonbar_panel panel,  n_imagelist launchimagelist,  n_tooltip tooltip,  unsignedlong ttid )
event type long oninitdata ( ref n_cst_ribbonbar_baseitem newitems[],  ref sizef captionsize )
event type long onerasebkgnd ( unsignedlong hdc )
event onmouseleave ( )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event onthemechanged ( unsignedinteger eventflag )
event oncapturechanged ( )
event type unsignedlong ongetwindowrgn ( real newwidth,  real newheight )
event type long onmousewheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event type long onmousehwheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event type long onrbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onrbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
end type
global n_cst_ribbonbar_popuppanel n_cst_ribbonbar_popuppanel

type prototypes

end prototypes

type variables
/*--- Properties ---*/
Public:
PrivateWrite u_cst_ribbonbar				#ParentRibbonBar
PrivateWrite n_cst_ribbonbar_category	#ParentCategory
PrivateWrite n_cst_ribbonbar_panel		#Panel

/*--- Implementation ---*/
Private:
n_cst_ribbonbar_theme		theme
n_imagelist 						_LaunchImageList
n_tooltip							_ToolTip
n_cst_ribbonbar_baseitem	Items[]
PAINTPANE						LaunchBtn
RECTF								rcPaint
RECTF								rcCaption
SIZEF								szCaption

Ulong _TTID

Int _mouseOverIndex			= 0
Int _mouseDownIndex		= 0
Int _rightMouseDownIndex	= 0

Boolean _MouseOver				= false
Boolean _MouseCaptured 		= false
Boolean _MouseLeaveTracked 	= false
Boolean _MouseIdle				= false

//Hit-test code
Constant Long HTNOWHERE		= 0
Constant Long HTVALID			= 1
//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
Constant Uint ADJ_CAPTION			 	= 4
//Sizes
Constant real LAUNCHBUTTONSIZE	= 14 		//px
Constant real LAUNCHICONSIZE		= 8		//px
end variables

forward prototypes
private subroutine _of_updatepoints ()
private subroutine _of_repositems ()
private subroutine _of_drawlaunchbutton (unsignedlong hdc)
public function unsignedlong of_getsafedc ()
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation)
private subroutine _of_fillbkgnd (readonly unsignedlong hdc)
private subroutine _of_drawcaption (unsignedlong hdc)
private subroutine _of_capturemouse (readonly boolean capture)
private subroutine _of_trackmouseleave (readonly boolean track)
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime)
private subroutine _of_drawlaunchbutton (readonly boolean fadeanimation)
private subroutine _of_showlaunchtip (boolean show)
public function long of_redraw (readonly boolean fadeanimation)
public function unsignedlong of_getstate ()
public function unsignedlong of_getlaunchbuttonstate ()
public subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
public function long of_scroll (readonly real scrollsize)
public function integer of_indexfrompoint (real xpos, real ypos)
public function unsignedlong of_popup (readonly real xpos, readonly real ypos)
end prototypes

event type long onpaint(unsignedlong hdc);int index
ulong dcState
RECTF paintRect

_of_FillBkgnd(hdc)

if szCaption.cx > 0 then
	_of_DrawCaption(hdc)
end if
if #Panel.#LaunchButton then
	_of_DrawLaunchButton(hdc)
end if

paintRect = rcPaint
_of_AdjustRect(ref paintRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)

dcState = Painter.SaveDC(hdc)
Painter.IntersectClipRect(hdc,ref paintRect)

for index = 1 to UpperBound(Items)
	if Items[index].#Type = Items[index].ITT_SPACE or Items[index].#Type = Items[index].ITT_BREAK then continue
	if Items[index].#Visible then
		Items[index].Event OnPaint(hdc)
	end if
next

Painter.RestoreDC(hdc,dcState)

return 1
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);int index

if Not #Panel.of_IsEnabled() then return 0

if Painter.PtInRect(ref rcPaint,xpos,ypos) then
	if _MouseIdle then
		_MouseIdle = false
		#ParentRibbonBar.Event OnPopupKickIdle(1)
	end if
	if Not _MouseLeaveTracked then
		_of_TrackMouseLeave(true)
	end if
	if Not _MouseOver then
		_MouseOver = true
		of_Redraw(true)
		#ParentRibbonBar.Event OnPanelMouseEnter(#Panel,xpos,ypos)
	else
		#ParentRibbonBar.Event OnPanelMouseMove(#Panel,xpos,ypos)
	end if
else
	if _MouseLeaveTracked then
		Event OnMouseLeave()
	end if
	if Not _MouseIdle then
		_MouseIdle = true
		#ParentRibbonBar.Event OnPopupEnterIdle(1)
	else
		#ParentRibbonBar.Event OnPopupIdle(1)
	end if
	return 0
end if

index = of_IndexFromPoint(xpos,ypos)

if _mouseOverIndex <> index then
	if _mouseOverIndex > 0 then
		Items[_mouseOverIndex].Event OnMouseLeave()
	end if
	_mouseOverIndex = index
	if _mouseOverIndex > 0 then
		Items[_mouseOverIndex].Event OnMouseMove(vkey,xpos,ypos)
	end if
elseif _mouseOverIndex > 0 then
	Items[_mouseOverIndex].Event OnMouseMove(vkey,xpos,ypos)
end if

if index = #Panel.IDX_LAUNCHBTN then
	if Not LaunchBtn.MouseOver then
		LaunchBtn.MouseOver = true
		_of_DrawLaunchButton(true)
		_of_ShowLaunchTip(true)
		#ParentRibbonBar.Event OnLaunchButtonMouseEnter(#Panel,xpos,ypos)
	else
		#ParentRibbonBar.Event OnLaunchButtonMouseMove(#Panel,xpos,ypos)
	end if
else
	if LaunchBtn.MouseOver then
		LaunchBtn.MouseOver = false
		_of_DrawLaunchButton(true)
		_of_ShowLaunchTip(false)
		#ParentRibbonBar.Event OnLaunchButtonMouseLeave(#Panel)
	end if
end if

return 0
end event

event oninit(n_cst_ribbonbar_panel panel, n_imagelist launchimagelist, n_tooltip tooltip, unsignedlong ttid);#Panel	= panel
#ParentRibbonBar = #Panel.#ParentRibbonBar
#ParentCategory 	= #Panel.#ParentCategory
theme	= #ParentRibbonBar.theme

_LaunchImageList = launchimagelist
_ToolTip = tooltip
_TTID = ttid
end event

event type long oninitdata(ref n_cst_ribbonbar_baseitem newitems[], ref sizef captionsize);Items = newItems
szCaption = captionsize

_of_UpdatePoints()

return 0
end event

event type long Onerasebkgnd(unsignedlong hdc);_of_FillBkgnd(hdc)
return 0
end event

event onmouseleave();if _MouseOver then
	_MouseOver = false
	
	if _mouseOverIndex > 0 then
		Items[_mouseOverIndex].Event OnMouseLeave()
		_mouseOverIndex = 0
	end if
	
	if LaunchBtn.MouseOver then
		LaunchBtn.MouseOver = false
		#ParentRibbonBar.Event OnLaunchButtonMouseLeave(#Panel)
	end if
	
	of_Redraw(true)
	
	#ParentRibbonBar.Event OnPanelMouseLeave(#Panel)
end if

_of_TrackMouseLeave(false)
_of_ShowLaunchTip(false)
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);if Not #Panel.of_IsEnabled() then return 0

if Not _MouseLeaveTracked then
	Event OnMouseMove(vkey,xpos,ypos)
end if

if _mouseOver then
	if LaunchBtn.MouseOver then
		_of_ShowLaunchTip(false)
		LaunchBtn.MouseDown = true
		_of_DrawLaunchButton(false)
		_of_CaptureMouse(true)
		#ParentRibbonBar.Event OnLaunchButtonMouseDown(#Panel,xpos,ypos)
	elseif _mouseOverIndex > 0 then
		_mouseDownIndex = _mouseOverIndex
		Items[_mouseDownIndex].Event OnLButtonDown(vkey,xpos,ypos)
	end if
end if

return 0
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if Not #Panel.of_IsEnabled() then return 0

if _MouseCaptured then
	_of_CaptureMouse(false)
	if LaunchBtn.MouseDown then
		LaunchBtn.MouseDown = false
		_of_DrawLaunchButton(true)
		#ParentRibbonBar.Event OnLaunchButtonMouseUp(#Panel,xpos,ypos)
		if Not IsValid(this) then return 0
		if LaunchBtn.MouseOver then
			if IsAllowed(#ParentRibbonBar.Event OnLaunchButtonClicking(#Panel)) then
				if Not IsValid(this) then return 0
				#Panel.of_ExitPopupMode(0,true)
				#ParentRibbonBar.Event OnLaunchButtonClicked(#Panel)
				if Not IsValid(this) then return 0
			end if
		end if
	end if
elseif _mouseDownIndex > 0 then
	Items[_mouseDownIndex].Event OnLButtonUp(vkey,xpos,ypos)
	if Not IsValid(this) then return 0
	_mouseDownIndex = 0
end if

_of_TrackMouseLeave(true)

return 0
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);long rt

if Not _MouseLeaveTracked then
	Event OnMouseMove(vkey,xpos,ypos)
end if

if LaunchBtn.MouseOver then
	rt = Event OnLButtonDown(vKey,xpos,ypos)
elseif #Panel.of_IsEnabled() then
	if _mouseOver then
		if _mouseOverIndex > 0 then
			_mouseDownIndex = _mouseOverIndex
			rt = Items[_mouseDownIndex].Event OnLButtonDBLClk(vkey,xpos,ypos)
		end if
	end if
end if

return rt
end event

event onthemechanged(unsignedinteger eventflag);of_Redraw(true)
end event

event oncapturechanged();if _MouseCaptured then
	_of_CaptureMouse(false)
	if LaunchBtn.MouseDown then
		LaunchBtn.MouseDown = false
		_of_DrawLaunchButton(true)
		#ParentRibbonBar.Event OnLaunchButtonMouseUp(#Panel,0,0)
		if Not IsValid(this) then return
	end if
	Event OnMouseLeave()
elseif _mouseDownIndex > 0 then
	Items[_mouseDownIndex].Event OnCaptureChanged()
	if Not IsValid(this) then return
	_mouseDownIndex = 0
elseif _rightMouseDownIndex > 0 then
	Items[_rightMouseDownIndex].Event OnCaptureChanged()
	if Not IsValid(this) then return
	_rightMouseDownIndex = 0
end if
end event

event type unsignedlong ongetwindowrgn(real newwidth, real newheight);ulong wndRgn
RADIUSF rdBorder

if theme.#PanelBorderStyle = Enums.BS_ROUND then
	rdBorder = theme.#PanelRoundSize
	wndRgn = Painter.CreateRoundRectRgn(0,0,newWidth + 1,newHeight + 1,ref rdBorder)
else
	//wndRgn = Painter.CreateRectRgn(0,0,newWidth,newHeight)
	wndRgn = 0
end if

return wndRgn
end event

event type long onmousewheel(unsignedlong vkey, long zdelta, real xpos, real ypos);RECTF wndRect
POINTF pt

Painter.GetCursorPos(ref pt)
Painter.GetWindowRect(#ParentRibbonBar.#Handle,ref wndRect)

if Painter.PtInRect(ref wndRect,pt.x,pt.y) then
	#ParentRibbonBar.Event OnMouseWheel(vkey,zdelta,pt.x - wndRect.left,pt.y - wndRect.top)
elseif #ParentCategory.of_IsPopupMode() then
	Painter.GetWindowRect(#ParentCategory.of_GetHandle(),ref wndRect)
	if Painter.PtInRect(ref wndRect,pt.x,pt.y) then
		#ParentCategory.Event OnMouseWheel(vkey,zdelta,pt.x - wndRect.left,pt.y - wndRect.top)
	end if
end if

return 0
end event

event type long onmousehwheel(unsignedlong vkey, long zdelta, real xpos, real ypos);RECTF wndRect
POINTF pt

Painter.GetCursorPos(ref pt)
Painter.GetWindowRect(#ParentRibbonBar.#Handle,ref wndRect)

if Painter.PtInRect(ref wndRect,pt.x,pt.y) then
	#ParentRibbonBar.Event OnMouseHWheel(vkey,zdelta,pt.x - wndRect.left,pt.y - wndRect.top)
elseif #ParentCategory.of_IsPopupMode() then
	Painter.GetWindowRect(#ParentCategory.of_GetHandle(),ref wndRect)
	if Painter.PtInRect(ref wndRect,pt.x,pt.y) then
		#ParentCategory.Event OnMouseHWheel(vkey,zdelta,pt.x - wndRect.left,pt.y - wndRect.top)
	end if
end if

return 0
end event

event type long onrbuttondown(unsignedlong vkey, real xpos, real ypos);if Not #Panel.of_IsEnabled() then return 0

if Not _MouseLeaveTracked then
	Event OnMouseMove(vkey,xpos,ypos)
end if

if _mouseOver then
	if _mouseOverIndex > 0 then
		_rightMouseDownIndex = _mouseOverIndex
		Items[_rightMouseDownIndex].Event OnRButtonDown(vkey,xpos,ypos)
		return 0
	end if
	#ParentRibbonBar.Event OnPanelRButtonDown(#Panel,xpos,ypos)
end if

return 0
end event

event type long onrbuttonup(unsignedlong vkey, real xpos, real ypos);if Not #Panel.of_IsEnabled() then return 0

if _rightMouseDownIndex > 0 then
	Items[_rightMouseDownIndex].Event OnRButtonUp(vkey,xpos,ypos)
	_rightMouseDownIndex = 0
	return 0
end if

_of_TrackMouseLeave(true)

#ParentRibbonBar.Event OnPanelRButtonUp(#Panel,xpos,ypos)

return 0
end event

private subroutine _of_updatepoints ();SIZEF panelSize

#Panel.Event OnMeasureItem(#Panel.DPM_LARGE,ref panelSize)
rcPaint.right = panelSize.cx
rcPaint.bottom = panelSize.cy
if theme.#RibbonStyle = theme.RBS_OFFICE2010 then
	rcPaint.bottom += 2	//加上Panel与PopupPanel对边框计算的偏差导致的子项_layoutHeight的差值
	if theme.#PanelBorderStyle <> Enums.BS_NONE then
		rcPaint.right -= 1	//减去边框的差值
	end if
end if

rcCaption = rcPaint

if szCaption.cx > 0 then
	rcCaption.top = rcCaption.bottom - szCaption.cy - 4 - 1
end if

if #Panel.#LaunchButton then
	if szCaption.cx = 0 then
		rcCaption.top = rcCaption.bottom - LAUNCHBUTTONSIZE - 4 - 1
	end if
	RECTF adjustedRect
	adjustedRect = rcPaint
	_of_AdjustRect(ref adjustedRect,ADJ_BORDER)
	LaunchBtn.rcPaint.Left = adjustedRect.right - LAUNCHBUTTONSIZE - 2
	LaunchBtn.rcPaint.Top = rcCaption.Top + (rcCaption.Bottom - rcCaption.Top - LAUNCHBUTTONSIZE) / 2
	LaunchBtn.rcPaint.Bottom = LaunchBtn.rcPaint.Top + LAUNCHBUTTONSIZE
	LaunchBtn.rcPaint.Right = LaunchBtn.rcPaint.Left + LAUNCHBUTTONSIZE
end if

_of_ReposItems()
end subroutine

private subroutine _of_repositems ();//Repos items
int index
real colPos
real xpos,ypos
real xmargin,ymargin
Uint itemDPMode
RECTF layoutRect,newItemRect
SIZEF itemSize

layoutRect = rcPaint
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)
xpos = layoutRect.left
ypos = layoutRect.top
colPos = xpos
#Panel.of_GetLargeItemMargin(ref XMargin,YMargin)

for index = 1 to UpperBound(Items)
	if Not Items[index].#Visible then continue
	if Items[index].#Type = Items[index].ITT_BREAK then
		xpos = colPos + XMargin
		ypos = layoutRect.top
	else
		if Items[index].#AlwaysLargeMode and Items[index].of_HasLargeMode() then
			itemDPMode = Items[index].DPM_LARGE
		else
			if Items[index].of_HasLargeMode() then
				itemDPMode = Items[index].DPM_LARGE
			elseif Items[index].of_HasIntermediateMode() then
				itemDPMode = Items[index].DPM_INTERMEDIATE
			else
				itemDPMode = Items[index].DPM_COMPACT
			end if
		end if
		Items[index].Event OnMeasureItem(itemDPMode,ref itemSize)
		if itemSize.cx = 0 and itemSize.cy = 0 then
			newItemRect.left = xpos
			newItemRect.top = ypos
			Items[index].Event OnReposition(itemDPMode,ref newItemRect)
			continue
		end if
		if ypos <> layoutRect.top and ypos + itemSize.cy > layoutRect.bottom then
			xpos = colPos + XMargin
			ypos = layoutRect.top
		end if
		newItemRect.left = xpos
		newItemRect.top = ypos
		Items[index].Event OnReposition(itemDPMode,ref newItemRect)
		if colPos < newItemRect.right then
			colPos = newItemRect.right
		end if
		ypos = newItemRect.bottom + YMargin
	end if
next
end subroutine

private subroutine _of_drawlaunchbutton (unsignedlong hdc);ulong borderColor,bkColor,nState

if Not #Panel.#LaunchButton then return

nState = of_GetLaunchButtonState()
bkColor	= theme.of_GetPanelColor(#Panel,theme.CLR_LAUNCHBTNBKGND,nState)
borderColor	= theme.of_GetPanelColor(#Panel,theme.CLR_LAUNCHBTNBORDER,nState)

//Fill background
if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
	Painter.ThemeFill(hdc,LaunchBtn.rcPaint,bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
											theme.#ItemBorderStyle,borderColor,theme.#ItemRoundSize)
end if

//Draw launch icon
if LaunchBtn.MouseDown then
	_LaunchImageList.Draw(1,hdc,&
							LaunchBtn.rcPaint.Left + (LaunchBtn.rcPaint.Right - LaunchBtn.rcPaint.Left - 8) / 2 ,&
							LaunchBtn.rcPaint.Top + (LaunchBtn.rcPaint.Bottom - LaunchBtn.rcPaint.Top - 8) / 2 + 1,&
							Not #Panel.of_IsEnabled())
else
	_LaunchImageList.Draw(1,hdc,&
							LaunchBtn.rcPaint.Left + (LaunchBtn.rcPaint.Right - LaunchBtn.rcPaint.Left - 8) / 2 ,&
							LaunchBtn.rcPaint.Top + (LaunchBtn.rcPaint.Bottom - LaunchBtn.rcPaint.Top - 8) / 2,&
							Not #Panel.of_IsEnabled())
end if
end subroutine

public function unsignedlong of_getsafedc ();ulong safeDC
RECTF paintRect

if #Panel.of_IsLockUpdate() then return 0
if Not #Panel.of_IsVisible() then return 0

paintRect = rcPaint
_of_AdjustRect(ref paintRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)

safeDC = GetSafeDC()

Painter.IntersectClipRect(safeDC,paintRect)

return safeDC
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation);if FadeAnimation then
	return of_ReleaseDC(hdc,hrgn,#ParentRibbonBar.#FadeTime)
else
	return of_ReleaseDC(hdc,hrgn,0)
end if
end function

private subroutine _of_fillbkgnd (readonly unsignedlong hdc);ulong bkColor,bkColor2,borderColor,transparentColor,nState
RADIUSF rdBorder,rdHalfBorder
RECTF paintRect

nState = of_GetState()
borderColor = theme.of_GetPanelColor(#Panel,theme.CLR_BORDER,nState)

/*Fill category background*/
bkColor = theme.of_GetCategoryColor(#ParentCategory,theme.CLR_BKGND,0)
transparentColor = theme.of_GetCategoryColor(#ParentCategory,theme.CLR_TRANSPARENT,0)

//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, rcPaint, transparentColor, false,0) 
end if

Painter.ThemeFill(hdc,rcPaint,bkColor,theme.#BkgndOrientation,theme.#BkgndStyle,nState,false,Enums.BS_NONE,0,0)
/*if theme.#RibbonStyle = theme.RBS_OFFICE2010 then
	bkColor = ToARGB(100,ToRGB(theme.of_GetPanelColor(#Panel,theme.CLR_CAPTIONBKGND)))
	Painter.FillRect( hdc, rcPaint.left,rcPaint.bottom - 10,rcPaint.right,rcPaint.bottom,  0,  bkColor,Enums.VERT,false,false,0) 
end if*/
/*------------*/

bkColor = theme.of_GetPanelColor(#Panel,theme.CLR_BKGND,nState)

if theme.#RibbonStyle = theme.RBS_OFFICE2007 then
	rdBorder = theme.#PanelRoundSize
	if  szCaption.cx = 0 then
		Painter.ThemeFill( hdc, rcPaint, bkColor, Enums.VERT, theme.#PanelBkgndStyle,nState, false, theme.#PanelBorderStyle,borderColor,rdBorder)
	else
		rdHalfBorder.leftTop = rdBorder.leftTop
		rdHalfBorder.rightTop = rdBorder.rightTop
		paintRect = rcPaint
		paintRect.bottom = rcCaption.top
		Painter.ThemeFill( hdc, paintRect, bkColor, Enums.VERT, theme.#PanelBkgndStyle,nState, false, theme.#PanelBorderStyle,0,rdHalfBorder)
		
		bkColor = theme.of_GetPanelColor(#Panel,theme.CLR_CAPTIONBKGND,nState)
		rdHalfBorder.leftTop = 0
		rdHalfBorder.rightTop = 0
		rdHalfBorder.leftBottom = rdBorder.leftBottom
		rdHalfBorder.rightBottom = rdBorder.rightBottom
		Painter.ThemeFill( hdc, rcCaption, bkColor, Enums.VERT, Enums.SOLID,nState, false, theme.#PanelBorderStyle,bkColor,rdHalfBorder)
		Painter.DrawThemeBorder( hdc, rcPaint, borderColor,theme.#PanelBkgndStyle, theme.#PanelBorderStyle,rdBorder)
	end if
elseif theme.#RibbonStyle = theme.RBS_OFFICE2010 then
	if  _MouseOver then
		bkColor = ToARGB(100,ToRGB(bkColor))
		Painter.FillRect( hdc, rcPaint.left,rcPaint.bottom - 20,rcPaint.right,rcPaint.bottom,  0,  bkColor,Enums.VERT,false,false,0)
	end if
	if theme.#PanelBorderStyle <> Enums.BS_NONE then
		Painter.of_DrawRect(hdc,rcPaint,borderColor,Enums.LS_SOLID,1)
	end if
end if
end subroutine

private subroutine _of_drawcaption (unsignedlong hdc);ulong textColor
ulong dtparam
RECTF rcTitle

textColor	= theme.of_GetPanelColor(#Panel,theme.CLR_TEXT,of_GetState())

dtparam = Painter.DT_EXPANDTABS + Painter.DT_HIDEPREFIX
dtparam += Painter.DT_SINGLELINE + Painter.DT_WORD_ELLIPSIS
dtparam += Painter.DT_VCENTER
dtparam += Painter.DT_CENTER

if #Panel.#LaunchButton then
	rcTitle = rcCaption
	rcTitle.right -= LAUNCHICONSIZE + 4 + 2
	Painter.of_Drawtext(hdc,#Panel.Font,#Panel.#Caption,rcTitle,textColor,dtparam)
else
	Painter.of_Drawtext(hdc,#Panel.Font,#Panel.#Caption,rcCaption,textColor,dtparam)
end if
end subroutine

private subroutine _of_capturemouse (readonly boolean capture);_MouseCaptured = capture
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

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime);if hdc = 0 then return false

Painter.SelectClipRgn(hdc,0)

return ReleaseDC(hdc,hrgn,FadeTime)
end function

private subroutine _of_drawlaunchbutton (readonly boolean fadeanimation);ulong safeDC

if #ParentCategory.#LockUpdate then return
if Not #Panel.of_IsVisible() then return
if Not #Panel.#LaunchButton then return

safeDC=GetSafeDC()

if safeDC > 0 then
	
	Painter.IntersectClipRect(safeDC,LaunchBtn.rcPaint)
	
	Event OnEraseBkgnd(safeDC)
	_of_DrawLaunchButton(safeDC)
	
	Painter.SelectClipRgn(safeDC,0)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(LaunchBtn.rcPaint)
	
	of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
end if
end subroutine

private subroutine _of_showlaunchtip (boolean show);RECTF scRect
POINTF pt
SIZEF toolSize

if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _MouseCaptured then return

if #ParentRibbonBar.#ToolTip and Show then
	if #Panel.#LaunchTipText <> "" then
		Painter.GetScreenRect(ref scRect)
		Painter.GetCursorPos(ref pt)
		_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,false)
		_ToolTip.UpdateTipText(#ParentRibbonBar.#Handle,_TTID,#Panel.#LaunchTipText)
		_ToolTip.GetBubbleSize(#ParentRibbonBar.#Handle,_TTID,ref toolSize.cx,ref toolSize.cy)
		if pt.x + toolSize.cx  > scRect.right then
			_ToolTip.TrackPosition( 0,scRect.right -  toolSize.cx,pt.y + 16)
		else
			_ToolTip.TrackPosition( 0,pt.x,pt.y + 16)
		end if
		_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,true)
	else
		_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,false)	
	end if
else
	_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,false)
end if
end subroutine

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC

if Not IsPopupMode() then return RetCode.FAILED
if #Panel.of_IsLockUpdate() then return RetCode.FAILED
if Not #Panel.of_IsVisible() then return RetCode.OK

safeDC = GetSafeDC()

if safeDC > 0 then
	Event OnPaint(safeDC)

	of_ReleaseDC(safeDC,0,FadeAnimation)
end if

return RetCode.OK
end function

public function unsignedlong of_getstate ();ulong nState

if _MouseOver then nState += Enums.STATE_HOVER

return nState
end function

public function unsignedlong of_getlaunchbuttonstate ();ulong nState

if LaunchBtn.MouseOver then nState += Enums.STATE_HOVER
if LaunchBtn.MouseDown then nState += Enums.STATE_PRESSED

return nState
end function

public subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if BitAND(flags,ADJ_BORDER) > 0 then
	if theme.#PanelBorderStyle <> Enums.BS_NONE then
		fBorderSize = P2DX(1)
		Painter.InflateRect(ref adjRect,-fBorderSize,-fBorderSize)
	end if
end if

if BitAND(flags,ADJ_BORDERMARGIN) > 0 then
	adjRect.left += #Panel.#BorderMargin.left
	adjRect.top += #Panel.#BorderMargin.top
	adjRect.right -= #Panel.#BorderMargin.right
	adjRect.bottom -= #Panel.#BorderMargin.bottom
end if

if BitAND(flags,ADJ_CAPTION) > 0 then
	if szCaption.cy > 0 then
		adjRect.bottom -= szCaption.cy + 4 //rcCaption.bottom - rcCaption.top
	elseif #Panel.#LaunchButton then
		adjRect.bottom -= LAUNCHBUTTONSIZE + 4 //rcCaption.bottom - rcCaption.top
	end if
end if
end subroutine

public function long of_scroll (readonly real scrollsize);RECTF wndRect,paintRect
RECTF scRect
POINTF pt

if Not IsPopupMode() then return RetCode.FAILED

Painter.GetScreenRect(ref scRect)
Painter.GetWindowRect(#ParentCategory.of_GetHandle(),ref wndRect)

#Panel.of_GetPaintRect(ref paintRect)
pt.x = paintRect.left
pt.y = paintRect.bottom
Painter.ClientToScreen(#ParentCategory.of_GetHandle(),ref pt)

if pt.x < wndRect.left + 2 then
	pt.x = wndRect.left + 2
elseif pt.x > wndRect.right - 2 then
	pt.x = wndRect.right - 2
end if

if pt.x + rcPaint.right > scRect.right - 2 then
	pt.x = scRect.right - rcPaint.right - 2
elseif pt.x < scRect.left + 2 then
	pt.x = scRect.left + 2
end if

Win32.SetWindowPos(GetHandle(),0,D2PX(pt.x),D2PY(pt.y),0,0,&
							Win32.SWP_NOZORDER + Win32.SWP_NOACTIVATE + Win32.SWP_NOSIZE)

return RetCode.OK
end function

public function integer of_indexfrompoint (real xpos, real ypos);int index

if Not #Panel.of_IsEnabled() then return 0
if Not Painter.PtInRect(rcPaint,xpos,ypos) then return 0

if #Panel.#LaunchButton then
	if Painter.PtInRect(LaunchBtn.rcPaint,xpos,ypos) then
		return #Panel.IDX_LAUNCHBTN
	end if
end if

if _mouseOverIndex > 0 then
	if Items[_mouseOverIndex].#Visible and Items[_mouseOverIndex].#Enabled then
		if Items[_mouseOverIndex].Event OnHitTest(xpos,ypos) <> HTNOWHERE then
			return _mouseOverIndex
		end if
	end if
end if

for index = 1 to UpperBound(Items)
	if index = _mouseOverIndex then continue
	if Items[index].#Type = Items[index].ITT_SPACE or Items[index].#Type = Items[index].ITT_BREAK then continue
	if Not Items[index].#Visible or Not Items[index].#Enabled then continue
	if Items[index].Event OnHitTest(xpos,ypos) <> HTNOWHERE then
		return index
	end if
next

return 0
end function

public function unsignedlong of_popup (readonly real xpos, readonly real ypos);RECTF wndRect
POINTF pt

Painter.GetWindowRect(#ParentCategory.of_GetHandle(),ref wndRect)

pt.x = xpos
pt.y = ypos
Painter.ClientToScreen(#ParentCategory.of_GetHandle(),ref pt)

if pt.x < wndRect.left + 2 then
	pt.x = wndRect.left + 2
elseif pt.x > wndRect.right - 2 then
	pt.x = wndRect.right - 2
end if

#FadeAnimation 	= #ParentRibbonBar.#FadeAnimation
#FadeTime 			= #ParentRibbonBar.#FadeTime

return PopupEx(0,pt.x,pt.y,rcPaint.right,rcPaint.bottom,false,Win32.TPM_LEFTALIGN + Win32.TPM_TOPALIGN + Win32.TPM_WORKAREA)
end function

on n_cst_ribbonbar_popuppanel.create
call super::create
end on

on n_cst_ribbonbar_popuppanel.destroy
call super::destroy
end on

event onpopup;call super::onpopup;_MouseIdle = false

if Not Popup then
	Event OnMouseLeave()
end if

return #Panel.Event OnPopup(popup)
end event

event oninitpopup;call super::oninitpopup;if Not IsValidObject(#Panel) then return 1

return #Panel.Event OnInitPopup(ref xpos,ref ypos,ref width,ref height)
end event

event onuninitpopup;call super::onuninitpopup;return #Panel.Event OnUninitPopup(exitcode,force)
end event

