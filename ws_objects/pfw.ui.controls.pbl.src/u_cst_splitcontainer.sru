$PBExportHeader$u_cst_splitcontainer.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_splitcontainer from u_cst_canvas
end type
type theme from n_cst_splitcontainer_theme within u_cst_splitcontainer
end type
end forward

global type u_cst_splitcontainer from u_cst_canvas
boolean #fadeanimation = true
event onmouseleave ( )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onwindowsize ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event oncapturechanged ( )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event type long onpaint ( unsignedlong hdc )
event type long onerasebkgnd ( unsignedlong hdc )
event onpanelcollapsed ( n_cst_splitcontainer_panel panel )
event type long onpanelcollapsing ( n_cst_splitcontainer_panel panel )
event onpanelexpanded ( n_cst_splitcontainer_panel panel )
event type long onpanelexpanding ( n_cst_splitcontainer_panel panel )
event onsplitbarmoved ( n_cst_splitcontainer splitcontainer,  real movesize )
event type long onsplitbarbeginmove ( n_cst_splitcontainer splitcontainer )
event onsplitbarendmove ( n_cst_splitcontainer splitcontainer )
event ongetpanelcolor ( n_cst_splitcontainer_panel panel,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
theme theme
end type
global u_cst_splitcontainer u_cst_splitcontainer

type variables
/*--- Constants ---*/
Public:
//SaveLayout/LoadLayout/ResetLayout flags
Constant Long LAY_ORIENTATION 		= 1
Constant Long LAY_SPLITBAR			 	= 2
Constant Long LAY_PANELCOLLAPSED	= 4
Constant Long LAY_PANELVISIBLE			= 8

/*--- Properties ---*/
Public:
PrivateWrite n_cst_splitcontainer_panel	Panel1
PrivateWrite n_cst_splitcontainer_panel	Panel2
PrivateWrite Uint								#Orientation			= Enums.VERT
PrivateWrite Real								#SplitBarSize			= 4					//dip
PrivateWrite Boolean							#AttachMode			= false
Boolean											#SplitBarDragable		= true
Boolean											#TrackMouseResize	= true
Boolean											#ToolTip 				= false

/*--- Implementation ---*/
Private:
n_cst_splitcontainer 				_SplitContainer
n_cst_splitcontainer_template 	_template
n_tooltip 								_ToolTip
RECTF								rcClient
RECTF								rcRelative

Boolean _MouseLeaveTracked 	= false

//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
end variables

forward prototypes
private subroutine _of_trackmouseleave (readonly boolean track)
public function long of_updatepoints ()
public function long of_setorientation (readonly unsignedinteger orientation)
public function long of_redraw (readonly boolean fadeanimation)
public function integer of_getobjectcount ()
public function string of_savelayout (readonly long flags)
public function string of_savelayout ()
public function long of_loadlayout (readonly string slayoutinfo)
public function long of_resetlayout (readonly long flags)
public function long of_resetlayout ()
public function unsignedlong of_getsafedc ()
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime)
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation)
public function long of_reset ()
public function long of_findpanelbyobject (readonly dragobject object, ref n_cst_splitcontainer_panel panel)
public function long of_findpanelbytitle (readonly string title, ref n_cst_splitcontainer_panel panel)
public function long of_findpanelbytag (readonly string stag, ref n_cst_splitcontainer_panel panel)
public function long of_templatebegin (readonly string template)
public function long of_templateend ()
public function long of_templatebind (readonly dragobject obj, readonly string name)
public function long of_setattachmode (readonly boolean attachmode)
private subroutine _of_refreshrelativerect ()
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
public function long of_getrelativewindowrect (ref rectf rcrel)
public function long of_getclientrect (ref rectf clirect)
public function real of_getsplitteroffsetsize ()
public function long of_setsplitteroffsetsize (readonly real offsetsize)
public function long of_setsplitbarsize (readonly real size)
public function long of_templatebind (readonly dragobject obj, readonly string name, readonly double w, readonly double h)
public function long of_templatebind (readonly dragobject obj, readonly string name, readonly boolean bvisible)
public function long of_templatebind (readonly dragobject obj, readonly string name, readonly boolean bvisible, readonly double w, readonly double h)
end prototypes

event onmouseleave();_of_TrackMouseLeave(false)

_SplitContainer.Event OnMouseLeave()
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);if Not _MouseLeaveTracked then
	_of_TrackMouseLeave(true)
end if

return _SplitContainer.Event OnMouseMove(vkey,xpos,ypos)
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);if Not _MouseLeaveTracked  then
	Event	OnMouseMove(vkey,xpos,ypos)
end if
return _SplitContainer.Event OnLButtonDown(vkey,xpos,ypos)
end event

event type long onwindowsize(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);ulong hdwp
RECTF adjustedRect

rcClient.right = newWidth
rcClient.bottom = newHeight

adjustedRect = rcClient

