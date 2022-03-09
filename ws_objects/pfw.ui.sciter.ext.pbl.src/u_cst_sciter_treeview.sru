$PBExportHeader$u_cst_sciter_treeview.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_sciter_treeview from u_cst_sciter
end type
type eventhandler from n_scitereventhandler within u_cst_sciter_treeview
end type
end forward

global type u_cst_sciter_treeview from u_cst_sciter
integer width = 585
integer height = 1352
event type long ontvselectionchanged ( n_cst_sciter_treeview_option oldoption,  n_cst_sciter_treeview_option newoption )
event type long ontvselectionchanging ( n_cst_sciter_treeview_option oldoption,  n_cst_sciter_treeview_option newoption )
event type long ontvclicked ( n_cst_sciter_treeview_option option )
event type long ontvrightclicked ( n_cst_sciter_treeview_option option )
event type long ontvrightdoubleclicked ( n_cst_sciter_treeview_option option )
event type long ontvexpanding ( n_cst_sciter_treeview_option option )
event type long ontvexpanded ( n_cst_sciter_treeview_option option )
event type long ontvcollapsing ( n_cst_sciter_treeview_option option )
event type long ontvcollapsed ( n_cst_sciter_treeview_option option )
event type long ontvcheckstatechanging ( n_cst_sciter_treeview_option option,  long newstate )
event type long ontvcheckstatechanged ( n_cst_sciter_treeview_option option,  long newstate )
event type long ontvbegindrag ( n_cst_sciter_treeview_option option )
event type long ontvdragenter ( n_cst_sciter_treeview_option option,  n_cst_sciter_treeview_option dragoption,  long where )
event type long ontvdragleave ( n_cst_sciter_treeview_option option,  n_cst_sciter_treeview_option dragoption,  long where )
event type long ontvdragdrop ( n_cst_sciter_treeview_option option,  n_cst_sciter_treeview_option dragoption,  long where )
event type long ontvbegintextedit ( n_cst_sciter_treeview_option option )
event type long ontvendtextedit ( n_cst_sciter_treeview_option option,  string newtext,  boolean modified,  long reason )
event type long ontvenddrag ( n_cst_sciter_treeview_option option )
event type long ontvdoubleclicked ( n_cst_sciter_treeview_option option )
event type long ontvpopulate ( n_cst_sciter_treeview_option option )
eventhandler eventhandler
end type
global u_cst_sciter_treeview u_cst_sciter_treeview

type variables
/*--- Constants ---*/
Public:
//- 节点勾选的状态(EVT_CHECKING/EVT_CHECKED事件的reason参数)
Constant Long CHECK_STATE_UNCHECKED			= 0	//勾选
Constant Long CHECK_STATE_CHECKED			= 1	//未勾选
Constant Long CHECK_STATE_INDETERMINATE	= 2	//不确定
//- 节点拖放的位置(EVT_DRAG_DROP事件的reason参数)
Constant Long DD_DROP_WHERE_BEFORE	= 1	//拖放到目标节点前面
Constant Long DD_DROP_WHERE_AFTER	= 2	//拖放到目标节点后面
Constant Long DD_DROP_WHERE_INSIDE	= 3	//拖放到目标节点里面

/*--- Properties ---*/
Public:
PrivateWrite n_sciterelement 	#Tree
PrivateWrite Boolean				#CheckBox 	= false	//开启节点复选框功能
ProtectedWrite Boolean 			#AllowDrag 	= false	//开启节点拖拽功能

/*--- Implementation ---*/
Private:
Constant String IMPL_HTML = "pfw://arch/sciter[treeview/main.html]"

