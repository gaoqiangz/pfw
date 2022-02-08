$PBExportHeader$se_cst_treeview.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type se_cst_treeview from s_cst_treeview
end type
type tvhittestinfo from structure within se_cst_treeview
end type
type tvfindparamtext from structure within se_cst_treeview
end type
type tvfindparam from structure within se_cst_treeview
end type
type findcallback from n_cst_treeview_findcallback within se_cst_treeview
end type
end forward

type TVHITTESTINFO from structure
	point		pt
	ulong		flags
	ulong		hitem
end type

type tvfindparam from structure
	string		text
	boolean		matchcase
	boolean		fullmatch
	boolean		ignoregroup
end type

global type se_cst_treeview from s_cst_treeview
integer height = 452
integer textsize = -10
fontcharset fontcharset = defaultcharset!
string facename = "Arial"
long backcolor = 16777215
event type long onthemeregistering ( )
event onthemeregistered ( )
event onthememgrnotify ( boolean colorchanged,  boolean stylechanged )
event ontvnselchanged pbm_tvnselchanged
event ontvnendlabeledit pbm_tvnendlabeledit
findcallback findcallback
end type
global se_cst_treeview se_cst_treeview

type prototypes
Private:
Function boolean SendMessageRect(ulong hwnd,ulong msg,ulong wparam,ref RECT lpRect) Library "User32.dll" Alias for "SendMessageW"
Function ulong SendMessageTVHitTestInfo(ulong hwnd,ulong msg,ulong wparam,ref TVHITTESTINFO lpTVHitTestInfo) Library "User32.dll" Alias for "SendMessageW"
end prototypes

type variables
/*--- Properties ---*/
Public:
ProtectedWrite Boolean 	#BoldSelected
ProtectedWrite Long 		#ItemHeight
ProtectedWrite Ulong 		#BackColor
ProtectedWrite Ulong 		#TextColor
ProtectedWrite Ulong 		#LineColor

/*--- Implementation ---*/
Private:
//Messages
Constant Uint TVM_GETITEMRECT 	= 4356
Constant Uint TVM_HITTEST			= 4369
Constant Uint TVM_SETITEMHEIGHT	= 4379
Constant Uint TVM_GETITEMHEIGHT	= 4380
Constant Uint TVM_SETBKCOLOR		= 4381
Constant Uint TVM_GETBKCOLOR		= 4383
Constant Uint TVM_SETTEXTCOLOR	= 4382
Constant Uint TVM_GETTEXTCOLOR	= 4384
Constant Uint TVM_SETLINECOLOR	= 4392
Constant Uint TVM_GETLINECOLOR	= 4393

long _hItemLastBold
boolean _bSwitchEditLabels
end variables

