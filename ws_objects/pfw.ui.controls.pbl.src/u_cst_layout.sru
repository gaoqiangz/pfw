$PBExportHeader$u_cst_layout.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_layout from u_cst_canvas
end type
type itemdata from structure within u_cst_layout
end type
type theme from n_cst_layout_theme within u_cst_layout
end type
end forward

type itemdata from structure
	dragobject		object
	boolean		isole
	boolean		objectowner
	ulong		holdparent
end type

global type u_cst_layout from u_cst_canvas
boolean #fadeanimation = true
event type long onnccalcsize ( unsignedlong lpcrect )
event type long onncpaint ( unsignedlong hdc )
theme theme
end type
global u_cst_layout u_cst_layout

type variables
/*--- Implementation ---*/
Private:
ITEMDATA Items[]

//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
end variables

forward prototypes
public function long of_removeall ()
public function integer of_addobject (ref dragobject object)
public function long of_remove (readonly integer index)
public function long of_getobject (readonly integer index, ref dragobject object)
public function integer of_getindex (readonly dragobject object)
public function integer of_addobject (readonly string clsname)
public function long of_redraw (readonly boolean fadeanimation)
public function long of_updatepoints ()
public function integer of_getcount ()
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
public function integer of_addobject (readonly string clsname, readonly real xpos, readonly real ypos, readonly real nwidth, readonly real nheight)
public function integer of_addobject (readonly string clsname, readonly real xpos, readonly real ypos)
public function integer of_addobject (ref dragobject object, readonly real xpos, readonly real ypos)
public function integer of_addobject (ref dragobject object, readonly real xpos, readonly real ypos, readonly real nwidth, readonly real nheight)
end prototypes

event type long onnccalcsize(unsignedlong lpcrect);RECTF cRect

Painter.CopyRect(ref cRect,lpcRect)

_of_AdjustRect(ref cRect,ADJ_BORDER + ADJ_BORDERMARGIN)

Painter.CopyRect(lpcRect,ref cRect)

return 0
end event

event type long onncpaint(unsignedlong hdc);Ulong bkColor,borderColor,transparentColor
RECTF rcWnd

Painter.GetWindowRect(#Handle,ref rcWnd)
Painter.OffsetRect(ref rcWnd,-rcWnd.left,-rcWnd.top)

transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,0)
//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, rcWnd,  transparentColor,false,0) 
end if

bkColor = theme.of_GetColor(theme.CLR_BKGND,0)
borderColor = theme.of_GetColor(theme.CLR_BORDER,0)

