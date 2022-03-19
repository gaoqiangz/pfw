$PBExportHeader$n_cst_popupmenu.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_popupmenu from nonvisualobject
end type
type theme from n_cst_popupmenu_theme within n_cst_popupmenu
end type
end forward

global type n_cst_popupmenu from nonvisualobject
event type long onmenuselecting ( unsignedlong id )
event type long onsubmenuselecting ( n_cst_popupmenu submenu,  unsignedlong id )
event onpreconstructor ( )
event onpredestructor ( )
event onthemechanged ( unsignedinteger eventflag )
event onsubmenuselected ( n_cst_popupmenu submenu,  unsignedlong id )
event onmenuselected ( unsignedlong id )
event type long onthemechanging ( n_cst_base_theme newtheme )
theme theme
end type
global n_cst_popupmenu n_cst_popupmenu

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

/*--- 属性 ---*/
public:
privatewrite boolean	#BorderShadow	= true	//菜单阴影
privatewrite boolean	#ToolTip			= false	//工具提示
privatewrite string	#TitleText					//标题栏文本
privatewrite string	#TitleImage					//标题栏图标
any						#Data							//绑定任意数据
string					#Tag							//绑定字符串数据

/*--- 私有 ---*/
Protected:
n_popupmenuex		_PopupMenuNative
n_imagelist			_ImageList
n_cst_popupmenu	_SubMenus[]

menu _AttachedMenu

//Props
constant string PRP_POPUPMENUCREATOR = "{POPUPMENU_CREATOR}"
end variables

forward prototypes
public function integer of_addmenu (readonly string text, readonly string image, readonly string tiptext)
public function integer of_addmenu (readonly string text, readonly string image, readonly string tiptext, readonly unsignedlong id)
public function integer of_addmenu (readonly string text, readonly string image, readonly string tiptext, readonly boolean enabled)
public function integer of_addmenu (readonly string text, readonly string image)
public function integer of_addmenu (readonly string text, readonly string image, readonly unsignedlong id)
public function integer of_addmenu (readonly string text, readonly string image, readonly boolean enabled)
public function integer of_addmenu (readonly string text, readonly string image, readonly boolean enabled, readonly unsignedlong id)
public function integer of_addlabel (readonly string text)
public function integer of_addlabel (readonly string text, readonly string image)
public function integer of_addseparator ()
public function integer of_getcount ()
public function string of_gettext (readonly ulong id, readonly boolean byposition)
public function string of_getimage (readonly unsignedlong id, readonly boolean byposition)
public function string of_gettiptext (readonly ulong id, readonly boolean byposition)
public function boolean of_isenabled (readonly ulong id, readonly boolean byposition)
public function boolean of_ischecked (readonly ulong id, readonly boolean byposition)
public function integer of_addmenu (readonly string text, readonly string image, readonly string tiptext, readonly boolean enabled, readonly unsignedlong id)
public function long of_settitleimage (readonly string image)
public function long of_settitletext (readonly string text)
public function long of_settiptext (readonly ulong id, readonly boolean byposition, readonly string tiptext)
public function long of_settext (readonly ulong id, readonly boolean byposition, readonly string text)
public function long of_checkradios (readonly unsignedlong idfirst, readonly unsignedlong idlast, readonly unsignedlong idcheck, readonly boolean byposition, boolean checked)
public function long of_remove (readonly unsignedlong id, readonly boolean byposition)
public function long of_removeall ()
public function long of_setimage (readonly unsignedlong id, readonly boolean byposition, readonly string image)
public function long of_setbordershadow (readonly boolean show)
public function long of_settooltip (readonly boolean enabled)
public function boolean of_issubmenu (readonly unsignedlong id, readonly boolean byposition)
public function unsignedlong of_getid (readonly unsignedinteger pos)
public function unsignedinteger of_getpos (readonly unsignedlong id)
public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly string tiptext)
public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly string tiptext, readonly unsignedlong id)
public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly string tiptext, readonly boolean enabled)
public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image)
public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly unsignedlong id)
public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly boolean enabled)
public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly boolean enabled, readonly unsignedlong id)
public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly string tiptext, readonly boolean enabled, readonly unsignedlong id)
public function integer of_insertlabel (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text)
public function integer of_insertlabel (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image)
public function integer of_insertseparator (readonly unsignedlong idinsert, readonly boolean byposition)
public function long of_insertmenu (unsignedlong idinsert, readonly boolean byposition, readonly n_cst_popupmenu popupmenu)
public function long of_addmenu (unsignedlong idstart, unsignedlong idend, readonly boolean byposition, readonly n_cst_popupmenu popupmenu)
public function long of_addmenu (readonly n_cst_popupmenu popupmenu)
public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly boolean split)
public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled)
public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id)
public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id)
public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled)
public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split)
public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id)
public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled, readonly unsignedlong id)
public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split)
public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled)
public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id)
public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id)
public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled)
public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split)
public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id)
public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled, readonly unsignedlong id)
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled, readonly unsignedlong id)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly boolean split)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled, readonly unsignedlong id)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split)
public function long of_insertmenu (unsignedlong idinsert, unsignedlong idstart, unsignedlong idend, readonly boolean byposition, readonly n_cst_popupmenu popupmenu)
public function unsignedlong of_getlastselectid ()
public function long of_getsubmenu (readonly unsignedlong id, readonly boolean byposition, ref n_cst_popupmenu submenu)
public function long of_getlastselectsubmenu (ref n_cst_popupmenu submenu)
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu, readonly string clsname)
public function boolean of_issubmenu (readonly n_cst_popupmenu popupmenu, readonly boolean bchecksubmenus)
public function boolean of_issubmenu (readonly n_cst_popupmenu popupmenu)
public function n_popupmenu of_getnative ()
public function long of_detachmenu ()
public function long of_attachmenu (readonly menu m)
public function long of_attachmenu (readonly menu m, readonly boolean toolbaritemonly)
public function unsignedlong of_popup (readonly unsignedlong hwnd, readonly unsignedlong hwndcallback, readonly real x, readonly real y)
public function unsignedlong of_popup (readonly unsignedlong hwnd, readonly unsignedlong hwndcallback, readonly real x, readonly real y, readonly unsignedlong flags)
public function unsignedlong of_popup (readonly unsignedlong hwnd, readonly real x, readonly real y, readonly unsignedlong flags)
public function unsignedlong of_popup (readonly unsignedlong hwnd, readonly real x, readonly real y)
public function long of_popup (readonly real x, readonly real y, readonly unsignedlong flags)
public function unsignedlong of_popup (readonly real x, readonly real y)
public function long of_enable (readonly unsignedlong id, readonly boolean byposition, readonly boolean enable)
public function long of_check (readonly unsignedlong id, readonly boolean byposition, readonly boolean checked)
private function integer _of_getimageindex (readonly string image)
public function long of_settag (readonly unsignedlong id, readonly boolean byposition, readonly string tag)
public function string of_gettag (readonly unsignedlong id, readonly boolean byposition)
end prototypes

