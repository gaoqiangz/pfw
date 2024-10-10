$PBExportHeader$w_cst_tabfloat.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type w_cst_tabfloat from s_cst_window
end type
end forward

global type w_cst_tabfloat from s_cst_window
integer width = 2409
integer height = 1596
string title = ""
windowtype windowtype = popup!
boolean center = false
boolean #bordershadow = true
event onclosewindow ( )
event ontablock ( boolean block )
event ontabthemechanged ( unsignedinteger eventflag )
event onattach ( tabcontrolitem item )
event ondetach ( )
end type
global w_cst_tabfloat w_cst_tabfloat

type variables
/*--- Properties ---*/
Public:
PrivateWrite u_cst_tabcontrol	#ParentTabControl
PrivateWrite DragObject			#Object
PrivateWrite Window				#ObjectW
PrivateWrite Boolean				#IsWindow
PrivateWrite Boolean				#IsOLE

/*--- Implementation ---*/
Private:
TABCONTROLITEM TabItem

boolean _inClosing
boolean _inSetPos

//Indexes
Constant Uint IDX_PIN = 4
//System button icon
Constant String ICO_PIN	= "pfw://zip/images[win-pin.svg]"
//System button tiptext
Constant String TIP_PIN	= "固定"
end variables

forward prototypes
public function boolean wf_isclosing ()
public function integer wf_gettabindex ()
end prototypes

event onclosewindow();if _inClosing then return
_inClosing = true
Close(this)
end event

event ontablock(boolean block);CaptionBar.of_Visible(CaptionBar.IDX_CLOSE,Not bLock)
end event

