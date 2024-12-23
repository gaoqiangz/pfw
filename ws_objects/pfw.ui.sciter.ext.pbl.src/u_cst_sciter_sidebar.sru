$PBExportHeader$u_cst_sciter_sidebar.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_sciter_sidebar from u_cst_sciter
end type
type eventhandler from n_scitereventhandler within u_cst_sciter_sidebar
end type
end forward

global type u_cst_sciter_sidebar from u_cst_sciter
integer width = 983
integer height = 1776
event type long onsbcollapsing ( n_cst_sciter_sidebar_option option )
event onsbcollapsed ( n_cst_sciter_sidebar_option option )
event type long onsbexpanding ( n_cst_sciter_sidebar_option option )
event onsbexpanded ( n_cst_sciter_sidebar_option option )
event onsbclicked ( n_cst_sciter_sidebar_option option )
event type long onsbpopulate ( n_cst_sciter_sidebar_option option )
event type long onsbselectionchanging ( n_cst_sciter_sidebar_option oldoption,  n_cst_sciter_sidebar_option newoption )
event onsbselectionchanged ( n_cst_sciter_sidebar_option oldoption,  n_cst_sciter_sidebar_option newoption )
eventhandler eventhandler
end type
global u_cst_sciter_sidebar u_cst_sciter_sidebar

type variables
/*--- Properties ---*/
public:
privatewrite n_sciterelement 	#Bar
protectedwrite boolean			#ItemSelect 	= false	//开启节点选择功能

/*--- Implementation ---*/
private:
constant string IMPL_HTML = "pfw://arch/sciter[sidebar/main.html]"
end variables

forward prototypes
public function long of_setcollapsed (readonly boolean collapse)
public function boolean of_iscollapsed ()
public function n_cst_sciter_sidebar_option of_addoption (readonly string txt, readonly string image, readonly string tiptext, readonly boolean textishtml)
public function n_cst_sciter_sidebar_option of_addoption (readonly string txt, readonly string image, readonly string tiptext)
public function n_cst_sciter_sidebar_option of_addoption (readonly string txt, readonly string image)
public function n_cst_sciter_sidebar_option of_addoption (readonly string txt)
public function long of_clearselection ()
public function long of_select (readonly n_cst_sciter_sidebar_option option)
public function long of_select (readonly n_cst_sciter_sidebar_option option, readonly boolean triggerevent)
public function long of_removeall ()
public function long of_remove (readonly n_cst_sciter_sidebar_option option)
public function n_cst_sciter_sidebar_option of_getbar ()
public function n_cst_sciter_sidebar_option of_getselected ()
public function n_cst_sciter_sidebar_option of_getroot (readonly boolean includingbar)
public function n_cst_sciter_sidebar_option of_getroot ()
public function n_cst_sciter_sidebar_option of_getoptionbyuid (readonly unsignedlong uid)
public function n_cst_sciter_sidebar_option of_getoptionbyid (readonly string id)
public function integer of_findoptions (readonly string cssselector, ref n_cst_sciter_sidebar_option options[])
public function integer of_findoptionsbytext (readonly string txt, ref n_cst_sciter_sidebar_option options[])
public function integer of_findoptions (readonly string attrname, readonly string attrvalue, ref n_cst_sciter_sidebar_option options[])
public function integer of_findoptionsbytag (string stag, ref n_cst_sciter_sidebar_option options[])
public function n_cst_sciter_sidebar_option of_findoption (readonly string cssselector)
public function n_cst_sciter_sidebar_option of_findoption (readonly string attrname, readonly string attrvalue)
public function n_cst_sciter_sidebar_option of_findoptionbytag (readonly string stag)
public function n_cst_sciter_sidebar_option of_findoptionbytext (readonly string txt)
public function long of_load (readonly n_scitervalue data)
public function long of_seticonfont (readonly string path, readonly string name)
public function long of_seticonfont (readonly string path)
public function long of_setcssvars (readonly n_scitervalue data)
public function long of_setcssvar (readonly string name, readonly string val)
end prototypes