_of_RefreshRelativeRect()

_of_AdjustRect(ref adjustedRect,ADJ_BORDER + ADJ_BORDERMARGIN)

hdwp = Win32.BeginDeferWindowPos(_SplitContainer.of_GetObjectCount())

_SplitContainer.Event OnReposition(ref hdwp,ref adjustedRect)
_SplitContainer.Event OnCheckHiddenStatus()

Win32.EndDeferWindowPos(hdwp)

return 0
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);if Not _MouseLeaveTracked  then
	Event	OnMouseMove(vkey,xpos,ypos)
end if
return _SplitContainer.Event OnLButtonDBLClk(vkey,xpos,ypos)
end event

event oncapturechanged();_SplitContainer.Event OnCaptureChanged()
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);_SplitContainer.Event OnLButtonUp(vkey,xpos,ypos)
_of_TrackMouseLeave(true)
return 0
end event

event type long onpaint(unsignedlong hdc);RECT cliRect

if #LockUpdate then return 1
if Not IsValid(_SplitContainer) then return 1

Event OnEraseBkgnd(hdc)

return _SplitContainer.Event OnPaint(hdc)
end event

event type long onerasebkgnd(unsignedlong hdc);ulong transparentColor

transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,0)
//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, rcClient,  transparentColor,false,0) 
end if

Painter.ThemeFill( hdc, rcClient, theme.of_GetColor(theme.CLR_BKGND,0),theme.#BkgndOrientation,theme.#BkgndStyle,0,false,&
										theme.#BorderStyle,theme.of_GetColor(theme.CLR_BORDER,0),theme.#RoundSize)

return 1
end event

private subroutine _of_trackmouseleave (readonly boolean track);TRACKMOUSEEVENT tme

if _MouseLeaveTracked = track then return

_MouseLeaveTracked = track

tme.cbsize = 16
tme.dwflags = Win32.TME_LEAVE
tme.hwndtrack = #Handle
tme.dwhovertime = 0

if Not track then
	tme.dwflags += Win32.TME_CANCEL
end if

Win32.TrackMouseEvent(tme)
end subroutine

public function long of_updatepoints ();_of_RefreshRelativeRect()
return _SplitContainer.of_UpdatePoints()
end function

public function long of_setorientation (readonly unsignedinteger orientation);if IsSucceeded(_SplitContainer.of_SetOrientation(orientation)) then
	#Orientation = orientation
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_redraw (readonly boolean fadeanimation);return _SplitContainer.of_Redraw(fadeAnimation)
end function

public function integer of_getobjectcount ();return _SplitContainer.of_GetObjectCount()
end function

public function string of_savelayout (readonly long flags);return _SplitContainer.of_SaveLayout(flags)
end function

public function string of_savelayout ();return _SplitContainer.of_SaveLayout()
end function

public function long of_loadlayout (readonly string slayoutinfo);return _SplitContainer.of_LoadLayout(sLayoutInfo)
end function

public function long of_resetlayout (readonly long flags);return _SplitContainer.of_ResetLayout(flags)
end function

public function long of_resetlayout ();return _SplitContainer.of_ResetLayout()
end function

public function unsignedlong of_getsafedc ();//由子对象调用
ulong safeDC
RECTF adjustedRect

if #LockUpdate then return 0

safeDC = GetSafeDC()

if safeDC > 0 then
	adjustedRect = rcClient
	_of_AdjustRect(ref adjustedRect,ADJ_BORDER)
	Painter.IntersectClipRect(safeDC,adjustedRect)
end if

return safeDC
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime);if hdc = 0 then return false

Painter.SelectClipRgn(hdc,0)