event ontabthemechanged(unsignedinteger eventflag);choose case eventFlag
	case #ParentTabControl.theme.EVT_THEME
		theme.of_SetBkgndColorStyle(#ParentTabControl.theme.#BkgndColorStyle)
		theme.of_SetBkgndStyle(#ParentTabControl.theme.#ItemBkgndStyle)
		theme.of_SetItemBkgndStyle(#ParentTabControl.theme.#ItemBkgndStyle)
		choose case #ParentTabControl.theme.#TabStyle
			case #ParentTabControl.theme.TBS_REGULAR
				theme.of_SetItemStyle(theme.ITS_XP)
			case #ParentTabControl.theme.TBS_OFFICE
				theme.of_SetItemStyle(theme.ITS_VISTA)
			case #ParentTabControl.theme.TBS_RIBBON
				theme.of_SetItemStyle(theme.ITS_QQ)
			case #ParentTabControl.theme.TBS_SOLID
				theme.of_SetItemStyle(theme.ITS_WIN8)
		end choose
	case #ParentTabControl.theme.EVT_BKGNDCOLORSTYLE
		theme.of_SetBkgndColorStyle(#ParentTabControl.theme.#BkgndColorStyle)
	case #ParentTabControl.theme.EVT_TABSTYLE
		choose case #ParentTabControl.theme.#TabStyle
			case #ParentTabControl.theme.TBS_REGULAR
				theme.of_SetItemStyle(theme.ITS_XP)
			case #ParentTabControl.theme.TBS_OFFICE
				theme.of_SetItemStyle(theme.ITS_VISTA)
			case #ParentTabControl.theme.TBS_RIBBON
				theme.of_SetItemStyle(theme.ITS_QQ)
			case #ParentTabControl.theme.TBS_SOLID
				theme.of_SetItemStyle(theme.ITS_WIN8)
		end choose
	case #ParentTabControl.theme.EVT_ITEMBKGNDSTYLE
		theme.of_SetBkgndStyle(#ParentTabControl.theme.#ItemBkgndStyle)
		theme.of_SetItemBkgndStyle(#ParentTabControl.theme.#ItemBkgndStyle)
end choose
end event

event onattach(tabcontrolitem item);int index
boolean bNewPos,bNewSize
RECT rcClient

TabItem = item

#ParentTabControl = TabItem.ParentTabControl
#Object = TabItem.Object
#ObjectW = TabItem.ObjectW
#IsWindow = TabItem.IsWindow
#IsOLE = TabItem.IsOLE

index = wf_GetTabIndex()
if index = #ParentTabControl.of_GetSelectedIndex() then
	if index = #ParentTabControl.of_SelectNext(index) then
		#ParentTabControl.of_SelectPrevious(index)
	end if
end if

if #IsWindow then
	Win32.SetParent(Handle(#ObjectW),Handle(this))
	if Not #ObjectW.Visible then
		#ObjectW.Show()
	end if
else
	Win32.SetParent(Handle(#Object),Handle(this))
	if Not #Object.Visible then
		#Object.Show()
	end if
end if

#LockUpdate = true

Title = TabItem.Text
Icon = TabItem.Image

CaptionBar.#LockUpdate = true
CaptionBar.of_SetTitle(Title)
CaptionBar.of_SetIcon(Icon)
CaptionBar.of_Visible(CaptionBar.IDX_CLOSE,Not TabItem.Locked)
CaptionBar.#LockUpdate = false
CaptionBar.of_UpdatePoints()

Event OnTabThemeChanged(theme.EVT_THEME)

_inSetPos = true
if WindowState <> Maximized! and WindowState <> Minimized! then
	bNewPos = (TabItem.FloatPos.x > -32768 and TabItem.FloatPos.y > -32768)
	bNewSize = (TabItem.FloatSize.cx > 0 and TabItem.FloatSize.cy > 0)
	if Not bNewPos and Not bNewSize then
		Center = true
	end if
end if
if bNewPos or bNewSize then
	Win32.SetWindowPos(#Handle,0,D2PX(TabItem.FloatPos.x),D2PY(TabItem.FloatPos.y),D2PX(TabItem.FloatSize.cx),D2PY(TabItem.FloatSize.cy),+&
								iif(Not bNewPos,Win32.SWP_NOMOVE,0) + iif(Not bNewSize,Win32.SWP_NOSIZE,0) + Win32.SWP_NOZORDER + Win32.SWP_NOACTIVATE)
end if
_inSetPos = false

Win32.GetClientRect(#Handle,ref rcClient)
Event Resize(0,P2UX(rcClient.right),P2UY(rcClient.bottom))

#LockUpdate = false
wf_UpdatePoints()
end event

event ondetach();TABCONTROLITEM item

TabItem = item

SetNull(#ParentTabControl)
SetNull(#Object)
SetNull(#ObjectW)
#IsWindow = false
#IsOLE = false

if WindowState <> Normal! then
	WindowState = Normal!
end if
end event

public function boolean wf_isclosing ();return _inClosing
end function

public function integer wf_gettabindex ();if #IsWindow then
	return #ParentTabControl.of_GetIndex(#ObjectW)
else
	return #ParentTabControl.of_GetIndex(#Object)
end if
end function

event onpreopen;call super::onpreopen;TABCONTROLITEM item

item = Message.PowerObjectParm

if item.IsPage then
	item.page.Event OnGetFloatMinSize(ref #MinWidth,ref #MinHeight)
elseif TabItem.IsPageW then
	item.pagew.Event OnGetFloatMinSize(ref #MinWidth,ref #MinHeight)
end if
end event

on w_cst_tabfloat.create
call super::create
end on

on w_cst_tabfloat.destroy
call super::destroy
end on

event resize;call super::resize;ulong hWnd
real newX,newY
real objectWidth,objectHeight

if _inSetPos then return 0
if Not IsValidObject(#ParentTabControl) then return 0

objectWidth = U2DX(newWidth)
objectHeight = U2DY(newHeight)

if TabItem.IsPage then
	TabItem.Page.Event OnReposition(ref newX,ref newY,ref objectWidth,ref objectHeight)
elseif TabItem.IsPageW then
	TabItem.PageW.Event OnReposition(ref newX,ref newY,ref objectWidth,ref objectHeight)
end if
#ParentTabControl.Event OnObjectReposition(wf_GetTabIndex(),ref newX,ref newY,ref objectWidth,ref objectHeight)

if #IsWindow then
	Win32.SetWindowPos(Handle(#ObjectW),D2PX(newX),D2PY(newY),D2PX(objectWidth),D2PY(objectHeight))
else
	if #IsOLE then
		#Object.Move(D2UX(newX),D2UY(newY))
		#Object.Resize(D2UX(objectWidth),D2UY(objectHeight))
	else
		Win32.SetWindowPos(Handle(#Object),D2PX(newX),D2PY(newY),D2PX(objectWidth),D2PY(objectHeight))
	end if
end if

return 0
end event

event closequery;call super::closequery;if Not IsValidObject(#ParentTabControl) then return 0
if Not _inClosing then
	#ParentTabControl.of_Remove(wf_GetTabIndex())
	return 1
end if

return 0
end event

event onbuttonclicked;call super::onbuttonclicked;if ObjectType = WOT_TITLEBAR then
	if index = IDX_PIN then
		#ParentTabControl.of_Dock(wf_GetTabIndex())
	end if
end if
end event

event close;call super::close;if Not IsValidObject(#ParentTabControl) then return 0
if Not _inClosing then
	_inClosing = true
	#ParentTabControl.of_Remove(wf_GetTabIndex(),true)
end if

return 0
end event

event open;call super::open;string sTxt

sTxt = I18N(Enums.I18N_CAT_TABCONTROL,TIP_PIN)
CaptionBar.of_AddButton(sTxt,ICO_PIN,sTxt,Right!)

Event OnAttach(Message.PowerObjectParm)
end event

type menubar from s_cst_window`menubar within w_cst_tabfloat
boolean #enabled = true
boolean #sheetlistbutton = true
real #itemmargin = 2
end type

type statusbar from s_cst_window`statusbar within w_cst_tabfloat
boolean #enabled = true
real #itemmargin = 2
end type

type captionbar from s_cst_window`captionbar within w_cst_tabfloat
boolean #enabled = true
real #itemmargin = 2
end type

