$PBExportHeader$n_cst_splitcontainer.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_splitcontainer from nonvisualobject
end type
type timer from n_timer within n_cst_splitcontainer
end type
type panel1 from n_cst_splitcontainer_panel within n_cst_splitcontainer
end type
type panel2 from n_cst_splitcontainer_panel within n_cst_splitcontainer
end type
end forward

shared variables
n_imagelist 	__ImageList
Ulong			__RefCount = 0

//Image indexes
int		__Idx_ExpandLeft
int		__Idx_ExpandTop
int		__Idx_ExpandRight
int		__Idx_ExpandBottom
end variables

global type n_cst_splitcontainer from nonvisualobject
event oninit ( u_cst_splitcontainer parentsplitcontainer,  n_cst_splitcontainer_panel parentpanel,  n_tooltip tooltip )
event type long onreposition ( ref unsignedlong hdwp,  ref rectf newrect )
event type long onpaint ( unsignedlong hdc )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event onmouseleave ( )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event oncapturechanged ( )
event type boolean ontimer ( unsignedinteger id )
event type long onhittest ( real xpos,  real ypos )
event type long onnotify ( n_cst_splitcontainer_panel childpanel,  long notifycode,  long command )
event type boolean oninitdata ( unsignedinteger orientation )
event type long onvisiblechanged ( boolean visible )
event type long onerasebkgnd ( unsignedlong hdc )
event onsplitbarmoved ( n_cst_splitcontainer splitcontainer,  real offset,  integer index )
event oncheckhiddenstatus ( )
timer timer
panel1 panel1
panel2 panel2
end type
global n_cst_splitcontainer n_cst_splitcontainer

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
//SaveLayout/LoadLayout/ResetLayout flags
Constant Long LAY_ORIENTATION 		= 1
Constant Long LAY_SPLITBAR			 	= 2
Constant Long LAY_PANELCOLLAPSED	= 4
Constant Long LAY_PANELVISIBLE			= 8

/*--- Properties ---*/
Public:
PrivateWrite u_cst_splitcontainer			#ParentSplitContainer
PrivateWrite n_cst_splitcontainer_panel	#ParentPanel
PrivateWrite Boolean							#Visible						= true
Any												#Data
String												#Tag
PrivateWrite Uint								#Orientation				= Enums.VERT
PrivateWrite real								#SplitBarSize				= 4					//dip
Boolean											#SplitBarDragable			= true
Boolean											#LockUpdate

/*--- Implementation ---*/
Private:
n_cst_splitcontainer_theme	theme
n_tooltip							_ToolTip
PAINTPANE						SplitBar
PAINTPANE						ExpandButton
RECTF								rcClient

Ulong _TTID

POINTF _mouseDownPoint
POINTF _lastMousePoint

real _splitterOffsetSize
real _realSplitterOffsetSize

Int _mouseOverIndex 		= 0
Int _mouseCapturedIndex 	= 0

String _currTipText

Boolean _layoutChanged 	= false
Boolean _MouseCaptured 	= false

Boolean _isRoot

Uint _orgOrientation

/*--- Constants ---*/
//Cursors
Constant String CUR_VSPLIT = "SizeWE!"
Constant String CUR_HSPLIT = "SizeNS!"
Constant String CUR_ARROW = "Arrow!"
//Collapse button icons
Constant String ICO_EXPANDLEFT			= "pfw://zip/images[expand_left.png]"
Constant String ICO_EXPANDTOP			= "pfw://zip/images[expand_top.png]"
Constant String ICO_EXPANDRIGHT		= "pfw://zip/images[expand_right.png]"
Constant String ICO_EXPANDBOTTOM	= "pfw://zip/images[expand_bottom.png]"
//Collapse button tiptext
Constant String TIP_DBCLKCOLLAPSELEFT 		= "双击折叠左侧面板"
Constant String TIP_DBCLKCOLLAPSERIGHT 	= "双击折叠右侧面板"
Constant String TIP_DBCLKCOLLAPSETOP 		= "双击折叠上侧面板"
Constant String TIP_DBCLKCOLLAPSEBOTTOM 	= "双击折叠下侧面板"
Constant String TIP_DBCLKEXPANDLEFT 			= "双击展开左侧面板"
Constant String TIP_DBCLKEXPANDRIGHT		= "双击展开右侧面板"
Constant String TIP_DBCLKEXPANDTOP			= "双击展开上侧面板"
Constant String TIP_DBCLKEXPANDBOTTOM		= "双击展开下侧面板"
Constant String TIP_EXPANDLEFT 					= "展开左侧面板"
Constant String TIP_EXPANDRIGHT				= "展开右侧面板"
Constant String TIP_EXPANDTOP					= "展开上侧面板"
Constant String TIP_EXPANDBOTTOM				= "展开下侧面板"
//Notify code
Constant Long	NCD_UPDATEPOINTS				= 1
Constant Long	NCD_SETCAPTURE				= 2	//command:1,Set;0,Release
Constant Long	NCD_VISIBLECHANGED	 		= 3	//command:visible value
Constant Long	NCD_COLLAPSEDCHANGED		= 4	//command:collapsed value
Constant Long	NCD_COLLAPSIBLECHANGED	= 5	//command:collapsible value
Constant Long	NCD_CUSTOM						= 6
//Timer ID
Constant Uint TM_TRACKRESIZE	= 1
//Timer interval (ms)
Constant Uint TMI_TRACKRESIZE	= 30
//Hit-test code
Constant Long	HTNOWHERE	= 0
Constant Long	HTVALID			= 1
//Sizes
Constant real EXPANDBTNSIZE	= 11		//dip
Constant real ICONSIZE				= 7		//dip
end variables

forward prototypes
public function integer of_getobjectcount ()
private subroutine _of_capturemouse (readonly boolean capture)
public function long of_updatepoints ()
public function long of_setorientation (readonly unsignedinteger orientation)
public function boolean of_isvisible ()
public function long of_setvisible (readonly boolean visible)
public function unsignedlong of_getsafedc ()
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime)
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation)
public function long of_redraw (readonly boolean fadeanimation)
private function boolean _of_issplitbardragable ()
public function boolean of_islockupdate ()
public function string of_savelayout (readonly long flags)
public function string of_savelayout ()
public function long of_resetlayout (readonly long flags)
public function long of_resetlayout ()
private subroutine _of_drawexpandbutton (readonly unsignedlong hdc)
private subroutine _of_drawexpandbutton (readonly boolean fadeanimation)
private subroutine _of_showtip (readonly string tiptext)
public function long of_findpanelbyobject (readonly windowobject object, ref n_cst_splitcontainer_panel panel)
public function long of_findpanelbytitle (readonly string title, ref n_cst_splitcontainer_panel panel)
public function long of_findpanelbytag (readonly string tag, ref n_cst_splitcontainer_panel panel)
public function long of_getclientrect (ref rectf clientrect)
public function long of_setsplitbarsize (readonly real size)
public function real of_getsplitteroffsetsize ()
public function long of_setsplitteroffsetsize (readonly real offsetsize)
private function real _of_getsplitbarsize ()
private function real _of_adjustsplitteroffsetsize (real offsetsize)
public function real of_getwidth ()
public function real of_getheight ()
public function long _of_loadlayout (readonly string slayoutinfo, readonly boolean test)
public function long of_loadlayout (readonly string slayoutinfo)
end prototypes

event oninit(u_cst_splitcontainer parentsplitcontainer, n_cst_splitcontainer_panel parentpanel, n_tooltip tooltip);#ParentSplitContainer = parentSplitContainer
theme = #ParentSplitContainer.Theme

if IsValid(ParentPanel) then
	#ParentPanel = ParentPanel
else
	_isRoot = true
end if