event onmenuselected(unsignedlong id);if IsValidObject(_AttachedMenu) then
	if id <= UpperBound(_AttachedMenu.Item) then
		_AttachedMenu.Item[id].Post Event Clicked()
	end if
end if
end event

public function integer of_addmenu (readonly string text, readonly string image, readonly string tiptext);return of_AddMenu(text,image,tiptext,true,of_GetCount()+1)
end function

public function integer of_addmenu (readonly string text, readonly string image, readonly string tiptext, readonly unsignedlong id);return of_AddMenu(text,image,tiptext,true,id)
end function

public function integer of_addmenu (readonly string text, readonly string image, readonly string tiptext, readonly boolean enabled);return of_AddMenu(text,image,tiptext,enabled,of_GetCount()+1)
end function

public function integer of_addmenu (readonly string text, readonly string image);return of_AddMenu(text,image,"",true,of_GetCount()+1)
end function

public function integer of_addmenu (readonly string text, readonly string image, readonly unsignedlong id);return of_AddMenu(text,image,"",true,id)
end function

public function integer of_addmenu (readonly string text, readonly string image, readonly boolean enabled);return of_AddMenu(text,image,"",enabled,of_GetCount()+1)
end function

public function integer of_addmenu (readonly string text, readonly string image, readonly boolean enabled, readonly unsignedlong id);return of_AddMenu(text,image,"",enabled,id)
end function

public function integer of_addlabel (readonly string text);return of_AddLabel(text,"")
end function

public function integer of_addlabel (readonly string text, readonly string image);//====================================================================
// Function: of_addlabel()
//--------------------------------------------------------------------
// Description: 添加文本项
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	text 	
// 	readonly	string	image	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if IsValidObject(_AttachedMenu) then return RetCode.E_ACCESS_DENIED
return _PopupMenuNative.InsertLabel(of_GetCount()+1,true,text,_of_GetImageIndex(image))
end function

public function integer of_addseparator ();if IsValidObject(_AttachedMenu) then return RetCode.E_ACCESS_DENIED
return _PopupMenuNative.InsertSeparator(of_GetCount()+1,true)
end function

public function integer of_getcount ();//====================================================================
// Function: of_getcount()
//--------------------------------------------------------------------
// Description: 获取菜单项数量（包括separator）
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _PopupMenuNative.GetCount()
end function

public function string of_gettext (readonly ulong id, readonly boolean byposition);return _PopupMenuNative.GetText(id,byPosition)
end function

public function string of_getimage (readonly unsignedlong id, readonly boolean byposition);//====================================================================
// Function: of_getimage()
//--------------------------------------------------------------------
// Description: 获取菜单项设置的图标
//--------------------------------------------------------------------
// Arguments:
// 	readonly	unsignedlong	id        	
// 	readonly	boolean     	byposition	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if Not IsValidObject(_ImageList) then return ""
return _ImageList.GetImage(_PopupMenuNative.GetImage(id,byPosition))
end function

public function string of_gettiptext (readonly ulong id, readonly boolean byposition);return _PopupMenuNative.GetTipText(id,byPosition)
end function

public function boolean of_isenabled (readonly ulong id, readonly boolean byposition);return _PopupMenuNative.IsEnabled(id,byPosition)
end function

