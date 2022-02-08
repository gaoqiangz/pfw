$PBExportHeader$n_cst_ribbonbar_panel.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_ribbonbar_panel from nonvisualobject
end type
type margin from structure within n_cst_ribbonbar_panel
end type
type font from n_cst_font within n_cst_ribbonbar_panel
end type
end forward

type margin from structure
	real		x
	real		y
end type

shared variables
n_imagelist __LaunchImageList
Ulong 			__RefCount = 0
end variables

global type n_cst_ribbonbar_panel from nonvisualobject
event oncapturechanged ( )
event type long onerasebkgnd ( unsignedlong hdc )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event onmouseleave ( )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event type long onreposition ( unsignedinteger displaymode,  ref rectf newrect )
event type long onpaint ( unsignedlong hdc )
event type long onscroll ( real scrollsize )
event type long onhittest ( real xpos,  real ypos )
event type long onnotify ( n_cst_ribbonbar_baseitem childitem,  long notifycode,  long command )
event type boolean ontimer ( unsignedinteger id )
event onthemechanged ( unsignedinteger eventflag )
event type long onmousehover ( unsignedlong vkey,  real xpos,  real ypos )
event type long onmeasureitem ( unsignedinteger displaymode,  ref sizef itemsize )
event type long onupdatelayout ( real layoutheight )
event type long onpresetdisplaymode ( unsignedinteger displaymode )
event oninit ( n_cst_ribbonbar_category parentcategory,  n_tooltip tooltip,  n_imagelist panelimagelist,  n_imagelist smallimagelist,  n_imagelist largeimagelist )
event type boolean oninitdata ( string caption,  string image,  string tiptext )
event type unsignedinteger ongetpresetdisplaymode ( )
event type long oninitpopup ( ref real xpos,  ref real ypos,  ref real width,  ref real height )
event type long onuninitpopup ( unsignedlong exitcode,  boolean force )
event type long onpopup ( boolean popup )
event type long onrbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onrbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
font font
end type
global n_cst_ribbonbar_panel n_cst_ribbonbar_panel

type prototypes

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

/*--- Constants ---*/
Public:
//Indexes
Constant Int IDX_LAUNCHBTN 	= -1
//Display mode
Constant Uint DPM_LARGE				= 1
Constant Uint DPM_INTERMEDIATE	= 2
Constant Uint DPM_COMPACT			= 3
Constant Uint DPM_COLLAPSED			= 4

/*--- Properties ---*/
Public:
PrivateWrite u_cst_ribbonbar				#ParentRibbonBar
PrivateWrite n_cst_ribbonbar_category	#ParentCategory
PrivateWrite	Boolean							#Visible					= true
PrivateWrite	Boolean							#Enabled				= true
Any												#Data
String												#Tag
PrivateWrite String 							#Caption
PrivateWrite String 							#Image
PrivateWrite	Boolean							#LaunchButton
String 											#TipText
String 											#LaunchTipText
Long												#TipTime
PrivateWrite	Boolean							#AlwaysItemMode
PrivateWrite	Boolean							#Collapsed
PrivateWrite Long								#IntermediateScaleOrder
PrivateWrite Long								#CompactScaleOrder
PrivateWrite Long								#CollapsedScaleOrder
PrivateWrite	RECTF								#BorderMargin
Boolean											#LockUpdate

/*--- Implementation ---*/
Private:
n_cst_ribbonbar_theme			theme
n_cst_ribbonbar_popuppanel 	_PopupPanel
n_imagelist							_PanelImageList
n_imagelist							_SmallImageList
n_imagelist							_LargeImageList
n_tooltip								_ToolTip
n_cst_ribbonbar_baseitem		Items[]
PAINTPANE							LaunchBtn
RECTF									rcPaint
RECTF									rcCaption
RECTF									rcImage
SIZEF									szCaption
SIZEF									szCollapsedCaption

MARGIN _ItemMargins[]

Ulong _TTID

Int		_mouseOverIndex			= 0
Int		_mouseDownIndex		= 0
Int		_rightMouseDownIndex	= 0
Ulong	_lastPopupTime			= 0
real	_layoutHeight
real	_layoutWidths[]

Int		   _ImageIndex			= 0
Uint	   _DisplayMode		= DPM_LARGE
Uint	   _PresetDisplayMode= 0
Boolean _layoutChanged		= false
Boolean _needRecalcLayout	= false

Boolean _MouseOver			= false
Boolean _MouseDown			= false
Boolean _MouseCaptured 	= false

//Notify code
Constant Long	NCD_UPDATEPOINTS			= 1
Constant Long	NCD_LAYOUTCHANGED		= 2
Constant Long	NCD_UPDATESCALEORDER 	= 3	//command:Display mode
Constant Long	NCD_SETCAPTURE			= 4	//command:1,setcapture;0,releasecapture
Constant Long	NCD_SETFOCUS				= 5	//command:1,setfocus;0,releasefocus
Constant Long	NCD_CUSTOM					= 6
//Hit-test code
Constant Long	HTNOWHERE	= 0
Constant Long	HTVALID			= 1
//Icons
Constant String ICO_LAUNCH	= "pfw://zip/images[LaunchIcon.png]"
//Adjust flags
Constant Uint ADJ_BORDER 				= 1
Constant Uint ADJ_BORDERMARGIN 	= 2
Constant Uint ADJ_CAPTION			 	= 4
//Sizes
Constant real LAUNCHICONSIZE		= 8		//px
Constant real ARROWSIZE				= 6		//px
end variables

forward prototypes
private subroutine _of_updatetextsize ()
private subroutine _of_drawcaption (readonly unsignedlong hdc)
private subroutine _of_capturemouse (readonly boolean capture)
private subroutine _of_drawlaunchbutton (readonly unsignedlong hdc)
public function unsignedlong of_getsafedc ()
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation)
private subroutine _of_drawicon (readonly unsignedlong hdc)
private subroutine _of_recalclayout ()
public function n_cst_ribbonbar_separator of_addseparator ()
private subroutine _of_drawarrow (readonly unsignedlong hdc)
private subroutine _of_showtip (readonly boolean show)
public function n_cst_ribbonbar_label of_addlabel (readonly string text)
public function n_cst_ribbonbar_label of_insertlabel (readonly integer index, readonly string text)
public function n_cst_ribbonbar_link of_addlink (readonly string text, readonly string tiptext)
public function n_cst_ribbonbar_link of_addlink (readonly string text)
public function n_cst_ribbonbar_link of_insertlink (readonly integer index, readonly string text, readonly string tiptext)
public function n_cst_ribbonbar_link of_insertlink (readonly integer index, readonly string text)
public function boolean of_iscompactmode ()
public function boolean of_isintermediatemode ()
public function boolean of_islargemode ()
public function integer of_getindex (readonly n_cst_ribbonbar_baseitem item)
public function n_cst_ribbonbar_button of_addbutton (readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext)
public function n_cst_ribbonbar_button of_addbutton (readonly string text, readonly string smallimage, readonly string largeimage)
public function n_cst_ribbonbar_button of_insertbutton (readonly integer index, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext)
public function n_cst_ribbonbar_button of_insertbutton (readonly integer index, readonly string text, readonly string smallimage, readonly string largeimage)
public function n_cst_ribbonbar_checkbox of_addcheckbox (readonly string text, readonly boolean checked, readonly string tiptext)
public function n_cst_ribbonbar_checkbox of_addcheckbox (readonly string text, readonly boolean checked)
public function n_cst_ribbonbar_checkbox of_insertcheckbox (readonly integer index, readonly string text, readonly boolean checked, readonly string tiptext)
public function n_cst_ribbonbar_checkbox of_insertcheckbox (readonly integer index, readonly string text, readonly boolean checked)
public function n_cst_ribbonbar_radiobox of_addradiobox (readonly string text, readonly boolean checked, readonly string tiptext)
public function n_cst_ribbonbar_radiobox of_addradiobox (readonly string text, readonly boolean checked)
public function n_cst_ribbonbar_radiobox of_insertradiobox (readonly integer index, readonly string text, readonly boolean checked, readonly string tiptext)
public function n_cst_ribbonbar_radiobox of_insertradiobox (readonly integer index, readonly string text, readonly boolean checked)
private subroutine _of_fillbkgnd (readonly unsignedlong hdc)
private subroutine _of_repositems (readonly integer displaymode)
public function boolean of_ispopupmode ()
public function unsignedlong of_gethandle ()
public function integer of_getcount ()
public function n_cst_ribbonbar_toolbar of_inserttoolbar (readonly integer index)
public function n_cst_ribbonbar_toolbar of_addtoolbar ()
private subroutine _of_drawicon (readonly boolean fadeanimation)
private subroutine _of_drawlaunchbutton (readonly boolean fadeanimation)
private subroutine _of_drawcaption (readonly boolean fadeanimation)
private subroutine _of_showlaunchtip (readonly boolean show)
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime)
public function boolean of_isenabled ()
public function boolean of_isvisible ()
public function n_cst_ribbonbar_icon of_inserticon (readonly integer index, readonly string image)
public function n_cst_ribbonbar_icon of_addicon (readonly string image)
public function n_cst_ribbonbar_icon of_addicon (readonly string image, readonly unsignedinteger width, readonly unsignedinteger height)
public function boolean of_iscollapsedmode ()
public function n_cst_ribbonbar_icon of_inserticon (readonly integer index, readonly string image, readonly unsignedinteger width, readonly unsignedinteger height)
public function n_cst_ribbonbar_space of_insertspace (readonly integer index)
public function n_cst_ribbonbar_space of_addspace ()
public function long of_checkradios (readonly integer beginindex, readonly integer endindex, readonly integer checkindex, readonly boolean checked, readonly boolean triggerevent)
public function long of_checkradios (readonly integer beginindex, readonly integer endindex, readonly integer checkindex, readonly boolean checked)
public function long of_finditembytag (readonly string tag, ref n_cst_ribbonbar_baseitem founditem)
public function long of_finditembytext (readonly string text, ref n_cst_ribbonbar_baseitem founditem)
public function long of_getitem (readonly integer index, ref n_cst_ribbonbar_baseitem item)
public function long of_remove (readonly integer index)
public function long of_removeall ()
public function long of_setalwaysitemmode (readonly boolean always)
public function long of_setcaption (readonly string caption)
public function long of_setenabled (readonly boolean enabled)
public function long of_setimage (readonly string image)
public function long of_setlaunchbutton (readonly boolean show)
public function long of_setvisible (readonly boolean visible)
public function long of_updatepoints ()
public function long of_redraw (readonly boolean fadeanimation)
public function long of_exitpopupmode (readonly unsignedlong exitcode, readonly boolean exitall)
public function long of_exitpopupmode (readonly unsignedlong exitcode)
private subroutine _of_updateitemlayouts ()
public function n_cst_ribbonbar_separator of_insertseparator (readonly integer index)
public function boolean of_islockupdate ()
public function n_cst_ribbonbar_button of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext)
public function n_cst_ribbonbar_button of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage)
public function n_cst_ribbonbar_button of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext)
public function n_cst_ribbonbar_button of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage)
public function n_cst_ribbonbar_button of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext)
public function n_cst_ribbonbar_button of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage)
public function n_cst_ribbonbar_button of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext)
public function n_cst_ribbonbar_button of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage)
public function n_cst_ribbonbar_button of_addmenubutton (readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext)
public function n_cst_ribbonbar_button of_addmenubutton (readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage)
public function n_cst_ribbonbar_button of_addsplitbutton (readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext)
public function n_cst_ribbonbar_button of_addsplitbutton (readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage)
public function n_cst_ribbonbar_button of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext)
public function n_cst_ribbonbar_button of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage)
public function n_cst_ribbonbar_button of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext)
public function n_cst_ribbonbar_button of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage)
public function n_cst_ribbonbar_break of_insertbreak (readonly integer index)
public function n_cst_ribbonbar_break of_addbreak ()
public function n_cst_ribbonbar_checkbox of_insertcheckbox (readonly integer index, readonly string text)
public function n_cst_ribbonbar_checkbox of_addcheckbox (readonly string text)
public function n_cst_ribbonbar_radiobox of_addradiobox (readonly string text)
public function n_cst_ribbonbar_radiobox of_insertradiobox (readonly integer index, readonly string text)
public function unsignedinteger of_getdisplaymode ()
public function long of_setcollapsedscaleorder (readonly long scaleorder)
public function long of_setcompactscaleorder (readonly long scaleorder)
public function long of_setintermediatescaleorder (readonly long scaleorder)
public function unsignedlong of_getstate ()
public function unsignedlong of_getlaunchbuttonstate ()
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
public function long of_getpaintrect (ref rectf paintrect)
public function long of_getcompactitemmargin (ref real xmargin, ref real ymargin)
public function long of_getintermediatemargin (ref real xmargin, ref real ymargin)
public function long of_getlargeitemmargin (ref real xmargin, ref real ymargin)
public function long of_setcompactitemmargin (readonly real xmargin, readonly real ymargin)
public function long of_setintermediateitemmargin (readonly real xmargin, readonly real ymargin)
public function long of_setlargeitemmargin (readonly real xmargin, readonly real ymargin)
private function unsignedlong _of_popuppanel (readonly real xpos, readonly real ypos)
public function n_cst_ribbonbar_space of_addspace (readonly real width, readonly real height)
public function n_cst_ribbonbar_space of_insertspace (readonly integer index, readonly real width, readonly real height)
public function long of_setbordermargin (readonly real left, readonly real top, readonly real right, readonly real bottom)
public function integer of_indexfrompoint (readonly real xpos, readonly real ypos)
public function long of_setscaleorder (readonly long scaleorder)
public function long of_setitemmargin (readonly real xmargin, readonly real ymargin)
public function long of_checkradios (readonly integer checkindex, readonly boolean checked)
public function long of_checkradios (readonly integer checkindex, readonly boolean checked, readonly boolean triggerevent)
public function long of_findcheckedradio (readonly integer beginindex, readonly integer endindex, ref n_cst_ribbonbar_radiobox founditem)
public function long of_findcheckedradio (ref n_cst_ribbonbar_radiobox founditem)
public function long of_setcollapsed (readonly boolean collapsed)
end prototypes

