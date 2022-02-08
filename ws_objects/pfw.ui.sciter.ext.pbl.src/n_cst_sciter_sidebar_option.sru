$PBExportHeader$n_cst_sciter_sidebar_option.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_sciter_sidebar_option from nonvisualobject
end type
end forward

global type n_cst_sciter_sidebar_option from nonvisualobject
event type long oninit ( u_cst_sciter_sidebar sidebar,  n_sciterelement element )
end type
global n_cst_sciter_sidebar_option n_cst_sciter_sidebar_option

type variables
/*--- Properties ---*/
public:
privatewrite u_cst_sciter_sidebar 	#ParentSidebar
privatewrite n_sciterelement 			#Bar
privatewrite n_sciterelement 			#Element

/*--- Implementation ---*/
private:
constant int PLACE_APPEND	= 0
constant int PLACE_BEFORE	= 1
constant int PLACE_AFTER	= 2
end variables

forward prototypes
private function n_cst_sciter_sidebar_option _of_insertoption (readonly integer place, readonly string text, readonly string image, readonly string tiptext, readonly boolean textishtml)
public function n_cst_sciter_sidebar_option of_addchild (readonly string text, readonly string image, readonly string tiptext, readonly boolean textishtml)
public function n_cst_sciter_sidebar_option of_addchild (readonly string text, readonly string image, readonly string tiptext)
public function n_cst_sciter_sidebar_option of_addchild (readonly string text, readonly string image)
public function n_cst_sciter_sidebar_option of_addchild (readonly string text)
public function string of_gettext ()
public function long of_settext (readonly string text, readonly boolean textishtml)
public function long of_scrolltoview (readonly boolean topofview)
public function long of_scrolltoview ()
public function long of_setattribute (readonly string name, readonly string value)
public function long of_setdata (readonly any data)
public function long of_setid (readonly string id)
public function long of_setimage (readonly string image)
public function long of_settag (readonly string tag)
public function string of_getimage ()
public function string of_getattribute (readonly string name, readonly string default)
public function string of_getattribute (readonly string name)
public function any of_getdata ()
public function string of_getid ()
public function unsignedlong of_getuid ()
public function boolean of_isvalid ()
public function boolean of_isempty ()
public function string of_gettiptext ()
public function long of_settiptext (readonly string tiptext)
public function n_cst_sciter_sidebar_option of_getlastchild ()
public function n_cst_sciter_sidebar_option of_getfirstchild ()
public function n_cst_sciter_sidebar_option of_getnext ()
public function n_cst_sciter_sidebar_option of_getprevious ()
public function n_cst_sciter_sidebar_option of_getparent (readonly boolean includingbar)
public function n_cst_sciter_sidebar_option of_getparent ()
public function boolean of_haschildren ()
public function integer of_getindex ()
public function boolean of_iscollapsed ()
public function boolean of_isexpanded ()
public function boolean of_isnode ()
public function boolean of_isleaf ()
public function boolean of_ispopulated ()
public function boolean of_isselected ()
public function long of_removeattribute (readonly string name)
public function long of_removeattributes ()
public function long of_expand (readonly boolean triggerevent)
public function long of_collapse (readonly boolean triggerevent)
public function long of_expand ()
public function long of_collapse ()
public function n_cst_sciter_sidebar_option of_insertafter (readonly string text, readonly string image, readonly string tiptext, readonly boolean textishtml)
public function n_cst_sciter_sidebar_option of_insertafter (readonly string text, readonly string image, readonly string tiptext)
public function n_cst_sciter_sidebar_option of_insertafter (readonly string text, readonly string image)
public function n_cst_sciter_sidebar_option of_insertafter (readonly string text)
public function n_cst_sciter_sidebar_option of_insertbefore (readonly string text, readonly string image, readonly string tiptext, readonly boolean textishtml)
public function n_cst_sciter_sidebar_option of_insertbefore (readonly string text, readonly string image, readonly string tiptext)
public function n_cst_sciter_sidebar_option of_insertbefore (readonly string text, readonly string image)
public function n_cst_sciter_sidebar_option of_insertbefore (readonly string text)
public function long of_removechildren ()
public function integer of_settext (readonly string text)
end prototypes