_ToolTip = toolTip
_TTID = _ToolTip.AddTool(#ParentSplitContainer.#Handle,false,Win32.TTF_SUBCLASS + Win32.TTF_TRANSPARENT)

Panel1.Event OnInit(this,toolTip)
Panel2.Event OnInit(this,toolTip)
end event

event type long onreposition(ref unsignedlong hdwp, ref rectf newrect);real splitBarSize
real xpos,ypos
real panelMargin1,panelMargin2
real maxSize,panelSize1,panelSize2
RECTF panelRect
Constant real COLLAPSEDBTNHEIGHT = 30 //dip
Constant real COLLAPSEDBTNWIDTH = 30 	//dip
Constant real COLLAPSEBUTTONMARGIN = 0	//dip

if rcClient.left = newRect.left and rcClient.top = newRect.top and rcClient.right = newRect.right and rcClient.bottom = newRect.bottom and Not _layoutChanged then return 0

_layoutChanged = false
rcClient = newRect

if of_IsLockUpdate() then return 1

splitBarSize = _of_GetSplitBarSize()

if #Orientation = Enums.VERT then
	maxSize = (rcClient.right - rcClient.left) - splitBarSize
else
	maxSize = (rcClient.bottom - rcClient.top) - splitBarSize
end if

if maxSize < 0 then
	maxSize = 0
end if

if #Orientation = Enums.VERT then
	if Panel1.#Visible and Not Panel1.#Collapsed then
		panelMargin1 = Panel1.#Margin.left + Panel1.#Margin.right
	end if
	if Panel2.#Visible and Not Panel2.#Collapsed then
		panelMargin2 = Panel2.#Margin.left + Panel2.#Margin.right
	end if
else
	if Panel1.#Visible and Not Panel1.#Collapsed then
		panelMargin1 = Panel1.#Margin.top + Panel1.#Margin.bottom
	end if
	if Panel2.#Visible and Not Panel2.#Collapsed then
		panelMargin2 = Panel2.#Margin.top + Panel2.#Margin.bottom
	end if
end if

if Panel1.#Visible and Not Panel1.#Collapsed then
	if Not Panel2.#Visible or Panel2.#Collapsed then
		panelSize1 = maxSize
	else
		panelSize1 = Panel1.#Size
	end if
end if
if Panel2.#Visible and Not Panel2.#Collapsed then
	if Not Panel1.#Visible or Panel1.#Collapsed then
		panelSize2 = maxSize
	else
		panelSize2 = Panel2.#Size
	end if
end if

if panelSize1 >= 0 and panelSize1 <= 1 and panelSize2 >= 0 and panelSize2 <= 1 then
	if panelSize1 + panelSize2 > 1 then
		panelSize2 = 1 - panelSize1
	end if
end if

if panelSize1 >= 0 and panelSize1 <= 1 then
	panelSize1 = Ceiling(panelSize1 * maxSize)
end if
if panelSize2 >= 0 and panelSize2 <= 1 then
	panelSize2  = Ceiling(panelSize2 * maxSize)
end if

if panelSize1 = -1 and panelSize2 = -1 then
	panelSize1 = Ceiling(maxSize / 2)
	panelSize2 = Long(maxSize / 2)
	if panelSize2 > Panel2.#MaxSize then
		panelSize1 = maxSize - (Panel2.#MaxSize + panelMargin2)
	elseif panelSize2 < Panel2.#MinSize then
		panelSize1 = maxSize - (Panel2.#MinSize + panelMargin2)
	else
		panelSize1 = maxSize - (panelSize2 + panelMargin2)
	end if
	if panelSize1 > Panel1.#MaxSize then
		panelSize2 = maxSize - (Panel1.#MaxSize + panelMargin1)
	elseif panelSize1 < Panel1.#MinSize then
		panelSize2 = maxSize - (Panel1.#MinSize + panelMargin1)
	else
		panelSize2 = maxSize - (panelSize1 + panelMargin1)
	end if
else
	if panelSize1 = -1 then
		if panelSize2 > Panel2.#MaxSize then
			panelSize1 = maxSize - (Panel2.#MaxSize + panelMargin2)
		elseif panelSize2 < Panel2.#MinSize then
			panelSize1 = maxSize - (Panel2.#MinSize + panelMargin2)
		else
			panelSize1 = maxSize - (panelSize2 + panelMargin2)
		end if
	end if
	if panelSize2 = -1 then
		if panelSize1 > Panel1.#MaxSize then
			panelSize2 = maxSize - (Panel1.#MaxSize + panelMargin1)
		elseif panelSize1 < Panel1.#MinSize then
			panelSize2 = maxSize - (Panel1.#MinSize + panelMargin1)
		else
			panelSize2 = maxSize - (panelSize1 + panelMargin1)
		end if
	end if
end if

if Panel1.#Visible and Not Panel1.#Collapsed then
	if Panel2.#Visible and Not Panel2.#Collapsed then
		if panelSize1 > Panel1.#MaxSize then
			panelSize1 = Panel1.#MaxSize
		end if
	end if
	if panelSize1 < Panel1.#MinSize then
		panelSize1 = Panel1.#MinSize
	end if
	//注:此处不使用+=,避免PB9下编译后报R0025异常...
	panelSize1 = panelSize1 + panelMargin1
	if panelSize1 > maxSize then
		panelSize1 = maxSize
	end if
end if
if Panel2.#Visible and Not Panel2.#Collapsed then
	if Panel1.#Visible and Not Panel1.#Collapsed then
		if panelSize2 > Panel2.#MaxSize then
			panelSize2 = Panel2.#MaxSize
		end if
	end if
	if panelSize2 < Panel2.#MinSize then
		panelSize2 = Panel2.#MinSize
	end if
	//注:此处不使用+=,避免PB9下编译后报R0025异常...
	panelSize2 = panelSize2 + panelMargin2
	if panelSize2 > maxSize - panelSize1 then
		panelSize2 = maxSize - panelSize1
	end if
end if

_realSplitterOffsetSize = _splitterOffsetSize

if Panel1.#Visible and Not Panel1.#Collapsed then
	if Panel2.#Visible and Not Panel2.#Collapsed then
		//注:此处不使用+=,避免PB9下编译后报R0025异常...
		panelSize1 = panelSize1 + _realSplitterOffsetSize
	end if
	if panelSize1 > maxSize then
		if Panel2.#Visible and Not Panel2.#Collapsed then
			if _splitterOffsetSize <> 0 then
				//注:此处不使用-=,避免PB9下编译后报R0025异常...
				_realSplitterOffsetSize = _realSplitterOffsetSize - (panelSize1 - maxSize)
			end if
		end if
		panelSize1 = maxSize
	end if
	if Panel2.#Visible and Not Panel2.#Collapsed then
		if panelSize1 - panelMargin1 > Panel1.#MaxSize then
			if _splitterOffsetSize <> 0 then
				//注:此处不使用-=,避免PB9下编译后报R0025异常...
				_realSplitterOffsetSize = _realSplitterOffsetSize - (panelSize1 - panelMargin1 - Panel1.#MaxSize)
			end if
			panelSize1 = Panel1.#MaxSize + panelMargin1
		end if
	end if
	if panelSize1 - panelMargin1 < Panel1.#MinSize then
		if Panel2.#Visible and Not Panel2.#Collapsed then
			if _splitterOffsetSize <> 0 then
				//注:此处不使用+=,避免PB9下编译后报R0025异常...
				_realSplitterOffsetSize = _realSplitterOffsetSize + (Panel1.#MinSize - (panelSize1 - panelMargin1))
			end if
		end if
		panelSize1 = Panel1.#MinSize + panelMargin1
	end if
end if
if Panel2.#Visible and Not Panel2.#Collapsed then
	if Panel1.#Visible and Not Panel1.#Collapsed then
		//注:此处不使用+=,避免PB9下编译后报R0025异常...
		panelSize2 = panelSize2 - _realSplitterOffsetSize
	end if
	if panelSize2 > maxSize - panelSize1 then
		panelSize2 = maxSize - panelSize1
	end if
	if Panel1.#Visible and Not Panel1.#Collapsed then
		if panelSize2 - panelMargin2 > Panel2.#MaxSize then
			panelSize2 = Panel2.#MaxSize + panelMargin2
		end if
	end if
	if panelSize2 - panelMargin2 < Panel2.#MinSize then
		panelSize2 = Panel2.#MinSize + panelMargin2
	end if
end if

panelRect = rcClient
xpos = panelRect.left
ypos = panelRect.top

if #Orientation = Enums.VERT then
	if Panel1.#Visible and Not Panel1.#Collapsed then
		panelRect.right = panelRect.left + panelSize1
		//Offset margin
		panelRect.left += Panel1.#Margin.left
		panelRect.top += Panel1.#Margin.top
		panelRect.right -= Panel1.#Margin.right
		panelRect.bottom -= Panel1.#Margin.bottom
		Panel1.Event OnReposition(hdwp,ref panelRect)
		xpos = panelRect.right + Panel1.#Margin.right
	end if
	if SplitBar.Visible then
		SplitBar.rcPaint.left =  xpos
		SplitBar.rcPaint.top = rcClient.top
		SplitBar.rcPaint.right = SplitBar.rcPaint.left + splitBarSize
		SplitBar.rcPaint.bottom = rcClient.bottom
		if ExpandButton.Visible then
			ExpandButton.rcPaint.left = SplitBar.rcPaint.left
			ExpandButton.rcPaint.top = SplitBar.rcPaint.top + (SplitBar.rcPaint.bottom - SplitBar.rcPaint.top - COLLAPSEDBTNHEIGHT) / 2
			ExpandButton.rcPaint.right = SplitBar.rcPaint.right
			ExpandButton.rcPaint.bottom = ExpandButton.rcPaint.top + COLLAPSEDBTNHEIGHT
		end if
		xpos = SplitBar.rcPaint.right
	end if
	if Panel2.#Visible and Not Panel2.#Collapsed then
		panelRect = rcClient
		panelRect.left =  xpos
		panelRect.right = panelRect.left + panelSize2
		//Offset margin
		panelRect.left += Panel2.#Margin.left
		panelRect.top += Panel2.#Margin.top
		panelRect.right -= Panel2.#Margin.right
		panelRect.bottom -= Panel2.#Margin.bottom
		Panel2.Event OnReposition(ref hdwp,ref panelRect)
	end if
else
	if Panel1.#Visible and Not Panel1.#Collapsed then
		panelRect.bottom = panelRect.top + panelSize1
		//Offset margin
		panelRect.left += Panel1.#Margin.left
		panelRect.top += Panel1.#Margin.top
		panelRect.right -= Panel1.#Margin.right
		panelRect.bottom -= Panel1.#Margin.bottom
		Panel1.Event OnReposition(ref hdwp,ref panelRect)
		ypos = panelRect.bottom + Panel1.#Margin.bottom
	end if
	if SplitBar.Visible then
		SplitBar.rcPaint.left =  rcClient.left
		SplitBar.rcPaint.top = ypos
		SplitBar.rcPaint.right = rcClient.right
		SplitBar.rcPaint.bottom = SplitBar.rcPaint.top + splitBarSize
		if ExpandButton.Visible then
			ExpandButton.rcPaint.left = SplitBar.rcPaint.left + (SplitBar.rcPaint.right - SplitBar.rcPaint.left - COLLAPSEDBTNWIDTH) / 2
			ExpandButton.rcPaint.top = SplitBar.rcPaint.top
			ExpandButton.rcPaint.right = ExpandButton.rcPaint.left + COLLAPSEDBTNWIDTH
			ExpandButton.rcPaint.bottom = SplitBar.rcPaint.bottom
		end if
		ypos = SplitBar.rcPaint.bottom
	end if
	if Panel2.#Visible and Not Panel2.#Collapsed then
		panelRect = rcClient
		panelRect.top = ypos
		panelRect.bottom = panelRect.top + panelSize2
		//Offset margin
		panelRect.left += Panel2.#Margin.left
		panelRect.top += Panel2.#Margin.top
		panelRect.right -= Panel2.#Margin.right
		panelRect.bottom -= Panel2.#Margin.bottom
		Panel2.Event OnReposition(ref hdwp,ref panelRect)
	end if
end if

return 0
end event

event type long onpaint(unsignedlong hdc);ulong dcState

if of_IsLockUpdate() then return 1

dcState = Painter.SaveDC(hdc)
Painter.IntersectClipRect(hdc,ref rcClient)

if SplitBar.Visible then
	if ExpandButton.Visible then
		_of_DrawExpandButton(hdc)
	end if
	Painter.ExcludeClipRect(hdc,ref SplitBar.rcPaint)
end if

if Panel1.#Visible and Not Panel1.#Collapsed then
	Panel1.Event OnPaint(hdc)
end if
if Panel2.#Visible and Not Panel2.#Collapsed then
	Panel2.Event OnPaint(hdc)
end if

Painter.RestoreDC(hdc,dcState)

return 1
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);int index

if _mouseCapturedIndex > 0 then
	choose case _mouseCapturedIndex
		case 1
			return Panel1.Event OnMouseMove(vkey,xpos,ypos)
		case 2
			return Panel2.Event OnMouseMove(vkey,xpos,ypos)
	end choose
end if

if SplitBar.Visible then
	if Not SplitBar.MouseDown then
		if ExpandButton.Visible then
			if Painter.PtInRect(ref ExpandButton.rcPaint,xpos,ypos) then
				if Not ExpandButton.MouseOver then
					ExpandButton.MouseOver = true
					_of_DrawExpandButton(true)
					if #Orientation = Enums.VERT then
						if Panel1.#Collapsed then
							_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_EXPANDLEFT))
						else
							_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_EXPANDRIGHT))
						end if
					else
						if Panel1.#Collapsed then
							_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_EXPANDTOP))
						else
							_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_EXPANDBOTTOM))
						end if
					end if
				end if
			else
				if ExpandButton.MouseOver then
					ExpandButton.MouseOver = false
					_of_DrawExpandButton(true)
					_of_ShowTip("")
				end if
			end if
		end if
	end if
	
	if Not ExpandButton.MouseOver and Not ExpandButton.MouseDown then
		if _of_IsSplitBarDragable() then
			SplitBar.MouseOver = Painter.PtInRect(ref SplitBar.rcPaint,xpos,ypos)
			if SplitBar.MouseOver or SplitBar.MouseDown then
				if #Orientation = Enums.VERT then
					if #ParentSplitContainer.Pointer <> CUR_VSPLIT then
						#ParentSplitContainer.Pointer = CUR_VSPLIT
					end if
				else
					if #ParentSplitContainer.Pointer <> CUR_HSPLIT then
						#ParentSplitContainer.Pointer = CUR_HSPLIT
					end if
				end if
			else
				if #ParentSplitContainer.Pointer <> CUR_ARROW then
					#ParentSplitContainer.Pointer = CUR_ARROW
				end if
			end if
		else
			if #ParentSplitContainer.Pointer <> CUR_ARROW then
				#ParentSplitContainer.Pointer = CUR_ARROW
			end if
		end if
		if (Not SplitBar.MouseDown and vKey <> WinMsg.MK_LBUTTON) and (Panel1.#Collapsible or Panel2.#Collapsible) then
			if Painter.PtInRect(ref SplitBar.rcPaint,xpos,ypos) then
				if Panel1.#Collapsed or Panel2.#Collapsed then
					if #Orientation = Enums.VERT then
						if Panel1.#Collapsed then
							_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_DBCLKEXPANDLEFT))
						else
							_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_DBCLKEXPANDRIGHT))
						end if
					else
						if Panel1.#Collapsed then
							_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_DBCLKEXPANDTOP))
						else
							_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_DBCLKEXPANDBOTTOM))
						end if
					end if
				else
					if Panel1.#Collapsible and Panel2.#Collapsible then
						if #Orientation = Enums.VERT then
							if ypos < SplitBar.rcPaint.top + (SplitBar.rcPaint.bottom - SplitBar.rcPaint.top) / 2 then
								_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_DBCLKCOLLAPSELEFT))
							else
								_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_DBCLKCOLLAPSERIGHT))
							end if
						else
							if xpos < SplitBar.rcPaint.left + (SplitBar.rcPaint.right - SplitBar.rcPaint.left) / 2 then
								_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_DBCLKCOLLAPSETOP))
							else
								_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_DBCLKCOLLAPSEBOTTOM))
							end if
						end if
					elseif Panel1.#Collapsible then
						if #Orientation = Enums.VERT then
							_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_DBCLKCOLLAPSELEFT))
						else
							_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_DBCLKCOLLAPSETOP))
						end if
					elseif Panel2.#Collapsible then
						if #Orientation = Enums.VERT then
							_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_DBCLKCOLLAPSERIGHT))
						else
							_of_ShowTip(I18N(Enums.I18N_CAT_SPLITCONTAINER,TIP_DBCLKCOLLAPSEBOTTOM))
						end if
					end if
				end if
			end if
		end if
	else
		if #ParentSplitContainer.Pointer <> CUR_ARROW then
			#ParentSplitContainer.Pointer = CUR_ARROW
		end if
	end if