event oncapturechanged();if _MouseCaptured then
	_of_CaptureMouse(false)
	if LaunchBtn.MouseDown then
		LaunchBtn.MouseDown = false
		_of_DrawLaunchButton(true)
		#ParentRibbonBar.Event OnLaunchButtonMouseUp(this,0,0)
	end if
	Event OnMouseLeave()
elseif _mouseDownIndex > 0 then
	Items[_mouseDownIndex].Event OnCaptureChanged()
	_mouseDownIndex = 0
elseif _rightMouseDownIndex > 0 then
	Items[_rightMouseDownIndex].Event OnCaptureChanged()
	_rightMouseDownIndex = 0
end if
end event

event type long onerasebkgnd(unsignedlong hdc);if of_IsPopupMode() then
	_PopupPanel.Event OnEraseBkgnd(hdc)
else
	#ParentCategory.Event OnEraseBkgnd(hdc)
	_of_FillBkgnd(hdc)
end if
return 0
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);if LaunchBtn.MouseOver then
	Event OnLButtonDown(vKey,xpos,ypos)
elseif _mouseOverIndex > 0 then
	_mouseDownIndex = _mouseOverIndex
	Items[_mouseDownIndex].Event OnLButtonDBLClk(vkey,xpos,ypos)
end if

return 0
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);if  _DisplayMode = DPM_COLLAPSED then
	if Cpu() - _lastPopupTime < 100 then
		return 0
	end if
	_of_ShowTip(false)
	_MouseDown = true
	of_Redraw(false)
	_of_PopupPanel(xpos,ypos)
	_MouseDown = false
	of_Redraw(true)
elseif LaunchBtn.MouseOver then
	_of_ShowLaunchTip(false)
	LaunchBtn.MouseDown = true
	_of_DrawLaunchButton(false)
	_of_CaptureMouse(true)
	#ParentRibbonBar.Event OnLaunchButtonMouseDown(this,xpos,ypos)
elseif _mouseOverIndex > 0 then
	_mouseDownIndex = _mouseOverIndex
	Items[_mouseDownIndex].Event OnLButtonDown(vkey,xpos,ypos)
end if

return 0
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if _MouseCaptured then
	_of_CaptureMouse(false)
	if LaunchBtn.MouseDown then
		LaunchBtn.MouseDown = false
		_of_DrawLaunchButton(true)
		#ParentRibbonBar.Event OnLaunchButtonMouseUp(this,xpos,ypos)
		if LaunchBtn.MouseOver then
			if IsAllowed(#ParentRibbonBar.Event OnLaunchButtonClicking(this)) then
				of_ExitPopupMode(0,true)
				#ParentRibbonBar.Post Event OnLaunchButtonClicked(this)
			end if
		end if
	end if
elseif _mouseDownIndex > 0 then
	Items[_mouseDownIndex].Event OnLButtonUp(vkey,xpos,ypos)
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
	
	if LaunchBtn.MouseOver then
		LaunchBtn.MouseOver = false
		#ParentRibbonBar.Event OnLaunchButtonMouseLeave(this)
	end if
	
	of_Redraw(true)
end if

_of_ShowTip(false)
_of_ShowLaunchTip(false)
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);int index

if Not _MouseOver then
	_MouseOver = true
	of_Redraw(true)
	if _DisplayMode = DPM_COLLAPSED then
		_of_ShowTip(true)
	end if
end if

if _DisplayMode <> DPM_COLLAPSED then
	
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
	
	if index = IDX_LAUNCHBTN then
		if Not LaunchBtn.MouseOver then
			LaunchBtn.MouseOver = true
			_of_DrawLaunchButton(true)
			_of_ShowLaunchTip(true)
			#ParentRibbonBar.Event OnLaunchButtonMouseEnter(this,xpos,ypos)
		else
			#ParentRibbonBar.Event OnLaunchButtonMouseMove(this,xpos,ypos)
		end if
	else
		if LaunchBtn.MouseOver then
			LaunchBtn.MouseOver = false
			_of_DrawLaunchButton(true)
			_of_ShowLaunchTip(false)
			#ParentRibbonBar.Event OnLaunchButtonMouseLeave(this)
		end if
	end if
	
end if

return 0
end event

event type long onreposition(unsignedinteger displaymode, ref rectf newrect);//由父控件调用
//参数:newRect.left,newRect.top为Panel的新座标
//返回值:newRect.right为Panel右边界
//*Panel的下边界由_layoutHeight确定,由OnUpdateLayout事件更新

if _needRecalcLayout then
	_of_RecalcLayout()
end if

_PresetDisplayMode = 0	//重置预先设置的Display mode

if _DisplayMode = displayMode and newRect.left = rcPaint.left and newRect.top = rcPaint.top and Not _layoutChanged then
	newRect.right = rcPaint.right
	return 1
end if

_layoutChanged = false
_DisplayMode = displayMode

rcPaint = newRect
rcPaint.right = rcPaint.left + _layoutWidths[_DisplayMode]
rcPaint.bottom = rcPaint.top + _layoutHeight

if of_IsLockUpdate() then
	//返回Panel右边界
	newRect.right = rcPaint.right
	return 1
end if

rcCaption = rcPaint

