$PBExportHeader$u_cst_toolbarstrip.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_toolbarstrip from u_cst_canvas
end type
type theme from n_cst_toolbarstrip_theme within u_cst_toolbarstrip
end type
type timer from n_timer within u_cst_toolbarstrip
end type
end forward

global type u_cst_toolbarstrip from u_cst_canvas
integer width = 1691
integer height = 120
boolean #fadeanimation = true
event oncapturechanged ( )
event onmouseleave ( )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event type long onpaint ( unsignedlong hdc )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event onbuttonclicked ( integer index )
event type long onbuttonclicking ( integer index )
event onbuttonmouseenter ( integer index,  real xpos,  real ypos )
event onbuttonmouseleave ( integer index )
event onbuttonmousemove ( integer index,  real xpos,  real ypos )
event onbuttonmousedown ( integer index,  real xpos,  real ypos )
event onbuttonmouseup ( integer index,  real xpos,  real ypos )
event ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type long onwindowsize ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long onmenuselecting ( integer index,  integer id )
event onmenuselected ( integer index,  integer id )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event type long onpopupmenu ( integer index,  ref real xpos,  ref real ypos,  ref unsignedlong flags )
event type long onerasebkgnd ( unsignedlong hdc )
theme theme
timer timer
end type
global u_cst_toolbarstrip u_cst_toolbarstrip

type variables
/*--- Constants ---*/
Public:
//Indexes
Constant Int IDX_CHEVRON	= -1
//Item types
Constant Uint ITT_NORMAL 		= 0
Constant Uint ITT_OBJECT		= 1
Constant Uint ITT_DROPDOWN	= 2
Constant Uint ITT_SPLIT			= 3
Constant Uint ITT_LABEL			= 4
Constant Uint ITT_ICON			= 5
Constant Uint ITT_SEPARATOR	= 6

/*--- Properties ---*/
Public:
Uint		#FlashFadeTime	= 1500		//ms
Boolean 	#ToolTip 			= false

/*--- Implementation ---*/
Private:
n_imagelist		_ImageList
n_tooltip 			_ToolTip
TOOLBARITEM 	Items[]
PAINTPANE		Chevron
RECTF				rcClient

SIZEF	_minLayout
Ulong _TTID	

Int 		_mouseOverIndex  	= 0
Int			_mouseDownIndex	= 0
Int			_lastPopupIndex		= 0
Ulong		_lastPopupTime		= 0

Boolean _MouseLeaveTracked	= false
Boolean _MouseCaptured		= false

//Timer ID
Constant Uint TM_FLASH			= 1
Constant Uint TM_ANIMATION	= 2
//Timer interval (ms)
Constant Uint TMI_ANIMATION	= 15
//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
Constant Uint ADJ_CHEVRON 			= 4
//Sizes
Constant Real BUTTONCHEVRONSIZE 	= 12 	//px
Constant Real TOOLBARCHEVRONSIZE 	= 14 	//px
//Props
Constant String PRP_POPUPMENUCREATOR = "{POPUPMENU_CREATOR}"
end variables

forward prototypes
public function integer of_addseparator ()
private subroutine _of_trackmouseleave (readonly boolean track)
private subroutine _of_showtip (readonly integer index)
public function integer of_addseparator (readonly alignment position)
public function integer of_insertbutton (readonly integer index, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position)
public function integer of_insertbutton (readonly integer index, readonly string txt, readonly string image, readonly string tiptxt)
public function integer of_insertbutton (readonly integer index, readonly string txt, readonly string image)
public function integer of_insertbutton (readonly integer index, readonly string txt, readonly string image, readonly alignment position)
public function integer of_addbutton (readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position)
public function integer of_addbutton (readonly string txt, readonly string image, readonly string tiptxt)
public function integer of_addbutton (readonly string txt, readonly string image)
public function integer of_addbutton (readonly string txt, readonly string image, readonly alignment position)
public function integer of_GetCount ()
public function string of_gettext (readonly integer index)
public function boolean of_isenabled (readonly integer index)
public function boolean of_isvisible (readonly integer index)
public function boolean of_IsHighLighted (readonly integer index)
public function integer of_addobject (ref dragobject object)
public function integer of_addobject (ref dragobject object, readonly string txt)
public function integer of_addobject (ref dragobject object, readonly alignment position)
public function integer of_addobject (ref dragobject object, readonly string txt, readonly alignment position)
public function integer of_insertobject (readonly integer index, ref dragobject object)
public function integer of_insertobject (readonly integer index, ref dragobject object, readonly string txt)
public function integer of_insertobject (readonly integer index, ref dragobject object, readonly alignment position)
public function integer of_insertobject (readonly integer index, ref dragobject object, readonly string txt, readonly alignment position)
public function integer of_addobject (readonly string clsname)
public function integer of_addobject (readonly string clsname, readonly string txt)
public function integer of_addobject (readonly string clsname, readonly alignment position)
public function integer of_addobject (readonly string clsname, readonly string txt, readonly alignment position)
public function integer of_insertobject (readonly integer index, readonly string clsname)
public function integer of_insertobject (readonly integer index, readonly string clsname, readonly string txt)
public function integer of_insertobject (readonly integer index, readonly string clsname, readonly alignment position)
public function integer of_insertobject (readonly integer index, readonly string clsname, readonly string txt, readonly alignment position)
public function string of_getimage (readonly integer index)
public function integer of_insertseparator (readonly integer index, readonly alignment position)
public function integer of_insertseparator (readonly integer index)
private subroutine _of_capturemouse (readonly boolean capture)
private subroutine _of_updatepoints ()
private subroutine _of_updatetextsize (readonly integer index)
private subroutine _of_updatetextsize ()
public function integer of_getindex (readonly dragobject object)
public function boolean of_ismultiline (readonly integer index)
private subroutine _of_drawchevron (readonly boolean fadeanimation)
private subroutine _of_recalclayout ()
private subroutine _of_updatechevronpoints ()
public function boolean of_istoggled (readonly integer index)
public function boolean of_isdisplaytext (readonly integer index)
public function string of_gettiptext (readonly integer index)
private subroutine _of_flashdrawitem (readonly integer index)
public function integer of_getindex (readonly string txt)
public function boolean of_isflashing (readonly integer index)
private subroutine _of_updatepointsh ()
private subroutine _of_updatepointsv ()
public function long of_displaytext (readonly integer index, readonly boolean display)
public function long of_displaytextall (readonly boolean display)
public function long of_enable (readonly integer index, readonly boolean benabled)
public function long of_flash (readonly integer index, readonly long flashtime)
public function long of_getobject (readonly integer index, ref dragobject object)
public function long of_getpopupmenu (readonly integer index, ref n_cst_popupmenu popupmenu)
public function long of_highlight (readonly integer index, boolean highlighted)
public function long of_remove (readonly integer index)
public function long of_removeall ()
public function long of_setimage (readonly integer index, readonly string image)
public function long of_setmultiline (readonly integer index, readonly boolean multiline)
public function long of_settext (readonly integer index, readonly string txt)
public function long of_settiptext (readonly integer index, readonly string tiptext)
public function long of_toggle (readonly integer index, readonly boolean toggled)
public function long of_updatepoints ()
public function long of_visible (readonly integer index, readonly boolean bvisible)
public function long of_redraw (readonly boolean fadeanimation)
public function integer of_getindexbyclassname (readonly string clsname)
public function alignment of_getitemposition (readonly integer index)
public function long of_settiptime (readonly integer index, readonly long tiptime)
public function integer of_getfirstvisible ()
public function integer of_getlastvisible ()
public function integer of_getnextvisible (readonly integer index)
public function integer of_getpreviousvisible (readonly integer index)
private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawitemchevron (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawchevron (readonly unsignedlong hdc)
private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_fillbkgnd (readonly unsignedlong hdc)
public function any of_getdata (readonly integer index)
public function long of_setdata (readonly integer index, readonly any data)
public function string of_gettag (readonly integer index)
public function long of_settag (readonly integer index, readonly string stag)
public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position)
public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt)
public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly alignment position)
public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image)
public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position)
public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt)
public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly alignment position)
public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image)
public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image)
public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position)
public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt)
public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly alignment position)
public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position)
public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt)
public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly alignment position)
public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image)
public function integer of_addmenubutton (readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position)
public function integer of_addmenubutton (readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt)
public function integer of_addmenubutton (readonly string clsname, readonly string txt, readonly string image, readonly alignment position)
public function integer of_addmenubutton (readonly string clsname, readonly string txt, readonly string image)
public function integer of_addsplitbutton (readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position)
public function integer of_addsplitbutton (readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt)
public function integer of_addsplitbutton (readonly string clsname, readonly string txt, readonly string image, readonly alignment position)
public function integer of_addsplitbutton (readonly string clsname, readonly string txt, readonly string image)
public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image)
public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position)
public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt)
public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly alignment position)
public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position)
public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt)
public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly alignment position)
public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image)
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu, readonly string clsname)
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu)
public function long of_setpopupmenu (readonly integer index, ref n_cst_popupmenu popupmenu)
public function long of_setpopupmenu (readonly integer index, readonly string clsname)
public function integer of_insertlabel (readonly integer index, readonly string txt, readonly alignment position)
public function integer of_insertlabel (readonly integer index, readonly string txt)
public function integer of_inserticon (readonly integer index, readonly string image, readonly alignment position)
public function integer of_inserticon (readonly integer index, readonly string image)
public function integer of_addlabel (readonly string txt, readonly alignment position)
public function integer of_addlabel (readonly string txt)
public function integer of_addicon (readonly string image, readonly alignment position)
public function integer of_addicon (readonly string image)
private function boolean _of_isbutton (readonly integer index)
private function boolean _of_hasvalidimage (readonly integer index)
public function boolean of_isusedanimatedimage (readonly integer index)
public function long of_setanimatedimage (readonly integer index, readonly string amimage)
private subroutine _of_drawitem (readonly integer index, readonly boolean bimageonly, readonly boolean fadeanimation)
private subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation)
public function long of_useanimatedimage (readonly integer index, readonly boolean used)
public function long of_getitemtype (readonly integer index)
public function long of_setitemtype (readonly integer index, readonly long ntype)
public function unsignedlong of_getchevronstate ()
public function unsignedlong of_getitemchevronstate (readonly integer index)
public function unsignedlong of_getitemstate (readonly integer index)
public function integer of_getindexbytag (readonly string stag)
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
private function unsignedlong _of_popupmenu (readonly integer index, real xpos, real ypos)
private function unsignedlong _of_popup (real xpos, real ypos)
private function boolean _of_isoverchevron (readonly integer index, readonly real xpos, readonly real ypos)
public function integer of_indexfrompoint (readonly real xpos, readonly real ypos)
public function boolean of_isseparator (readonly integer index)
end prototypes

event Oncapturechanged();if _MouseCaptured then
	_of_CaptureMouse(false)
	if Chevron.MouseDown then
		Chevron.MouseDown = false
		_of_DrawChevron(true)
		Event OnButtonMouseUp(IDX_CHEVRON,0,0)
	end if
	if _mouseDownIndex>0 then
		Items[_mouseDownIndex].mousedown=false
		_of_DrawItem(_mouseDownIndex,true)
		Event OnButtonMouseUp(_mouseDownIndex,0,0)
		_mouseDownIndex = 0
	end if
	Event OnMouseLeave()
end if
end event

event Onmouseleave();if KeyDown(KeyEnter!) or KeyDown(KeySpaceBar!) then return

if _mouseOverIndex>0 then
	Items[_mouseOverIndex].mouseover=false
	Items[_mouseOverIndex].Chevron.mouseover=false
	_of_DrawItem(_mouseOverIndex,true)
	_of_ShowTip(0)
	Event OnButtonMouseLeave(_mouseOverIndex)
	_mouseOverIndex = 0
end if

if Chevron.MouseOver then
	Chevron.MouseOver = false
	_of_DrawChevron(true)
	Event OnButtonMouseLeave(IDX_CHEVRON)
end if

_of_TrackMouseLeave(false)
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);int index

//if _MouseCaptured then return 1

if Not _MouseLeaveTracked and Not _MouseCaptured then
	_of_TrackMouseLeave(true)
end if
	
index = of_indexfrompoint(xpos,ypos)

if _mouseOverIndex <> index then
	if _mouseOverIndex>0 then
		Items[_mouseOverIndex].mouseover=false
		Items[_mouseOverIndex].Chevron.mouseover=false
		_of_DrawItem(_mouseOverIndex,true)
		_of_ShowTip(0)
		Event OnButtonMouseLeave(_mouseOverIndex)
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
		Event OnButtonMouseEnter(_mouseOverIndex,xpos,ypos)
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
	Event OnButtonMouseMove(_mouseOverIndex,xpos,ypos)
end if

if index = IDX_CHEVRON then
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

return 0
end event

