$PBExportHeader$n_cst_window_titlebar.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_window_titlebar from nonvisualobject
end type
type titledata from structure within n_cst_window_titlebar
end type
type icondata from structure within n_cst_window_titlebar
end type
type itemdata from structure within n_cst_window_titlebar
end type
type timer from n_timer within n_cst_window_titlebar
end type
type linkfont from n_cst_font within n_cst_window_titlebar
end type
type font from n_cst_font within n_cst_window_titlebar
end type
end forward

type titledata from structure
	rectf		rctext
end type

type icondata from structure
	integer		index
	rectf		rcimage
end type

type itemdata from structure
	unsignedinteger		itemtype
	alignment		position
	unsignedinteger		flag
	boolean		enabled
	boolean		visible
	boolean		hidden
	boolean		displaytext
	boolean		mouseover
	boolean		mousedown
	boolean		toggled
	boolean		highlighted
	boolean		flashing
	long		flashtime
	string		text
	string		tiptext
	long		tiptime
	string		image
	integer		imageindex
	string		amimage
	n_image		animatedimage
	boolean		useanimatedimage
	n_cst_popupmenu		popupmenu
	boolean		menuowner
	paintpane		chevron
	any		data
	string		tag
	sizef		sztext
	rectf		rctext
	rectf		rcimage
	rectf		rcpaint
end type

global type n_cst_window_titlebar from nonvisualobject
event oninit ( s_cst_window parentwindow,  n_canvas canvas,  n_tooltip tooltip )
event type long onhittest ( real xpos,  real ypos )
event type long onwindowsizing ( boolean widthchanged,  boolean heightchanged,  real newwidth,  real newheight )
event type long onpaint ( unsignedlong hdc )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event onmouseleave ( )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event onthemechanged ( unsignedinteger eventflag )
event type boolean ontimer ( unsignedinteger id )
event oncapturechanged ( )
event type long onsystembuttonchanged ( )
event type long oniconchanged ( unsignedlong hicon )
event type long onerasebkgnd ( unsignedlong hdc )
event type long onclose ( )
event onpreopen ( )
timer timer
linkfont linkfont
font font
end type
global n_cst_window_titlebar n_cst_window_titlebar

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

/*--- Constants ---*/
Public:
//Indexes
Constant Int	IDX_CHEVRON	= -1
//- System button indexes
Constant Int	IDX_CLOSE		= 1
Constant Int	IDX_MAX			= 2
Constant Int	IDX_MINI			= 3

/*--- Properties ---*/
Public:
PrivateWrite		s_cst_window	#ParentWindow
ProtectedWrite	Boolean			#Enabled			= true
ProtectedWrite	String				#Title
ProtectedWrite	String				#Icon
ProtectedWrite real				#ItemMargin		= 2
ProtectedWrite SIZEF				#IconSize
Boolean								#LockUpdate

/*--- Implementation ---*/
Private:
n_cst_window_theme		theme
n_canvas						_Canvas
n_imagelist					_ImageList
n_imagelist					_ImageList_Icon
n_tooltip						_ToolTip
ITEMDATA					Items[]
PAINTPANE					Chevron
ICONDATA					IconData
TITLEDATA					TitleData
RECTF							rcPaint

Ulong _TTID	

Ulong _hCurHand
Ulong _hCurArrow

Int		_hitTestIndex  			= 0
Int		_mouseOverIndex  	= 0
Int		_mouseDownIndex	= 0
Int		_lastPopupIndex		= 0
Ulong	_lastPopupTime		= 0

//System icon indexes
Int		_maxIconIndex			= 0
Int		_restoreIconIndex		= 0
Int		_miniIconIndex			= 0

Boolean _MouseOver 			= false
Boolean _MouseCaptured	= false

//Window object type
Constant Int WOT_TITLEBAR	= s_cst_window.WOT_TITLEBAR
//Item types
Constant Uint ITT_CLOSE 		= 0
Constant Uint ITT_MAX			= 1
Constant Uint ITT_MINI 			= 2
Constant Uint ITT_NORMAL		= 3
Constant Uint ITT_DROPDOWN	= 4
Constant Uint ITT_SPLIT			= 5
Constant Uint ITT_LINK			= 6
Constant Uint ITT_LABEL			= 7
Constant Uint ITT_ICON			= 8
Constant Uint ITT_SEPARATOR	= 9
//Item flags
Constant Uint ITF_NONE		= 0
Constant Uint ITF_BEGIN		= 1
Constant Uint ITF_END		= 2
//System button icon
Constant String ICO_CLOSE 	= "pfw://zip/images[win-close.svg]"
Constant String ICO_MAX 		= "pfw://zip/images[win-maximize.svg]"
Constant String ICO_RESTORE = "pfw://zip/images[win-restore.svg]"
Constant String ICO_MINI 		= "pfw://zip/images[win-minimize.svg]"
//System button tiptext
Constant String TIP_CLOSE 		= "关闭"
Constant String TIP_MAX 		= "最大化"
Constant String TIP_RESTORE 	= "还原"
Constant String TIP_MINI 		= "最小化"
//MDI child notify codes
Constant Uint NCD_RESTORED					= 1
Constant Uint NCD_MAXIMIZED					= 2
Constant Uint NCD_MINIMIZED					= 3
Constant Uint NCD_TITLECHANGED			= 4
Constant Uint NCD_ICONCHANGED				= 5
Constant Uint NCD_SYSBUTTONCHANGED	= 6
//Timer ID
Constant Uint TM_FLASH			= 1
Constant Uint TM_ANIMATION	= 2
//Timer interval (ms)
Constant Uint TMI_ANIMATION	= 15
//Hit-test code
Constant Long HTNOWHERE	= 0
Constant Long HTVALID		= 100
//Adjust flags
Constant Uint ADJ_BORDER 	= 1
//Sizes
Constant real ITEMCHEVRONWIDTH 	= 12 	//px
Constant real CHEVRONWIDTH 	= 14 	//px
Constant real MINTITLEWIDTH 	= 30	//px
//Props
Constant String PRP_POPUPMENUCREATOR = "{POPUPMENU_CREATOR}"
end variables

forward prototypes
private subroutine _of_updatepoints ()
private subroutine _of_updatetextsize (readonly integer index)
private subroutine _of_updatetextsize ()
private subroutine _of_showtip (readonly integer index)
private subroutine _of_drawchevron (readonly boolean fadeanimation)
private subroutine _of_flashdrawitem (readonly integer index)
private function boolean _of_isvisible ()
public function integer of_insertbutton (readonly integer index, readonly string text, readonly string image, readonly string tiptext, readonly alignment position)
public function integer of_Addseparator ()
public function integer of_insertseparator (readonly integer index, readonly alignment position)
public function integer of_insertseparator (readonly integer index)
public function integer of_insertlink (readonly integer index, readonly string text, readonly alignment position)
public function integer of_insertlabel (readonly integer index, readonly string text, readonly alignment position)
public function integer of_insertlabel (readonly integer index, readonly string text)
public function integer of_inserticon (readonly integer index, readonly string image, readonly alignment position)
public function integer of_inserticon (readonly integer index, readonly string image)
public function integer of_insertbutton (readonly integer index, readonly string text, readonly string image, readonly string tiptext)
public function integer of_insertbutton (readonly integer index, readonly string text, readonly string image, readonly alignment position)
public function integer of_insertbutton (readonly integer index, readonly string text, readonly string image)
public function integer of_addseparator (readonly alignment position)
public function integer of_addlink (readonly string text, readonly alignment position)
public function integer of_addlabel (readonly string text, readonly alignment position)
public function integer of_addicon (readonly string image, readonly alignment position)
public function integer of_addlabel (readonly string text)
public function integer of_addicon (readonly string image)
public function integer of_addbutton (readonly string text, readonly string image, readonly string tiptext, readonly alignment position)
public function integer of_addbutton (readonly string text, readonly string image)
public function integer of_addbutton (readonly string text, readonly string image, readonly alignment position)
public function integer of_addbutton (readonly string text, readonly string image, readonly string tiptext)
public function integer of_insertlink (readonly integer index, readonly string text)
public function integer of_addlink (readonly string text)
public function integer of_getcount ()
public function string of_getimage (readonly integer index)
public function long of_getindex (readonly string text)
public function string of_gettext (readonly integer index)
public function string of_gettiptext (readonly integer index)
public function boolean of_isdisplaytext (readonly integer index)
public function boolean of_isenabled (readonly integer index)
public function boolean of_isflashing (readonly integer index)
public function boolean of_ishighlighted (readonly integer index)
public function boolean of_isvisible (readonly integer index)
private subroutine _of_capturemouse (readonly boolean capture)
private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawicon (readonly boolean fadeanimation)
private subroutine _of_drawtitle (boolean fadeanimation)
private function unsignedlong _of_getsafedc ()
private function boolean _of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime)
private function boolean _of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation)
public function long of_displaytext (readonly integer index, readonly boolean display)
public function long of_displaytextall (readonly boolean display)
public function long of_enable (readonly integer index, readonly boolean enabled)
public function long of_flash (readonly integer index, readonly long flashtime)
public function long of_getpopupmenu (readonly integer index, ref n_cst_popupmenu popupmenu)
public function long of_highlight (readonly integer index, readonly boolean highlighted)
public function long of_remove (readonly integer index)
public function long of_removeall ()
public function long of_setenabled (readonly boolean enabled)
public function long of_seticon (readonly string iconname)
public function long of_setimage (readonly integer index, readonly string image)
public function long of_settext (readonly integer index, readonly string text)
public function long of_settiptext (readonly integer index, readonly string tiptext)
public function long of_settitle (readonly string title)
public function long of_updatepoints ()
public function long of_visible (readonly integer index, readonly boolean visible)
private function boolean _of_isbutton (readonly integer index)
public function long of_redraw (readonly boolean fadeanimation)
private subroutine _of_drawtitle (readonly unsignedlong hdc)
private function boolean _of_issysbutton (readonly integer index)
public function alignment of_getitemposition (readonly integer index)
public function long of_settiptime (integer index, long tiptime)
private function boolean _of_isiconic ()
public function boolean of_istoggled (readonly integer index)
public function long of_toggle (readonly integer index, readonly boolean toggled)
public function integer of_getfirstvisible ()
public function integer of_getlastvisible ()
public function integer of_getnextvisible (readonly integer index)
public function integer of_getpreviousvisible (readonly integer index)
private subroutine _of_drawchevron (readonly unsignedlong hdc)
public function any of_getdata (readonly integer index)
public function long of_setdata (readonly integer index, readonly any data)
public function string of_gettag (readonly integer index)
public function long of_settag (readonly integer index, readonly string tag)
private function boolean _of_islockupdate ()
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu)
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu, readonly string clsname)
public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly alignment position)
public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext)
public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly alignment position)
public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image)
public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly alignment position)
public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext)
public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly alignment position)
public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image)
public function integer of_addmenubutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly alignment position)
public function integer of_addmenubutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext)
public function integer of_addmenubutton (readonly string clsname, readonly string text, readonly string image, readonly alignment position)
public function integer of_addmenubutton (readonly string clsname, readonly string text, readonly string image)
public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly alignment position)
public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext)
public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly alignment position)
public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image)
public function long of_setpopupmenu (readonly integer index, ref n_cst_popupmenu popupmenu)
public function long of_setpopupmenu (readonly integer index, readonly string clsname)
private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc)
private subroutine _of_drawitem (readonly integer index, readonly boolean bimageonly, readonly boolean fadeanimation)
private subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation)
private function boolean _of_hasvalidimage (readonly integer index)
public function string of_getanimatedimage (readonly integer index)
public function boolean of_isusedanimatedimage (readonly integer index)
public function long of_setanimatedimage (readonly integer index, readonly string amimage)
public function long of_useanimatedimage (readonly integer index, readonly boolean used)
public function unsignedlong of_getitemstate (readonly integer index)
public function unsignedlong of_getchevronstate ()
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
private function unsignedlong _of_popupmenu (real xpos, real ypos)
private function unsignedlong _of_popupmenu (readonly integer index, real xpos, real ypos)
public function long of_seticonsize (readonly real width, readonly real height)
public function long of_setitemmargin (readonly real margin)
public function integer of_indexfrompoint (readonly real xpos, readonly real ypos)
public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly alignment position)
public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext)
public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly alignment position)
public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image)
public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly alignment position)
public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext)
public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly alignment position)
public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image)
public function integer of_addsplitbutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly alignment position)
public function integer of_addsplitbutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext)
public function integer of_addsplitbutton (readonly string clsname, readonly string text, readonly string image, readonly alignment position)
public function integer of_addsplitbutton (readonly string clsname, readonly string text, readonly string image)
public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly alignment position)
public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext)
public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly alignment position)
public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image)
private subroutine _of_drawitemchevron (readonly integer index, readonly unsignedlong hdc)
private function boolean _of_isoverchevron (readonly integer index, readonly real xpos, readonly real ypos)
public function unsignedlong of_getitemchevronstate (readonly integer index)
end prototypes

event oninit(s_cst_window parentwindow, n_canvas canvas, n_tooltip tooltip);#ParentWindow	= parentwindow
theme				= #ParentWindow.theme

_Canvas = canvas