public function boolean of_ischecked (readonly ulong id, readonly boolean byposition);return _PopupMenuNative.IsChecked(id,byPosition)
end function

public function integer of_addmenu (readonly string text, readonly string image, readonly string tiptext, readonly boolean enabled, readonly unsignedlong id);//====================================================================
// Function: of_addmenu()
//--------------------------------------------------------------------
// Description: 添加菜单项
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string      	text   	
// 	readonly	string      	image  	
// 	readonly	string      	tiptext	
// 	readonly	boolean     	enabled	
// 	readonly	unsignedlong	id     	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return of_InsertMenu(of_GetCount()+1,true,text,image,tiptext,enabled,id)
end function

public function long of_settitleimage (readonly string image);if #TitleImage = image then return RetCode.OK

#TitleImage = image

return iif(_PopupMenuNative.SetTitleImage(_of_GetImageIndex(#TitleImage)),RetCode.OK,RetCode.FAILED)
end function

public function long of_settitletext (readonly string text);if #TitleText = text then return RetCode.OK

#TitleText = text

return iif(_PopupMenuNative.SetTitleText(#TitleText),RetCode.OK,RetCode.FAILED)
end function

public function long of_settiptext (readonly ulong id, readonly boolean byposition, readonly string tiptext);return iif(_PopupMenuNative.SetTipText(id,byPosition,tipText),RetCode.OK,RetCode.FAILED)
end function

public function long of_settext (readonly ulong id, readonly boolean byposition, readonly string text);return iif(_PopupMenuNative.SetText(id,byPosition,text),RetCode.OK,RetCode.FAILED)
end function

public function long of_checkradios (readonly unsignedlong idfirst, readonly unsignedlong idlast, readonly unsignedlong idcheck, readonly boolean byposition, boolean checked);//====================================================================
// Function: of_checkradios()
//--------------------------------------------------------------------
// Description: 勾选一个范围的单选项
//--------------------------------------------------------------------
// Arguments:
// 		unsignedlong	idfirst   	
// 		unsignedlong	idlast    	
// 		unsignedlong	idcheck   	
// 		boolean     	byposition	为true时[idFirst][idLast][idCheck]为位置（index），否则为ID
// 		boolean			checked     	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return iif(_PopupMenuNative.CheckRadios(idFirst,idLast,idCheck,byPosition,checked),RetCode.OK,RetCode.FAILED)
end function

public function long of_remove (readonly unsignedlong id, readonly boolean byposition);int index
n_cst_popupmenu pmSubMenu
n_cst_popupmenu newSubMenus[]

if IsValidObject(_AttachedMenu) then return RetCode.E_ACCESS_DENIED

of_GetSubMenu(id,byPosition,ref pmSubMenu)

if Not _PopupMenuNative.Remove(id,byPosition) then return RetCode.FAILED

if IsValidObject(pmSubMenu) then
	for index = 1 to UpperBound(_SubMenus)
		if _SubMenus[index] = pmSubMenu then
			Destroy _SubMenus[index]
		else
			newSubMenus[UpperBound(newSubMenus) + 1] = _SubMenus[index]
		end if
	next
	_SubMenus = newSubMenus
end if

return RetCode.OK
end function

public function long of_removeall ();int index
n_cst_popupmenu newSubMenus[]

if IsValidObject(_AttachedMenu) then return RetCode.E_ACCESS_DENIED
if Not _PopupMenuNative.RemoveAll() then return RetCode.FAILED

for index = 1 to UpperBound(_SubMenus)
	Destroy _SubMenus[index]
next
	
_SubMenus = newSubMenus

return RetCode.OK
end function

public function long of_setimage (readonly unsignedlong id, readonly boolean byposition, readonly string image);return iif(_PopupMenuNative.SetImage(id,byPosition,_ImageList.AddImage(theme.of_GetIcon(image,0))),RetCode.OK,RetCode.FAILED)
end function

public function long of_setbordershadow (readonly boolean show);if #BorderShadow = show then return RetCode.OK

#BorderShadow = show

return iif(_PopupMenuNative.SetBorderShadow(#BorderShadow),RetCode.OK,RetCode.FAILED)
end function

public function long of_settooltip (readonly boolean enabled);if #ToolTip = enabled then return RetCode.OK

#ToolTip = enabled

return iif(_PopupMenuNative.SetToolTip(#ToolTip),RetCode.OK,RetCode.FAILED)
end function

public function boolean of_issubmenu (readonly unsignedlong id, readonly boolean byposition);return _PopupMenuNative.IsSubMenu(id,byPosition)
end function

public function unsignedlong of_getid (readonly unsignedinteger pos);//====================================================================
// Function: of_getid()
//--------------------------------------------------------------------
// Description: 获取指定位置（index）的菜单项ID
//--------------------------------------------------------------------
// Arguments:
// 	readonly	unsignedinteger	pos	
//--------------------------------------------------------------------
// Returns:  unsignedlong
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _PopupMenuNative.GetID(pos)
end function

public function unsignedinteger of_getpos (readonly unsignedlong id);return _PopupMenuNative.GetPos(id)
end function

public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly string tiptext);return of_InsertMenu(idInsert,byPosition,text,image,tiptext,true,of_GetCount() + 1)
end function

public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly string tiptext, readonly unsignedlong id);return of_InsertMenu(idInsert,byPosition,text,image,tiptext,true,id)
end function

public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly string tiptext, readonly boolean enabled);return of_InsertMenu(idInsert,byPosition,text,image,tiptext,enabled,of_GetCount() + 1)
end function

public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image);return of_InsertMenu(idInsert,byPosition,text,image,"",true,of_GetCount() + 1)
end function

public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly unsignedlong id);return of_InsertMenu(idInsert,byPosition,text,image,"",true,id)
end function

public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly boolean enabled);return of_InsertMenu(idInsert,byPosition,text,image,"",enabled,of_GetCount() + 1)
end function

public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly boolean enabled, readonly unsignedlong id);return of_InsertMenu(idInsert,byPosition,text,image,"",enabled,id)
end function

public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly string tiptext, readonly boolean enabled, readonly unsignedlong id);if IsValidObject(_AttachedMenu) then return RetCode.E_ACCESS_DENIED
return _PopupMenuNative.InsertMenu(idInsert,byPosition,text,_of_GetImageIndex(image),tiptext,enabled,id)
end function

public function integer of_insertlabel (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text);return of_InsertLabel(idInsert,byPosition,text,"")
end function

public function integer of_insertlabel (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image);if IsValidObject(_AttachedMenu) then return RetCode.E_ACCESS_DENIED
return _PopupMenuNative.InsertLabel(idInsert,byPosition,text,_of_GetImageIndex(image))
end function

public function integer of_insertseparator (readonly unsignedlong idinsert, readonly boolean byposition);if IsValidObject(_AttachedMenu) then return RetCode.E_ACCESS_DENIED
return _PopupMenuNative.InsertSeparator(idInsert,byPosition)
end function

public function long of_insertmenu (unsignedlong idinsert, readonly boolean byposition, readonly n_cst_popupmenu popupmenu);if Not IsValidObject(popupmenu) then return RetCode.E_INVALID_OBJECT

if Not byPosition then
	idInsert = of_GetPos(idInsert)
	if idInsert < 1 then return RetCode.E_INVALID_ARGUMENT
end if

if _PopupMenuNative.InsertMenu(idInsert,1,popupmenu.of_GetCount(),true,popupmenu._PopupMenuNative) then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_addmenu (unsignedlong idstart, unsignedlong idend, readonly boolean byposition, readonly n_cst_popupmenu popupmenu);//====================================================================
// Function: of_addmenu()
//--------------------------------------------------------------------
// Description: 添加从指定popupmenu的指定范围复制
//--------------------------------------------------------------------
// Arguments:
// 	            	unsignedlong	idstart        	
// 	            	unsignedlong	idend          	
// 	readonly    	boolean        	byposition	
// 	readonly    	n_cst_popupmenu	popupmenu 	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if IsValidObject(_AttachedMenu) then return RetCode.E_ACCESS_DENIED
if Not IsValidObject(popupmenu) then return RetCode.E_INVALID_OBJECT

if Not byPosition then
	idStart = popupmenu.of_GetPos(idStart)
	idEnd = popupmenu.of_GetPos(idEnd)
	if idStart < 1 or idEnd < 1 then return RetCode.E_INVALID_ARGUMENT
end if

if _PopupMenuNative.InsertMenu(of_GetCount() + 1,idStart,idEnd,true,popupmenu._PopupMenuNative) then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_addmenu (readonly n_cst_popupmenu popupmenu);//====================================================================
// Function: of_addmenu()
//--------------------------------------------------------------------
// Description: 添加从指定popupmenu复制
//--------------------------------------------------------------------
// Arguments:
// 	readonly	n_cst_popupmenu	popupmenu	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return of_AddMenu(1,popupmenu.of_GetCount(),true,popupmenu)
end function

public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly boolean split);return of_AddSubMenu(clsName,text,image,"",split,true,of_GetCount() + 1)
end function