if _DisplayMode = DPM_COLLAPSED then
	if _ImageIndex > 0 then
		rcImage.left = rcPaint.left + (rcPaint.right - rcPaint.left - theme.#PanelIconSize.cx - 4) / 2
		rcImage.top = rcPaint.top + 4
		rcImage.right = rcImage.left + 2 + theme.#PanelIconSize.cx + 2
		rcImage.bottom = rcImage.top + 2 + theme.#PanelIconSize.cy + 2
		if theme.#RibbonStyle = theme.RBS_OFFICE2007 then
			rcImage.bottom += 10
		end if
		rcCaption.top = rcImage.bottom + 2
		rcCaption.bottom = rcCaption.top + szCollapsedCaption.cy
		if rcCaption.bottom > rcPaint.bottom - 2 - ARROWSIZE / 2 - 4 then
			rcCaption.bottom = rcPaint.bottom - 2
			rcCaption.left = rcPaint.left + 2
			rcCaption.right = rcCaption.left + szCollapsedCaption.cx + 2
		end if
	else
		rcCaption.top = rcPaint.top + 4
		rcCaption.bottom = rcCaption.top + szCollapsedCaption.cy
		if rcCaption.bottom > rcPaint.bottom - 4 - ARROWSIZE / 2 - 4 then
			rcCaption.bottom = rcPaint.bottom - 2
			rcCaption.left = rcPaint.left + 2
			rcCaption.right = rcCaption.left + szCollapsedCaption.cx + 2
		end if
	end if
else
	if szCaption.cx > 0 then
		rcCaption.top = rcCaption.bottom - szCaption.cy - 4 - 1
	end if
	
	if #LaunchButton then
		if szCaption.cx = 0 then
			rcCaption.top = rcCaption.bottom - LAUNCHICONSIZE - 4 - 2
		end if
		RECTF adjustedRect
		adjustedRect = rcPaint
		_of_AdjustRect(ref adjustedRect,ADJ_BORDER)
		LaunchBtn.rcPaint.Left = adjustedRect.right - LAUNCHICONSIZE - 4 - 2
		LaunchBtn.rcPaint.Top = rcCaption.bottom - LAUNCHICONSIZE - 4 - 2
		LaunchBtn.rcPaint.Bottom = LaunchBtn.rcPaint.Top + LAUNCHICONSIZE + 4
		LaunchBtn.rcPaint.Right = LaunchBtn.rcPaint.Left + LAUNCHICONSIZE + 4
	end if
	_of_ReposItems(_DisplayMode)
end if

//返回Panel右边界
newRect.right = rcPaint.right
return 0
end event

event type long onpaint(unsignedlong hdc);int index
ulong dcState
RECTF paintRect

if of_IsLockUpdate() then return 1
if Not of_IsVisible() then return 1

_of_FillBkgnd(hdc)

if _DisplayMode = DPM_COLLAPSED then
	_of_DrawIcon(hdc)
	if szCollapsedCaption.cx > 0 then
		_of_DrawCaption(hdc)
	end if
	_of_DrawArrow(hdc)
else
	if szCaption.cx > 0 then
		_of_DrawCaption(hdc)
	end if
	if #LaunchButton then
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
end if

return 1
end event

event type long onscroll(real scrollsize);int index

if scrollSize = 0 then return 1

Painter.OffsetRect(ref rcPaint,scrollSize,0)
if szCaption.cx > 0 then
	Painter.OffsetRect(ref rcCaption,scrollSize,0)
end if
if _DisplayMode = DPM_COLLAPSED then
	Painter.OffsetRect(ref rcImage,scrollSize,0)
else
	if #LaunchButton then
		Painter.OffsetRect(ref LaunchBtn.rcPaint,scrollSize,0)
	end if
	for index = 1 to UpperBound(Items)
		if Items[index].#Type = Items[index].ITT_BREAK then continue
		if Not Items[index].#Visible then continue
		Items[index].Event OnScroll(scrollSize)
	next
end if

if _PopupPanel.IsPopupMode() then
	_PopupPanel.of_Scroll(scrollSize)
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

event type long onnotify(n_cst_ribbonbar_baseitem childitem, long notifycode, long command);//来自子控件的消息
choose case notifyCode
	case NCD_UPDATEPOINTS
		of_UpdatePoints()
	case NCD_LAYOUTCHANGED
		_needRecalcLayout = true
		#ParentCategory.Event OnNotify(this,NCD_LAYOUTCHANGED,0)
end choose

return 0
end event

event onthemechanged(unsignedinteger eventflag);int index
boolean layoutChanged,dirty,itemEvent

choose case eventFlag
	case theme.EVT_THEME
		_of_UpdateTextSize()
		dirty = true
		layoutChanged = true
		itemEvent = true
	case theme.EVT_RIBBONSTYLE
		dirty = true
		layoutChanged = true
		itemEvent = true
	case theme.EVT_PANELICONSIZE
		dirty = true
	case theme.EVT_SMALLICONSIZE
		dirty = true
		itemEvent = true
	case theme.EVT_LARGEICONSIZE
		dirty = true
		layoutChanged = true
		itemEvent = true
	case theme.EVT_PANELBORDERSTYLE
		layoutChanged = true
		dirty = true
	case theme.EVT_ITEMBORDERSTYLE
		itemEvent = true
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

if of_IsPopupMode() then
	_PopupPanel.Event OnThemeChanged(eventFlag)
end if

if dirty then
	if Not layoutChanged then
		_of_RecalcLayout()
	end if
end if
end event

event type long onmeasureitem(unsignedinteger displaymode, ref sizef itemsize);//计算Panel指定Display mode的尺寸
if _needRecalcLayout then
	_of_RecalcLayout()
end if

if UpperBound(_layoutWidths) = 0 then return 0

itemSize.cx = _layoutWidths[displayMode]
itemSize.cy = _layoutHeight

return 0
end event

event type long onupdatelayout(real layoutheight);real minHeight

minHeight = #BorderMargin.top + theme.#SmallIconSize.cy + LAUNCHICONSIZE + 4 + #BorderMargin.bottom
if layoutHeight < minHeight then
	layoutHeight = minHeight
end if

if _layoutHeight = layoutHeight then return 0

_layoutHeight = layoutHeight

_of_UpdateItemLayouts()

return 0
end event

event type long onpresetdisplaymode(Uint displaymode);//用于Scale order算法，预先设置Display mode

_PresetDisplayMode = displayMode

return 0
end event

event oninit(n_cst_ribbonbar_category parentcategory, n_tooltip tooltip, n_imagelist panelimagelist, n_imagelist smallimagelist, n_imagelist largeimagelist);#ParentCategory 	= parentcategory
#ParentRibbonBar = #ParentCategory.#ParentRibbonBar
theme				= #ParentRibbonBar.theme

_ToolTip = tooltip
_TTID = _ToolTip.AddTool(#ParentRibbonBar.#Handle,false,Win32.TTF_TRANSPARENT + Win32.TTF_TRACK + Win32.TTF_ABSOLUTE)

_PanelImageList = panelImageList
_SmallImageList = smallimagelist
_LargeImageList = largeimagelist

_PopupPanel.Event OnInit(this,__LaunchImageList,_ToolTip,_TTID)
end event

event type boolean oninitdata(string caption, string image, string tiptext);#Image = image
_ImageIndex = _PanelImageList.AddImage(image)

#Caption= caption
#TipText = tiptext
_of_UpdateTextSize()

if _ImageIndex = 0 and szCollapsedCaption.cx = 0 then return false

return true
end event

event type Uint ongetpresetdisplaymode();return _PresetDisplayMode
end event

event type long onrbuttondown(unsignedlong vkey, real xpos, real ypos);if _mouseOverIndex > 0 then
	_rightMouseDownIndex = _mouseOverIndex
	Items[_rightMouseDownIndex].Event OnRButtonDown(vkey,xpos,ypos)
	return 0
end if

#ParentRibbonBar.Event OnPanelRButtonDown(this,xpos,ypos)

return 0
end event

event type long onrbuttonup(unsignedlong vkey, real xpos, real ypos);if _rightMouseDownIndex > 0 then
	Items[_rightMouseDownIndex].Event OnRButtonUp(vkey,xpos,ypos)
	_rightMouseDownIndex = 0
	return 0
end if

#ParentRibbonBar.Event OnPanelRButtonUp(this,xpos,ypos)

return 0
end event

private subroutine _of_updatetextsize ();ulong dtparam
RECTF calcRect

if Len(#Caption) = 0 then
	szCaption.cx = 0
	szCaption.cy = 0
	szCollapsedCaption = szCaption
	return
end if

dtparam = Painter.DT_EXPANDTABS + Painter.DT_SINGLELINE

Painter.of_CalcTextSize(Font,#Caption,dtparam,ref calcRect)

szCaption.cx = calcRect.right
szCaption.cy = calcRect.bottom

//Calc icon mode caption size
dtparam = Painter.DT_EXPANDTABS + Painter.DT_WORDBREAK
calcRect.right = theme.#LargeIconSize.cx + 10

if theme.#RibbonStyle = theme.RBS_OFFICE2007 then
	calcRect.right += 2
elseif theme.#RibbonStyle = theme.RBS_OFFICE2010 then
	calcRect.right += 3
end if

Painter.of_CalcTextSize(Font,#Caption,dtparam,ref calcRect)

szCollapsedCaption.cx = calcRect.right
szCollapsedCaption.cy = calcRect.bottom
end subroutine

private subroutine _of_drawcaption (readonly unsignedlong hdc);ulong textColor
ulong dtparam
RECTF rcTitle

textColor	= theme.of_GetPanelColor(this,theme.CLR_TEXT,of_GetState())

dtparam = Painter.DT_EXPANDTABS + Painter.DT_HIDEPREFIX
if _DisplayMode = DPM_COLLAPSED then
	dtparam += Painter.DT_WORDBREAK
else
	dtparam += Painter.DT_SINGLELINE + Painter.DT_VCENTER + Painter.DT_WORD_ELLIPSIS
end if
dtparam += Painter.DT_CENTER

if _DisplayMode <> DPM_COLLAPSED and #LaunchButton then
	rcTitle = rcCaption
	rcTitle.right -= LAUNCHICONSIZE + 4 + 2
	Painter.of_Drawtext(hdc,Font,#Caption,rcTitle,textColor,dtparam)
else
	Painter.of_Drawtext(hdc,Font,#Caption,rcCaption,textColor,dtparam)
end if
end subroutine

private subroutine _of_capturemouse (readonly boolean capture);if _MouseCaptured = capture then return

_MouseCaptured = capture

if Not of_IsPopupMode() and Not #ParentCategory.of_IsPopupMode() then
	if capture then
		Win32.SetCapture(#ParentCategory.of_GetHandle())
	else
		Win32.ReleaseCapture()
	end if
end if
end subroutine

private subroutine _of_drawlaunchbutton (readonly unsignedlong hdc);ulong borderColor,bkColor,nState

if Not #LaunchButton then return

nState = of_GetLaunchButtonState()
bkColor	= theme.of_GetPanelColor(this,theme.CLR_LAUNCHBTNBKGND,nState)
borderColor	= theme.of_GetPanelColor(this,theme.CLR_LAUNCHBTNBORDER,nState)

//Fill background
if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
	Painter.ThemeFill(hdc,LaunchBtn.rcPaint,bkColor,Enums.VERT,theme.#ItemBkgndStyle,nState,false,&
											theme.#ItemBorderStyle,borderColor,theme.#ItemRoundSize)
end if

//Draw launch icon
if LaunchBtn.MouseDown then
	__LaunchImageList.Draw(1,hdc,LaunchBtn.rcPaint.Left + 2 ,LaunchBtn.rcPaint.Top + 2 + 1,Not of_IsEnabled())
else
	__LaunchImageList.Draw(1,hdc,LaunchBtn.rcPaint.Left + 2 ,LaunchBtn.rcPaint.Top +2,Not of_IsEnabled())
end if
end subroutine

public function unsignedlong of_getsafedc ();ulong safeDC
RECTF paintRect

if of_IsLockUpdate() then return 0
if Not of_IsVisible() then return 0

if of_IsPopupMode() then
	safeDC = _PopupPanel.GetSafeDC()
elseif _DisplayMode <> DPM_COLLAPSED then
	safeDC = #ParentCategory.of_GetSafeDC()
	if safeDC > 0 then
		paintRect = rcPaint
		_of_AdjustRect(ref paintRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)
		Painter.IntersectClipRect(safeDC,paintRect)
	end if
end if

return safeDC
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation);if of_IsPopupMode() then
	return _PopupPanel.of_ReleaseDC(hdc,hrgn,FadeAnimation)
else
	return #ParentCategory.of_ReleaseDC(hdc,hrgn,FadeAnimation)
end if
end function

private subroutine _of_drawicon (readonly unsignedlong hdc);ulong bkColor,borderColor,nState
RADIUSF rdBorder,rdHalfBorder
RECTF paintRect

if _ImageIndex = 0 then return

nState = of_GetState()
bkColor = theme.of_GetPanelColor(this,theme.CLR_BKGND,nState)
borderColor = theme.of_GetPanelColor(this,theme.CLR_BORDER,nState)

if theme.#PanelBorderStyle = Enums.BS_ROUND then
	rdBorder.leftTop = 2
	rdBorder.rightTop = 2
	rdBorder.leftBottom = 2
	rdBorder.rightBottom = 2
end if
	
if theme.#RibbonStyle = theme.RBS_OFFICE2007 then
	rdHalfBorder.leftTop = rdBorder.leftTop
	rdHalfBorder.rightTop = rdBorder.rightTop
	paintRect = rcImage
	paintRect.bottom = rcImage.bottom - 10
	
	Painter.ThemeFill( hdc, paintRect, bkColor, Enums.VERT, theme.#PanelBkgndStyle,nState, false, theme.#PanelBorderStyle,0,rdHalfBorder)
	
	bkColor = theme.of_GetPanelColor(this,theme.CLR_CAPTIONBKGND,nState)
	
	rdHalfBorder.leftTop = 0
	rdHalfBorder.rightTop = 0
	rdHalfBorder.leftBottom = rdBorder.leftBottom
	rdHalfBorder.rightBottom = rdBorder.rightBottom
	paintRect = rcImage
	paintRect.top = rcImage.bottom - 10
	
	Painter.ThemeFill( hdc, paintRect, bkColor, Enums.VERT, Enums.SOLID,nState, false, theme.#PanelBorderStyle,bkColor,rdHalfBorder)
	Painter.DrawThemeBorder( hdc, rcImage, borderColor,theme.#PanelBkgndStyle, theme.#PanelBorderStyle,rdBorder)
	_PanelImageList.Draw(_ImageIndex,hdc,&
									rcImage.left + 2,&
									rcImage.top + 2,&
									Not of_IsEnabled())
elseif theme.#RibbonStyle = theme.RBS_OFFICE2010 then
	if theme.#PanelBorderStyle = Enums.BS_ROUND then
		Painter.of_FillRoundRect(hdc,rcImage,bkColor,true,borderColor,rdBorder)
	else
		Painter.of_FillRect(hdc,rcImage,bkColor,true,borderColor)
	end if
	_PanelImageList.Draw(_ImageIndex,hdc,&
									rcImage.left + 2,&
									rcImage.top + 2,&
									Not of_IsEnabled())
end if
end subroutine

private subroutine _of_recalclayout ();int index,displayMode
real xpos,ypos,colPos
real minWidth
RECTF layoutRect
SIZEF itemSize

_needRecalcLayout = true

if of_IsLockUpdate() then return
if _layoutHeight <=0 then return

layoutRect.bottom = _layoutHeight

_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)

minWidth = szCaption.cx + 6
if #LaunchButton then
	minWidth += LAUNCHICONSIZE + 4 + 2
end if

for displayMode = DPM_LARGE to DPM_COMPACT
	//折叠模式下只需为Popup计算DPM_LARGE布局
	if #Collapsed then
		if displayMode > DPM_LARGE then exit
	end if
	xpos = layoutRect.left
	ypos = layoutRect.top
	colPos = xpos
	for index = 1 to UpperBound(Items)
		if Not Items[index].#Visible then continue
		if Items[index].#Type = Items[index].ITT_BREAK then
			xpos = colPos + _ItemMargins[displayMode].x
			ypos = layoutRect.top
		else
			if Items[index].#AlwaysLargeMode and Items[index].of_HasLargeMode() then
				Items[index].Event OnMeasureItem(DPM_LARGE,ref itemSize)
			elseif displayMode = DPM_LARGE then
				if Items[index].of_HasLargeMode() then
					Items[index].Event OnMeasureItem(DPM_LARGE,ref itemSize)
				elseif Items[index].of_HasIntermediateMode() then
					Items[index].Event OnMeasureItem(DPM_INTERMEDIATE,ref itemSize)
				else
					Items[index].Event OnMeasureItem(DPM_COMPACT,ref itemSize)
				end if
			elseif displayMode = DPM_INTERMEDIATE then
				if Items[index].of_HasIntermediateMode() then
					Items[index].Event OnMeasureItem(DPM_INTERMEDIATE,ref itemSize)
				elseif Items[index].of_HasLargeMode() then
					Items[index].Event OnMeasureItem(DPM_LARGE,ref itemSize)
				else
					Items[index].Event OnMeasureItem(DPM_COMPACT,ref itemSize)
				end if
			else
				if Items[index].of_HasCompactMode() then
					Items[index].Event OnMeasureItem(DPM_COMPACT,ref itemSize)
				elseif Items[index].of_HasIntermediateMode() then
					Items[index].Event OnMeasureItem(DPM_INTERMEDIATE,ref itemSize)
				else
					Items[index].Event OnMeasureItem(DPM_LARGE,ref itemSize)
				end if
			end if
			if itemSize.cx = 0 and itemSize.cy = 0 then continue
			if ypos <> layoutRect.top and ypos + itemSize.cy > layoutRect.bottom then
				xpos = colPos + _ItemMargins[displayMode].x
				ypos = layoutRect.top
			end if
			if colPos < xpos + itemSize.cx then
				colPos = xpos + itemSize.cx
			end if
			ypos = ypos + itemSize.cy + _ItemMargins[displayMode].y
		end if
	next
	
	_layoutWidths[displayMode] = #BorderMargin.left + (colPos - layoutRect.left) + #BorderMargin.right
	if _layoutWidths[displayMode] < minWidth then
		_layoutWidths[displayMode] = minWidth
	end if
	if theme.#PanelBorderStyle <> Enums.BS_NONE then
		if theme.#RibbonStyle = theme.RBS_OFFICE2007 then
			_layoutWidths[displayMode] += 2
		elseif theme.#RibbonStyle = theme.RBS_OFFICE2010 then
			_layoutWidths[displayMode] += 3
		end if
	end if
next

//Calc DPM_COLLAPSED mode
if #AlwaysItemMode and Not #Collapsed then
	_layoutWidths[DPM_COLLAPSED] = _layoutWidths[DPM_COMPACT]
else
	if _ImageIndex > 0 then
		_layoutWidths[DPM_COLLAPSED] = theme.#PanelIconSize.cx + 10
		if  _layoutWidths[DPM_COLLAPSED] < szCollapsedCaption.cx + 4 then
			_layoutWidths[DPM_COLLAPSED] = szCollapsedCaption.cx + 4
		end if
		if szCollapsedCaption.cx > 0 then
			if theme.#RibbonStyle = theme.RBS_OFFICE2007 then
				if _layoutHeight < 4 + theme.#PanelIconSize.cy + 4 + 10 + szCollapsedCaption.cy + 4 + ARROWSIZE / 2 + 4 then
					_layoutWidths[DPM_COLLAPSED] += ARROWSIZE + 4
				end if
			else
				if _layoutHeight < 4 + theme.#PanelIconSize.cy + 4 + szCollapsedCaption.cy + 4 + ARROWSIZE / 2 + 4 then
					_layoutWidths[DPM_COLLAPSED] += ARROWSIZE + 4
				end if
			end if
		end if
	else
		_layoutWidths[DPM_COLLAPSED] = szCollapsedCaption.cx + 4
		if _layoutHeight < 4 + szCollapsedCaption.cy + 4 + ARROWSIZE / 2 + 4 then
			_layoutWidths[DPM_COLLAPSED] += ARROWSIZE + 4
		end if
	end if
	if theme.#PanelBorderStyle <> Enums.BS_NONE then
		if theme.#RibbonStyle = theme.RBS_OFFICE2007 then
			_layoutWidths[DPM_COLLAPSED] += 2
		elseif theme.#RibbonStyle = theme.RBS_OFFICE2010 then
			_layoutWidths[DPM_COLLAPSED] += 3
		end if
	end if
end if

_layoutChanged = true
_needRecalcLayout = false
end subroutine

public function n_cst_ribbonbar_separator of_addseparator ();return of_InsertSeparator(UpperBound(Items)+1)
end function

private subroutine _of_drawarrow (readonly unsignedlong hdc);//Draw arrow
POINTF pt1,pt2,pt3
ulong arrowColor

arrowColor	= theme.of_GetPanelColor(this,theme.CLR_ARROW,of_GetState())

if rcPaint.bottom - rcCaption.bottom < ARROWSIZE / 2 + 4 and szCollapsedCaption.cx > 0 then
	pt1.x = rcCaption.right + 2
	pt1.y = rcCaption.top + (szCollapsedCaption.cy - ARROWSIZE / 2)/2
	if pt1.y > rcPaint.bottom - ARROWSIZE then
		pt1.y = rcPaint.bottom - ARROWSIZE
	end if
else
	pt1.x = rcCaption.left + (rcCaption.right - rcCaption.left - ARROWSIZE)/2
	pt1.y = rcCaption.bottom + 2
end if

pt2.x = pt1.x + ARROWSIZE
pt2.y = pt1.y
pt3.x = pt1.x + ARROWSIZE / 2
pt3.y = pt1.y + ARROWSIZE / 2

Painter.FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
end subroutine

private subroutine _of_showtip (readonly boolean show);RECTF scRect
POINTF pt
SIZEF toolSize

if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _MouseCaptured then return

if #ParentRibbonBar.#ToolTip and _DisplayMode = DPM_COLLAPSED and Show then
	if #TipText <> "" then
		Painter.GetScreenRect(ref scRect)
		Painter.GetCursorPos(ref pt)
		_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,false)
		_ToolTip.UpdateTipText(#ParentRibbonBar.#Handle,_TTID,#TipText)
		_ToolTip.GetBubbleSize(#ParentRibbonBar.#Handle,_TTID,ref toolSize.cx,ref toolSize.cy)
		if pt.x + toolSize.cx  > scRect.right then
			_ToolTip.TrackPosition( 0,scRect.right -  toolSize.cx,pt.y + 16)
		else
			_ToolTip.TrackPosition( 0,pt.x,pt.y + 16)
		end if
		if #TipTime > 0 then
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,#TipTime)
		else
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,-1)
		end if
		_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,true)
	else
		_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,false)	
	end if
else
	_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,false)
end if
end subroutine

public function n_cst_ribbonbar_label of_addlabel (readonly string text);return of_InsertLabel(UpperBound(Items)+1,text)
end function

public function n_cst_ribbonbar_label of_insertlabel (readonly integer index, readonly string text);int i
n_cst_ribbonbar_label label
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return label

label = Create n_cst_ribbonbar_label
label.Event OnInit(this,_ToolTip,_SmallImageList,_LargeImageList)

if Not label.Event OnInitData(text) then
	Destroy label
	SetNull(label)
	return label
end if

layoutRect.bottom = _layoutHeight
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)

label.Event OnUpdateLayout(layoutRect.bottom - layoutRect.top)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = label

of_UpdatePoints()

return label
end function

public function n_cst_ribbonbar_link of_addlink (readonly string text, readonly string tiptext);return of_InsertLink(UpperBound(Items)+1,text,tiptext)
end function

public function n_cst_ribbonbar_link of_addlink (readonly string text);return of_AddLink(text,"")
end function

public function n_cst_ribbonbar_link of_insertlink (readonly integer index, readonly string text, readonly string tiptext);int i
n_cst_ribbonbar_link link
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return link

link = Create n_cst_ribbonbar_link
link.Event OnInit(this,_ToolTip,_SmallImageList,_LargeImageList)

if Not link.Event OnInitData(text,tiptext) then
	Destroy link
	SetNull(link)
	return link
end if

layoutRect.bottom = _layoutHeight
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)

link.Event OnUpdateLayout(layoutRect.bottom - layoutRect.top)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = link

of_UpdatePoints()

return link
end function

public function n_cst_ribbonbar_link of_insertlink (readonly integer index, readonly string text);return of_InsertLink(index,text,"")
end function

public function boolean of_iscompactmode ();return (_DisplayMode = DPM_COMPACT)
end function

public function boolean of_isintermediatemode ();return (_DisplayMode = DPM_INTERMEDIATE)
end function

public function boolean of_islargemode ();return (_DisplayMode = DPM_LARGE)
end function

public function integer of_getindex (readonly n_cst_ribbonbar_baseitem item);int index

if Not IsValidObject(item) then return RetCode.E_INVALID_OBJECT

for index = 1 to UpperBound(Items)
	if Items[index] = item then return index
next

return 0
end function

public function n_cst_ribbonbar_button of_addbutton (readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext);return of_InsertButton(UpperBound(Items)+1,text,smallimage,largeimage,tiptext)
end function

public function n_cst_ribbonbar_button of_addbutton (readonly string text, readonly string smallimage, readonly string largeimage);return of_AddButton(text,smallImage,largeImage,"")
end function

public function n_cst_ribbonbar_button of_insertbutton (readonly integer index, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext);int i
n_cst_ribbonbar_button button
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return button
if Len(text) = 0 and  Len(Trim(smallImage)) = 0 and Len(Trim(largeImage)) = 0 then return button

button = Create n_cst_ribbonbar_button
button.Event OnInit(this,_ToolTip,_SmallImageList,_LargeImageList)

if Not button.Event OnInitData(text,smallImage,largeImage,tiptext) then
	Destroy button
	SetNull(button)
	return button
end if

layoutRect.bottom = _layoutHeight
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)

button.Event OnUpdateLayout(layoutRect.bottom - layoutRect.top)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = button

of_UpdatePoints()

return button
end function

public function n_cst_ribbonbar_button of_insertbutton (readonly integer index, readonly string text, readonly string smallimage, readonly string largeimage);return of_InsertButton(index,text,smallImage,largeImage,"")
end function

public function n_cst_ribbonbar_checkbox of_addcheckbox (readonly string text, readonly boolean checked, readonly string tiptext);return of_InsertCheckBox(UpperBound(Items)+1,text,checked,tiptext)
end function

public function n_cst_ribbonbar_checkbox of_addcheckbox (readonly string text, readonly boolean checked);return of_AddCheckBox(text,checked,"")
end function

public function n_cst_ribbonbar_checkbox of_insertcheckbox (readonly integer index, readonly string text, readonly boolean checked, readonly string tiptext);int i
n_cst_ribbonbar_checkbox checkbox
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return checkbox

checkbox = Create n_cst_ribbonbar_checkbox
checkbox.Event OnInit(this,_ToolTip,_SmallImageList,_LargeImageList)

if Not checkbox.Event OnInitData(text,checked,tiptext) then
	Destroy checkbox
	SetNull(checkbox)
	return checkbox
end if

layoutRect.bottom = _layoutHeight
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)

checkbox.Event OnUpdateLayout(layoutRect.bottom - layoutRect.top)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = checkbox

of_UpdatePoints()

return checkbox
end function

public function n_cst_ribbonbar_checkbox of_insertcheckbox (readonly integer index, readonly string text, readonly boolean checked);return of_InsertCheckBox(index,text,checked,"")
end function

public function n_cst_ribbonbar_radiobox of_addradiobox (readonly string text, readonly boolean checked, readonly string tiptext);return of_InsertRadioBox(UpperBound(Items)+1,text,checked,tiptext)
end function

public function n_cst_ribbonbar_radiobox of_addradiobox (readonly string text, readonly boolean checked);return of_AddRadioBox(text,checked,"")
end function

public function n_cst_ribbonbar_radiobox of_insertradiobox (readonly integer index, readonly string text, readonly boolean checked, readonly string tiptext);int i
n_cst_ribbonbar_radiobox radiobox
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return radiobox

radiobox = Create n_cst_ribbonbar_radiobox
radiobox.Event OnInit(this,_ToolTip,_SmallImageList,_LargeImageList)

if Not radiobox.Event OnInitData(text,checked,tiptext) then
	Destroy radiobox
	SetNull(radiobox)
	return radiobox
end if

layoutRect.bottom = _layoutHeight
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)

radiobox.Event OnUpdateLayout(layoutRect.bottom - layoutRect.top)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = radiobox

of_UpdatePoints()

return radiobox
end function

public function n_cst_ribbonbar_radiobox of_insertradiobox (readonly integer index, readonly string text, readonly boolean checked);return of_InsertRadioBox(index,text,checked,"")
end function

private subroutine _of_fillbkgnd (readonly unsignedlong hdc);ulong bkColor,borderColor,nState
real fLineSize
RADIUSF rdBorder,rdHalfBorder
RECTF paintRect

fLineSize = P2DX(1)
nState = of_GetState()
bkColor = theme.of_GetPanelColor(this,theme.CLR_BKGND,nState)
borderColor = theme.of_GetPanelColor(this,theme.CLR_BORDER,nState)

if theme.#RibbonStyle = theme.RBS_OFFICE2007 then
	rdBorder = theme.#PanelRoundSize
	if _DisplayMode = DPM_COLLAPSED or szCaption.cx = 0 then
		Painter.ThemeFill( hdc, rcPaint, bkColor, Enums.VERT, theme.#PanelBkgndStyle,nState, false, theme.#PanelBorderStyle,borderColor,rdBorder)
	else
		rdHalfBorder.leftTop = rdBorder.leftTop
		rdHalfBorder.rightTop = rdBorder.rightTop
		paintRect = rcPaint
		paintRect.bottom = rcCaption.top + 1
		Painter.ThemeFill( hdc, paintRect, bkColor, Enums.VERT, theme.#PanelBkgndStyle,nState, false, theme.#PanelBorderStyle,0,rdHalfBorder)
		
		bkColor = theme.of_GetPanelColor(this,theme.CLR_CAPTIONBKGND,nState)
		rdHalfBorder.leftTop = 0
		rdHalfBorder.rightTop = 0
		rdHalfBorder.leftBottom = rdBorder.leftBottom
		rdHalfBorder.rightBottom = rdBorder.rightBottom
		Painter.ThemeFill( hdc, rcCaption, bkColor, Enums.VERT, Enums.SOLID,nState, false, theme.#PanelBorderStyle,bkColor,rdHalfBorder)
		Painter.DrawThemeBorder( hdc, rcPaint, borderColor,theme.#PanelBkgndStyle, theme.#PanelBorderStyle,rdBorder)
	end if
elseif theme.#RibbonStyle = theme.RBS_OFFICE2010 then
	if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
		if _MouseOver then bkColor = ToARGB(100,ToRGB(bkColor))
		if _DisplayMode = DPM_COLLAPSED then
			Painter.FillRect( hdc, rcPaint.left,rcPaint.top + (rcPaint.bottom - rcPaint.top) / 2,rcPaint.right,rcPaint.bottom,  0,  bkColor,Enums.VERT,false,false,0)
		else
			Painter.FillRect( hdc, rcPaint.left,rcPaint.bottom - 20,rcPaint.right,rcPaint.bottom,  0,  bkColor,Enums.VERT,false,false,0)
		end if
	end if
	if theme.#PanelBorderStyle <> Enums.BS_NONE then
		if theme.#BkgndStyle = Enums.SOLID or theme.#BkgndStyle = Enums.TRANSPARENT then
			Painter.DrawLine(hdc,&
									rcPaint.right - fLineSize,&
									rcPaint.top + 4,&
									rcPaint.right - fLineSize,&
									rcPaint.bottom - 4,&
									borderColor,Enums.LS_SOLID,false,fLineSize)
		else
			Painter.DrawGradientLine(hdc,&
									rcPaint.right - fLineSize * 3,&
									rcPaint.top + 4,&
									rcPaint.right - fLineSize * 3,&
									rcPaint.bottom,&
									0,ARGBLighten(borderColor,0.8),Enums.LS_SOLID ,false,false,fLineSize)
			Painter.DrawGradientLine(hdc,&
									rcPaint.right - fLineSize * 2,&
									rcPaint.top,&
									rcPaint.right - fLineSize * 2,&
									rcPaint.bottom,&
									0,borderColor,Enums.LS_SOLID ,false,false,fLineSize)
			Painter.DrawGradientLine(hdc,&
									rcPaint.right - fLineSize,&
									rcPaint.top + 4,&
									rcPaint.right - fLineSize,&
									rcPaint.bottom,&
									0,ARGBLighten(borderColor,0.8),Enums.LS_SOLID ,false,false,fLineSize)
		end if
	end if
end if
end subroutine

private subroutine _of_repositems (readonly integer displaymode);//Repos items
int index
real colPos
real xpos,ypos
Uint itemDPMode
RECTF layoutRect,newItemRect
SIZEF itemSize

layoutRect = rcPaint
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)
xpos = layoutRect.left
ypos = layoutRect.top
colPos = xpos

for index = 1 to UpperBound(Items)
	if Not Items[index].#Visible then continue
	if Items[index].#Type = Items[index].ITT_BREAK then
		xpos = colPos + _ItemMargins[displayMode].x
		ypos = layoutRect.top
	else
		if Items[index].#AlwaysLargeMode and Items[index].of_HasLargeMode() then
			itemDPMode = DPM_LARGE
		elseif displayMode = DPM_LARGE then
			if Items[index].of_HasLargeMode() then
				itemDPMode = DPM_LARGE
			elseif Items[index].of_HasIntermediateMode() then
				itemDPMode = DPM_INTERMEDIATE
			else
				itemDPMode = DPM_COMPACT
			end if
		elseif displayMode = DPM_INTERMEDIATE then
			if Items[index].of_HasIntermediateMode() then
				itemDPMode = DPM_INTERMEDIATE
			elseif Items[index].of_HasLargeMode() then
				itemDPMode = DPM_LARGE
			else
				itemDPMode = DPM_COMPACT
			end if
		else
			if Items[index].of_HasCompactMode() then
				itemDPMode = DPM_COMPACT
			elseif Items[index].of_HasIntermediateMode() then
				itemDPMode = DPM_INTERMEDIATE
			else
				itemDPMode = DPM_LARGE
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
			xpos = colPos + _ItemMargins[displayMode].x
			ypos = layoutRect.top
		end if
		newItemRect.left = xpos
		newItemRect.top = ypos
		Items[index].Event OnReposition(itemDPMode,ref newItemRect)
		if colPos < newItemRect.right then
			colPos = newItemRect.right
		end if
		ypos = newItemRect.bottom + _ItemMargins[displayMode].y
	end if
next
end subroutine

public function boolean of_ispopupmode ();return _PopupPanel.IsPopupMode()
end function

public function unsignedlong of_gethandle ();if of_IsPopupMode() then
	return _PopupPanel.GetHandle()
else
	return #ParentCategory.of_GetHandle()
end if
end function

public function integer of_getcount ();return UpperBound(Items)
end function

public function n_cst_ribbonbar_toolbar of_inserttoolbar (readonly integer index);int i
n_cst_ribbonbar_toolbar toolbar

if index < 1 or index > UpperBound(Items) + 1 then return toolbar

toolbar = Create n_cst_ribbonbar_toolbar
toolbar.Event OnInit(this,_ToolTip,_SmallImageList,_LargeImageList)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = toolbar

of_UpdatePoints()

return toolbar
end function

public function n_cst_ribbonbar_toolbar of_addtoolbar ();return of_InsertToolBar(UpperBound(Items)+1)
end function

private subroutine _of_drawicon (readonly boolean fadeanimation);ulong safeDC

if of_IsLockUpdate() then return
if Not of_IsVisible() then return

safeDC = #ParentCategory.of_GetSafeDC()

if safeDC > 0 then
	
	Painter.IntersectClipRect(safeDC,rcPaint)
	Painter.IntersectClipRect(safeDC,rcImage)
	
	Event OnEraseBkgnd(safeDC)
	_of_DrawIcon(safeDC)
	
	Painter.SelectClipRgn(safeDC,0)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(rcImage)
	
	#ParentCategory.of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
end if
end subroutine

private subroutine _of_drawlaunchbutton (readonly boolean fadeanimation);ulong safeDC

if of_IsLockUpdate() then return
if Not #LaunchButton then return
if Not of_IsVisible() then return

safeDC = #ParentCategory.of_GetSafeDC()

if safeDC > 0 then
	
	Painter.IntersectClipRect(safeDC,rcPaint)
	Painter.IntersectClipRect(safeDC,LaunchBtn.rcPaint)
	
	Event OnEraseBkgnd(safeDC)
	_of_DrawLaunchButton(safeDC)
	
	Painter.SelectClipRgn(safeDC,0)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(LaunchBtn.rcPaint)
	
	#ParentCategory.of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
end if
end subroutine

private subroutine _of_drawcaption (readonly boolean fadeanimation);ulong safeDC

if of_IsLockUpdate() then return
if Not of_IsVisible() then return

safeDC = #ParentCategory.of_GetSafeDC()

if safeDC > 0 then
	
	Painter.IntersectClipRect(safeDC,rcPaint)
	Painter.IntersectClipRect(safeDC,rcCaption)
	
	Event OnEraseBkgnd(safeDC)
	_of_DrawCaption(safeDC)
	
	Painter.SelectClipRgn(safeDC,0)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(rcImage)
	
	#ParentCategory.of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
end if
end subroutine

private subroutine _of_showlaunchtip (readonly boolean show);RECTF scRect
POINTF pt
SIZEF toolSize

if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _MouseCaptured then return

if #ParentRibbonBar.#ToolTip and _DisplayMode <> DPM_COLLAPSED and Show then
	if #LaunchTipText <> "" then
		Painter.GetScreenRect(ref scRect)
		Painter.GetCursorPos(ref pt)
		_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,false)
		_ToolTip.UpdateTipText(#ParentRibbonBar.#Handle,_TTID,#LaunchTipText)
		_ToolTip.GetBubbleSize(#ParentRibbonBar.#Handle,_TTID,ref toolSize.cx,ref toolSize.cy)
		if pt.x + toolSize.cx  > scRect.right then
			_ToolTip.TrackPosition( 0,scRect.right -  toolSize.cx,pt.y + 16)
		else
			_ToolTip.TrackPosition( 0,pt.x,pt.y + 16)
		end if
		if #TipTime > 0 then
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,#TipTime)
		else
			_ToolTip.SetDelayTime(Win32.TTDT_AUTOPOP,-1)
		end if
		_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,true)
	else
		_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,false)	
	end if
else
	_ToolTip.TrackActivate(#ParentRibbonBar.#Handle,_TTID,false)
end if
end subroutine

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime);if of_IsPopupMode() then
	return _PopupPanel.of_ReleaseDC(hdc,hrgn,FadeTime)
else
	return #ParentCategory.of_ReleaseDC(hdc,hrgn,FadeTime)
end if
end function

public function boolean of_isenabled ();if Not #Enabled then return false

return #ParentCategory.of_IsEnabled()
end function

public function boolean of_isvisible ();RECTF paintRect

if Not #Visible then return false
if Not #ParentCategory.of_IsVisible() then return false

if of_IsPopupMode() then return true

#ParentCategory.of_GetPaintRect(ref paintRect)
if rcPaint.Right <= paintRect.Left or rcPaint.Left >= paintRect.Right then
	return false
else
	return true
end if
end function

public function n_cst_ribbonbar_icon of_inserticon (readonly integer index, readonly string image);return of_InsertIcon(index,image,Enums.SMALL,Enums.SMALL)
end function

public function n_cst_ribbonbar_icon of_addicon (readonly string image);return of_AddIcon(image,Enums.SMALL,Enums.SMALL)
end function

public function n_cst_ribbonbar_icon of_addicon (readonly string image, readonly unsignedinteger width, readonly unsignedinteger height);return of_InsertIcon(UpperBound(Items)+1,image,width,height)
end function

public function boolean of_iscollapsedmode ();return (_DisplayMode = DPM_COLLAPSED)
end function

public function n_cst_ribbonbar_icon of_inserticon (readonly integer index, readonly string image, readonly unsignedinteger width, readonly unsignedinteger height);int i
n_cst_ribbonbar_icon icon
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return icon

icon = Create n_cst_ribbonbar_icon
icon.Event OnInit(this,_ToolTip,_SmallImageList,_LargeImageList)

if Not icon.Event OnInitData(image,width,height) then
	Destroy icon
	SetNull(icon)
	return icon
end if

layoutRect.bottom = _layoutHeight
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)

icon.Event OnUpdateLayout(layoutRect.bottom - layoutRect.top)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = icon

of_UpdatePoints()

return icon
end function

public function n_cst_ribbonbar_space of_insertspace (readonly integer index);return of_InsertSpace(index,0,0)
end function

public function n_cst_ribbonbar_space of_addspace ();return of_AddSpace(0,0)
end function

public function long of_checkradios (readonly integer beginindex, readonly integer endindex, readonly integer checkindex, readonly boolean checked, readonly boolean triggerevent);int index
boolean rt
n_cst_ribbonbar_radiobox radiobox

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

public function long of_finditembytag (readonly string tag, ref n_cst_ribbonbar_baseitem founditem);int index
boolean bFound
n_cst_ribbonbar_baseitem item

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

public function long of_finditembytext (readonly string text, ref n_cst_ribbonbar_baseitem founditem);int index
boolean bFound
n_cst_ribbonbar_baseitem item
n_cst_ribbonbar_button button
n_cst_ribbonbar_radiobox radiobox
n_cst_ribbonbar_checkbox checkbox
n_cst_ribbonbar_label	label
n_cst_ribbonbar_link		link

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

public function long of_getitem (readonly integer index, ref n_cst_ribbonbar_baseitem item);if index < 1 or index > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

try
	item = Items[index]
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(item),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function long of_remove (readonly integer index);int i
boolean bVisible
n_cst_ribbonbar_baseitem	newItems[]

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

public function long of_removeall ();int i
n_cst_ribbonbar_baseitem	emptyItems[]

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

public function long of_setalwaysitemmode (readonly boolean always);if #AlwaysItemMode = always then return RetCode.OK

#AlwaysItemMode = always

of_UpdatePoints()

return RetCode.OK
end function

public function long of_setcaption (readonly string caption);boolean layoutChanged
boolean dirty

if #Caption= caption then return RetCode.OK
if _ImageIndex = 0 and Len(caption) = 0 then return RetCode.E_INVALID_ARGUMENT

if (Len(#Caption) > 0) <> (Len(caption) > 0) then
	layoutChanged = true
	dirty = true
elseif Len(#Caption)  <> Len(caption) then
	dirty = true
end if

#Caption= caption
_of_UpdateTextSize()

if dirty  then
	if layoutChanged then
		_of_UpdateItemLayouts()
	end if
	of_UpdatePoints()
else
	_of_DrawCaption(false)
end if

return RetCode.OK
end function

public function long of_setenabled (readonly boolean enabled);if #Enabled = enabled then return RetCode.OK

#Enabled = enabled

of_Redraw(true)

return RetCode.OK
end function

public function long of_setimage (readonly string image);int newIndex
boolean dirty

if #Image= image then return RetCode.OK

newIndex = _PanelImageList.AddImage(image)

if newIndex = 0 and szCollapsedCaption.cx = 0 then return RetCode.E_INVALID_IMAGE

if (_ImageIndex > 0) <> (newIndex > 0) then
	dirty = true
end if

#Image = image
_ImageIndex = newIndex

if _DisplayMode = DPM_COLLAPSED then
	if dirty then
		of_UpdatePoints()
	else
		_of_DrawIcon(true)
	end if
end if

return RetCode.OK
end function

public function long of_setlaunchbutton (readonly boolean show);if #LaunchButton = show then return RetCode.OK

#LaunchButton = show

if Not #LaunchButton then
	LaunchBtn.MouseOver = false
	LaunchBtn.MouseDown = false
end if

_of_UpdateItemLayouts()
of_UpdatePoints()

return RetCode.OK
end function

public function long of_setvisible (readonly boolean visible);if #Visible = visible then return RetCode.OK

#Visible = visible

#ParentCategory.Event OnNotify(this,NCD_UPDATEPOINTS,0)

if Not #Visible then
	of_ExitPopupMode(0)
end if

return RetCode.OK
end function

public function long of_updatepoints ();_needRecalcLayout = true
#ParentCategory.Event OnNotify(this,NCD_LAYOUTCHANGED,0)

if of_IsLockUpdate() then return RetCode.FAILED
if Not of_IsVisible() then return RetCode.OK

_of_RecalcLayout()

#ParentCategory.Event OnNotify(this,NCD_UPDATEPOINTS,0)

return RetCode.OK
end function

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC

if of_IsLockUpdate() then return RetCode.FAILED
if Not of_IsVisible() then return RetCode.OK

safeDC = #ParentCategory.of_GetSafeDC()

if safeDC > 0 then
	
	Painter.IntersectClipRect(safeDC,rcPaint)
		
	#ParentCategory.Event OnEraseBkgnd(safeDC)
	Event OnPaint(safeDC)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(rcPaint)
	
	#ParentCategory.of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
	
end if

return RetCode.OK
end function

public function long of_exitpopupmode (readonly unsignedlong exitcode, readonly boolean exitall);if of_IsPopupMode() then
	_PopupPanel.ClosePopup(exitcode,true)
end if
if exitAll then
	if #ParentCategory.of_IsPopupMode() then
		#ParentCategory.of_ExitPopupMode(exitcode)
	end if
end if

return RetCode.OK
end function

public function long of_exitpopupmode (readonly unsignedlong exitcode);return of_ExitPopupMode(exitCode,false)
end function

private subroutine _of_updateitemlayouts ();int index
RECTF layoutRect

layoutRect.bottom = _layoutHeight
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)

for index = 1 to UpperBound(Items)
	if Items[index].#Type = Items[index].ITT_BREAK then continue
	Items[index].Event OnUpdateLayout(layoutRect.bottom - layoutRect.top)
next

_of_RecalcLayout()
end subroutine

public function n_cst_ribbonbar_separator of_insertseparator (readonly integer index);int i
n_cst_ribbonbar_separator separator
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return separator

separator = Create n_cst_ribbonbar_separator
separator.Event OnInit(this,_ToolTip,_SmallImageList,_LargeImageList)

layoutRect.bottom = _layoutHeight
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)

separator.Event OnUpdateLayout(layoutRect.bottom - layoutRect.top)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = separator

of_UpdatePoints()

return separator
end function

public function boolean of_islockupdate ();if #LockUpdate then return true

return #ParentCategory.of_IsLockUpdate()
end function

public function n_cst_ribbonbar_button of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext);n_cst_ribbonbar_button button

button = of_InsertButton(index,text,smallImage,largeImage,tipText)

if IsValidObject(button) then
	button.of_SetStyle(Enums.BTS_SPLIT)
	if IsFailed(button.of_SetPopupMenu(clsName)) then
		of_Remove(of_GetIndex(button))
		SetNull(button)
	end if
end if
	
return button
end function

public function n_cst_ribbonbar_button of_insertsplitbutton (readonly integer index, readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage);return of_InsertSplitButton(index,clsName,text,smallImage,largeImage,"")
end function

public function n_cst_ribbonbar_button of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext);n_cst_ribbonbar_button button

button = of_InsertButton(index,text,smallImage,largeImage,tipText)

if IsValidObject(button) then
	button.of_SetStyle(Enums.BTS_DROPDOWN)
	if IsFailed(button.of_SetPopupMenu(clsName)) then
		of_Remove(of_GetIndex(button))
		SetNull(button)
	end if
end if
	
return button
end function

public function n_cst_ribbonbar_button of_insertmenubutton (readonly integer index, readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage);return of_InsertMenuButton(index,clsName,text,smallImage,largeImage,"")
end function

public function n_cst_ribbonbar_button of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext);n_cst_ribbonbar_button button

button = of_InsertButton(index,text,smallImage,largeImage,tipText)

if IsValidObject(button) then
	button.of_SetStyle(Enums.BTS_SPLIT)
	if IsFailed(button.of_SetPopupMenu(popupMenu)) then
		of_Remove(of_GetIndex(button))
		SetNull(button)
	end if
end if
	
return button
end function

public function n_cst_ribbonbar_button of_insertsplitbutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage);return of_InsertSplitButton(index,popupMenu,smallImage,largeImage,"")
end function