event type long oninit(u_cst_sciter_sidebar sidebar, n_sciterelement element);#ParentSidebar = sidebar
#Bar = sidebar.#Bar
#Element = element
if IsNull(#Element) then
	#Element = Create n_sciterelement
end if
return 0
end event

private function n_cst_sciter_sidebar_option _of_insertoption (readonly integer place, readonly string text, readonly string image, readonly string tiptext, readonly boolean textishtml);n_cst_sciter_sidebar_option opt
n_sciterelement elOption

if #Element.IsEmpty() then return this

elOption = #Bar.InvokeMethod("insertOption",#Element,place,text,textIsHtml,image,tipText)

opt = Create n_cst_sciter_sidebar_option
opt.Event OnInit(#ParentSidebar,elOption)

return opt
end function

public function n_cst_sciter_sidebar_option of_addchild (readonly string text, readonly string image, readonly string tiptext, readonly boolean textishtml);//====================================================================
// Function: of_addchild()
//--------------------------------------------------------------------
// Description: 添加子菜单项
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string 	text      	
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
return _of_InsertOption(PLACE_APPEND,text,image,tipText,textIsHtml)
end function

public function n_cst_sciter_sidebar_option of_addchild (readonly string text, readonly string image, readonly string tiptext);return _of_InsertOption(PLACE_APPEND,text,image,tipText,false)
end function

public function n_cst_sciter_sidebar_option of_addchild (readonly string text, readonly string image);return _of_InsertOption(PLACE_APPEND,text,image,"",false)
end function

public function n_cst_sciter_sidebar_option of_addchild (readonly string text);return _of_InsertOption(PLACE_APPEND,text,"","",false)
end function

public function string of_gettext ();//====================================================================
// Function: of_gettext()
//--------------------------------------------------------------------
// Description: 获取文本
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return #Element.GetAttribute("text")
end function

public function long of_settext (readonly string text, readonly boolean textishtml);//====================================================================
// Function: of_settext()
//--------------------------------------------------------------------
// Description: 设置文本
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string 	text      	
// 	readonly	boolean	textishtml	
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
if #Element.IsEmpty() then return RetCode.FAILED

if Not #Bar.InvokeMethod("setText",#Element,text,textIsHtml) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_scrolltoview (readonly boolean topofview);//====================================================================
// Function: of_scrolltoview()
//--------------------------------------------------------------------
// Description: 滚动到视图区域
//--------------------------------------------------------------------
// Arguments:
// 	readonly	boolean	topofview	视图的首部
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
return #Element.ScrollToView(topOfView)
end function

public function long of_scrolltoview ();return of_ScrollToView(false)
end function

public function long of_setattribute (readonly string name, readonly string value);//====================================================================
// Function: of_setattribute()
//--------------------------------------------------------------------
// Description: 设置字符串属性
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	name 	
// 	readonly	string	value	
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
return #Element.SetAttribute(name,value)
end function

public function long of_setdata (readonly any data);//====================================================================
// Function: of_setdata()
//--------------------------------------------------------------------
// Description: 设置私有数据
//--------------------------------------------------------------------
// Arguments:
// 	readonly	any	data	
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
return #Element.SetData(data)
end function

public function long of_setid (readonly string id);//====================================================================
// Function: of_setid()
//--------------------------------------------------------------------
// Description: 设置ID
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	id	
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
return #Element.SetID(id)
end function

public function long of_setimage (readonly string image);//====================================================================
// Function: of_setimage()
//--------------------------------------------------------------------
// Description: 设置图标
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string 	image     
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
if #Element.IsEmpty() then return RetCode.FAILED

if Not #Bar.InvokeMethod("setImage",#Element,image) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_settag (readonly string tag);//====================================================================
// Function: of_settag()
//--------------------------------------------------------------------
// Description: 设置tag
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	tag	
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
return #Element.SetAttribute("tag",tag)
end function

public function string of_getimage ();//====================================================================
// Function: of_getimage()
//--------------------------------------------------------------------
// Description: 获取图标
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return #Element.GetAttribute("image")
end function

public function string of_getattribute (readonly string name, readonly string default);//====================================================================
// Function: of_getattribute()
//--------------------------------------------------------------------
// Description: 获取属性值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	name   	
// 	readonly	string	default	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return #Element.GetAttribute(name,default)
end function

public function string of_getattribute (readonly string name);return #Element.GetAttribute(name)
end function

public function any of_getdata ();//====================================================================
// Function: of_getdata()
//--------------------------------------------------------------------
// Description: 获取私有数据
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  any
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return #Element.GetData()
end function

public function string of_getid ();//====================================================================
// Function: of_getid()
//--------------------------------------------------------------------
// Description: 获取ID
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return #Element.GetID()
end function

public function unsignedlong of_getuid ();//====================================================================
// Function: of_getuid()
//--------------------------------------------------------------------
// Description: 获取唯一ID
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  unsignedlong
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return #Element.GetUID()
end function

public function boolean of_isvalid ();//====================================================================
// Function: of_isvalid()
//--------------------------------------------------------------------
// Description: 判断节点是否有效
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
return #Element.IsValid()
end function

public function boolean of_isempty ();//====================================================================
// Function: of_isempty()
//--------------------------------------------------------------------
// Description: 判断节点是否无效
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
return #Element.IsEmpty()
end function

public function string of_gettiptext ();//====================================================================
// Function: of_gettiptext()
//--------------------------------------------------------------------
// Description: 获取提示文本
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return #Element.GetAttribute("tiptext")
end function

public function long of_settiptext (readonly string tiptext);//====================================================================
// Function: of_settiptext()
//--------------------------------------------------------------------
// Description: 设置提示文本
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string 	tiptext      	
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
if #Element.IsEmpty() then return RetCode.FAILED

if Not #Bar.InvokeMethod("setTipText",#Element,tipText) then return RetCode.FAILED

return RetCode.OK
end function

public function n_cst_sciter_sidebar_option of_getlastchild ();//====================================================================
// Function: of_getlastchild()
//--------------------------------------------------------------------
// Description: 获取最后一个子菜单项
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

if #Element.IsEmpty() then return this

opt = Create n_cst_sciter_sidebar_option
opt.Event OnInit(#ParentSidebar,#Element.FindChild(">options>option:nth-last-child(1)"))

return opt
end function

public function n_cst_sciter_sidebar_option of_getfirstchild ();//====================================================================
// Function: of_getfirstchild()
//--------------------------------------------------------------------
// Description: 获取第一个子菜单项
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

if #Element.IsEmpty() then return this

opt = Create n_cst_sciter_sidebar_option
opt.Event OnInit(#ParentSidebar,#Element.FindChild(">options>option"))

return opt
end function

public function n_cst_sciter_sidebar_option of_getnext ();//====================================================================
// Function: of_getnext()
//--------------------------------------------------------------------
// Description: 获取同级的下一个兄弟菜单项
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

if #Element.IsEmpty() then return this

opt = Create n_cst_sciter_sidebar_option
opt.Event OnInit(#ParentSidebar,#Element.GetNext())

return opt
end function

public function n_cst_sciter_sidebar_option of_getprevious ();//====================================================================
// Function: of_getprevious()
//--------------------------------------------------------------------
// Description: 获取同级的上一个兄弟菜单项
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

if #Element.IsEmpty() then return this

opt = Create n_cst_sciter_sidebar_option
opt.Event OnInit(#ParentSidebar,#Element.GetPrevious())

return opt
end function

public function n_cst_sciter_sidebar_option of_getparent (readonly boolean includingbar);//====================================================================
// Function: of_getparent()
//--------------------------------------------------------------------
// Description: 获取父菜单项
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
n_cst_sciter_sidebar_option opt
n_sciterelement elParent

if #Element.IsEmpty() then return this

if includingBar then
	elParent = #Element.FindParent("option,sidebar")
else
	elParent = #Element.FindParent("option")
end if

opt = Create n_cst_sciter_sidebar_option
opt.Event OnInit(#ParentSidebar,elParent)

return opt
end function

public function n_cst_sciter_sidebar_option of_getparent ();return of_GetParent(false)
end function

public function boolean of_haschildren ();//====================================================================
// Function: of_haschildren()
//--------------------------------------------------------------------
// Description: 判断是否有子菜单项
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return (Not #Element.FindChild(">options>option").IsEmpty())
end function

public function integer of_getindex ();//====================================================================
// Function: of_getindex()
//--------------------------------------------------------------------
// Description: 获取在父节点中的索引顺序
//--------------------------------------------------------------------
// Arguments:
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
return #Element.GetIndex()
end function

public function boolean of_iscollapsed ();//====================================================================
// Function: of_iscollapsed()
//--------------------------------------------------------------------
// Description: 判断节点是否被折叠
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return #Element.GetState(Enums.SC_STATE_COLLAPSED)
end function

public function boolean of_isexpanded ();//====================================================================
// Function: of_isexpanded()
//--------------------------------------------------------------------
// Description: 判断节点是否被展开
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return #Element.GetState(Enums.SC_STATE_EXPANDED)
end function

public function boolean of_isnode ();//====================================================================
// Function: of_isnode()
//--------------------------------------------------------------------
// Description: 判断是否为菜单组
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return (Not #Element.FindChild(">options").IsEmpty())
end function

public function boolean of_isleaf ();//====================================================================
// Function: of_isleaf()
//--------------------------------------------------------------------
// Description: 判断是否为菜单项
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return #Element.FindChild(">options").IsEmpty()
end function

public function boolean of_ispopulated ();//====================================================================
// Function: of_ispopulated()
//--------------------------------------------------------------------
// Description: 判断菜单组是否展开过
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return (#Element.GetAttribute("populated") = "true")
end function

public function boolean of_isselected ();//====================================================================
// Function: of_isselected()
//--------------------------------------------------------------------
// Description: 判断菜单项是否为当前选择项
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-04-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return #Element.GetState(Enums.SC_STATE_CURRENT)
end function

public function long of_removeattribute (readonly string name);//====================================================================
// Function: of_removeattribute()
//--------------------------------------------------------------------
// Description: 删除属性
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	name	
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
return #Element.RemoveAttribute(name)
end function

public function long of_removeattributes ();//====================================================================
// Function: of_removeattributes()
//--------------------------------------------------------------------
// Description: 删除所有属性
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
int nIndex,nCount

if #Element.IsEmpty() then return RetCode.FAILED

nCount = #Element.GetAttributeCount()
for nIndex = nCount to 1 step -1
	choose case #Element.GetAttributeName(nIndex)
		case "text","image","tiptext"
		case else
			#Element.RemoveAttribute(nIndex)
	end choose
next

return RetCode.OK
end function

public function long of_expand (readonly boolean triggerevent);//====================================================================
// Function: of_expand()
//--------------------------------------------------------------------
// Description: 展开菜单组
//--------------------------------------------------------------------
// Arguments:
// 	readonly	boolean	triggerevent	
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
if #Element.IsEmpty() then return RetCode.FAILED

if Not #Bar.InvokeMethod("expandOption",#Element,triggerEvent) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_collapse (readonly boolean triggerevent);//====================================================================
// Function: of_collapse()
//--------------------------------------------------------------------
// Description: 折叠菜单组
//--------------------------------------------------------------------
// Arguments:
// 	readonly	boolean	triggerevent	
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
if #Element.IsEmpty() then return RetCode.FAILED

if Not #Bar.InvokeMethod("collapseOption",#Element,triggerEvent) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_expand ();return of_Expand(false)
end function

public function long of_collapse ();return of_Collapse(false)
end function

public function n_cst_sciter_sidebar_option of_insertafter (readonly string text, readonly string image, readonly string tiptext, readonly boolean textishtml);//====================================================================
// Function: of_insertafter()
//--------------------------------------------------------------------
// Description: 添加菜单项到此节点后面
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string 	text      	
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
return _of_InsertOption(PLACE_AFTER,text,image,tipText,textIsHtml)
end function

public function n_cst_sciter_sidebar_option of_insertafter (readonly string text, readonly string image, readonly string tiptext);return _of_InsertOption(PLACE_AFTER,text,image,tipText,false)
end function

public function n_cst_sciter_sidebar_option of_insertafter (readonly string text, readonly string image);return _of_InsertOption(PLACE_AFTER,text,image,"",false)
end function

public function n_cst_sciter_sidebar_option of_insertafter (readonly string text);return _of_InsertOption(PLACE_APPEND,text,"","",false)
end function

public function n_cst_sciter_sidebar_option of_insertbefore (readonly string text, readonly string image, readonly string tiptext, readonly boolean textishtml);//====================================================================
// Function: of_insertbefore()
//--------------------------------------------------------------------
// Description: 添加菜单项到此节点前面
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string 	text      	
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
return _of_InsertOption(PLACE_BEFORE,text,image,tipText,textIsHtml)
end function

public function n_cst_sciter_sidebar_option of_insertbefore (readonly string text, readonly string image, readonly string tiptext);return _of_InsertOption(PLACE_BEFORE,text,image,tipText,false)
end function

public function n_cst_sciter_sidebar_option of_insertbefore (readonly string text, readonly string image);return _of_InsertOption(PLACE_BEFORE,text,image,"",false)
end function

public function n_cst_sciter_sidebar_option of_insertbefore (readonly string text);return _of_InsertOption(PLACE_BEFORE,text,"","",false)
end function

public function long of_removechildren ();//====================================================================
// Function: of_removechildren()
//--------------------------------------------------------------------
// Description: 删除所有子菜单项
//--------------------------------------------------------------------
// Arguments:
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
if #Element.IsEmpty() then return RetCode.FAILED

if Not #Bar.InvokeMethod("removeOptionChildren",#Element) then return RetCode.FAILED

return RetCode.OK
end function

public function integer of_settext (readonly string text);return of_SetText(text,false)
end function

on n_cst_sciter_sidebar_option.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_sciter_sidebar_option.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

