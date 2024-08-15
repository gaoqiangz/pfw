$PBExportHeader$n_cst_splitcontainer_panel.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_splitcontainer_panel from nonvisualobject
end type
type itemdata from structure within n_cst_splitcontainer_panel
end type
type titlebar from structure within n_cst_splitcontainer_panel
end type
type font from n_cst_font within n_cst_splitcontainer_panel
end type
end forward

type itemdata from structure
	boolean		iscontainer
	n_cst_splitcontainer		splitcontainer
	unsignedlong		holdparent
	windowobject		object
	boolean		isole
	boolean		objectowner
end type

type titlebar from structure
	sizef		sztitle
	integer		imageindex
	rectf		rctitle
	rectf		rcimage
	rectf		rcpaint
end type

global type n_cst_splitcontainer_panel from nonvisualobject
event oninit ( n_cst_splitcontainer parentsplitcontainer,  n_tooltip tooltip )
event type long onreposition ( ref unsignedlong hdwp,  ref rectf newrect )
event type long onpaint ( unsignedlong hdc )
event type long onmousemove ( unsignedlong vkey,  real xpos,  real ypos )
event onmouseleave ( )
event type long onlbuttondown ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttondblclk ( unsignedlong vkey,  real xpos,  real ypos )
event type long onlbuttonup ( unsignedlong vkey,  real xpos,  real ypos )
event oncapturechanged ( )
event type long onhittest ( real xpos,  real ypos )
event type long onnotify ( n_cst_splitcontainer childcontainer,  long notifycode,  long command )
event type long onvisiblechanged ( boolean visible )
event type long onerasebkgnd ( unsignedlong hdc )
event onsplitbarmoved ( n_cst_splitcontainer splitcontainer,  real offset,  integer index )
event oncheckhiddenstatus ( )
event onmakedirty ( )
font font
end type
global n_cst_splitcontainer_panel n_cst_splitcontainer_panel

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

/*--- Properties ---*/
Public:
PrivateWrite n_cst_splitcontainer	#ParentSplitContainer
PrivateWrite Boolean					#Visible					= true
Any										#Data
String										#Tag
PrivateWrite String					#Title											//标题
PrivateWrite String 					#Image										//标题栏图标
PrivateWrite Boolean					#TitleBar					= false			//标题栏
PrivateWrite Boolean					#Border					= false			//边框
PrivateWrite Boolean					#Collapsed				= false			//折叠(#Collapsible属性为true时可用)
PrivateWrite Boolean					#Fixed					= false			//拖动拆分条时固定大小
PrivateWrite Double					#Size						= -1				//大小
																							//	-1:自动大小
																							//	[0,1]:相对父容器比例
																							//	(1,max]:固定大小(dip)
PrivateWrite real						#MinSize					= 0				//最小大小(dip)
PrivateWrite real						#MaxSize				= 65535			//最大大小(dip)
PrivateWrite Boolean					#Collapsible				= false			//可折叠
PrivateWrite real						#TitleBarHeight			= 0				//标题栏高度(dip),为0时自动计算高度
PrivateWrite Alignment				#TitleAlign				= Left!			//标题栏文本对齐方向
PrivateWrite Boolean					#MultiLine				= false			//标题栏文本设置多行显示
PrivateWrite Boolean					#TitleBarFixedSize		= false			//标题栏宽度固定为内容的最大宽度
PrivateWrite Uint						#IconPosition			= Enums.LEFT	//标题栏图标的显示位置(Enums.LEFT,Enums.RIGHT)
PrivateWrite SIZEF					#IconSize									//标题栏图标大小(dip)
PrivateWrite RECTF						#Margin										//外间距(dip)
PrivateWrite RECTF						#Padding									//内间距(dip)
Boolean									#LockUpdate								//更新锁

/*--- Implementation ---*/
Private:
n_cst_splitcontainer_theme 	theme
n_imagelist						_ImageList
n_tooltip							_ToolTip
ITEMDATA						Item
TITLEBAR						TitleBar
RECTF								rcClient

Boolean _layoutChanged 	= false

/*--- Constants ---*/
//Notify code
Constant Long	NCD_UPDATEPOINTS				= 1
Constant Long	NCD_SETCAPTURE				= 2	//command:1,Set;0,Release
Constant Long	NCD_VISIBLECHANGED	 		= 3	//command:visible value
Constant Long	NCD_COLLAPSEDCHANGED		= 4	//command:collapsed value
Constant Long	NCD_COLLAPSIBLECHANGED	= 5	//command:collapsible value
Constant Long	NCD_CUSTOM						= 6
//Hit-test code
Constant Long	HTNOWHERE	= 0
Constant Long	HTVALID			= 1
//Adjust flags
Constant Uint ADJ_PADDING 			= 1
Constant Uint ADJ_TITLEBAR		 	= 2
Constant Uint ADJ_TITLEBARBORDER	= 4
Constant Uint ADJ_BORDER				= 8
//Object props
Constant String PRP_OBJECTCREATOR = "{OBJECT_CREATOR}"
end variables