forward prototypes
public function integer of_getimageindex (string imagename)
public function long of_insertitem (readonly treeviewitem tvitem)
public function long of_insertitem (readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data)
public function long of_insertitem (readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data, readonly boolean haschilds)
public function long of_insertitem (readonly long hitem, readonly treeviewitem tvitem)
public function long of_insertitem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data)
public function long of_insertitem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data, readonly boolean haschilds)
public function long of_addchilditem (readonly long hitem, readonly treeviewitem tvitem)
public function long of_addchilditem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data)
public function long of_addchilditem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data, readonly boolean haschilds)
public function long of_insertchilditem (readonly long hitem, readonly treeviewitem tvitem)
public function long of_insertchilditem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data)
public function long of_insertchilditem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data, readonly boolean haschilds)
public function long of_additem (readonly treeviewitem tvitem)
public function long of_additem (readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data)
public function long of_additem (readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data, readonly boolean haschilds)
public function long of_additem (readonly long hitem, readonly treeviewitem tvitem)
public function long of_additem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data)
public function long of_additem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data, readonly boolean haschilds)
public function long of_remove (readonly long hitem)
public function long of_removeall ()
public function long of_finditem (readonly treenavigation navcode, readonly long hitem)
public function long of_settext (readonly long hitem, readonly string text)
public function long of_setdata (readonly long hitem, readonly any data)
public function long of_setimage (readonly long hitem, readonly integer picindex, readonly integer selectedpicindex)
public function string of_gettext (readonly long hitem)
public function any of_getdata (readonly long hitem)
public function long of_getitem (readonly long hitem, ref treeviewitem tvitem)
public function long of_setitem (readonly long hitem, readonly treeviewitem tvitem)
public function long of_copychildren (readonly long hitemdst, readonly long hitemsrc)
public function long of_getlevel (readonly long hitem)
public function boolean of_isparent (readonly long hparentitem, readonly long hitem)
public function unsignedlong of_getrealitemfrompoint (readonly long xpos, readonly long ypos)
public function long of_getrealitemrect (readonly unsignedlong hitem, ref rect itemrect)
public function long of_getchild (readonly long hitem)
public function long of_getnext (readonly long hitem)
public function long of_getparent (readonly long hitem)
public function long of_getparent (readonly long hitem1, readonly long hitem2)
public function long of_getprevious (readonly long hitem)
public function long of_getroot ()
public function long of_getselected ()
public function long of_select (readonly long hitem)
public function long of_settextcolor (readonly unsignedlong rgbcolor)
public function long of_setlinecolor (readonly unsignedlong rgbcolor)
public function long of_setitemheight (readonly long nheight)
public function long of_setbackcolor (readonly unsignedlong rgbcolor)
public function long of_expandall (readonly long hitem)
public function long of_expand (readonly long hitem)
public function long of_collapse (readonly long hitem)
public function long of_collapseall (readonly long hitem)
public function boolean of_isexpanded (readonly long hitem)
public function boolean of_iscollapsed (readonly long hitem)
public function long of_settextbold (readonly long hitem, readonly boolean bold)
public function boolean of_istextbold (readonly long hitem)
private subroutine _of_setbolditem (readonly long hitem)
public function long of_setboldselected (readonly boolean boldselected)
public function long of_editlabel (readonly long hitem)
public function long of_finditembytext (string text, readonly boolean matchcase, readonly boolean fullmatch, readonly boolean ignoregroup)
public function boolean of_haschildren (readonly long hitem)
public function long of_findchilditem (readonly long hitem, readonly n_cst_treeview_findcallback callback, readonly any param)
public function long of_finditem (readonly n_cst_treeview_findcallback callback, readonly any param)
public function long of_finditem (longlong hitemstart, readonly n_cst_treeview_findcallback callback, readonly any param)
public function long of_findchilditembytext (readonly long hitem, readonly string text, readonly boolean matchcase, readonly boolean fullmatch, readonly boolean ignoregroup)
public function long of_finditembytext (readonly long hitemstart, readonly string text, readonly boolean matchcase, readonly boolean fullmatch, readonly boolean ignoregroup)
end prototypes

event onthememgrnotify(boolean colorchanged, boolean stylechanged);Boolean bLockUpdate

bLockUpdate = #LockUpdate
#LockUpdate = true

