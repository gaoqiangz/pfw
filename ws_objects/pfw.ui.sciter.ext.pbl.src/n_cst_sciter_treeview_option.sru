$PBExportHeader$n_cst_sciter_treeview_option.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_sciter_treeview_option from nonvisualobject
end type
end forward

global type n_cst_sciter_treeview_option from nonvisualobject
event type long oninit ( u_cst_sciter_treeview tree,  n_sciterelement element )
end type
global n_cst_sciter_treeview_option n_cst_sciter_treeview_option

type variables
/*--- Constants ---*/
Public:
//- 节点勾选的状态
Constant Long CHECK_STATE_UNCHECKED			= 0	//勾选
Constant Long CHECK_STATE_CHECKED				= 1	//未勾选
Constant Long CHECK_STATE_INDETERMINATE	= 2	//不确定

/*--- Properties ---*/
Public:
PrivateWrite u_cst_sciter_treeview 	#ParentTreeView
privatewrite n_sciterelement 			#Tree
PrivateWrite n_sciterelement 			#Element

/*--- Implementation ---*/
private:
constant int PLACE_APPEND	= 0
constant int PLACE_BEFORE	= 1
constant int PLACE_AFTER	= 2
end variables
forward prototypes
public function string of_gettext ()
public function boolean of_isempty ()
public function boolean of_iscollapsed ()
public function boolean of_isexpanded ()
public function boolean of_isnode ()
public function boolean of_isleaf ()
public function long of_getcheckstate ()
public function long of_collapse (readonly boolean triggerevent)
public function long of_collapse ()
public function long of_collapseall (readonly boolean triggerevent)
public function long of_collapseall ()
public function long of_expand (readonly boolean triggerevent)
public function long of_expand ()
public function long of_expandall (readonly boolean triggerevent)
public function long of_expandall ()
public function long of_check (readonly boolean triggerevent)
public function long of_check ()
public function long of_uncheck (readonly boolean triggerevent)
public function long of_uncheck ()
public function long of_refreshparentcheckstate ()
public function long of_refreshparentcheckstate (readonly boolean triggerevent)
public function long of_edittext (readonly string newtext)
public function long of_edittext ()
public function boolean of_isselected ()
public function boolean of_ischecked ()
public function ulong of_getuid ()
public function long of_settiptext (readonly string tiptext)
public function long of_setattribute (readonly string name, readonly string value)
public function long of_removeattribute (readonly string name)
public function string of_getattribute (readonly string name)
public function n_cst_sciter_treeview_option of_findchild (readonly string cssselector)
public function integer of_findchildren (readonly string cssselector, ref n_cst_sciter_treeview_option options[])
public function n_cst_sciter_treeview_option of_findparent (readonly string cssselector)
public function n_cst_sciter_treeview_option of_addchild (readonly string text)
public function n_cst_sciter_treeview_option of_addchild (readonly string text, readonly string image)
public function n_cst_sciter_treeview_option of_addchild (readonly string text, readonly string image, readonly long imageposition)
public function n_cst_sciter_treeview_option of_addchild (readonly string text, readonly string image, readonly string tiptext)
public function long of_setenabled (readonly boolean benabled)
public function boolean of_isenabled ()
public function long of_removeattributes ()
public function string of_getid ()
public function long of_setid (readonly string id)
public function n_cst_sciter_treeview_option of_insertbefore (readonly string text, readonly string image, readonly string tiptext)
public function n_cst_sciter_treeview_option of_insertbefore (readonly string text, readonly string image, readonly long imageposition)
public function n_cst_sciter_treeview_option of_insertbefore (readonly string text, readonly string image)
public function n_cst_sciter_treeview_option of_insertbefore (readonly string text)
public function n_cst_sciter_treeview_option of_insertafter (readonly string text, readonly string image, readonly string tiptext)
public function n_cst_sciter_treeview_option of_insertafter (readonly string text, readonly string image, readonly long imageposition)
public function n_cst_sciter_treeview_option of_insertafter (readonly string text, readonly string image)
public function n_cst_sciter_treeview_option of_insertafter (readonly string text)
public function n_cst_sciter_treeview_option of_getfirstchild ()
public function n_cst_sciter_treeview_option of_getlastchild ()
public function n_cst_sciter_treeview_option of_getprevious ()
public function n_cst_sciter_treeview_option of_getnext ()
public function long of_setimage (string image)
public function long of_setdisabledlook (readonly boolean bset)
public function long of_expandparent (readonly boolean triggerevent)
public function long of_expandparent ()
public function long of_scrolltoview (readonly boolean topofview)
public function long of_scrolltoview ()
public function n_cst_sciter_treeview_option of_getparent (readonly boolean includingtree)
public function n_cst_sciter_treeview_option of_getparent ()
public function integer of_getindex ()
public function string of_getimage ()
public function string of_gettiptext ()
public function n_cst_sciter_treeview_option of_findchildbytext (readonly string text)
public function string of_getattribute (readonly string name, readonly string default)
public function string of_gettag ()
public function long of_settag (readonly string tag)
public function any of_getdata ()
public function long of_setdata (readonly any data)
public function boolean of_haschildren ()
public function n_cst_sciter_treeview_option of_findchildbytag (readonly string tag)
public function integer of_getchildren (ref n_cst_sciter_treeview_option options[], readonly boolean all)
public function integer of_getchildren (ref n_cst_sciter_treeview_option options[])
public function boolean of_isvalid ()
public function boolean of_ispopulated ()
public function integer of_findchildrenbytag (readonly string tag, ref n_cst_sciter_treeview_option options[])
public function integer of_findchildrenbytext (readonly string text, ref n_cst_sciter_treeview_option options[])
public function n_cst_sciter_treeview_option of_findparentbytag (readonly string tag)
public function n_cst_sciter_treeview_option of_findparentbytext (readonly string text)
public function integer of_findchildren (readonly string attrname, readonly string attrvalue, ref n_cst_sciter_treeview_option options[], readonly boolean all)
public function integer of_findchildren (readonly string attrname, readonly string attrvalue, ref n_cst_sciter_treeview_option options[])
public function n_cst_sciter_treeview_option of_findchild (readonly string attrname, readonly string attrvalue, readonly boolean all)
public function n_cst_sciter_treeview_option of_findchild (readonly string attrname, readonly string attrvalue)
public function n_cst_sciter_treeview_option of_findchildbytext (readonly string text, readonly boolean all)
public function n_cst_sciter_treeview_option of_findchildbytag (readonly string tag, readonly boolean all)
public function integer of_findchildrenbytag (readonly string tag, ref n_cst_sciter_treeview_option options[], readonly boolean all)
public function integer of_findchildrenbytext (readonly string text, ref n_cst_sciter_treeview_option options[], readonly boolean all)
public function n_cst_sciter_treeview_option of_findparent (readonly string attrname, readonly string attrvalue)
public function n_cst_sciter_treeview_option of_addchild (readonly string text, readonly string image, readonly long imageposition, readonly string tiptext, readonly boolean textishtml)
public function n_cst_sciter_treeview_option of_insertafter (readonly string text, readonly string image, readonly long imageposition, readonly string tiptext, readonly boolean textishtml)
public function n_cst_sciter_treeview_option of_insertbefore (readonly string text, readonly string image, readonly long imageposition, readonly string tiptext, readonly boolean textishtml)
public function n_cst_sciter_treeview_option of_addchild (readonly string text, readonly string image, readonly long imageposition, readonly string tiptext)
public function n_cst_sciter_treeview_option of_insertafter (readonly string text, readonly string image, readonly long imageposition, readonly string tiptext)
public function n_cst_sciter_treeview_option of_insertbefore (readonly string text, readonly string image, readonly long imageposition, readonly string tiptext)
public function long of_settext (readonly string text, readonly boolean textishtml)
public function integer of_settext (readonly string text)
private function n_cst_sciter_treeview_option _of_insertoption (readonly integer place, readonly string text, string image, readonly long imageposition, readonly string tiptext, readonly boolean textishtml)
end prototypes