public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled);return of_AddSubMenu(clsName,text,image,"",split,enabled,of_GetCount() + 1)
end function

public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id);return of_AddSubMenu(clsName,text,image,tiptext,split,true,id)
end function

public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id);//====================================================================
// Function: of_addsubmenu()
//--------------------------------------------------------------------
// Description: 通过类名添加子菜单
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string      	clsname	
// 	readonly	string      	text   	
// 	readonly	string      	image  	
// 	readonly	string      	tiptext	
// 	readonly	boolean     	split  	是否为分割风格（为true时该菜单项可以点击）
// 	readonly	boolean     	enabled	
// 	readonly	unsignedlong	id     	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return of_InsertSubMenu(of_GetCount()+1,true,clsName,text,image,tiptext,split,enabled,id)
end function

public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled);return of_AddSubMenu(clsName,text,image,tiptext,split,enabled,of_GetCount() + 1)
end function

public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split);return of_AddSubMenu(clsName,text,image,tiptext,split,true,of_GetCount() + 1)
end function

public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id);return of_AddSubMenu(clsName,text,image,"",split,true,id)
end function

public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled, readonly unsignedlong id);return of_AddSubMenu(clsName,text,image,"",split,enabled,id)
end function

public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split);return of_AddSubMenu(popupmenu,text,image,"",split,true,of_GetCount() + 1)
end function