end if

if _MouseCaptured then return 0

if Panel1.#Visible and Not Panel1.#Collapsed then
	if Panel1.Event OnHitTest(xpos,ypos) > 0 then
		index = 1
	end if
end if

if index = 0 then
	if Panel2.#Visible and Not Panel2.#Collapsed then
		if Panel2.Event OnHitTest(xpos,ypos) > 0 then
			index = 2
		end if
	end if
end if

if index <> _mouseOverIndex then
	if _mouseOverIndex > 0 then
		choose case _mouseOverIndex
			case 1
				Panel1.Event OnMouseLeave()
			case 2
				Panel2.Event OnMouseLeave()
		end choose
	end if
	_mouseOverIndex = index
	choose case _mouseOverIndex
		case 1
			Panel1.Event OnMouseMove(vkey,xpos,ypos)
		case 2
			Panel2.Event OnMouseMove(vkey,xpos,ypos)
	end choose
elseif _mouseOverIndex > 0 then
	choose case _mouseOverIndex
		case 1
			Panel1.Event OnMouseMove(vkey,xpos,ypos)
		case 2
			Panel2.Event OnMouseMove(vkey,xpos,ypos)
	end choose
end if

return 0
end event

event onmouseleave();if SplitBar.MouseOver then
	SplitBar.MouseOver = false
	if #ParentSplitContainer.Pointer <> CUR_ARROW then
		#ParentSplitContainer.Pointer = CUR_ARROW
	end if