event type long oninit(u_cst_sciter_treeview tree, n_sciterelement element);#ParentTreeView = tree
#Tree = tree.#Tree
#Element = element
if IsNull(#Element) then
	#Element = Create n_sciterelement
end if
return 0
end event

public function string of_gettext ();if #Element.IsEmpty() then return ""

return #ParentTreeView.#Tree.InvokeMethod("getText",#Element)
end function

public function boolean of_isempty ();return #Element.IsEmpty()
end function

public function boolean of_iscollapsed ();if #Element.IsEmpty() then return false

return #ParentTreeView.#Tree.InvokeMethod("isCollapsed",#Element)
end function

public function boolean of_isexpanded ();if #Element.IsEmpty() then return false

return #ParentTreeView.#Tree.InvokeMethod("isExpanded",#Element)
end function

public function boolean of_isnode ();if #Element.IsEmpty() then return false

return #ParentTreeView.#Tree.InvokeMethod("isNode",#Element)
end function

public function boolean of_isleaf ();if #Element.IsEmpty() then return false

return #ParentTreeView.#Tree.InvokeMethod("isLeaf",#Element)
end function

public function long of_getcheckstate ();if #Element.IsEmpty() then return -1

return #ParentTreeView.#Tree.InvokeMethod("getCheckState",#Element)
end function

public function long of_collapse (readonly boolean triggerevent);if #Element.IsEmpty() then return RetCode.FAILED

if Not #ParentTreeView.#Tree.InvokeMethod("collapseOption",#Element,triggerEvent) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_collapse ();return of_Collapse(false)
end function

public function long of_collapseall (readonly boolean triggerevent);if #Element.IsEmpty() then return RetCode.FAILED

if Not #ParentTreeView.#Tree.InvokeMethod("collapseOptionAll",#Element,triggerEvent) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_collapseall ();return of_CollapseAll(false)
end function

public function long of_expand (readonly boolean triggerevent);if #Element.IsEmpty() then return RetCode.FAILED

if Not #ParentTreeView.#Tree.InvokeMethod("expandOption",#Element,triggerEvent) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_expand ();return of_Expand(false)
end function

public function long of_expandall (readonly boolean triggerevent);if #Element.IsEmpty() then return RetCode.FAILED

if Not #ParentTreeView.#Tree.InvokeMethod("expandOptionAll",#Element,triggerEvent) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_expandall ();return of_ExpandAll(false)
end function

public function long of_check (readonly boolean triggerevent);if #Element.IsEmpty() then return RetCode.FAILED

if Not #ParentTreeView.#Tree.InvokeMethod("checkOption",#Element,triggerEvent) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_check ();return of_Check(false)
end function

public function long of_uncheck (readonly boolean triggerevent);if #Element.IsEmpty() then return RetCode.FAILED

if Not #ParentTreeView.#Tree.InvokeMethod("uncheckOption",#Element,triggerEvent) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_uncheck ();return of_Uncheck(false)
end function

public function long of_refreshparentcheckstate ();return of_refreshParentCheckState(false)
end function

public function long of_refreshparentcheckstate (readonly boolean triggerevent);if #Element.IsEmpty() then return RetCode.FAILED

if Not #ParentTreeView.#Tree.InvokeMethod("refreshParentCheckState",#Element,true,triggerEvent) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_edittext (readonly string newtext);if #Element.IsEmpty() then return RetCode.FAILED

if Not #ParentTreeView.#Tree.InvokeMethod("editText",#Element,newText) then return RetCode.FAILED

#ParentTreeView.SetFocus()

return RetCode.OK
end function

public function long of_edittext ();string nvl
SetNull(nvl)
return of_EditText(nvl)
end function

public function boolean of_isselected ();if #Element.IsEmpty() then return false

return #ParentTreeView.#Tree.InvokeMethod("isSelected",#Element)
end function

public function boolean of_ischecked ();return (of_GetCheckState() = CHECK_STATE_CHECKED)
end function

public function ulong of_getuid ();return #Element.GetUID()
end function

public function long of_settiptext (readonly string tiptext);if #Element.IsEmpty() then return RetCode.FAILED

if Not #Tree.InvokeMethod("setTipText",#Element,tipText) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_setattribute (readonly string name, readonly string value);return #Element.SetAttribute(name,value)
end function

public function long of_removeattribute (readonly string name);return #Element.RemoveAttribute(name)
end function

public function string of_getattribute (readonly string name);return #Element.GetAttribute(name)
end function

public function n_cst_sciter_treeview_option of_findchild (readonly string cssselector);n_cst_sciter_treeview_option opt

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(#ParentTreeView,#Element.FindChild(CSSSelector))

return opt
end function

public function integer of_findchildren (readonly string cssselector, ref n_cst_sciter_treeview_option options[]);int nIndex,nCount
n_cst_sciter_treeview_option opts[]
n_sciterelement els[]

if CSSSelector = "" then return 0

nCount = #Element.FindChildren(CSSSelector,ref els)
for nIndex = 1 to nCount
	opts[nIndex] = Create n_cst_sciter_treeview_option
	opts[nIndex].Event OnInit(#ParentTreeView,els[nIndex])
next

options = opts

return nCount
end function

public function n_cst_sciter_treeview_option of_findparent (readonly string cssselector);n_cst_sciter_treeview_option opt

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(#ParentTreeView,#Element.FindParent(CSSSelector))

return opt
end function

public function n_cst_sciter_treeview_option of_addchild (readonly string text);return of_AddChild(text,"",0,"",false)
end function

public function n_cst_sciter_treeview_option of_addchild (readonly string text, readonly string image);return of_AddChild(text,image,Enums.LEFT,"",false)
end function

public function n_cst_sciter_treeview_option of_addchild (readonly string text, readonly string image, readonly long imageposition);return of_AddChild(text,image,imagePosition,"",false)
end function

public function n_cst_sciter_treeview_option of_addchild (readonly string text, readonly string image, readonly string tiptext);return of_AddChild(text,image,Enums.LEFT,tipText,false)
end function

public function long of_setenabled (readonly boolean benabled);long rtCode

rtCode = #Element.SetEnabled(bEnabled)
if rtCode = RetCode.OK then
	if Not bEnabled then
		#Element.SetState(0,Enums.SC_STATE_CURRENT,true)
	end if
end if

return rtCode
end function

public function boolean of_isenabled ();return #Element.IsEnabled()
end function

public function long of_removeattributes ();int nIndex,nCount

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

public function string of_getid ();return #Element.GetID()
end function

public function long of_setid (readonly string id);return #Element.SetID(id)
end function

public function n_cst_sciter_treeview_option of_insertbefore (readonly string text, readonly string image, readonly string tiptext);return of_InsertBefore(text,image,Enums.LEFT,tipText,false)
end function

public function n_cst_sciter_treeview_option of_insertbefore (readonly string text, readonly string image, readonly long imageposition);return of_InsertBefore(text,image,imagePosition,"",false)
end function

public function n_cst_sciter_treeview_option of_insertbefore (readonly string text, readonly string image);return of_InsertBefore(text,image,Enums.LEFT,"",false)
end function

public function n_cst_sciter_treeview_option of_insertbefore (readonly string text);return of_InsertBefore(text,"",0,"",false)
end function

public function n_cst_sciter_treeview_option of_insertafter (readonly string text, readonly string image, readonly string tiptext);return of_InsertAfter(text,image,Enums.LEFT,tipText,false)
end function

public function n_cst_sciter_treeview_option of_insertafter (readonly string text, readonly string image, readonly long imageposition);return of_InsertAfter(text,image,imagePosition,"",false)
end function

public function n_cst_sciter_treeview_option of_insertafter (readonly string text, readonly string image);return of_InsertAfter(text,image,Enums.LEFT,"",false)
end function

public function n_cst_sciter_treeview_option of_insertafter (readonly string text);return of_InsertAfter(text,"",0,"",false)
end function

public function n_cst_sciter_treeview_option of_getfirstchild ();n_cst_sciter_treeview_option opt

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(#ParentTreeView,#Element.FindChild(">option"))

return opt
end function

public function n_cst_sciter_treeview_option of_getlastchild ();n_cst_sciter_treeview_option opt

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(#ParentTreeView,#Element.FindChild(">option:nth-last-child(1)"))

return opt
end function

public function n_cst_sciter_treeview_option of_getprevious ();n_cst_sciter_treeview_option opt
n_sciterelement elParent

elParent = #Element.GetPrevious()
if Not elParent.TestSelector("option") then
	elParent = Create n_sciterelement
end if

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(#ParentTreeView,elParent)

return opt
end function

public function n_cst_sciter_treeview_option of_getnext ();n_cst_sciter_treeview_option opt

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(#ParentTreeView,#Element.GetNext())

return opt
end function

public function long of_setimage (string image);if #Element.IsEmpty() then return RetCode.FAILED

if Not #Tree.InvokeMethod("setImage",#Element,image) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_setdisabledlook (readonly boolean bset);if #Element.IsEmpty() then return RetCode.FAILED

if Not #ParentTreeView.#Tree.InvokeMethod("setDisabledLook",#Element,bSet) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_expandparent (readonly boolean triggerevent);if #Element.IsEmpty() then return RetCode.FAILED

if Not #ParentTreeView.#Tree.InvokeMethod("expandParentOption",#Element,triggerEvent) then return RetCode.FAILED

return RetCode.OK
end function

public function long of_expandparent ();return of_ExpandParent(false)
end function

public function long of_scrolltoview (readonly boolean topofview);return #Element.ScrollToView(topOfView)
end function

public function long of_scrolltoview ();return of_ScrollToView(false)
end function

public function n_cst_sciter_treeview_option of_getparent (readonly boolean includingtree);n_cst_sciter_treeview_option opt
n_sciterelement elParent

elParent = #Element.GetOwner()

if Not elParent.IsEmpty() then
	if Not elParent.TestSelector("option") then
		if Not includingTree or Not elParent.TestSelector("select") then
			elParent = Create n_sciterelement
		end if
	end if
end if

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(#ParentTreeView,elParent)

return opt
end function

public function n_cst_sciter_treeview_option of_getparent ();return of_GetParent(false)
end function

public function integer of_getindex ();n_sciterelement elParent

if #Element.IsEmpty() then return 0

elParent = #Element.GetOwner()
if elParent.TestSelector("select") then
	return #Element.GetIndex()
else
	return #Element.GetIndex() - 1
end if
end function

public function string of_getimage ();return #Element.GetAttribute("image")
end function

public function string of_gettiptext ();return #Element.GetAttribute("tiptext")
end function

public function n_cst_sciter_treeview_option of_findchildbytext (readonly string text);return of_FindChild("text",text,false)
end function

public function string of_getattribute (readonly string name, readonly string default);return #Element.GetAttribute(name,default)
end function

public function string of_gettag ();return of_GetAttribute("tag")
end function

public function long of_settag (readonly string tag);return of_SetAttribute("tag",tag)
end function

public function any of_getdata ();return #Element.GetData()
end function

public function long of_setdata (readonly any data);return #Element.SetData(data)
end function

public function boolean of_haschildren ();return (Not #Element.FindChild(">option").IsEmpty())
end function

public function n_cst_sciter_treeview_option of_findchildbytag (readonly string tag);return of_FindChild("tag",tag)
end function

public function integer of_getchildren (ref n_cst_sciter_treeview_option options[], readonly boolean all);if all then
	return of_FindChildren("option",ref options)
else
	return of_FindChildren(">option",ref options)
end if
end function

public function integer of_getchildren (ref n_cst_sciter_treeview_option options[]);return of_GetChildren(ref options,false)
end function

public function boolean of_isvalid ();return #Element.IsValid()
end function

public function boolean of_ispopulated ();return #Element.GetAttribute("populated") = "true"
end function

public function integer of_findchildrenbytag (readonly string tag, ref n_cst_sciter_treeview_option options[]);return of_FindChildren("tag",tag,ref options,false)
end function

public function integer of_findchildrenbytext (readonly string text, ref n_cst_sciter_treeview_option options[]);return of_FindChildren("text",text,ref options,false)
end function

public function n_cst_sciter_treeview_option of_findparentbytag (readonly string tag);return of_FindParent("tag",tag)
end function

public function n_cst_sciter_treeview_option of_findparentbytext (readonly string text);return of_FindParent("text",text)
end function

public function integer of_findchildren (readonly string attrname, readonly string attrvalue, ref n_cst_sciter_treeview_option options[], readonly boolean all);int nIndex,nCount
string sCSSSelector
n_cst_sciter_treeview_option opts[]
n_sciterelement els[]

if attrName = "" then return 0

if Not all then sCSSSelector = ">"
sCSSSelector += "option[" + attrName + "=~"" + attrValue + "~"]"

nCount = #Element.FindChildren(sCSSSelector,ref els)
for nIndex = 1 to nCount
	opts[nIndex] = Create n_cst_sciter_treeview_option
	opts[nIndex].Event OnInit(#ParentTreeView,els[nIndex])
next

options = opts

return nCount
end function

public function integer of_findchildren (readonly string attrname, readonly string attrvalue, ref n_cst_sciter_treeview_option options[]);return of_FindChildren(attrName,attrValue,ref options,false)
end function

public function n_cst_sciter_treeview_option of_findchild (readonly string attrname, readonly string attrvalue, readonly boolean all);string sCSSSelector
n_cst_sciter_treeview_option opt

if Not all then sCSSSelector = ">"
sCSSSelector += "option[" + attrName + "=~"" + attrValue + "~"]"

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(#ParentTreeView,#Element.FindChild(sCSSSelector))

return opt
end function

public function n_cst_sciter_treeview_option of_findchild (readonly string attrname, readonly string attrvalue);return of_FindChild(attrName,attrValue,false)
end function

public function n_cst_sciter_treeview_option of_findchildbytext (readonly string text, readonly boolean all);return of_FindChild("text",text,all)
end function

public function n_cst_sciter_treeview_option of_findchildbytag (readonly string tag, readonly boolean all);return of_FindChild("tag",tag,false)
end function

public function integer of_findchildrenbytag (readonly string tag, ref n_cst_sciter_treeview_option options[], readonly boolean all);return of_FindChildren("tag",tag,ref options,all)
end function

public function integer of_findchildrenbytext (readonly string text, ref n_cst_sciter_treeview_option options[], readonly boolean all);return of_FindChildren("text",text,ref options,all)
end function

public function n_cst_sciter_treeview_option of_findparent (readonly string attrname, readonly string attrvalue);n_cst_sciter_treeview_option opt

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(#ParentTreeView,#Element.FindParent("option[" + attrName + "=~"" + attrValue + "~"]"))

return opt
end function

public function n_cst_sciter_treeview_option of_addchild (readonly string text, readonly string image, readonly long imageposition, readonly string tiptext, readonly boolean textishtml);return _of_InsertOption(PLACE_APPEND,text,image,imagePosition,tipText,textIsHtml)
end function

public function n_cst_sciter_treeview_option of_insertafter (readonly string text, readonly string image, readonly long imageposition, readonly string tiptext, readonly boolean textishtml);return _of_InsertOption(PLACE_AFTER,text,image,imagePosition,tipText,textIsHtml)
end function

public function n_cst_sciter_treeview_option of_insertbefore (readonly string text, readonly string image, readonly long imageposition, readonly string tiptext, readonly boolean textishtml);return _of_InsertOption(PLACE_BEFORE,text,image,imagePosition,tipText,textIsHtml)
end function

public function n_cst_sciter_treeview_option of_addchild (readonly string text, readonly string image, readonly long imageposition, readonly string tiptext);return of_AddChild(text,image,imagePosition,tipText,false)
end function

public function n_cst_sciter_treeview_option of_insertafter (readonly string text, readonly string image, readonly long imageposition, readonly string tiptext);return of_InsertAfter(text,image,imagePosition,tipText,false)
end function

public function n_cst_sciter_treeview_option of_insertbefore (readonly string text, readonly string image, readonly long imageposition, readonly string tiptext);return of_InsertBefore(text,image,imagePosition,tipText,false)
end function

public function long of_settext (readonly string text, readonly boolean textishtml);if #Element.IsEmpty() then return RetCode.FAILED

if Not #ParentTreeView.#Tree.InvokeMethod("setText",#Element,text,textIsHtml) then return RetCode.FAILED

return RetCode.OK
end function

public function integer of_settext (readonly string text);return of_SetText(text,false)
end function

private function n_cst_sciter_treeview_option _of_insertoption (readonly integer place, readonly string text, string image, readonly long imageposition, readonly string tiptext, readonly boolean textishtml);n_cst_sciter_treeview_option opt
n_sciterelement elOption

if #Element.IsValid() then
	elOption = #ParentTreeView.#Tree.InvokeMethod("insertOption",#Element,place,text,textIsHtml,image,imagePosition,tipText)
else
	elOption = Create n_sciterelement
end if

opt = Create n_cst_sciter_treeview_option
opt.Event OnInit(#ParentTreeView,elOption)

return opt
end function

on n_cst_sciter_treeview_option.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_sciter_treeview_option.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

