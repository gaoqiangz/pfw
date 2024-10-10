$PBExportHeader$n_cst_taskpanelbar_panel.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_taskpanelbar_panel from nonvisualobject
end type
type titlebar from structure within n_cst_taskpanelbar_panel
end type
type margin from structure within n_cst_taskpanelbar_panel
end type
type timer from n_timer within n_cst_taskpanelbar_panel
end type
type font from n_cst_font within n_cst_taskpanelbar_panel
end type
end forward

type titlebar from structure
	boolean		mouseover
	boolean		mousedown
	integer		imageindex
	sizef		sztitle
	rectf		rcimage
	rectf		rctitle
	rectf		rcarrow
	rectf		rcpaint
end type

type margin from structure
	real		x
	real		y
end type

global type n_cst_taskpanelbar_panel from nonvisualobject
event oninit ( u_cst_taskpanelbar parenttaskpanelbar,  n_tooltip tooltip,  n_imagelist panelimagelist,  n_imagelist itemimagelist )
event type boolean oninitdata ( string title,  string image,  boolean collapsed )
event oncapturechanged ( )
event type long onerasebkgnd ( unsignedlong hdc )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event onmouseleave ( )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event type long onreposition ( ref rectf newrect )
event type long onpaint ( unsignedlong hdc )
event type long onscroll ( real scrollsize )
event type long onhittest ( real xpos,  real ypos )
event type long onnotify ( n_cst_taskpanelbar_baseitem childitem,  long notifycode,  long command )
event type boolean ontimer ( unsignedinteger id )
event onthemechanged ( unsignedinteger eventflag )
event type long onmousehover ( unsignedlong vkey,  real xpos,  real ypos )
event type long onupdatelayout ( real layoutwidth )
timer timer
font font
end type
global n_cst_taskpanelbar_panel n_cst_taskpanelbar_panel

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
Constant Int IDX_TITLEBAR 	= -1

/*--- Properties ---*/
Public:
PrivateWrite u_cst_taskpanelbar	#ParentTaskPanelBar
PrivateWrite	Boolean					#Visible					= true
PrivateWrite	Boolean					#Enabled				= true
Any										#Data
String										#Tag
PrivateWrite String 					#Title
PrivateWrite String 					#Image
PrivateWrite Boolean					#TitleBar					= true
PrivateWrite Boolean					#Arrow					= true
PrivateWrite Boolean					#Collapsed				= false
PrivateWrite Alignment				#TitleAlign				= Left!
PrivateWrite RECTF						#BorderMargin
Boolean									#TitleBarClickable		= true
Boolean									#LockUpdate

/*--- Implementation ---*/
Private:
n_cst_taskpanelbar_theme		theme
n_imagelist							_PanelImageList
n_imagelist							_ItemImageList
n_tooltip								_ToolTip
n_cst_taskpanelbar_baseitem	Items[]
TITLEBAR							TitleBar
RECTF									rcPaint

MARGIN _ItemMargin

Int		_mouseOverIndex		= 0
Int		_mouseDownIndex	= 0
real	_layoutWidth
real	_layoutHeights[]

Uint	_amStatus		= 0	//AMS_NONE
real	_amOffsetSize 	= 0

Boolean _layoutChanged		= false
Boolean _needRecalcLayout	= false
Boolean _MouseOver			= false
Boolean _MouseCaptured 	= false

//Animation status
Constant Long AMS_NONE 			= 0
Constant Long AMS_EXPANDING 	= 1
Constant Long AMS_COLLAPSING 	= 2
//Notify code
Constant Ulong	NCD_UPDATEPOINTS	= 1
Constant Ulong	NCD_ANIMATION		= 2	//command:offsetsize
Constant Ulong	NCD_SETCAPTURE	= 3	//command:1,setcapture;0,releasecapture
Constant Ulong	NCD_SETFOCUS		= 4	//command:1,setfocus;0,releasefocus
Constant Ulong	NCD_CUSTOM			= 5
//Display mode
Constant Uint 	DPM_EXPANDED		= 1
Constant Uint 	DPM_COLLAPSED		= 2
//Timer ID
Constant Uint TM_ANIMATION	= 1
//Timer interval (ms)
Constant Uint TMI_ANIMATION	= 15
//Hit-test code
Constant Long	HTNOWHERE	= 0
Constant Long	HTVALID			= 1
//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
Constant Uint ADJ_TITLEBAR		 	= 4
//Sizes
Constant real ARROWSIZE				= 6		//px
end variables

forward prototypes
private subroutine _of_updateitemlayouts ()
public function boolean of_isvisible ()
private subroutine _of_fillbkgnd (readonly unsignedlong hdc)
public function long of_redraw (readonly boolean fadeanimation)
private subroutine _of_updatetextsize ()
private subroutine _of_drawtitle (readonly unsignedlong hdc)
public function boolean of_isenabled ()
private subroutine _of_filltitlebar (readonly unsignedlong hdc)
private subroutine _of_drawarrow (readonly unsignedlong hdc)
private subroutine _of_capturemouse (readonly boolean capture)
private subroutine _of_drawtitlebar (readonly unsignedlong hdc)
private subroutine _of_drawtitlebar (readonly boolean fadeanimation)
public function long of_finditembytag (readonly string tag, ref n_cst_taskpanelbar_baseitem founditem)
public function long of_finditembytext (readonly string text, ref n_cst_taskpanelbar_baseitem founditem)
public function integer of_getcount ()
public function integer of_getindex (readonly n_cst_taskpanelbar_baseitem item)
public function long of_getitem (readonly integer index, ref n_cst_taskpanelbar_baseitem item)
public function unsignedlong of_getsafedc ()
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime)
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation)
public function long of_updatepoints ()
public function long of_setvisible (readonly boolean visible)
public function long of_setenabled (readonly boolean enabled)
public function long of_settitle (readonly string title)
public function long of_removeall ()
public function long of_settitlebar (readonly boolean show)
public function long of_setarrow (readonly boolean show)
public function long of_settitlealign (readonly alignment align)
public function n_cst_taskpanelbar_link of_insertlink (readonly integer index, readonly string text, readonly string tiptext)
public function n_cst_taskpanelbar_link of_insertlink (readonly integer index, readonly string text)
public function n_cst_taskpanelbar_link of_addlink (readonly string text, readonly string tiptext)
public function n_cst_taskpanelbar_link of_addlink (readonly string text)
private subroutine _of_updatepoints ()
public function n_cst_taskpanelbar_label of_insertlabel (readonly integer index, readonly string text)
public function n_cst_taskpanelbar_label of_addlabel (readonly string text)
public function n_cst_taskpanelbar_icon of_inserticon (readonly integer index, readonly string image, readonly unsignedinteger width, readonly unsignedinteger height)
public function n_cst_taskpanelbar_icon of_inserticon (readonly integer index, readonly string image)
public function n_cst_taskpanelbar_icon of_addicon (readonly string image, readonly unsignedinteger width, readonly unsignedinteger height)
public function n_cst_taskpanelbar_icon of_addicon (readonly string image)
public function n_cst_taskpanelbar_space of_addspace ()
public function n_cst_taskpanelbar_separator of_addseparator ()
public function n_cst_taskpanelbar_checkbox of_insertcheckbox (readonly integer index, readonly string text, readonly boolean checked)
public function n_cst_taskpanelbar_checkbox of_addcheckbox (readonly string text, readonly boolean checked, readonly string tiptext)
public function n_cst_taskpanelbar_checkbox of_addcheckbox (readonly string text, readonly boolean checked)
public function n_cst_taskpanelbar_checkbox of_insertcheckbox (readonly integer index, readonly string text, readonly boolean checked, readonly string tiptext)
public function n_cst_taskpanelbar_radiobox of_insertradiobox (readonly integer index, readonly string text, readonly boolean checked, readonly string tiptext)
public function n_cst_taskpanelbar_radiobox of_insertradiobox (readonly integer index, readonly string text, readonly boolean checked)
public function n_cst_taskpanelbar_radiobox of_addradiobox (readonly string text, readonly boolean checked, readonly string tiptext)
public function n_cst_taskpanelbar_radiobox of_addradiobox (readonly string text, readonly boolean checked)
public function n_cst_taskpanelbar_button of_insertbutton (readonly integer index, readonly string text, readonly string image, readonly string tiptext)
public function n_cst_taskpanelbar_button of_insertbutton (readonly integer index, readonly string text, readonly string image)
public function n_cst_taskpanelbar_button of_addbutton (readonly string text, readonly string image, readonly string tiptext)
public function n_cst_taskpanelbar_button of_addbutton (readonly string text, readonly string image)
private subroutine _of_recalclayout ()
public function long of_setitemmargin (readonly unsignedinteger xmargin, readonly unsignedinteger ymargin)
public function long of_getitemmargin (ref unsignedinteger xmargin, ref unsignedinteger ymargin)
public function long of_checkradios (readonly integer beginindex, readonly integer endindex, readonly integer checkindex, readonly boolean checked, readonly boolean triggerevent)
public function long of_checkradios (readonly integer beginindex, readonly integer endindex, readonly integer checkindex, readonly boolean checked)
private subroutine _of_updatetitlebarpoints ()
private subroutine _of_updateitempoints ()
public function n_cst_taskpanelbar_toolbar of_inserttoolbar (readonly integer index)
public function n_cst_taskpanelbar_toolbar of_addtoolbar ()
public function boolean of_islockupdate ()
public function n_cst_taskpanelbar_button of_addsplitbutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext)
public function n_cst_taskpanelbar_button of_addsplitbutton (readonly string clsname, readonly string text, readonly string image)
public function n_cst_taskpanelbar_button of_addmenubutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext)
public function n_cst_taskpanelbar_button of_addmenubutton (readonly string clsname, readonly string text, readonly string image)
public function n_cst_taskpanelbar_button of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext)
public function n_cst_taskpanelbar_button of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image)
public function n_cst_taskpanelbar_button of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext)
public function n_cst_taskpanelbar_button of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image)
public function n_cst_taskpanelbar_button of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext)
public function n_cst_taskpanelbar_button of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image)
public function n_cst_taskpanelbar_button of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext)
public function n_cst_taskpanelbar_button of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image)
public function n_cst_taskpanelbar_button of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext)
public function n_cst_taskpanelbar_button of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image)
public function n_cst_taskpanelbar_button of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext)
public function n_cst_taskpanelbar_button of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image)
public function n_cst_taskpanelbar_space of_insertspace (readonly integer index)
public function n_cst_taskpanelbar_separator of_insertseparator (readonly integer index)
public function long of_setimage (readonly string image)
public function long of_remove (readonly integer index)
public function n_cst_taskpanelbar_break of_insertbreak (readonly integer index)
public function n_cst_taskpanelbar_break of_addbreak ()
public function n_cst_taskpanelbar_radiobox of_insertradiobox (readonly integer index, readonly string text)
public function n_cst_taskpanelbar_checkbox of_insertcheckbox (readonly integer index, readonly string text)
public function n_cst_taskpanelbar_radiobox of_addradiobox (readonly string text)
public function n_cst_taskpanelbar_checkbox of_addcheckbox (readonly string text)
public function long of_setcollapsed (readonly boolean collapsed, readonly boolean triggerevent)
public function long of_setcollapsed (readonly boolean collapsed)
public function unsignedlong of_getstate ()
public function unsignedlong of_gettitlebarstate ()
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
public function long of_getpaintrect (ref rectf paintrect)
public function integer of_indexfrompoint (readonly real xpos, readonly real ypos)
public function long of_setbordermargin (readonly real left, readonly real top, readonly real right, readonly real bottom)
public function n_cst_taskpanelbar_space of_addspace (readonly real width, readonly real height)
public function n_cst_taskpanelbar_space of_insertspace (readonly integer index, readonly real width, readonly real height)
private function real _of_gettitlebarheight ()
public function long of_findcheckedradio (readonly integer beginindex, readonly integer endindex, ref n_cst_taskpanelbar_radiobox founditem)
public function long of_findcheckedradio (ref n_cst_taskpanelbar_radiobox founditem)
public function long of_checkradios (readonly integer checkindex, readonly boolean checked, readonly boolean triggerevent)
public function long of_checkradios (readonly integer checkindex, readonly boolean checked)
end prototypes