event type long onpaint(unsignedlong hdc);int index

if #LockUpdate then return 1

Event OnEraseBkgnd(hdc)

for index = 1 to UpperBound(Items)
	if Not Items[index].Visible or Items[index].Hidden then continue
	_of_DrawItem(index, hdc)
next

if Chevron.Visible then
	_of_DrawChevron(hdc)
end if

return 1
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);int li_mouseOverIndex

if Not _MouseLeaveTracked or _mouseOverIndex = 0 then
	Event	OnMouseMove(vkey,xpos,ypos)
end if

if _mouseOverIndex > 0 then
	li_mouseOverIndex = _mouseOverIndex
	_of_ShowTip(0)
	
	if (Items[li_mouseOverIndex].ItemType = ITT_DROPDOWN and Items[li_mouseOverIndex].MouseOver) or&
		(Items[li_mouseOverIndex].ItemType = ITT_SPLIT and Items[li_mouseOverIndex].Chevron.MouseOver) then
		if _lastPopupIndex = li_mouseOverIndex and Cpu() - _lastPopupTime < 100 then
			return 0
		end if
		
		if Items[li_mouseOverIndex].ItemType = ITT_SPLIT then
			Items[li_mouseOverIndex].Chevron.mousedown=true
		else
			Items[li_mouseOverIndex].mousedown=true
			Event OnButtonMouseDown(li_mouseOverIndex,xpos,ypos)
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
		_mouseDownIndex = li_mouseOverIndex
		Items[_mouseDownIndex].mousedown=true
		_of_DrawItem(_mouseDownIndex,false)
		_of_CaptureMouse(true)
		Event OnButtonMouseDown(_mouseDownIndex,xpos,ypos)
	end if
end if

if Chevron.MouseOver then
	if _lastPopupIndex = IDX_CHEVRON and Cpu() - _lastPopupTime < 100 then
		return 0
	end if
	Chevron.MouseDown = true
	_of_DrawChevron(false)
	
	Event OnButtonMouseDown(IDX_CHEVRON,xpos,ypos)
	_of_Popup(xpos,ypos)
	
	Chevron.MouseDown = false
	_of_DrawChevron(true)
end if

return 0
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if Not _MouseCaptured then return 0

_of_CaptureMouse(false)
_of_TrackMouseLeave(true)

if _mouseDownIndex > 0 then
	Items[_mouseDownIndex].MouseDown = false
	_of_DrawItem(_mouseDownIndex,true)
	
	Event OnButtonMouseUp(_mouseDownIndex,xpos,ypos)
	
	if _mouseDownIndex = _mouseOverIndex and Not Items[_mouseDownIndex].Chevron.MouseOver then		//Clicked
		if IsAllowed(Event OnButtonclicking(_mouseDownIndex)) then
			Post Event OnButtonclicked(_mouseDownIndex)
		end if
	end if
	
	_mouseDownIndex = 0
end if

return 0
end event

event type long onwindowsize(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);rcClient.right = newWidth
rcClient.bottom = newHeight

if theme.#ItemOrientation = Enums.VERT and WidthChanged then
	_of_UpdateTextSize()
elseif theme.#ItemOrientation = Enums.HORZ and HeightChanged then
	_of_UpdateTextSize()
end if

_of_UpdatePoints()

return 0
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);return Event OnLButtonDown(vkey,xpos,ypos)
end event

event type long onerasebkgnd(unsignedlong hdc);if #LockUpdate then return 1

_of_FillBkgnd(hdc)

return 1
end event

public function integer of_addseparator ();return of_addseparator(left!)
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

private subroutine _of_showtip (readonly integer index);if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _MouseCaptured then return

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

public function integer of_addseparator (readonly alignment position);return of_InsertSeparator(UpperBound(Items)+1,position)
end function

public function integer of_insertbutton (readonly integer index, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position);int i
TOOLBARITEM newItem

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

newItem.Text = txt
newItem.tipText = tiptxt
newItem.enabled = true
newItem.visible = true
newItem.DisplayText = true
newItem.ItemType = ITT_NORMAL
newItem.position = position