public function long of_setcollapsed (readonly boolean collapse);//====================================================================
// Function: of_setcollapsed()
//--------------------------------------------------------------------
// Description: 设置菜单的折叠状态
//--------------------------------------------------------------------
// Arguments:
// 	readonly	boolean	collapse	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if collapse then
	return #Bar.SetState(Enums.SC_STATE_COLLAPSED,0,true)
else
	return #Bar.SetState(0,Enums.SC_STATE_COLLAPSED,true)
end if
end function

public function boolean of_iscollapsed ();//====================================================================
// Function: of_iscollapsed()
//--------------------------------------------------------------------
// Description: 获取菜单的折叠状态
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return #Bar.GetState(Enums.SC_STATE_COLLAPSED)
end function

public function n_cst_sciter_sidebar_option of_addoption (readonly string txt, readonly string image, readonly string tiptext, readonly boolean textishtml);//====================================================================
// Function: of_addoption()
//--------------------------------------------------------------------
// Description: 添加根菜单项
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string 	txt       	
// 	readonly	string 	image     	
// 	readonly	string 	tiptext   	
// 	readonly	boolean	textishtml	
//--------------------------------------------------------------------
// Returns:  n_cst_sciter_sidebar_option
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_cst_sciter_sidebar_option opt
n_sciterelement elOption

elOption = #Bar.InvokeMethod("addOption",txt,textIsHtml,image,tipText)

opt = Create n_cst_sciter_sidebar_option
opt.Event OnInit(this,elOption)

return opt
end function

public function n_cst_sciter_sidebar_option of_addoption (readonly string txt, readonly string image, readonly string tiptext);return of_AddOption(txt,image,tipText,false)
end function

public function n_cst_sciter_sidebar_option of_addoption (readonly string txt, readonly string image);return of_AddOption(txt,image,"",false)
end function

public function n_cst_sciter_sidebar_option of_addoption (readonly string txt);return of_AddOption(txt,"","",false)
end function

public function long of_clearselection ();//====================================================================
// Function: of_clearselection()
//--------------------------------------------------------------------
// Description: 清空选择的菜单项
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
#Bar.InvokeMethod("clearSelection")
return RetCode.OK
end function

public function long of_select (readonly n_cst_sciter_sidebar_option option);return of_Select(option,true)
end function