event oninit(u_cst_taskpanelbar parenttaskpanelbar, n_tooltip tooltip, n_imagelist panelimagelist, n_imagelist itemimagelist);#ParentTaskPanelBar	= parenttaskpanelbar
theme					= #ParentTaskPanelBar.theme

_ToolTip = tooltip
_PanelImageList = panelImageList
_ItemImageList = itemimagelist
end event

event type boolean oninitdata(string title, string image, boolean collapsed);#Image = image
TitleBar.ImageIndex = _PanelImageList.AddImage(theme.of_GetPanelIcon(this,image,0))

#Title= Title
#Collapsed = collapsed

_of_UpdateTextSize()
return true
end event

event oncapturechanged();if _MouseCaptured then
	_of_CaptureMouse(false)
	if TitleBar.MouseDown then
		TitleBar.MouseDown = false
		_of_DrawTitleBar(true)
		#ParentTaskPanelBar.Event OnTitleBarMouseUp(this,0,0)
		if Not IsValid(this) then return
	end if
	Event OnMouseLeave()
elseif _mouseDownIndex > 0 then
	Items[_mouseDownIndex].Event OnCaptureChanged()
	if Not IsValid(this) then return
	_mouseDownIndex = 0
end if
end event

event type long onerasebkgnd(unsignedlong hdc);//由子控件调用，用于清除指定DC的背景
if #ParentTaskPanelBar.#Transparent then
	#ParentTaskPanelBar.FillParentBkgnd(hdc)
end if

#ParentTaskPanelBar.Event OnEraseBkgnd(hdc)

if Not #Collapsed then
	_of_FillBkgnd(hdc)
end if

return 1
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);if TitleBar.MouseOver then
	Event OnLButtonDown(vKey,xpos,ypos)
elseif _mouseOverIndex > 0 then
	_mouseDownIndex = _mouseOverIndex
	Items[_mouseDownIndex].Event OnLButtonDBLClk(vkey,xpos,ypos)
end if

return 0
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);if TitleBar.MouseOver then
	TitleBar.MouseDown = true
	_of_DrawTitleBar(false)
	_of_CaptureMouse(true)
	#ParentTaskPanelBar.Event OnTitleBarMouseDown(this,xpos,ypos)
elseif _mouseOverIndex > 0 then
	_mouseDownIndex = _mouseOverIndex
	Items[_mouseDownIndex].Event OnLButtonDown(vkey,xpos,ypos)
end if