Painter.ThemeFill( hdc, rcWnd, bkColor, Enums.VERT, Enums.SOLID,0, false,theme.#BorderStyle,borderColor,theme.#RoundSize)

return 1
end event

public function long of_removeall ();int index
ITEMDATA emptyItems[]

for index = 1 to UpperBound(Items)
	Items[index].object.Hide()
	if Items[index].hOldParent > 0 then
		Win32.SetParent(Handle(Items[index].object),Items[index].hOldParent)
	end if
	if Items[index].objectOwner then
		_of_CloseUserObject(Items[index].object)
	end if
next

Items = emptyItems

return RetCode.OK
end function

public function integer of_addobject (ref dragobject object);long xpos,ypos

if IsValidObject(object) then
	if Win32.GetParent(Handle(object)) = Win32.GetParent(#Handle) then
		RECTF rcClient,rcWndObj
		Painter.GetClientRect(#Handle,ref rcClient)
		Painter.ClientToScreen(#Handle,ref rcClient)
		Painter.GetWindowRect(Handle(object),ref rcWndObj)
		Painter.OffsetRect(ref rcWndObj,-rcClient.left,-rcClient.top)
		xpos = rcWndObj.left
		ypos = rcWndObj.top
	end if
end if

return of_AddObject(object,xpos,ypos,-1,-1)
end function

public function long of_remove (readonly integer index);int i
ITEMDATA newItems[]

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[index].object.Hide()
if Items[index].hOldParent > 0 then
	Win32.SetParent(Handle(Items[index].Object),Items[index].hOldParent)
end if
if Items[index].ObjectOwner then
	_of_CloseUserObject(Items[index].Object)
end if

for i = 1 to UpperBound(Items)
	if i = index then continue
	newItems[UpperBound(newItems) + 1] = Items[i]
next

Items = newItems

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

public function integer of_getindex (readonly dragobject object);int index

for index = UpperBound(Items) to 1 step -1
	if Items[index].Object = object then return index
next

return 0
end function

public function integer of_addobject (readonly string clsname);return of_AddObject(clsName,0,0,-1,-1)
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

public function long of_updatepoints ();if #LockUpdate then return RetCode.FAILED

of_Redraw(false)

return RetCode.OK
end function

public function integer of_getcount ();return UpperBound(Items)
end function

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if BitAND(flags,ADJ_BORDER) > 0 then
	fBorderSize = P2DX(1)
	if theme.#BorderStyle = Enums.BS_SOLID or theme.#BorderStyle = Enums.BS_ROUND then
		Painter.InflateRect(ref adjRect,-fBorderSize,-fBorderSize)
	elseif theme.#BorderStyle = Enums.BS_RAISED then
		adjRect.right -= fBorderSize * 2
		adjRect.bottom -= fBorderSize * 2
	end if
end if

if BitAND(flags,ADJ_BORDERMARGIN) > 0 then
	adjRect.left += theme.#BorderMargin.left
	adjRect.top += theme.#BorderMargin.top
	adjRect.right -= theme.#BorderMargin.right
	adjRect.bottom -= theme.#BorderMargin.bottom
end if
end subroutine

public function integer of_addobject (readonly string clsname, readonly real xpos, readonly real ypos, readonly real nwidth, readonly real nheight);int newIndex
DragObject object

if Not _of_OpenUserObject(ref Object,clsName) then return RetCode.E_INVALID_TYPE

newIndex = of_AddObject(ref Object,xpos,ypos,nWidth,nHeight)
if newIndex <= 0 then
	_of_CloseUserObject(object)
end if

return newIndex
end function

public function integer of_addobject (readonly string clsname, readonly real xpos, readonly real ypos);return of_AddObject(clsName,xpos,ypos,-1,-1)
end function

public function integer of_addobject (ref dragobject object, readonly real xpos, readonly real ypos);return of_AddObject(object,xpos,ypos,-1,-1)
end function

public function integer of_addobject (ref dragobject object, readonly real xpos, readonly real ypos, readonly real nwidth, readonly real nheight);int itemIndex
int i
ITEMDATA newItem

itemIndex = of_GetIndex(object)

if itemIndex > 0 then return itemIndex

if Not IsValidObject(object) then
	if Not _of_OpenUserObject(ref object) then return RetCode.E_INVALID_OBJECT
	newItem.objectOwner = true
elseif _of_IsObjectCreator(object) then
	newItem.objectOwner = true
end if

if Win32.GetParent(Handle(object)) <> #Handle then
	newItem.hOldParent = Win32.SetParent(Handle(object),#Handle)
end if

newItem.Object = object
if IsOLEControl(object) then
	newItem.IsOLE = true
end if

itemIndex = UpperBound(Items) + 1
Items[itemIndex] = newItem

if Items[itemIndex].IsOLE then
	Object.Move(D2UX(xpos),D2UY(ypos))
	if nWidth >= 0 and nHeight >= 0 then
		Object.Resize(D2UX(nWidth),D2UY(nHeight))
	end if
else
	if nWidth >= 0 and nHeight >= 0 then
		Win32.SetWindowPos(Handle(Object),0,D2PX(xpos),D2PY(ypos),D2PX(nWidth),D2PY(nHeight),Win32.SWP_NOZORDER + Win32.SWP_NOACTIVATE)
	else
		Win32.SetWindowPos(Handle(Object),0,D2PX(xpos),D2PY(ypos),0,0,Win32.SWP_NOZORDER + Win32.SWP_NOSIZE + Win32.SWP_NOACTIVATE)
	end if
end if

return itemIndex
end function

on u_cst_layout.create
call super::create
this.theme=create theme
end on

on u_cst_layout.destroy
call super::destroy
destroy(this.theme)
end on

event onuninit;call super::onuninit;int index

for index = 1 to UpperBound(Items)
	if IsValidObject(Items[index].Object) then
		Items[index].object.Hide()
		if Items[index].hOldParent > 0 then
			Win32.SetParent(Handle(Items[index].object),Items[index].hOldParent)
		end if
		if Items[index].objectOwner then
			_of_CloseUserObject(Items[index].object)
		end if
	end if
next
end event

type uo_logo from u_cst_canvas`uo_logo within u_cst_layout
string tag = "Layout"
end type

type theme from n_cst_layout_theme within u_cst_layout descriptor "pb_nvo" = "true" 
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
end choose

if dirty then
	UpdateFrame()
else
//	of_Redraw(true)
end if

Parent.Event OnThemeChanged(eventFlag)
end event

event ongetcolor;call super::ongetcolor;Parent.Event OnGetColor(colorFlag,state,ref color)
end event