newItem.AnimatedImage = create n_image
newItem.AnimatedImage.ShareImage(true)
newItem.AnimatedImage.SetImageSize(theme.#IconSize.cx,theme.#IconSize.cy)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

if len(image) > 0 then
	Items[index].image = image
	Items[index].imageindex = _ImageList.AddImage(theme.of_GetItemIcon(index,image,0))
end if

_of_UpdateTextSize(index)

of_UpdatePoints()

return index
end function

public function integer of_insertbutton (readonly integer index, readonly string txt, readonly string image, readonly string tiptxt);return of_InsertButton(index,txt,image,tiptxt,Left!)
end function

public function integer of_insertbutton (readonly integer index, readonly string txt, readonly string image);return of_InsertButton(index,txt,image,"",left!)
end function

public function integer of_insertbutton (readonly integer index, readonly string txt, readonly string image, readonly alignment position);return of_InsertButton(index,txt,image,"",position)
end function

public function integer of_addbutton (readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position);return of_InsertButton(UpperBound(Items)+1,txt,image,tiptxt,position)
end function

public function integer of_addbutton (readonly string txt, readonly string image, readonly string tiptxt);return of_AddButton(txt,image,tiptxt,left!)
end function

public function integer of_addbutton (readonly string txt, readonly string image);return of_AddButton(txt,image,"",left!)
end function

public function integer of_addbutton (readonly string txt, readonly string image, readonly alignment position);return of_AddButton(txt,image,"",position)
end function

public function integer of_GetCount ();return UpperBound(Items)
end function

public function string of_gettext (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].text
end function

public function boolean of_isenabled (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].enabled
end function

public function boolean of_isvisible (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].visible
end function

public function boolean of_IsHighLighted (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].HighLighted
end function

public function integer of_addobject (ref dragobject object);return of_addobject(ref object,"",left!)
end function

public function integer of_addobject (ref dragobject object, readonly string txt);return of_addobject(ref object,txt,left!)
end function

public function integer of_addobject (ref dragobject object, readonly alignment position);return of_AddObject(ref object,"",position)
end function

public function integer of_addobject (ref dragobject object, readonly string txt, readonly alignment position);return of_InsertObject(UpperBound(Items)+1,ref object,txt,position)
end function

public function integer of_insertobject (readonly integer index, ref dragobject object);return of_InsertObject(index,ref object,"",left!)
end function

public function integer of_insertobject (readonly integer index, ref dragobject object, readonly string txt);return of_InsertObject(index,ref object,txt,left!)
end function

public function integer of_insertobject (readonly integer index, ref dragobject object, readonly alignment position);return of_InsertObject(index,ref object,"",position)
end function

public function integer of_insertobject (readonly integer index, ref dragobject object, readonly string txt, readonly alignment position);int itemIndex
int i
TOOLBARITEM newItem
RECTF rcObj

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

itemIndex = of_GetIndex(object)

if itemIndex > 0 then return itemIndex

newItem.ItemType = ITT_OBJECT
newItem.enabled = true
newItem.visible = true
newItem.displaytext = true
newItem.Text = txt
newItem.position = position

if Not IsValidObject(object) then
	if Not _of_OpenUserObject(ref object) then return RetCode.E_INVALID_OBJECT
	newItem.ObjectOwner = true
elseif _of_IsObjectCreator(object) then
	newItem.objectOwner = true
end if

object.Hide()

if Win32.GetParent(Handle(object)) <> #Handle then
	newItem.hOldParent = Win32.SetParent(Handle(object),#Handle)
end if

object.Move(-32768,-32768)

newItem.object = object

Painter.GetWindowRect(Handle(object),ref rcObj)
newItem.szObject.cx = rcObj.right - rcObj.left
newItem.szObject.cy = rcObj.bottom - rcObj.top

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

_of_UpdateTextSize(index)
of_UpdatePoints()

return index
end function

public function integer of_addobject (readonly string clsname);return of_AddObject(clsName,"",left!)
end function

public function integer of_addobject (readonly string clsname, readonly string txt);return of_addobject(clsName,txt,left!)
end function

public function integer of_addobject (readonly string clsname, readonly alignment position);return of_AddObject(clsName,"",position)
end function

public function integer of_addobject (readonly string clsname, readonly string txt, readonly alignment position);return of_InsertObject(UpperBound(Items)+1,clsName,txt,position)
end function

public function integer of_insertobject (readonly integer index, readonly string clsname);return of_InsertObject(index,clsName,"",left!)
end function

public function integer of_insertobject (readonly integer index, readonly string clsname, readonly string txt);return of_InsertObject(index,clsName,txt,left!)
end function

public function integer of_insertobject (readonly integer index, readonly string clsname, readonly alignment position);return of_InsertObject(index,clsName,"",position)
end function

public function integer of_insertobject (readonly integer index, readonly string clsname, readonly string txt, readonly alignment position);int newIndex
DragObject object

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

if Not _of_OpenUserObject(ref Object,clsName) then return RetCode.E_INVALID_TYPE

newIndex = of_InsertObject(index,ref Object,txt,position)
if newIndex <= 0 then
	_of_CloseUserObject(object)
end if

return newIndex
end function

public function string of_getimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].image
end function

public function integer of_insertseparator (readonly integer index, readonly alignment position);int i
TOOLBARITEM newItem

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

newItem.visible = true
newItem.ItemType = ITT_SEPARATOR
newItem.enabled = true
newItem.position = position

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

of_UpdatePoints()

return index
end function

public function integer of_insertseparator (readonly integer index);return of_InsertSeparator(index,Left!)
end function

private subroutine _of_capturemouse (readonly boolean capture);if _MouseCaptured = capture then return

_MouseCaptured = capture

if capture then
	Win32.SetCapture(#Handle)
else
	Win32.ReleaseCapture()
end if
end subroutine

private subroutine _of_updatepoints ();if #LockUpdate then return

_of_UpdateChevronPoints()
if theme.#ItemOrientation = Enums.HORZ then
	_of_UpdatePointsH()
else
	_of_UpdatePointsV()
end if
end subroutine

private subroutine _of_updatetextsize (readonly integer index);ulong dtparam
RECTF	clientRect
RECTF	calcRect

if index < 1 or index > UpperBound(Items) then return
if Len(Items[index].text) = 0 then
	Items[index].szText.cx = 0
	Items[index].szText.cy = 0
	return
end if

clientRect = rcClient
_of_AdjustRect(ref clientRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

dtparam = Painter.DT_EXPANDTABS
if Items[index].MultiLine then
	dtparam += Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
else
	dtparam += Painter.DT_SINGLELINE
end if

if theme.#ItemOrientation = Enums.VERT then
	if theme.#TextOrientation = Enums.VERT then
		Painter.of_CalcVertTextSize(theme.Font,Items[index].Text,dtparam,ref calcRect)
	else
		calcRect.right = clientRect.right - clientRect.left - 4
		if Items[index].imageIndex > 0 and (theme.#IconPosition = Enums.LEFT or theme.#IconPosition = Enums.RIGHT) then
			calcRect.right -= theme.#IconSize.cx + 2
		end if
		Painter.of_CalcTextSize(theme.Font,Items[index].Text,dtparam,ref calcRect)
	end if
	Items[index].szText.cx = calcRect.right
	Items[index].szText.cy = calcRect.bottom
	if _of_HasValidImage(index) and (theme.#IconPosition = Enums.LEFT or theme.#IconPosition = Enums.RIGHT) then
		if Items[index].szText.cx > clientRect.right - clientRect.left - theme.#IconSize.cx - 2 - 4 then
			Items[index].szText.cx = clientRect.right - clientRect.left - theme.#IconSize.cx - 2 - 4
		end if
	else
		if Items[index].szText.cx > clientRect.right - clientRect.left - 4 then
			Items[index].szText.cx = clientRect.right - clientRect.left - 4
		end if
	end if
	if Items[index].szText.cy > clientRect.bottom - clientRect.top - 4 then
		Items[index].szText.cy = clientRect.bottom - clientRect.top - 4
	end if
else
	if theme.#TextOrientation = Enums.VERT then
		Painter.of_CalcVertTextSize(theme.Font,Items[index].Text,dtparam,ref calcRect)
	else
		calcRect.right = clientRect.right - clientRect.left - 4
		Painter.of_CalcTextSize(theme.Font,Items[index].Text,dtparam,ref calcRect)
	end if
	Items[index].szText.cx = calcRect.right
	Items[index].szText.cy = calcRect.bottom
	if Items[index].szText.cx > clientRect.right - clientRect.left - 4 then
		Items[index].szText.cx = clientRect.right - clientRect.left - 4
	end if
	if _of_HasValidImage(index) and (theme.#IconPosition = Enums.TOP or theme.#IconPosition = Enums.BOTTOM) then
		if Items[index].szText.cy > (clientRect.bottom - clientRect.top) - theme.#IconSize.cy - 2 - 4 then
			Items[index].szText.cy = (clientRect.bottom - clientRect.top) - theme.#IconSize.cy - 2 - 4
		end if
	else
		if Items[index].szText.cy > clientRect.bottom - clientRect.top - 4 then
			Items[index].szText.cy = clientRect.bottom - clientRect.top - 4
		end if
	end if
end if

if Items[index].szText.cx < 0 then Items[index].szText.cx = 0
if  Items[index].szText.cy < 0 then Items[index].szText.cy = 0
end subroutine

private subroutine _of_updatetextsize ();int index

for index = 1 to UpperBound(Items)
	_of_UpdateTextSize(index)
next
end subroutine

public function integer of_getindex (readonly dragobject object);int index

for index = 1 to UpperBound(Items)
	if Items[index].object = object then return index
next

return 0
end function

public function boolean of_ismultiline (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].MultiLine
end function

private subroutine _of_drawchevron (readonly boolean fadeanimation);ulong safeDC
RECTF cliRect

if #LockUpdate then return
if Not Visible then return
if Not Chevron.Visible then return

safeDC=GetSafeDC()

cliRect = rcClient
_of_AdjustRect(ref cliRect,ADJ_BORDER)

Painter.IntersectClipRect(safeDC,cliRect)

Painter.IntersectClipRect(safeDC,Chevron.rcPaint)
	
if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnEraseBkgnd(safeDC)

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

private subroutine _of_recalclayout ();int index
real itemSize
int visibleCount

if #LockUpdate then return

_minLayout.cx = 0
_minLayout.cy = 0

if theme.#ItemOrientation = Enums.HORZ then
	for index = 1 to UpperBound(Items)
		if Not Items[index].visible then continue
		visibleCount ++
		itemSize = 0
		choose case Items[index].ItemType
			case ITT_LABEL
				itemSize += Items[index].szText.cx
			case ITT_ICON
				itemSize += theme.#IconSize.cx
			case ITT_SEPARATOR
				itemSize += 2
			case ITT_OBJECT
				if Items[index].DisplayText and Items[index].szText.cx > 0  then
					itemSize += Items[index].szText.cx + 2 + Items[index].szObject.cx
				else
					itemSize += Items[index].szObject.cx
				end if
			case ITT_NORMAL,ITT_DROPDOWN,ITT_SPLIT
				if Items[index].DisplayText and Items[index].szText.cx > 0  then
					if Items[index].imageIndex > 0 then
						if theme.#IconPosition = Enums.TOP or theme.#IconPosition = Enums.BOTTOM then
							if Items[index].szText.cx > theme.#IconSize.cx then
								itemSize += 2 + Items[index].szText.cx + 2
							else
								itemSize += 2 + theme.#IconSize.cx + 2
							end if
						else
							itemSize += 2 + theme.#IconSize.cx + 2 + Items[index].szText.cx + 2
						end if
					else
						itemSize += 2 + Items[index].szText.cx + 2
					end if
				elseif Items[index].imageIndex > 0 then
					itemSize += 2 + theme.#IconSize.cx + 2
				end if
				if Items[index].Chevron.Visible then
					itemSize += BUTTONCHEVRONSIZE
				end if
				if theme.#FixedSize and itemSize < theme.#ItemMinSize then
					itemSize = theme.#ItemMinSize
				end if
		end choose
		_minLayout.cx += itemSize
	next
	if visibleCount > 0 then
		_minLayout.cx += theme.#ItemMargin * (visibleCount - 1)
	end if
else
	for index = 1 to UpperBound(Items)
		if Not Items[index].visible then continue
		if Items[index].ItemType = ITT_OBJECT then continue
		visibleCount ++
		itemSize = 0
		choose case Items[index].ItemType
			case ITT_LABEL
				itemSize += Items[index].szText.cy
			case ITT_ICON
				itemSize += theme.#IconSize.cy
			case ITT_SEPARATOR
				itemSize += 2
			case ITT_OBJECT
				if Items[index].DisplayText and Items[index].szText.cy > 0  then
					itemSize += Items[index].szText.cy + 2 + Items[index].szObject.cy
				else
					itemSize += Items[index].szObject.cy
				end if
			case ITT_NORMAL,ITT_DROPDOWN,ITT_SPLIT
				if Items[index].DisplayText and Items[index].szText.cy > 0  then
					if Items[index].imageIndex > 0 then
						if theme.#IconPosition = Enums.TOP or theme.#IconPosition = Enums.BOTTOM then
							itemSize += 2 + theme.#IconSize.cy + 2 + Items[index].szText.cy + 2
						else
							if Items[index].szText.cy > theme.#IconSize.cy then
								itemSize += 2 + Items[index].szText.cy + 2
							else
								itemSize += 2 + theme.#IconSize.cy + 2
							end if
						end if
					else
						itemSize += 2 + Items[index].szText.cy + 2
					end if
				elseif Items[index].imageIndex > 0 then
					itemSize += 2 + theme.#IconSize.cy + 2
				end if
				if Items[index].Chevron.Visible then
					itemSize += BUTTONCHEVRONSIZE
				end if
				if theme.#FixedSize and itemSize < theme.#ItemMinSize then
					itemSize = theme.#ItemMinSize
				end if
		end choose
		_minLayout.cy += itemSize
	next
	if visibleCount > 0 then
		_minLayout.cy += theme.#ItemMargin * (visibleCount - 1)
	end if
end if
end subroutine

private subroutine _of_updatechevronpoints ();int index
int count
RECTF clientRect

if #LockUpdate then return

clientRect = rcClient
_of_AdjustRect(ref clientRect,ADJ_BORDER + ADJ_BORDERMARGIN)

if theme.#ItemOrientation = Enums.VERT then
	if _minLayout.cy > (clientRect.bottom - clientRect.top) then
		Chevron.visible = true
		Chevron.rcPaint.left	= rcClient.left
		Chevron.rcPaint.right = rcClient.right
		Chevron.rcPaint.top	= rcClient.bottom  - TOOLBARCHEVRONSIZE
		Chevron.rcPaint.bottom = rcClient.bottom
		if theme.#BorderStyle = Enums.BS_RAISED then
			Chevron.rcPaint.right -= 1
			Chevron.rcPaint.bottom -= 1
		end if
	else
		Chevron.visible = false
	end if
else
	if _minLayout.cx > (clientRect.right - clientRect.left) then
		Chevron.visible = true
		Chevron.rcPaint.left = rcClient.right - TOOLBARCHEVRONSIZE
		Chevron.rcPaint.right = rcClient.right
		Chevron.rcPaint.top	= rcClient.top
		Chevron.rcPaint.bottom = rcClient.bottom
		if theme.#BorderStyle = Enums.BS_RAISED then
			Chevron.rcPaint.right -= 1
			Chevron.rcPaint.bottom -= 1
		end if
	else
		Chevron.visible = false
	end if
end if
end subroutine

public function boolean of_istoggled (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].Toggled
end function

public function boolean of_isdisplaytext (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].DisplayText
end function

public function string of_gettiptext (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].tiptext
end function

private subroutine _of_flashdrawitem (readonly integer index);Uint nFadeTime

if #LockUpdate then return
if Not Visible then return
if index < 1 or index > UpperBound(Items) then return
if Not Items[index].visible or Items[index].hidden then return
if Items[index].ItemType = ITT_OBJECT then return
if Not Items[index].Enabled or Items[index].MouseOver or Items[index].MouseDown or &
	Items[index].Chevron.MouseOver or Items[index].Chevron.MouseDown or Items[index].Toggled then
	return
end if

nFadeTime = #FadeTime
#FadeTime = #FlashFadeTime

_of_DrawItem(index,true)

#FadeTime = nFadeTime
end subroutine

public function integer of_getindex (readonly string txt);int index

for index = 1 to UpperBound(Items)
	if Upper(txt)= upper(Items[index].Text) then return index
next

return 0
end function

public function boolean of_isflashing (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return (Items[index].FlashTime = -1 or Items[index].FlashTime > 0)
end function

private subroutine _of_updatepointsh ();int index
real ll_left,ll_right
real itemSize
real maxSize
real offsetSize
boolean leftSomeHidden,rightSomeHidden
RECTF clientRect

clientRect = rcClient
_of_AdjustRect(ref clientRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

ll_left		= clientRect.left
ll_right	= clientRect.right
itemSize = clientRect.bottom - clientRect.top

for index = 1 to UpperBound(Items)
	if Not Items[index].visible then continue
	if Items[index].position = Left! then																							/*--- Left items ---*/
		if leftSomeHidden then
			Items[index].hidden = true
			if Items[index].ItemType = ITT_OBJECT then
				//if Items[index].object.visible then
					Items[index].object.Hide()
					Items[index].object.Move(-32768,-32768)
				//end if
			end if
			continue
		end if
		
		choose case Items[index].ItemType
			case ITT_LABEL				//Label
				//Set rcText
				Items[index].rcText.left 		= ll_left
				Items[index].rcText.right 	= Items[index].rcText.left  + Items[index].szText.cx
				Items[index].rcText.top		= clientRect.top + (itemSize - Items[index].szText.cy) / 2
				Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
				//Set rcPaint
				Painter.CopyRect(ref Items[index].rcPaint,ref Items[index].rcText)
			case ITT_ICON					//Icon
				//Set rcImage
				Items[index].rcImage.left		= ll_left
				Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
				Items[index].rcImage.top		= clientRect.top + (itemSize - theme.#IconSize.cy) / 2
				Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
				//Set rcPaint
				Painter.CopyRect(ref Items[index].rcPaint,ref Items[index].rcImage)
			case ITT_SEPARATOR		//Separator
				Items[index].rcPaint.left		= ll_left
				Items[index].rcPaint.right	= Items[index].rcPaint.left + 1
				Items[index].rcPaint.top		= clientRect.top + 1
				Items[index].rcPaint.bottom	= clientRect.bottom - 1
			case ITT_OBJECT				//Object
				if Items[index].DisplayText and Items[index].szText.cx > 0  then
					//Set rcText
					Items[index].rcText.left		= ll_left
					Items[index].rcText.right		= Items[index].rcText.left + Items[index].szText.cx
					Items[index].rcText.top		= clientRect.top + (itemSize - Items[index].szText.cy) / 2
					Items[index].rcText.bottom	= Items[index].rcText.top + Items[index].szText.cy
					//Set object position
					Items[index].object.Move(D2UX(Items[index].rcText.right + 2),&
												D2UY(clientRect.Top + (itemSize - Items[index].szObject.cy)/2))
					//Set rcPaint
					Items[index].rcPaint.left		= ll_left
					Items[index].rcPaint.right	= Items[index].rcText.right + 2 + Items[index].szObject.cx
					Items[index].rcPaint.top		= clientRect.top
					Items[index].rcPaint.bottom	= clientRect.bottom
				else
					Painter.SetRectEmpty(Items[index].rcText)
					//Set object position
					Items[index].object.Move(D2UX(ll_left),&
												D2UY(clientRect.Top + (itemSize - Items[index].szObject.cy)/2))
					//Set rcPaint
					Items[index].rcPaint.left		= ll_left
					Items[index].rcPaint.right	= Items[index].rcPaint.left + Items[index].szObject.cx
					Items[index].rcPaint.top		= clientRect.top
					Items[index].rcPaint.bottom	= clientRect.bottom
				end if
			case else							//Button
				if _of_HasValidImage(index) then
					if Items[index].DisplayText and Items[index].szText.cx > 0 then
						choose case theme.#IconPosition
							case Enums.LEFT
								//Set rcImage
								Items[index].rcImage.left		= ll_left + 2
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= clientRect.top + (itemSize - theme.#IconSize.cy) / 2
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cx
								//Set rcText
								Items[index].rcText.left 			= Items[index].rcImage.right + 2
								Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
								Items[index].rcText.top			= clientRect.top + (itemSize - Items[index].szText.cy) / 2
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
							case Enums.TOP
								if Items[index].szText.cx > theme.#IconSize.cx then
									maxSize = Items[index].szText.cx
								else
									maxSize = theme.#IconSize.cx
								end if
								//Set rcImage
								Items[index].rcImage.left		= ll_left + 2 + (maxSize - theme.#IconSize.cx)/2
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= clientRect.top + 2
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
								//Set rcText
								Items[index].rcText.left 			= ll_left  + 2 + (maxSize - Items[index].szText.cx) / 2
								Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
								Items[index].rcText.top			= Items[index].rcImage.bottom + 2
								if (clientRect.bottom - Items[index].rcText.top) > Items[index].szText.cy then
									Items[index].rcText.top 		+= (clientRect.bottom - Items[index].rcText.top - Items[index].szText.cy) / 2
								end if
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
							case Enums.RIGHT
								//Set rcImage
								Items[index].rcImage.left		= ll_left + 2 + Items[index].szText.cx + 2
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= clientRect.top + (itemSize - theme.#IconSize.cy) / 2
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cx
								//Set rcText
								Items[index].rcText.left 			= ll_left + 2
								Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
								Items[index].rcText.top			= clientRect.top + (itemSize - Items[index].szText.cy) / 2
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
							case Enums.BOTTOM
								if Items[index].szText.cx > theme.#IconSize.cx then
									maxSize = Items[index].szText.cx
								else
									maxSize = theme.#IconSize.cx
								end if
								//Set rcImage
								Items[index].rcImage.left		= ll_left + 2 + (maxSize - theme.#IconSize.cx)/2
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= clientRect.bottom - 2 - theme.#IconSize.cy
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
								//Set rcText
								Items[index].rcText.left 			= ll_left  + 2 + (maxSize - Items[index].szText.cx) / 2
								Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
								Items[index].rcText.top			= clientRect.top + 2
								if (Items[index].rcImage.top - 2 - Items[index].rcText.top) > Items[index].szText.cy then
									Items[index].rcText.top 		+= (Items[index].rcImage.top - 2 - Items[index].rcText.top - Items[index].szText.cy) / 2
								end if
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
						end choose
					else
						Painter.SetRectEmpty(Items[index].rcText)
						//Set rcImage
						Items[index].rcImage.left		= ll_left + 2
						Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
						Items[index].rcImage.top		= clientRect.top + (itemSize - theme.#IconSize.cy) / 2
						Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
					end if
				elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
					Painter.SetRectEmpty(Items[index].rcImage)
					//Set rcText
					Items[index].rcText.left 		= ll_left  + 2
					Items[index].rcText.right 	= Items[index].rcText.left  + Items[index].szText.cx
					Items[index].rcText.top		= clientRect.top + (itemSize - Items[index].szText.cy) / 2
					Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
				else
					Painter.SetRectEmpty(Items[index].rcImage)
					Painter.SetRectEmpty(Items[index].rcText)
				end if
				
				//Set rcPaint
				Items[index].rcPaint.left = ll_left
				if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
					Items[index].rcPaint.right = Max(Items[index].rcText.right, Items[index].rcImage.right) + 2
				elseif Not Painter.IsRectEmpty(Items[index].rcText) then
					Items[index].rcPaint.right = Items[index].rcText.right + 2
				elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
					Items[index].rcPaint.right = Items[index].rcImage.right + 2
				else
					Items[index].rcPaint.right = Items[index].rcPaint.left + 4
				end if
				Items[index].rcPaint.top			= clientRect.top
				Items[index].rcPaint.bottom		= clientRect.bottom
				
				//Set chevron
				if Items[index].Chevron.Visible then
					Items[index].Chevron.rcPaint.left 		= Items[index].rcPaint.right
					Items[index].Chevron.rcPaint.right		= Items[index].Chevron.rcPaint.left + BUTTONCHEVRONSIZE
					Items[index].Chevron.rcPaint.top		= clientRect.top
					Items[index].Chevron.rcPaint.bottom	= clientRect.bottom
					Items[index].rcPaint.right 				= Items[index].Chevron.rcPaint.right	
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
						if Items[index].Chevron.Visible then
							Painter.OffsetRect(Items[index].Chevron.rcPaint,offsetSize,0 )
						end if
						Items[index].rcPaint.right += offsetSize
					end if
				end if
		end choose
		
		if Items[index].rcPaint.right > ll_right then
			Items[index].hidden = true
			leftSomeHidden = true
			if Items[index].ItemType = ITT_OBJECT then
				//if Items[index].object.visible then
					Items[index].object.Hide()
					Items[index].object.Move(-32768,-32768)
				//end if
			end if
		else
			Items[index].hidden = false
			if Items[index].ItemType = ITT_OBJECT then
				if Not Items[index].object.visible then
					Items[index].object.Show()
				end if
			end if
		end if
		if Not Items[index].hidden then
			ll_left = Items[index].rcPaint.right + theme.#ItemMargin
		end if
		
	else																												                  /*--- Right items ---*/
		
		if rightSomeHidden then
			Items[index].hidden = true
			if Items[index].ItemType = ITT_OBJECT then
				//if Items[index].object.visible then
					Items[index].object.Hide()
					Items[index].object.Move(-32768,-32768)
				//end if
			end if
			continue
		end if
		
		choose case Items[index].ItemType
			case ITT_LABEL				//Label
				//Set rcText
				Items[index].rcText.left 		= ll_right - Items[index].szText.cx
				Items[index].rcText.right 	= Items[index].rcText.left  + Items[index].szText.cx
				Items[index].rcText.top		= clientRect.top + (itemSize - Items[index].szText.cy) / 2
				Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
				//Set rcPaint
				Painter.CopyRect(ref Items[index].rcPaint,ref Items[index].rcText)
			case ITT_ICON					//Icon
				//Set rcImage
				Items[index].rcImage.left		= ll_right - theme.#IconSize.cx
				Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
				Items[index].rcImage.top		= clientRect.top + (itemSize - theme.#IconSize.cy) / 2
				Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
				//Set rcPaint
				Painter.CopyRect(ref Items[index].rcPaint,ref Items[index].rcImage)
			case ITT_SEPARATOR		//Separator
				Items[index].rcPaint.left		= ll_right - 1
				Items[index].rcPaint.right	= Items[index].rcPaint.left + 1
				Items[index].rcPaint.top		= clientRect.top + 1
				Items[index].rcPaint.bottom	= clientRect.bottom - 1
			case ITT_OBJECT				//Object
				if Items[index].DisplayText and Items[index].szText.cx > 0  then
					//Set object position
					Items[index].object.Move(D2UX(ll_right) - Items[index].object.Width,&
												D2UY(clientRect.Top + (itemSize - Items[index].szObject.cy)/2))
					//Set rcText
					Items[index].rcText.left		= ll_right - Items[index].szObject.cx - 2 - Items[index].szText.cx
					Items[index].rcText.right		= Items[index].rcText.left + Items[index].szText.cx
					Items[index].rcText.top		= clientRect.top + (itemSize - Items[index].szText.cy) / 2
					Items[index].rcText.bottom	= Items[index].rcText.top + Items[index].szText.cy
					//Set rcPaint
					Items[index].rcPaint.left		= Items[index].rcText.left
					Items[index].rcPaint.right	= ll_right
					Items[index].rcPaint.top		= clientRect.top
					Items[index].rcPaint.bottom	= clientRect.bottom
				else
					//Set object position
					Items[index].object.Move(D2UX(ll_right) - Items[index].object.Width,&
												D2UY(clientRect.Top + (itemSize - Items[index].szObject.cy)/2))
					//Set rcPaint
					Items[index].rcPaint.left		= ll_right - Items[index].szObject.cx
					Items[index].rcPaint.right	= ll_right
					Items[index].rcPaint.top		= clientRect.top
					Items[index].rcPaint.bottom	= clientRect.bottom
				end if
			case else									//Button
				//Set chevron
				if Items[index].Chevron.Visible then
					Items[index].Chevron.rcPaint.left		= ll_right - BUTTONCHEVRONSIZE
					Items[index].Chevron.rcPaint.right		= Items[index].Chevron.rcPaint.left + BUTTONCHEVRONSIZE
					Items[index].Chevron.rcPaint.top		= clientRect.top
					Items[index].Chevron.rcPaint.bottom	= clientRect.bottom
					ll_right  = Items[index].Chevron.rcPaint.left
				end if
				
				if _of_HasValidImage(index) then
					if Items[index].DisplayText and Items[index].szText.cx > 0 then
						choose case theme.#IconPosition
							case Enums.LEFT
								//Set rcImage
								Items[index].rcImage.left		= ll_right - 2 - Items[index].szText.cx - 2 - theme.#IconSize.cx
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= clientRect.top + (itemSize - theme.#IconSize.cy) / 2
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cx
								//Set rcText
								Items[index].rcText.left 			= Items[index].rcImage.right + 2
								Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
								Items[index].rcText.top			= clientRect.top + (itemSize - Items[index].szText.cy) / 2
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
							case Enums.TOP
								if Items[index].szText.cx > theme.#IconSize.cx then
									maxSize = Items[index].szText.cx
								else
									maxSize = theme.#IconSize.cx
								end if
								//Set rcImage
								Items[index].rcImage.left		= ll_right - 2 - theme.#IconSize.cx - (maxSize - theme.#IconSize.cx)/2
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= clientRect.top + 2
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
								//Set rcText
								Items[index].rcText.left 			= ll_right  - 2 - Items[index].szText.cx - (maxSize - Items[index].szText.cx) / 2
								Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
								Items[index].rcText.top			= Items[index].rcImage.bottom + 2
								if (clientRect.bottom - Items[index].rcText.top) > Items[index].szText.cy then
									Items[index].rcText.top 		+= (clientRect.bottom - Items[index].rcText.top - Items[index].szText.cy) / 2
								end if
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
							case Enums.RIGHT
								//Set rcImage
								Items[index].rcImage.left		= ll_right - 2 - theme.#IconSize.cx
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= clientRect.top + (itemSize - theme.#IconSize.cy) / 2
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cx
								//Set rcText
								Items[index].rcText.left 			= Items[index].rcImage.left - 2 - Items[index].szText.cx
								Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
								Items[index].rcText.top			= clientRect.top + (itemSize - Items[index].szText.cy) / 2
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
							case Enums.BOTTOM
								if Items[index].szText.cx > theme.#IconSize.cx then
									maxSize = Items[index].szText.cx
								else
									maxSize = theme.#IconSize.cx
								end if
								//Set rcImage
								Items[index].rcImage.left		= ll_right - 2 - theme.#IconSize.cx - (maxSize - theme.#IconSize.cx)/2
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= clientRect.bottom - 2 - theme.#IconSize.cy
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
								//Set rcText
								Items[index].rcText.left 			= ll_right - 2 - Items[index].szText.cx - (maxSize - Items[index].szText.cx) / 2
								Items[index].rcText.right 		= Items[index].rcText.left  + Items[index].szText.cx
								Items[index].rcText.top			= clientRect.top + 2
								if (Items[index].rcImage.top - 2 - Items[index].rcText.top) > Items[index].szText.cy then
									Items[index].rcText.top 		+= (Items[index].rcImage.top - 2 - Items[index].rcText.top - Items[index].szText.cy) / 2
								end if
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
						end choose
					else
						Painter.SetRectEmpty(Items[index].rcText)
						//Set rcImage
						Items[index].rcImage.left		= ll_right - 2 - theme.#IconSize.cx
						Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
						Items[index].rcImage.top		= clientRect.top + (itemSize - theme.#IconSize.cy) / 2
						Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
					end if
				elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
					Painter.SetRectEmpty(Items[index].rcImage)
					//Set rcText
					Items[index].rcText.left 		= ll_right  - 2 - Items[index].szText.cx
					Items[index].rcText.right 	= Items[index].rcText.left  + Items[index].szText.cx
					Items[index].rcText.top		= clientRect.top + (itemSize - Items[index].szText.cy) / 2
					Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
				else
					Painter.SetRectEmpty(Items[index].rcImage)
					Painter.SetRectEmpty(Items[index].rcText)
				end if
				
				//Set rcPaint
				if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
					Items[index].rcPaint.left = Min(Items[index].rcText.left, Items[index].rcImage.left) - 2
				elseif Not Painter.IsRectEmpty(Items[index].rcText) then
					Items[index].rcPaint.left = Items[index].rcText.left - 2
				elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
					Items[index].rcPaint.left = Items[index].rcImage.left - 2
				else
					Items[index].rcPaint.left = ll_right - 4
				end if
				if Items[index].Chevron.Visible then
					Items[index].rcPaint.right	= Items[index].Chevron.rcPaint.right	
				else
					Items[index].rcPaint.right	= ll_right
				end if
				Items[index].rcPaint.top			= clientRect.top
				Items[index].rcPaint.bottom		= clientRect.bottom 
				
				if theme.#FixedSize then
					if Items[index].rcPaint.right - Items[index].rcPaint.left < theme.#ItemMinSize then
						offsetSize = -(theme.#ItemMinSize - (Items[index].rcPaint.right - Items[index].rcPaint.left))
						if Not Painter.IsRectEmpty(Items[index].rcImage) then
							choose case theme.#IconPosition
								case Enums.LEFT
									if Painter.IsRectEmpty(Items[index].rcText) then
										Painter.OffsetRect(Items[index].rcImage,offsetSize / 2,0 )
									else
										Painter.OffsetRect(Items[index].rcImage,offsetSize,0 )
									end if
								case Enums.TOP
									Painter.OffsetRect(Items[index].rcImage,offsetSize / 2,0 )
								case Enums.RIGHT
									if Painter.IsRectEmpty(Items[index].rcText) then
										Painter.OffsetRect(Items[index].rcImage,offsetSize / 2,0 )
									end if
								case Enums.BOTTOM
									Painter.OffsetRect(Items[index].rcImage,offsetSize / 2,0 )
							end choose
						end if
						if Not Painter.IsRectEmpty(Items[index].rcText) then
							Items[index].rcText.left += offsetSize
						end if
						Items[index].rcPaint.left += offsetSize
					end if
				end if
		end choose
		
		if Items[index].rcPaint.left < ll_left then
			Items[index].hidden = true
			rightSomeHidden = true
			if Items[index].ItemType = ITT_OBJECT then
				//if Items[index].object.visible then
					Items[index].object.Hide()
					Items[index].object.Move(-32768,-32768)
				//end if
			end if
		else
			Items[index].hidden = false
			if Items[index].ItemType = ITT_OBJECT then
				if Not Items[index].object.visible then
					Items[index].object.Show()
				end if
			end if
		end if
		if Not Items[index].hidden then
			ll_right = Items[index].rcPaint.left - theme.#ItemMargin
		end if
	end if
next
end subroutine

private subroutine _of_updatepointsv ();int index
real ll_top,ll_bottom
real itemSize
real maxSize
real offsetSize
boolean topSomeHidden,bottomSomeHidden
RECTF clientRect

clientRect = rcClient
_of_AdjustRect(ref clientRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CHEVRON)

ll_top		= clientRect.top
ll_bottom	= clientRect.bottom
itemSize = clientRect.right - clientRect.left

for index = 1 to UpperBound(Items)
	if Not Items[index].visible then continue
	
	if Items[index].position = Left! then																					/*--- Left items ---*/
		if topSomeHidden then
			Items[index].hidden = true
			if Items[index].ItemType = ITT_OBJECT then
				//if Items[index].object.visible then
					Items[index].object.Hide()
					Items[index].object.Move(-32768,-32768)
				//end if
			end if
			continue
		end if
		
		choose case Items[index].ItemType
			case ITT_LABEL				//Label
				//Set rcText
				Items[index].rcText.left 		= clientRect.left
				Items[index].rcText.right 	= clientRect.right
				Items[index].rcText.top		= ll_top
				Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
				//Set rcPaint
				Items[index].rcPaint.left		= clientRect.left
				Items[index].rcPaint.right	= clientRect.right
				Items[index].rcPaint.top		= ll_top
				Items[index].rcPaint.bottom = Items[index].rcText.bottom
			case ITT_ICON					//Icon
				//Set rcImage
				Items[index].rcImage.left		= clientRect.left  + (itemSize - theme.#IconSize.cx)/2
				Items[index].rcImage.right		= Items[index].rcImage.left + theme.#IconSize.cx
				Items[index].rcImage.top		= ll_top
				Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
				//Set rcPaint
				Items[index].rcPaint.left		= clientRect.left
				Items[index].rcPaint.right	= clientRect.right
				Items[index].rcPaint.top		= ll_top
				Items[index].rcPaint.bottom = Items[index].rcImage.bottom
			case ITT_SEPARATOR		//Separator
				Items[index].rcPaint.left		= clientRect.left + 1
				Items[index].rcPaint.right	= clientRect.right - 1
				Items[index].rcPaint.top		= ll_top
				Items[index].rcPaint.bottom	= Items[index].rcPaint.top + 1
			case ITT_OBJECT				//Object
				if Items[index].DisplayText and Items[index].szText.cy > 0  then
					//Set rcText
					Items[index].rcText.left 			= clientRect.left
					Items[index].rcText.right 		= clientRect.right
					Items[index].rcText.top			= ll_top
					Items[index].rcText.bottom 		= ll_top + Items[index].szText.cy
					//Set object position
					Items[index].object.Move(D2UX(clientRect.Left + (itemSize - Items[index].szObject.cx)/2),&
												D2UY(Items[index].rcText.bottom + 2))
					//Set rcPaint
					Items[index].rcPaint.left		= clientRect.left
					Items[index].rcPaint.right	= clientRect.right
					Items[index].rcPaint.top		= ll_top
					Items[index].rcPaint.bottom	= Items[index].rcText.bottom + 2 + Items[index].szObject.cy
				else
					Painter.SetRectEmpty(Items[index].rcText)
					//Set object position
					Items[index].object.Move(D2UX(clientRect.Left + (itemSize - Items[index].szObject.cx)/2),&
												D2UY(ll_top))
					//Set rcPaint
					Items[index].rcPaint.left		= clientRect.left
					Items[index].rcPaint.right	= clientRect.right
					Items[index].rcPaint.top		= ll_top
					Items[index].rcPaint.bottom	= ll_top + Items[index].szObject.cy
				end if
			case else							//Button
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
								Items[index].rcImage.left		= clientRect.left  + 2
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= ll_top + 2 + (maxSize - theme.#IconSize.cy) / 2
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
								//Set rcText
								Items[index].rcText.left 			= Items[index].rcImage.right + 2
								Items[index].rcText.right 		= clientRect.right - 2
								Items[index].rcText.top			= ll_top + 2 + (maxSize - Items[index].szText.cy) / 2
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
							case Enums.TOP
								//Set rcImage
								Items[index].rcImage.left		= clientRect.left  + (itemSize - theme.#IconSize.cx)/2
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= ll_top + 2
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
								//Set rcText
								Items[index].rcText.left 			= clientRect.left  + 2
								Items[index].rcText.right 		= clientRect.right  - 2
								Items[index].rcText.top			= Items[index].rcImage.bottom + 2
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
							case Enums.RIGHT
								if Items[index].szText.cy > theme.#IconSize.cy then
									maxSize = Items[index].szText.cy
								else
									maxSize = theme.#IconSize.cy
								end if
								//Set rcImage
								Items[index].rcImage.left		= clientRect.right  - 2 - theme.#IconSize.cx
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= ll_top + 2 + (maxSize - theme.#IconSize.cy) / 2
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
								//Set rcText
								Items[index].rcText.left 			= clientRect.left + 2
								Items[index].rcText.right 		= Items[index].rcImage.left - 2
								Items[index].rcText.top			= ll_top + 2 + (maxSize - Items[index].szText.cy) / 2
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
							case Enums.BOTTOM
								//Set rcImage
								Items[index].rcImage.left		= clientRect.left  + (itemSize - theme.#IconSize.cx)/2
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= ll_top + 2 + Items[index].szText.cy + 2
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
								//Set rcText
								Items[index].rcText.left 			= clientRect.left  + 2
								Items[index].rcText.right 		= clientRect.right  - 2
								Items[index].rcText.top			= ll_top + 2
								Items[index].rcText.bottom 		= Items[index].rcImage.top - 2
						end choose
					else
						Painter.SetRectEmpty(Items[index].rcText)
						//Set rcImage
						Items[index].rcImage.left		= clientRect.left  + (itemSize - theme.#IconSize.cx)/2
						Items[index].rcImage.right		= Items[index].rcImage.left + theme.#IconSize.cx
						Items[index].rcImage.top		= ll_top + 2
						Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
					end if
				elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
					Painter.SetRectEmpty(Items[index].rcImage)
					//Set rcText
					Items[index].rcText.left 		= clientRect.left  + 2 
					Items[index].rcText.right 	= clientRect.right - 2
					Items[index].rcText.top		= ll_top + 2
					Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
				else
					Painter.SetRectEmpty(Items[index].rcImage)
					Painter.SetRectEmpty(Items[index].rcText)
				end if
				
				//Set rcPaint
				Items[index].rcPaint.left			= clientRect.left
				Items[index].rcPaint.right		= clientRect.right
				Items[index].rcPaint.top			= ll_top
				if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
					Items[index].rcPaint.bottom = Max(Items[index].rcText.bottom, Items[index].rcImage.bottom) + 2
				elseif Not Painter.IsRectEmpty(Items[index].rcText) then
					Items[index].rcPaint.bottom = Items[index].rcText.bottom + 2
				elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
					Items[index].rcPaint.bottom = Items[index].rcImage.bottom + 2
				else
					Items[index].rcPaint.bottom = Items[index].rcPaint.top + 4
				end if
				
				//Set chevron
				if Items[index].Chevron.Visible then
					Items[index].Chevron.rcPaint.left		= clientRect.left
					Items[index].Chevron.rcPaint.right		= clientRect.right
					Items[index].Chevron.rcPaint.top		= Items[index].rcPaint.bottom
					Items[index].Chevron.rcPaint.bottom	= Items[index].Chevron.rcPaint.top + BUTTONCHEVRONSIZE
					Items[index].rcPaint.bottom 			= Items[index].Chevron.rcPaint.bottom
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
						if Items[index].Chevron.Visible then
							Painter.OffsetRect(Items[index].Chevron.rcPaint,0,offsetSize )
						end if
						Items[index].rcPaint.bottom += offsetSize
					end if
				end if
		end choose
		
		if Items[index].rcPaint.bottom > ll_bottom then
			Items[index].hidden = true
			topSomeHidden = true
			if Items[index].ItemType = ITT_OBJECT then
				//if Items[index].object.visible then
					Items[index].object.Hide()
					Items[index].object.Move(-32768,-32768)
				//end if
			end if
		else
			Items[index].hidden = false
			if Items[index].ItemType = ITT_OBJECT then
				if Not Items[index].object.visible then
					Items[index].object.Show()
				end if
			end if
		end if
		
		if Not Items[index].hidden then
			ll_top = Items[index].rcPaint.bottom + theme.#ItemMargin
		end if
		
	else																																	/*--- Right items ---*/
		
		if bottomSomeHidden then
			Items[index].hidden = true
			if Items[index].ItemType = ITT_OBJECT then
				//if Items[index].object.visible then
					Items[index].object.Hide()
					Items[index].object.Move(-32768,-32768)
				//end if
			end if
			continue
		end if
		
		choose case Items[index].ItemType
			case ITT_LABEL				//Label
				//Set rcText
				Items[index].rcText.left 		= clientRect.left
				Items[index].rcText.right 	= clientRect.right
				Items[index].rcText.top		= ll_bottom -  Items[index].szText.cy
				Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
				//Set rcPaint
				Items[index].rcPaint.left		= clientRect.left
				Items[index].rcPaint.right	= clientRect.right
				Items[index].rcPaint.top 		= Items[index].rcText.top
				Items[index].rcPaint.bottom	= ll_bottom
			case ITT_ICON					//Icon
				//Set rcImage
				Items[index].rcImage.left		= clientRect.left  + (itemSize - theme.#IconSize.cx)/2
				Items[index].rcImage.right		= Items[index].rcImage.left + theme.#IconSize.cx
				Items[index].rcImage.top		= ll_bottom - theme.#IconSize.cy
				Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
				//Set rcPaint
				Items[index].rcPaint.left		= clientRect.left
				Items[index].rcPaint.right	= clientRect.right
				Items[index].rcPaint.top 		= Items[index].rcImage.top
				Items[index].rcPaint.bottom	= ll_bottom
			case ITT_SEPARATOR 		//Separator
				Items[index].rcPaint.left	= clientRect.left + 1
				Items[index].rcPaint.right	= clientRect.right - 1
				Items[index].rcPaint.top		= ll_bottom - 1
				Items[index].rcPaint.bottom	= Items[index].rcPaint.top + 1
			case ITT_OBJECT				//Object
				if Items[index].DisplayText and Items[index].szText.cy > 0  then
					//Set rcText
					Items[index].rcText.left 			= clientRect.left
					Items[index].rcText.right 		= clientRect.right
					Items[index].rcText.top			= ll_bottom - Items[index].szObject.cy - 2 - Items[index].szText.cy
					Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
					//Set object position
					Items[index].object.Move(D2UX(clientRect.Left + (itemSize - Items[index].szObject.cx)/2),&
												D2UY(Items[index].rcText.bottom + 2))
					//Set rcPaint
					Items[index].rcPaint.left		= clientRect.left
					Items[index].rcPaint.right	= clientRect.right
					Items[index].rcPaint.top		= Items[index].rcText.top
					Items[index].rcPaint.bottom	= Items[index].rcText.bottom + 2 + Items[index].szObject.cy
				else
					Painter.SetRectEmpty(Items[index].rcText)
					//Set object position
					Items[index].object.Move(D2UX(clientRect.Left + (itemSize - Items[index].szObject.cx)/2),&
												D2UY(ll_bottom - Items[index].szObject.cy))
					//Set rcPaint
					Items[index].rcPaint.left		= clientRect.left
					Items[index].rcPaint.right	= clientRect.right
					Items[index].rcPaint.top		= ll_bottom - Items[index].szObject.cy
					Items[index].rcPaint.bottom	= ll_bottom
				end if
			case else							//Button
				//Set chevron
				if Items[index].Chevron.Visible then
					Items[index].Chevron.rcPaint.left		= clientRect.left
					Items[index].Chevron.rcPaint.right		= clientRect.right
					Items[index].Chevron.rcPaint.top		= ll_bottom - BUTTONCHEVRONSIZE
					Items[index].Chevron.rcPaint.bottom	= Items[index].Chevron.rcPaint.top + BUTTONCHEVRONSIZE
					ll_bottom = Items[index].Chevron.rcPaint.top
				end if
				
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
								Items[index].rcImage.left		= clientRect.left  + 2
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= ll_bottom - 2 - theme.#IconSize.cy - (maxSize - theme.#IconSize.cy) / 2
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
								//Set rcText
								Items[index].rcText.left 			= Items[index].rcImage.right + 2
								Items[index].rcText.right 		= clientRect.right - 2
								Items[index].rcText.top			= ll_bottom - 2 - Items[index].szText.cy - (maxSize - Items[index].szText.cy) / 2
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
							case Enums.TOP
								//Set rcImage
								Items[index].rcImage.left		= clientRect.left  + (itemSize - theme.#IconSize.cx)/2
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= ll_bottom - 2 - Items[index].szText.cy - 2 - theme.#IconSize.cy
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
								//Set rcText
								Items[index].rcText.left 			= clientRect.left  + 2
								Items[index].rcText.right 		= clientRect.right  - 2
								Items[index].rcText.top			= Items[index].rcImage.bottom + 2
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
							case Enums.RIGHT
								if Items[index].szText.cy > theme.#IconSize.cy then
									maxSize = Items[index].szText.cy
								else
									maxSize = theme.#IconSize.cy
								end if
								//Set rcImage
								Items[index].rcImage.left		= clientRect.right  - 2 - theme.#IconSize.cx
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= ll_bottom - 2 - theme.#IconSize.cy - (maxSize - theme.#IconSize.cy) / 2
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
								//Set rcText
								Items[index].rcText.left 			= clientRect.left + 2
								Items[index].rcText.right 		= Items[index].rcImage.left - 2
								Items[index].rcText.top			= ll_bottom - 2 - Items[index].szText.cy - (maxSize - Items[index].szText.cy) / 2
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
							case Enums.BOTTOM
								//Set rcImage
								Items[index].rcImage.left		= clientRect.left  + (itemSize - theme.#IconSize.cx)/2
								Items[index].rcImage.right 		= Items[index].rcImage.left + theme.#IconSize.cx
								Items[index].rcImage.top		= ll_bottom - 2 - theme.#IconSize.cy
								Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
								//Set rcText
								Items[index].rcText.left 			= clientRect.left  + 2
								Items[index].rcText.right 		= clientRect.right  - 2
								Items[index].rcText.top			= Items[index].rcImage.top - 2 - Items[index].szText.cy
								Items[index].rcText.bottom 		= Items[index].rcText.top + Items[index].szText.cy
						end choose
					else
						Painter.SetRectEmpty(Items[index].rcText)
						//Set rcImage
						Items[index].rcImage.left		= clientRect.left  + (itemSize - theme.#IconSize.cx)/2
						Items[index].rcImage.right		= Items[index].rcImage.left + theme.#IconSize.cx
						Items[index].rcImage.top		= ll_bottom - 2 - theme.#IconSize.cy
						Items[index].rcImage.bottom 	= Items[index].rcImage.top + theme.#IconSize.cy
					end if
				elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
					Painter.SetRectEmpty(Items[index].rcImage)
					//Set rcText
					Items[index].rcText.left 		= clientRect.left  + 2 
					Items[index].rcText.right 	= clientRect.right - 2
					Items[index].rcText.top		= ll_bottom - 2 -  Items[index].szText.cy
					Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
				else
					Painter.SetRectEmpty(Items[index].rcImage)
					Painter.SetRectEmpty(Items[index].rcText)
				end if
				
				//Set rcPaint
				Items[index].rcPaint.left			= clientRect.left
				Items[index].rcPaint.right		= clientRect.right
				if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
					Items[index].rcPaint.top = Min(Items[index].rcText.top, Items[index].rcImage.top) - 2
				elseif Not Painter.IsRectEmpty(Items[index].rcText) then
					Items[index].rcPaint.top = Items[index].rcText.top - 2
				elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
					Items[index].rcPaint.top = Items[index].rcImage.top - 2
				else
					Items[index].rcPaint.top = ll_bottom - 4
				end if
				if Items[index].Chevron.Visible then
					Items[index].rcPaint.bottom	= Items[index].Chevron.rcPaint.bottom
				else
					Items[index].rcPaint.bottom	= ll_bottom
				end if
				
				if theme.#FixedSize then
					if Items[index].rcPaint.bottom - Items[index].rcPaint.top < theme.#ItemMinSize then
						offsetSize = -(theme.#ItemMinSize - (Items[index].rcPaint.bottom - Items[index].rcPaint.top))
						if Not Painter.IsRectEmpty(Items[index].rcImage) then
							Painter.OffsetRect(Items[index].rcImage,0,offsetSize / 2 )
						end if
						if Not Painter.IsRectEmpty(Items[index].rcText) then
							Painter.OffsetRect(Items[index].rcText,0,offsetSize / 2 )
						end if
						Items[index].rcPaint.top += offsetSize
					end if
				end if
		end choose
		
		if Items[index].rcPaint.top < ll_top then
			Items[index].hidden = true
			bottomSomeHidden = true
			if Items[index].ItemType = ITT_OBJECT then
				//if Items[index].object.visible then
					Items[index].object.Hide()
					Items[index].object.Move(-32768,-32768)
				//end if
			end if
		else
			Items[index].hidden = false
			if Items[index].ItemType = ITT_OBJECT then
				if Not Items[index].object.visible then
					Items[index].object.Show()
				end if
			end if
		end if
		if Not Items[index].hidden then
			ll_bottom = Items[index].rcPaint.top - theme.#ItemMargin
		end if
	end if
next
end subroutine

public function long of_displaytext (readonly integer index, readonly boolean display);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not _of_IsButton(index) then return RetCode.E_NO_SUPPORT
if Items[index].DisplayText = display then return RetCode.OK

Items[index].DisplayText = display

if Items[index].Visible then
	of_UpdatePoints()
end if

return RetCode.OK
end function

public function long of_displaytextall (readonly boolean display);int index

for index = 1 to UpperBound(Items)
	if Not _of_IsButton(index) then continue
	Items[index].DisplayText = display
next

of_UpdatePoints()

return RetCode.OK
end function

public function long of_enable (readonly integer index, readonly boolean benabled);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType = ITT_SEPARATOR then return RetCode.E_NO_SUPPORT
if Items[index].enabled = bEnabled then return RetCode.OK

Items[index].enabled = bEnabled
_of_DrawItem(index,true)

return RetCode.OK
end function

public function long of_flash (readonly integer index, readonly long flashtime);//flashtime:sec
//-1:always
//0:stop
if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not _of_IsButton(index) then return RetCode.E_NO_SUPPORT
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

object = Items[index].Object

return iif(IsValidObject(object),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function long of_getpopupmenu (readonly integer index, ref n_cst_popupmenu popupmenu);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

try
	PopupMenu = Items[index].PopupMenu
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(PopupMenu),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function long of_highlight (readonly integer index, boolean highlighted);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not _of_IsButton(index) then return RetCode.E_NO_SUPPORT
if Items[index].HighLighted = highlighted then return RetCode.OK

Items[index].HighLighted = highlighted

_of_DrawItem(index,true)

return RetCode.OK
end function

public function long of_remove (readonly integer index);int i
boolean bVisible
TOOLBARITEM newItems[]

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

if index = _mouseOverIndex then
	_mouseOverIndex = 0
end if
if index = _mouseDownIndex then
	_mouseDownIndex = 0
end if

bVisible = Items[index].Visible

if Items[index].ItemType = ITT_OBJECT and IsValidObject(Items[index].object) then
	Items[index].object.Hide()
	if Items[index].hOldParent > 0 then
		Win32.SetParent(Handle(Items[index].object),Items[index].hOldParent)
	end if
	if Items[index].ObjectOwner then
		_of_CloseUserObject(Items[index].Object)
	end if
end if
if Items[index].MenuOwner then
	Destroy Items[index].PopupMenu
end if
if IsValidObject(Items[index].AnimatedImage) then
	Destroy Items[index].AnimatedImage
end if

for i = 1 to UpperBound(Items)
	if i = index then continue
	newItems[UpperBound(newItems) + 1] = Items[i]
next

Items = newItems

if bVisible then
	of_UpdatePoints()
end if

_of_ShowTip(0)

return RetCode.OK
end function

public function long of_removeall ();int index
TOOLBARITEM emptyItems[]

for index = 1 to UpperBound(Items)
	if Items[index].ItemType = ITT_OBJECT and IsValidObject(Items[index].object) then
		Items[index].object.Hide()
		if Items[index].hOldParent > 0 then
			Win32.SetParent(Handle(Items[index].object),Items[index].hOldParent)
		end if
		if Items[index].objectOwner then
			_of_CloseUserObject(Items[index].Object)
		end if
	end if
	if Items[index].MenuOwner then
		Destroy Items[index].PopupMenu
	end if
	if IsValidObject(Items[index].AnimatedImage) then
		Destroy Items[index].AnimatedImage
	end if
next

Items = emptyItems

_mouseOverIndex = 0
_mouseDownIndex = 0

of_UpdatePoints()
_of_ShowTip(0)

return RetCode.OK
end function

public function long of_setimage (readonly integer index, readonly string image);int newImgIndex
boolean dirty

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if (Not _of_IsButton(index) and Items[index].ItemType <> ITT_ICON)  then return RetCode.E_NO_SUPPORT
if Items[index].image = image then return RetCode.OK

newImgIndex = _ImageList.AddImage(theme.of_GetItemIcon(index,image,0))

if Items[index].ItemType = ITT_ICON and newImgIndex = 0 then
	return RetCode.E_INVALID_IMAGE
end if

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
if Items[index].ItemType <> ITT_LABEL and Items[index].ItemType <> ITT_OBJECT and Not _of_IsButton(index) then return RetCode.E_NO_SUPPORT
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
if Not _of_IsButton(index) then return RetCode.E_NO_SUPPORT
if Items[index].tipText = tiptext then return RetCode.OK

Items[index].tipText = tiptext

return RetCode.OK
end function

public function long of_toggle (readonly integer index, readonly boolean toggled);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType = ITT_DROPDOWN or Items[index].ItemType = ITT_OBJECT then return RetCode.E_NO_SUPPORT
if Not _of_IsButton(index)  then return RetCode.E_NO_SUPPORT
if Items[index].Toggled = toggled then return RetCode.OK

Items[index].Toggled = toggled

_of_DrawItem(index,true)

return RetCode.OK
end function

public function long of_updatepoints ();if #LockUpdate then return RetCode.FAILED

_of_RecalcLayout()
_of_UpdatePoints()
of_Redraw(false)

return RetCode.OK
end function

public function long of_visible (readonly integer index, readonly boolean bvisible);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].visible= bVisible then return RetCode.OK

Items[index].visible= bVisible
if Items[index].ItemType = ITT_OBJECT then
	if bVisible then
		Items[index].Object.Show()
	else
		Items[index].Object.Hide()
	end if
end if

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

public function integer of_getindexbyclassname (readonly string clsname);int index

for index = 1 to UpperBound(Items)
	if ClassName(Items[index].Object) = Lower(clsName) then return index
next

return 0
end function

public function alignment of_getitemposition (readonly integer index);if index < 1 or index > UpperBound(Items) then return Left!

return Items[index].Position
end function

public function long of_settiptime (readonly integer index, readonly long tiptime);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType = ITT_SEPARATOR or Items[index].ItemType = ITT_OBJECT then return RetCode.E_NO_SUPPORT

Items[index].TipTime = tipTime

return RetCode.OK
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
	if Items[index].MouseDown or Items[index].Toggled then
		Painter.of_Drawtext(hdc,theme.Font,Items[index].text,Items[index].rcText.left,Items[index].rcText.top + 1,Items[index].rcText.right,Items[index].rcText.bottom + 1,textColor,dtparam)
	else
		Painter.of_Drawtext(hdc,theme.Font,Items[index].text,Items[index].rcText,textColor,dtparam)
	end if
else
	if Items[index].MouseDown or Items[index].Toggled then
		Painter.of_DrawVerticalText(hdc,theme.Font,Items[index].text,Items[index].rcText.left,Items[index].rcText.top + 1,Items[index].rcText.right,Items[index].rcText.bottom + 1,textColor,dtparam)
	else
		Painter.of_DrawVerticalText(hdc,theme.Font,Items[index].text,Items[index].rcText,textColor,dtparam)
	end if
end if
end subroutine

private subroutine _of_drawitemchevron (readonly integer index, readonly unsignedlong hdc);constant real ARROWSIZE = 6
ulong lineColor,arrowColor,nState
POINTF pt1,pt2,pt3

nState = of_GetItemState(index)
lineColor 	= theme.of_GetItemColor(index,theme.CLR_LINE,nState)
arrowColor	= theme.of_GetItemColor(index,theme.CLR_ARROW,nState)

//Draw line
if Items[index].ItemType = ITT_SPLIT and (Items[index].Enabled) then
	if (Not Items[index].MouseOver and Not Items[index].MouseDown and &
		Not Items[index].Chevron.MouseDown and Not Items[index].Toggled) and &
		(Items[index].HighLighted or ((Items[index].FlashTime = -1 or Items[index].FlashTime > 0) and Items[index].flashing)) then
		if theme.#ItemOrientation = Enums.HORZ then
			Painter.DrawLine(hdc,&
						Items[index].Chevron.rcPaint.left,&
						Items[index].Chevron.rcPaint.top + 1,&
						Items[index].Chevron.rcPaint.left,&
						Items[index].Chevron.rcPaint.bottom - 1,&
						lineColor,Enums.LS_SOLID,&
						false,1)
		else
			Painter.DrawLine(hdc,&
						Items[index].Chevron.rcPaint.left + 1,&
						Items[index].Chevron.rcPaint.top,&
						Items[index].Chevron.rcPaint.right - 1,&
						Items[index].Chevron.rcPaint.top,&
						lineColor,Enums.LS_SOLID,&
						false,1)
		end if
	end if
end if

//Draw arrow
pt1.x = Items[index].Chevron.rcPaint.left + (Items[index].Chevron.rcPaint.right - Items[index].Chevron.rcPaint.left - ARROWSIZE) / 2
pt1.y = Items[index].Chevron.rcPaint.top + (Items[index].Chevron.rcPaint.bottom - Items[index].Chevron.rcPaint.top - ARROWSIZE / 2) / 2
if Items[index].Chevron.mousedown or (Items[index].ItemType = ITT_DROPDOWN and Items[index].mousedown) then
	pt1.y += 1
end if
pt2.x = pt1.x + ARROWSIZE
pt2.y = pt1.y
pt3.x = pt1.x + ARROWSIZE / 2
pt3.y = pt1.y + ARROWSIZE / 2

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

private subroutine _of_drawchevron (readonly unsignedlong hdc);real nX,nY
long nRow
ulong borderColor,arrowColor,bkColor,nState
Constant real ARROWSIZE = 6

if Not Chevron.Visible then return

nState = of_GetChevronState()

if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
	bkColor	= theme.of_GetColor(theme.CLR_CHEVRONBKGND,nState)
	borderColor = theme.of_GetColor(theme.CLR_BORDER,0)
	Painter.ThemeFill(hdc,Chevron.rcPaint,bkColor,theme.#BkgndOrientation,theme.#ItemBkgndStyle,nState,false,Enums.BS_SOLID,borderColor,0)
end if

if theme.#ItemOrientation = Enums.HORZ then
	nX = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE)/2
	nY = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - (ARROWSIZE / 2) - ARROWSIZE + 1)/2
else
	nX = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE * 2 + 2)/2
	nY = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - ARROWSIZE)/2
end if

if Chevron.MouseDown then
	nY += 1
end if

//Draw arrow
POINTF pt1,pt2,pt3

arrowColor = theme.of_GetColor(theme.CLR_ARROW,0)

if theme.#ItemOrientation = Enums.HORZ then
	pt1.x = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE)/2
	pt1.y = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - (ARROWSIZE / 2) - ARROWSIZE + 1) / 2 + ARROWSIZE + 1
else
	pt1.x = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE * 2 + 2)/2 + ARROWSIZE + 2
	pt1.y = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - ARROWSIZE / 2)/2
end if

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
end subroutine

private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc);ulong bkColor,borderColor,nState
ulong chevronBorderColor,chevronBkColor,nChevronState
RADIUSF rdBorder,rdChevron
RECTF paintRect

if Not Items[index].Visible or Items[index].Hidden then return

nState = of_GetItemState(index)

choose case Items[index].ItemType
	case ITT_LABEL					//Label
		_of_DrawItemText(index,hdc)
	case ITT_ICON						//Icon
		if Items[index].UseAnimatedImage then
			Items[index].AnimatedImage.Draw(hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].enabled )
		else
			_ImageList.Draw(Items[index].imageindex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].Enabled)
		end if
	case ITT_SEPARATOR			//Separator
		borderColor = theme.of_GetItemColor(index,theme.CLR_LINE,nState)
		if theme.#ItemOrientation = Enums.HORZ then
			if theme.#BkgndStyle = Enums.SOLID then
				Painter.of_DrawLine(hdc,&
							Items[index].rcPaint.left,&
							Items[index].rcPaint.top,&
							Items[index].rcPaint.left,&
							Items[index].rcPaint.bottom,&
							borderColor,false,1)
			else
				Painter.of_DrawGradientLine(hdc,&
							Items[index].rcPaint.left,&
							Items[index].rcPaint.top,&
							Items[index].rcPaint.left,&
							Items[index].rcPaint.bottom,&
							borderColor,true,true,1)
			end if
		else
			if theme.#BkgndStyle = Enums.SOLID then
				Painter.of_DrawLine(hdc,&
							Items[index].rcPaint.left,&
							Items[index].rcPaint.top,&
							Items[index].rcPaint.right,&
							Items[index].rcPaint.top,&
							borderColor,false,1)
			else
				Painter.of_DrawGradientLine(hdc,&
							Items[index].rcPaint.left,&
							Items[index].rcPaint.top,&
							Items[index].rcPaint.right,&
							Items[index].rcPaint.top,&
							borderColor,true,true,1)
			end if
		end if
	case else									//Button
		//Fill background
		if Items[index].enabled or Items[index].toggled then
			bkColor = theme.of_GetItemColor(index,theme.CLR_BKGND,nState)
			borderColor = theme.of_GetItemColor(index,theme.CLR_BORDER,nState)
			rdBorder = theme.#ItemRoundSize
			if Items[index].ItemType = ITT_SPLIT then
				nChevronState = of_GetItemChevronState(index)
				chevronBkColor = theme.of_GetItemColor(index,theme.CLR_CHEVRONBKGND,nChevronState)
				chevronBorderColor = theme.of_GetItemColor(index,theme.CLR_CHEVRONBORDER,nChevronState)
				if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 and BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
					if Items[index].Flashing then
						bkColor = ARGBLighten(bkColor,0.4)
					end if
				end if
				if theme.#ItemOrientation = Enums.VERT then
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
		//Draw image
		if Items[index].UseAnimatedImage then
			if Items[index].MouseDown or Items[index].Toggled then
				Items[index].AnimatedImage.Draw(hdc, Items[index].rcImage.left ,Items[index].rcImage.top + 1,Not Items[index].enabled )
			else
				Items[index].AnimatedImage.Draw(hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].enabled )
			end if
		else
			if Items[index].imageIndex > 0 then
				if Items[index].MouseDown or Items[index].Toggled then
					_ImageList.Draw(Items[index].imageindex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top + 1,Not Items[index].Enabled)
				else
					_ImageList.Draw(Items[index].imageindex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top,Not Items[index].Enabled)
				end if
			end if
		end if
		//Draw text
		if Items[index].DisplayText and Items[index].szText.cx>0 then
			_of_DrawItemText(index,hdc)
		end if
		//Draw chevron
		if Items[index].Chevron.Visible then
			_of_DrawItemChevron(index,hdc)
		end if
end choose
end subroutine

private subroutine _of_fillbkgnd (readonly unsignedlong hdc);ulong transparentColor

transparentColor = theme.of_GetColor(theme.CLR_TRANSPARENT,0)

//填充透明色
if transparentColor <> 0 then
	Painter.of_FillRect( hdc, rcClient,  transparentColor,false,0) 
end if

Painter.ThemeFill( hdc, rcClient, theme.of_GetColor(theme.CLR_BKGND,0),theme.#BkgndOrientation,theme.#BkgndStyle,0,false,&
										theme.#BorderStyle,theme.of_GetColor(theme.CLR_BORDER,0),theme.#RoundSize)
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

public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position);return of_InsertMenuButton(UpperBound(Items)+1,PopupMenu,txt,image,tiptxt,position)
end function

public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt);return of_AddMenuButton(PopupMenu,txt,image,tiptxt,left!)
end function

public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly alignment position);return of_AddMenuButton(popupmenu,txt,image,"",position)
end function

public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image);return of_AddMenuButton(popupmenu,txt,image,"",left!)
end function

public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position);return of_InsertSplitButton(UpperBound(Items)+1,PopupMenu,txt,image,tiptxt,position)
end function

public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt);return of_AddSplitButton(PopupMenu,txt,image,tiptxt,left!)
end function

public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly alignment position);return of_AddSplitButton(popupmenu,txt,image,"",position)
end function

public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image);return of_AddSplitButton(popupmenu,txt,image,"",left!)
end function

public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image);return of_InsertMenuButton(index,popupmenu,txt,image,"",left!)
end function

public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position);int i
TOOLBARITEM newItem

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

if Not IsValidObject(PopupMenu) then
	if Not _of_CreatePopupMenu(ref PopupMenu) then return RetCode.E_INVALID_OBJECT
	newItem.MenuOwner = true
	PopupMenu.#Tag = ""
elseif PopupMenu.#Tag = PRP_POPUPMENUCREATOR then
	newItem.MenuOwner = true
	PopupMenu.#Tag = ""
end if

newItem.PopupMenu = PopupMenu
newItem.Text = txt
newItem.tipText = tiptxt
newItem.enabled = true
newItem.visible = true
newItem.DisplayText = true
newItem.Chevron.Visible = true
newItem.ItemType = ITT_DROPDOWN
newItem.position = position

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

if len(image) > 0 then
	Items[index].image = image
	Items[index].imageindex = _ImageList.AddImage(theme.of_GetItemIcon(index,image,0))
end if

_of_UpdateTextSize(index)

of_UpdatePoints()

return index
end function

public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt);return of_InsertMenuButton(index,PopupMenu,txt,image,tiptxt,Left!)
end function

public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly alignment position);return of_InsertMenuButton(index,popupmenu,txt,image,"",position)
end function

public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position);int i
TOOLBARITEM newItem

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

if Not IsValidObject(PopupMenu) then
	if Not _of_CreatePopupMenu(ref PopupMenu) then return RetCode.E_INVALID_OBJECT
	newItem.MenuOwner = true
	PopupMenu.#Tag = ""
elseif PopupMenu.#Tag = PRP_POPUPMENUCREATOR then
	newItem.MenuOwner = true
	PopupMenu.#Tag = ""
end if

newItem.PopupMenu = PopupMenu
newItem.Text = txt
newItem.tipText = tiptxt
newItem.enabled = true
newItem.visible = true
newItem.DisplayText = true
newItem.Chevron.Visible = true
newItem.ItemType = ITT_SPLIT
newItem.position = position

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

if len(image) > 0 then
	Items[index].image = image
	Items[index].imageindex = _ImageList.AddImage(theme.of_GetItemIcon(index,image,0))
end if

_of_UpdateTextSize(index)

of_UpdatePoints()

return index
end function

public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly string tiptxt);return of_InsertSplitButton(index,PopupMenu,txt,image,tiptxt,left!)
end function

public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image, readonly alignment position);return of_InsertSplitButton(index,popupmenu,txt,image,"",position)
end function

public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string txt, readonly string image);return of_InsertSplitButton(index,popupmenu,txt,image,"",left!)
end function

public function integer of_addmenubutton (readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position);return of_InsertMenuButton(UpperBound(Items)+1,clsName,txt,image,tiptxt,position)
end function

public function integer of_addmenubutton (readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt);return of_AddMenuButton(clsName,txt,image,tiptxt,Left!)
end function

public function integer of_addmenubutton (readonly string clsname, readonly string txt, readonly string image, readonly alignment position);return of_AddMenuButton(clsName,txt,image,"",Position)
end function

public function integer of_addmenubutton (readonly string clsname, readonly string txt, readonly string image);return of_AddMenuButton(clsName,txt,image,"",Left!)
end function

public function integer of_addsplitbutton (readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position);return of_InsertSplitButton(UpperBound(Items)+1,clsName,txt,image,tiptxt,position)
end function

public function integer of_addsplitbutton (readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt);return of_AddSplitButton(clsName,txt,image,tiptxt,Left!)
end function

public function integer of_addsplitbutton (readonly string clsname, readonly string txt, readonly string image, readonly alignment position);return of_AddSplitButton(clsName,txt,image,"",Position)
end function

public function integer of_addsplitbutton (readonly string clsname, readonly string txt, readonly string image);return of_AddSplitButton(clsName,txt,image,"",Left!)
end function

public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image);return of_InsertMenuButton(index,clsName,txt,Image,"",Left!)
end function

public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position);int newIndex
n_cst_popupmenu popupMenu

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE
if Not _of_CreatePopupMenu(ref popupMenu,clsName) then return RetCode.E_INVALID_TYPE

newIndex = of_InsertMenuButton(index,ref popupMenu,txt,image,tipTxt,position)
if newIndex <= 0 then
	Destroy popupMenu
end if

return newIndex
end function

public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt);return of_InsertMenuButton(index,clsName,txt,Image,tipTxt,Left!)
end function

public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly alignment position);return of_InsertMenuButton(index,clsName,txt,Image,"",Position)
end function