forward prototypes
private function boolean _of_isobjectcreator (readonly windowobject object)
public function long of_updatepoints ()
public function long of_getobject (ref windowobject object)
public function long of_getsplitcontainer (ref n_cst_splitcontainer container)
public function long of_setsize (readonly double size)
public function long of_setvisible (readonly boolean visible)
public function integer of_getobjectcount ()
public function boolean of_isvisible ()
public function n_cst_splitcontainer of_bindsplitcontainer ()
public function long of_setcollapsible (readonly boolean collapsible)
public function n_cst_splitcontainer of_bindsplitcontainer (readonly unsignedinteger orientation)
public function boolean of_islockupdate ()
public function long of_bindobject (readonly string clsname)
public function long of_release ()
private subroutine _of_updatetextsize ()
public function long of_redraw (readonly boolean fadeanimation)
public function unsignedlong of_getsafedc ()
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation)
public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime)
private subroutine _of_drawtitle (readonly unsignedlong hdc)
private subroutine _of_drawtitlebar (readonly unsignedlong hdc)
private subroutine _of_filltitlebar (readonly unsignedlong hdc)
private subroutine _of_drawtitlebar (readonly boolean fadeanimation)
public function long of_settitle (readonly string title)
public function long of_settitlebar (readonly boolean show)
public function long of_setimage (readonly string image)
public function long of_seticonposition (readonly unsignedinteger position)
public subroutine _of_updatetitlebarpoints ()
public function long of_settitlealign (readonly alignment align)
public function boolean of_hassplitcontainer ()
public function boolean of_hasobject ()
public function long of_setmultiline (readonly boolean multiline)
public function long of_settitlebarfixedsize (readonly boolean fixed)
public function long of_findpanelbyobject (readonly windowobject object, ref n_cst_splitcontainer_panel panel)
public function long of_findpanelbytitle (readonly string title, ref n_cst_splitcontainer_panel panel)
public function long of_findpanelbytag (readonly string tag, ref n_cst_splitcontainer_panel panel)
public function long of_setborder (readonly boolean show)
public function long of_setcollapsed (readonly boolean collapsed, readonly boolean triggerevent)
public function long of_setcollapsed (readonly boolean collapsed)
public function n_cst_splitcontainer of_split (readonly unsignedinteger orientation)
public function n_cst_splitcontainer of_split ()
public function long of_bindobject (ref dragobject object)
public function long of_bindobject (readonly windowobject object)
private function boolean _of_closeuserobject (readonly dragobject object)
private function boolean _of_openuserobject (ref dragobject object, readonly string clsname)
private function boolean _of_openuserobject (ref dragobject object)
private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags)
public function long of_getclientrect (ref rectf clientrect)
private function real _of_gettitlebarfixedwidth ()
public function long of_settitlebarheight (readonly real height)
public function long of_setpadding (readonly real left, readonly real top, readonly real right, readonly real bottom)
public function long of_setminsize (readonly real minsize)
public function long of_setmaxsize (readonly real maxsize)
public function long of_setmargin (readonly real left, readonly real top, readonly real right, readonly real bottom)
private function real _of_gettitlebarheight ()
public function long of_setfixed (readonly boolean fixed)
public function real of_getwidth ()
public function real of_getheight ()
public function long of_setminmaxsize (readonly real minsize, readonly real maxsize)
public function long of_replace (ref dragobject object)
public function long of_replace (readonly windowobject object)
public function long of_replace (readonly string clsname)
end prototypes

event oninit(n_cst_splitcontainer parentsplitcontainer, n_tooltip tooltip);#ParentSplitContainer = parentSplitContainer
theme 	= #ParentSplitContainer.#ParentSplitContainer.Theme

_ToolTip = tooltip
end event

event type long onreposition(ref unsignedlong hdwp, ref rectf newrect);boolean bWidthChanged
RECTF clientRect

if Not Item.IsContainer and Not #ParentSplitContainer.#ParentSplitContainer.#AttachMode then
	if rcClient.left = newRect.left and rcClient.top = newRect.top and rcClient.right = newRect.right and rcClient.bottom = newRect.bottom and Not _layoutChanged then return 0
end if

if newRect.right - newRect.left <> rcClient.right - rcClient.left then
	bWidthChanged = true
end if

_layoutChanged = false
rcClient = newRect

if #TitleBar then
	if bWidthChanged and Not #TitleBarFixedSize then
		_of_UpdateTextSize()
	end if
end if

if of_IsLockUpdate() then return 1

if #TitleBar then
	_of_UpdateTitleBarPoints()
end if

clientRect = rcClient
_of_AdjustRect(ref clientRect,ADJ_PADDING + ADJ_TITLEBAR + ADJ_BORDER)

if Item.IsContainer then
	if Item.SplitContainer.#Visible then
		return Item.SplitContainer.Event OnReposition(ref hdwp,ref clientRect)
	end if
elseif IsValidObject(Item.Object) then
	if #ParentSplitContainer.#ParentSplitContainer.#AttachMode then
		RECTF rcRelative
		#ParentSplitContainer.#ParentSplitContainer.of_GetRelativeWindowRect(ref rcRelative)
		Painter.OffsetRect(ref clientRect,rcRelative.left,rcRelative.top)
	end if
	if Item.IsOLE then
		Item.Object.Move(D2UX(clientRect.left),D2UY(clientRect.top))
		Item.Object.Resize(D2UX(clientRect.right - clientRect.left),D2UY(clientRect.bottom - clientRect.top))
	else
		Win32.DeferWindowPos(ref hdwp,Handle(Item.Object),0,&
									D2PX(clientRect.left),D2PY(clientRect.top),&
									D2PX(clientRect.right - clientRect.left),D2PY(clientRect.bottom - clientRect.top),&
									Win32.SWP_NOZORDER + Win32.SWP_NOACTIVATE)
	end if
end if

return 0
end event

event type long onpaint(unsignedlong hdc);ulong dcState,dcState2

if of_IsLockUpdate() then return 1

dcState = Painter.SaveDC(hdc)
Painter.IntersectClipRect(hdc,ref rcClient)