return 0
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if _MouseCaptured then
	_of_CaptureMouse(false)
	if TitleBar.MouseDown then
		TitleBar.MouseDown = false
		_of_DrawTitleBar(true)
		#ParentTaskPanelBar.Event OnTitleBarMouseUp(this,xpos,ypos)
		if Not IsValid(this) then return 0
		if TitleBar.MouseOver then
			if IsAllowed(#ParentTaskPanelBar.Event OnTitleBarClicking(this)) then
				if Not IsValid(this) then return 0
				of_SetCollapsed(Not #Collapsed,true)
				#ParentTaskPanelBar.Event OnTitleBarClicked(this)
				if Not IsValid(this) then return 0
			end if
		end if
	end if
elseif _mouseDownIndex > 0 then
	Items[_mouseDownIndex].Event OnLButtonUp(vkey,xpos,ypos)
	if Not IsValid(this) then return 0
	_mouseDownIndex = 0
end if

return 0
end event

event onmouseleave();if _MouseOver then
	_MouseOver = false
	
	if _mouseOverIndex > 0 then
		Items[_mouseOverIndex].Event OnMouseLeave()
		_mouseOverIndex = 0
	end if
	
	if TitleBar.MouseOver then
		TitleBar.MouseOver = false
		#ParentTaskPanelBar.Event OnTitleBarMouseLeave(this)
	end if
	
	of_Redraw(true)
end if
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);int index

if Not _MouseOver then
	_MouseOver = true
	of_Redraw(true)
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

if index = IDX_TITLEBAR then
	if Not TitleBar.MouseOver then
		TitleBar.MouseOver = true
		_of_DrawTitleBar(true)
		#ParentTaskPanelBar.Event OnTitleBarMouseEnter(this,xpos,ypos)
	else
		#ParentTaskPanelBar.Event OnTitleBarMouseMove(this,xpos,ypos)
	end if
else
	if TitleBar.MouseOver then
		TitleBar.MouseOver = false
		_of_DrawTitleBar(true)
		#ParentTaskPanelBar.Event OnTitleBarMouseLeave(this)
	end if
end if

return 0
end event

event type long onreposition(ref rectf newrect);//由父控件调用
//参数:newRect.left,newRect.top为Panel的新座标
//返回值:newRect.bottom为Panel下边界
//*Panel的右边界由_layoutWidth确定,由OnUpdateLayout事件更新
boolean bDirty

if _needRecalcLayout then
	_of_RecalcLayout()
end if

if newRect.left = rcPaint.left and newRect.top = rcPaint.top and Not _layoutChanged then
	if _amStatus = AMS_NONE then
		newRect.bottom = rcPaint.bottom
		return 1
	end if
else
	bDirty = true
end if

_layoutChanged = false

rcPaint = newRect
rcPaint.right = rcPaint.left + _layoutWidth
if (#Collapsed and Not _amStatus = AMS_COLLAPSING) or _amStatus = AMS_EXPANDING then
	rcPaint.bottom = rcPaint.top + _layoutHeights[DPM_COLLAPSED]
else
	rcPaint.bottom = rcPaint.top + _layoutHeights[DPM_EXPANDED]
end if
rcPaint.bottom += _amOffsetSize

if of_IsLockUpdate() then
	//返回Panel下边界
	newRect.bottom = rcPaint.bottom
	return 1
end if

if bDirty then
	_of_UpdatePoints()
end if

//返回Panel下边界
newRect.bottom = rcPaint.bottom
return 0
end event

event type long onpaint(unsignedlong hdc);int index
ulong dcState
RECTF paintRect

if of_IsLockUpdate() then return 1
if Not of_IsVisible() then return 1

if Not #Collapsed or _amStatus <> AMS_NONE then
	_of_FillBkgnd(hdc)
end if

if #TitleBar then
	_of_DrawTitleBar(hdc)
end if

if Not #Collapsed or _amStatus <> AMS_NONE then
	paintRect = rcPaint
	_of_AdjustRect(ref paintRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_TITLEBAR)
	dcState = Painter.SaveDC(hdc)
	Painter.IntersectClipRect(hdc,ref paintRect)
	
	for index = 1 to UpperBound(Items)
		if Items[index].#Type = Items[index].ITT_SPACE or Items[index].#Type = Items[index].ITT_BREAK then continue
		if Items[index].#Visible then
			Items[index].Event OnPaint(hdc)
		end if
	next
	
	Painter.RestoreDC(hdc,dcState)
	/*
	if _amStatus <> AMS_NONE and _amOffsetSize <> 0 then
		Ulong maskColor
		RADIUS rdBorder
		
		rdBorder = theme.#PanelRoundSize
		
		paintRect = rcPaint
	
		if #TitleBar then
			rdBorder.leftTop = 0
			rdBorder.rightTop = 0
			paintRect.top = TitleBar.rcPaint.bottom - 1
		end if
		_of_AdjustRect(ref paintRect,ADJ_BORDER)
		
		if _MouseOver then
			maskColor = theme.of_GetPanelColor(this,theme.CLR_PANELHOVER)
		else
			maskColor = theme.of_GetPanelColor(this,theme.CLR_PANELBKGND)
		end if
		choose case _amStatus
			case AMS_EXPANDING
				maskColor = ToARGB(255 - (255 * (_amOffsetSize / (_layoutHeights[DPM_EXPANDED] - _layoutHeights[DPM_COLLAPSED]))),ToRGB(maskColor))
				Painter.ThemeFill( hdc, paintRect, maskColor, Enums.VERT, theme.#PanelBkgndStyle, false, theme.#PanelBorderStyle,0,rdBorder)
			case AMS_COLLAPSING
				maskColor = ToARGB(255 * (-_amOffsetSize / (_layoutHeights[DPM_EXPANDED] - _layoutHeights[DPM_COLLAPSED])),ToRGB(maskColor))
				Painter.ThemeFill( hdc, paintRect, maskColor, Enums.VERT, theme.#PanelBkgndStyle, false, theme.#PanelBorderStyle,0,rdBorder)
		end choose
	end if*/
end if

return 1
end event

event type long onscroll(real scrollsize);int index

if scrollSize = 0 then return 1

Painter.OffsetRect(ref rcPaint,0,scrollSize)
if #TitleBar then
	Painter.OffsetRect(ref TitleBar.rcPaint,0,scrollSize)
	if TitleBar.szTitle.cx > 0 then
		Painter.OffsetRect(ref TitleBar.rcTitle,0,scrollSize)
	end if
	if TitleBar.ImageIndex > 0 then
		Painter.OffsetRect(ref TitleBar.rcImage,0,scrollSize)
	end if
	if #Arrow then
		Painter.OffsetRect(ref TitleBar.rcArrow,0,scrollSize)
	end if
end if

if Not #Collapsed or _amStatus = AMS_COLLAPSING then
	for index = 1 to UpperBound(Items)
		if Items[index].#Type = Items[index].ITT_BREAK then continue
		if Not Items[index].#Visible then continue
		Items[index].Event OnScroll(scrollSize)
	next
end if

return 0
end event

event type long onhittest(real xpos, real ypos);if Not #Visible or Not #Enabled then return HTNOWHERE

if Painter.PtInRect(ref rcPaint,xpos,ypos) then
	return HTVALID
else
	return HTNOWHERE
end if
end event

event type long onnotify(n_cst_taskpanelbar_baseitem childitem, long notifycode, long command);//来自子控件的消息
choose case notifyCode
	case NCD_UPDATEPOINTS
		of_UpdatePoints()
end choose

return 0
end event

event type boolean ontimer(unsignedinteger id);real nOffsetSize
real nHeight
boolean bContinue

if id = TM_ANIMATION then
	nHeight = rcPaint.bottom - rcPaint.Top
	choose case _amStatus
		case AMS_EXPANDING
			if nHeight < _layoutHeights[DPM_EXPANDED] then
				bContinue = true
				nOffsetSize = Ceiling((_layoutHeights[DPM_EXPANDED] - nHeight) / 10 + 6)
				if nHeight + nOffsetSize > _layoutHeights[DPM_EXPANDED] then
					nOffsetSize = _layoutHeights[DPM_EXPANDED] - nHeight
					bContinue = false
				end if
				_amOffsetSize += nOffsetSize
			end if
		case AMS_COLLAPSING
			if nHeight > _layoutHeights[DPM_COLLAPSED] then
				bContinue = true
				nOffsetSize = -Ceiling((nHeight - _layoutHeights[DPM_COLLAPSED]) / 10 + 6)
				if nHeight + nOffsetSize < _layoutHeights[DPM_COLLAPSED] then
					nOffsetSize = _layoutHeights[DPM_COLLAPSED] - nHeight
					bContinue = false
				end if
				_amOffsetSize += nOffsetSize
			end if
		case else
			bContinue = false
	end choose
	if nOffsetSize <> 0 then
		#ParentTaskPanelBar.Event OnNotify(this,NCD_ANIMATION,nOffsetSize)
	end if
	if Not bContinue then
		_amStatus = AMS_NONE
		_amOffsetSize = 0
		of_Redraw(false)
	end if
end if

return bContinue
end event

event onthemechanged(unsignedinteger eventflag);int index
boolean layoutChanged,dirty,itemEvent

choose case eventFlag
	case theme.EVT_THEME
		_of_UpdateTextSize()
		dirty = true
		layoutChanged = true
		itemEvent = true
	case theme.EVT_PANELICONPOSITION
		if #TitleBar and TitleBar.ImageIndex > 0 then
			_of_UpdateTitleBarPoints()
		end if
	case theme.EVT_PANELARROWPOSITION
		if #TitleBar and #Arrow then
			_of_UpdateTitleBarPoints()
		end if
	case theme.EVT_PANELICONSIZE
		dirty = true
	case theme.EVT_ITEMICONSIZE
		dirty = true
		itemEvent = true
	case theme.EVT_PANELBORDERSTYLE
		layoutChanged = true
		dirty = true
end choose

if dirty then
	if layoutChanged then
		_of_UpdateItemLayouts()
	end if
end if

if itemEvent then
	for index = 1 to UpperBound(Items)
		Items[index].Event OnThemeChanged(eventFlag)
	next
end if

if dirty then
	if Not layoutChanged then
		_of_RecalcLayout()
	end if
end if
end event

event type long onupdatelayout(real layoutwidth);real minWidth

minWidth = #BorderMargin.left + theme.#PanelIconSize.cx + #BorderMargin.right
if layoutWidth < minWidth then
	layoutWidth = minWidth
end if

if _layoutWidth = layoutWidth then return 0

_layoutWidth = layoutWidth

_of_UpdateTextSize()
_of_UpdateItemLayouts()

return 0
end event

private subroutine _of_updateitemlayouts ();int index
real minWidth
RECTF layoutRect

layoutRect.right = _layoutWidth
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

for index = 1 to UpperBound(Items)
	if Items[index].#Type = Items[index].ITT_BREAK then continue
	Items[index].Event OnUpdateLayout(layoutRect.right - layoutRect.left)
next

_of_RecalcLayout()
end subroutine

public function boolean of_isvisible ();RECTF paintRect

if Not #Visible then return false

Painter.GetClientRect(#ParentTaskPanelBar.#Handle,ref paintRect)
if rcPaint.bottom <= paintRect.top or rcPaint.top >= paintRect.bottom then
	return false
else
	return true
end if
end function

private subroutine _of_fillbkgnd (readonly unsignedlong hdc);ulong bkColor,borderColor,nState
RADIUSF rdBorder
RECTF paintRect

if #Collapsed and _amStatus = AMS_NONE then return

nState = of_GetState()
bkColor = theme.of_GetPanelColor(this,theme.CLR_BKGND,nState)
borderColor = theme.of_GetPanelColor(this,theme.CLR_BORDER,nState)

rdBorder = theme.#PanelRoundSize
paintRect = rcPaint

if #TitleBar then
	rdBorder.leftTop = 0
	rdBorder.rightTop = 0
	paintRect.top = TitleBar.rcPaint.bottom - 1
end if

Painter.ThemeFill( hdc, paintRect, bkColor, Enums.VERT, theme.#PanelBkgndStyle,nState, false, theme.#PanelBorderStyle,borderColor,rdBorder)
end subroutine

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC

if of_IsLockUpdate() then return RetCode.FAILED
if Not of_IsVisible() then return RetCode.OK

safeDC = #ParentTaskPanelBar.of_GetSafeDC()

if safeDC > 0 then
	
	Painter.IntersectClipRect(safeDC,rcPaint)
		
	Event OnEraseBkgnd(safeDC)
	Event OnPaint(safeDC)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(rcPaint)
	
	#ParentTaskPanelBar.of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
	
end if

return RetCode.OK
end function

private subroutine _of_updatetextsize ();ulong dtparam
real maxWidth
RECTF calcRect

if Len(#Title) = 0 then
	TitleBar.szTitle.cx = 0
	TitleBar.szTitle.cy = 0
	return
end if

maxWidth = _layoutWidth - 8
if #Arrow then
	maxWidth -=  ARROWSIZE + 2
end if
if TitleBar.ImageIndex > 0 then
	maxWidth -= theme.#PanelIconSize.cx + 2
end if

dtparam = Painter.DT_EXPANDTABS + Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
calcRect.right = maxWidth

Painter.of_CalcTextSize(Font,#Title,dtparam,ref calcRect)

TitleBar.szTitle.cx = calcRect.right
TitleBar.szTitle.cy = calcRect.bottom

if TitleBar.szTitle.cx > maxWidth then
	TitleBar.szTitle.cx = maxWidth
end if
end subroutine

private subroutine _of_drawtitle (readonly unsignedlong hdc);ulong textColor
ulong dtparam

textColor	= theme.of_GetPanelColor(this,theme.CLR_TITLE,of_GetTitleBarState())

dtparam = Painter.DT_EXPANDTABS + Painter.DT_WORDBREAK + Painter.DT_HIDEPREFIX + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
if #TitleAlign = Left! then
	dtparam += Painter.DT_LEFT
elseif #TitleAlign = Center! then
	dtparam += Painter.DT_CENTER
elseif #TitleAlign = Right! then
	dtparam += Painter.DT_RIGHT
end if

Painter.of_Drawtext(hdc,Font,#Title,TitleBar.rcTitle,textColor,dtparam)
end subroutine

public function boolean of_isenabled ();return #Enabled
end function

private subroutine _of_filltitlebar (readonly unsignedlong hdc);ulong bkColor,borderColor,nState
RADIUSF rdBorder

nState = of_GetTitleBarState()
bkColor = theme.of_GetPanelColor(this,theme.CLR_TITLEBARBKGND,nState)
borderColor = theme.of_GetPanelColor(this,theme.CLR_TITLEBARBORDER,nState)

if #Collapsed and _amStatus = AMS_NONE then
	rdBorder = theme.#PanelRoundSize
else
	rdBorder.leftTop = theme.#PanelRoundSize.leftTop
	rdBorder.rightTop = theme.#PanelRoundSize.rightTop
end if

Painter.ThemeFill( hdc, TitleBar.rcPaint, bkColor, Enums.VERT, theme.#TitleBarBkgndStyle,nState, false, theme.#PanelBorderStyle,borderColor,rdBorder)

end subroutine

private subroutine _of_drawarrow (readonly unsignedlong hdc);//Draw arrow
POINTF pt1,pt2,pt3
ulong arrowColor

arrowColor	= theme.of_GetPanelColor(this,theme.CLR_ARROW,of_GetTitleBarState())

if #Collapsed then
	choose case theme.#PanelArrowPosition
		case Enums.LEFT
			pt1.x = TitleBar.rcArrow.left
			pt1.y = TitleBar.rcArrow.top
			pt2.x = pt1.x
			pt2.y = pt1.y + ARROWSIZE
			pt3.x = pt1.x + ARROWSIZE / 2
			pt3.y = pt1.y + ARROWSIZE / 2
		case Enums.RIGHT
			pt1.x = TitleBar.rcArrow.right
			pt1.y = TitleBar.rcArrow.top
			pt2.x = pt1.x - ARROWSIZE / 2
			pt2.y = pt1.y + ARROWSIZE / 2
			pt3.x = pt1.x 
			pt3.y = pt1.y + ARROWSIZE
	end choose
else
	pt1.x = TitleBar.rcArrow.left
	pt1.y = TitleBar.rcArrow.top
	pt2.x = pt1.x + ARROWSIZE
	pt2.y = pt1.y
	pt3.x = pt1.x + ARROWSIZE / 2
	pt3.y = pt1.y + ARROWSIZE / 2
end if

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

private subroutine _of_capturemouse (readonly boolean capture);if _MouseCaptured = capture then return

_MouseCaptured = capture

if capture then
	Win32.SetCapture(#ParentTaskPanelBar.#Handle)
else
	Win32.ReleaseCapture()
end if
end subroutine

private subroutine _of_drawtitlebar (readonly unsignedlong hdc);if Not #TitleBar then return

_of_FillTitleBar(hdc)
if #Arrow then
	_of_DrawArrow(hdc)
end if
if TitleBar.ImageIndex > 0 then
	_PanelImageList.Draw(TitleBar.ImageIndex,hdc, TitleBar.rcImage.left,TitleBar.rcImage.top,Not of_IsEnabled())
end if
if TitleBar.szTitle.cx > 0 then
	_of_DrawTitle(hdc)
end if
end subroutine

private subroutine _of_drawtitlebar (readonly boolean fadeanimation);ulong safeDC

if of_IsLockUpdate() then return
if Not #TitleBar then return
if Not of_IsVisible() then return

safeDC = #ParentTaskPanelBar.of_GetSafeDC()

if safeDC > 0 then
	
	Painter.IntersectClipRect(safeDC,rcPaint)
	Painter.IntersectClipRect(safeDC,TitleBar.rcPaint)
	
	Event OnEraseBkgnd(safeDC)
	_of_DrawTitleBar(safeDC)
	
	Painter.SelectClipRgn(safeDC,0)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(TitleBar.rcPaint)
	
	#ParentTaskPanelBar.of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
end if
end subroutine

public function long of_finditembytag (readonly string tag, ref n_cst_taskpanelbar_baseitem founditem);int index
boolean bFound
n_cst_taskpanelbar_baseitem item

if Len(tag) = 0 then return RetCode.E_INVALID_ARGUMENT

for index = 1 to UpperBound(Items)
	if Items[index].#Tag = tag then
		item = Items[index]
		bFound = true
		exit
	end if
next

if bFound then
	try
		foundItem = item
	catch(Throwable ex)
		return RetCode.E_INVALID_ARGUMENT
	end try
	return iif(IsValidObject(foundItem),RetCode.OK,RetCode.E_INVALID_OBJECT)
else
	return RetCode.E_OBJECT_NOT_FOUND
end if
end function

public function long of_finditembytext (readonly string text, ref n_cst_taskpanelbar_baseitem founditem);int index
boolean bFound
n_cst_taskpanelbar_baseitem item
n_cst_taskpanelbar_button button
n_cst_taskpanelbar_radiobox radiobox
n_cst_taskpanelbar_checkbox checkbox
n_cst_taskpanelbar_label	label
n_cst_taskpanelbar_link		link

if Len(text) = 0 then return RetCode.E_INVALID_ARGUMENT

for index = 1 to UpperBound(Items)
	choose case Items[index].#Type
		case Items[index].ITT_BUTTON
			button = Items[index]
			if button.#Text = text then
				item = button
				bFound = true
				exit
			end if
		case Items[index].ITT_RADIOBOX
			radiobox = Items[index]
			if radiobox.#Text = text then
				item = radiobox
				bFound = true
				exit
			end if
		case Items[index].ITT_CHECKBOX
			checkbox = Items[index]
			if checkbox.#Text = text then
				item = checkbox
				bFound = true
				exit
			end if
		case Items[index].ITT_LABEL
			label = Items[index]
			if label.#Text = text then
				item = label
				bFound = true
				exit
			end if
		case Items[index].ITT_LINK
			link = Items[index]
			if link.#Text = text then
				item = link
				bFound = true
				exit
			end if
	end choose
next

if bFound then
	try
		foundItem = item
	catch(Throwable ex)
		return RetCode.E_INVALID_ARGUMENT
	end try
	return iif(IsValidObject(foundItem),RetCode.OK,RetCode.FAILED)
else
	return RetCode.E_OBJECT_NOT_FOUND
end if
end function

public function integer of_getcount ();return UpperBound(Items)
end function

public function integer of_getindex (readonly n_cst_taskpanelbar_baseitem item);int index

if Not IsValidObject(item) then return RetCode.E_INVALID_OBJECT

for index = 1 to UpperBound(Items)
	if Items[index] = item then return index
next

return 0
end function

public function long of_getitem (readonly integer index, ref n_cst_taskpanelbar_baseitem item);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

try
	item = Items[index]
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(item),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function unsignedlong of_getsafedc ();ulong safeDC
RECTF paintRect

if of_IsLockUpdate() then return 0
if Not of_IsVisible() then return 0
if #Collapsed then return 0

safeDC = #ParentTaskPanelBar.of_GetSafeDC()
if safeDC > 0 then
	paintRect = rcPaint
	_of_AdjustRect(ref paintRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_TITLEBAR)
	Painter.IntersectClipRect(safeDC,paintRect)
end if

return safeDC
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime);return #ParentTaskPanelBar.of_ReleaseDC(hdc,hrgn,FadeTime)
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation);return #ParentTaskPanelBar.of_ReleaseDC(hdc,hrgn,FadeAnimation)
end function

public function long of_updatepoints ();_needRecalcLayout = true

if of_IsLockUpdate() then return RetCode.FAILED
if Not of_IsVisible() then return RetCode.OK

_of_RecalcLayout()

#ParentTaskPanelBar.Event OnNotify(this,NCD_UPDATEPOINTS,0)

return RetCode.OK
end function

public function long of_setvisible (readonly boolean visible);if #Visible = visible then return RetCode.OK

#Visible = visible

#ParentTaskPanelBar.Event OnNotify(this,NCD_UPDATEPOINTS,0)

return RetCode.OK
end function

public function long of_setenabled (readonly boolean enabled);if #Enabled = enabled then return RetCode.OK

#Enabled = enabled

of_Redraw(true)

return RetCode.OK
end function

public function long of_settitle (readonly string title);boolean dirty
SIZEF oldSize

if #Title= Title then return RetCode.OK

oldSize = TitleBar.szTitle

#Title= Title
_of_UpdateTextSize()

if oldSize.cy <> TitleBar.szTitle.cy then
	dirty = true
end if

if dirty then
	of_UpdatePoints()
else
	_of_DrawTitleBar(false)
end if

return RetCode.OK
end function

public function long of_removeall ();int i
n_cst_taskpanelbar_baseitem	emptyItems[]

if UpperBound(Items) =  0 then return RetCode.OK

for i = 1 to UpperBound(Items)
	Destroy Items[i]
next

Items = emptyItems

_mouseOverIndex = 0
_mouseDownIndex = 0

of_UpdatePoints()

return RetCode.OK
end function

public function long of_settitlebar (readonly boolean show);if #TitleBar = show then return RetCode.OK
if Not show and #Collapsed then return RetCode.FAILED

#TitleBar = show

of_UpdatePoints()

return RetCode.OK
end function

public function long of_setarrow (readonly boolean show);if #Arrow = show then return RetCode.OK

#Arrow = show

if #TitleBar then
	of_UpdatePoints()
end if

return RetCode.OK
end function

public function long of_settitlealign (readonly alignment align);if #TitleAlign = align then return RetCode.OK

choose case align
	case Left!,Center!,Right!
		#TitleAlign = align
		if #TitleBar then
			_of_DrawTitleBar(false)
		end if
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function n_cst_taskpanelbar_link of_insertlink (readonly integer index, readonly string text, readonly string tiptext);int i
n_cst_taskpanelbar_link link
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return link

link = Create n_cst_taskpanelbar_link
link.Event OnInit(this,_ToolTip,_ItemImageList)

if Not link.Event OnInitData(text,tiptext) then
	Destroy link
	SetNull(link)
	return link
end if

layoutRect.right = _layoutWidth
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

link.Event OnUpdateLayout(layoutRect.right - layoutRect.left)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = link

of_UpdatePoints()

return link
end function

public function n_cst_taskpanelbar_link of_insertlink (readonly integer index, readonly string text);return of_InsertLink(index,text,"")
end function

public function n_cst_taskpanelbar_link of_addlink (readonly string text, readonly string tiptext);return of_InsertLink(UpperBound(Items)+1,text,tiptext)
end function

public function n_cst_taskpanelbar_link of_addlink (readonly string text);return of_AddLink(text,"")
end function

private subroutine _of_updatepoints ();if of_IsLockUpdate() then return

_layoutChanged = false

if #TitleBar then
	_of_UpdateTitleBarPoints()
end if

if Not #Collapsed then
	_of_UpdateItemPoints()
end if
end subroutine

public function n_cst_taskpanelbar_label of_insertlabel (readonly integer index, readonly string text);int i
n_cst_taskpanelbar_label label
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return label

label = Create n_cst_taskpanelbar_label
label.Event OnInit(this,_ToolTip,_ItemImageList)

if Not label.Event OnInitData(text) then
	Destroy label
	SetNull(label)
	return label
end if

layoutRect.right = _layoutWidth
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

label.Event OnUpdateLayout(layoutRect.right - layoutRect.left)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = label

of_UpdatePoints()

return label
end function

public function n_cst_taskpanelbar_label of_addlabel (readonly string text);return of_InsertLabel(UpperBound(Items)+1,text)
end function

public function n_cst_taskpanelbar_icon of_inserticon (readonly integer index, readonly string image, readonly unsignedinteger width, readonly unsignedinteger height);int i
n_cst_taskpanelbar_icon icon
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return icon

icon = Create n_cst_taskpanelbar_icon
icon.Event OnInit(this,_ToolTip,_ItemImageList)

if Not icon.Event OnInitData(image,width,height) then
	Destroy icon
	SetNull(icon)
	return icon
end if

layoutRect.right = _layoutWidth
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

icon.Event OnUpdateLayout(layoutRect.right - layoutRect.left)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = icon

of_UpdatePoints()

return icon
end function

public function n_cst_taskpanelbar_icon of_inserticon (readonly integer index, readonly string image);return of_InsertIcon(index,image,Enums.SMALL,Enums.SMALL)
end function

public function n_cst_taskpanelbar_icon of_addicon (readonly string image, readonly unsignedinteger width, readonly unsignedinteger height);return of_InsertIcon(UpperBound(Items)+1,image,width,height)
end function

public function n_cst_taskpanelbar_icon of_addicon (readonly string image);return of_AddIcon(image,Enums.SMALL,Enums.SMALL)
end function

public function n_cst_taskpanelbar_space of_addspace ();return of_AddSpace(0,0)
end function

public function n_cst_taskpanelbar_separator of_addseparator ();return of_InsertSeparator(UpperBound(Items)+1)
end function

public function n_cst_taskpanelbar_checkbox of_insertcheckbox (readonly integer index, readonly string text, readonly boolean checked);return of_InsertCheckBox(index,text,checked,"")
end function

public function n_cst_taskpanelbar_checkbox of_addcheckbox (readonly string text, readonly boolean checked, readonly string tiptext);return of_InsertCheckBox(UpperBound(Items)+1,text,checked,tiptext)
end function

public function n_cst_taskpanelbar_checkbox of_addcheckbox (readonly string text, readonly boolean checked);return of_AddCheckBox(text,checked,"")
end function

public function n_cst_taskpanelbar_checkbox of_insertcheckbox (readonly integer index, readonly string text, readonly boolean checked, readonly string tiptext);int i
n_cst_taskpanelbar_checkbox checkbox
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return checkbox

checkbox = Create n_cst_taskpanelbar_checkbox
checkbox.Event OnInit(this,_ToolTip,_ItemImageList)

if Not checkbox.Event OnInitData(text,checked,tiptext) then
	Destroy checkbox
	SetNull(checkbox)
	return checkbox
end if

layoutRect.right = _layoutWidth
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

checkbox.Event OnUpdateLayout(layoutRect.right - layoutRect.left)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = checkbox

of_UpdatePoints()

return checkbox
end function

public function n_cst_taskpanelbar_radiobox of_insertradiobox (readonly integer index, readonly string text, readonly boolean checked, readonly string tiptext);int i
n_cst_taskpanelbar_radiobox radiobox
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return radiobox

radiobox = Create n_cst_taskpanelbar_radiobox
radiobox.Event OnInit(this,_ToolTip,_ItemImageList)

if Not radiobox.Event OnInitData(text,checked,tiptext) then
	Destroy radiobox
	SetNull(radiobox)
	return radiobox
end if

layoutRect.right = _layoutWidth
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

radiobox.Event OnUpdateLayout(layoutRect.right - layoutRect.left)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = radiobox

of_UpdatePoints()

return radiobox
end function

public function n_cst_taskpanelbar_radiobox of_insertradiobox (readonly integer index, readonly string text, readonly boolean checked);return of_InsertRadioBox(index,text,checked,"")
end function

public function n_cst_taskpanelbar_radiobox of_addradiobox (readonly string text, readonly boolean checked, readonly string tiptext);return of_InsertRadioBox(UpperBound(Items)+1,text,checked,tiptext)
end function

public function n_cst_taskpanelbar_radiobox of_addradiobox (readonly string text, readonly boolean checked);return of_AddRadioBox(text,checked,"")
end function

public function n_cst_taskpanelbar_button of_insertbutton (readonly integer index, readonly string text, readonly string image, readonly string tiptext);int i
n_cst_taskpanelbar_button button
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return button
if Len(text) = 0 and  Len(Trim(image)) = 0 then return button

button = Create n_cst_taskpanelbar_button
button.Event OnInit(this,_ToolTip,_ItemImageList)

if Not button.Event OnInitData(text,Image,tiptext) then
	Destroy button
	SetNull(button)
	return button
end if

layoutRect.right = _layoutWidth
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

button.Event OnUpdateLayout(layoutRect.right - layoutRect.left)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = button

of_UpdatePoints()

return button
end function

public function n_cst_taskpanelbar_button of_insertbutton (readonly integer index, readonly string text, readonly string image);return of_InsertButton(index,text,image,"")
end function

public function n_cst_taskpanelbar_button of_addbutton (readonly string text, readonly string image, readonly string tiptext);return of_InsertButton(UpperBound(Items)+1,text,image,tiptext)
end function

public function n_cst_taskpanelbar_button of_addbutton (readonly string text, readonly string image);return of_AddButton(text,image,"")
end function

private subroutine _of_recalclayout ();int index
real xpos,ypos,rowPos
RECTF layoutRect
SIZEF itemSize

_needRecalcLayout = true

if of_IsLockUpdate() then return
if _layoutWidth <=0 then return

_layoutHeights[DPM_COLLAPSED] = 0
_layoutHeights[DPM_EXPANDED] = 0

if #TitleBar then
	_layoutHeights[DPM_COLLAPSED] = _of_GetTitleBarHeight()
end if

layoutRect.right = _layoutWidth
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

xpos = layoutRect.left
ypos = layoutRect.top
rowPos = ypos

for index = 1 to UpperBound(Items)
	if Not Items[index].#Visible then continue
	if Items[index].#Type = Items[index].ITT_BREAK then
		xpos = layoutRect.left
		ypos = rowPos + _ItemMargin.y
	else
		Items[index].Event OnMeasureItem(ref itemSize)
		if itemSize.cx = 0 and itemSize.cy = 0 then continue
		if xpos <> layoutRect.left and xpos + itemSize.cx > layoutRect.right then
			xpos = layoutRect.left
			ypos = rowPos + _ItemMargin.y
		end if
		if rowPos < ypos + itemSize.cy then
			rowPos = ypos + itemSize.cy
		end if
		xpos = xpos + itemSize.cx + _ItemMargin.x
	end if
next

_layoutHeights[DPM_EXPANDED] = #BorderMargin.top + (rowPos - layoutRect.top) + #BorderMargin.bottom
if #TitleBar then
	_layoutHeights[DPM_EXPANDED] += _layoutHeights[DPM_COLLAPSED]
	if theme.#PanelBorderStyle <> Enums.BS_NONE then
		_layoutHeights[DPM_EXPANDED] += 1
	end if
else
	if theme.#PanelBorderStyle <> Enums.BS_NONE then
		_layoutHeights[DPM_EXPANDED] += 2
	end if
end if

_layoutChanged = true
_needRecalcLayout = false
end subroutine

public function long of_setitemmargin (readonly unsignedinteger xmargin, readonly unsignedinteger ymargin);if _ItemMargin.x = XMargin and _ItemMargin.y = YMargin then return RetCode.OK

_ItemMargin.x = XMargin 
_ItemMargin.y = YMargin

of_UpdatePoints()

return RetCode.OK
end function

public function long of_getitemmargin (ref unsignedinteger xmargin, ref unsignedinteger ymargin);XMargin = _ItemMargin.x
YMargin = _ItemMargin.y
return RetCode.OK
end function

public function long of_checkradios (readonly integer beginindex, readonly integer endindex, readonly integer checkindex, readonly boolean checked, readonly boolean triggerevent);int index
boolean rt
n_cst_taskpanelbar_radiobox radiobox

if beginIndex < 1 or beginIndex > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if endIndex < 1 or endIndex > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if beginIndex > endIndex then return RetCode.E_INVALID_ARGUMENT
if checkIndex < beginIndex or checkIndex > endIndex then return RetCode.E_OUT_OF_RANGE

for index = beginIndex to endIndex
	if Items[index].#Type <> Items[index].ITT_RADIOBOX then continue
	radiobox = Items[index]
	if index = checkIndex then
		rt = IsSucceeded(radiobox.of_SetChecked(checked,triggerevent))
	else
		radiobox.of_SetChecked(false)
	end if
next

return iif(rt,RetCode.OK,RetCode.FAILED)
end function

public function long of_checkradios (readonly integer beginindex, readonly integer endindex, readonly integer checkindex, readonly boolean checked);return of_CheckRadios(beginIndex,endIndex,checkIndex,checked,false)
end function

private subroutine _of_updatetitlebarpoints ();real ll_left,ll_right
RECTF layoutRect

if Not #TitleBar then return

TitleBar.rcPaint = rcPaint
TitleBar.rcPaint.bottom = TitleBar.rcPaint.top + _of_GetTitleBarHeight()

layoutRect = TitleBar.rcPaint
_of_AdjustRect(ref layoutRect,ADJ_BORDER)
		
ll_left = layoutRect.left + 4
ll_right = layoutRect.right - 4

if #Arrow then
	choose case theme.#PanelArrowPosition
		case Enums.LEFT
			TitleBar.rcArrow.left 			= ll_left
			TitleBar.rcArrow.right 		= TitleBar.rcArrow.left + ARROWSIZE
			ll_left = TitleBar.rcArrow.right + 4
		case Enums.RIGHT
			TitleBar.rcArrow.left 			= ll_right - ARROWSIZE
			TitleBar.rcArrow.right 		= TitleBar.rcArrow.left + ARROWSIZE
			ll_right = TitleBar.rcArrow.left - 4
	end choose
	if #Collapsed then
		TitleBar.rcArrow.top 		= layoutRect.top + (layoutRect.bottom - layoutRect.top - ARROWSIZE) / 2
		TitleBar.rcArrow.bottom 	= TitleBar.rcArrow.top + ARROWSIZE
	else
		TitleBar.rcArrow.top 		= layoutRect.top + (layoutRect.bottom - layoutRect.top - ARROWSIZE / 2) / 2
		TitleBar.rcArrow.bottom 	= TitleBar.rcArrow.top + ARROWSIZE / 2
	end if
end if
if TitleBar.ImageIndex > 0 then
	choose case theme.#PanelIconPosition
		case Enums.LEFT
			TitleBar.rcImage.left 		= ll_left
			TitleBar.rcImage.right 	= TitleBar.rcImage.left + theme.#PanelIconSize.cx
			ll_left = TitleBar.rcImage.right + 4
		case Enums.RIGHT
			TitleBar.rcImage.left 		= ll_right - theme.#PanelIconSize.cx
			TitleBar.rcImage.right 	= TitleBar.rcImage.left + theme.#PanelIconSize.cx
			ll_right = TitleBar.rcImage.left - 4
	end choose
	TitleBar.rcImage.top 		= layoutRect.top + (layoutRect.bottom - layoutRect.top - theme.#PanelIconSize.cy) / 2
	TitleBar.rcImage.bottom = TitleBar.rcImage.top + theme.#PanelIconSize.cy
end if
if TitleBar.szTitle.cx > 0 then
	TitleBar.rcTitle.left 		= ll_left
	TitleBar.rcTitle.right 		= ll_right
	TitleBar.rcTitle.top 		= layoutRect.top + (layoutRect.bottom - layoutRect.top - TitleBar.szTitle.cy) / 2
	TitleBar.rcTitle.bottom 	= TitleBar.rcTitle.top + TitleBar.szTitle.cy
end if
end subroutine

private subroutine _of_updateitempoints ();int index
real xpos,ypos,rowPos
SIZEF itemSize
RECTF layoutRect,newItemRect

if of_IsLockUpdate() then return
if #Collapsed then return

layoutRect = rcPaint
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_TITLEBAR)

xpos = layoutRect.left
ypos = layoutRect.top
rowPos = ypos

for index = 1 to UpperBound(Items)
	if Not Items[index].#Visible then continue
	if Items[index].#Type = Items[index].ITT_BREAK then
		xpos = layoutRect.left
		ypos = rowPos + _ItemMargin.y
	else
		Items[index].Event OnMeasureItem(ref itemSize)
		if itemSize.cx = 0 and itemSize.cy = 0 then
			newItemRect.left = xpos
			newItemRect.top = ypos
			Items[index].Event OnReposition(ref newItemRect)
			continue
		end if
		if xpos <> layoutRect.left and xpos + itemSize.cx > layoutRect.right then
			xpos = layoutRect.left
			ypos = rowPos + _ItemMargin.y
		end if
		newItemRect.left = xpos
		newItemRect.top = ypos
		Items[index].Event OnReposition(ref newItemRect)
		if rowPos < newItemRect.bottom then
			rowPos = newItemRect.bottom
		end if
		xpos = newItemRect.right + _ItemMargin.x
	end if
next
end subroutine

public function n_cst_taskpanelbar_toolbar of_inserttoolbar (readonly integer index);int i
n_cst_taskpanelbar_toolbar toolbar
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return toolbar

toolbar = Create n_cst_taskpanelbar_toolbar
toolbar.Event OnInit(this,_ToolTip,_ItemImageList)

layoutRect.right = _layoutWidth
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

toolbar.Event OnUpdateLayout(layoutRect.right - layoutRect.left)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = toolbar

of_UpdatePoints()

return toolbar
end function

public function n_cst_taskpanelbar_toolbar of_addtoolbar ();return of_InsertToolBar(UpperBound(Items)+1)
end function

public function boolean of_islockupdate ();if #LockUpdate then return true

return #ParentTaskPanelBar.#LockUpdate
end function

public function n_cst_taskpanelbar_button of_addsplitbutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext);return of_InsertSplitButton(UpperBound(Items) + 1,clsName,text,image,tipText)
end function

public function n_cst_taskpanelbar_button of_addsplitbutton (readonly string clsname, readonly string text, readonly string image);return of_AddSplitButton(clsName,text,image,"")
end function

public function n_cst_taskpanelbar_button of_addmenubutton (readonly string clsname, readonly string text, readonly string image, readonly string tiptext);return of_InsertMenuButton(UpperBound(Items) + 1,clsName,text,image,tipText)
end function

public function n_cst_taskpanelbar_button of_addmenubutton (readonly string clsname, readonly string text, readonly string image);return of_AddMenuButton(clsName,text,image,"")
end function

public function n_cst_taskpanelbar_button of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext);return of_InsertSplitButton(UpperBound(Items)+1,popupmenu,text,image,tiptext)
end function

public function n_cst_taskpanelbar_button of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image);return of_AddSplitButton(popupmenu,text,image,"")
end function

public function n_cst_taskpanelbar_button of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext);return of_InsertMenuButton(UpperBound(Items)+1,popupmenu,text,image,tiptext)
end function

public function n_cst_taskpanelbar_button of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image);return of_AddMenuButton(popupmenu,text,image,"")
end function

public function n_cst_taskpanelbar_button of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext);n_cst_taskpanelbar_button button

button = of_InsertButton(index,text,image,tipText)

if IsValidObject(button) then
	button.of_SetStyle(Enums.BTS_SPLIT)
	if IsFailed(button.of_SetPopupMenu(clsName)) then
		of_Remove(of_GetIndex(button))
		SetNull(button)
	end if
end if
	
return button
end function

public function n_cst_taskpanelbar_button of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string image);return of_InsertSplitButton(index,clsName,text,image,"")
end function