public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt, readonly alignment position);int newIndex
n_cst_popupmenu popupMenu

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE
if Not _of_CreatePopupMenu(ref popupMenu,clsName) then return RetCode.E_INVALID_TYPE

newIndex = of_InsertSplitButton(index,ref popupMenu,txt,image,tipTxt,position)
if newIndex <= 0 then
	Destroy popupMenu
end if

return newIndex
end function

public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly string tiptxt);return of_InsertSplitButton(index,clsName,txt,Image,tipTxt,Left!)
end function

public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image, readonly alignment position);return of_InsertSplitButton(index,clsName,txt,Image,"",Position)
end function

public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string txt, readonly string image);return of_InsertSplitButton(index,clsName,txt,Image,"",Left!)
end function

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

public function integer of_insertlabel (readonly integer index, readonly string txt, readonly alignment position);int i
TOOLBARITEM newItem

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

newItem.Text = txt
newItem.enabled = true
newItem.visible = true
newItem.DisplayText = true
newItem.ItemType = ITT_LABEL
newItem.position = position

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

_of_UpdateTextSize(index)

of_UpdatePoints()

return index
end function

public function integer of_insertlabel (readonly integer index, readonly string txt);return of_InsertLabel(index,txt,Left!)
end function

public function integer of_inserticon (readonly integer index, readonly string image, readonly alignment position);int i
TOOLBARITEM newItem

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