if #TitleBar then
	dcState2 = Painter.SaveDC(hdc)
	Painter.IntersectClipRect(hdc,ref TitleBar.rcPaint)
	_of_DrawTitleBar(hdc)
	Painter.RestoreDC(hdc,dcState2)
	Painter.ExcludeClipRect(hdc,ref TitleBar.rcPaint)
end if

if Item.IsContainer then
	Item.SplitContainer.Event OnPaint(hdc)
end if

if #Border then
	RADIUSF rdBorder
	rdBorder = theme.#PanelRoundSize
	if #TitleBar then
		rdBorder.leftTop = 0
		rdBorder.rightTop = 0
	end if
	Painter.DrawThemeBorder(hdc,rcClient,theme.of_GetPanelColor(this,theme.CLR_BORDER,0),Enums.SOLID,theme.#PanelBorderStyle,rdBorder)
end if

Painter.RestoreDC(hdc,dcState)

return 0
end event

event type long onmousemove(unsignedlong vkey, real xpos, real ypos);if Item.IsContainer then
	return Item.SplitContainer.Event OnMouseMove(vkey,xpos,ypos)
else
	return 0
end if
end event

event onmouseleave();if Item.IsContainer then
	Item.SplitContainer.Event OnMouseLeave()
end if
end event

event type long onlbuttondown(unsignedlong vkey, real xpos, real ypos);if Item.IsContainer then
	return Item.SplitContainer.Event OnLButtonDown(vkey,xpos,ypos)
else
	return 0
end if
end event

event type long onlbuttondblclk(unsignedlong vkey, real xpos, real ypos);if Item.IsContainer then
	return Item.SplitContainer.Event OnLButtonDBLClk(vkey,xpos,ypos)
else
	return 0
end if
end event

event type long onlbuttonup(unsignedlong vkey, real xpos, real ypos);if Item.IsContainer then
	return Item.SplitContainer.Event OnLButtonUp(vkey,xpos,ypos)
else
	return 0
end if
end event

event oncapturechanged();if Item.IsContainer then
	Item.SplitContainer.Event OnCaptureChanged()
end if
end event

event type long onhittest(real xpos, real ypos);if Not #Visible then return HTNOWHERE

if Painter.PtInRect(ref rcClient,xpos,ypos) then
	return HTVALID
else
	return HTNOWHERE
end if
end event

event type long onnotify(n_cst_splitcontainer childcontainer, long notifycode, long command);//来自子控件的消息
choose case NotifyCode
	case NCD_UPDATEPOINTS
		of_UpdatePoints()
	case NCD_SETCAPTURE
		#ParentSplitContainer.Event OnNotify(this,NCD_SETCAPTURE,command)
	case NCD_VISIBLECHANGED
		of_UpdatePoints()
end choose

return 0
end event

event type long onvisiblechanged(boolean visible);_layoutChanged = true
if Item.IsContainer then
	Item.SplitContainer.Event OnVisibleChanged(visible)
elseif IsValidObject(Item.Object) then
	/*
	 ***MAGIC CODE***
	*/
	if Visible then
		Win32.SetRedraw(Handle(Item.Object),true)
		Item.Object.Show()
	else
		Item.Object.Hide()
		Item.Object.Move(-32768,-32768)
	end if
	/*----------------------*/
	/*if visible then
		Item.Object.Show()
	else
		Item.Object.Hide()
	end if*/
end if
return 0
end event

event type long onerasebkgnd(unsignedlong hdc);#ParentSplitContainer.Event OnEraseBkgnd(hdc)
return 0
end event

event onsplitbarmoved(n_cst_splitcontainer splitcontainer, real offset, integer index);if Item.IsContainer  then
	Item.SplitContainer.Event OnSplitBarMoved(splitcontainer,offset,index)
end if
end event

event oncheckhiddenstatus();if Item.IsContainer then
	Item.SplitContainer.Event OnCheckHiddenStatus()
elseif IsValidObject(Item.Object) then
	if Win32.IsWindowVisible(Handle(Item.Object)) then
		if Not of_IsVisible() then
			Event OnVisibleChanged(false)
		end if
	else
		if of_IsVisible() then
			Event OnVisibleChanged(true)
		end if
	end if
end if

end event

event onmakedirty();_layoutChanged = true
if Item.IsContainer then
	if Item.SplitContainer.#Visible then
		Item.SplitContainer.Event OnMakeDirty()
	end if
end if
end event

private function boolean _of_isobjectcreator (readonly windowobject object);if Not IsValidObject(object) then return false

return (Win32.GetProp(Handle(object),PRP_OBJECTCREATOR) = 1)
end function

public function long of_updatepoints ();ulong hdwp
RECTF newRect

Event OnMakeDirty()

if of_IsLockUpdate() then return RetCode.FAILED
if Not of_IsVisible() then return RetCode.OK

newRect = rcClient

Painter.SetRectEmpty(ref rcClient)

if Item.IsContainer then
	hdwp = Win32.BeginDeferWindowPos(Item.SplitContainer.of_GetObjectCount())
else
	hdwp = Win32.BeginDeferWindowPos(1)
end if

Event OnReposition(ref hdwp,ref newRect)

of_Redraw(false)

Win32.EndDeferWindowPos(hdwp)

return RetCode.OK
end function

public function long of_getobject (ref windowobject object);if Item.IsContainer then return RetCode.FAILED

try
	object = Item.object
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(object),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function long of_getsplitcontainer (ref n_cst_splitcontainer container);if Not Item.IsContainer then return RetCode.FAILED

try
	container = Item.splitContainer
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(container),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function long of_setsize (readonly double size);if #Size = size then return RetCode.OK
if size < 0 and size <> -1 then return RetCode.E_INVALID_ARGUMENT
//if size > 1 and (size < #MinSize or size > #MaxSize) then return RetCode.FAILED

#Size = size

#ParentSplitContainer.Event OnNotify(this,NCD_UPDATEPOINTS,0)

return RetCode.OK
end function

public function long of_setvisible (readonly boolean visible);boolean bVisibleStatus

if #Visible = visible then return RetCode.OK

bVisibleStatus = of_IsVisible()

#Visible = visible

if #Visible then
	#ParentSplitContainer.Event OnNotify(this,NCD_VISIBLECHANGED,1)
else
	#ParentSplitContainer.Event OnNotify(this,NCD_VISIBLECHANGED,0)
end if

if bVisibleStatus <> of_IsVisible() then
	Event OnVisibleChanged(of_IsVisible())
end if

return RetCode.OK
end function

public function integer of_getobjectcount ();if Item.IsContainer then return Item.SplitContainer.of_GetObjectCount()
if IsValidObject(Item.object) then return 1
return 0
end function

public function boolean of_isvisible ();if Not #Visible or #Collapsed then return false

return #ParentSplitContainer.of_IsVisible()
end function

public function n_cst_splitcontainer of_bindsplitcontainer ();return of_BindSplitContainer(Enums.VERT)
end function

public function long of_setcollapsible (readonly boolean collapsible);if #Collapsible = collapsible then return RetCode.OK
if #Collapsed then return RetCode.FAILED

#Collapsible = collapsible 

if #Collapsed then
	#ParentSplitContainer.Event OnNotify(this,NCD_COLLAPSIBLECHANGED,1)
else
	#ParentSplitContainer.Event OnNotify(this,NCD_COLLAPSIBLECHANGED,0)
end if

return RetCode.OK
end function

public function n_cst_splitcontainer of_bindsplitcontainer (readonly unsignedinteger orientation);n_cst_splitcontainer container
ITEMDATA newItem

if IsValidObject(Item.Object) then return container
if Item.IsContainer then return Item.SplitContainer

container = Create n_cst_splitcontainer
container.Event OnInit(#ParentSplitContainer.#ParentSplitContainer,this,_ToolTip)

if Not container.Event OnInitData(orientation) then
	Destroy container
	SetNull(container)
	return container
end if

newItem.IsContainer = true
newItem.SplitContainer = container

Item = newItem

of_UpdatePoints()

return container
end function

public function boolean of_islockupdate ();if #LockUpdate then return true

return #ParentSplitContainer.of_IsLockUpdate()
end function

public function long of_bindobject (readonly string clsname);long rtCode
DragObject object

if clsName = "" then return RetCode.E_INVALID_OBJECT
if #ParentSplitContainer.#ParentSplitContainer.#AttachMode then return RetCode.E_NO_SUPPORT
if Item.IsContainer then return RetCode.FAILED
if Not _of_OpenUserObject(ref Object,clsName) then return RetCode.E_INVALID_TYPE

rtCode = of_BindObject(ref Object)
if IsFailed(rtCode) then
	_of_CloseUserObject(object)
end if

return rtCode
end function

public function long of_release ();ITEMDATA newItem

if Item.IsContainer then
	Destroy Item.SplitContainer
else
	if Not IsValidObject(Item.Object) then return RetCode.FAILED
	if Not #ParentSplitContainer.#ParentSplitContainer.#AttachMode then
		Item.Object.Hide()
		if Item.hOldParent > 0 then
			Win32.SetParent(Handle(Item.Object),Item.hOldParent)
		end if
		if Item.ObjectOwner then
			_of_CloseUserObject(Item.Object)
		end if
	end if
end if

Item = newItem

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

if #TitleBarFixedSize then
	maxWidth = 32768
else
	maxWidth = rcClient.right - rcClient.left - 6
	if TitleBar.ImageIndex > 0 then
		maxWidth -= #IconSize.cx + 2
	end if
end if

if #MultiLine then
	dtparam = Painter.DT_EXPANDTABS + Painter.DT_WORDBREAK + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
else
	dtparam = Painter.DT_EXPANDTABS + Painter.DT_SINGLELINE
end if
calcRect.right = maxWidth

Painter.of_CalcTextSize(Font,#Title,dtparam,ref calcRect)

TitleBar.szTitle.cx = calcRect.right
TitleBar.szTitle.cy = calcRect.bottom

if TitleBar.szTitle.cx > maxWidth then
	TitleBar.szTitle.cx = maxWidth
end if
end subroutine

public function long of_redraw (readonly boolean fadeanimation);ulong safeDC

if of_IsLockUpdate() then return RetCode.FAILED
if Not of_IsVisible() then return RetCode.OK

safeDC = of_GetSafeDC()

if safeDC > 0 then
	
	Event OnEraseBkgnd(safeDC)
	Event OnPaint(safeDC)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(rcClient)
	
	of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
	
end if

return RetCode.OK
end function

public function unsignedlong of_getsafedc ();ulong safeDC

if of_IsLockUpdate() then return 0
if Not of_IsVisible() then return 0

safeDC = #ParentSplitContainer.of_GetSafeDC()

Painter.IntersectClipRect(safeDC,rcClient)

return safeDC
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly boolean fadeanimation);return #ParentSplitContainer.of_ReleaseDC(hdc,hrgn,fadeAnimation)
end function

public function boolean of_releasedc (readonly unsignedlong hdc, readonly unsignedlong hrgn, readonly unsignedinteger fadetime);return #ParentSplitContainer.of_ReleaseDC(hdc,hrgn,fadetime)
end function

private subroutine _of_drawtitle (readonly unsignedlong hdc);ulong textColor
ulong dtparam

textColor	= theme.of_GetPanelColor(this,theme.CLR_TEXT,0)

if #MultiLine then
	dtparam = Painter.DT_EXPANDTABS + Painter.DT_WORDBREAK + Painter.DT_HIDEPREFIX + Painter.DT_EDITCONTROL + Painter.DT_EXTERNALLEADING
else
	dtparam = Painter.DT_EXPANDTABS + Painter.DT_SINGLELINE + Painter.DT_END_ELLIPSIS + Painter.DT_HIDEPREFIX
end if
if #TitleAlign = Left! then
	dtparam += Painter.DT_LEFT
elseif #TitleAlign = Center! then
	dtparam += Painter.DT_CENTER
elseif #TitleAlign = Right! then
	dtparam += Painter.DT_RIGHT
end if

Painter.of_Drawtext(hdc,Font,#Title,TitleBar.rcTitle,textColor,dtparam)
end subroutine

private subroutine _of_drawtitlebar (readonly unsignedlong hdc);if Not #TitleBar then return

_of_FillTitleBar(hdc)
if TitleBar.ImageIndex > 0 then
	_ImageList.Draw(TitleBar.ImageIndex,hdc, TitleBar.rcImage.left,TitleBar.rcImage.top,false)
end if
if TitleBar.szTitle.cx > 0 then
	_of_DrawTitle(hdc)
end if
end subroutine

private subroutine _of_filltitlebar (readonly unsignedlong hdc);ulong bkColor,borderColor
RADIUSF rdBorder

bkColor = theme.of_GetPanelColor(this,theme.CLR_TITLEBARBKGND,0)
borderColor = theme.of_GetPanelColor(this,theme.CLR_TITLEBARBORDER,0)

rdBorder = theme.#TitleBarRoundSize
if #Border then
	rdBorder.leftBottom = 0
	rdBorder.rightBottom = 0
end if
	
Painter.ThemeFill( hdc, TitleBar.rcPaint, bkColor, Enums.VERT, theme.#TitleBarBkgndStyle,0, false, theme.#TitleBarBorderStyle,borderColor,rdBorder)
end subroutine

private subroutine _of_drawtitlebar (readonly boolean fadeanimation);ulong safeDC

if of_IsLockUpdate() then return
if Not #TitleBar then return
if Not of_IsVisible() then return

safeDC = of_GetSafeDC()

if safeDC > 0 then
	
	Painter.IntersectClipRect(safeDC,TitleBar.rcPaint)
	
	Event OnEraseBkgnd(safeDC)
	_of_DrawTitleBar(safeDC)
	
	Painter.SelectClipRgn(safeDC,0)
	
	ulong hUpdateRgn
	
	hUpdateRgn = Painter.CreateRectRgn(TitleBar.rcPaint)
	
	of_ReleaseDC(safeDC,hUpdateRgn,FadeAnimation)
	
	Painter.DeleteRgn(hUpdateRgn)
end if
end subroutine

public function long of_settitle (readonly string title);boolean dirty
SIZEF oldSize

if #Title= Title then return RetCode.OK

oldSize = TitleBar.szTitle

#Title= Title
_of_UpdateTextSize()

if oldSize.cy <> TitleBar.szTitle.cy then
	dirty = true
end if

if #TitleBar then
	if dirty then
		of_UpdatePoints()
	else
		_of_DrawTitleBar(false)
	end if
end if

return RetCode.OK
end function

public function long of_settitlebar (readonly boolean show);if #TitleBar = show then return RetCode.OK

#TitleBar = show

of_UpdatePoints()

return RetCode.OK
end function

public function long of_setimage (readonly string image);int newIndex
boolean dirty

if #Image= image then return RetCode.OK

newIndex = _ImageList.AddImage(theme.of_GetPanelIcon(this,image,0))

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

public function long of_seticonposition (readonly unsignedinteger position);if #IconPosition= position then return RetCode.OK

#IconPosition= position

if #TitleBar and TitleBar.ImageIndex > 0 then
	_of_UpdateTitleBarPoints()
	_of_DrawTitleBar(false)
end if

return RetCode.OK
end function

public subroutine _of_updatetitlebarpoints ();real ll_left,ll_right
RECTF titleBarRect

if Not #TitleBar then return

TitleBar.rcPaint = rcClient
TitleBar.rcPaint.bottom = TitleBar.rcPaint.top + _of_GetTitleBarHeight()
if #TitleBarFixedSize then
	choose case #TitleAlign
		case Left!
			TitleBar.rcPaint.right = rcClient.left + _of_GetTitleBarFixedWidth()
		case Center!
			TitleBar.rcPaint.left = rcClient.left + (rcClient.right - rcClient.left - _of_GetTitleBarFixedWidth()) / 2
			TitleBar.rcPaint.right = TitleBar.rcPaint.left + _of_GetTitleBarFixedWidth()
		case Right!
			TitleBar.rcPaint.left = rcClient.right - _of_GetTitleBarFixedWidth()
	end choose
end if
titleBarRect = TitleBar.rcPaint

_of_AdjustRect(ref titleBarRect,ADJ_TITLEBARBORDER)

ll_left = titleBarRect.left + 2
ll_right = titleBarRect.right - 2

if TitleBar.ImageIndex > 0 then
	if #IconPosition = Enums.LEFT then
		TitleBar.rcImage.left = ll_left
		TitleBar.rcImage.right = TitleBar.rcImage.left + #IconSize.cx
		ll_left = TitleBar.rcImage.right + 2
	else
		TitleBar.rcImage.left = ll_right - #IconSize.cx
		TitleBar.rcImage.right = TitleBar.rcImage.left + #IconSize.cx
		ll_right = TitleBar.rcImage.left - 2
	end if
	TitleBar.rcImage.top = titleBarRect.top + (titleBarRect.bottom - titleBarRect.top - #IconSize.cy) / 2
	TitleBar.rcImage.bottom = TitleBar.rcImage.top + #IconSize.cy
	if TitleBar.szTitle.cx > 0 then
		TitleBar.rcTitle.left = ll_left
		TitleBar.rcTitle.right = ll_right
		TitleBar.rcTitle.top = titleBarRect.top + (titleBarRect.bottom - titleBarRect.top - TitleBar.szTitle.cy) / 2
		TitleBar.rcTitle.bottom = TitleBar.rcTitle.top + TitleBar.szTitle.cy
	end if
else
	if TitleBar.szTitle.cx > 0 then
		TitleBar.rcTitle.left = ll_left
		TitleBar.rcTitle.right = ll_right
		TitleBar.rcTitle.top = titleBarRect.top + (titleBarRect.bottom - titleBarRect.top - TitleBar.szTitle.cy) / 2
		TitleBar.rcTitle.bottom = TitleBar.rcTitle.top + TitleBar.szTitle.cy
	end if
end if
end subroutine

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

public function boolean of_hassplitcontainer ();return Item.IsContainer
end function

public function boolean of_hasobject ();if Item.IsContainer then return false
return IsValidObject(Item.Object)
end function

public function long of_setmultiline (readonly boolean multiline);if #MultiLine = multiLine then return RetCode.OK

#MultiLine = multiLine

_of_UpdateTextSize()

if #TitleBar then
	of_UpdatePoints()
end if

return RetCode.OK
end function

public function long of_settitlebarfixedsize (readonly boolean fixed);boolean dirty
SIZEF oldSize

if #TitleBarFixedSize= fixed then return RetCode.OK

oldSize = TitleBar.szTitle

#TitleBarFixedSize= fixed
_of_UpdateTextSize()

if oldSize.cy <> TitleBar.szTitle.cy then
	dirty = true
end if

if #TitleBar then
	if dirty then
		of_UpdatePoints()
	else
		_of_UpdateTitleBarPoints()
		_of_DrawTitleBar(false)
	end if
end if

return RetCode.OK
end function

public function long of_findpanelbyobject (readonly windowobject object, ref n_cst_splitcontainer_panel panel);if Item.IsContainer then
	return Item.splitContainer.of_FindPanelByObject(object,ref panel)
else
	if object = Item.object then
		panel = this
		return RetCode.OK
	end if
end if

return RetCode.E_OBJECT_NOT_FOUND
end function

public function long of_findpanelbytitle (readonly string title, ref n_cst_splitcontainer_panel panel);if title = #Title then
	panel = this
	return RetCode.OK
end if
if Item.IsContainer then
	return Item.splitContainer.of_FindPanelByTitle(title,ref panel)
end if

return RetCode.E_OBJECT_NOT_FOUND
end function

public function long of_findpanelbytag (readonly string tag, ref n_cst_splitcontainer_panel panel);if tag = #Tag then
	panel = this
	return RetCode.OK
end if
if Item.IsContainer then
	return Item.splitContainer.of_FindPanelByTag(tag,ref panel)
end if

return RetCode.E_OBJECT_NOT_FOUND
end function

public function long of_setborder (readonly boolean show);if #Border = show then return RetCode.OK

#Border = show

of_UpdatePoints()

return RetCode.OK
end function

public function long of_setcollapsed (readonly boolean collapsed, readonly boolean triggerevent);boolean bVisibleStatus

if Not #Collapsible then return RetCode.FAILED
if #Collapsed = collapsed then return RetCode.OK

if collapsed then
	if #ParentSplitContainer.Panel1 = this then
		if #ParentSplitContainer.Panel2.#Collapsed then return RetCode.FAILED
	else
		if #ParentSplitContainer.Panel1.#Collapsed then return RetCode.FAILED
	end if
end if

if triggerEvent then
	if collapsed then
		if IsPrevented(#ParentSplitContainer.#ParentSplitContainer.Event OnPanelCollapsing(this)) then return RetCode.FAILED
	else
		if IsPrevented(#ParentSplitContainer.#ParentSplitContainer.Event OnPanelExpanding(this)) then return RetCode.FAILED
	end if
end if

bVisibleStatus = of_IsVisible()

#Collapsed = collapsed

if #Collapsed then
	#ParentSplitContainer.Event OnNotify(this,NCD_COLLAPSEDCHANGED,1)
else
	#ParentSplitContainer.Event OnNotify(this,NCD_COLLAPSEDCHANGED,0)
end if

if bVisibleStatus <> of_IsVisible() then
	Event OnVisibleChanged(of_IsVisible())
end if

if triggerEvent then
	if collapsed then
		#ParentSplitContainer.#ParentSplitContainer.Event OnPanelCollapsed(this)
	else
		#ParentSplitContainer.#ParentSplitContainer.Event OnPanelExpanded(this)
	end if
end if

return RetCode.OK
end function

public function long of_setcollapsed (readonly boolean collapsed);return of_SetCollapsed(collapsed,false)
end function

public function n_cst_splitcontainer of_split (readonly unsignedinteger orientation);return of_BindSplitContainer(orientation)
end function

public function n_cst_splitcontainer of_split ();return of_BindSplitContainer(Enums.VERT)
end function

public function long of_bindobject (ref dragobject object);ITEMDATA newItem

if Item.IsContainer then return RetCode.FAILED
if IsValidObject(Item.Object) then return RetCode.FAILED

if #ParentSplitContainer.#ParentSplitContainer.#AttachMode then
	if Not IsValidObject(object) then return RetCode.E_INVALID_OBJECT
	if Win32.GetParent(Handle(object)) <> Win32.GetParent(#ParentSplitContainer.#ParentSplitContainer.#Handle) then return RetCode.E_INVALID_OBJECT
else
	if Not IsValidObject(object) then
		if Not _of_OpenUserObject(ref object) then return RetCode.E_INVALID_OBJECT
		newItem.objectOwner = true
	elseif _of_IsObjectCreator(object) then
		newItem.objectOwner = true
	end if
	if Win32.GetParent(Handle(object)) <> #ParentSplitContainer.#ParentSplitContainer.#Handle then
		newItem.hOldParent = Win32.SetParent(Handle(object),#ParentSplitContainer.#ParentSplitContainer.#Handle)
	end if
end if

newItem.Object = object
newItem.IsOLE = IsOLEControl(object)

if of_IsVisible() then
	object.Show()
else
	object.Hide()
	object.Move(-32768,-32768)
end if

Item = newItem

of_UpdatePoints()

return RetCode.OK
end function

public function long of_bindobject (readonly windowobject object);ITEMDATA newItem

if Item.IsContainer then return RetCode.FAILED
if IsValidObject(Item.Object) then return RetCode.FAILED
if Not IsValidObject(object) then return RetCode.E_INVALID_OBJECT

if #ParentSplitContainer.#ParentSplitContainer.#AttachMode then
	if Win32.GetParent(Handle(object)) <> Win32.GetParent(#ParentSplitContainer.#ParentSplitContainer.#Handle) then return RetCode.E_INVALID_OBJECT
else
	if _of_IsObjectCreator(object) then
		newItem.objectOwner = true
	end if
	if Win32.GetParent(Handle(object)) <> #ParentSplitContainer.#ParentSplitContainer.#Handle then
		newItem.hOldParent = Win32.SetParent(Handle(object),#ParentSplitContainer.#ParentSplitContainer.#Handle)
	end if
end if

newItem.Object = object
newItem.IsOLE = IsOLEControl(object)

if of_IsVisible() then
	object.Show()
else
	object.Hide()
	object.Move(-32768,-32768)
end if

Item = newItem

of_UpdatePoints()

return RetCode.OK
end function

private function boolean _of_closeuserobject (readonly dragobject object);if Not IsValidObject(object) then return false
if Not _of_IsObjectCreator(object) then return false

if Win32.GetProp(Handle(object),PRP_OBJECTCREATOR) = 1 then
	Win32.RemoveProp(Handle(object),PRP_OBJECTCREATOR)
end if

/*--- PB12以下版本使用下面的代码 ---*/
#ParentSplitContainer.#ParentSplitContainer.#ParentWindow.CloseUserObject(object)
/*--------------------------------------------------*/
/*
/*--- PB12及以上版本使用下面的代码 ---*/
CloseUserObject(object)
/*--------------------------------------------------*/
*/

return true
end function

private function boolean _of_openuserobject (ref dragobject object, readonly string clsname);//始终采用#ParentWindow来创建新的对象
//2015-01-30
try
	/*--- PB12以下版本使用下面的代码 ---*/
	Window lw_Parent
	lw_Parent = #ParentSplitContainer.#ParentSplitContainer.#ParentWindow
	if Not IsValidObject(lw_Parent) then return false
	if Len(clsName) = 0 then
		lw_Parent.OpenUserObjectWithParm(ref object,this)
	else
		lw_Parent.OpenUserObjectWithParm(ref object,this,clsName)
	end if
	/*--------------------------------------------------*/
	/*
	/*--- PB12及以上版本使用下面的代码 ---*/
	//注：
	//		PBNI导出的对象如果采用自身的OpenUserObject族函数打开对象将会有一些奇怪的行为
	//		如对象内的控件不能正常切换焦点，在Constructor事件中创建其它对象时将会触发两次Constructor以及还未发现的问题- -'
	//		2015-01-30
	if Len(clsName) = 0 then
		OpenUserObjectWithParm(ref object,this)
	else
		OpenUserObjectWithParm(ref object,this,clsName)
	end if
	*/
	if IsValidObject(object) then
		Win32.SetProp(Handle(object),PRP_OBJECTCREATOR,1)
		return true
	else
		return false
	end if
catch(Throwable ex)
	return false
end try
end function

private function boolean _of_openuserobject (ref dragobject object);return _of_OpenUserObject(object,"")
end function

private subroutine _of_adjustrect (ref rectf adjrect, readonly unsignedlong flags);real fBorderSize

if BitAND(flags,ADJ_PADDING) > 0 then
	adjRect.left += #Padding.left
	adjRect.top += #Padding.top
	adjRect.right -= #Padding.right
	adjRect.bottom -= #Padding.bottom
end if

if #TitleBar then
	if BitAND(flags,ADJ_TITLEBAR) > 0 then
		adjRect.top += TitleBar.rcPaint.bottom - TitleBar.rcPaint.top
	end if
	if BitAND(flags,ADJ_TITLEBARBORDER) > 0 then
		if theme.#TitleBarBorderStyle <> Enums.BS_NONE then
			fBorderSize = P2DX(1)
			Painter.InflateRect(ref adjRect,-fBorderSize,-fBorderSize)
		end if
	end if
end if

if #Border then
	if BitAND(flags,ADJ_BORDER) > 0 then
		if theme.#PanelBorderStyle <> Enums.BS_NONE then
			fBorderSize = P2DX(1)
			Painter.InflateRect(ref adjRect,-fBorderSize,-fBorderSize)
			if #TitleBar and BitAND(flags,ADJ_TITLEBAR) > 0 then
				adjRect.top -= fBorderSize
			end if
		end if
	end if
end if
end subroutine

public function long of_getclientrect (ref rectf clientrect);clientRect = rcClient
return RetCode.OK
end function

private function real _of_gettitlebarfixedwidth ();real nWidth

nWidth = TitleBar.szTitle.cx + 4
if TitleBar.ImageIndex > 0 then
	nWidth += #IconSize.cx + 2
end if
if theme.#TitleBarBorderStyle <> Enums.BS_NONE then
	nWidth += 2
end if

return nWidth
end function

public function long of_settitlebarheight (readonly real height);if #TitleBarHeight = height then return RetCode.OK

#TitleBarHeight = height

of_UpdatePoints()

return RetCode.OK
end function

public function long of_setpadding (readonly real left, readonly real top, readonly real right, readonly real bottom);//if left < 0 or top < 0 or right < 0 or bottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #Padding.left = left and #Padding.top = top and #Padding.right = right and #Padding.bottom = bottom then return RetCode.OK

#Padding.left = left
#Padding.top = top
#Padding.right = right
#Padding.bottom = bottom

of_UpdatePoints()

return RetCode.OK
end function

public function long of_setminsize (readonly real minsize);if #MinSize = minSize then return RetCode.OK
if minSize > #MaxSize then return RetCode.FAILED
//if #Size > 1 and minSize > #Size then return RetCode.FAILED

#MinSize = minSize

#ParentSplitContainer.Event OnNotify(this,NCD_UPDATEPOINTS,0)

return RetCode.OK
end function

public function long of_setmaxsize (readonly real maxsize);if #MaxSize = maxSize then return RetCode.OK
if maxSize < #MinSize then return RetCode.FAILED
//if #Size > 1 and maxSize < #Size then return RetCode.FAILED

#MaxSize = maxSize

#ParentSplitContainer.Event OnNotify(this,NCD_UPDATEPOINTS,0)

return RetCode.OK
end function

public function long of_setmargin (readonly real left, readonly real top, readonly real right, readonly real bottom);//if left < 0 or top < 0 or right < 0 or bottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #Margin.left = left and #Margin.top = top and #Margin.right = right and #Margin.bottom = bottom then return RetCode.OK

#Margin.left = left
#Margin.top = top
#Margin.right = right
#Margin.bottom = bottom

#ParentSplitContainer.Event OnNotify(this,NCD_UPDATEPOINTS,0)

return RetCode.OK
end function

private function real _of_gettitlebarheight ();real nHeight

if #TitleBarHeight > 0 then return #TitleBarHeight

if TitleBar.ImageIndex > 0 then
	if #IconSize.cy > TitleBar.szTitle.cy then
		nHeight = #IconSize.cy + 4
	else
		nHeight = TitleBar.szTitle.cy + 4
	end if
else
	nHeight = TitleBar.szTitle.cy + 4
end if

if nHeight < Font.#WordSize.cy + 4 then
	nHeight = Font.#WordSize.cy + 4
end if

return nHeight
end function

public function long of_setfixed (readonly boolean fixed);if #Fixed = fixed then return RetCode.OK

#Fixed = fixed

return RetCode.OK
end function

public function real of_getwidth ();return rcClient.right - rcClient.left
end function

public function real of_getheight ();return rcClient.bottom - rcClient.top
end function

public function long of_setminmaxsize (readonly real minsize, readonly real maxsize);if #MinSize = minSize and #MaxSize = maxSize then return RetCode.OK
if minSize > maxSize then return RetCode.FAILED
//if #Size > 1 and (minSize > #Size or maxSize < #Size) then return RetCode.FAILED

#MinSize = minSize
#MaxSize = maxSize

#ParentSplitContainer.Event OnNotify(this,NCD_UPDATEPOINTS,0)

return RetCode.OK
end function

public function long of_replace (ref dragobject object);if Item.Object = object then return RetCode.OK
of_Release()
return of_BindObject(ref object)
end function

public function long of_replace (readonly windowobject object);if Not IsValidObject(object) then return RetCode.E_INVALID_OBJECT
if Item.Object = object then return RetCode.OK

of_Release()
return of_BindObject(object)
end function

public function long of_replace (readonly string clsname);if clsName = "" then return RetCode.E_INVALID_OBJECT
of_Release()
return of_BindObject(clsName)
end function

on n_cst_splitcontainer_panel.create
call super::create
this.font=create font
TriggerEvent( this, "constructor" )
end on

on n_cst_splitcontainer_panel.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.font)
end on

event destructor;Destroy _ImageList

of_Release()
end event

event constructor;#IconSize.cx = Enums.SMALL
#IconSize.cy = Enums.SMALL

_ImageList = Create n_imagelist
_ImageList.ShareImage(true)
_ImageList.SetImageSize(#IconSize.cx,#IconSize.cy)
end event

type font from n_cst_font within n_cst_splitcontainer_panel descriptor "pb_nvo" = "true" 
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