public function long of_select (readonly n_cst_sciter_sidebar_option option, readonly boolean triggerevent);//====================================================================
// Function: of_select()
//--------------------------------------------------------------------
// Description: 选择菜单项
//--------------------------------------------------------------------
// Arguments:
// 	readonly	n_cst_sciter_sidebar_option	option      	
// 	readonly	boolean                    	triggerevent	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if Not IsValidObject(option) then return RetCode.E_INVALID_OBJECT
if Not IsValidObject(option.#Element) then return RetCode.E_INVALID_OBJECT
if option.#Element.IsEmpty() then return RetCode.E_INVALID_OBJECT

if Not #Bar.InvokeMethod("selectOption",option.#Element,triggerEvent) then return RetCode.FAILED

//option.of_ExpandParent(true)
option.of_ScrollToView()

return RetCode.OK
end function

public function long of_removeall ();//====================================================================
// Function: of_removeall()
//--------------------------------------------------------------------
// Description: 删除所有节点
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
#Bar.InvokeMethod("removeOptionAll")
return RetCode.OK
end function

public function long of_remove (readonly n_cst_sciter_sidebar_option option);//====================================================================
// Function: of_remove()
//--------------------------------------------------------------------
// Description: 删除节点
//--------------------------------------------------------------------
// Arguments:
// 	readonly	n_cst_sciter_sidebar_option	option	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if Not IsValidObject(option) then return RetCode.E_INVALID_OBJECT
if Not IsValidObject(option.#Element) then return RetCode.E_INVALID_OBJECT
if option.#Element.IsEmpty() then return RetCode.E_INVALID_OBJECT

if Not #Bar.InvokeMethod("removeOption",option.#Element) then return RetCode.FAILED

Destroy option.#Element
Destroy option

return RetCode.OK
end function

public function n_cst_sciter_sidebar_option of_getbar ();//====================================================================
// Function: of_getbar()
//--------------------------------------------------------------------
// Description: 获取导航栏元素本身的option对象
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  n_cst_sciter_sidebar_option
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_cst_sciter_sidebar_option opt

opt = Create n_cst_sciter_sidebar_option
opt.Event OnInit(this,#Bar)

return opt
end function

public function n_cst_sciter_sidebar_option of_getselected ();//====================================================================
// Function: of_getselected()
//--------------------------------------------------------------------
// Description: 获取当前选择的节点
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  n_cst_sciter_sidebar_option
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
any aRet
n_cst_sciter_sidebar_option opt
n_sciterelement el

aRet = #Bar.InvokeMethod("getSelectedOption")
if IsNull(aRet) then
	el = Create n_sciterelement
else
	el = aRet
end if

opt = Create n_cst_sciter_sidebar_option
opt.Event OnInit(this,el)

return opt
end function

public function n_cst_sciter_sidebar_option of_getroot (readonly boolean includingbar);//====================================================================
// Function: of_getroot()
//--------------------------------------------------------------------
// Description: 获取根节点
//--------------------------------------------------------------------
// Arguments:
// 	readonly	boolean	includingbar	
//--------------------------------------------------------------------
// Returns:  n_cst_sciter_sidebar_option
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_sciterelement elRoot
n_cst_sciter_sidebar_option opt

elRoot = #Bar.FindChild(">option")
if elRoot.IsEmpty() and includingBar then elRoot = #Bar

opt = Create n_cst_sciter_sidebar_option
opt.Event OnInit(this,elRoot)

return opt
end function

public function n_cst_sciter_sidebar_option of_getroot ();return of_GetRoot(false)
end function

public function n_cst_sciter_sidebar_option of_getoptionbyuid (readonly unsignedlong uid);//====================================================================
// Function: of_getoptionbyuid()
//--------------------------------------------------------------------
// Description: 通过UUID获取节点对象
//--------------------------------------------------------------------
// Arguments:
// 	readonly	unsignedlong	uid	
//--------------------------------------------------------------------
// Returns:  n_cst_sciter_sidebar_option
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_cst_sciter_sidebar_option opt

opt = Create n_cst_sciter_sidebar_option
opt.Event OnInit(this,GetElementByUID(uid))

return opt
end function

public function n_cst_sciter_sidebar_option of_getoptionbyid (readonly string id);//====================================================================
// Function: of_getoptionbyid()
//--------------------------------------------------------------------
// Description: 通过ID获取节点对象
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	id	
//--------------------------------------------------------------------
// Returns:  n_cst_sciter_sidebar_option
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_cst_sciter_sidebar_option opt

opt = Create n_cst_sciter_sidebar_option
opt.Event OnInit(this,GetElementByID(id))

return opt
end function

public function integer of_findoptions (readonly string cssselector, ref n_cst_sciter_sidebar_option options[]);//====================================================================
// Function: of_findoptions()
//--------------------------------------------------------------------
// Description: 通过CSS选择器查找节点对象
//--------------------------------------------------------------------
// Arguments:
// 	readonly 	string                      	cssselector	
// 	reference	n_cst_sciter_sidebar_option	options[]  	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int nIndex,nCount
n_cst_sciter_sidebar_option opts[]
n_sciterelement els[]

if CSSSelector = "" then return 0

nCount = #Bar.FindChildren(CSSSelector,ref els)
for nIndex = 1 to nCount
	opts[nIndex] = Create n_cst_sciter_sidebar_option
	opts[nIndex].Event OnInit(this,els[nIndex])
next

options = opts

return nCount
end function

public function integer of_findoptionsbytext (readonly string txt, ref n_cst_sciter_sidebar_option options[]);return of_FindOptions("text",txt,ref options)
end function

public function integer of_findoptions (readonly string attrname, readonly string attrvalue, ref n_cst_sciter_sidebar_option options[]);//====================================================================
// Function: of_findoptions()
//--------------------------------------------------------------------
// Description: 根据属性查找节点对象
//--------------------------------------------------------------------
// Arguments:
// 	readonly 	string                     	attrname 	
// 	readonly 	string                     	attrvalue	
// 	reference	n_cst_sciter_sidebar_option	options[]	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int nIndex,nCount
n_cst_sciter_sidebar_option opts[]
n_sciterelement els[]

if attrName = "" then return 0

nCount = #Bar.FindChildren("option[" + attrName + "=~"" + attrValue + "~"]",ref els)
for nIndex = 1 to nCount
	opts[nIndex] = Create n_cst_sciter_sidebar_option
	opts[nIndex].Event OnInit(this,els[nIndex])
next

options = opts

return nCount
end function

public function integer of_findoptionsbytag (string stag, ref n_cst_sciter_sidebar_option options[]);return of_FindOptions("tag",sTag,ref options)
end function

public function n_cst_sciter_sidebar_option of_findoption (readonly string cssselector);//====================================================================
// Function: of_findoption()
//--------------------------------------------------------------------
// Description: 根据CSS选择器查找第一个匹配的节点对象
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	cssselector	
//--------------------------------------------------------------------
// Returns:  n_cst_sciter_sidebar_option
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_cst_sciter_sidebar_option opt

opt = Create n_cst_sciter_sidebar_option
opt.Event OnInit(this,#Bar.FindChild(CSSSelector))

return opt
end function

public function n_cst_sciter_sidebar_option of_findoption (readonly string attrname, readonly string attrvalue);//====================================================================
// Function: of_findoption()
//--------------------------------------------------------------------
// Description: 根据属性查找第一个匹配的节点对象
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	attrname 	
// 	readonly	string	attrvalue	
//--------------------------------------------------------------------
// Returns:  n_cst_sciter_sidebar_option
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_cst_sciter_sidebar_option opt

opt = Create n_cst_sciter_sidebar_option
opt.Event OnInit(this,#Bar.FindChild("option[" + attrName + "=~"" + attrValue + "~"]"))

return opt
end function

public function n_cst_sciter_sidebar_option of_findoptionbytag (readonly string stag);return of_FindOption("tag",sTag)
end function

public function n_cst_sciter_sidebar_option of_findoptionbytext (readonly string txt);return of_FindOption("text",txt)
end function

public function long of_load (readonly n_scitervalue data);//====================================================================
// Function: of_load()
//--------------------------------------------------------------------
// Description: 从JSON加载菜单
//--------------------------------------------------------------------
// Arguments:
// 	readonly	n_scitervalue	data	
//			[{text:"text",textIsHtml:false,image:"uri",tipText:"text",attributes:{name:"val"},children:[{...}]},...]
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if Not #Bar.InvokeMethod("load",data) then return RetCode.FAILED
return RetCode.OK
end function

public function long of_seticonfont (readonly string path, readonly string name);//====================================================================
// Function: of_seticonfont()
//--------------------------------------------------------------------
// Description: 设置icon-font字体文件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	path	字体路径
// 	readonly	string	name	指定名称 (使用：#f001@name）
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if path = "" then return RetCode.E_INVALID_ARGUMENT

if Not #Bar.InvokeMethod("setIconFont",path,name) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_seticonfont (readonly string path);return of_SetIconFont(path,"")
end function

public function long of_setcssvars (readonly n_scitervalue data);//====================================================================
// Function: of_setcssvars()
//--------------------------------------------------------------------
// Description: 设置CSS变量
//--------------------------------------------------------------------
// Arguments:
// 	readonly	n_scitervalue	data	
//		{clr_bkgnd:"rgb(255,0,0)",font_size:"20pt",...}
//	支持的变量：
//		group_icon_size
//		item_icon_size
//		min_group_height
//		min_item_height
//		min_popup_width
//		min_popup_height
//		max_popup_width
//		max_popup_height
//		group_bar_width
//		child_group_offset
//		item_padding_left
//		item_padding_top
//		item_padding_right
//		item_padding_bottom
//		clr_bkgnd
//		clr_group_bkgnd
//		clr_group_bar
//		clr_child_group_bkgnd
//		clr_item_selected_bkgnd
//		clr_text
//		clr_text_hover
//		clr_text_selected
//		clr_text_expand
//		clr_icon
//		clr_icon_hover
//		clr_icon_selected
//		clr_icon_expand
//		clr_arrow
//		font_size
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if Not #Bar.InvokeMethod("setCSSVars",data) then return RetCode.FAILED
return RetCode.OK
end function

public function long of_setcssvar (readonly string name, readonly string val);//====================================================================
// Function: of_setcssvar()
//--------------------------------------------------------------------
// Description: 设置CSS变量
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	name	
// 	readonly	string	val 	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_scitervalue valData

valData = Create n_scitervalue
valData.SetItem(name,val)

return of_SetCSSVars(valData)
end function

event constructor;call super::constructor;//设置文字渲染的平滑模式为Clear-Type(High Quality)
SetOption(Enums.SC_OPT_FONT_SMOOTHING,Enums.SC_OPTV_FONT_CLEAR_TYPE)
//捕获Sciter事件
EventHandler.SetFilter(Enums.SC_HANDLE_EVENT)

//加载html
LoadFile(IMPL_HTML)

#Bar.InvokeMethod("enableItemSelect",#ItemSelect)
end event

on u_cst_sciter_sidebar.create
call super::create
this.eventhandler=create eventhandler
end on

on u_cst_sciter_sidebar.destroy
call super::destroy
destroy(this.eventhandler)
end on

event onattachbehavior;call super::onattachbehavior;if name = "pfwSidebar" then
	//设置事件处理对象
	if IsValidObject(element) then
		#Bar = element
	else
		//因为PB9,10这里会为NULL,PBNI传不过来,所以只能手动取,坑.........
		#Bar = FindElement("sidebar")
	end if
	#Bar.AttachEventHandler(EventHandler)
	return 1
end if
return 0
end event

event destructor;call super::destructor;SetNull(#Bar)
end event

type uo_logo from u_cst_sciter`uo_logo within u_cst_sciter_sidebar
end type

type eventhandler from n_scitereventhandler within u_cst_sciter_sidebar descriptor "pb_nvo" = "true" 
end type

on eventhandler.create
call super::create
end on

on eventhandler.destroy
call super::destroy
end on

event onevent;call super::onevent;n_scitervalue valData
n_cst_sciter_sidebar_option optTarget,opt

if eventFlag <> Enums.SC_EVT_CUSTOM_NAME then return 0

optTarget = Create n_cst_sciter_sidebar_option

choose case name
	case "sb-collapsing"
		optTarget.Event OnInit(parent,data)
		return Event OnSBCollapsing(optTarget)
	case "sb-collapsed"
		optTarget.Event OnInit(parent,data)
		Event OnSBCollapsed(optTarget)
	case "sb-expanding"
		optTarget.Event OnInit(parent,data)
		return Event OnSBExpanding(optTarget)
	case "sb-expanded"
		optTarget.Event OnInit(parent,data)
		Event OnSBExpanded(optTarget)
	case "sb-populate"
		optTarget.Event OnInit(parent,data)
		return Event OnSBPopulate(optTarget)
	case "sb-selection-changing"
		valData = data
		opt = Create n_cst_sciter_sidebar_option
		opt.Event OnInit(parent,valData.GetItemElement("old"))
		optTarget.Event OnInit(parent,valData.GetItemElement("new"))
		return Event OnSBSelectionChanging(opt,optTarget)
	case "sb-selection-changed"
		valData = data
		opt = Create n_cst_sciter_sidebar_option
		opt.Event OnInit(parent,valData.GetItemElement("old"))
		optTarget.Event OnInit(parent,valData.GetItemElement("new"))
		Event OnSBSelectionChanged(opt,optTarget)
	case "sb-clicked"
		optTarget.Event OnInit(parent,data)
		Event OnSBClicked(optTarget)
end choose

return 0
end event