public function n_cst_taskpanelbar_button of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image, readonly string tiptext);n_cst_taskpanelbar_button button

button = of_InsertButton(index,text,image,tipText)

if IsValidObject(button) then
	button.of_SetStyle(Enums.BTS_DROPDOWN)
	if IsFailed(button.of_SetPopupMenu(clsName)) then
		of_Remove(of_GetIndex(button))
		SetNull(button)
	end if
end if
	
return button
end function

public function n_cst_taskpanelbar_button of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string image);return of_InsertMenuButton(index,clsName,text,image,"")
end function

public function n_cst_taskpanelbar_button of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext);n_cst_taskpanelbar_button button

button = of_InsertButton(index,text,image,tipText)

if IsValidObject(button) then
	button.of_SetStyle(Enums.BTS_SPLIT)
	if IsFailed(button.of_SetPopupMenu(popupMenu)) then
		of_Remove(of_GetIndex(button))
		SetNull(button)
	end if
end if
	
return button
end function

public function n_cst_taskpanelbar_button of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image);return of_InsertSplitButton(index,popupmenu,text,image,"")
end function

public function n_cst_taskpanelbar_button of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext);n_cst_taskpanelbar_button button

button = of_InsertButton(index,text,image,tipText)

if IsValidObject(button) then
	button.of_SetStyle(Enums.BTS_DROPDOWN)
	if IsFailed(button.of_SetPopupMenu(popupMenu)) then
		of_Remove(of_GetIndex(button))
		SetNull(button)
	end if