newItem.enabled = true
newItem.visible = true
newItem.ItemType = ITT_ICON
newItem.position = position

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

if len(image) > 0 then
	Items[index].image = image
	Items[index].imageindex = _ImageList.AddImage(theme.of_GetItemIcon(index,image,0))
end if

of_UpdatePoints()

return index
end function

public function integer of_inserticon (readonly integer index, readonly string image);return of_InsertIcon(index,image,Left!)
end function

public function integer of_addlabel (readonly string txt, readonly alignment position);return of_InsertLabel(UpperBound(Items)+1,txt,position)
end function

public function integer of_addlabel (readonly string txt);return of_AddLabel(txt,Left!)
end function

public function integer of_addicon (readonly string image, readonly alignment position);return of_InsertIcon(UpperBound(Items)+1,image,position)
end function

public function integer of_addicon (readonly string image);return of_AddIcon(image,Left!)
end function

private function boolean _of_isbutton (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

choose case Items[index].ItemType
	case ITT_LABEL,ITT_ICON,ITT_SEPARATOR,ITT_OBJECT
		return false
end choose

return true
end function

private function boolean _of_hasvalidimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

if Items[index].UseAnimatedImage then
	return (Items[index].AnimatedImage.GetFrameCount() > 0)
else
	return (Items[index].imageIndex > 0)
end if
end function

public function boolean of_isusedanimatedimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].UseAnimatedImage
end function