end if

if ExpandButton.MouseOver then
	ExpandButton.MouseOver = false
	_of_DrawExpandButton(true)
end if

_of_ShowTip("")

if _mouseOverIndex > 0 then
	choose case _mouseOverIndex
		case 1
			Panel1.Event OnMouseLeave()
		case 2
			Panel2.Event OnMouseLeave()
	end choose
	_mouseOverIndex = 0
end if
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);if _mouseOverIndex > 0 then
	choose case _mouseOverIndex
		case 1
			return Panel1.Event OnLButtonDown(vkey,xpos,ypos)
		case 2
			return Panel2.Event OnLButtonDown(vkey,xpos,ypos)
	end choose
end if

_of_ShowTip("")

if ExpandButton.MouseOver then
	ExpandButton.MouseDown = true
	_of_DrawExpandButton(false)
	_of_CaptureMouse(true)
	return 0
end if

if SplitBar.MouseOver then
	if IsAllowed(#ParentSplitContainer.Event OnSplitBarBeginMove(this)) then
		SplitBar.MouseDown = true
		_of_CaptureMouse(true)
		if #ParentSplitContainer.#TrackMouseResize then
			_lastMousePoint.x = xpos
			_lastMousePoint.y = ypos
			Timer.Start(TM_TRACKRESIZE,TMI_TRACKRESIZE)
		else
			_mouseDownPoint.x = xpos
			_mouseDownPoint.y = ypos
		end if
	end if
end if

return 0
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);if _mouseOverIndex > 0 then
	choose case _mouseOverIndex
		case 1
			return Panel1.Event OnLButtonDBLClk(vkey,xpos,ypos)
		case 2
			return Panel2.Event OnLButtonDBLClk(vkey,xpos,ypos)
	end choose
else
	if Panel1.#Collapsible or Panel2.#Collapsible then
		if SplitBar.Visible and Painter.PtInRect(SplitBar.rcPaint,xpos,ypos) then
			if Panel1.#Collapsed then
				Panel1.of_SetCollapsed(false,true)
				return 0
			elseif Panel2.#Collapsed then
				Panel2.of_SetCollapsed(false,true)
				return 0
			end if
			if Panel1.#Collapsible and Panel2.#Collapsible then
				if #Orientation = Enums.VERT then
					if ypos < SplitBar.rcPaint.top + (SplitBar.rcPaint.bottom - SplitBar.rcPaint.top) / 2 then
						Panel1.of_SetCollapsed(true,true)
					else
						Panel2.of_SetCollapsed(true,true)
						return 0
					end if
				else
					if xpos < SplitBar.rcPaint.left + (SplitBar.rcPaint.right - SplitBar.rcPaint.left) / 2 then
						Panel1.of_SetCollapsed(true,true)
					else
						Panel2.of_SetCollapsed(true,true)
					end if
				end if
				return 0
			elseif Panel1.#Collapsible then
				Panel1.of_SetCollapsed(true,true)
				return 0
			elseif Panel2.#Collapsible then
				Panel2.of_SetCollapsed(true,true)
				return 0
			end if
		end if
	end if
	return Event OnLButtonDown(vkey,xpos,ypos)
end if
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);real offsetSize

if _mouseCapturedIndex > 0 then
	choose case _mouseCapturedIndex
		case 1
			return Panel1.Event OnLButtonUp(vkey,xpos,ypos)
		case 2
			return Panel2.Event OnLButtonUp(vkey,xpos,ypos)
	end choose
end if
if _mouseOverIndex > 0 then
	choose case _mouseOverIndex
		case 1
			return Panel1.Event OnLButtonUp(vkey,xpos,ypos)
		case 2
			return Panel2.Event OnLButtonUp(vkey,xpos,ypos)
	end choose
end if

if Not _MouseCaptured then return 0

_of_CaptureMouse(false)

if ExpandButton.MouseDown then
	ExpandButton.MouseDown = false
	_of_DrawExpandButton(true)
	if ExpandButton.MouseOver then
		if Panel1.#Collapsed then
			Panel1.of_SetCollapsed(false,true)
		else
			Panel2.of_SetCollapsed(false,true)
		end if
	end if
	return 0
end if