public function n_cst_ribbonbar_button of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext);n_cst_ribbonbar_button button

button = of_InsertButton(index,text,smallImage,largeImage,tipText)

if IsValidObject(button) then
	button.of_SetStyle(Enums.BTS_DROPDOWN)
	if IsFailed(button.of_SetPopupMenu(popupMenu)) then
		of_Remove(of_GetIndex(button))
		SetNull(button)
	end if
end if

return button
end function

public function n_cst_ribbonbar_button of_insertmenubutton (readonly integer index, ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage);return of_InsertMenuButton(index,popupMenu,smallImage,largeImage,"")
end function

public function n_cst_ribbonbar_button of_addmenubutton (readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext);return of_InsertMenuButton(UpperBound(Items) + 1,clsName,text,smallImage,largeImage,tipText)
end function

public function n_cst_ribbonbar_button of_addmenubutton (readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage);return of_AddMenuButton(clsName,text,smallImage,largeImage,"")
end function

public function n_cst_ribbonbar_button of_addsplitbutton (readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext);return of_InsertSplitButton(UpperBound(Items) + 1,clsName,text,smallImage,largeImage,tipText)
end function

public function n_cst_ribbonbar_button of_addsplitbutton (readonly string clsname, readonly string text, readonly string smallimage, readonly string largeimage);return of_AddSplitButton(clsName,text,smallImage,largeImage,"")
end function