public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled);return of_AddSubMenu(popupmenu,text,image,"",split,enabled,of_GetCount() + 1)
end function

public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id);return of_AddSubMenu(popupmenu,text,image,tiptext,split,true,id)
end function

public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id);//====================================================================
// Function: of_addsubmenu()
//--------------------------------------------------------------------
// Description: 添加子菜单
//--------------------------------------------------------------------
// Arguments:
// 	ref     	n_cst_popupmenu	popupmenu	
// 	readonly	string         	text     	
// 	readonly	string         	image    	
// 	readonly	string         	tiptext  	
// 	readonly	boolean        	split    	是否为分割风格（为true时该菜单项可以点击）
// 	readonly	boolean        	enabled  	
// 	readonly	unsignedlong   	id       	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return of_InsertSubMenu(of_GetCount()+1,true,popupmenu,text,image,tiptext,split,enabled,id)
end function

public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled);return of_AddSubMenu(popupmenu,text,image,tiptext,split,enabled,of_GetCount() + 1)
end function

public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split);return of_AddSubMenu(popupmenu,text,image,tiptext,split,true,of_GetCount() + 1)
end function

public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id);return of_AddSubMenu(popupmenu,text,image,"",split,true,id)
end function

public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled, readonly unsignedlong id);return of_AddSubMenu(popupmenu,text,image,"",split,enabled,id)
end function

private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu);return _of_CreatePopupMenu(ref popupmenu,"")
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id);return of_InsertSubMenu(idInsert,byPosition,clsName,text,image,tipText,split,true,ID)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id);//====================================================================
// Function: of_insertsubmenu
//--------------------------------------------------------------------
// Description: 通过类名在指定位置插入子菜单
//--------------------------------------------------------------------
// Arguments:
// 	readonly	unsignedlong	idinsert  	
// 	readonly	boolean     	byposition	为true时[idInsert]为位置（index），否则为ID
// 	readonly	string      	clsname   	
// 	readonly	string      	text      	
// 	readonly	string      	image     	
// 	readonly	string      	tiptext   	
// 	readonly	boolean     	split     	是否为分割风格（为true时该菜单项可以点击）
// 	readonly	boolean     	enabled   	
// 	readonly	unsignedlong	id        	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long rtCode
n_cst_popupmenu popupMenu

if Not _of_CreatePopupMenu(ref popupMenu,clsName) then return RetCode.E_INVALID_TYPE

rtCode = of_InsertSubMenu(idInsert,byPosition,ref popupMenu,text,image,tipText,split,enabled,ID)

if rtCode <= 0 then
	Destroy popupMenu
end if

return rtCode
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled);return of_InsertSubMenu(idInsert,byPosition,clsName,text,image,tipText,split,enabled,of_GetCount() + 1)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split);return of_InsertSubMenu(idInsert,byPosition,clsName,text,image,tipText,split,true,of_GetCount() + 1)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id);return of_InsertSubMenu(idInsert,byPosition,clsName,text,image,"",split,true,ID)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled, readonly unsignedlong id);return of_InsertSubMenu(idInsert,byPosition,clsName,text,image,"",split,enabled,ID)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled);return of_InsertSubMenu(idInsert,byPosition,clsName,text,image,"",split,enabled,of_GetCount() + 1)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly boolean split);return of_InsertSubMenu(idInsert,byPosition,clsName,text,image,"",split,true,of_GetCount() + 1)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id);return of_InsertSubMenu(idInsert,byPosition,popupmenu,text,image,tiptext,split,true,id)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id);//====================================================================
// Function: of_insertsubmenu
//--------------------------------------------------------------------
// Description: 在指定位置插入子菜单
//--------------------------------------------------------------------
// Arguments:
// 	readonly	unsignedlong		idinsert  	
// 	readonly	boolean     		byposition	为true时[idInsert]为位置（index），否则为ID
// 	ref		n_cst_popupmenu  	popupmenu   	
// 	readonly	string      		text      	
// 	readonly	string      		image     	
// 	readonly	string      		tiptext   	
// 	readonly	boolean     		split     	是否为分割风格（为true时该菜单项可以点击）
// 	readonly	boolean     		enabled   	
// 	readonly	unsignedlong		id        	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long rtCode
boolean bCreated,bOwner

if IsValidObject(_AttachedMenu) then return RetCode.E_ACCESS_DENIED

if Not IsValidObject(popupmenu) then
	if Not _of_CreatePopupMenu(ref popupmenu) then return RetCode.E_INVALID_OBJECT
	bCreated = true
	bOwner = true
	PopupMenu.#Tag = ""
elseif PopupMenu.#Tag = PRP_POPUPMENUCREATOR then
	bOwner = true
	PopupMenu.#Tag = ""
end if

rtCode = _PopupMenuNative.InsertSubMenu(idInsert,byPosition,popupmenu._PopupMenuNative,text,_of_GetImageIndex(image),tiptext,split,enabled,id)