end if
	
return button
end function

public function n_cst_taskpanelbar_button of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image);return of_InsertMenuButton(index,popupmenu,text,image,"")
end function

public function n_cst_taskpanelbar_space of_insertspace (readonly integer index);return of_InsertSpace(index,0,0)
end function

public function n_cst_taskpanelbar_separator of_insertseparator (readonly integer index);int i
n_cst_taskpanelbar_separator separator
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return separator

separator = Create n_cst_taskpanelbar_separator
separator.Event OnInit(this,_ToolTip,_ItemImageList)

layoutRect.right = _layoutWidth
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

separator.Event OnUpdateLayout(layoutRect.right - layoutRect.left)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = separator

of_UpdatePoints()

return separator
end function

public function long of_setimage (readonly string image);int newIndex
boolean dirty

if #Image= image then return RetCode.OK

newIndex = _PanelImageList.AddImage(theme.of_GetPanelIcon(this,image,0))

if (TitleBar.ImageIndex > 0) <> (newIndex > 0) then
	dirty = true
end if

#Image = image
TitleBar.ImageIndex = newIndex

if #TitleBar then
	if dirty then
		of_UpdatePoints()
	else
		_of_DrawTitleBar(true)
	end if
end if

return RetCode.OK
end function

public function long of_remove (readonly integer index);int i
boolean bVisible
n_cst_taskpanelbar_baseitem	newItems[]