public function n_cst_ribbonbar_button of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext);return of_InsertMenuButton(UpperBound(Items)+1,popupmenu,text,smallimage,largeimage,tiptext)
end function

public function n_cst_ribbonbar_button of_addmenubutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage);return of_AddMenuButton(popupmenu,text,smallimage,largeimage,"")
end function

public function n_cst_ribbonbar_button of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage, readonly string tiptext);return of_InsertSplitButton(UpperBound(Items)+1,popupmenu,text,smallimage,largeimage,tiptext)
end function

public function n_cst_ribbonbar_button of_addsplitbutton (ref n_cst_popupmenu popupmenu, readonly string text, readonly string smallimage, readonly string largeimage);return of_AddSplitButton(popupmenu,text,smallimage,largeimage,"")
end function

public function n_cst_ribbonbar_break of_insertbreak (readonly integer index);int i
n_cst_ribbonbar_break break
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return break

break = Create n_cst_ribbonbar_break
break.Event OnInit(this,_ToolTip,_SmallImageList,_LargeImageList)

layoutRect.bottom = _layoutHeight
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)

break.Event OnUpdateLayout(layoutRect.bottom - layoutRect.top)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = break

of_UpdatePoints()

return break
end function

public function n_cst_ribbonbar_break of_addbreak ();return of_InsertBreak(UpperBound(Items)+1)
end function