return ReleaseDC(hdc,hrgn,FadeTime)
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation);if FadeAnimation then
	return of_ReleaseDC(hdc,hrgn,#FadeTime)
else
	return of_ReleaseDC(hdc,hrgn,0)
end if
end function

public function long of_reset ();n_cst_splitcontainer_panel nullPanel

Destroy _SplitContainer

_SplitContainer = Create n_cst_splitcontainer 
_SplitContainer.Event OnInit(this,nullPanel,_ToolTip)
_SplitContainer.Event OnInitData(#Orientation)

Panel1 = _SplitContainer.Panel1
Panel2 = _SplitContainer.Panel2
#Orientation = _SplitContainer.#Orientation
#SplitBarSize = _SplitContainer.#SplitBarSize

Event OnWindowSize(true,true,rcClient.right,rcClient.bottom)

return RetCode.OK
end function

public function long of_findpanelbyobject (readonly dragobject object, ref n_cst_splitcontainer_panel panel);return _SplitContainer.of_FindPanelByObject(object,ref panel)
end function

public function long of_findpanelbytitle (readonly string title, ref n_cst_splitcontainer_panel panel);return _SplitContainer.of_FindPanelByTitle(title,ref panel)
end function

public function long of_findpanelbytag (readonly string stag, ref n_cst_splitcontainer_panel panel);return _SplitContainer.of_FindPanelByTag(sTag,ref panel)
end function

public function long of_templatebegin (readonly string template);if IsValidObject(_template) then return RetCode.FAILED
if Panel1.of_HasObject( ) or Panel1.of_HasSplitContainer() or Panel2.of_HasObject() or Panel2.of_HasSplitContainer() then return RetCode.FAILED

_template = Create n_cst_splitcontainer_template
_template.Event OnInit(this)

if IsFailed(_template.of_Begin(template)) then
	Destroy _template
	return RetCode.FAILED
end if

return RetCode.OK
end function

public function long of_templateend ();long rtCode

if Not IsValidObject(_template) then return RetCode.FAILED

rtCode = _template.of_End()

Destroy _template

return rtCode
end function

public function long of_templatebind (readonly dragobject obj, readonly string name);if Not IsValidObject(_template) then return RetCode.FAILED

return _template.of_Bind(obj,name)
end function

public function long of_setattachmode (readonly boolean attachmode);if #AttachMode = attachMode then return RetCode.OK
if of_GetObjectCount() > 0 then return RetCode.E_ACCESS_DENIED

#AttachMode = attachMode
_of_RefreshRelativeRect()

return RetCode.OK
end function

private subroutine _of_refreshrelativerect ();ulong hWndParent
RECTF rcParent

if Not #AttachMode then return

hWndParent = Win32.GetParent(#Handle)
Painter.GetClientRect(hWndParent,ref rcParent)
Painter.ClientToScreen(hWndParent,ref rcParent)
Painter.GetWindowRect(#Handle,ref rcRelative)
Painter.OffsetRect(ref rcRelative,-rcParent.left,-rcParent.top)
end subroutine

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if BitAND(flags,ADJ_BORDER) > 0 then
	fBorderSize = P2DY(1)
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

public function long of_getrelativewindowrect (ref rectf rcrel);rcRel = rcRelative
return RetCode.OK
end function

public function long of_getclientrect (ref rectf clirect);cliRect = rcClient

_of_AdjustRect(ref cliRect,ADJ_BORDER + ADJ_BORDERMARGIN)

return 0
end function

public function real of_getsplitteroffsetsize ();return _SplitContainer.of_GetSplitterOffsetSize()
end function

public function long of_setsplitteroffsetsize (readonly real offsetsize);return _SplitContainer.of_SetSplitterOffsetSize(offsetSize)
end function

public function long of_setsplitbarsize (readonly real size);if IsSucceeded(_SplitContainer.of_SetSplitBarSize(size)) then
	#SplitBarSize = size
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_templatebind (readonly dragobject obj, readonly string name, readonly double w, readonly double h);if Not IsValidObject(_template) then return RetCode.FAILED

return _template.of_Bind(obj,name,w,h)
end function

public function long of_templatebind (readonly dragobject obj, readonly string name, readonly boolean bvisible);if Not IsValidObject(_template) then return RetCode.FAILED

return _template.of_Bind(obj,name,bVisible)
end function

public function long of_templatebind (readonly dragobject obj, readonly string name, readonly boolean bvisible, readonly double w, readonly double h);if Not IsValidObject(_template) then return RetCode.FAILED

return _template.of_Bind(obj,name,bVisible,w,h)
end function

on u_cst_splitcontainer.create
call super::create
this.theme=create theme
end on

on u_cst_splitcontainer.destroy
call super::destroy
destroy(this.theme)
end on

event oninit;call super::oninit;n_cst_splitcontainer_panel nullPanel

_ToolTip = Create n_tooltip
_ToolTip.CreateToolTip(#Handle)

_SplitContainer = Create n_cst_splitcontainer 
_SplitContainer.Event OnInit(this,nullPanel,_ToolTip)
_SplitContainer.Event OnInitData(#Orientation)

Panel1 = _SplitContainer.Panel1
Panel2 = _SplitContainer.Panel2

Painter.GetClientRect(#Handle,ref rcClient)

Event OnWindowSize(true,true,rcClient.right,rcClient.bottom)
end event

event onuninit;call super::onuninit;Destroy _SplitContainer
Destroy _ToolTip

if IsValidObject(_template) then
	Destroy _template
end if
end event

type uo_logo from u_cst_canvas`uo_logo within u_cst_splitcontainer
string tag = "SplitContainer"
end type

type theme from n_cst_splitcontainer_theme within u_cst_splitcontainer descriptor "pb_nvo" = "true" 
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
		dirty = true
	case EVT_BORDERSTYLE
		dirty = true
	case EVT_BORDERMARGIN
		dirty = true
	case EVT_TITLEBARBORDERSTYLE
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

event ongetpanelcolor;call super::ongetpanelcolor;Parent.Event OnGetPanelColor(panel,colorFlag,state,ref color)
end event