if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

if index = _mouseOverIndex then
	_mouseOverIndex = 0
end if
if index = _mouseDownIndex then
	_mouseDownIndex = 0
end if
	
bVisible = Items[index].#Visible

Destroy Items[index]

for i = 1 to UpperBound(Items)
	if i = index then continue
	newItems[UpperBound(newItems) + 1] = Items[i]
next

Items = newItems
	
if UpperBound(Items) = 0 then
	_mouseOverIndex = 0
	_mouseDownIndex = 0
end if

if bVisible then
	of_UpdatePoints()
end if

return RetCode.OK
end function

public function n_cst_taskpanelbar_break of_insertbreak (readonly integer index);int i
n_cst_taskpanelbar_break break

if index < 1 or index > UpperBound(Items) + 1 then return break

break = Create n_cst_taskpanelbar_break
break.Event OnInit(this,_ToolTip,_ItemImageList)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = break

of_UpdatePoints()

return break
end function

public function n_cst_taskpanelbar_break of_addbreak ();return of_InsertBreak(UpperBound(Items)+1)
end function

public function n_cst_taskpanelbar_radiobox of_insertradiobox (readonly integer index, readonly string text);return of_InsertRadioBox(index,text,false,"")
end function

public function n_cst_taskpanelbar_checkbox of_insertcheckbox (readonly integer index, readonly string text);return of_InsertCheckBox(index,text,false,"")
end function

