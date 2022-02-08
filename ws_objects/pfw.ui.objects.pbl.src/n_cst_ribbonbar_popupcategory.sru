$PBExportHeader$n_cst_ribbonbar_popupcategory.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_ribbonbar_popupcategory from n_cst_popupcanvas
end type
end forward

global type n_cst_ribbonbar_popupcategory from n_cst_popupcanvas
boolean #bordershadow = true
event oninit ( u_cst_ribbonbar parentribbonbar )
event type long onpaint ( unsignedlong hdc )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event onmouseleave ( )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event onthemechanged ( unsignedinteger eventflag )
event onsetcategory ( n_cst_ribbonbar_category category )
event oncapturechanged ( )
event type long onmousehover ( unsignedlong vkey,  real xpos,  real ypos )
event type long onmousehwheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event type long onmousewheel ( unsignedlong vkey,  long zdelta,  real xpos,  real ypos )
event type long onrbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onrbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
end type
global n_cst_ribbonbar_popupcategory n_cst_ribbonbar_popupcategory

type variables
/*--- Properties ---*/
Public:
PrivateWrite u_cst_ribbonbar				#ParentRibbonBar
PrivateWrite n_cst_ribbonbar_category	#Category

/*--- Implementation ---*/
Private:
n_cst_ribbonbar_theme		theme

Boolean _MouseOverCategory
Boolean _MouseIdle
end variables

forward prototypes
public function unsignedlong of_getsafedc ()
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation)
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime)
public function boolean closepopup (readonly unsignedlong exitcode, readonly boolean fadeanimation)
public function long of_redraw (readonly boolean fadeanimation)
public function unsignedlong of_popup (real xpos, real ypos)
end prototypes

event oninit(u_cst_ribbonbar parentribbonbar);#ParentRibbonBar = parentribbonbar
theme	= #ParentRibbonBar.theme
end event

event type long onpaint(unsignedlong hdc);#ParentRibbonBar.Event OnEraseBkgnd(hdc)

return #Category.Event OnPaint(hdc)
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if #Category.#Enabled then
	return #Category.Event OnLButtonUp(vkey,xpos,ypos)
end if
return 0
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);int index
RECTF wndRect
POINTF pt
Constant uint 	HTSCROLLBARLEFT	= 101
Constant uint 	HTSCROLLBARRIGHT	= 102

Painter.GetWindowRect(#ParentRibbonBar.#Handle,ref wndRect)
Painter.GetCursorPos(ref pt)
if Painter.PtInRect(ref wndRect,pt.x,pt.y) then
	xpos = pt.x - wndRect.left
	ypos = pt.y - wndRect.top
	index = #ParentRibbonBar.of_IndexFromPoint(xpos,ypos)
	if index > 0 and index <> #ParentRibbonBar.of_GetSelectedIndex() then
		#ParentRibbonBar.of_Select(index)
		return 1
	elseif index = #ParentRibbonBar.IDX_SCROLLBARLEFT or index = #ParentRibbonBar.IDX_SCROLLBARRIGHT then
		if index = #ParentRibbonBar.IDX_SCROLLBARLEFT then
			#ParentRibbonBar.Event OnNcLButtonDown(HTSCROLLBARLEFT,xpos,ypos)
		else
			#ParentRibbonBar.Event OnNcLButtonDown(HTSCROLLBARRIGHT,xpos,ypos)
		end if
		return 1
	else
/*		if index > 0 or index = #ParentRibbonBar.IDX_CHEVRON then
			ClosePopup(0,true)
		end if*/
		return 0
	end if
elseif #Category.#Enabled then
	Painter.GetWindowRect(GetHandle(),ref wndRect)
	if Painter.PtInRect(ref wndRect,pt.x,pt.y) then
		return #Category.Event OnLButtonDown(vkey,xpos,ypos)
	end if
end if

return 0
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);RECTF wndRect
POINTF pt

Painter.GetWindowRect(GetHandle(),ref wndRect)
Painter.GetCursorPos(ref pt)
if Painter.PtInRect(ref wndRect,pt.x,pt.y) then
	if #Category.#Enabled then
		return #Category.Event OnLButtonDBLClk(vkey,xpos,ypos)
	end if
else
	return Event OnLButtonDown(vkey,xpos,ypos)
end if

return 0
end event

event Onmouseleave();#Category.Event OnMouseLeave()
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);RECTF cliRect

Painter.GetClientRect(GetHandle(),ref cliRect)

if Painter.PtInRect(ref cliRect,xpos,ypos) then
	if _MouseIdle then
		_MouseIdle = false
		#ParentRibbonBar.Event OnPopupKickIdle(0)
	end if
	if #Category.#Enabled then
		_MouseOverCategory = true
		return #Category.Event OnMouseMove(vkey,xpos,ypos)
	end if
else
	if _MouseOverCategory then
		_MouseOverCategory = false
		#Category.Event OnMouseLeave()
	end if
	if Not _MouseIdle then
		_MouseIdle = true
		#ParentRibbonBar.Event OnPopupEnterIdle(0)
	else
		#ParentRibbonBar.Event OnPopupIdle(0)
	end if
end if

return 0
end event

event onthemechanged(unsignedinteger eventflag);of_Redraw(true)
end event

event onsetcategory(n_cst_ribbonbar_category category);if Not IsValidObject(category) then return

if #Category = category then
	if Not #Category.of_IsPopupMode() then
		#Category.Event OnPopup(true)
	end if