if colorChanged then
	theme.of_SetBkgndColorStyle(ThemeManager().#ColorStyle)
end if

if styleChanged then
	choose case ThemeManager().#Style
		case n_cst_thememanager.WIN8
			theme.of_SetBkgndStyle(Enums.SOLID)
			theme.of_SetBorderStyle(Enums.BS_SOLID)
			theme.of_SetScrollBarBorderStyle(Enums.BS_SOLID)
		case n_cst_thememanager.WIN7
			theme.of_SetBkgndStyle(Enums.VISTAORIGINAL)
			theme.of_SetBorderStyle(Enums.BS_ROUND)
			theme.of_SetScrollBarBorderStyle(Enums.BS_ROUND)
		case n_cst_thememanager.XP
			theme.of_SetBkgndStyle(Enums.XP)
			theme.of_SetBorderStyle(Enums.BS_ROUND)
			theme.of_SetScrollBarBorderStyle(Enums.BS_ROUND)
		case n_cst_thememanager.QQ
			theme.of_SetBkgndStyle(Enums.XP)
			theme.of_SetBorderStyle(Enums.BS_ROUND)
			theme.of_SetScrollBarBorderStyle(Enums.BS_ROUND)
	end choose
end if

if colorChanged then
	of_SetBackColor(ToRGB(theme.of_GetColor(theme.CLR_BKGND,0)))
	of_SetTextColor(ToRGB(theme.of_GetColor(theme.CLR_TEXT,0)))
	of_SetLineColor(ToRGB(theme.of_GetColor(theme.CLR_LINE,0)))
end if

#LockUpdate = bLockUpdate
of_Redraw(false)
end event

event ontvnselchanged;if #BoldSelected then
	_of_SetBoldItem(newHandle)
end if
return Event SelectionChanged(oldHandle,newHandle)
end event

event ontvnendlabeledit;long rtCode

rtCode = Event EndLabelEdit(handle,newText)

if _bSwitchEditLabels then
	EditLabels = false
	_bSwitchEditLabels = false
end if

return rtCode
end event

public function integer of_getimageindex (string imagename);int index

imageName = Lower(Trim(imageName))

for index = 1 to UpperBound(PictureName)
	if Lower(PictureName[index]) = imageName then return index
next

return AddPicture(imageName)
end function

public function long of_insertitem (readonly treeviewitem tvitem);return of_InsertItem(0,tvItem)
end function

public function long of_insertitem (readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data);return of_InsertItem(0,label,picIndex,selectedPicIndex,data,false)
end function

public function long of_insertitem (readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data, readonly boolean haschilds);return of_InsertItem(0,label,picIndex,selectedPicIndex,data,hasChilds)
end function

public function long of_insertitem (readonly long hitem, readonly treeviewitem tvitem);long hParentItem,hInsertedItem

if hItem > 0 then
	hParentItem = FindItem(ParentTreeItem!,hItem)
	if hParentItem <= 0 then
		hParentItem = 0
	end if
end if

hInsertedItem = FindItem(PreviousTreeItem!,hItem)

if hInsertedItem > 0 then
	return InsertItem(hParentItem,hInsertedItem,tvItem)
else
	return InsertItemFirst(hParentItem,tvItem)
end if
end function

public function long of_insertitem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data);return of_InsertItem(hItem,label,picIndex,selectedPicIndex,data,false)
end function

public function long of_insertitem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data, readonly boolean haschilds);long hParentItem,hInsertedItem
TREEVIEWITEM newItem

if hItem > 0 then
	hParentItem = FindItem(ParentTreeItem!,hItem)
	if hParentItem <= 0 then
		hParentItem = 0
	end if
end if

newItem.Label 						= label
newItem.PictureIndex 			= picIndex
newItem.SelectedPictureIndex 	= selectedPicIndex
newItem.Data 						= data
newItem.Children 					= hasChilds

hInsertedItem = FindItem(PreviousTreeItem!,hItem)

if hInsertedItem > 0 then
	return InsertItem(hParentItem,hInsertedItem,newItem)
else
	return InsertItemFirst(hParentItem,newItem)
end if
end function

public function long of_addchilditem (readonly long hitem, readonly treeviewitem tvitem);if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

return InsertItemLast(hItem,tvItem)
end function

public function long of_addchilditem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data);return of_AddChildItem(hItem,label,picIndex,selectedPicIndex,data,false)
end function

public function long of_addchilditem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data, readonly boolean haschilds);TREEVIEWITEM newItem

if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

newItem.Label 						= label
newItem.PictureIndex 			= picIndex
newItem.SelectedPictureIndex 	= selectedPicIndex
newItem.Data 						= data
newItem.Children 					= hasChilds

return InsertItemLast(hItem,newItem)
end function

public function long of_insertchilditem (readonly long hitem, readonly treeviewitem tvitem);if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

return InsertItemFirst(hItem,tvItem)
end function

public function long of_insertchilditem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data);return of_InsertChildItem(hItem,label,picIndex,selectedPicIndex,data,false)
end function

public function long of_insertchilditem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data, readonly boolean haschilds);TREEVIEWITEM newItem

if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

newItem.Label 						= label
newItem.PictureIndex 			= picIndex
newItem.SelectedPictureIndex 	= selectedPicIndex
newItem.Data 						= data
newItem.Children 					= hasChilds

return InsertItemFirst(hItem,newItem)
end function

public function long of_additem (readonly treeviewitem tvitem);return of_AddItem(0,tvItem)
end function

public function long of_additem (readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data);return of_AddItem(0,label,picIndex,selectedPicIndex,data,false)
end function

public function long of_additem (readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data, readonly boolean haschilds);return of_AddItem(0,label,picIndex,selectedPicIndex,data,hasChilds)
end function