public function n_cst_ribbonbar_checkbox of_insertcheckbox (readonly integer index, readonly string text);return of_InsertCheckBox(index,text,false,"")
end function

public function n_cst_ribbonbar_checkbox of_addcheckbox (readonly string text);return of_AddCheckBox(text,false,"")
end function

public function n_cst_ribbonbar_radiobox of_addradiobox (readonly string text);return of_AddRadioBox(text,false,"")
end function

public function n_cst_ribbonbar_radiobox of_insertradiobox (readonly integer index, readonly string text);return of_InsertRadioBox(index,text,false,"")
end function

public function unsignedinteger of_getdisplaymode ();return _DisplayMode
end function

public function long of_setcollapsedscaleorder (readonly long scaleorder);if #CollapsedScaleOrder = scaleOrder then return RetCode.OK

#CollapsedScaleOrder = scaleOrder
#ParentCategory.Event OnNotify(this,NCD_UPDATESCALEORDER,DPM_COLLAPSED)

return RetCode.OK
end function

public function long of_setcompactscaleorder (readonly long scaleorder);if #CompactScaleOrder = scaleOrder then return RetCode.OK

#CompactScaleOrder = scaleOrder
#ParentCategory.Event OnNotify(this,NCD_UPDATESCALEORDER,DPM_COMPACT)