else
	if IsValidObject(#Category) then
		if #Category.of_IsPopupMode() then
			#Category.Event OnPopup(false)
		end if
	end if
	#Category = category
	if Not #Category.of_IsPopupMode() then
		#Category.Event OnPopup(true)
	end if
	of_Redraw(false)
end if
end event

event Oncapturechanged();#Category.Event OnCaptureChanged()
end event

event type long onmousehover(unsignedlong vkey, real xpos, real ypos);return #Category.Event OnMouseHover(vkey,xpos,ypos)
end event

event type long onmousehwheel(unsignedlong vkey, long zdelta, real xpos, real ypos);RECTF wndRect
POINTF pt

Painter.GetCursorPos(ref pt)
Painter.GetWindowRect(#ParentRibbonBar.#Handle,ref wndRect)

if Painter.PtInRect(ref wndRect,pt.x,pt.y) then
	return #ParentRibbonBar.Event OnMouseHWheel(vkey,zdelta,pt.x - wndRect.left,pt.y - wndRect.top)
else
	Painter.GetWindowRect(GetHandle(),ref wndRect)
	if Painter.PtInRect(ref wndRect,pt.x,pt.y) then
		return #Category.Event OnMouseHWheel(vkey,zdelta,pt.x - wndRect.left,pt.y - wndRect.top)
	end if
end if

return 0
end event

event type long onmousewheel(unsignedlong vkey, long zdelta, real xpos, real ypos);RECTF wndRect
POINTF pt

Painter.GetCursorPos(ref pt)
Painter.GetWindowRect(#ParentRibbonBar.#Handle,ref wndRect)

if Painter.PtInRect(ref wndRect,pt.x,pt.y) then
	return #ParentRibbonBar.Event OnMouseWheel(vkey,zdelta,pt.x - wndRect.left,pt.y - wndRect.top)
else
	Painter.GetWindowRect(GetHandle(),ref wndRect)
	if Painter.PtInRect(ref wndRect,pt.x,pt.y) then
		return #Category.Event OnMouseWheel(vkey,zdelta,pt.x - wndRect.left,pt.y - wndRect.top)
	end if
end if

return 0
end event

event type long onrbuttondown(unsignedlong vkey, real xpos, real ypos);RECTF wndRect
POINTF pt

Painter.GetCursorPos(ref pt)

if #Category.#Enabled then
	Painter.GetWindowRect(GetHandle(),ref wndRect)
	if Painter.PtInRect(ref wndRect,pt.x,pt.y) then
		return #Category.Event OnRButtonDown(vkey,xpos,ypos)
	end if
end if

return 0
end event

event type long onrbuttonup(unsignedlong vkey, real xpos, real ypos);if #Category.#Enabled then
	return #Category.Event OnRButtonUp(vkey,xpos,ypos)
end if
return 0
end event

public function unsignedlong of_getsafedc ();if #Category.#LockUpdate then return 0
if Not #Category.of_IsVisible() then return 0

return GetSafeDC()
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation);if FadeAnimation then
	return of_ReleaseDC(hdc,hrgn,#ParentRibbonBar.#FadeTime)
else
	return of_ReleaseDC(hdc,hrgn,0)
end if
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime);if hdc = 0 then return false

Painter.SelectClipRgn(hdc,0)

return ReleaseDC(hdc,hrgn,FadeTime)
end function

public function boolean closepopup (readonly unsignedlong exitcode, readonly boolean fadeanimation);int index
n_cst_ribbonbar_panel panel

if Not IsPopupMode() then return false

for index = 1 to #Category.of_GetCount()
	if IsSucceeded(#Category.of_GetPanel(index,ref panel)) then
		if panel.of_IsPopupMode() then
			panel.of_ExitPopupMode(0)
		end if
	end if
next

return Super::ClosePopup(exitCode,fadeAnimation)
end function

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC

if Not IsPopupMode() then return RetCode.FAILED
if #Category.#LockUpdate then return RetCode.FAILED
if Not #Category.of_IsVisible() then return RetCode.OK

safeDC = GetSafeDC()

if safeDC > 0 then

	Event OnPaint(safeDC)
	
	of_ReleaseDC(safeDC,0,FadeAnimation)
	
end if

return RetCode.OK
end function

public function unsignedlong of_popup (real xpos, real ypos);RECTF paintRect

#Category.of_GetPaintRect(ref paintRect)

if theme.#BorderShadow then
	paintRect.bottom -= theme.#ShadowSize
end if

#FadeAnimation 	= #ParentRibbonBar.#FadeAnimation
#FadeTime 			= #ParentRibbonBar.#FadeTime

return Popup(#ParentRibbonBar.#Handle,xpos,ypos,paintRect.right,paintRect.bottom,false)
end function

on n_cst_ribbonbar_popupcategory.create
call super::create
end on

on n_cst_ribbonbar_popupcategory.destroy
call super::destroy
end on

event onpopup;call super::onpopup;_MouseOverCategory = false
_MouseIdle = false

return #Category.Event OnPopup(popup)
end event

event oninitpopup;call super::oninitpopup;if Not IsValidObject(#Category) then return 1

return #Category.Event OnInitPopup(ref xpos,ref ypos,ref width,ref height)
end event

event onuninitpopup;call super::onuninitpopup;return #Category.Event OnUninitPopup(exitcode,force)
end event