end variables
forward prototypes
public function n_cst_sciter_treeview_option of_addoption (readonly string txt, readonly string image, readonly string tiptext)
public function n_cst_sciter_treeview_option of_addoption (readonly string txt, readonly string image, readonly long imageposition)
public function n_cst_sciter_treeview_option of_addoption (readonly string txt, readonly string image)
public function n_cst_sciter_treeview_option of_addoption (readonly string txt)
public function long of_setcheckbox (readonly boolean checkbox)
public function integer of_findoptions (readonly string cssselector, ref n_cst_sciter_treeview_option options[])
public function n_cst_sciter_treeview_option of_getoptionbyuid (readonly unsignedlong uid)
public function long of_removeall ()
public function long of_select (readonly n_cst_sciter_treeview_option option)
public function long of_select (readonly n_cst_sciter_treeview_option option, readonly boolean triggerevent)
public function n_cst_sciter_treeview_option of_getselected ()
public function n_cst_sciter_treeview_option of_findoption (readonly string cssselector)
public function n_cst_sciter_treeview_option of_getoptionbyid (readonly string id)
public function long of_clearselection ()
public function long of_remove (readonly n_cst_sciter_treeview_option option, readonly boolean changeselection, readonly boolean triggerevent)
public function long of_remove (readonly n_cst_sciter_treeview_option option)
public function n_cst_sciter_treeview_option of_getroot (readonly boolean includingtree)
public function n_cst_sciter_treeview_option of_getroot ()
public function n_cst_sciter_treeview_option of_findoptionbytext (readonly string txt)
public function long of_accepttext ()
public function long of_load (readonly n_scitervalue data)
public function n_cst_sciter_treeview_option of_gettree ()
public function n_cst_sciter_treeview_option of_findoption (readonly string attrname, readonly string attrvalue)
public function integer of_findoptions (readonly string attrname, readonly string attrvalue, ref n_cst_sciter_treeview_option options[])
public function integer of_findoptionsbytext (readonly string txt, ref n_cst_sciter_treeview_option options[])
public function n_cst_sciter_treeview_option of_findoptionbytag (readonly string stag)
public function integer of_findoptionsbytag (readonly string stag, ref n_cst_sciter_treeview_option options[])
public function long of_setcssvars (readonly n_scitervalue data)
public function long of_setcssvar (readonly string name, readonly string val)
public function n_cst_sciter_treeview_option of_addoption (readonly string txt, readonly string image, readonly long imageposition, readonly string tiptext, readonly boolean textishtml)
public function long of_seticonfont (readonly string path, readonly string name)
public function long of_seticonfont (readonly string path)
public function n_cst_sciter_treeview_option of_addoption (readonly string txt, readonly string image, readonly long imageposition, readonly string tiptext)
end prototypes

public function n_cst_sciter_treeview_option of_addoption (readonly string txt, readonly string image, readonly string tiptext);return of_AddOption(txt,image,Enums.LEFT,tipText,false)
end function

public function n_cst_sciter_treeview_option of_addoption (readonly string txt, readonly string image, readonly long imageposition);return of_AddOption(txt,image,imagePosition,"",false)
end function

public function n_cst_sciter_treeview_option of_addoption (readonly string txt, readonly string image);return of_AddOption(txt,image,Enums.LEFT,"",false)
end function

public function n_cst_sciter_treeview_option of_addoption (readonly string txt);return of_AddOption(txt,"",0,"",false)
end function

public function long of_setcheckbox (readonly boolean checkbox);if #CheckBox = checkBox then return RetCode.OK

#CheckBox = checkBox

if #CheckBox then
	#Tree.SetAttribute("multiple","checkmarks")
else
	#Tree.RemoveAttribute("multiple")
end if

return RetCode.OK
end function

public function integer of_findoptions (readonly string cssselector, ref n_cst_sciter_treeview_option options[]);int nIndex,nCount
n_cst_sciter_treeview_option opts[]
n_sciterelement els[]

if CSSSelector = "" then return 0

nCount = #Tree.FindChildren(CSSSelector,ref els)
for nIndex = 1 to nCount
	opts[nIndex] = Create n_cst_sciter_treeview_option
	opts[nIndex].Event OnInit(this,els[nIndex])
next

options = opts

return nCount
end function

public function n_cst_sciter_treeview_option of_getoptionbyuid (readonly unsignedlong uid);n_cst_sciter_treeview_option opt

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(this,GetElementByUID(uid))