public function long of_additem (readonly long hitem, readonly treeviewitem tvitem);long hParentItem

if hItem < 0 then return RetCode.E_INVALID_ARGUMENT

if hItem > 0 then
	hParentItem = FindItem(ParentTreeItem!,hItem)
	if hParentItem <= 0 then
		hParentItem = 0
	end if
	return InsertItem(hParentItem,hItem,tvItem)
else
	return InsertItemLast(0,tvItem)
end if
end function

public function long of_additem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data);return of_AddItem(hItem,label,picIndex,selectedPicIndex,data,false)
end function

public function long of_additem (readonly long hitem, readonly string label, readonly integer picindex, readonly integer selectedpicindex, readonly any data, readonly boolean haschilds);long hParentItem
TREEVIEWITEM newItem

if hItem < 0 then return RetCode.E_INVALID_ARGUMENT

newItem.Label 						= label
newItem.PictureIndex 			= picIndex
newItem.SelectedPictureIndex 	= selectedPicIndex
newItem.Data 						= data
newItem.Children 					= hasChilds

if hItem > 0 then
	hParentItem = FindItem(ParentTreeItem!,hItem)
	if hParentItem <= 0 then
		hParentItem = 0
	end if
	return InsertItem(hParentItem,hItem,newItem)
else
	return InsertItemLast(0,newItem)
end if
end function

public function long of_remove (readonly long hitem);if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

if DeleteItem(hItem) = 1 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_removeall ();long hRootItem

hRootItem = FindItem(RootTreeItem!,0)

do while hRootItem > 0
	DeleteItem(hRootItem)
	hRootItem = FindItem(RootTreeItem!,0)
loop

return RetCode.OK
end function

public function long of_finditem (readonly treenavigation navcode, readonly long hitem);return FindItem(navCode,hItem)
end function

public function long of_settext (readonly long hitem, readonly string text);TREEVIEWITEM itemData

if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

GetItem(hItem,ref itemData)
itemData.Label = text

if SetItem(hItem,itemData) = 1 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_setdata (readonly long hitem, readonly any data);TREEVIEWITEM itemData

if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

GetItem(hItem,ref itemData)
itemData.Data = data

if SetItem(hItem,itemData) = 1 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_setimage (readonly long hitem, readonly integer picindex, readonly integer selectedpicindex);TREEVIEWITEM itemData

if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

GetItem(hItem,ref itemData)
itemData.PictureIndex = picIndex
itemData.SelectedPictureIndex = selectedPicIndex

if SetItem(hItem,itemData) = 1 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function string of_gettext (readonly long hitem);TREEVIEWITEM itemData

if hItem <= 0 then return ""

GetItem(hItem,ref itemData)

return itemData.Label
end function

public function any of_getdata (readonly long hitem);Any aVal
TREEVIEWITEM itemData

if hItem <= 0 then return aVal

GetItem(hItem,ref itemData)

return itemData.Data
end function

public function long of_getitem (readonly long hitem, ref treeviewitem tvitem);if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

if GetItem(hItem,ref tvitem) = 1 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_setitem (readonly long hitem, readonly treeviewitem tvitem);if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

if SetItem(hItem,tvItem) = 1 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_copychildren (readonly long hitemdst, readonly long hitemsrc);long hChildItem,hNewChildItem
TREEVIEWITEM tvItem

if hItemDst <= 0 or hItemSrc <= 0 then return RetCode.E_INVALID_ARGUMENT
if hItemDst = hItemSrc then return RetCode.E_INVALID_ARGUMENT

hChildItem = FindItem(ChildTreeItem!,hItemSrc)
do while (hChildItem > 0)
	GetItem(hChildItem,ref tvItem)
	hNewChildItem = InsertItemLast(hItemDst,tvItem)
	of_CopyChildren(hNewChildItem,hChildItem)
	hChildItem = FindItem(NextTreeItem!,hChildItem)
loop

return RetCode.OK
end function

public function long of_getlevel (readonly long hitem);TREEVIEWITEM itemData

if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

if GetItem(hItem,ref itemData) = 1 then
	return itemData.Level
else
	return RetCode.FAILED
end if
end function

public function boolean of_isparent (readonly long hparentitem, readonly long hitem);//判断hParentItem是否为hItem的父节点（包括间接父节点）
long hParentNode