public function long of_setanimatedimage (readonly integer index, readonly string amimage);int frameCount
boolean rt

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not _of_IsButton(index) and Items[index].ItemType <> ITT_ICON then return RetCode.E_NO_SUPPORT
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

private subroutine _of_drawitem (readonly integer index, readonly boolean bimageonly, readonly boolean fadeanimation);ulong safeDC

if #LockUpdate then return
if Not Visible then return
if index < 1 or index > UpperBound(Items) then return
if Not Items[index].visible or Items[index].hidden then return
if Items[index].ItemType = ITT_OBJECT then return

safeDC=GetSafeDC()

if safeDC = 0 then return

if bImageOnly then
	Painter.IntersectClipRect(safeDC,Items[index].rcImage)
else
	Painter.IntersectClipRect(safeDC,Items[index].rcPaint)
end if

if #Transparent then
	FillParentBkgnd(safeDC)
end if

Event OnEraseBkgnd(safeDC)

_of_DrawItem(index,safeDC)

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

public function long of_useanimatedimage (readonly integer index, readonly boolean used);int frameCount

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not IsValidObject(Items[index].AnimatedImage) then return RetCode.E_INVALID_OBJECT
if Items[index].UseAnimatedImage = used then return RetCode.OK

Items[index].UseAnimatedImage = used
frameCount = Items[index].AnimatedImage.GetFrameCount()