if bOwner then
	if rtCode > 0 then
		_SubMenus[UpperBound(_SubMenus)+1] = popupmenu
	elseif bCreated then
		Destroy popupmenu
	end if
end if

return rtCode
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled);return of_InsertSubMenu(idInsert,byPosition,popupmenu,text,image,tiptext,split,enabled,of_GetCount() + 1)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split);return of_InsertSubMenu(idInsert,byPosition,popupmenu,text,image,tiptext,split,true,of_GetCount() + 1)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id);return of_InsertSubMenu(idInsert,byPosition,popupmenu,text,image,"",split,true,id)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled, readonly unsignedlong id);return of_InsertSubMenu(idInsert,byPosition,popupmenu,text,image,"",split,enabled,id)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled);return of_InsertSubMenu(idInsert,byPosition,popupmenu,text,image,"",split,enabled,of_GetCount() + 1)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split);return of_InsertSubMenu(idInsert,byPosition,popupmenu,text,image,"",split,true,of_GetCount() + 1)
end function

public function long of_insertmenu (unsignedlong idinsert, unsignedlong idstart, unsignedlong idend, readonly boolean byposition, readonly n_cst_popupmenu popupmenu);if IsValidObject(_AttachedMenu) then return RetCode.E_ACCESS_DENIED
if Not IsValidObject(popupmenu) then return RetCode.E_INVALID_OBJECT

if Not byPosition then
	idInsert = of_GetPos(idInsert)
	if idInsert < 1 then return RetCode.E_INVALID_ARGUMENT
	idStart = popupmenu.of_GetPos(idStart)
	idEnd = popupmenu.of_GetPos(idEnd)
	if idStart < 1 or idEnd < 1 then return RetCode.E_INVALID_ARGUMENT
end if

if _PopupMenuNative.InsertMenu(idInsert,idStart,idEnd,true,popupmenu._PopupMenuNative) then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function unsignedlong of_getlastselectid ();return _PopupMenuNative.of_GetLastSelectID()
end function

public function long of_getsubmenu (readonly unsignedlong id, readonly boolean byposition, ref n_cst_popupmenu submenu);n_popupmenuex nSubMenuNative

nSubMenuNative = _PopupMenuNative.GetSubMenu(id,byPosition)

try
	if IsValidObject(nSubMenuNative) then
		subMenu =  nSubMenuNative.#ParentPopupMenu
	else
		SetNull(subMenu)
	end if
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(subMenu),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function long of_getlastselectsubmenu (ref n_cst_popupmenu submenu);n_popupmenuex nSubMenuNative

try
	nSubMenuNative = _PopupMenuNative.of_GetLastSelectSubMenu()
	
	if IsValidObject(nSubMenuNative) then
		subMenu = nSubMenuNative.#ParentPopupMenu
	else
		SetNull(subMenu)
	end if
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(subMenu),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu, readonly string clsname);n_cst_popupmenu pm