return RetCode.OK
end function

public function long of_setintermediatescaleorder (readonly long scaleorder);if #IntermediateScaleOrder = scaleOrder then return RetCode.OK

#IntermediateScaleOrder = scaleOrder
#ParentCategory.Event OnNotify(this,NCD_UPDATESCALEORDER,DPM_INTERMEDIATE)

return RetCode.OK
end function

public function unsignedlong of_getstate ();ulong nState

if _DisplayMode = DPM_COLLAPSED and _MouseDown then
	nState += Enums.STATE_HOVER + Enums.STATE_PRESSED
else
	if _MouseOver then nState += Enums.STATE_HOVER
	if _MouseDown then nState += Enums.STATE_PRESSED
end if
if _DisplayMode = DPM_COLLAPSED then nState += Enums.STATE_COLLAPSED
if Not of_IsEnabled() then nState += Enums.STATE_DISABLED

return nState
end function

public function unsignedlong of_getlaunchbuttonstate ();ulong nState

if LaunchBtn.MouseOver then nState += Enums.STATE_HOVER
if LaunchBtn.MouseDown then nState += Enums.STATE_PRESSED
if Not of_IsEnabled() then nState += Enums.STATE_DISABLED

return nState
end function

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if BitAND(flags,ADJ_BORDER) > 0 then
	if theme.#PanelBorderStyle <> Enums.BS_NONE then
		fBorderSize = P2DX(1)
		if theme.#RibbonStyle = theme.RBS_OFFICE2007 then
			Painter.InflateRect(ref adjRect,-fBorderSize,-fBorderSize)
		elseif theme.#RibbonStyle = theme.RBS_OFFICE2010 then
			adjRect.right -= fBorderSize * 3
		end if
	end if