if (Items[index].imageIndex > 0) <> (frameCount > 0) then
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

public function long of_getitemtype (readonly integer index);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
return Items[index].ItemType
end function

public function long of_setitemtype (readonly integer index, readonly long ntype);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if nType < ITT_NORMAL or nType > ITT_SEPARATOR then return RetCode.E_INVALID_ARGUMENT
if Items[index].ItemType = nType then return RetCode.OK
if Items[index].ItemType = ITT_OBJECT or nType = ITT_OBJECT then return RetCode.E_NO_SUPPORT

choose case nType
	case ITT_NORMAL,ITT_LABEL,ITT_ICON,ITT_SEPARATOR
		if Items[index].MenuOwner then
			Destroy Items[index].PopupMenu
		end if
		SetNull(Items[index].PopupMenu)
		Items[index].MenuOwner = false
end choose
choose case nType
	case ITT_LABEL,ITT_SEPARATOR
		if IsValidObject(Items[index].AnimatedImage) then
			Destroy Items[index].AnimatedImage
		end if
end choose

Items[index].ItemType = nType
Items[index].Chevron.Visible = (nType = ITT_SPLIT or nType = ITT_DROPDOWN)
of_UpdatePoints()

return RetCode.OK
end function

public function unsignedlong of_getchevronstate ();ulong nState