if hParentItem <= 0 or hItem <= 0 then return false
if hParentItem = hItem then return false

hParentNode = FindItem(ParentTreeItem!,hItem)
do while (hParentNode > 0)
	if hParentNode = hParentItem then return true
	hParentNode = FindItem(ParentTreeItem!,hParentNode)
loop

return false
end function

public function unsignedlong of_getrealitemfrompoint (readonly long xpos, readonly long ypos);//获取座标下真实节点句柄
//xpos,ypos为相对于客户区的座标(px)
TVHITTESTINFO tvHTTInfo

tvHTTInfo.pt.x = xpos
tvHTTInfo.pt.y = ypos

return SendMessageTVHitTestInfo(#Handle,TVM_HITTEST,0,ref tvHTTInfo)
end function

public function long of_getrealitemrect (readonly unsignedlong hitem, ref rect itemrect);//hItem为真实节点句柄
if hItem = 0 then return RetCode.E_INVALID_ARGUMENT

itemRect.left = hItem

if SendMessageRect(#Handle,TVM_GETITEMRECT,1,ref itemRect) then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_getchild (readonly long hitem);if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

return FindItem(ChildTreeItem!,hItem)
end function

public function long of_getnext (readonly long hitem);if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

return FindItem(NextTreeItem!,hItem)
end function

public function long of_getparent (readonly long hitem);if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

return FindItem(ParentTreeItem!,hItem)
end function

public function long of_getparent (readonly long hitem1, readonly long hitem2);//获取两个节点的第一个公共父节点句柄
long hParentNode1,hParentNode2

if hParentNode1 <= 0 or hParentNode2 <= 0 then return RetCode.E_INVALID_ARGUMENT

hParentNode1 = FindItem(ParentTreeItem!,hItem1)
do while (hParentNode1 > 0)
	hParentNode2 = FindItem(ParentTreeItem!,hItem2)
	do while (hParentNode2 > 0)
		if hParentNode1 = hParentNode2 then return hParentNode1
		hParentNode2 = FindItem(ParentTreeItem!,hParentNode2)
	loop
	hParentNode1 = FindItem(ParentTreeItem!,hParentNode1)
loop

return 0
end function

public function long of_getprevious (readonly long hitem);if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

return FindItem(PreviousTreeItem!,hItem)
end function

public function long of_getroot ();return FindItem(RootTreeItem!,0)
end function

public function long of_getselected ();return FindItem(CurrentTreeItem!,0)
end function

public function long of_select (readonly long hitem);if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

if SelectItem(hItem) = 1 then
	if #BoldSelected then
		_of_SetBoldItem(hItem)
	end if
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_settextcolor (readonly unsignedlong rgbcolor);if #TextColor = rgbColor then return RetCode.OK

#TextColor = rgbColor

Send(#Handle,TVM_SETTEXTCOLOR,0,rgbColor)
return RetCode.OK
end function

public function long of_setlinecolor (readonly unsignedlong rgbcolor);if #LineColor = rgbColor then return RetCode.OK

#LineColor = rgbColor

Send(#Handle,TVM_SETLINECOLOR,0,rgbColor)
return RetCode.OK
end function

public function long of_setitemheight (readonly long nheight);if #ItemHeight = nHeight then return RetCode.OK

#ItemHeight = nHeight

Send(#Handle,TVM_SETITEMHEIGHT,nHeight,0)
return RetCode.OK
end function

public function long of_setbackcolor (readonly unsignedlong rgbcolor);if #BackColor = rgbColor then return RetCode.OK

#BackColor = rgbColor

Send(#Handle,TVM_SETBKCOLOR,0,rgbColor)

return RetCode.OK
end function

public function long of_expandall (readonly long hitem);if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

if ExpandAll(hItem) = 1 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_expand (readonly long hitem);if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

if ExpandItem(hItem) = 1 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_collapse (readonly long hitem);if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

if CollapseItem(hItem) = 1 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_collapseall (readonly long hitem);long hChildItem

if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

if CollapseItem(hItem) = 1 then
	hChildItem = FindItem(ChildTreeItem!,hItem)
	do while (hChildItem > 0)
		of_CollapseAll(hChildItem)
		hChildItem = FindItem(NextTreeItem!,hChildItem)
	loop
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function boolean of_isexpanded (readonly long hitem);TREEVIEWITEM itemData

if hItem <= 0 then return false

if GetItem(hItem,ref itemData) = 1 then
	return itemData.Expanded
else
	return false
end if
end function

public function boolean of_iscollapsed (readonly long hitem);TREEVIEWITEM itemData

if hItem <= 0 then return false

if GetItem(hItem,ref itemData) = 1 then
	return (Not itemData.Expanded)
else
	return false
end if
end function

public function long of_settextbold (readonly long hitem, readonly boolean bold);TREEVIEWITEM itemData

if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

GetItem(hItem,ref itemData)
itemData.Bold = bold

if SetItem(hItem,itemData) = 1 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function boolean of_istextbold (readonly long hitem);TREEVIEWITEM itemData

if hItem <= 0 then return false

GetItem(hItem,ref itemData)

return itemData.Bold
end function

private subroutine _of_setbolditem (readonly long hitem);if _hItemLastBold = hItem then return

if _hItemLastBold > 0 then
	of_SetTextBold(_hItemLastBold,false)
end if

if hItem > 0 then
	of_SetTextBold(hItem,true)
end if

_hItemLastBold = hItem
end subroutine

public function long of_setboldselected (readonly boolean boldselected);if #BoldSelected = boldSelected then return RetCode.OK

#BoldSelected = boldSelected

if #BoldSelected then
	_of_SetBoldItem(of_GetSelected())
else
	_of_SetBoldItem(0)
end if

return RetCode.OK
end function

public function long of_editlabel (readonly long hitem);if hItem <= 0 then return RetCode.E_INVALID_ARGUMENT

if Not EditLabels then
	_bSwitchEditLabels = true
	EditLabels = true
end if

if EditLabel(hItem) = 1 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_finditembytext (string text, readonly boolean matchcase, readonly boolean fullmatch, readonly boolean ignoregroup);TVFINDPARAM findParam

if Len(text) = 0 or IsNull(text) then return 0

if matchCase then
	findParam.text = text
else
	findParam.text = Lower(text)
end if
findParam.matchCase = matchCase
findParam.fullMatch = fullMatch
findParam.ignoreGroup = ignoreGroup

return of_FindItem(findCallback,findParam)
end function

public function boolean of_haschildren (readonly long hitem);TREEVIEWITEM itemData

if hItem <= 0 then return false

if GetItem(hItem,ref itemData) = 1 then
	return itemData.Children
else
	return false
end if
end function

public function long of_findchilditem (readonly long hitem, readonly n_cst_treeview_findcallback callback, readonly any param);long hChildItem,hItemFound
TREEVIEWITEM itemData

if hItem <= 0 then return 0
if Not IsValidObject(callback) then return 0

hChildItem = FindItem(ChildTreeItem!,hItem)
if hChildItem <= 0 then return 0

do while (hChildItem > 0)
	GetItem(hChildItem,ref itemData)
	if callback.Event OnPredicate(itemData,param) then return hChildItem
	if itemData.Children then
		hItemFound = of_FindChildItem(hChildItem,callback,param)
		if hItemFound > 0 then return hItemFound
	end if
	hChildItem = FindItem(NextTreeItem!,hChildItem)
loop

return 0
end function

public function long of_finditem (readonly n_cst_treeview_findcallback callback, readonly any param);long hItem,hItemFound
TREEVIEWITEM itemData

hItem = FindItem(RootTreeItem!,0)
if hItem <= 0 then return 0
if Not IsValidObject(callback) then return 0

do while (hItem > 0)
	GetItem(hItem,ref itemData)
	if callback.Event OnPredicate(itemData,param) then return hItem
	if itemData.Children then
		hItemFound = of_FindChildItem(hItem,callback,param)
		if hItemFound > 0 then return hItemFound
	end if
	hItem = FindItem(NextTreeItem!,hItem)
loop

return 0
end function

public function long of_finditem (longlong hitemstart, readonly n_cst_treeview_findcallback callback, readonly any param);long hItem,hItemParent,hItemFound
boolean bRecurse
TREEVIEWITEM itemData
Constant LongLong RECURSEFLAG = 4294967296

if hItemStart >= RECURSEFLAG then
	bRecurse = true
	hItemStart -= RECURSEFLAG
end if
hItem = hItemStart
if hItem <= 0 then return 0
if Not IsValidObject(callback) then return 0

hItemParent = FindItem(ParentTreeItem!,hItemStart)

if Not bRecurse then
	hItemFound = of_FindChildItem(hItem,callback,param)
	if hItemFound > 0 then return hItemFound
end if

hItem = FindItem(NextTreeItem!,hItem)
do while (hItem > 0)
	GetItem(hItem,ref itemData)
	if callback.Event OnPredicate(itemData,param) then return hItem
	if itemData.Children then
		hItemFound = of_FindChildItem(hItem,callback,param)
		if hItemFound > 0 then return hItemFound
	end if
	hItem = FindItem(NextTreeItem!,hItem)
loop

if hItemParent > 0 then
	return of_FindItem(hItemParent + RECURSEFLAG,callback,param)
end if

return 0
end function

public function long of_findchilditembytext (readonly long hitem, readonly string text, readonly boolean matchcase, readonly boolean fullmatch, readonly boolean ignoregroup);TVFINDPARAM findParam

if hItem <= 0 then return 0
if Len(text) = 0 or IsNull(text) then return 0

if matchCase then
	findParam.text = text
else
	findParam.text = Lower(text)
end if
findParam.matchCase = matchCase
findParam.fullMatch = fullMatch
findParam.ignoreGroup = ignoreGroup

return of_FindChildItem(hItem,findCallback,findParam)
end function

public function long of_finditembytext (readonly long hitemstart, readonly string text, readonly boolean matchcase, readonly boolean fullmatch, readonly boolean ignoregroup);TVFINDPARAM findParam

if hItemStart <= 0 then return 0
if Len(text) = 0 or IsNull(text) then return 0

if matchCase then
	findParam.text = text
else
	findParam.text = Lower(text)
end if
findParam.matchCase = matchCase
findParam.fullMatch = fullMatch
findParam.ignoreGroup = ignoreGroup

return of_FindItem(hItemStart,findCallback,findParam)
end function

on se_cst_treeview.create
call super::create
this.findcallback=create findcallback
end on

on se_cst_treeview.destroy
call super::destroy
destroy(this.findcallback)
end on

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_TRANSPARENT
		if Not #Transparent then
			color = ARGB(255,255,255,255)
		end if
	case theme.CLR_BKGND
		color = ARGB(255,255,255,255)
end choose
end event

event onpreconstructor;call super::onpreconstructor;if #ItemHeight = 0 then
	#ItemHeight	= Send(#Handle,TVM_GETITEMHEIGHT,0,0)
else
	Send(#Handle,TVM_SETITEMHEIGHT,#ItemHeight,0)
end if
if #BackColor = 0 then
	#BackColor = Send(#Handle,TVM_GETBKCOLOR,0,0)
else
	Send(#Handle,TVM_SETBKCOLOR,0,#BackColor)
end if
if #TextColor = 0 then
	#TextColor = Send(#Handle,TVM_GETTEXTCOLOR,0,0)
else
	Send(#Handle,TVM_SETTEXTCOLOR,0,#TextColor)
end if
if #LineColor = 0 then
	#LineColor = Send(#Handle,TVM_GETLINECOLOR,0,0)
else
	Send(#Handle,TVM_SETLINECOLOR,0,#LineColor)
end if

if IsPrevented(Event OnThemeRegistering()) then return

ThemeManager().of_RegisterControl(this)

Event OnThemeRegistered()
end event

event onpredestructor;call super::onpredestructor;ThemeManager().of_UnregisterControl(this)
end event

type findcallback from n_cst_treeview_findcallback within se_cst_treeview descriptor "pb_nvo" = "true" 
end type

event onpredicate;call super::onpredicate;TVFINDPARAM findParam

findParam = param

if Not item.Children or Not findParam.ignoreGroup then
	if Not findParam.matchCase then item.Label = Lower(item.Label)
	if findParam.fullMatch then
		if item.Label = findParam.text then return true
	else
		if Pos(item.Label,findParam.text) > 0 then return true
	end if
end if

return false
end event

on findcallback.create
call super::create
end on

on findcallback.destroy
call super::destroy
end on