end if

if BitAND(flags,ADJ_BORDERMARGIN) > 0 then
	adjRect.left += #BorderMargin.left
	adjRect.top += #BorderMargin.top
	adjRect.right -= #BorderMargin.right
	adjRect.bottom -= #BorderMargin.bottom
end if

if BitAND(flags,ADJ_CAPTION) > 0 then
	if #LaunchButton then
		if szCaption.cy + 4 > LAUNCHICONSIZE + 4 + 2 then
			adjRect.bottom -= szCaption.cy + 4
		else
			adjRect.bottom -= LAUNCHICONSIZE + 4 + 2
		end if
	elseif szCaption.cy > 0 then
		adjRect.bottom -= szCaption.cy + 4
	end if
end if
end subroutine

public function long of_getpaintrect (ref rectf paintrect);paintrect = rcPaint
return RetCode.OK
end function

public function long of_getcompactitemmargin (ref real xmargin, ref real ymargin);XMargin = _ItemMargins[DPM_COMPACT].x
YMargin = _ItemMargins[DPM_COMPACT].y
return RetCode.OK
end function

public function long of_getintermediatemargin (ref real xmargin, ref real ymargin);XMargin = _ItemMargins[DPM_INTERMEDIATE].x
YMargin = _ItemMargins[DPM_INTERMEDIATE].y
return RetCode.OK
end function

public function long of_getlargeitemmargin (ref real xmargin, ref real ymargin);XMargin = _ItemMargins[DPM_LARGE].x
YMargin = _ItemMargins[DPM_LARGE].y
return RetCode.OK
end function

public function long of_setcompactitemmargin (readonly real xmargin, readonly real ymargin);if _ItemMargins[DPM_COMPACT].x = XMargin and _ItemMargins[DPM_COMPACT].y = YMargin then return RetCode.OK

_ItemMargins[DPM_COMPACT].x = XMargin 
_ItemMargins[DPM_COMPACT].y = YMargin

of_UpdatePoints()

return RetCode.OK
end function

public function long of_setintermediateitemmargin (readonly real xmargin, readonly real ymargin);if _ItemMargins[DPM_INTERMEDIATE].x = XMargin and _ItemMargins[DPM_INTERMEDIATE].y = YMargin then return RetCode.OK

_ItemMargins[DPM_INTERMEDIATE].x = XMargin 
_ItemMargins[DPM_INTERMEDIATE].y = YMargin

of_UpdatePoints()

return RetCode.OK
end function

public function long of_setlargeitemmargin (readonly real xmargin, readonly real ymargin);if _ItemMargins[DPM_LARGE].x = XMargin and _ItemMargins[DPM_LARGE].y = YMargin then return RetCode.OK

_ItemMargins[DPM_LARGE].x = XMargin 
_ItemMargins[DPM_LARGE].y = YMargin

of_UpdatePoints()

return RetCode.OK
end function

private function unsignedlong _of_popuppanel (readonly real xpos, readonly real ypos);Ulong rtCode

_PopupPanel.Event OnInitData(Items,szCaption)

rtCode = _PopupPanel.of_Popup( rcPaint.left,rcPaint.bottom)

_lastPopupTime = Cpu()

return rtCode
end function

public function n_cst_ribbonbar_space of_addspace (readonly real width, readonly real height);return of_InsertSpace(UpperBound(Items)+1,width,height)
end function

public function n_cst_ribbonbar_space of_insertspace (readonly integer index, readonly real width, readonly real height);int i
n_cst_ribbonbar_space space
RECTF layoutRect

if index < 1 or index > UpperBound(Items) + 1 then return space

space = Create n_cst_ribbonbar_space
space.Event OnInit(this,_ToolTip,_SmallImageList,_LargeImageList)

if Not space.Event OnInitData(width,height) then
	Destroy space
	SetNull(space)
	return space
end if

layoutRect.bottom = _layoutHeight
_of_AdjustRect(ref layoutRect,ADJ_BORDER + ADJ_BORDERMARGIN + ADJ_CAPTION)

space.Event OnUpdateLayout(layoutRect.bottom - layoutRect.top)

for i = UpperBound(Items) + 1 to index + 1 step -1
	Items[i] = Items[i - 1]
next
Items[index] = space

of_UpdatePoints()

return space
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

public function integer of_indexfrompoint (readonly real xpos, readonly real ypos);int index

if Not of_IsVisible() or Not of_IsEnabled() then return 0
if Not Painter.PtInRect(rcPaint,xpos,ypos) then return 0

if #LaunchButton then
	if Painter.PtInRect(LaunchBtn.rcPaint,xpos,ypos) then
		return IDX_LAUNCHBTN
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

public function long of_setscaleorder (readonly long scaleorder);boolean bLockUpdate,bDirty

bLockUpdate = #ParentCategory.#LockUpdate
#ParentCategory.#LockUpdate = true

if #IntermediateScaleOrder <> scaleOrder then
	#IntermediateScaleOrder = scaleOrder
	#ParentCategory.Event OnNotify(this,NCD_UPDATESCALEORDER,DPM_INTERMEDIATE)
	bDirty = true
end if
if #CompactScaleOrder <> scaleOrder then
	#CompactScaleOrder = scaleOrder
	#ParentCategory.Event OnNotify(this,NCD_UPDATESCALEORDER,DPM_COMPACT)
	bDirty = true
end if
if #CollapsedScaleOrder <> scaleOrder then
	#CollapsedScaleOrder = scaleOrder
	#ParentCategory.Event OnNotify(this,NCD_UPDATESCALEORDER,DPM_COLLAPSED)
	bDirty = true
end if

#ParentCategory.#LockUpdate = bLockUpdate
if bDirty and Not bLockUpdate then
	#ParentCategory.of_UpdatePoints()
end if

return RetCode.OK
end function

public function long of_setitemmargin (readonly real xmargin, readonly real ymargin);boolean bDirty

if _ItemMargins[DPM_LARGE].x <> xMargin or _ItemMargins[DPM_LARGE].y <> yMargin then
	_ItemMargins[DPM_LARGE].x = xMargin 
	_ItemMargins[DPM_LARGE].y = yMargin
	bDirty = true
end if
if _ItemMargins[DPM_INTERMEDIATE].x <> xMargin or _ItemMargins[DPM_INTERMEDIATE].y <> yMargin then
	_ItemMargins[DPM_INTERMEDIATE].x = xMargin 
	_ItemMargins[DPM_INTERMEDIATE].y = yMargin
	bDirty = true
end if
if _ItemMargins[DPM_COMPACT].x <> xMargin or _ItemMargins[DPM_COMPACT].y <> yMargin then
	_ItemMargins[DPM_COMPACT].x = xMargin 
	_ItemMargins[DPM_COMPACT].y = yMargin
	bDirty = true
end if

if bDirty then
	of_UpdatePoints()
end if

return RetCode.OK
end function

public function long of_checkradios (readonly integer checkindex, readonly boolean checked);return of_CheckRadios(1,UpperBound(Items),checkIndex,checked,false)
end function

public function long of_checkradios (readonly integer checkindex, readonly boolean checked, readonly boolean triggerevent);return of_CheckRadios(1,UpperBound(Items),checkIndex,checked,triggerEvent)
end function

public function long of_findcheckedradio (readonly integer beginindex, readonly integer endindex, ref n_cst_ribbonbar_radiobox founditem);int index
n_cst_ribbonbar_radiobox radiobox

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

public function long of_findcheckedradio (ref n_cst_ribbonbar_radiobox founditem);return of_FindCheckedRadio(1,UpperBound(Items),ref foundItem)
end function

public function long of_setcollapsed (readonly boolean collapsed);if #Collapsed = collapsed then return RetCode.OK

#Collapsed = collapsed

of_UpdatePoints()

return RetCode.OK
end function

on n_cst_ribbonbar_panel.create
call super::create
this.font=create font
TriggerEvent( this, "constructor" )
end on

on n_cst_ribbonbar_panel.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.font)
end on

event constructor;__RefCount ++
if __RefCount = 1 then
	__LaunchImageList = Create n_imagelist
	__LaunchImageList.SetImageSize(LAUNCHICONSIZE,LAUNCHICONSIZE)
	__LaunchImageList.AddImage(ICO_LAUNCH)
end if

#BorderMargin.left = 2
#BorderMargin.top = 2
#BorderMargin.right = 2
#BorderMargin.bottom = 2

_ItemMargins[DPM_LARGE].x = 8
_ItemMargins[DPM_LARGE].y = 8
_ItemMargins[DPM_INTERMEDIATE].x = 2
_ItemMargins[DPM_INTERMEDIATE].y = 2
_ItemMargins[DPM_COMPACT].x = 1
_ItemMargins[DPM_COMPACT].y = 1

_PopupPanel = Create n_cst_ribbonbar_popuppanel
end event

event destructor;int index

for index = 1 to UpperBound(Items)
	Destroy Items[index]
next

if _TTID > 0 then
	_ToolTip.DelTool(#ParentRibbonBar.#Handle,_TTID)
end if

__RefCount --
if __RefCount = 0 then
	Destroy __LaunchImageList
end if

Destroy _PopupPanel
end event

type font from n_cst_font within n_cst_ribbonbar_panel descriptor "pb_nvo" = "true" 
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