if SplitBar.MouseDown then
	SplitBar.MouseDown = false
	if Not #ParentSplitContainer.#TrackMouseResize then
		if #Orientation = Enums.VERT then
			offsetSize = _of_AdjustSplitterOffsetSize(xpos - _mouseDownPoint.x)
		else
			offsetSize = _of_AdjustSplitterOffsetSize(ypos - _mouseDownPoint.y)
		end if
		if offsetSize <> 0 then
			Event OnSplitBarMoved(this,offsetSize,0)
		end if
	else
		Timer.Stop(TM_TRACKRESIZE)
	end if
	#ParentSplitContainer.Event OnSplitBarEndMove(this)
end if

return 0
end event

event oncapturechanged();if _mouseCapturedIndex > 0 then
	choose case _mouseCapturedIndex
		case 1
			Panel1.Event OnCaptureChanged()
		case 2
			Panel2.Event OnCaptureChanged()
	end choose
elseif _MouseCaptured then
	_of_CaptureMouse(false)
	if ExpandButton.MouseDown then
		ExpandButton.MouseDown = false
		_of_DrawExpandButton(true)
	end if
	if SplitBar.MouseDown then
		SplitBar.MouseDown = false
		if #ParentSplitContainer.#TrackMouseResize then
			Timer.Stop(TM_TRACKRESIZE)
		end if
		#ParentSplitContainer.Event OnSplitBarEndMove(this)
	end if
	Event OnMouseLeave()
end if
end event

event type boolean ontimer(unsignedinteger id);boolean bContinue