public function n_cst_taskpanelbar_radiobox of_addradiobox (readonly string text);return of_AddRadioBox(text,false,"")
end function

public function n_cst_taskpanelbar_checkbox of_addcheckbox (readonly string text);return of_AddCheckBox(text,false,"")
end function

public function long of_setcollapsed (readonly boolean collapsed, readonly boolean triggerevent);int index
n_cst_taskpanelbar_panel panel

if #Collapsed = collapsed then return RetCode.OK
if collapsed and Not #TitleBar then return RetCode.FAILED

if triggerEvent then
	if collapsed then
		if IsPrevented(#ParentTaskPanelBar.Event OnPanelCollapsing(this)) then return RetCode.FAILED
	else
		if IsPrevented(#ParentTaskPanelBar.Event OnPanelExpanding(this)) then return RetCode.FAILED
	end if
end if

#Collapsed = collapsed

if #ParentTaskPanelBar.#Animation then
	if #Collapsed then
		_amOffsetSize = rcPaint.bottom - rcPaint.top - _layoutHeights[DPM_EXPANDED]
		_amStatus = AMS_COLLAPSING
	else
		_amOffsetSize = rcPaint.bottom - rcPaint.top - _layoutHeights[DPM_COLLAPSED]
		_amStatus = AMS_EXPANDING
	end if
	Timer.Start(TM_ANIMATION,TMI_ANIMATION)
end if

of_UpdatePoints()

if triggerEvent then
	if collapsed then
		#ParentTaskPanelBar.Event OnPanelCollapsed(this)
	else
		#ParentTaskPanelBar.Event OnPanelExpanded(this)
	end if
end if

return RetCode.OK
end function

public function long of_setcollapsed (readonly boolean collapsed);return of_SetCollapsed(collapsed,false)
end function

public function unsignedlong of_getstate ();ulong nState

if _MouseOver then nState += Enums.STATE_HOVER
if #Collapsed then
	nState += Enums.STATE_COLLAPSED
else
	nState += Enums.STATE_EXPANDED
end if
if Not of_IsEnabled() then nState += Enums.STATE_DISABLED

return nState
end function

public function unsignedlong of_gettitlebarstate ();ulong nState

if TitleBar.MouseOver then nState += Enums.STATE_HOVER
if TitleBar.MouseDown then nState += Enums.STATE_PRESSED
if Not of_IsEnabled() then nState += Enums.STATE_DISABLED

return nState
end function

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if BitAND(flags,ADJ_BORDER) > 0 then
	if theme.#PanelBorderStyle <> Enums.BS_NONE then
		fBorderSize = P2DX(1)
		Painter.InflateRect(ref adjRect,-fBorderSize,-fBorderSize)
	end if
end if

if BitAND(flags,ADJ_BORDERMARGIN) > 0 then
	adjRect.left += #BorderMargin.left
	adjRect.top += #BorderMargin.top
	adjRect.right -= #BorderMargin.right
	adjRect.bottom -= #BorderMargin.bottom
end if

if BitAND(flags,ADJ_TITLEBAR) > 0 and #TitleBar then
	adjRect.top += _of_GetTitleBarHeight()
	if BitAND(flags,ADJ_BORDER) > 0 then
		if theme.#PanelBorderStyle <> Enums.BS_NONE then
			adjRect.top -= 1
		end if
	end if
end if
end subroutine

public function long of_getpaintrect (ref rectf paintrect);paintrect = rcPaint
return RetCode.OK
end function

public function integer of_indexfrompoint (readonly real xpos, readonly real ypos);int index

if Not of_IsVisible() or Not of_IsEnabled() then return 0
if Not Painter.PtInRect(rcPaint,xpos,ypos) then return 0

if #TitleBar and #TitleBarClickable then
	if Painter.PtInRect(TitleBar.rcPaint,xpos,ypos) then
		return IDX_TITLEBAR
	end if
end if

if _amStatus <> AMS_NONE then return 0

if Not #Collapsed then
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
end if

return 0
end function

public function long of_setbordermargin (readonly real left, readonly real top, readonly real right, readonly real bottom);if left < 0 or top < 0 or right < 0 or bottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #BorderMargin.left = left and #BorderMargin.top = top and #BorderMargin.right = right and #BorderMargin.bottom = bottom then return RetCode.OK

#BorderMargin.left = left
#BorderMargin.top = top
#BorderMargin.right = right
#BorderMargin.bottom = bottom

_of_UpdateItemLayouts()
of_UpdatePoints()

return RetCode.OK
end function

public function n_cst_taskpanelbar_space of_addspace (readonly real width, readonly real height);return of_InsertSpace(UpperBound(Items)+1,width,height)
end function

public function n_cst_taskpanelbar_space of_insertspace (readonly integer index, readonly real width, readonly real height);int i
n_cst_taskpanelbar_space space
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return space

space = Create n_cst_taskpanelbar_space
space.Event OnInit(this,_ToolTip,_ItemImageList)

if Not space.Event OnInitData(width,height) then
	Destroy space
	SetNull(space)
	return space
end if

layoutRect.right = _layoutWidth
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN)

space.Event OnUpdateLayout(layoutRect.right - layoutRect.left)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = space

of_UpdatePoints()

return space
end function

private function real _of_gettitlebarheight ();real nHeight

if Not #TitleBar  then return 0

if #Arrow then
	nHeight = 4 + ARROWSIZE + 4
end if

if nHeight < 4 + TitleBar.szTitle.cy + 4 then
	nHeight = 4 + TitleBar.szTitle.cy + 4
end if
if TitleBar.ImageIndex > 0 and  nHeight < 4 + theme.#PanelIconSize.cy + 4 then
	nHeight = 4 + theme.#PanelIconSize.cy + 4
end if

if theme.#PanelBorderStyle <> Enums.BS_NONE then
	nHeight += 2
end if

return nHeight
end function

public function long of_findcheckedradio (readonly integer beginindex, readonly integer endindex, ref n_cst_taskpanelbar_radiobox founditem);int index
n_cst_taskpanelbar_radiobox radiobox

if beginIndex < 1 or beginIndex > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if endIndex < 1 or endIndex > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND
if beginIndex > endIndex then return RetCode.E_INVALID_ARGUMENT

for index = beginIndex to endIndex
	if Items[index].#Type <> Items[index].ITT_RADIOBOX then continue
	radiobox = Items[index]
	if radiobox.#Checked then
		foundItem = radiobox
		return RetCode.OK
	end if
next

return RetCode.E_OBJECT_NOT_FOUND
end function

public function long of_findcheckedradio (ref n_cst_taskpanelbar_radiobox founditem);return of_FindCheckedRadio(1,UpperBound(Items),ref foundItem)
end function

public function long of_checkradios (readonly integer checkindex, readonly boolean checked, readonly boolean triggerevent);return of_CheckRadios(1,UpperBound(Items),checkIndex,checked,triggerEvent)
end function

public function long of_checkradios (readonly integer checkindex, readonly boolean checked);return of_CheckRadios(1,UpperBound(Items),checkIndex,checked,false)
end function

on n_cst_taskpanelbar_panel.create
call super::create
this.timer=create timer
this.font=create font
TriggerEvent( this, "constructor" )
end on

on n_cst_taskpanelbar_panel.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.timer)
destroy(this.font)
end on

event constructor;_ItemMargin.x = 2
_ItemMargin.y = 2

#BorderMargin.left = 2
#BorderMargin.top = 2
#BorderMargin.right = 2
#BorderMargin.bottom = 2

_layoutHeights[DPM_COLLAPSED] = 0
_layoutHeights[DPM_EXPANDED] = 0
end event

event destructor;int index

for index = 1 to UpperBound(Items)
	Destroy Items[index]
next
end event

type timer from n_timer within n_cst_taskpanelbar_panel descriptor "pb_nvo" = "true" 
end type

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

event ontimer;call super::ontimer;return Parent.Event OnTimer(id)
end event

type font from n_cst_font within n_cst_taskpanelbar_panel descriptor "pb_nvo" = "true" 
end type

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent._of_UpdateTextSize()
Parent._of_UpdateItemLayouts()
Parent.of_UpdatePoints()
end event