if Chevron.MouseDown then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if Chevron.MouseOver then nState += Enums.STATE_HOVER
end if

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
	adjRect.left += theme.#BorderMargin.left
	adjRect.top += theme.#BorderMargin.top
	adjRect.right -= theme.#BorderMargin.right
	adjRect.bottom -= theme.#BorderMargin.bottom
end if

if BitAND(flags,ADJ_CHEVRON) > 0 then
	if Chevron.visible then
		if theme.#ItemOrientation = Enums.HORZ then
			adjRect.right -= TOOLBARCHEVRONSIZE
		else
			adjRect.bottom -= TOOLBARCHEVRONSIZE
		end if
	end if
end if
end subroutine

private function unsignedlong _of_popupmenu (readonly integer index, real xpos, real ypos);//Item chevron menu
ulong rtCode
ulong pmFlags

if index < 1 or index > UpperBound(Items) then return 0
if Not IsValidObject(Items[index].PopupMenu) then return 0

Items[index].PopupMenu.of_SetToolTip(#ToolTip)
Items[index].PopupMenu.theme.of_SetTheme(theme)

if theme.#ItemOrientation = Enums.HORZ then
	if Items[index].ItemType = ITT_DROPDOWN then
		xpos = Items[index].rcPaint.Left
		ypos = Items[index].rcPaint.Bottom
	elseif Items[index].ItemType = ITT_SPLIT then
		xpos = Items[index].Chevron.rcPaint.Left
		ypos = Items[index].Chevron.rcPaint.Bottom
	end if
else
	if Items[index].ItemType = ITT_DROPDOWN then
		xpos = Items[index].rcPaint.Right
		ypos = Items[index].rcPaint.Top
	elseif Items[index].ItemType = ITT_SPLIT then
		xpos = Items[index].Chevron.rcPaint.Right
		ypos = Items[index].Chevron.rcPaint.Top
	end if
end if

pmFlags = Win32.TPM_LEFTALIGN + Win32.TPM_TOPALIGN
if IsPrevented(Event OnPopupMenu(index,ref xpos,ref ypos,ref pmFlags)) then return 0

rtCode = Items[index].PopupMenu.of_Popup(#Handle,xpos,ypos,pmFlags)
if rtCode > 0 then
	if IsAllowed(Event OnMenuSelecting(index,rtCode)) then
		Post Event OnMenuSelected(index,rtCode)
	end if
end if

_lastPopupIndex = index
_lastPopupTime = Cpu()

return rtCode
end function

private function unsignedlong _of_popup (real xpos, real ypos);int count,index
ulong rtCode
ulong pFlags
n_cst_toolbarstrip_popup ln_popup

ln_popup = Create n_cst_toolbarstrip_popup
ln_popup.Event OnInit(this,_ImageList,_ToolTip)
ln_popup.Event OnInitData(Items,0)

if theme.#ItemOrientation = Enums.HORZ then
	xpos = Chevron.rcPaint.Right
	ypos = Chevron.rcPaint.Bottom - 1
	pFlags = Win32.TPM_RIGHTALIGN + Win32.TPM_TOPALIGN + Win32.TPM_WORKAREA
else
	xpos = Chevron.rcPaint.Right - 1
	ypos = Chevron.rcPaint.Bottom
	pFlags = Win32.TPM_LEFTALIGN + Win32.TPM_BOTTOMALIGN + Win32.TPM_WORKAREA
end if

rtCode = ln_popup.of_Popup(#Handle,xpos,ypos,pFlags)

Destroy ln_popup

_lastPopupIndex = IDX_CHEVRON
_lastPopupTime = Cpu()

return rtCode
end function

private function boolean _of_isoverchevron (readonly integer index, readonly real xpos, readonly real ypos);if index < 1 or index > UpperBound(Items) then return false

if Items[index].enabled and Items[index].visible and &
	Not Items[index].hidden and Items[index].ItemType = ITT_SPLIT then
	if Painter.PtInRect(Items[index].Chevron.rcPaint,xpos,ypos) then
		return true
	end if
end if

return false
end function

public function integer of_indexfrompoint (readonly real xpos, readonly real ypos);int index

if Not Painter.PtInRect(rcClient,xpos,ypos) then return 0

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
	if Not Items[index].visible or Items[index].hidden or Not Items[index].enabled or Not _of_IsButton(index) then continue
	
	if Painter.PtInRect(Items[index].rcPaint,xpos,ypos) then
		return index
	end if

next

return 0
end function

public function boolean of_isseparator (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].itemType = ITT_SEPARATOR
end function

on u_cst_toolbarstrip.create
call super::create
this.theme=create theme
this.timer=create timer
end on

on u_cst_toolbarstrip.destroy
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

Painter.GetClientRect(#Handle,ref rcClient) 
end event

event onuninit;call super::onuninit;int index

for index = 1 to UpperBound(Items)
	if Items[index].ItemType = ITT_OBJECT and IsValidObject(Items[index].object) then
		Items[index].object.Hide()
		if Items[index].hOldParent > 0 then
			Win32.SetParent(Handle(Items[index].object),Items[index].hOldParent)
		end if
		if Items[index].objectOwner then
			_of_CloseUserObject(Items[index].Object)
		end if
	end if
	if Items[index].MenuOwner then
		Destroy Items[index].PopupMenu
	end if
	if IsValidObject(Items[index].AnimatedImage) then
		Destroy Items[index].AnimatedImage
	end if
next

Destroy _ImageList

if _TTID > 0 then
	_ToolTip.DelTool(#Handle,_TTID)
end if
Destroy _ToolTip
Timer.StopAll()
end event

type uo_logo from u_cst_canvas`uo_logo within u_cst_toolbarstrip
string tag = "ToolBarStrip"
end type

type theme from n_cst_toolbarstrip_theme within u_cst_toolbarstrip descriptor "pb_nvo" = "true" 
end type

on theme.create
call super::create
end on

on theme.destroy
call super::destroy
end on

event onthemechanged;call super::onthemechanged;int index
boolean dirty
		
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
	case EVT_TEXTORIENTATION
		_of_UpdateTextSize()
		dirty = true
	case EVT_TEXTALIGN
		dirty = true
	case EVT_ICONPOSITION
		_of_UpdateTextSize()
		dirty = true
	case EVT_FIXEDSIZE
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
		if theme.#FixedSize then
			dirty = true
		end if
	case EVT_ITEMMARGIN
		dirty = true
	case EVT_BORDERMARGIN
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

type timer from n_timer within u_cst_toolbarstrip descriptor "pb_nvo" = "true" 
end type

event ontimer;int index
boolean bContinue
	
if id = TM_FLASH then
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
elseif id = TM_ANIMATION then
	for index = 1 to UpperBound(Items)
		if Not Items[index].UseAnimatedImage then continue
		if Not Items[index].AnimatedImage.IsPlaying() then continue
		bContinue = true
		if Not Items[index].Visible or Items[index].Hidden then continue
		if Items[index].AnimatedImage.IsFrameChanged() then
			Items[index].AnimatedImage.NextFrame()
			_of_DrawItem(index,true,false)
		end if
	next
end if

return bContinue
end event

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