return opt
end function

public function long of_removeall ();#Tree.InvokeMethod("removeOptionAll")
return RetCode.OK
end function

public function long of_select (readonly n_cst_sciter_treeview_option option);return of_Select(option,true)
end function

public function long of_select (readonly n_cst_sciter_treeview_option option, readonly boolean triggerevent);if Not IsValidObject(option) then return RetCode.E_INVALID_OBJECT
if Not IsValidObject(option.#Element) then return RetCode.E_INVALID_OBJECT
if option.#Element.IsEmpty() then return RetCode.E_INVALID_ARGUMENT

if Not #Tree.InvokeMethod("selectOption",option.#Element,triggerEvent) then return RetCode.FAILED

option.of_ExpandParent(true)
option.of_ScrollToView()

return RetCode.OK
end function

public function n_cst_sciter_treeview_option of_getselected ();any aRet
n_cst_sciter_treeview_option opt
n_sciterelement el

aRet = #Tree.InvokeMethod("getSelectedOption")
if IsNull(aRet) then
	el = Create n_sciterelement
else
	el = aRet
end if

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(this,el)

return opt
end function

public function n_cst_sciter_treeview_option of_findoption (readonly string cssselector);n_cst_sciter_treeview_option opt

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(this,#Tree.FindChild(CSSSelector))

return opt
end function

public function n_cst_sciter_treeview_option of_getoptionbyid (readonly string id);n_cst_sciter_treeview_option opt

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(this,GetElementByID(id))

return opt
end function

public function long of_clearselection ();#Tree.InvokeMethod("clearSelection")
return RetCode.OK
end function

public function long of_remove (readonly n_cst_sciter_treeview_option option, readonly boolean changeselection, readonly boolean triggerevent);if Not IsValidObject(option) then return RetCode.E_INVALID_OBJECT
if Not IsValidObject(option.#Element) then return RetCode.E_INVALID_OBJECT
if option.#Element.IsEmpty() then return RetCode.E_INVALID_ARGUMENT

if Not #Tree.InvokeMethod("removeOption",option.#Element,changeSelection,triggerEvent) then return RetCode.FAILED

Destroy option.#Element
Destroy option

return RetCode.OK
end function

public function long of_remove (readonly n_cst_sciter_treeview_option option);return of_Remove(option,true,true)
end function

public function n_cst_sciter_treeview_option of_getroot (readonly boolean includingtree);n_sciterelement elRoot
n_cst_sciter_treeview_option opt

elRoot = #Tree.FindChild(">option")
if elRoot.IsEmpty() and includingTree then elRoot = #Tree

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(this,elRoot)

return opt
end function

public function n_cst_sciter_treeview_option of_getroot ();return of_GetRoot(false)
end function

public function n_cst_sciter_treeview_option of_findoptionbytext (readonly string txt);return of_FindOption("text",txt)
end function

public function long of_accepttext ();#Tree.InvokeMethod("acceptText")
return RetCode.OK
end function

public function long of_load (readonly n_scitervalue data);//====================================================================
// Function: of_load()
//--------------------------------------------------------------------
// Description: 从JSON加载
//--------------------------------------------------------------------
// Arguments:
// 	readonly	n_scitervalue	data	
//			[{text:"text",textIsHtml:false,image:"uri",imagePosition:0,tipText:"text",checked:false,disabledLook:false,attributes:{name:"val"},children:[{...}]},...]
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
#Tree.InvokeMethod("load",data)
return RetCode.OK
end function

public function n_cst_sciter_treeview_option of_gettree ();n_cst_sciter_treeview_option opt

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(this,#Tree)

return opt
end function

public function n_cst_sciter_treeview_option of_findoption (readonly string attrname, readonly string attrvalue);n_cst_sciter_treeview_option opt

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(this,#Tree.FindChild("option[" + attrName + "=~"" + attrValue + "~"]"))

return opt
end function

public function integer of_findoptions (readonly string attrname, readonly string attrvalue, ref n_cst_sciter_treeview_option options[]);int nIndex,nCount
n_cst_sciter_treeview_option opts[]
n_sciterelement els[]

if attrName = "" then return 0

nCount = #Tree.FindChildren("option[" + attrName + "=~"" + attrValue + "~"]",ref els)
for nIndex = 1 to nCount
	opts[nIndex] = Create n_cst_sciter_treeview_option
	opts[nIndex].Event OnInit(this,els[nIndex])
next

options = opts

return nCount
end function

public function integer of_findoptionsbytext (readonly string txt, ref n_cst_sciter_treeview_option options[]);return of_FindOptions("text",txt,ref options)
end function

public function n_cst_sciter_treeview_option of_findoptionbytag (readonly string stag);return of_FindOption("tag",sTag)
end function

public function integer of_findoptionsbytag (readonly string stag, ref n_cst_sciter_treeview_option options[]);return of_FindOptions("tag",sTag,ref options)
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
//		icon_size
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
if Not #Tree.InvokeMethod("setCSSVars",data) then return RetCode.FAILED
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

public function n_cst_sciter_treeview_option of_addoption (readonly string txt, readonly string image, readonly long imageposition, readonly string tiptext, readonly boolean textishtml);n_cst_sciter_treeview_option opt
n_sciterelement elOption

elOption = #Tree.InvokeMethod("addOption",txt,textIsHtml,image,imagePosition,tipText)

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(this,elOption)

return opt
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

if Not #Tree.InvokeMethod("setIconFont",path,name) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_seticonfont (readonly string path);return of_SetIconFont(path,"")
end function

public function n_cst_sciter_treeview_option of_addoption (readonly string txt, readonly string image, readonly long imageposition, readonly string tiptext);return of_AddOption(txt,image,imagePosition,tipText,false)
end function

on u_cst_sciter_treeview.create
call super::create
this.eventhandler=create eventhandler
end on

on u_cst_sciter_treeview.destroy
call super::destroy
destroy(this.eventhandler)
end on

event constructor;call super::constructor;//设置文字渲染的平滑模式为Clear-Type(High Quality)
SetOption(Enums.SC_OPT_FONT_SMOOTHING,Enums.SC_OPTV_FONT_CLEAR_TYPE)
//捕获Sciter事件和函数调用
EventHandler.SetFilter(Enums.SC_HANDLE_EVENT)

//加载html
LoadFile(IMPL_HTML)

#Tree.InvokeMethod("enableDragDrop",#AllowDrag)
end event

event onattachbehavior;call super::onattachbehavior;if name = "pfwTreeView" then
	//设置树的事件处理对象
	if IsValidObject(element) then
		#Tree = element
	else
		//因为PB9,10这里会为NULL,PBNI传不过来,所以只能手动取,坑.........
		#Tree = FindElement("#tree")
	end if
	#Tree.AttachEventHandler(EventHandler)
	return 1
end if
return 0
end event

type uo_logo from u_cst_sciter`uo_logo within u_cst_sciter_treeview
string tag = "SciterTreeview"
end type

type eventhandler from n_scitereventhandler within u_cst_sciter_treeview descriptor "pb_nvo" = "true" 
end type

on eventhandler.create
call super::create
end on

on eventhandler.destroy
call super::destroy
end on

event onevent;call super::onevent;n_cst_sciter_treeview_option optTarget,opt
n_scitervalue valData

if eventFlag = Enums.SC_EVT_CONTEXT_MENU_REQUEST then
	n_cst_sciter_treeview_option optEmpty
	n_sciterelement elEmpty
	elEmpty = Create n_sciterelement
	optEmpty = Create n_cst_sciter_treeview_option
	optEmpty.Event OnInit(Parent,elEmpty)
	return Parent.Event OnTVRightClicked(optEmpty)
end if

if eventFlag <> Enums.SC_EVT_CUSTOM_NAME then return 0

optTarget = Create n_cst_sciter_treeview_option

choose case name
	case "tv-clicked"
		optTarget.Event OnInit(parent,data)
		return Parent.Event OnTVClicked(optTarget)
	case "tv-dblclicked"
		optTarget.Event OnInit(parent,data)
		return Parent.Event OnTVDoubleClicked(optTarget)
	case "tv-rightclicked"
		optTarget.Event OnInit(parent,data)
		return Parent.Event OnTVRightClicked(optTarget)
	case "tv-dbrclicked"
		optTarget.Event OnInit(parent,data)
		return Parent.Event OnTVRightDoubleClicked(optTarget)
	case "tv-selection-changing"
		valData = data
		opt = Create n_cst_sciter_treeview_option
		opt.Event OnInit(parent,valData.GetItemElement("old"))
		optTarget.Event OnInit(parent,valData.GetItemElement("new"))
		return Parent.Event OnTVSelectionChanging(opt,optTarget)
	case "tv-selection-changed"
		valData = data
		opt = Create n_cst_sciter_treeview_option
		opt.Event OnInit(parent,valData.GetItemElement("old"))
		optTarget.Event OnInit(parent,valData.GetItemElement("new"))
		return Parent.Event OnTVSelectionChanged(opt,optTarget)
	case "tv-populate"
		optTarget.Event OnInit(parent,data)
		return Parent.Event OnTVPopulate(optTarget)
	case "tv-expanding"
		optTarget.Event OnInit(parent,data)
		return Parent.Event OnTVExpanding(optTarget)
	case "tv-expanded"
		optTarget.Event OnInit(parent,data)
		return Parent.Event OnTVExpanded(optTarget)
	case "tv-collapsing"
		optTarget.Event OnInit(parent,data)
		return Parent.Event OnTVCollapsing(optTarget)
	case "tv-collapsed"
		optTarget.Event OnInit(parent,data)
		return Parent.Event OnTVCollapsed(optTarget)
	case "tv-check-state-changing"
		valData = data
		optTarget.Event OnInit(parent,valData.GetItemElement("target"))
		return Parent.Event OnTVCheckStateChanging(optTarget,valData.GetItemLong("new"))
	case "tv-check-state-changed"
		valData = data
		optTarget.Event OnInit(parent,valData.GetItemElement("target"))
		return Parent.Event OnTVCheckStateChanged(optTarget,valData.GetItemLong("new"))
	case "tv-begin-drag"
		optTarget.Event OnInit(parent,data)
		return Parent.Event OnTVBeginDrag(optTarget)
	case "tv-end-drag"
		optTarget.Event OnInit(parent,data)
		return Parent.Event OnTVEndDrag(optTarget)
	case "tv-drag-enter"
		valData = data
		opt = Create n_cst_sciter_treeview_option
		opt.Event OnInit(parent,valData.GetItemElement("drag"))
		optTarget.Event OnInit(parent,valData.GetItemElement("target"))
		return Parent.Event OnTVDragEnter(optTarget,opt,valData.GetItemLong("where"))
	case "tv-drag-leave"
		valData = data
		opt = Create n_cst_sciter_treeview_option
		opt.Event OnInit(parent,valData.GetItemElement("drag"))
		optTarget.Event OnInit(parent,valData.GetItemElement("target"))
		return Parent.Event OnTVDragLeave(optTarget,opt,valData.GetItemLong("where"))
	case "tv-drag-drop"
		valData = data
		opt = Create n_cst_sciter_treeview_option
		opt.Event OnInit(parent,valData.GetItemElement("drag"))
		optTarget.Event OnInit(parent,valData.GetItemElement("target"))
		return Parent.Event OnTVDragDrop(optTarget,opt,valData.GetItemLong("where"))
	case "tv-begin-text-edit"
		optTarget.Event OnInit(parent,data)
		return Parent.Event OnTVBeginTextEdit(optTarget)
	case "tv-end-text-edit"
		valData = data
		optTarget.Event OnInit(parent,valData.GetItemElement("target"))
		reason = valData.GetItemLong("reason")
		return Parent.Event OnTVEndTextEdit(optTarget,valData.GetItemString("newText"),reason = 1,reason)
end choose

return 0
end event