_ToolTip = tooltip
_TTID = _ToolTip.AddTool(#ParentWindow.#Handle,false,Win32.TTF_TRANSPARENT + Win32.TTF_TRACK + Win32.TTF_ABSOLUTE)

_hCurArrow = Win32.LoadCursor(0,Win32.IDC_ARROW)
_HCurHand = Win32.LoadCursor(0,Win32.IDC_HAND)

//Init _ImageList
_ImageList_Icon.SetImageSize(theme.#IconSize.cx,theme.#IconSize.cy)

/*--- Init system buttons ---*/
//Add close button
Items[IDX_CLOSE].ItemType		= ITT_CLOSE
Items[IDX_CLOSE].Position 			= Right!
Items[IDX_CLOSE].Enabled			= true
Items[IDX_CLOSE].Visible			= #ParentWindow.ControlMenu
Items[IDX_CLOSE].Image			= ICO_CLOSE
Items[IDX_CLOSE].Text			= I18N(Enums.I18N_CAT_WINDOW,TIP_CLOSE)
Items[IDX_CLOSE].TipText			= Items[IDX_CLOSE].Text
//Add max button
Items[IDX_MAX].ItemType			= ITT_MAX
Items[IDX_MAX].Position 			= Right!
Items[IDX_MAX].Enabled			= true
Items[IDX_MAX].Visible				= (#ParentWindow.MaxBox and #ParentWindow.ControlMenu)
if Win32.IsZoomed(#ParentWindow.#Handle) then
	Items[IDX_MAX].Image			= ICO_RESTORE
	Items[IDX_MAX].Text			= I18N(Enums.I18N_CAT_WINDOW,TIP_RESTORE)
	Items[IDX_MAX].TipText			= Items[IDX_MAX].Text
else
	Items[IDX_MAX].Image			= ICO_MAX
	Items[IDX_MAX].Text			= I18N(Enums.I18N_CAT_WINDOW,TIP_MAX)
	Items[IDX_MAX].TipText			= Items[IDX_MAX].Text
end if
//Add min button
Items[IDX_MINI].ItemType			= ITT_MINI
Items[IDX_MINI].Position 			= Right!
Items[IDX_MINI].Enabled			= true
Items[IDX_MINI].Visible				= (#ParentWindow.MinBox and #ParentWindow.ControlMenu)
Items[IDX_MINI].Image				= ICO_MINI
Items[IDX_MINI].Text				= I18N(Enums.I18N_CAT_WINDOW,TIP_MINI)
Items[IDX_MINI].TipText				= Items[IDX_MINI].Text
/*-------------------------------*/
//Init window icon
if Len(#ParentWindow.Icon) > 0 then
	#Icon = #ParentWindow.Icon
	IconData.Index = _ImageList_Icon.AddImage(theme.of_GetIcon(#ParentWindow.Icon,0))
	if IconData.Index = 0 then
		IconData.Index = _ImageList_Icon.AddHIcon(Send(#ParentWindow.#Handle,WinMsg.WM_GETICON,1,0))
	end if
end if

#Title = #ParentWindow.Title
_of_UpdateTextSize()
end event

event type long onhittest(real xpos, real ypos);if Not _of_IsVisible() or Not #Enabled then return HTNOWHERE
if Painter.PtInRect(ref rcPaint,xpos,ypos) then
	if IconData.Index > 0 then
		if Painter.PtInRect(IconData.rcImage,xpos,ypos) then
			return WinMsg.HTCAPTION//WinMsg.HTSYSMENU
		end if
	end if
	_hitTestIndex = of_IndexFromPoint(xpos,ypos)
	if _hitTestIndex <> 0 then
		return HTVALID
	else
		return WinMsg.HTCAPTION
	end if
else
	return HTNOWHERE
end if
end event

event type long onwindowsizing(boolean widthchanged, boolean heightchanged, real newwidth, real newheight);if Not widthChanged and heightChanged then return 0

rcPaint.right 	= newWidth
rcPaint.bottom 	= theme.#TitleBarHeight

//更新MaxButton的图标
if Items[IDX_MAX].Visible then
	if Win32.IsZoomed(#ParentWindow.#Handle) then
		Items[IDX_MAX].Image			= ICO_RESTORE
		Items[IDX_MAX].ImageIndex	= _restoreIconIndex
		Items[IDX_MAX].Text			= I18N(Enums.I18N_CAT_WINDOW,TIP_RESTORE)
		Items[IDX_MAX].TipText			= Items[IDX_MAX].Text
	else
		Items[IDX_MAX].Image			= ICO_MAX
		Items[IDX_MAX].ImageIndex	= _maxIconIndex
		Items[IDX_MAX].Text			= I18N(Enums.I18N_CAT_WINDOW,TIP_MAX)
		Items[IDX_MAX].TipText			= Items[IDX_MAX].Text
	end if
end if

if Items[IDX_MINI].Visible then
	if _of_IsIconic() then
		Items[IDX_MINI].Image			= ICO_RESTORE
		Items[IDX_MINI].ImageIndex	= _restoreIconIndex
		Items[IDX_MINI].Text			= I18N(Enums.I18N_CAT_WINDOW,TIP_RESTORE)
		Items[IDX_MINI].TipText			= Items[IDX_MINI].Text
	else
		Items[IDX_MINI].Image			= ICO_MINI
		Items[IDX_MINI].ImageIndex	= _miniIconIndex
		Items[IDX_MINI].Text			= I18N(Enums.I18N_CAT_WINDOW,TIP_MINI)
		Items[IDX_MINI].TipText			= Items[IDX_MINI].Text
	end if
end if

_of_UpdatePoints()

return 0
end event

event type long onpaint(unsignedlong hdc);int index
RECTF paintRect

if _of_IsLockUpdate() then return 1
if Not _of_IsVisible() then return 1

paintRect = rcPaint
_of_AdjustRect(ref paintRect,ADJ_BORDER)

Painter.IntersectClipRect(hdc,ref paintRect)

_of_DrawTitle( hdc)

if IconData.Index > 0 then
	_ImageList_Icon.Draw(IconData.index,hdc, IconData.rcImage.left, IconData.rcImage.top,Not #Enabled)
end if

if _MouseOver or Not _of_IsIconic() then
	for index = 1 to UpperBound(Items)
		if Not Items[index].Visible or Items[index].Hidden then continue
		_of_DrawItem(index, hdc)
	next
	
	if Chevron.Visible then
		_of_DrawChevron(hdc)
	end if
end if

Painter.SelectClipRgn(hdc,0)

return 1
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);int index

if Not _MouseOver then
	_MouseOver = true
	if _of_IsIconic() then
		of_Redraw(true)
	end if
end if

if _hitTestIndex <> 0 then
	index = _hitTestIndex
	_hitTestIndex = 0
else
	index = of_indexfrompoint(xpos,ypos)
end if

if _mouseOverIndex <> index then
	if _mouseOverIndex > 0 then
		Items[_mouseOverIndex].mouseover=false
		Items[_mouseOverIndex].Chevron.mouseover=false
		_of_DrawItem(_mouseOverIndex,true)
		Win32.SetCursor(_hCurArrow)
		_of_ShowTip(0)
		#ParentWindow.Event OnButtonMouseLeave(_mouseOverIndex,WOT_TITLEBAR)
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
		if Items[_mouseOverIndex].ItemType = ITT_LINK then
			Win32.SetCursor(_hCurHand)
		else
			Win32.SetCursor(_hCurArrow)
		end if
		#ParentWindow.Event OnButtonMouseEnter(_mouseOverIndex,xpos,ypos,WOT_TITLEBAR)
	end if
	
elseif _mouseOverIndex > 0 then
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
	if Items[_mouseOverIndex].ItemType = ITT_LINK then
		Win32.SetCursor(_hCurHand)
	else
		Win32.SetCursor(_hCurArrow)
	end if
	#ParentWindow.Event OnButtonMouseMove(_mouseOverIndex,xpos,ypos,WOT_TITLEBAR)
end if

if index = IDX_CHEVRON then
	if Not Chevron.MouseOver then
		Chevron.MouseOver = true
		_of_DrawChevron(true)
		_of_ShowTip(0)
		#ParentWindow.Event OnButtonMouseEnter(IDX_CHEVRON,xpos,ypos,WOT_TITLEBAR)
	else
		#ParentWindow.Event OnButtonMouseMove(IDX_CHEVRON,xpos,ypos,WOT_TITLEBAR)
	end if
else										
	if Chevron.MouseOver then
		Chevron.MouseOver = false
		_of_DrawChevron(true)
		#ParentWindow.Event OnButtonMouseLeave(IDX_CHEVRON,WOT_TITLEBAR)
	end if
end if

return 1
end event

event onmouseleave();if _MouseOver then
	_MouseOver = false
	if _of_IsIconic() then
		of_Redraw(true)
	end if
end if

if _mouseOverIndex>0 then
	Items[_mouseOverIndex].mouseover=false
	Items[_mouseOverIndex].Chevron.mouseover=false
	_of_DrawItem(_mouseOverIndex,true)
	Win32.SetCursor(_hCurArrow)
	#ParentWindow.Event OnButtonMouseLeave(_mouseOverIndex,WOT_TITLEBAR)
	_mouseOverIndex = 0
end if

if Chevron.MouseOver then
	Chevron.MouseOver = false
	_of_DrawChevron(true)
	#ParentWindow.Event OnButtonMouseLeave(IDX_CHEVRON,WOT_TITLEBAR)
end if

_of_ShowTip(0)
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);int li_mouseOverIndex

if Chevron.MouseOVer then
	if _lastPopupIndex = IDX_CHEVRON and Cpu() - _lastPopupTime < 100 then
		return 1
	end if
	Chevron.MouseDown = true
	_of_DrawChevron(false)
	
	#ParentWindow.Event OnButtonMouseDown(IDX_CHEVRON,xpos,ypos,WOT_TITLEBAR)
	if Not IsValid(this) then return 1
	
	_of_PopupMenu(xpos,ypos)
	
	Chevron.MouseDown = false
	_of_DrawChevron(true)
	return 1
end if

if _mouseOverIndex > 0 then
	
	li_mouseOverIndex = _mouseOverIndex
	_of_ShowTip(0)
	
	if (Items[li_mouseOverIndex].ItemType = ITT_DROPDOWN and Items[li_mouseOverIndex].MouseOver) or&
		(Items[li_mouseOverIndex].ItemType = ITT_SPLIT and Items[li_mouseOverIndex].Chevron.MouseOver) then
		if _lastPopupIndex = li_mouseOverIndex and Cpu() - _lastPopupTime < 100 then
			return 1
		end if
		
		if Items[li_mouseOverIndex].ItemType = ITT_SPLIT then
			Items[li_mouseOverIndex].Chevron.mousedown=true
		else
			Items[li_mouseOverIndex].mousedown=true
			#ParentWindow.Event OnButtonMouseDown(li_mouseOverIndex,xpos,ypos,WOT_TITLEBAR)
			if Not IsValid(this) then return 1
		end if
		
		_of_DrawItem(li_mouseOverIndex,false)
		
		 _of_PopupMenu(li_mouseOverIndex,xpos,ypos)
		 if Not IsValid(this) then return 1
		 
		if Items[li_mouseOverIndex].ItemType = ITT_SPLIT then
			Items[li_mouseOverIndex].Chevron.mousedown=false
		else
			Items[li_mouseOverIndex].mousedown=false
		end if
		_of_DrawItem(li_mouseOverIndex,true)
		
	else
		Items[li_mouseOverIndex].mousedown=true
		_of_DrawItem(li_mouseOverIndex,false)
		_mouseDownIndex = li_mouseOverIndex
		_of_CaptureMouse(true)
		
		if Items[_mouseDownIndex].ItemType = ITT_LINK then
			Win32.SetCursor(_hCurHand)
		else
			Win32.SetCursor(_hCurArrow)
		end if
		
		#ParentWindow.Event OnButtonMouseDown(_mouseDownIndex,xpos,ypos,WOT_TITLEBAR)
	end if
end if

return 1
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);int nMouseDownIndex

if Not _MouseCaptured then return 1

_of_CaptureMouse(false)

if _mouseDownIndex > 0 then
	nMouseDownIndex = _mouseDownIndex
	_mouseDownIndex = 0
	
	Items[nMouseDownIndex].MouseDown = false
	_of_DrawItem(nMouseDownIndex,true)
	
	Win32.SetCursor(_hCurArrow)
	
	#ParentWindow.Event OnButtonMouseUp(nMouseDownIndex,xpos,ypos,WOT_TITLEBAR)
	if Not IsValid(this) then return 1
	
	if nMouseDownIndex = _mouseOverIndex and Not Items[nMouseDownIndex].Chevron.MouseOver then			//Clicked
		if IsAllowed(#ParentWindow.Event OnButtonclicking(nMouseDownIndex,WOT_TITLEBAR)) then
			if Not IsValid(this) then return 1
			#ParentWindow.Event OnButtonclicked(nMouseDownIndex,WOT_TITLEBAR)
			if Not IsValid(this) then return 1
			choose case nMouseDownIndex
				case IDX_CLOSE
					Close(#ParentWindow)
				case IDX_MAX
					if #ParentWindow.wf_IsMaximized() then
						#ParentWindow.wf_SetWindowStateAsync(Normal!)
					else
						#ParentWindow.wf_SetWindowStateAsync(Maximized!)
					end if
				case IDX_MINI
					if Win32.IsShowInTaskBar(#ParentWindow.#Handle) then
						#ParentWindow.wf_SetWindowStateAsync(Minimized!)
					else
						if #ParentWindow.wf_IsMinimized() then
							#ParentWindow.wf_SetWindowStateAsync(Normal!)
						else
							#ParentWindow.wf_SetWindowStateAsync(Minimized!)
						end if
					end if
			end choose
		end if
	end if
end if

return 1
end event

event onthemechanged(unsignedinteger eventflag);boolean dirty,bFrameChanged
choose case eventFlag
	case theme.EVT_THEME
		_ImageList_Icon.SetImageSize(theme.#IconSize.cx,theme.#IconSize.cy)
		dirty = true
		bFrameChanged = true
	case theme.EVT_BORDERSTYLE
		dirty = true
		bFrameChanged = true
	case theme.EVT_ICONSIZE
		_ImageList_Icon.SetImageSize(theme.#IconSize.cx,theme.#IconSize.cy)
		dirty = true
	case theme.EVT_ITEMSTYLE
		dirty = true
	case theme.EVT_TITLEBARHEIGHT
		dirty = true
		bFrameChanged = true
	case theme.EVT_BORDERMARGIN
		dirty = true
		bFrameChanged = true
	case theme.EVT_FONT
		dirty = true
end choose

if dirty then
	if Not bFrameChanged then
		of_UpdatePoints()
	end if
else
	if eventFlag = theme.EVT_TITLEALIGN then
		_of_DrawTitle(false)
	else
		of_Redraw(true)
	end if
end if
end event

event type boolean ontimer(unsignedinteger id);int index
boolean bContinue
	
if id = TM_FLASH then
	for index = 1 to UpperBound(Items)
		if Items[index].FlashTime = 0 then continue
		if Items[index].FlashTime > 0 then
			Items[index].FlashTime -= #ParentWindow.#FlashFadeTime
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

event oncapturechanged();if _MouseCaptured then
	_of_CaptureMouse(false)
	if _mouseDownIndex>0 then
		Items[_mouseDownIndex].mousedown=false
		_of_DrawItem(_mouseDownIndex,true)
		#ParentWindow.Event OnButtonMouseUp(_mouseDownIndex,0,0,WOT_TITLEBAR)
		_mouseDownIndex = 0
	end if
	Event onMouseLeave()
end if
end event

event type long onsystembuttonchanged();Items[IDX_CLOSE].Visible	= #ParentWindow.ControlMenu
Items[IDX_MAX].Visible		= (#ParentWindow.MaxBox and #ParentWindow.ControlMenu)
Items[IDX_MINI].Visible		= (#ParentWindow.MinBox and #ParentWindow.ControlMenu)
of_UpdatePoints()

return 0
end event

event type long oniconchanged(unsignedlong hicon);int newIconIndex

#Icon = #ParentWindow.Icon

if Len(#ParentWindow.Icon) > 0 then
	newIconIndex = _ImageList_Icon.AddImage(theme.of_GetIcon(#ParentWindow.Icon,0))
	if newIconIndex = 0 then
		newIconIndex = _ImageList_Icon.AddHIcon(hIcon)
	end if
else
	newIconIndex = 0
end if

if IconData.index <> newIconIndex then
	if (IconData.index > 0) <> (newIconIndex > 0) then
		IconData.index = newIconIndex
		of_UpdatePoints()
	else
		IconData.index = newIconIndex
		_of_DrawIcon(false)
	end if
end if

return 0
end event

event type long onerasebkgnd(unsignedlong hdc);#ParentWindow.Event OnNcEraseBkgnd(hdc)

return 1
end event

event type long onclose();if _TTID > 0 then
	_ToolTip.DelTool(#ParentWindow.#Handle,_TTID)
end if
return 0
end event

event onpreopen();/*--- Init system buttons ---*/
_maxIconIndex = _ImageList.AddImage(theme.of_GetItemIcon(IDX_MAX,ICO_MAX,0,WOT_TITLEBAR))
_restoreIconIndex = _ImageList.AddImage(theme.of_GetItemIcon(IDX_MAX,ICO_RESTORE,0,WOT_TITLEBAR))
_miniIconIndex = _ImageList.AddImage(theme.of_GetItemIcon(IDX_MINI,ICO_MINI,0,WOT_TITLEBAR))
//Add close button
Items[IDX_CLOSE].ImageIndex		= _ImageList.AddImage(theme.of_GetItemIcon(IDX_CLOSE,ICO_CLOSE,0,WOT_TITLEBAR))
//Add max button
if Win32.IsZoomed(#ParentWindow.#Handle) then
	Items[IDX_MAX].ImageIndex	= _restoreIconIndex
else
	Items[IDX_MAX].ImageIndex	= _maxIconIndex
end if
//Add min button
Items[IDX_MINI].ImageIndex		= _miniIconIndex
/*-------------------------------*/

of_UpdatePoints()
end event

private subroutine _of_updatepoints ();int index,lastRightButtonIndex
real ll_left,ll_right
real ll_leftTop,ll_rightTop
real itemSize
real offsetSize
Uint lastItemType,lastRightItemFlag
boolean someHidden,leftSomeHidden,rightSomeHidden,someInvisible

if _of_IsLockUpdate() then return
if Not _of_IsVisible() then return

itemSize = 2 + #IconSize.cy + 2

if _of_IsIconic() then
	ll_left 	= rcPaint.left + 2
else
	ll_left 	= rcPaint.left + 4
end if
ll_right	= rcPaint.right
ll_leftTop	= rcPaint.top
ll_rightTop= rcPaint.top

if Win32.IsZoomed(#ParentWindow.#Handle) then
	ll_left += theme.#BorderMargin.left
	ll_right -= theme.#BorderMargin.right
end if

//Set icon rcImage
if IconData.index > 0 then
	IconData.rcImage.left 	= ll_left
	IconData.rcImage.top 	= rcPaint.top + 4
	IconData.rcImage.right 	= IconData.rcImage.left + theme.#IconSize.cx
	IconData.rcImage.bottom= IconData.rcImage.top + theme.#IconSize.cy
	if _of_IsIconic() then
		ll_left += IconData.rcImage.right + 2
	else
		ll_left += IconData.rcImage.right + 4
	end if
else
	Painter.SetRectEmpty(IconData.rcImage)
end if

choose case theme.#ItemStyle
	case theme.ITS_XP
		ll_right -= 4
		ll_leftTop += 4
		ll_rightTop += 4
	case theme.ITS_VISTA
		ll_right -= 4
		offsetSize = -1
	case theme.ITS_WIN8
		ll_right -= 4
		offsetSize = -1
	case theme.ITS_WIN10
		itemSize += 4
	case theme.ITS_QQ
		ll_leftTop += 4
end choose
				
for index = 1 to UpperBound(Items)
	if Not Items[index].visible then continue
	
	if Items[index].Position = Left! then																									/*--- Left items ---*/
	
		if leftSomeHidden then
			Items[index].Hidden = true
			if Not someHidden then
				someHidden = _of_IsButton(index)
			end if
			continue
		end if
		
		choose case Items[index].ItemType
			case ITT_SEPARATOR			//Separator type
				Items[index].rcPaint.left		= ll_left
				Items[index].rcPaint.right	= Items[index].rcPaint.left + 1
				Items[index].rcPaint.top		= ll_leftTop
				Items[index].rcPaint.bottom	= Items[index].rcPaint.top + itemSize
			case ITT_LABEL					//Label type
				//Set rcText
				Items[index].rcText.left 		= ll_left
				Items[index].rcText.right 	= Items[index].rcText.left + Items[index].szText.cx
				Items[index].rcText.top 		= ll_leftTop + (itemSize - Items[index].szText.cy) / 2
				Items[index].rcText.bottom 	=  Items[index].rcText.top + Items[index].szText.cy
				//Set rcPaint
				Painter.CopyRect(ref Items[index].rcPaint,ref Items[index].rcText)
			case ITT_LINK						//Link type
				//Set rcText
				Items[index].rcText.left 		= ll_left
				Items[index].rcText.right 	= Items[index].rcText.left + Items[index].szText.cx
				Items[index].rcText.top 		= ll_leftTop + (itemSize - Items[index].szText.cy) / 2
				Items[index].rcText.bottom 	=  Items[index].rcText.top + Items[index].szText.cy
				//Set rcPaint
				Painter.CopyRect(ref Items[index].rcPaint,ref Items[index].rcText)
			case ITT_ICON					//Icon type
				//Set rcImage
				Items[index].rcImage.left 	= ll_left
				Items[index].rcImage.right 	= Items[index].rcImage.left + #IconSize.cx
				Items[index].rcImage.top 	= ll_leftTop
				Items[index].rcImage.bottom =  Items[index].rcImage.top + #IconSize.cy
				//Set rcPaint
				Painter.CopyRect(ref Items[index].rcPaint,ref Items[index].rcImage)
			case else
				if _of_HasValidImage(index) then
					if Items[index].DisplayText and Items[index].szText.cx > 0 then
						//Set rcImage
						Items[index].rcImage.left 	= ll_left + 2
						Items[index].rcImage.right 	= Items[index].rcImage.left + #IconSize.cx
						Items[index].rcImage.top 	= ll_leftTop + 2
						Items[index].rcImage.bottom =  Items[index].rcImage.top + #IconSize.cy
						//Set rcText
						Items[index].rcText.left 		= Items[index].rcImage.right + 2
						Items[index].rcText.right 	= Items[index].rcText.left + Items[index].szText.cx
						Items[index].rcText.top 		= ll_leftTop + (itemSize - Items[index].szText.cy) / 2
						Items[index].rcText.bottom 	=  Items[index].rcText.top + Items[index].szText.cy
					else
						Painter.SetRectEmpty(Items[index].rcText)
						//Set rcImage
						Items[index].rcImage.left 	= ll_left + 2
						Items[index].rcImage.right 	= Items[index].rcImage.left + #IconSize.cx
						Items[index].rcImage.top 	= ll_leftTop + 2
						Items[index].rcImage.bottom =  Items[index].rcImage.top + #IconSize.cy
					end if
				elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
					Painter.SetRectEmpty(Items[index].rcImage)
					//Set rcText
					Items[index].rcText.left 		= ll_left + 2
					Items[index].rcText.right		= Items[index].rcText.left + Items[index].szText.cx
					Items[index].rcText.top 		= ll_leftTop + (itemSize - Items[index].szText.cy) / 2
					Items[index].rcText.bottom 	=  Items[index].rcText.top + Items[index].szText.cy
				else
					Painter.SetRectEmpty(Items[index].rcImage)
					Painter.SetRectEmpty(Items[index].rcText)
				end if
				//Set rcPaint
				Items[index].rcPaint.left 		= ll_left
				if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
					Items[index].rcPaint.right = Max(Items[index].rcText.right, Items[index].rcImage.right) + 2
				elseif Not Painter.IsRectEmpty(Items[index].rcText) then
					Items[index].rcPaint.right = Items[index].rcText.right + 2
				elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
					Items[index].rcPaint.right = Items[index].rcImage.right + 2
				else
					Items[index].rcPaint.right = Items[index].rcPaint.left + 4
				end if
				Items[index].rcPaint.top 		= ll_leftTop
				Items[index].rcPaint.bottom = Items[index].rcPaint.top + itemSize
				Items[index].rcPaint.top 		+= offsetSize
				
				//Set chevron
				if Items[index].Chevron.Visible then
					Items[index].Chevron.rcPaint.left 		= Items[index].rcPaint.right
					Items[index].Chevron.rcPaint.right		= Items[index].rcPaint.right + ITEMCHEVRONWIDTH
					Items[index].Chevron.rcPaint.top		= Items[index].rcPaint.top
					Items[index].Chevron.rcPaint.bottom	= Items[index].rcPaint.bottom
					Items[index].rcPaint.right 				= Items[index].Chevron.rcPaint.right	
				end if
				
		end choose
		
		if ll_right - Items[index].rcPaint.right < MINTITLEWIDTH +CHEVRONWIDTH then
			Items[index].Hidden = true
			leftSomeHidden = true
			if _of_IsButton(index) then
				someHidden = true
			end if
		else
			Items[index].Hidden = false
		end if
		
		if Not Items[index].hidden then
			ll_left = Items[index].rcPaint.right + #ItemMargin
		end if
	
	else																																					/*--- Right items ---*/
		
		if rightSomeHidden then
			Items[index].Hidden = true
			if Not someHidden then
				someHidden = _of_IsButton(index)
			end if
			continue
		end if
		
		Items[index].flag = ITF_NONE
		
		choose case Items[index].ItemType
			case ITT_SEPARATOR				//Separator type
				//Set rcPaint
				Items[index].rcPaint.left		= ll_right - 1
				Items[index].rcPaint.right	= Items[index].rcPaint.left + 1
				Items[index].rcPaint.top		= ll_rightTop
				Items[index].rcPaint.bottom	= Items[index].rcPaint.top + itemSize
				if lastRightItemFlag = ITF_BEGIN then
					Items[lastRightButtonIndex].flag += ITF_END
					lastRightItemFlag = ITF_END
				end if
			case ITT_LABEL 						//Label type
				//Set rcText
				Items[index].rcText.left 		= ll_right - Items[index].szText.cx
				Items[index].rcText.right 	= Items[index].rcText.left + Items[index].szText.cx
				Items[index].rcText.top 		= ll_rightTop + (itemSize - Items[index].szText.cy) / 2
				Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
				//Set rcPaint
				Painter.CopyRect(ref Items[index].rcPaint,ref Items[index].rcText)
				if lastRightItemFlag = ITF_BEGIN then
					Items[lastRightButtonIndex].flag += ITF_END
					lastRightItemFlag = ITF_END
				end if
			case ITT_LINK							//Link type
				//Set rcText
				Items[index].rcText.left 		= ll_right - Items[index].szText.cx
				Items[index].rcText.right 	= Items[index].rcText.left + Items[index].szText.cx
				Items[index].rcText.top 		= ll_rightTop + (itemSize - Items[index].szText.cy) / 2
				Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
				//Set rcPaint
				Painter.CopyRect(ref Items[index].rcPaint,ref Items[index].rcText)
				if lastRightItemFlag = ITF_BEGIN then
					Items[lastRightButtonIndex].flag += ITF_END
					lastRightItemFlag = ITF_END
				end if
			case ITT_ICON 						//Icon type
				//Set rcImage
				Items[index].rcImage.left 	= ll_right - #IconSize.cx
				Items[index].rcImage.right 	= Items[index].rcImage.left + #IconSize.cx
				Items[index].rcImage.top 	= ll_rightTop
				Items[index].rcImage.bottom = Items[index].rcImage.top + #IconSize.cy
				//Set rcPaint
				Painter.CopyRect(ref Items[index].rcPaint,ref Items[index].rcImage)
				if lastRightItemFlag = ITF_BEGIN then
					Items[lastRightButtonIndex].flag += ITF_END
					lastRightItemFlag = ITF_END
				end if
			case else
				if lastRightItemFlag <> ITF_BEGIN then
					Items[index].flag = ITF_BEGIN
					lastRightItemFlag = ITF_BEGIN
				end if
				choose case theme.#ItemStyle
					case theme.ITS_XP	//XP style
						//Set chevron
						if Items[index].Chevron.Visible then
							Items[index].Chevron.rcPaint.left		= ll_right - ITEMCHEVRONWIDTH
							Items[index].Chevron.rcPaint.right		= ll_right
							Items[index].Chevron.rcPaint.top		= ll_rightTop
							Items[index].Chevron.rcPaint.bottom	= ll_rightTop + itemSize
							ll_right  = Items[index].Chevron.rcPaint.left
						end if
						if _of_HasValidImage(index) then
							if Items[index].DisplayText and Items[index].szText.cx > 0 then
								//Set rcText
								Items[index].rcText.left 		= ll_right - 2 - Items[index].szText.cx
								Items[index].rcText.right 	= Items[index].rcText.left + Items[index].szText.cx
								Items[index].rcText.top 		= ll_rightTop + (itemSize - Items[index].szText.cy) / 2
								Items[index].rcText.bottom 	=  Items[index].rcText.top + Items[index].szText.cy
								//Set rcImage
								Items[index].rcImage.left 	= Items[index].rcText.left - 2 - #IconSize.cx
								Items[index].rcImage.right 	= Items[index].rcImage.left + #IconSize.cx
								Items[index].rcImage.top 	= ll_rightTop + 2
								Items[index].rcImage.bottom = Items[index].rcImage.top + #IconSize.cy
							else
								Painter.SetRectEmpty(Items[index].rcText)
								//Set rcImage
								Items[index].rcImage.left 	= ll_right - 2 - #IconSize.cx
								Items[index].rcImage.right 	= Items[index].rcImage.left + #IconSize.cx
								Items[index].rcImage.top 	= ll_rightTop + 2
								Items[index].rcImage.bottom = Items[index].rcImage.top + #IconSize.cy
							end if
						elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
							Painter.SetRectEmpty(Items[index].rcImage)
							//Set rcText
							Items[index].rcText.left 		= ll_right - 2 - Items[index].szText.cx
							Items[index].rcText.right 	= Items[index].rcText.left + Items[index].szText.cx
							Items[index].rcText.top 		= ll_rightTop + (itemSize - Items[index].szText.cy) / 2
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
							Items[index].rcPaint.right 	= ll_right
						end if
						Items[index].rcPaint.top 		= ll_rightTop
						Items[index].rcPaint.bottom	= Items[index].rcPaint.top + itemSize
					case theme.ITS_VISTA	//Vista style
						if lastItemType <= ITT_SPLIT then	//Priv item
							ll_right += 2
						end if
						//Set chevron
						if Items[index].Chevron.Visible then
							Items[index].Chevron.rcPaint.left		= ll_right - ITEMCHEVRONWIDTH
							Items[index].Chevron.rcPaint.right		= ll_right
							Items[index].Chevron.rcPaint.top		= ll_rightTop - 3
							Items[index].Chevron.rcPaint.bottom	= ll_rightTop + itemSize
							ll_right  = Items[index].Chevron.rcPaint.left
						end if
						if _of_HasValidImage(index) then
							if Items[index].DisplayText and Items[index].szText.cx > 0 then
								//Set rcText
								Items[index].rcText.left 		= ll_right - 2 - Items[index].szText.cx
								Items[index].rcText.right 	= Items[index].rcText.left + Items[index].szText.cx
								Items[index].rcText.top 		= ll_rightTop + (itemSize - Items[index].szText.cy) / 2
								Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
								//Set rcImage
								Items[index].rcImage.left 	= Items[index].rcText.left - 2 - #IconSize.cx
								Items[index].rcImage.right 	= Items[index].rcImage.left + #IconSize.cx
								Items[index].rcImage.top 	= ll_rightTop + 2
								Items[index].rcImage.bottom = Items[index].rcImage.top + #IconSize.cy
							else
								Painter.SetRectEmpty(Items[index].rcText)
								//Set rcImage
								Items[index].rcImage.left 	= ll_right - 2 - #IconSize.cx
								Items[index].rcImage.right 	= Items[index].rcImage.left + #IconSize.cx
								Items[index].rcImage.top 	= ll_rightTop + 2
								Items[index].rcImage.bottom = Items[index].rcImage.top + #IconSize.cy
							end if
						elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
							Painter.SetRectEmpty(Items[index].rcImage)
							//Set rcText
							Items[index].rcText.left 		= ll_right - 2 - Items[index].szText.cx
							Items[index].rcText.right 	= Items[index].rcText.left + Items[index].szText.cx
							Items[index].rcText.top 		= ll_rightTop + (itemSize - Items[index].szText.cy) / 2
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
							Items[index].rcPaint.right 	= ll_right
						end if
						Items[index].rcPaint.top 		= ll_rightTop - 3
						Items[index].rcPaint.bottom = Items[index].rcPaint.top + itemSize + 3
					case theme.ITS_WIN8	//Win8 style
						//Set chevron
						if Items[index].Chevron.Visible then
							Items[index].Chevron.rcPaint.left		= ll_right - ITEMCHEVRONWIDTH
							Items[index].Chevron.rcPaint.right		= ll_right
							Items[index].Chevron.rcPaint.top		= ll_rightTop
							Items[index].Chevron.rcPaint.bottom	= ll_rightTop + itemSize
							ll_right  = Items[index].Chevron.rcPaint.left
						end if
						if _of_HasValidImage(index) then
							if Items[index].DisplayText and Items[index].szText.cx > 0 then
								//Set rcText
								Items[index].rcText.left 		= ll_right - 2 - Items[index].szText.cx
								Items[index].rcText.right		= Items[index].rcText.left + Items[index].szText.cx
								Items[index].rcText.top		= ll_rightTop + (itemSize - Items[index].szText.cy) / 2
								Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
								//Set rcImage
								Items[index].rcImage.left 	= Items[index].rcText.left - 2 - #IconSize.cx
								Items[index].rcImage.right 	= Items[index].rcImage.left + #IconSize.cx
								Items[index].rcImage.top 	= ll_rightTop + 2
								Items[index].rcImage.bottom = Items[index].rcImage.top + #IconSize.cy
							else
								Painter.SetRectEmpty(Items[index].rcText)
								//Set rcImage
								Items[index].rcImage.left 	= ll_right - 2 - #IconSize.cx
								Items[index].rcImage.right 	= Items[index].rcImage.left + #IconSize.cx
								Items[index].rcImage.top 	= ll_rightTop + 2
								Items[index].rcImage.bottom = Items[index].rcImage.top + #IconSize.cy
							end if
						elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
							Painter.SetRectEmpty(Items[index].rcImage)
							//Set rcText
							Items[index].rcText.left 		= ll_right - 2 - Items[index].szText.cx
							Items[index].rcText.right 	= Items[index].rcText.left + Items[index].szText.cx
							Items[index].rcText.top 		= ll_rightTop + (itemSize - Items[index].szText.cy) / 2
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
							Items[index].rcPaint.right 	= ll_right
						end if
						Items[index].rcPaint.top 		= ll_rightTop
						Items[index].rcPaint.bottom	= Items[index].rcPaint.top + itemSize
						if Items[index].ItemType = ITT_CLOSE then
							Items[index].rcPaint.left -= 8
							if Not Painter.IsRectEmpty(ref Items[index].rcText) then
								Painter.OffsetRect(ref Items[index].rcText,-4,0)
							end if
							if Not Painter.IsRectEmpty(ref Items[index].rcImage) then
								Painter.OffsetRect(ref Items[index].rcImage,-4,0)
							end if
						end if
					case theme.ITS_WIN10	//Win10 style
						ll_right += 1
						//Set chevron
						if Items[index].Chevron.Visible then
							Items[index].Chevron.rcPaint.left		= ll_right - ITEMCHEVRONWIDTH
							Items[index].Chevron.rcPaint.right		= ll_right
							Items[index].Chevron.rcPaint.top		= ll_rightTop
							Items[index].Chevron.rcPaint.bottom	= ll_rightTop + itemSize
							ll_right  = Items[index].Chevron.rcPaint.left
						end if
						if _of_HasValidImage(index) then
							if Items[index].DisplayText and Items[index].szText.cx > 0 then
								//Set rcText
								Items[index].rcText.left 		= ll_right - 8 - Items[index].szText.cx
								Items[index].rcText.right		= Items[index].rcText.left + Items[index].szText.cx
								Items[index].rcText.top		= ll_rightTop + (itemSize - Items[index].szText.cy) / 2
								Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
								//Set rcImage
								Items[index].rcImage.left 	= Items[index].rcText.left - 2 - #IconSize.cx
								Items[index].rcImage.right 	= Items[index].rcImage.left + #IconSize.cx
								Items[index].rcImage.top 	= ll_rightTop + 4
								Items[index].rcImage.bottom = Items[index].rcImage.top + #IconSize.cy
							else
								Painter.SetRectEmpty(Items[index].rcText)
								//Set rcImage
								Items[index].rcImage.left 	= ll_right - 8 - #IconSize.cx
								Items[index].rcImage.right 	= Items[index].rcImage.left + #IconSize.cx
								Items[index].rcImage.top 	= ll_rightTop + 4
								Items[index].rcImage.bottom = Items[index].rcImage.top + #IconSize.cy
							end if
						elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
							Painter.SetRectEmpty(Items[index].rcImage)
							//Set rcText
							Items[index].rcText.left 		= ll_right - 8 - Items[index].szText.cx
							Items[index].rcText.right 	= Items[index].rcText.left + Items[index].szText.cx
							Items[index].rcText.top 		= ll_rightTop + (itemSize - Items[index].szText.cy) / 2
							Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
						else
							Painter.SetRectEmpty(Items[index].rcImage)
							Painter.SetRectEmpty(Items[index].rcText)
						end if
						//Set rcPaint
						if Not Painter.IsRectEmpty(Items[index].rcText) and  Not Painter.IsRectEmpty(Items[index].rcImage) then
							Items[index].rcPaint.left = Min(Items[index].rcText.left, Items[index].rcImage.left) - 8
						elseif Not Painter.IsRectEmpty(Items[index].rcText) then
							Items[index].rcPaint.left = Items[index].rcText.left - 8
						elseif Not Painter.IsRectEmpty(Items[index].rcImage) then
							Items[index].rcPaint.left = Items[index].rcImage.left - 8
						else
							Items[index].rcPaint.left = ll_right - 8
						end if
						if Items[index].Chevron.Visible then
							Items[index].rcPaint.right	= Items[index].Chevron.rcPaint.right	
						else
							Items[index].rcPaint.right 	= ll_right
						end if
						Items[index].rcPaint.top 		= ll_rightTop
						Items[index].rcPaint.bottom	= Items[index].rcPaint.top + itemSize
					case theme.ITS_QQ	//QQ style
						if lastItemType <= ITT_SPLIT then	//Priv item
							ll_right += 1
						else
							ll_right -= 1
						end if
						if Items[index].Chevron.Visible then
							Items[index].Chevron.rcPaint.left		= ll_right - ITEMCHEVRONWIDTH
							Items[index].Chevron.rcPaint.right		= ll_right
							Items[index].Chevron.rcPaint.top		= ll_rightTop
							Items[index].Chevron.rcPaint.bottom	= ll_rightTop + itemSize
							ll_right  = Items[index].Chevron.rcPaint.left
						end if
						if _of_HasValidImage(index) then
							if Items[index].DisplayText and Items[index].szText.cx > 0 then
								//Set rcText
								Items[index].rcText.left 		= ll_right - 2 - Items[index].szText.cx
								Items[index].rcText.right 	= Items[index].rcText.left + Items[index].szText.cx
								Items[index].rcText.top		= ll_rightTop + (itemSize - Items[index].szText.cy) / 2
								Items[index].rcText.bottom 	= Items[index].rcText.top + Items[index].szText.cy
								//Set rcImage
								Items[index].rcImage.left 	= Items[index].rcText.left - 2 - #IconSize.cx
								Items[index].rcImage.right 	= Items[index].rcImage.left + #IconSize.cx
								Items[index].rcImage.top 	= ll_rightTop + 2
								Items[index].rcImage.bottom = Items[index].rcImage.top + #IconSize.cy
							else
								Painter.SetRectEmpty(Items[index].rcText)
								//Set rcImage
								Items[index].rcImage.left 	= ll_right - 2 - #IconSize.cx
								Items[index].rcImage.right 	= Items[index].rcImage.left + #IconSize.cx
								Items[index].rcImage.top 	= ll_rightTop + 2
								Items[index].rcImage.bottom = Items[index].rcImage.top + #IconSize.cy
							end if
						elseif Items[index].DisplayText and Items[index].szText.cx > 0 then
							Painter.SetRectEmpty(Items[index].rcImage)
							//Set rcText
							Items[index].rcText.left 		= ll_right - 2 - Items[index].szText.cx
							Items[index].rcText.right 	= Items[index].rcText.left + Items[index].szText.cx
							Items[index].rcText.top 		= ll_rightTop + (itemSize - Items[index].szText.cy) / 2
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
							Items[index].rcPaint.right 	= ll_right
						end if
						Items[index].rcPaint.top 		= ll_rightTop
						Items[index].rcPaint.bottom = Items[index].rcPaint.top + itemSize
				end choose
		end choose
		
		if Items[index].rcPaint.left - ll_left < MINTITLEWIDTH +CHEVRONWIDTH then
			Items[index].Hidden = true
			rightSomeHidden = true
			if Items[index].flag = ITF_BEGIN then
				Items[index].flag = ITF_NONE
				lastRightItemFlag = ITF_NONE
			end if
			if _of_IsButton(index) then
				someHidden = true
			end if
		else
			Items[index].Hidden = false
		end if
		
		if Not Items[index].hidden then
			lastItemType = Items[index].ItemType
			ll_right = Items[index].rcPaint.left - 1
			if Items[index].ItemType <= ITT_SPLIT then
				lastRightButtonIndex = index
			end if
		end if
	end if
next

if lastRightItemFlag = ITF_BEGIN then
	Items[lastRightButtonIndex].flag += ITF_END
end if

Chevron.Visible = (someHidden or someInvisible)

if Chevron.Visible then
	Chevron.rcPaint.left		= ll_left
	Chevron.rcPaint.right 		= Chevron.rcPaint.left + CHEVRONWIDTH
	Chevron.rcPaint.top		= ll_leftTop
	Chevron.rcPaint.bottom	= Chevron.rcPaint.top + 2 + #IconSize.cy + 2
	ll_left = Chevron.rcPaint.right + #ItemMargin
end if

if _of_IsIconic() then
	TitleData.rcText.left	= ll_left - #ItemMargin + 2
else
	TitleData.rcText.left	= ll_left - #ItemMargin + 4
end if
TitleData.rcText.top 		= rcPaint.top + 4
TitleData.rcText.right 		= ll_right - 4
TitleData.rcText.bottom 	= TitleData.rcText.top  + 4 + theme.Font.#WordSize.cy + 4
/*
if IconData.index > 0 then
	if IconData.rcImage.bottom - IconData.rcImage.top < TitleData.rcText.bottom - TitleData.rcText.top then
		Painter.OffsetRect(ref IconData.rcImage,0,((TitleData.rcText.bottom - TitleData.rcText.top) - &
															(IconData.rcImage.bottom - IconData.rcImage.top)) / 2)
	end if
end if*/
end subroutine

private subroutine _of_updatetextsize (readonly integer index);Ulong dtparam
RECTF calcRect

if index < 1 or index > UpperBound(Items) then return
if Len(Items[index].text) = 0 then
	Items[index].szText.cx = 0
	Items[index].szText.cy = 0
	return
end if

dtparam = Painter.DT_SINGLELINE + Painter.DT_EXPANDTABS

if Items[index].ItemType = ITT_LINK then
	Painter.of_CalcTextSize(LinkFont,items[index].Text,dtparam,ref calcRect)
else
	Painter.of_CalcTextSize(Font,items[index].Text,dtparam,ref calcRect)
end if

Items[index].szText.cx = calcRect.right
Items[index].szText.cy = calcRect.bottom
end subroutine

private subroutine _of_updatetextsize ();int index

for index = 1 to UpperBound(Items)
	_of_UpdateTextSize(index)
next
end subroutine

private subroutine _of_showtip (readonly integer index);RECTF wndRect
RECTF scRect
SIZEF toolSize

if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _MouseCaptured then return

if #ParentWindow.#ToolTip and (index > 0 and index <= UpperBound(Items)) then
	if Items[index].tipText <> "" then
		Painter.GetWindowRect(#ParentWindow.#Handle,ref wndRect)
		Painter.GetScreenRect(ref scRect)
		_ToolTip.TrackActivate(#ParentWindow.#Handle,_TTID,false)
		_ToolTip.UpdateTipText(#ParentWindow.#Handle,_TTID,Items[index].tipText)
		_ToolTip.GetBubbleSize(#ParentWindow.#Handle,_TTID,ref toolSize.cx,ref toolSize.cy)
		if _of_IsIconic() then
			if wndRect.left + Items[index].rcPaint.left + toolSize.cx  > scRect.right then
				_ToolTip.TrackPosition( 0,scRect.right -  toolSize.cx,wndRect.top + Items[index].rcPaint.top - toolSize.cy - 2)
			else
				_ToolTip.TrackPosition( 0,wndRect.left + Items[index].rcPaint.left ,wndRect.top + Items[index].rcPaint.top - toolSize.cy - 2)
			end if
		else
			if wndRect.left + Items[index].rcPaint.left + toolSize.cx  > scRect.right then
				_ToolTip.TrackPosition( 0,scRect.right -  toolSize.cx,wndRect.top + Items[index].rcPaint.bottom + 2)
			else
				_ToolTip.TrackPosition( 0,wndRect.left + Items[index].rcPaint.left ,wndRect.top + Items[index].rcPaint.bottom + 2)
			end if
		end if
		if Items[index].TipTime > 0 then
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,Items[index].TipTime)
		else
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,-1)
		end if
		_ToolTip.TrackActivate(#ParentWindow.#Handle,_TTID,true)
	else
		_ToolTip.TrackActivate(#ParentWindow.#Handle,_TTID,false)	
	end if
else
	_ToolTip.TrackActivate(#ParentWindow.#Handle,_TTID,false)
end if
end subroutine

private subroutine _of_drawchevron (readonly boolean fadeanimation);ulong safeDC

if _of_IsLockUpdate() then return
if Not _of_IsVisible() then return
if _of_IsIconic() and Not _MouseOver then return
if Not Chevron.Visible then return

safeDC=_of_GetSafeDC()

if safeDC > 0 then
	
	Painter.IntersectClipRect(safeDC,Chevron.rcPaint)
	
	Event OnEraseBKgnd(safedc)
	
	_of_DrawChevron(safedc)
	
	Painter.SelectClipRgn(safeDC,0)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(Chevron.rcPaint)
	
	_of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
end if
end subroutine

private subroutine _of_flashdrawitem (readonly integer index);Uint nFadeTime

if _of_IsLockUpdate() then return
if Not _of_IsVisible() then return
if _of_IsIconic() and Not _MouseOver then return
if index < 1 or index > UpperBound(Items) then return
if Not Items[index].visible then return
if Items[index].hidden then return
if Not Items[index].Enabled or Items[index].MouseOver or Items[index].MouseDown or &
	Items[index].Chevron.MouseOver or Items[index].Chevron.MouseDown or Items[index].Toggled then
	return
end if

nFadeTime = #ParentWindow.#FadeTime
#ParentWindow.#FadeTime = #ParentWindow.#FlashFadeTime

_of_DrawItem(index,true)

#ParentWindow.#FadeTime = nFadeTime
end subroutine

private function boolean _of_isvisible ();if Not IsNull(theme.#TitleBar) then return theme.#TitleBar
return (#ParentWindow.Border and #ParentWindow.TitleBar)
end function

public function integer of_insertbutton (readonly integer index, readonly string text, readonly string image, readonly string tiptext, readonly alignment position);int i
ITEMDATA newItem

if index <= IDX_MINI or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

newItem.ItemType = ITT_NORMAL
newItem.Text = text
newItem.tipText = tiptext
newItem.enabled = true
newItem.visible = true
newItem.displaytext = false
newItem.position = position

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

if len(image) > 0 then
	Items[i].image = image
	Items[i].imageindex = _ImageList.AddImage(theme.of_GetItemIcon(index,image,0,WOT_TITLEBAR))
end if

_of_UpdateTextSize(index)

of_UpdatePoints()

return index
end function

public function integer of_Addseparator ();return of_AddSeparator(left!)
end function

public function integer of_insertseparator (readonly integer index, readonly alignment position);int i
ITEMDATA newItem

if index <= IDX_MINI or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

newItem.ItemType = ITT_SEPARATOR
newItem.enabled = true
newItem.visible = true
newItem.position = position

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

of_UpdatePoints()

return index
end function

public function integer of_insertseparator (readonly integer index);return of_InsertSeparator(index,left!)
end function

public function integer of_insertlink (readonly integer index, readonly string text, readonly alignment position);int i
ITEMDATA newItem

if index <= IDX_MINI or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

newItem.ItemType = ITT_LINK
newItem.Text = text
newItem.enabled = true
newItem.visible = true
newItem.displaytext = true
newItem.position = position

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

_of_UpdateTextSize(index)

of_UpdatePoints()

return index
end function

public function integer of_insertlabel (readonly integer index, readonly string text, readonly alignment position);int i
ITEMDATA newItem

if index <= IDX_MINI or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

newItem.ItemType = ITT_LABEL
newItem.Text = text
newItem.enabled = true
newItem.visible = true
newItem.displaytext = true
newItem.position = position

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

_of_UpdateTextSize(index)

of_UpdatePoints()

return index
end function

public function integer of_insertlabel (readonly integer index, readonly string text);return of_InsertLabel(index,text,left!)
end function

public function integer of_inserticon (readonly integer index, readonly string image, readonly alignment position);int i
ITEMDATA newItem

if index <= IDX_MINI or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

newItem.ItemType = ITT_ICON
newItem.enabled = true
newItem.visible = true
newItem.position = position

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

if len(image) > 0 then
	Items[index].image = image
	Items[index].imageindex = _ImageList.AddImage(theme.of_GetItemIcon(index,image,0,WOT_TITLEBAR))
end if

_of_UpdateTextSize(index)

of_UpdatePoints()

return index
end function

public function integer of_inserticon (readonly integer index, readonly string image);return of_InsertIcon(index,image,left!)
end function

public function integer of_insertbutton (readonly integer index, readonly string text, readonly string image, readonly string tiptext);return of_InsertButton(index,text,image,tiptext,left!)
end function

public function integer of_insertbutton (readonly integer index, readonly string text, readonly string image, readonly alignment position);return of_InsertButton(index,text,image,"",position)
end function

public function integer of_insertbutton (readonly integer index, readonly string text, readonly string image);return of_InsertButton(index,text,image,"",left!)
end function

public function integer of_addseparator (readonly alignment position);return of_InsertSeparator(UpperBound(Items)+1,position)
end function

public function integer of_addlink (readonly string text, readonly alignment position);return of_InsertLink(UpperBound(Items)+1,text,position)
end function

public function integer of_addlabel (readonly string text, readonly alignment position);return of_InsertLabel(UpperBound(Items)+1,text,position)
end function

public function integer of_addicon (readonly string image, readonly alignment position);return of_InsertIcon(UpperBound(Items)+1,image,position)
end function

public function integer of_addlabel (readonly string text);return of_AddLabel(text,left!)
end function

public function integer of_addicon (readonly string image);return of_AddIcon(image,left!)
end function

public function integer of_addbutton (readonly string text, readonly string image, readonly string tiptext, readonly alignment position);return of_InsertButton(UpperBound(Items)+1,text,image,tiptext,position)
end function

public function integer of_addbutton (readonly string text, readonly string image);return of_AddButton(text,image,"",left!)
end function

public function integer of_addbutton (readonly string text, readonly string image, readonly alignment position);return of_AddButton(text,image,"",position)
end function

public function integer of_addbutton (readonly string text, readonly string image, readonly string tiptext);return of_AddButton(text,image,tiptext,left!)
end function

public function integer of_insertlink (readonly integer index, readonly string text);return of_InsertLink(index,text,Left!)
end function

public function integer of_addlink (readonly string text);return of_AddLink(text,Left!)
end function

public function integer of_getcount ();return UpperBound(Items)
end function

public function string of_getimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].image
end function

public function long of_getindex (readonly string text);int index

for index = 1 to UpperBound(Items)
	if Upper(text)= upper(Items[index].Text) then return index
next

return 0
end function

public function string of_gettext (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].text
end function

public function string of_gettiptext (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].tiptext
end function

public function boolean of_isdisplaytext (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].DisplayText
end function

public function boolean of_isenabled (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].enabled
end function

public function boolean of_isflashing (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return (Items[index].FlashTime = -1 or Items[index].FlashTime > 0)
end function

public function boolean of_ishighlighted (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].HighLighted
end function

public function boolean of_isvisible (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].visible
end function

private subroutine _of_capturemouse (readonly boolean capture);if _MouseCaptured = capture then return

_MouseCaptured = capture
#ParentWindow.Event OnCaptureMouse(capture,WOT_TITLEBAR)
end subroutine

private subroutine _of_drawitemtext (readonly integer index, readonly unsignedlong hdc);ulong textColor
ulong dtparam

textColor	= theme.of_GetItemColor(index,theme.CLR_TEXT,of_GetItemState(index),WOT_TITLEBAR)

dtparam = Painter.DT_SINGLELINE + Painter.DT_NOCLIP + Painter.DT_EXPANDTABS
dtparam += Painter.DT_VCENTER
if Not KeyDown(KeyAlt!) or Items[index].itemType = ITT_LABEL then
	dtparam += Painter.DT_HIDEPREFIX
end if
dtparam += Painter.DT_CENTER

if Items[index].itemType = ITT_LINK then
	if Items[index].MouseDown then
		Painter.of_Drawtext(hdc,LinkFont,Items[index].text,Items[index].rcText.left,Items[index].rcText.top + 1,Items[index].rcText.right,Items[index].rcText.bottom + 1,textColor,dtparam)
	else
		Painter.of_Drawtext(hdc,LinkFont,Items[index].text,Items[index].rcText,textColor,dtparam)
	end if
else
	if Items[index].MouseDown or Items[index].Toggled then
		Painter.of_Drawtext(hdc,Font,Items[index].text,Items[index].rcText.left,Items[index].rcText.top + 1,Items[index].rcText.right,Items[index].rcText.bottom + 1,textColor,dtparam)
	else
		Painter.of_Drawtext(hdc,Font,Items[index].text,Items[index].rcText,textColor,dtparam)
	end if
end if
end subroutine

private subroutine _of_drawicon (readonly boolean fadeanimation);ulong safeDC

if _of_IsLockUpdate() then return
if Not _of_IsVisible() then return

safeDC=_of_GetSafeDC()

if safeDC > 0 then
	
	Painter.IntersectClipRect(safeDC,IconData.rcImage)
	
	Event OnEraseBKgnd(safedc)
	
	_ImageList_Icon.Draw(IconData.index,safedc, IconData.rcImage.left, IconData.rcImage.top,Not #Enabled)
	
	Painter.SelectClipRgn(safeDC,0)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(IconData.rcImage)
	
	_of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
end if
end subroutine

private subroutine _of_drawtitle (boolean fadeanimation);ulong safeDC

if _of_IsLockUpdate() then return
if Not _of_IsVisible() then return

safeDC=_of_GetSafeDC()

if safeDC > 0 then
	
	Painter.IntersectClipRect(safeDC,TitleData.rcText)
	
	Event OnEraseBKgnd(safedc)
	
	_of_DrawTitle( safedc)
	
	Painter.SelectClipRgn(safeDC,0)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(TitleData.rcText)
	
	_of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
end if
end subroutine

private function unsignedlong _of_getsafedc ();ulong safeDC
RECTF paintRect

if _of_IsLockUpdate() then return 0
if Not _of_IsVisible()  then return 0

safeDC = _Canvas.GetSafeNcDC()

if safeDC > 0 then
	paintRect = rcPaint
	_of_AdjustRect(ref paintRect,ADJ_BORDER)
	Painter.IntersectClipRect(safeDC,paintRect)
end if

return safeDC
end function

private function boolean _of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime);if hdc = 0 then return false

Painter.SelectClipRgn(hdc,0)

return _Canvas.ReleaseDC(hdc,hrgn,FadeTime)
end function

private function boolean _of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation);if FadeAnimation then
	return _of_ReleaseDC(hdc,hrgn,#ParentWindow.#FadeTime)
else
	return _of_ReleaseDC(hdc,hrgn,0)
end if
end function

public function long of_displaytext (readonly integer index, readonly boolean display);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if _of_IsSysButton(index) then return RetCode.E_NO_SUPPORT
if Not _of_IsButton(index) or Items[index].ItemType = ITT_LINK then return RetCode.E_NO_SUPPORT
if Items[index].DisplayText = display then return RetCode.OK

Items[index].DisplayText = display

if Items[index].Visible then
	of_UpdatePoints()
end if

return RetCode.OK
end function

public function long of_displaytextall (readonly boolean display);int index

for index = 1 to UpperBound(Items)
	if _of_IsSysButton(index) then continue
	if Not _of_IsButton(index) or Items[index].ItemType = ITT_LINK then continue
	Items[index].DisplayText = display
next

of_UpdatePoints()

return RetCode.OK
end function

public function long of_enable (readonly integer index, readonly boolean enabled);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType = ITT_SEPARATOR then return RetCode.E_NO_SUPPORT
if Items[index].enabled = enabled then return RetCode.OK

Items[index].enabled = enabled
_of_DrawItem(index,true)

if _of_IsSysButton(index) then
	if #ParentWindow.wf_IsSheet() then
		#ParentWindow.#ParentWindow.MDIClient.Event OnChildNotify(#ParentWindow.#Handle,NCD_SYSBUTTONCHANGED)
	end if
end if

return RetCode.OK
end function

public function long of_flash (readonly integer index, readonly long flashtime);//flashtime:sec
//-1:always
//0:stop
if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not _of_IsButton(index) or Items[index].ItemType = ITT_LINK then return RetCode.E_NO_SUPPORT
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
	Timer.Start(TM_FLASH,#ParentWindow.#FlashFadeTime)
else
	Items[index].flashing = false
	_of_DrawItem(index,true)
end if

return RetCode.OK
end function

public function long of_getpopupmenu (readonly integer index, ref n_cst_popupmenu popupmenu);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

try
	PopupMenu = Items[index].PopupMenu
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(PopupMenu),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function long of_highlight (readonly integer index, readonly boolean highlighted);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if _of_IsSysButton(index) then return RetCode.E_NO_SUPPORT
if Not _of_IsButton(index) or Items[index].ItemType = ITT_LINK then return RetCode.E_NO_SUPPORT
if Items[index].HighLighted = highlighted then return RetCode.OK

Items[index].HighLighted = highlighted
_of_DrawItem(index,true)

return RetCode.OK
end function

public function long of_remove (readonly integer index);int i
boolean bVisible
ITEMDATA newItems[]

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if _of_IsSysButton(index) then return RetCode.E_ACCESS_DENIED

if index = _mouseOverIndex then
	_mouseOverIndex = 0
end if
if index = _mouseDownIndex then
	_mouseDownIndex = 0
end if

bVisible = Items[index].Visible

if Items[index].MenuOwner then
	Destroy Items[index].PopupMenu
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
ITEMDATA newItems[]

newItems[IDX_CLOSE] = Items[IDX_CLOSE]
newItems[IDX_MAX] = Items[IDX_MAX]
newItems[IDX_MINI] = Items[IDX_MINI]

for index = 1 to UpperBound(Items)
	if Items[index].MenuOwner then
		Destroy Items[index].PopupMenu
	end if
next

Items = newItems

_mouseOverIndex = 0
_mouseDownIndex = 0

of_UpdatePoints()
_of_ShowTip(0)

return RetCode.OK
end function

public function long of_setenabled (readonly boolean enabled);if #Enabled = enabled then return RetCode.OK

#Enabled = enabled

of_Redraw(true)

return RetCode.OK
end function

public function long of_seticon (readonly string iconname);int newIconIndex

if #Icon = iconname then return RetCode.OK

newIconIndex = _ImageList_Icon.AddImage(theme.of_GetIcon(iconname,0))

#Icon = iconname

if IconData.index <> newIconIndex then
	if (IconData.index > 0) <> (newIconIndex > 0) then
		IconData.index = newIconIndex
		of_UpdatePoints()
	else
		IconData.index = newIconIndex
		_of_DrawIcon(false)
	end if
end if

return RetCode.OK
end function

public function long of_setimage (readonly integer index, readonly string image);int newImgIndex
boolean dirty

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if _of_IsSysButton(index) then return RetCode.E_NO_SUPPORT
if (Not _of_IsButton(index) and Items[index].ItemType <> ITT_ICON)  or &
	Items[index].ItemType = ITT_LINK then return RetCode.E_NO_SUPPORT
if Items[index].image = image then return RetCode.OK

newImgIndex = _ImageList.AddImage(theme.of_GetItemIcon(index,image,0,WOT_TITLEBAR))

if Items[index].ItemType = ITT_ICON and newImgIndex = 0 then
	return RetCode.E_INVALID_IMAGE
end if

if (Items[index].imageIndex > 0) <> (newImgIndex > 0) then
	dirty = true
end if

Items[index].image = image
Items[index].imageIndex = newImgIndex

if dirty then
	if Items[index].Visible then
		of_UpdatePoints()
	end if
else
	_of_DrawItem(index,false)
end if

return RetCode.OK
end function

public function long of_settext (readonly integer index, readonly string text);SIZEF textOldSize

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if _of_IsSysButton(index) then return RetCode.E_NO_SUPPORT
if Items[index].ItemType <> ITT_LABEL and Not _of_IsButton(index) then return RetCode.E_NO_SUPPORT
if Items[index].Text = text then return RetCode.OK

textOldSize = Items[index].szText

Items[index].Text = text

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

public function long of_settitle (readonly string title);if #Title = title then return RetCode.OK

#Title = title

_of_DrawTitle(false)

return RetCode.OK
end function

public function long of_updatepoints ();if _of_IsLockUpdate() then return RetCode.FAILED
if Not _of_IsVisible() then return RetCode.OK

_of_UpdatePoints()
of_Redraw(false)

return RetCode.OK
end function

public function long of_visible (readonly integer index, readonly boolean visible);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].visible= Visible then return RetCode.OK

Items[index].visible= Visible

of_UpdatePoints()

if _of_IsSysButton(index) then
	if #ParentWindow.wf_IsSheet() then
		#ParentWindow.#ParentWindow.MDIClient.Event OnChildNotify(#ParentWindow.#Handle,NCD_SYSBUTTONCHANGED)
	end if
end if

return RetCode.OK
end function

private function boolean _of_isbutton (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

choose case Items[index].ItemType
	case ITT_LABEL,ITT_ICON,ITT_SEPARATOR
		return false
end choose

return true
end function

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC

if _of_IsLockUpdate() then return RetCode.FAILED
if Not _of_IsVisible() then return RetCode.OK

safeDC=_Canvas.GetSafeNcDC()

if safeDC > 0 then
	
	Painter.IntersectClipRect(safeDC,rcPaint)
	
	#ParentWindow.Event OnNcEraseBKgnd(safeDC)
	Event OnPaint(safeDC)
	
	Painter.SelectClipRgn(safeDC,0)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(rcPaint)
	
	if FadeAnimation then
		_Canvas.ReleaseDC(safeDC,hUpdateRgn,#ParentWindow.#FadeTime)
	else
		_Canvas.ReleaseDC(safeDC,hUpdateRgn)
	end if
	
	Painter.DeleteRgn(hUpdateRgn)
end if

return  RetCode.OK
end function

private subroutine _of_drawtitle (readonly unsignedlong hdc);ulong textColor
ulong dtparam
string titleText

textColor	= theme.of_GetColor(theme.CLR_TITLE,#ParentWindow.wf_GetState())

titleText = #Title

dtparam = Painter.DT_SINGLELINE + Painter.DT_END_ELLIPSIS
dtparam += Painter.DT_VCENTER
if Not _of_IsIconic() then
	if theme.#TitleAlign = Left! then
		dtparam += Painter.DT_LEFT
	elseif theme.#TitleAlign = Right! then
		dtparam += Painter.DT_RIGHT
	elseif theme.#TitleAlign = Center! then
		dtparam += Painter.DT_CENTER
	end if
end if

if _of_IsIconic() and Not _MouseOver then
	RECTF rcText
	rcText = TitleData.rcText
	rcText.right = rcPaint.right
	Painter.of_DrawText(hdc,theme.Font,titleText,ref rcText,textColor,dtparam)
else
	Painter.of_DrawText(hdc,theme.Font,titleText,ref TitleData.rcText,textColor,dtparam)
end if
end subroutine

private function boolean _of_issysbutton (readonly integer index);if index < 1 or index > UpperBound(Items) then return false
return (index >= IDX_CLOSE and index <= IDX_MINI)
end function

public function alignment of_getitemposition (readonly integer index);if index < 1 or index > UpperBound(Items) then return Left!

return Items[index].Position
end function

public function long of_settiptime (integer index, long tiptime);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Not _of_IsButton(index) then return RetCode.E_NO_SUPPORT

Items[index].TipTime = tipTime

return RetCode.OK
end function

private function boolean _of_isiconic ();return  (Not Win32.IsShowInTaskBar(#ParentWindow.#Handle) and Win32.IsIconic(#ParentWindow.#Handle))
end function

public function boolean of_istoggled (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].Toggled
end function

public function long of_toggle (readonly integer index, readonly boolean toggled);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if _of_IsSysButton(index) then return RetCode.E_NO_SUPPORT
if Items[index].ItemType = ITT_DROPDOWN or Items[index].ItemType = ITT_LINK then return RetCode.E_NO_SUPPORT
if Not _of_IsButton(index)  then return RetCode.E_NO_SUPPORT
if Items[index].Toggled = toggled then return RetCode.OK

Items[index].Toggled = toggled
_of_DrawItem(index,true)

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

private subroutine _of_drawchevron (readonly unsignedlong hdc);real ll_x,ll_y,ll_index
ulong borderColor,bkColor,arrowColor,nState
uint borderStyle
RADIUSF rdBorder
Constant real ARROWSIZE = 6
Constant real LINESIZE = 1

if Not Chevron.Visible then return

nState = of_GetChevronState()
arrowColor	= theme.of_GetColor(theme.CLR_ARROW,nState)

if theme.#ItemStyle = theme.ITS_WIN8 or theme.#ItemStyle = theme.ITS_WIN10 then
	borderStyle = Enums.BS_SOLID
elseif theme.#ItemStyle = theme.ITS_VISTA then
	rdBorder.leftTop = 2
	rdBorder.rightTop = 2
	rdBorder.leftBottom = 2
	rdBorder.rightBottom = 2
	borderStyle = Enums.BS_ROUND
elseif theme.#ItemStyle = theme.ITS_XP then
	rdBorder.leftTop = 4
	rdBorder.rightTop = 4
	rdBorder.leftBottom = 4
	rdBorder.rightBottom = 4
	borderStyle = Enums.BS_ROUND
elseif theme.#ItemStyle = theme.ITS_QQ then
	rdBorder.leftTop = 4
	rdBorder.rightTop = 4
	rdBorder.leftBottom = 4
	rdBorder.rightBottom = 4
	borderStyle = Enums.BS_ROUND
end if

//Fill background
if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
	bkColor = theme.of_GetColor(theme.CLR_CHEVRONBKGND,nState)
	borderColor	= theme.of_GetColor(theme.CLR_BORDER,nState)
	Painter.ThemeFill(hdc,Chevron.rcPaint,bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,borderStyle,borderColor,rdBorder)
end if

//Draw line
RECTF rcLine

rcLine.left = Chevron.rcPaint.left + (Chevron.rcPaint.right - Chevron.rcPaint.left - ARROWSIZE)/2
rcLine.right = rcLine.left + ARROWSIZE + 1
rcLine.top = Chevron.rcPaint.top + (Chevron.rcPaint.bottom - Chevron.rcPaint.top - (LINESIZE + ARROWSIZE / 2 + 1)) / 2
rcLine.bottom = rcLine.top + LINESIZE

if Chevron.MouseDown then
	Painter.OffsetRect(ref rcLine,0,1)
end if

Painter.of_FillRect( hdc, rcLine,  arrowColor,false,0) 

//Draw arrow
POINTF pt1,pt2,pt3

pt1.x = rcLine.left
pt1.y = rcLine.bottom + 1

pt2.x = pt1.x + ARROWSIZE
pt2.y = pt1.y
pt3.x = pt1.x + ARROWSIZE / 2
pt3.y = pt1.y + ARROWSIZE / 2

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

public function any of_getdata (readonly integer index);Any data

if index < 1 or index > UpperBound(Items) then return data

return Items[index].data
end function

public function long of_setdata (readonly integer index, readonly any data);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if _of_IsSysButton(index) then return RetCode.E_NO_SUPPORT

Items[index].Data = data

return RetCode.OK
end function

public function string of_gettag (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].Tag
end function

public function long of_settag (readonly integer index, readonly string tag);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[index].Tag = tag

return RetCode.OK
end function

private function boolean _of_islockupdate ();if #LockUpdate then return true
return #ParentWindow.#LockUpdate
end function

private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu);return _of_CreatePopupMenu(ref popupmenu,"")
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

public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly alignment position);int newIndex
n_cst_popupmenu popupMenu

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE
if Not _of_CreatePopupMenu(ref popupMenu,clsName) then return RetCode.E_INVALID_TYPE

newIndex = of_InsertMenuButton(index,ref popupMenu,text,image,tipText,Position)
if newIndex <= 0 then
	Destroy popupMenu
end if

return newIndex
end function

public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext);return of_InsertMenuButton(index,clsName,text,image,tipText,Left!)
end function

public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly alignment position);return of_InsertMenuButton(index,clsName,text,image,"",position)
end function

public function integer of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image);return of_InsertMenuButton(index,clsName,text,image,"",Left!)
end function

public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly alignment position);int i
ITEMDATA newItem

if index <= IDX_MINI or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

if Not IsValidObject(PopupMenu) then
	if Not _of_CreatePopupMenu(ref PopupMenu) then return RetCode.E_INVALID_OBJECT
	newItem.MenuOwner = true
	PopupMenu.#Tag = ""
elseif PopupMenu.#Tag = PRP_POPUPMENUCREATOR then
	newItem.MenuOwner = true
	PopupMenu.#Tag = ""
end if

newItem.ItemType = ITT_DROPDOWN
newItem.Text = text
newItem.tipText = tiptext
newItem.enabled = true
newItem.visible = true
newItem.displaytext = false
newItem.position = position
newItem.PopupMenu = PopupMenu

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

if len(image) > 0 then
	Items[index].image = image
	Items[index].imageindex = _ImageList.AddImage(theme.of_GetItemIcon(index,image,0,WOT_TITLEBAR))
end if

_of_UpdateTextSize(index)

of_UpdatePoints()

return index
end function

public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext);return of_InsertMenuButton(index,popupmenu,text,image,tiptext,left!)
end function

public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly alignment position);return of_InsertMenuButton(index,popupmenu,text,image,"",position)
end function

public function integer of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image);return of_InsertMenuButton(index,popupmenu,text,image,"",left!)
end function

public function integer of_addmenubutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly alignment position);return of_InsertMenuButton(UpperBound(Items) + 1,clsName,text,image,tipText,position)
end function

public function integer of_addmenubutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext);return of_AddMenuButton(clsName,text,image,tipText,Left!)
end function

public function integer of_addmenubutton (readonly string clsname, readonly string text, readonly string image, readonly alignment position);return of_AddMenuButton(clsName,text,image,"",position)
end function

public function integer of_addmenubutton (readonly string clsname, readonly string text, readonly string image);return of_AddMenuButton(clsName,text,image,"",Left!)
end function

public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly alignment position);return of_InsertMenuButton(UpperBound(Items)+1,PopupMenu,text,image,tiptext,position)
end function

public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext);return of_AddMenuButton(popupmenu,text,image,tiptext,left!)
end function

public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly alignment position);return of_AddMenuButton(popupmenu,text,image,"",position)
end function

public function integer of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image);return of_AddMenuButton(popupmenu,text,image,"",left!)
end function

public function long of_setpopupmenu (readonly integer index, ref n_cst_popupmenu popupmenu);boolean bOwner

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if Items[index].ItemType <> ITT_DROPDOWN then return RetCode.E_NO_SUPPORT
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

private subroutine _of_drawitem (readonly integer index, readonly unsignedlong hdc);ulong borderColor,bkColor,nState
ulong chevronBorderColor,chevronBkColor,nChevronState
Uint itemBorderStyle
RADIUSF rdBorder,rdChevron
RECTF paintRect

if Not Items[index].Visible or Items[index].Hidden then return

nState = of_GetItemState(index)

if theme.#ItemStyle = theme.ITS_WIN8 or theme.#ItemStyle = theme.ITS_WIN10 then
	itemBorderStyle = Enums.BS_SOLID
elseif theme.#ItemStyle = theme.ITS_VISTA then
	if Items[index].Position = Right! then
		if BitTest(Items[index].flag,ITF_BEGIN) then
			rdBorder.rightBottom = 4
		end if
		if BitTest(Items[index].flag,ITF_END) then
			rdBorder.leftBottom = 4
		end if
	else
		rdBorder.leftBottom = 2
		rdBorder.rightBottom = 2
	end if
	itemBorderStyle = Enums.BS_ROUND
elseif theme.#ItemStyle = theme.ITS_XP then
	rdBorder.leftTop = 4
	rdBorder.rightTop = 4
	rdBorder.leftBottom = 4
	rdBorder.rightBottom = 4
	itemBorderStyle = Enums.BS_ROUND
elseif theme.#ItemStyle = theme.ITS_QQ then
	rdBorder.leftTop = 4
	rdBorder.rightTop = 4
	rdBorder.leftBottom = 4
	rdBorder.rightBottom = 4
	itemBorderStyle = Enums.BS_ROUND
end if

choose case Items[index].ItemType 
	case ITT_SEPARATOR
		borderColor = theme.of_GetItemColor(index,theme.CLR_LINE,nState,WOT_TITLEBAR)
		if theme.#BkgndStyle = Enums.SOLID then
			Painter.DrawLine(hdc,&
						Items[index].rcPaint.left,&
						Items[index].rcPaint.top + 4,&
						Items[index].rcPaint.left,&
						Items[index].rcPaint.bottom - 4,&
						borderColor,Enums.LS_SOLID ,false,1)
		else
			Painter.DrawGradientLine(hdc,&
						Items[index].rcPaint.left,&
						Items[index].rcPaint.top,&
						Items[index].rcPaint.left,&
						Items[index].rcPaint.bottom,&
						0,borderColor,Enums.LS_SOLID ,true,true,1)
		end if
	case ITT_LABEL
		_of_DrawItemText(index,hdc)
	case ITT_LINK
		_of_DrawItemText(index,hdc)
	case ITT_ICON
		if Items[index].UseAnimatedImage then
			Items[index].AnimatedImage.Draw(hdc, Items[index].rcImage.left ,Items[index].rcImage.top,BitTest(nState,Enums.STATE_DISABLED))
		else
			_ImageList.Draw(Items[index].imageIndex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top,BitTest(nState,Enums.STATE_DISABLED))
		end if
	case else
		//Fill background
		choose case theme.#ItemStyle
			case theme.ITS_XP,theme.ITS_VISTA																																/*---- XP/Vista ----*/
				if Not BitTest(nState,Enums.STATE_DISABLED) or Items[index].Toggled or Items[index].Position = Right! then
					bkColor = theme.of_GetItemColor(index,theme.CLR_BKGND,nState,WOT_TITLEBAR)
					borderColor	= theme.of_GetItemColor(index,theme.CLR_BORDER,nState,WOT_TITLEBAR)
					if Items[index].ItemType = ITT_SPLIT then
						nChevronState = of_GetItemChevronState(index)
						chevronBkColor = theme.of_GetItemColor(index,theme.CLR_CHEVRONBKGND,nChevronState,WOT_TITLEBAR)
						chevronBorderColor = theme.of_GetItemColor(index,theme.CLR_CHEVRONBORDER,nChevronState,WOT_TITLEBAR)
						rdChevron.rightTop = rdBorder.rightTop
						rdChevron.rightBottom = rdBorder.rightBottom
						rdBorder.rightTop = 0
						rdBorder.rightBottom = 0
						paintRect = Items[index].rcPaint
						paintRect.right = Items[index].Chevron.rcPaint.left + 1
						if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 and BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
							if Items[index].Flashing then
								bkColor = ARGBLighten(bkColor,0.4)
							end if
						end if
						if BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
							if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
								borderColor = ARGBDarken(borderColor,0.2)
							end if
							if BitAND(nState,Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 or (Items[index].Position = Right! and BitTest(nState,Enums.STATE_ACTIVE)) then
								Painter.ThemeFill( hdc, paintRect, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
																			itemBorderStyle,borderColor,rdBorder)
							else
								Painter.DrawThemeBorder(hdc,paintRect,borderColor,Enums.TRANSPARENT,itemBorderStyle,rdBorder)
							end if
							Painter.ThemeFill( hdc, Items[index].Chevron.rcPaint, chevronBkColor,Enums.VERT,theme.#ItemBkgndStyle,nChevronState,false,&
																	itemBorderStyle,ARGBDarken(chevronBorderColor,0.2),rdChevron)
						elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 or (Items[index].Position = Right! and ((Not BitTest(nState,Enums.STATE_DISABLED) and BitTest(nState,Enums.STATE_ACTIVE)) or Items[index].Flashing)) then
							if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
								borderColor = ARGBDarken(borderColor,0.2)
							end if
							if Items[index].Position = Right! and BitTest(nState,Enums.STATE_ACTIVE) then
								Painter.ThemeFill( hdc, Items[index].Chevron.rcPaint, chevronBkColor,Enums.VERT,theme.#ItemBkgndStyle,nChevronState,false,&
																	itemBorderStyle,chevronBorderColor,rdChevron)
							else
								Painter.DrawThemeBorder(hdc,Items[index].Chevron.rcPaint,chevronBorderColor,Enums.TRANSPARENT,itemBorderStyle,rdChevron)
							end if
							Painter.ThemeFill( hdc, paintRect, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
																		itemBorderStyle,borderColor,rdBorder)
						elseif Items[index].Position = Right! or Items[index].Flashing then
							rdBorder.rightTop = rdChevron.rightTop
							rdBorder.rightBottom = rdChevron.rightBottom
							Painter.DrawThemeBorder(hdc,Items[index].rcPaint,borderColor,Enums.TRANSPARENT,itemBorderStyle,rdBorder)
						end if
					else
						if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
							if Items[index].Flashing then
								bkColor = ARGBLighten(bkColor,0.4)
							end if
						end if
						if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 or (Items[index].Position = Right! and (BitTest(nState,Enums.STATE_ACTIVE) or Items[index].Flashing)) then
							Painter.ThemeFill( hdc, Items[index].rcPaint, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
																		itemBorderStyle,borderColor,rdBorder)
						elseif Items[index].Position = Right! or Items[index].Flashing then
							Painter.DrawThemeBorder(hdc,Items[index].rcPaint,borderColor,Enums.TRANSPARENT,itemBorderStyle,rdBorder)
						end if
					end if
				end if
			case theme.ITS_WIN8,theme.ITS_WIN10																														/*---- Win8/10 ----*/
				if Not BitTest(nState,Enums.STATE_DISABLED) or Items[index].Toggled or (theme.#ItemStyle = theme.ITS_WIN8 and Items[index].ItemType = ITT_CLOSE) then
					bkColor = theme.of_GetItemColor(index,theme.CLR_BKGND,nState,WOT_TITLEBAR)
					borderColor	= theme.of_GetItemColor(index,theme.CLR_BORDER,nState,WOT_TITLEBAR)
					if Items[index].ItemType = ITT_SPLIT then
						nChevronState = of_GetItemChevronState(index)
						chevronBkColor = theme.of_GetItemColor(index,theme.CLR_CHEVRONBKGND,nChevronState,WOT_TITLEBAR)
						chevronBorderColor = theme.of_GetItemColor(index,theme.CLR_CHEVRONBORDER,nChevronState,WOT_TITLEBAR)
						paintRect = Items[index].rcPaint
						paintRect.right = Items[index].Chevron.rcPaint.left + 1
						if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 and BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
							if Items[index].Flashing then
								bkColor = ARGBLighten(bkColor,0.4)
							end if
						end if
						if BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
							if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
								borderColor = ARGBDarken(borderColor,0.2)
							end if
							if BitAND(nState,Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
								Painter.ThemeFill( hdc, paintRect, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
																			itemBorderStyle,borderColor,rdBorder)
							else
								Painter.DrawThemeBorder(hdc,paintRect,borderColor,Enums.TRANSPARENT,itemBorderStyle,rdBorder)
							end if
							Painter.ThemeFill( hdc, Items[index].Chevron.rcPaint, chevronBkColor,Enums.VERT,theme.#ItemBkgndStyle,nChevronState,false,&
																	itemBorderStyle,ARGBDarken(chevronBorderColor,0.2),rdChevron)
						elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
							if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
								borderColor = ARGBDarken(borderColor,0.2)
							end if
							Painter.DrawThemeBorder(hdc,Items[index].Chevron.rcPaint,chevronBorderColor,Enums.TRANSPARENT,itemBorderStyle,rdChevron)
							Painter.ThemeFill( hdc, paintRect, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
																		itemBorderStyle,borderColor,rdBorder)
						elseif Items[index].Flashing then
							Painter.DrawThemeBorder(hdc,Items[index].rcPaint,borderColor,Enums.TRANSPARENT,itemBorderStyle,rdBorder)
						end if
					else
						if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
							if Items[index].Flashing then
								bkColor = ARGBLighten(bkColor,0.4)
							end if
						end if
						if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 or &
							(theme.#ItemStyle = theme.ITS_WIN8 and Items[index].ItemType = ITT_CLOSE and BitTest(nState,Enums.STATE_ACTIVE)) then
							Painter.ThemeFill( hdc, Items[index].rcPaint, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
																		itemBorderStyle,borderColor,rdBorder)
						elseif Items[index].Flashing then
							Painter.DrawThemeBorder(hdc,Items[index].rcPaint,borderColor,Enums.TRANSPARENT,itemBorderStyle,rdBorder)
						end if
					end if
				end if
			case theme.ITS_QQ																																/*---- QQ ----*/
				if Not BitTest(nState,Enums.STATE_DISABLED) or Items[index].Toggled or Items[index].Position = Right! then
					bkColor = theme.of_GetItemColor(index,theme.CLR_BKGND,nState,WOT_TITLEBAR)
					borderColor	= theme.of_GetItemColor(index,theme.CLR_BORDER,nState,WOT_TITLEBAR)
					if Items[index].ItemType = ITT_SPLIT then
						nChevronState = of_GetItemChevronState(index)
						chevronBkColor = theme.of_GetItemColor(index,theme.CLR_CHEVRONBKGND,nChevronState,WOT_TITLEBAR)
						chevronBorderColor = theme.of_GetItemColor(index,theme.CLR_CHEVRONBORDER,nChevronState,WOT_TITLEBAR)
						rdChevron.rightTop = rdBorder.rightTop
						rdChevron.rightBottom = rdBorder.rightBottom
						rdBorder.rightTop = 0
						rdBorder.rightBottom = 0
						paintRect = Items[index].rcPaint
						paintRect.right = Items[index].Chevron.rcPaint.left + 1
						if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 and BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
							if Items[index].Flashing then
								bkColor = ARGBLighten(bkColor,0.4)
							end if
						end if
						if Items[index].Position = Right! then	//QQ风格单独处理
							if BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
								if BitAND(nState,Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
									Painter.of_FillRect(hdc,paintRect,ToARGB(220,ToRGB(bkColor)),0,Enums.VERT,false,false,0)
								end if
								Painter.of_FillRect(hdc,Items[index].Chevron.rcPaint,ToARGB(200,ToRGB(chevronBkColor)),0,Enums.VERT,false,false,0)
							elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
								Painter.of_FillRect(hdc,paintRect,ToARGB(200,ToRGB(bkColor)),0,Enums.VERT,false,false,0)
							elseif Items[index].Flashing then
								Painter.of_FillRect(hdc,paintRect,ToARGB(180,ToRGB(bkColor)),0,Enums.VERT,false,false,0)
							end if
						else
							if BitAND(nChevronState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
								if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
									borderColor = ARGBDarken(borderColor,0.2)
								end if
								if BitAND(nState,Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
									Painter.ThemeFill( hdc, paintRect, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
																				itemBorderStyle,borderColor,rdBorder)
								else
									Painter.DrawThemeBorder(hdc,paintRect,borderColor,Enums.TRANSPARENT,itemBorderStyle,rdBorder)
								end if
								Painter.ThemeFill( hdc, Items[index].Chevron.rcPaint, chevronBkColor,Enums.VERT,theme.#ItemBkgndStyle,nChevronState,false,&
																		itemBorderStyle,ARGBDarken(chevronBorderColor,0.2),rdChevron)
							elseif BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
								if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
									borderColor = ARGBDarken(borderColor,0.2)
								end if
								Painter.DrawThemeBorder(hdc,Items[index].Chevron.rcPaint,chevronBorderColor,Enums.TRANSPARENT,itemBorderStyle,rdChevron)
								Painter.ThemeFill( hdc, paintRect, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
																			itemBorderStyle,borderColor,rdBorder)
							elseif Items[index].Flashing then
								rdBorder.rightTop = rdChevron.rightTop
								rdBorder.rightBottom = rdChevron.rightBottom
								Painter.DrawThemeBorder(hdc,Items[index].rcPaint,borderColor,Enums.TRANSPARENT,itemBorderStyle,rdBorder)
							end if
						end if
					else
						if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) = 0 then
							if Items[index].Flashing then
								bkColor = ARGBLighten(bkColor,0.4)
							end if
						end if
						if Items[index].Position = Right! then	//QQ风格单独处理
							if Not BitTest(nState,Enums.STATE_DISABLED) then
								if BitTest(nState,Enums.STATE_PRESSED) then
									Painter.of_FillRect(hdc,Items[index].rcPaint,ToARGB(220,TORGB(bkColor)),0,Enums.VERT,false,false,0)
								elseif BitTest(nState,Enums.STATE_HOVER) then
									Painter.of_FillRect(hdc,Items[index].rcPaint,ToARGB(200,TORGB(bkColor)),0,Enums.VERT,false,false,0)
								elseif BitTest(nState,Enums.STATE_HIGHLIGHTED) then
									Painter.of_FillRect(hdc,Items[index].rcPaint,ToARGB(180,TORGB(bkColor)),0,Enums.VERT,false,false,0)
								elseif Items[index].flashing then
									Painter.of_FillRect(hdc,Items[index].rcPaint,ToARGB(180,TORGB(bkColor)),0,Enums.VERT,false,false,0)
								end if
							else
								Painter.of_FillRect(hdc,Items[index].rcPaint,ToARGB(100,TORGB(bkColor)),0,Enums.VERT,false,false,0)
							end if
						else
							if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED + Enums.STATE_HIGHLIGHTED) <> 0 then
								Painter.ThemeFill( hdc, Items[index].rcPaint, bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
																			itemBorderStyle,borderColor,rdBorder)
							elseif Items[index].Flashing then
								Painter.DrawThemeBorder(hdc,Items[index].rcPaint,borderColor,Enums.TRANSPARENT,itemBorderStyle,rdBorder)
							end if
						end if
					end if
				end if
				if Items[index].position = right! then	//QQ风格单独处理边框
					Painter.DrawGradientLine(hdc,&
						Items[index].rcPaint.left,&
						Items[index].rcPaint.top,&
						Items[index].rcPaint.left,&
						Items[index].rcPaint.bottom - 4,&
						borderColor,0,Enums.LS_SOLID ,false,false,P2DY(1))
					Painter.DrawGradientLine(hdc,&
						Items[index].rcPaint.right,&
						Items[index].rcPaint.top,&
						Items[index].rcPaint.right,&
						Items[index].rcPaint.bottom - 4,&
						borderColor,0,Enums.LS_SOLID ,false,false,P2DY(1))
				end if
		end choose
	
		//Draw image
		if Items[index].imageIndex > 0 then
			if Items[index].mousedown or Items[index].Toggled then
				_ImageList.Draw(Items[index].imageIndex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top + 1,BitTest(nState,Enums.STATE_DISABLED))
			else
				_ImageList.Draw(Items[index].imageIndex,hdc, Items[index].rcImage.left ,Items[index].rcImage.top,BitTest(nState,Enums.STATE_DISABLED))
			end if
		end if
		
		//Draw text
		if Items[index].DisplayText and Items[index].szText.cx > 0 then
			_of_DrawItemText(index,hdc)
		end if
		
		//Draw chevron
		if Items[index].Chevron.Visible then
			_of_DrawItemChevron(index,hdc)
		end if
end choose
end subroutine

private subroutine _of_drawitem (readonly integer index, readonly boolean bimageonly, readonly boolean fadeanimation);ulong safeDC

if _of_IsLockUpdate() then return
if Not _of_IsVisible() then return
if _of_IsIconic() and Not _MouseOver then return
if index < 1 or index > UpperBound(Items) then return
if Not Items[index].visible or Items[index].Hidden then return

safeDC=_of_GetSafeDC()

if safeDC > 0 then
	
	if bImageOnly then
		Painter.IntersectClipRect(safeDC,Items[index].rcImage)
	else
		Painter.IntersectClipRect(safeDC,Items[index].rcPaint)
	end if
	
	Event OnEraseBKgnd(safedc)
	
	_of_DrawItem(index,safeDC)
	
	Painter.SelectClipRgn(safeDC,0)
	
	ulong hUpdateRgn
	
	if bImageOnly then
		hUpdateRgn = Painter.CreateRectRgn(Items[index].rcImage)
	else
		hUpdateRgn = Painter.CreateRectRgn(Items[index].rcPaint)
	end if
	
	_of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
end if
end subroutine

private subroutine _of_drawitem (readonly integer index, readonly boolean fadeanimation);_of_DrawItem(index,false,fadeAnimation)
end subroutine

private function boolean _of_hasvalidimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

if Items[index].UseAnimatedImage then
	return (Items[index].AnimatedImage.GetFrameCount() > 0)
else
	return (Items[index].imageIndex > 0)
end if
end function

public function string of_getanimatedimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return ""

return Items[index].amimage
end function

public function boolean of_isusedanimatedimage (readonly integer index);if index < 1 or index > UpperBound(Items) then return false

return Items[index].UseAnimatedImage
end function

public function long of_setanimatedimage (readonly integer index, readonly string amimage);int frameCount
boolean rt

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if _of_IsSysButton(index) then return RetCode.E_NO_SUPPORT
if Items[index].ItemType <> ITT_ICON then return RetCode.E_NO_SUPPORT
if Items[index].AMImage = amimage then return RetCode.OK

Items[index].AMImage = amimage

if Not IsValidObject(Items[index].AnimatedImage) then
	Items[index].AnimatedImage = Create n_image
	Items[index].AnimatedImage.ShareImage(true)
	Items[index].AnimatedImage.SetImageSize(#IconSize.cx,#IconSize.cy)
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

public function long of_useanimatedimage (readonly integer index, readonly boolean used);int frameCount

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if _of_IsSysButton(index) then return RetCode.E_NO_SUPPORT
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

public function unsignedlong of_getitemstate (readonly integer index);ulong nState

if index < 1 or index > UpperBound(Items) then return 0

if Items[index].Toggled or (Items[index].ItemType = ITT_DROPDOWN and Items[index].MouseDown) then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if Items[index].MouseOver and Not Items[index].Chevron.MouseOver then nState += Enums.STATE_HOVER
	if Items[index].MouseDown then nState += Enums.STATE_PRESSED
end if
if Items[index].Highlighted then nState += Enums.STATE_HIGHLIGHTED
if Items[index].FlashTime = -1 or Items[index].FlashTime > 0 then nState += Enums.STATE_FLASHING
if Not Items[index].Enabled or Not #Enabled then nState += Enums.STATE_DISABLED

return BitOR(nState,#ParentWindow.wf_GetState())
end function

public function unsignedlong of_getchevronstate ();ulong nState

if Chevron.MouseDown then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if Chevron.MouseOver then nState += Enums.STATE_HOVER
end if

return BitOR(nState,#ParentWindow.wf_GetState())
end function

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if BitAND(flags,ADJ_BORDER) > 0 then
	if theme.#BorderStyle = Enums.BS_SOLID or theme.#BorderStyle = Enums.BS_ROUND then
		fBorderSize = P2DX(1)
		adjRect.left += fBorderSize
		adjRect.top += fBorderSize
		adjRect.right -= fBorderSize
	end if
end if
end subroutine

private function unsignedlong _of_popupmenu (real xpos, real ypos);//Chevron menu
ulong rtCode
ulong pmFlags
int nCount, index
n_cst_popupmenu ln_menu
RECTF wndRect

if Not Chevron.visible then return 0

Painter.GetWindowRect(#ParentWindow.#Handle,ref wndRect)

if _of_IsIconic() then
	xpos = wndRect.left + Chevron.rcPaint.left
	ypos = wndRect.top + Chevron.rcPaint.top
	pmFlags = Win32.TPM_LEFTALIGN + Win32.TPM_BOTTOMALIGN
else
	xpos = wndRect.left + Chevron.rcPaint.left
	ypos = wndRect.top + Chevron.rcPaint.bottom + 1
	pmFlags = Win32.TPM_LEFTALIGN + Win32.TPM_TOPALIGN
end if

if IsPrevented(#ParentWindow.Event OnPopupMenu(IDX_CHEVRON,ref xpos,ref ypos,ref pmFlags,WOT_TITLEBAR)) then return 0
if Not IsValid(this) then return 0

ln_menu = Create n_cst_popupmenu
ln_menu.of_SetToolTip(#ParentWindow.#ToolTip)
ln_menu.theme.of_SetTheme(theme)
ln_menu.theme.of_SetIconSize(#IconSize.cx,#IconSize.cy)
ln_menu.theme.Font.of_SetFont(font)

nCount = UpperBound(Items)

/* Left first */
for index = 1 to nCount
	if Items[index].Position = Right! then continue
	if Not Items[index].Visible or Not Items[index].Hidden then continue
	if Not _of_IsButton(index) and Items[index].ItemType <> ITT_SEPARATOR then
		continue
	end if
	if Items[index].ItemType = ITT_SEPARATOR then
		ln_menu.of_AddSeparator( )
	elseif /*Items[index].ItemType = ITT_DROPDOWN and*/ IsValidObject(Items[index].PopupMenu) then
		ln_menu.of_AddSubMenu( Items[index].PopupMenu, Items[index].text, Items[index].Image,Items[index].tipText, Items[index].ItemType = ITT_SPLIT, Items[index].Enabled ,index)
	else
		ln_menu.of_AddMenu(Items[index].text,Items[index].Image,Items[index].tipText,Items[index].Enabled  ,index)
		if Items[index].Toggled then
			ln_menu.of_Check(index,false,true)
		end if
	end if
next

/* Right second */
for index = nCount to 1 step -1
	if Items[index].Position = Left! then continue
	if Not Items[index].Visible or Not Items[index].Hidden then continue
	if Not _of_IsButton(index) and Items[index].ItemType <> ITT_SEPARATOR then
		continue
	end if
	if Items[index].ItemType = ITT_SEPARATOR then
		ln_menu.of_AddSeparator( )
	elseif /*Items[index].ItemType = ITT_DROPDOWN and*/ IsValidObject(Items[index].PopupMenu) then
		ln_menu.of_AddSubMenu( Items[index].PopupMenu, Items[index].text,Items[index].Image, Items[index].tipText, Items[index].ItemType = ITT_SPLIT, Items[index].Enabled ,index)
	else
		ln_menu.of_AddMenu(Items[index].text,Items[index].Image,Items[index].tipText,Items[index].Enabled ,index)
		if Items[index].Toggled then
			ln_menu.of_Check(index,false,true)
		end if
	end if
next

rtCode = ln_menu.of_Popup(xpos,ypos, pmFlags)
if Not IsValid(this) then return rtCode

if rtCode > 0 then
	rtCode = ln_menu.of_GetLastSelectID()
	if rtCode > 0 then
		if IsAllowed(#ParentWindow.Event OnButtonclicking(rtCode,WOT_TITLEBAR)) then
			if Not IsValid(this) then return rtCode
			#ParentWindow.Event OnButtonclicked(rtCode,WOT_TITLEBAR)
			if Not IsValid(this) then return rtCode
			choose case rtCode
				case IDX_CLOSE
					Close(#ParentWindow)
					if Not IsValid(this) then return rtCode
				case IDX_MAX
					if #ParentWindow.wf_IsMaximized() then
						#ParentWindow.wf_SetWindowStateAsync(Normal!)
					else
						#ParentWindow.wf_SetWindowStateAsync(Maximized!)
					end if
				case IDX_MINI
					if Win32.IsShowInTaskBar(#ParentWindow.#Handle) then
						#ParentWindow.wf_SetWindowStateAsync(Minimized!)
					else
						if #ParentWindow.wf_IsMinimized() then
							#ParentWindow.wf_SetWindowStateAsync(Normal!)
						else
							#ParentWindow.wf_SetWindowStateAsync(Minimized!)
						end if
					end if
			end choose
		end if
	else
		n_cst_popupmenu ln_subMenuSelect,ln_subMenuSelect2,ln_subMenu
		if IsSucceeded(ln_menu.of_GetLastSelectSubMenu(ref ln_subMenuSelect)) then
			rtCode = ln_subMenuSelect.of_GetLastSelectID()
			if rtCode > 0 then
				int nSelectIndex
				for index = ln_menu.of_GetCount() to 1 step -1
					if IsSucceeded(ln_menu.of_GetSubMenu(index,true,ref ln_subMenu)) then
						if ln_subMenu = ln_subMenuSelect then
							nSelectIndex = ln_menu.of_GetID(index)
							exit
						else
							if IsSucceeded(ln_subMenu.of_GetLastSelectSubMenu(ref ln_subMenuSelect2)) then
								if ln_subMenuSelect = ln_subMenuSelect2 then
									nSelectIndex = ln_menu.of_GetID(index)
									exit
								end if
							end if
						end if
					end if
				next
				if nSelectIndex = 0 then
					nSelectIndex = IDX_CHEVRON
				end if
				if IsAllowed(#ParentWindow.Event OnMenuSelecting(nSelectIndex,rtCode,WOT_TITLEBAR)) then
					if Not IsValid(this) then return rtCode
					#ParentWindow.Event OnMenuSelected(nSelectIndex,rtCode,WOT_TITLEBAR)
					if Not IsValid(this) then return rtCode
				end if
			end if
		end if
	end if
end if

Destroy ln_menu

_lastPopupIndex = IDX_CHEVRON
_lastPopupTime = Cpu()

return rtCode
end function

private function unsignedlong _of_popupmenu (readonly integer index, real xpos, real ypos);//Item PopupMenu
ulong rtCode
ulong pmFlags
RECTF wndRect

if index < 0 or index > UpperBound(Items) then return 0
if Not IsValidObject(Items[index].PopupMenu) then return 0

Items[index].PopupMenu.of_SetToolTip(#ParentWindow.#ToolTip)
Items[index].PopupMenu.theme.of_SetTheme(theme)

Painter.GetWindowRect(#ParentWindow.#Handle,ref wndRect)

if _of_IsIconic() then
	if Items[index].ItemType = ITT_DROPDOWN then
		xpos = wndRect.left +  Items[index].rcPaint.left
		ypos = wndRect.top +  Items[index].rcPaint.top
	elseif Items[index].ItemType = ITT_SPLIT then
		xpos = wndRect.left +  Items[index].Chevron.rcPaint.left
		ypos = wndRect.top +  Items[index].Chevron.rcPaint.top
	end if
	pmFlags = Win32.TPM_LEFTALIGN + Win32.TPM_BOTTOMALIGN
else
	if Items[index].ItemType = ITT_DROPDOWN then
		xpos = wndRect.left + Items[index].rcPaint.left
		ypos = wndRect.top + Items[index].rcPaint.bottom + 1
	elseif Items[index].ItemType = ITT_SPLIT then
		xpos = wndRect.left + Items[index].Chevron.rcPaint.left
		ypos = wndRect.top + Items[index].Chevron.rcPaint.bottom + 1
	end if
	pmFlags = Win32.TPM_LEFTALIGN + Win32.TPM_TOPALIGN
end if

if IsPrevented(#ParentWindow.Event OnPopupMenu(index,ref xpos,ref ypos,ref pmFlags,WOT_TITLEBAR)) then return 0
if Not IsValid(this) then return 0

rtCode = Items[index].PopupMenu.of_Popup(xpos,ypos, pmFlags)
if Not IsValid(this) then return rtCode

if rtCode > 0 then
	if IsAllowed(#ParentWindow.Event OnMenuSelecting(index,rtCode,WOT_TITLEBAR)) then
		if Not IsValid(this) then return rtCode
		#ParentWindow.Event OnMenuSelected(index,rtCode,WOT_TITLEBAR)
		if Not IsValid(this) then return rtCode
	end if
end if
		
_lastPopupIndex = index
_lastPopupTime = Cpu()

return rtCode
end function

public function long of_seticonsize (readonly real width, readonly real height);int index

if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if #IconSize.cx = width and #IconSize.cy = height then return RetCode.OK

#IconSize.cx = width
#IconSize.cy = height

_ImageList.SetImageSize(#IconSize.cx,#IconSize.cy)

for index = 1 to UpperBound(Items)
	if IsValidObject(Items[index].AnimatedImage) then
		Items[index].AnimatedImage.SetImageSize(#IconSize.cx,#IconSize.cy)
	end if
next

of_UpdatePoints()

return RetCode.OK
end function

public function long of_setitemmargin (readonly real margin);if #ItemMargin = margin then return RetCode.OK

#ItemMargin = margin

of_UpdatePoints()

return RetCode.OK
end function

public function integer of_indexfrompoint (readonly real xpos, readonly real ypos);int index

if Not _of_IsVisible() or Not #Enabled then return 0
if Not Painter.PtInRect(rcPaint,xpos,ypos) then return 0

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
	if Not Items[index].visible  or Items[index].hidden or Not Items[index].enabled or Not _of_IsButton(index) then continue
	
	if Painter.PtInRect(Items[index].rcPaint,xpos,ypos) then
		return index
	end if

next

return 0
end function

public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly alignment position);int i
ITEMDATA newItem

if index <= IDX_MINI or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

if Not IsValidObject(PopupMenu) then
	if Not _of_CreatePopupMenu(ref PopupMenu) then return RetCode.E_INVALID_OBJECT
	newItem.MenuOwner = true
	PopupMenu.#Tag = ""
elseif PopupMenu.#Tag = PRP_POPUPMENUCREATOR then
	newItem.MenuOwner = true
	PopupMenu.#Tag = ""
end if

newItem.ItemType = ITT_SPLIT
newItem.Text = text
newItem.tipText = tiptext
newItem.enabled = true
newItem.visible = true
newItem.displaytext = false
newItem.position = position
newItem.PopupMenu = PopupMenu
newItem.Chevron.Visible = true

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = newItem

if len(image) > 0 then
	Items[index].image = image
	Items[index].imageindex = _ImageList.AddImage(theme.of_GetItemIcon(index,image,0,WOT_TITLEBAR))
end if

_of_UpdateTextSize(index)

of_UpdatePoints()

return index
end function

public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext);return of_InsertSplitButton(index,popupmenu,text,image,tiptext,left!)
end function

public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly alignment position);return of_InsertSplitButton(index,popupmenu,text,image,"",position)
end function

public function integer of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image);return of_InsertSplitButton(index,popupmenu,text,image,"",left!)
end function

public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly alignment position);int newIndex
n_cst_popupmenu popupMenu

if index < 1 or index > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE
if Not _of_CreatePopupMenu(ref popupMenu,clsName) then return RetCode.E_INVALID_TYPE

newIndex = of_InsertSplitButton(index,ref popupMenu,text,image,tipText,Position)
if newIndex <= 0 then
	Destroy popupMenu
end if

return newIndex
end function

public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext);return of_InsertSplitButton(index,clsName,text,image,tipText,Left!)
end function

public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly alignment position);return of_InsertSplitButton(index,clsName,text,image,"",position)
end function

public function integer of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image);return of_InsertSplitButton(index,clsName,text,image,"",Left!)
end function

public function integer of_addsplitbutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly alignment position);return of_InsertSplitButton(UpperBound(Items) + 1,clsName,text,image,tipText,position)
end function

public function integer of_addsplitbutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext);return of_AddSplitButton(clsName,text,image,tipText,Left!)
end function

public function integer of_addsplitbutton (readonly string clsname, readonly string text, readonly string image, readonly alignment position);return of_AddSplitButton(clsName,text,image,"",position)
end function

public function integer of_addsplitbutton (readonly string clsname, readonly string text, readonly string image);return of_AddSplitButton(clsName,text,image,"",Left!)
end function

public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly alignment position);return of_InsertSplitButton(UpperBound(Items)+1,PopupMenu,text,image,tiptext,position)
end function

public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext);return of_AddSplitButton(popupmenu,text,image,tiptext,left!)
end function

public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly alignment position);return of_AddSplitButton(popupmenu,text,image,"",position)
end function

public function integer of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image);return of_AddSplitButton(popupmenu,text,image,"",left!)
end function

private subroutine _of_drawitemchevron (readonly integer index, readonly unsignedlong hdc);constant real ARROWSIZE = 6
ulong lineColor,arrowColor,nState
POINTF pt1,pt2,pt3

nState = of_GetItemState(index)
lineColor 	= theme.of_GetItemColor(index,theme.CLR_LINE,nState,WOT_TITLEBAR)
arrowColor	= theme.of_GetItemColor(index,theme.CLR_ARROW,nState,WOT_TITLEBAR)

//Draw line
if Items[index].ItemType = ITT_SPLIT and Items[index].Enabled then
	if (Not Items[index].MouseOver and Not Items[index].MouseDown and &
			Not Items[index].Chevron.MouseDown and Not Items[index].Toggled) and &
		(Items[index].HighLighted or ((Items[index].FlashTime = -1 or Items[index].FlashTime > 0) and Items[index].flashing) or &
			(theme.#ItemStyle <> theme.ITS_WIN8 and theme.#ItemStyle <> theme.ITS_WIN10 and Items[index].Position = Right! and BitTest(nState,Enums.STATE_ACTIVE))) or &
			theme.#ItemStyle = theme.ITS_QQ and Items[index].Position = Right! then
		if theme.#ItemStyle = theme.ITS_QQ and Items[index].Position = Right! then
			Painter.DrawGradientLine(hdc,&
						Items[index].Chevron.rcPaint.left,&
						Items[index].Chevron.rcPaint.top + 1,&
						Items[index].Chevron.rcPaint.left,&
						Items[index].Chevron.rcPaint.bottom - 1,&
						0,lineColor,Enums.LS_SOLID ,false,true,P2DY(1))
		else
			Painter.DrawLine(hdc,&
						Items[index].Chevron.rcPaint.left,&
						Items[index].Chevron.rcPaint.top + 1,&
						Items[index].Chevron.rcPaint.left,&
						Items[index].Chevron.rcPaint.bottom - 1,&
						lineColor,Enums.LS_SOLID,&
						false,P2DY(1))
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

private function boolean _of_isoverchevron (readonly integer index, readonly real xpos, readonly real ypos);if index < 1 or index > UpperBound(Items) then return false

if Items[index].enabled and Items[index].visible and &
	Not Items[index].hidden and Items[index].ItemType = ITT_SPLIT then
	if Painter.PtInRect(Items[index].Chevron.rcPaint,xpos,ypos) then
		return true
	end if
end if

return false
end function

public function unsignedlong of_getitemchevronstate (readonly integer index);ulong nState

if index < 1 or index > UpperBound(Items) then return 0

if Items[index].Chevron.MouseDown then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if Items[index].Chevron.MouseOver then nState += Enums.STATE_HOVER
end if
if Not Items[index].Enabled or Not #Enabled then nState += Enums.STATE_DISABLED

return BitOR(nState,#ParentWindow.wf_GetState())
end function

on n_cst_window_titlebar.create
call super::create
this.timer=create timer
this.linkfont=create linkfont
this.font=create font
TriggerEvent( this, "constructor" )
end on

on n_cst_window_titlebar.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.timer)
destroy(this.linkfont)
destroy(this.font)
end on

event constructor;#IconSize.cx = Enums.SMALL
#IconSize.cy = Enums.SMALL

_ImageList = Create n_imagelist
_ImageList_Icon = Create n_imagelist	

_ImageList.ShareImage(true)	
_ImageList_Icon.ShareImage(true)
_ImageList.SetImageSize(#IconSize.cx,#IconSize.cy)
end event

event destructor;int index

for index = 1 to UpperBound(Items)
	if Items[index].MenuOwner then
		Destroy Items[index].PopupMenu
	end if
next

Destroy _ImageList
Destroy _ImageList_Icon
end event

type timer from n_timer within n_cst_window_titlebar descriptor "pb_nvo" = "true" 
end type

event ontimer;call super::ontimer;return Parent.Event OnTimer(id)
end event

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

type linkfont from n_cst_font within n_cst_window_titlebar descriptor "pb_nvo" = "true" 
boolean #underline = true
end type

on linkfont.create
call super::create
end on

on linkfont.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent._of_UpdateTextSize()
Parent.of_UpdatePoints()
end event

type font from n_cst_font within n_cst_window_titlebar descriptor "pb_nvo" = "true" 
end type

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent._of_UpdateTextSize()
Parent.of_UpdatePoints()
end event