try
	if clsName = "" then
		pm = Create n_cst_popupmenu
	else
		pm = Create Using clsName
	end if
	popupmenu = pm
	popupmenu.#Tag = PRP_POPUPMENUCREATOR
	popupmenu.of_SetToolTip(#ToolTip)
	popupmenu.theme.of_SetTheme(theme)
	return true
catch(Throwable ex)
	if IsValidObject(pm) then
		Destroy pm
	end if
	return false
end try
end function

public function boolean of_issubmenu (readonly n_cst_popupmenu popupmenu, readonly boolean bchecksubmenus);int index
n_cst_popupmenu subMenu

for index = of_GetCount() to 1 step -1
	if IsSucceeded(of_GetSubMenu(index,true,ref subMenu)) then
		if subMenu = popupmenu then return true
		if bCheckSubMenus then
			if subMenu.of_IsSubMenu(popupmenu,true) then
				return true
			end if
		end if
	end if
next

return false
end function

public function boolean of_issubmenu (readonly n_cst_popupmenu popupmenu);return of_IsSubMenu(popupmenu,false)
end function

public function n_popupmenu of_getnative ();return _PopupMenuNative
end function

public function long of_detachmenu ();//====================================================================
// Function: of_detachmenu()
//--------------------------------------------------------------------
// Description: 解除与PB菜单的绑定（将移除所有菜单项）
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if Not IsValidObject(_AttachedMenu) then return RetCode.OK

SetNull(_AttachedMenu)
of_RemoveAll()

return RetCode.OK
end function

public function long of_attachmenu (readonly menu m);return of_AttachMenu(m,false)
end function

public function long of_attachmenu (readonly menu m, readonly boolean toolbaritemonly);//====================================================================
// Function: of_attachmenu()
//--------------------------------------------------------------------
// Description: 绑定PB菜单（由该菜单创建此对象的所有菜单项，并且不能再使用其他修改菜单项的功能）
//--------------------------------------------------------------------
// Arguments:
// 	readonly	menu   	m              	
// 	readonly	boolean	toolbaritemonly	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int index,nCount
boolean bSeparator
n_cst_popupmenu subMenu

if Not IsValidObject(m) then return RetCode.E_INVALID_OBJECT
if IsValidObject(_AttachedMenu) then return RetCode.FAILED

nCount = UpperBound(m.Item)
if nCount = 0 then return RetCode.E_INVALID_ARGUMENT

if toolbarItemOnly then
	for index = 1 to nCount
		if Not m.Item[index].ToolBarItemVisible then continue
		if m.Item[index].text = "-" then
			bSeparator = true
			continue
		end if
		if m.Item[index].ToolBarItemName = "" then continue
		if bSeparator then
			bSeparator = false
			of_AddSeparator()
		end if
		of_AddMenu(m.Item[index].ToolBarItemText,m.Item[index].ToolBarItemName,m.Item[index].MicroHelp,m.Item[index].Enabled,index)
		if m.Item[index].Checked then
			of_Check(index,true,true)
		end if
	next
else
	for index = 1 to nCount
		if Not m.Item[index].Visible then continue
		if m.Item[index].text = "-" then
			bSeparator = true
			continue
		end if
		if bSeparator then
			bSeparator = false
			of_AddSeparator()
		end if
		if UpperBound(m.Item[index].Item) > 0 then
			_of_CreatePopupMenu(ref subMenu)
			of_AddSubMenu(subMenu,m.Item[index].Text,m.Item[index].MenuImage,m.Item[index].MicroHelp,false,m.Item[index].Enabled,index)
			if m.Item[index].Enabled then subMenu.of_AttachMenu(m.Item[index],false)
		else
			of_AddMenu(m.Item[index].Text,m.Item[index].MenuImage,m.Item[index].MicroHelp,m.Item[index].Enabled,index)
			if m.Item[index].Checked then
				of_Check(index,true,true)
			end if
		end if
	next
end if

_AttachedMenu = m

return RetCode.OK
end function

public function unsignedlong of_popup (readonly unsignedlong hwnd, readonly unsignedlong hwndcallback, readonly real x, readonly real y);return of_Popup(hWnd,hWndCallback,x,y,0)
end function

public function unsignedlong of_popup (readonly unsignedlong hwnd, readonly unsignedlong hwndcallback, readonly real x, readonly real y, readonly unsignedlong flags);return _PopupMenuNative.PopupEx(hWnd,hWndCallback,x,y,flags)
end function

public function unsignedlong of_popup (readonly unsignedlong hwnd, readonly real x, readonly real y, readonly unsignedlong flags);return of_Popup(hWnd,0,x,y,flags)
end function

public function unsignedlong of_popup (readonly unsignedlong hwnd, readonly real x, readonly real y);return of_Popup(hWnd,x,y,0)
end function

public function long of_popup (readonly real x, readonly real y, readonly unsignedlong flags);return of_Popup(0,x,y,flags)
end function

public function unsignedlong of_popup (readonly real x, readonly real y);return of_Popup(x,y,0)
end function

public function long of_enable (readonly unsignedlong id, readonly boolean byposition, readonly boolean enable);//====================================================================
// Function: of_enable()
//--------------------------------------------------------------------
// Description: 设置菜单项可用性
//--------------------------------------------------------------------
// Arguments:
// 	readonly	unsignedlong	id        	
// 	readonly	boolean     	byposition	为true时[id]为位置（index），否则为ID
// 	readonly	boolean     	enable    	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return iif(_PopupMenuNative.Enable(id,byPosition,enable),RetCode.OK,RetCode.FAILED)
end function

public function long of_check (readonly unsignedlong id, readonly boolean byposition, readonly boolean checked);//====================================================================
// Function: of_check()
//--------------------------------------------------------------------
// Description: 勾选菜单项
//--------------------------------------------------------------------
// Arguments:
// 	readonly	unsignedlong	id        	
// 	readonly	boolean     	byposition	为true时[id]为位置（index），否则为ID
// 	readonly	boolean     	checked   	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-08-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return iif(_PopupMenuNative.Check(id,byPosition,checked),RetCode.OK,RetCode.FAILED)
end function

private function integer _of_getimageindex (readonly string image);if image = "" then return 0

if Not IsValidObject(_ImageList) then
	_ImageList = Create n_imagelist
	_ImageList.ShareImage(true)
	_ImageList.SetImageSize(theme.#IconSize.cx,theme.#IconSize.cy)
	_PopupMenuNative.SetImageList(_ImageList)
end if

return _ImageList.AddImage(theme.of_GetIcon(image,0))
end function

public function long of_settag (readonly unsignedlong id, readonly boolean byposition, readonly string tag);return iif(_PopupMenuNative.SetTag(id,byPosition,tag),RetCode.OK,RetCode.FAILED)
end function

public function string of_gettag (readonly unsignedlong id, readonly boolean byposition);return _PopupMenuNative.GetTag(id,byPosition)
end function

on n_cst_popupmenu.create
call super::create
this.theme=create theme
TriggerEvent( this, "constructor" )
end on

on n_cst_popupmenu.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.theme)
end on

event constructor;_PopupMenuNative = Create n_popupmenuex
_PopupMenuNative.Event OnInit(this)

_PopupMenuNative.SetToolTip(#ToolTip)
_PopupMenuNative.SetBorderShadow(#BorderShadow)
_PopupMenuNative.SetTitleText(#TitleText)
_PopupMenuNative.SetTitleImage(_of_GetImageIndex(#TitleImage))

theme.Event OnThemeChanged(theme.EVT_THEME)

Event OnPreConstructor()
end event

event destructor;int index

Event OnPreDestructor()

for index = UpperBound(_SubMenus) to 1 step -1
	Destroy _SubMenus[index]
next

Destroy _PopupMenuNative
if IsValid(_ImageList) then
	Destroy _ImageList
end if

end event

type theme from n_cst_popupmenu_theme within n_cst_popupmenu descriptor "pb_nvo" = "true" 
end type

event onthemechanged;call super::onthemechanged;choose case eventFlag
	case EVT_THEME
		_PopupMenuNative.SetFont(Font.#Handle)
		_PopupMenuNative.SetTitleBar(#TitleBar)
		_PopupMenuNative.SetSelectBold(#SelectBold)
		_PopupMenuNative.SetTitleTextAlign(#TitleBarTextAlign)
		_PopupMenuNative.SetTitleImageAlign(#TitleBarIconAlign)
		_PopupMenuNative.SetBkgndStyle(#BkgndStyle)
		_PopupMenuNative.SetBorderStyle(#BorderStyle)
		_PopupMenuNative.SetItemBkgndStyle(#ItemBkgndStyle)
		_PopupMenuNative.SetItemBorderStyle(#ItemBorderStyle)
		_PopupMenuNative.SetBkgndColor(of_GetColor(CLR_BKGND,0))
		_PopupMenuNative.SetItemBkgndColor(of_GetItemColor(0,CLR_BKGND,Enums.STATE_HOVER))
		_PopupMenuNative.SetBorderColor(of_GetColor(CLR_BORDER,0))
		_PopupMenuNative.SetItemBorderColor(of_GetItemColor(0,CLR_BORDER,Enums.STATE_HOVER))
		_PopupMenuNative.SetSeparatorColor(of_GetColor(CLR_LINE,0))
		_PopupMenuNative.SetTextColor(of_GetColor(CLR_TEXT,0))
		_PopupMenuNative.SetDisabledTextColor(of_GetColor(CLR_TEXT,Enums.STATE_DISABLED))
		_PopupMenuNative.SetArrowColor(of_GetColor(CLR_ARROW,0))
		_PopupMenuNative.SetDisabledArrowColor(of_GetColor(CLR_ARROW,Enums.STATE_DISABLED))
		if IsValid(_ImageList) then
			_ImageList.SetImageSize(#IconSize.cx,#IconSize.cy)
		end if
	case EVT_TITLEBAR
		_PopupMenuNative.SetTitleBar(#TitleBar)
	case EVT_SELECTBOLD
		_PopupMenuNative.SetSelectBold(#SelectBold)
	case EVT_TITLEBARTEXTALIGN
		_PopupMenuNative.SetTitleTextAlign(#TitleBarTextAlign)
	case EVT_TITLEBARICONALIGN
		_PopupMenuNative.SetTitleImageAlign(#TitleBarIconAlign)
	case EVT_BKGNDCOLORSTYLE
		_PopupMenuNative.SetBkgndColor(of_GetColor(CLR_BKGND,0))
		_PopupMenuNative.SetItemBkgndColor(of_GetItemColor(0,CLR_BKGND,Enums.STATE_HOVER))
		_PopupMenuNative.SetBorderColor(of_GetColor(CLR_BORDER,0))
		_PopupMenuNative.SetItemBorderColor(of_GetItemColor(0,CLR_BORDER,Enums.STATE_HOVER))
		_PopupMenuNative.SetSeparatorColor(of_GetColor(CLR_LINE,0))
		_PopupMenuNative.SetTextColor(of_GetColor(CLR_TEXT,0))
		_PopupMenuNative.SetDisabledTextColor(of_GetColor(CLR_TEXT,Enums.STATE_DISABLED))
		_PopupMenuNative.SetArrowColor(of_GetColor(CLR_ARROW,0))
		_PopupMenuNative.SetDisabledArrowColor(of_GetColor(CLR_ARROW,Enums.STATE_DISABLED))
	case EVT_BKGNDSTYLE
		_PopupMenuNative.SetBkgndStyle(#BkgndStyle)
	case EVT_BORDERSTYLE
		_PopupMenuNative.SetBorderStyle(#BorderStyle)
	case EVT_ITEMBKGNDSTYLE
		_PopupMenuNative.SetItemBkgndStyle(#ItemBkgndStyle)
	case EVT_ITEMBORDERSTYLE
		_PopupMenuNative.SetItemBorderStyle(#ItemBorderStyle)
	case EVT_FONT
		_PopupMenuNative.SetFont(Font.#Handle)
	case EVT_ICONSIZE
		if IsValid(_ImageList) then
			_ImageList.SetImageSize(#IconSize.cx,#IconSize.cy)
		end if
end choose

int index

for index = 1 to UpperBound(_SubMenus)
	_SubMenus[index].theme.of_SetTheme(theme)
next

Parent.Event OnThemeChanged(eventFlag)
end event

on theme.create
call super::create
end on

on theme.destroy
call super::destroy
end on

event onthemechanging;call super::onthemechanging;return parent.Event OnThemeChanging(newTheme)
end event