if id = TM_TRACKRESIZE then
	real offsetSize
	RECTF wndRect
	POINTF pt
	
	Painter.GetWindowRect(#ParentSplitContainer.#Handle,ref wndRect)
	Painter.GetCursorPos(ref pt)
	
	pt.x -= wndRect.left
	pt.y -= wndRect.top

	if #Orientation = Enums.VERT then
		offsetSize = _of_AdjustSplitterOffsetSize(pt.x - _lastMousePoint.x)
		_lastMousePoint.x += offsetSize
		_lastMousePoint.y = pt.y
	else
		offsetSize = _of_AdjustSplitterOffsetSize(pt.y - _lastMousePoint.y)
		_lastMousePoint.x = pt.x
		_lastMousePoint.y += offsetSize
	end if
	
	if offsetSize <> 0 then
		Event OnSplitBarMoved(this,offsetSize,0)
	end if
	bContinue = true
end if

return bContinue
end event

event type long onhittest(real xpos, real ypos);if Not #Visible then return HTNOWHERE

if Painter.PtInRect(ref rcClient,xpos,ypos) then
	return HTVALID
else
	return HTNOWHERE
end if
end event

event type long onnotify(n_cst_splitcontainer_panel childpanel, long notifycode, long command);//来自子控件的消息
choose case NotifyCode
	case NCD_UPDATEPOINTS
		of_UpdatePoints()
	case NCD_SETCAPTURE
		if childPanel = Panel1 then
			if command = 1 then
				_mouseCapturedIndex = 1
				_of_CaptureMouse(true)
			else
				_mouseCapturedIndex = 0
				_of_CaptureMouse(false)
			end if
		elseif childPanel = Panel2 then
			if command = 1 then
				_mouseCapturedIndex = 2
				_of_CaptureMouse(true)
			else
				_mouseCapturedIndex = 0
				_of_CaptureMouse(false)
			end if
		end if
	case NCD_VISIBLECHANGED
		SplitBar.Visible = (Panel1.#Visible and Panel2.#Visible)
		if Not SplitBar.Visible then
			if SplitBar.MouseOver then
				SplitBar.MouseOver = false
				if #ParentSplitContainer.Pointer <> CUR_ARROW then
					#ParentSplitContainer.Pointer = CUR_ARROW
				end if
			end if
		end if
		of_UpdatePoints()
	case NCD_COLLAPSEDCHANGED
		ExpandButton.Visible = (command = 1)
		SplitBar.Enabled = (command = 0)
		if Not SplitBar.Enabled then
			if #ParentSplitContainer.Pointer <> CUR_ARROW then
				#ParentSplitContainer.Pointer = CUR_ARROW
			end if
		end if
		if SplitBar.Visible then
			of_UpdatePoints()
		end if
	case NCD_COLLAPSIBLECHANGED
end choose

return 0
end event

event type boolean oninitdata(unsignedinteger orientation);choose case Orientation
	case Enums.HORZ,Enums.VERT
		#Orientation = orientation
		_orgOrientation = orientation
	case else
		return false
end choose

return true
end event

event type long onvisiblechanged(boolean visible);_layoutChanged = true
Panel1.Event OnVisibleChanged(Panel1.of_IsVisible())
Panel2.Event OnVisibleChanged(Panel2.of_IsVisible())
return 0
end event

event type long onerasebkgnd(unsignedlong hdc);if #ParentSplitContainer.#Transparent then
	#ParentSplitContainer.FillParentBkgnd(hdc)
end if

#ParentSplitContainer.Event OnEraseBkgnd(hdc)

return 1
end event

event onsplitbarmoved(n_cst_splitcontainer splitcontainer, real offset, integer index);real fScale1 = 1,fScale2 = 1

if Panel1.#Size < 1 then
	if splitcontainer = this then
		Panel1.Event OnSplitBarMoved(splitcontainer,offset,1)
	else
		if splitcontainer.#Orientation = #Orientation then
			fScale1 = Panel1.#Size
			if Panel1.#Size = -1 then
				if Panel2.#Size < 1 and Not Panel2.#Fixed then
					if Panel2.#Size = -1 then
						fScale1 = 0.5
					else
						fScale1 = 1 - Panel2.#Size
					end if
				else
					fScale1 = 1
				end if
			end if
		end if
		if Not Panel1.#Fixed or splitcontainer.#Orientation <> #Orientation then
			Panel1.Event OnSplitBarMoved(splitcontainer,offset * fScale1,index)
		end if
	end if
end if
if Panel2.#Size < 1 then
	if splitcontainer = this then
		Panel2.Event OnSplitBarMoved(splitcontainer,offset,2)
	else
		if splitcontainer.#Orientation = #Orientation then
			fScale2 = Panel2.#Size
			if fScale2 = -1 then
				if Panel1.#Size < 1 and Not Panel1.#Fixed then
					if Panel1.#Size = -1 then
						fScale2 = 0.5
					else
						fScale2 = 1 - Panel1.#Size
					end if
				else
					fScale2 = 1
				end if
			end if
		end if
		if Not Panel2.#Fixed or splitcontainer.#Orientation <> #Orientation then
			Panel2.Event OnSplitBarMoved(splitcontainer,offset * fScale2,index)
		end if
	end if
end if

if splitcontainer = this then
	_splitterOffsetSize = _realSplitterOffsetSize + offset
	of_UpdatePoints()
	#ParentSplitContainer.Event OnSplitBarMoved(this,offset)
elseif splitcontainer.#Orientation = #Orientation then
	if Panel1.#Size < 1 and Panel2.#Size < 1 and Panel1.#Fixed <> Panel2.#Fixed then
		if Panel1.#Fixed then
			if index = 1 then
				_splitterOffsetSize = _splitterOffsetSize - offset * fScale1
			else
				_splitterOffsetSize = _splitterOffsetSize + offset * fScale1
			end if
		elseif Panel2.#Fixed then
			if index = 2 then
				_splitterOffsetSize = _splitterOffsetSize - offset * fScale2
			else
				_splitterOffsetSize = _splitterOffsetSize + offset * fScale2
			end if
		end if
	end if
end if
end event

event oncheckhiddenstatus();Panel1.Event OnCheckHiddenStatus()
Panel2.Event OnCheckHiddenStatus()
end event

public function integer of_getobjectcount ();return Panel1.of_GetObjectCount() + Panel2.of_GetObjectCount()
end function

private subroutine _of_capturemouse (readonly boolean capture);if _MouseCaptured = capture then return

_MouseCaptured = capture

if _isRoot then
	if capture then
		Win32.SetCapture(#ParentSplitContainer.#Handle)
	else
		Win32.ReleaseCapture()
	end if
else
	if capture then
		#ParentPanel.Event OnNotify(this,NCD_SETCAPTURE,1)
	else
		#ParentPanel.Event OnNotify(this,NCD_SETCAPTURE,0)
	end if
end if
end subroutine

public function long of_updatepoints ();ulong hdwp
RECTF newRect

_layoutChanged = true

if of_IsLockUpdate() then return RetCode.FAILED
if Not of_IsVisible() then return RetCode.OK

if _isRoot then
	#ParentSplitContainer.of_GetClientRect(ref newRect)
else
	newRect = rcClient
end if

Painter.SetRectEmpty(ref rcClient)

hdwp = Win32.BeginDeferWindowPos(of_GetObjectCount())

Event OnReposition(ref hdwp,ref newRect)

of_Redraw(false)

Win32.EndDeferWindowPos(hdwp)

return RetCode.OK
end function

public function long of_setorientation (readonly unsignedinteger orientation);if #Orientation = orientation then return RetCode.OK

choose case Orientation
	case Enums.HORZ,Enums.VERT
		
		#Orientation = orientation
		of_UpdatePoints()
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function boolean of_isvisible ();if Not #Visible then return false
if _isRoot then return #Visible

return #ParentPanel.of_IsVisible()
end function

public function long of_setvisible (readonly boolean visible);boolean bVisibleStatus

if #Visible = visible then return RetCode.OK

bVisibleStatus = of_IsVisible()

#Visible = visible

if _isRoot then
	of_UpdatePoints()
else
	if #Visible then
		#ParentPanel.Event OnNotify(this,NCD_VISIBLECHANGED,1)
	else
		#ParentPanel.Event OnNotify(this,NCD_VISIBLECHANGED,0)
	end if
end if

if bVisibleStatus <> of_IsVisible() then
	Event OnVisibleChanged(of_IsVisible())
end if

return RetCode.OK
end function

public function unsignedlong of_getsafedc ();ulong safeDC

if of_IsLockUpdate() then return 0
if Not of_IsVisible() then return 0

safeDC = #ParentSplitContainer.of_GetSafeDC()

Painter.IntersectClipRect(safeDC,rcClient)
if SplitBar.Visible then
	Painter.ExcludeClipRect(safeDC,ref SplitBar.rcPaint)
end if

return safeDC
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime);return #ParentSplitContainer.of_ReleaseDC(hdc,hrgn,fadeTime)
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation);return #ParentSplitContainer.of_ReleaseDC(hdc,hrgn,fadeAnimation)
end function

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC

if of_IsLockUpdate() then return RetCode.FAILED
if Not of_IsVisible() then return RetCode.OK

safeDC = #ParentSplitContainer.of_GetSafeDC()

if safeDC > 0 then
	
	Painter.IntersectClipRect(safeDC,rcClient)
	
	Event OnEraseBkgnd(safeDC)
	Event OnPaint(safeDC)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(rcClient)
	
	#ParentSplitContainer.of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
	
end if

return RetCode.OK
end function

private function boolean _of_issplitbardragable ();if Not SplitBar.Enabled then return false
if _isRoot then return #ParentSplitContainer.#SplitBarDragable

return #SplitBarDragable
end function

public function boolean of_islockupdate ();if #LockUpdate then return true
if _isRoot then return #ParentSplitContainer.#LockUpdate

return #ParentPanel.of_IsLockUpdate()
end function

public function string of_savelayout (readonly long flags);String sLayoutInfo,sPanelLayoutInfo
n_cst_splitcontainer subSplitContainer
Constant String DELIMITER = ","

if flags = 0 then return ""

sLayoutInfo = String(flags) + ":"

if BitAND(flags,LAY_ORIENTATION) <> 0 then
	sLayoutInfo += String(#Orientation) + DELIMITER
end if
if BitAND(flags,LAY_SPLITBAR) <> 0 then
	sLayoutInfo += String(Long(_realSplitterOffsetSize)) + DELIMITER
end if
if BitAND(flags,LAY_PANELVISIBLE) <> 0 then
	sLayoutInfo += iif(Panel1.#Visible,"1","0") + DELIMITER + iif(Panel2.#Visible,"1","0") + DELIMITER
end if
if BitAND(flags,LAY_PANELCOLLAPSED) <> 0 then
	sLayoutInfo += iif(Panel1.#Collapsed,"1","0") + DELIMITER + iif(Panel2.#Collapsed,"1","0") + DELIMITER
end if
if sLayoutInfo = "" then return ""

if IsSucceeded(Panel1.of_GetSplitContainer(ref subSplitContainer)) then
	sPanelLayoutInfo = subSplitContainer.of_SaveLayout(flags)
	if sPanelLayoutInfo <> "" then
		sLayoutInfo += sPanelLayoutInfo + DELIMITER
	end if
end if
if IsSucceeded(Panel2.of_GetSplitContainer(ref subSplitContainer)) then
	sPanelLayoutInfo = subSplitContainer.of_SaveLayout(flags)
	if sPanelLayoutInfo <> "" then
		sLayoutInfo += sPanelLayoutInfo
	end if
end if

if Right(sLayoutInfo,1) = DELIMITER then
	sLayoutInfo = Left(sLayoutInfo,Len(sLayoutInfo) - 1)
end if

return sLayoutInfo
end function

public function string of_savelayout ();return of_SaveLayout(LAY_SPLITBAR + LAY_PANELCOLLAPSED)
end function

public function long of_resetlayout (readonly long flags);n_cst_splitcontainer subSplitContainer

if flags = 0 then return RetCode.E_INVALID_ARGUMENT

if BitAND(flags,LAY_ORIENTATION) <> 0 then
	#Orientation = _orgOrientation
end if

if BitAND(flags,LAY_SPLITBAR) <> 0 then
	_splitterOffsetSize = 0
end if

if BitAND(flags,LAY_PANELVISIBLE) <> 0 then
	Panel1.of_SetVisible(true)
	Panel2.of_SetVisible(true)
end if

if BitAND(flags,LAY_PANELCOLLAPSED) <> 0 then
	Panel1.of_SetCollapsed(false)
	Panel2.of_SetCollapsed(false)
end if

if IsSucceeded(Panel1.of_GetSplitContainer(ref subSplitContainer)) then
	subSplitContainer.of_ResetLayout(flags)
end if
if IsSucceeded(Panel2.of_GetSplitContainer(ref subSplitContainer)) then
	subSplitContainer.of_ResetLayout(flags)
end if

of_UpdatePoints()

return RetCode.OK
end function

public function long of_resetlayout ();return of_ResetLayout(LAY_SPLITBAR + LAY_PANELCOLLAPSED)
end function

private subroutine _of_drawexpandbutton (readonly unsignedlong hdc);int imageIndex
ulong borderColor,bkColor,arrowColor,nState
POINT pt1,pt2,pt3

if Not ExpandButton.Visible then return

if ExpandButton.MouseOver then nState += Enums.STATE_HOVER
if ExpandButton.MouseDown then nState += Enums.STATE_PRESSED

arrowColor	= theme.of_GetColor(theme.CLR_ARROW,nState)

if BitAND(nState,Enums.STATE_HOVER + Enums.STATE_PRESSED) <> 0 then
	bkColor = theme.of_GetColor(theme.CLR_COLLAPSEBUTTONBKGND,nState)
	borderColor	= theme.of_GetColor(theme.CLR_COLLAPSEBUTTONBORDER,nState)
	Painter.ThemeFill(hdc,ExpandButton.rcPaint,bkColor,theme.#BkgndOrientation,theme.#ItemBkgndStyle,nState,false,&
						theme.#ItemBorderStyle,borderColor,theme.#ItemRoundSize)
end if

if #Orientation = Enums.VERT then
	if Panel1.#Collapsed then
		imageIndex = __Idx_ExpandLeft
	else
		imageIndex = __Idx_ExpandRight
	end if
else
	if Panel1.#Collapsed then
		imageIndex = __Idx_ExpandTop
	else
		imageIndex = __Idx_ExpandBottom
	end if
end if

if ExpandButton.MouseDown then
	__ImageList.Draw(imageIndex,hdc,&
							ExpandButton.rcPaint.left + (ExpandButton.rcPaint.right - ExpandButton.rcPaint.left - ICONSIZE) / 2,&
							ExpandButton.rcPaint.top + (ExpandButton.rcPaint.bottom - ExpandButton.rcPaint.top - ICONSIZE) / 2 + 1,&
							false)
else
	__ImageList.Draw(imageIndex,hdc,&
							ExpandButton.rcPaint.left + (ExpandButton.rcPaint.right - ExpandButton.rcPaint.left - ICONSIZE) / 2,&
							ExpandButton.rcPaint.top + (ExpandButton.rcPaint.bottom - ExpandButton.rcPaint.top - ICONSIZE) / 2,&
							false)
end if
end subroutine

private subroutine _of_drawexpandbutton (readonly boolean fadeanimation);ulong safeDC

if #LockUpdate then return
if Not ExpandButton.Visible then return

safeDC = #ParentSplitContainer.of_GetSafeDC()

Painter.IntersectClipRect(safeDC,rcClient)
Painter.IntersectClipRect(safeDC,ExpandButton.rcPaint)

Event OnEraseBkgnd(safeDC)

_of_DrawExpandButton(safeDC)

Painter.SelectClipRgn(safeDC,0)

ulong hUpdateRgn

hUpdateRgn = Painter.CreateRectRgn(ExpandButton.rcPaint)

#ParentSplitContainer.of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)

Painter.DeleteRgn(hUpdateRgn)
end subroutine

private subroutine _of_showtip (readonly string tiptext);if _TTID = 0 then return
if Not IsValidObject(_ToolTip) then return
if _currTipText = tipText then return

_currTipText = tipText

if tipText <> "" then
	_ToolTip.UpdateTipText(#ParentSplitContainer.#Handle,_TTID,tipText)
	_ToolTip.UpdateToolRect(#ParentSplitContainer.#Handle,_TTID,SplitBar.rcPaint.Left,SplitBar.rcPaint.Top,SplitBar.rcPaint.Right,SplitBar.rcPaint.Bottom)
else
	_ToolTip.UpdateToolRect(#ParentSplitContainer.#Handle,_TTID,0,0,0,0)
end if
end subroutine

public function long of_findpanelbyobject (readonly windowobject object, ref n_cst_splitcontainer_panel panel);if Panel1.of_FindPanelByObject(object,ref panel) = RetCode.OK then return RetCode.OK
return Panel2.of_FindPanelByObject(object,ref panel)
end function

public function long of_findpanelbytitle (readonly string title, ref n_cst_splitcontainer_panel panel);if Panel1.of_FindPanelByTitle(title,ref panel) = RetCode.OK then return RetCode.OK
return Panel2.of_FindPanelByTitle(title,ref panel)
end function

public function long of_findpanelbytag (readonly string tag, ref n_cst_splitcontainer_panel panel);if Panel1.of_FindPanelByTag(tag,ref panel) = RetCode.OK then return RetCode.OK
return Panel2.of_FindPanelByTag(tag,ref panel)
end function

public function long of_getclientrect (ref rectf clientrect);clientRect = rcClient
return RetCode.OK
end function

public function long of_setsplitbarsize (readonly real size);long rtCode
n_cst_splitcontainer_theme newTheme

if #SplitBarSize = size then return RetCode.OK

#SplitBarSize = size

of_UpdatePoints()

return RetCode.OK
end function

public function real of_getsplitteroffsetsize ();return _realSplitterOffsetSize
end function

public function long of_setsplitteroffsetsize (readonly real offsetsize);real nOffsetSize

nOffsetSize = _of_AdjustSplitterOffsetSize(offsetSize)
if nOffsetSize <> _realSplitterOffsetSize then
	_splitterOffsetSize = nOffsetSize
	of_UpdatePoints()
end if

return RetCode.OK
end function

private function real _of_getsplitbarsize ();real splitBarSize

if Not SplitBar.Visible then return 0

splitBarSize = #SplitBarSize

if ExpandButton.Visible then
	if splitBarSize < EXPANDBTNSIZE then
		splitBarSize = EXPANDBTNSIZE
	end if
end if

return splitBarSize
end function

private function real _of_adjustsplitteroffsetsize (real offsetsize);real maxSize
RECTF panelRect

if #Orientation = Enums.VERT then
	maxSize = (rcClient.right - rcClient.left) - _of_GetSplitBarSize()
	if maxSize < 0 then
		maxSize = 0
	end if
	if offsetSize < 0 then
		Panel1.of_GetClientRect(ref panelRect)
		if (panelRect.right - panelRect.left) + offsetSize  < Panel1.#MinSize then
			offsetSize = -((panelRect.right - panelRect.left) - Panel1.#MinSize)
		end if
		Panel2.of_GetClientRect(ref panelRect)
		if (panelRect.right - panelRect.left) - offsetSize  > Panel2.#MaxSize then
			offsetSize = (panelRect.right - panelRect.left) - Panel2.#MaxSize
		end if
	end if
	if offsetSize > 0 then
		Panel1.of_GetClientRect(ref panelRect)
		if (panelRect.right - panelRect.left) + offsetSize  > Panel1.#MaxSize then
			offsetSize = -((panelRect.right - panelRect.left) -Panel1.#MaxSize)
		end if
		Panel2.of_GetClientRect(ref panelRect)
		if (panelRect.right - panelRect.left) - offsetSize  < Panel2.#MinSize then
			offsetSize = (panelRect.right - panelRect.left) - Panel2.#MinSize
		end if
	end if
else
	maxSize = (rcClient.bottom - rcClient.top) - _of_GetSplitBarSize()
	if maxSize < 0 then
		maxSize = 0
	end if
	if offsetSize < 0 then
		Panel1.of_GetClientRect(ref panelRect)
		if (panelRect.bottom - panelRect.top) + offsetSize  < Panel1.#MinSize then
			offsetSize = -((panelRect.bottom - panelRect.top) - Panel1.#MinSize)
		end if
	end if
	if offsetSize > 0 then
		Panel2.of_GetClientRect(ref panelRect)
		if (panelRect.bottom - panelRect.top) - offsetSize  < Panel2.#MinSize then
			offsetSize = (panelRect.bottom - panelRect.top) - Panel2.#MinSize
		end if
	end if
end if

return offsetSize
end function

public function real of_getwidth ();return rcClient.right - rcClient.left
end function

public function real of_getheight ();return rcClient.bottom - rcClient.top
end function

public function long _of_loadlayout (readonly string slayoutinfo, readonly boolean test);Long nLength,nPos,nStartPos,nLastPos
Long nFlags,nValOrientation,nValSptOffsetSize,nValPanelVisible1,nValPanelVisible2,nValPCollapsed1,nValPCollapsed2
n_cst_splitcontainer subSplitContainer
Constant String DELIMITER = ","

if IsNull(sLayoutInfo) or Len(sLayoutInfo) = 0 then return RetCode.E_INVALID_ARGUMENT

nPos = Pos(sLayoutInfo,":")
if nPos = 0 then return RetCode.E_INVALID_ARGUMENT
nFlags = Long(Left(sLayoutInfo,nPos - 1))
if nFlags = 0 then return RetCode.E_INVALID_ARGUMENT

nLastPos = nPos
nLength = Len(sLayoutInfo)

if BitAND(nFlags,LAY_ORIENTATION) <> 0 then
	nStartPos = nLastPos + 1
	if nStartPos > nLength then return RetCode.E_INVALID_ARGUMENT
	nPos = Pos(sLayoutInfo,DELIMITER,nStartPos)
	if nPos = nStartPos then return RetCode.E_INVALID_ARGUMENT
	if nPos = 0 then	//End of string
		nPos = nLength + 1
	end if
	nValOrientation = Long(Mid(sLayoutInfo,nStartPos,nPos - nStartPos))
	nLastPos = nPos
end if

if BitAND(nFlags,LAY_SPLITBAR) <> 0 then
	nStartPos = nLastPos + 1
	if nStartPos > nLength then return RetCode.E_INVALID_ARGUMENT
	nPos = Pos(sLayoutInfo,DELIMITER,nStartPos)
	if nPos = nStartPos then return RetCode.E_INVALID_ARGUMENT
	if nPos = 0 then
		nPos = nLength + 1
	end if
	nValSptOffsetSize = Long(Mid(sLayoutInfo,nStartPos,nPos - nStartPos))
	nLastPos = nPos
end if

if BitAND(nFlags,LAY_PANELVISIBLE) <> 0 then
	nStartPos = nLastPos + 1
	if nStartPos > nLength then return RetCode.E_INVALID_ARGUMENT
	nPos = Pos(sLayoutInfo,DELIMITER,nStartPos)
	if nPos = nStartPos then return RetCode.E_INVALID_ARGUMENT
	if nPos = 0 then
		nPos = nLength + 1
	end if
	nValPanelVisible1 = Long(Mid(sLayoutInfo,nStartPos,nPos - nStartPos))
	nLastPos = nPos
	nStartPos = nLastPos + 1
	if nStartPos > nLength then return RetCode.E_INVALID_ARGUMENT
	nPos = Pos(sLayoutInfo,DELIMITER,nStartPos)
	if nPos = nStartPos then return RetCode.E_INVALID_ARGUMENT
	if nPos = 0 then
		nPos = nLength + 1
	end if
	nValPanelVisible2 = Long(Mid(sLayoutInfo,nStartPos,nPos - nStartPos))
	nLastPos = nPos
end if

if BitAND(nFlags,LAY_PANELCOLLAPSED) <> 0 then
	nStartPos = nLastPos + 1
	if nStartPos > nLength then return RetCode.E_INVALID_ARGUMENT
	nPos = Pos(sLayoutInfo,DELIMITER,nStartPos)
	if nPos = nStartPos then return RetCode.E_INVALID_ARGUMENT
	if nPos = 0 then
		nPos = nLength + 1
	end if
	nValPCollapsed1 = Long(Mid(sLayoutInfo,nStartPos,nPos - nStartPos))
	nLastPos = nPos
	nStartPos = nLastPos + 1
	if nStartPos > nLength then return RetCode.E_INVALID_ARGUMENT
	nPos = Pos(sLayoutInfo,DELIMITER,nStartPos)
	if nPos = nStartPos then return RetCode.E_INVALID_ARGUMENT
	if nPos = 0 then
		nPos = nLength + 1
	end if
	nValPCollapsed2 = Long(Mid(sLayoutInfo,nStartPos,nPos - nStartPos))
	nLastPos = nPos
end if

if IsSucceeded(Panel1.of_GetSplitContainer(ref subSplitContainer)) then
	nPos = subSplitContainer._of_LoadLayout(Mid(sLayoutInfo,nLastPos + 1),test)
	if nPos < 0 then return RetCode.E_INVALID_ARGUMENT
	nLastPos += nPos
end if
if IsSucceeded(Panel2.of_GetSplitContainer(ref subSplitContainer)) then
	nPos = subSplitContainer._of_LoadLayout(Mid(sLayoutInfo,nLastPos + 1),test)
	if nPos < 0 then return RetCode.E_INVALID_ARGUMENT
	nLastPos += nPos
end if

if Not test then
	if BitAND(nFlags,LAY_ORIENTATION) <> 0 then
		if nValOrientation = Enums.VERT then
			#Orientation = Enums.VERT
		else
			#Orientation = Enums.HORZ
		end if
	end if
	if BitAND(nFlags,LAY_SPLITBAR) <> 0 and #SplitBarDragable then
		_splitterOffsetSize = nValSptOffsetSize
	end if
	if BitAND(nFlags,LAY_PANELVISIBLE) <> 0 then
		Panel1.of_SetVisible(nValPanelVisible1 = 1)
		Panel2.of_SetVisible(nValPanelVisible2 = 1)
	end if
	if BitAND(nFlags,LAY_PANELCOLLAPSED) <> 0 then
		if (Panel1.#Collapsed <> (nValPCollapsed1 = 1)) or (Panel2.#Collapsed <> (nValPCollapsed2 = 1)) then
			Panel1.of_SetCollapsed(false)
			Panel2.of_SetCollapsed(false)
		end if
		Panel1.of_SetCollapsed(nValPCollapsed1 = 1)
		Panel2.of_SetCollapsed(nValPCollapsed2 = 1)
	end if
	of_UpdatePoints()
end if

if nLastPos > nLength then
	nLastPos = nLength
end if

return nLastPos
end function

public function long of_loadlayout (readonly string slayoutinfo);long rtCode

rtCode = _of_LoadLayout(sLayoutInfo,true)
if IsFailed(rtCode) then return rtCode

return _of_LoadLayout(sLayoutInfo,false)
end function

on n_cst_splitcontainer.create
call super::create
this.timer=create timer
this.panel1=create panel1
this.panel2=create panel2
TriggerEvent( this, "constructor" )
end on

on n_cst_splitcontainer.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.timer)
destroy(this.panel1)
destroy(this.panel2)
end on

event constructor;__RefCount ++
if __RefCount = 1 then
	__ImageList = Create n_imagelist
	__ImageList.SetImageSize(ICONSIZE,ICONSIZE)
	__Idx_ExpandLeft 			= __ImageList.AddImage(ICO_EXPANDLEFT)
	__Idx_ExpandTop 			= __ImageList.AddImage(ICO_EXPANDTOP)
	__Idx_ExpandRight 		= __ImageList.AddImage(ICO_EXPANDRIGHT)
	__Idx_ExpandBottom 		= __ImageList.AddImage(ICO_EXPANDBOTTOM)
end if

SplitBar.Visible = (Panel1.#Visible and Panel2.#Visible)
SplitBar.Enabled = (Not Panel1.#Collapsed and Not Panel2.#Collapsed)
ExpandButton.Visible = (Panel1.#Collapsed or Panel2.#Collapsed)
end event

event destructor;__RefCount --
if __RefCount = 0 then
	Destroy __ImageList
end if

if _TTID > 0 then
	_ToolTip.DelTool(#ParentSplitContainer.#Handle,_TTID)
end if
end event

type timer from n_timer within n_cst_splitcontainer descriptor "pb_nvo" = "true" 
end type

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

event ontimer;call super::ontimer;return Parent.Event OnTimer(id)
end event

type panel1 from n_cst_splitcontainer_panel within n_cst_splitcontainer descriptor "pb_nvo" = "true" 
end type

on panel1.create
call super::create
end on

on panel1.destroy
call super::destroy
end on

type panel2 from n_cst_splitcontainer_panel within n_cst_splitcontainer descriptor "pb_nvo" = "true" 
end type

on panel2.create
call super::create
end on

on panel2.destroy
call super::destroy
end on

