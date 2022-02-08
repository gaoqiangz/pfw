$PBExportHeader$n_popupmenuex.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_popupmenuex from n_popupmenu
end type
end forward

global type n_popupmenuex from n_popupmenu
event oninit ( n_cst_popupmenu popupmenu )
end type
global n_popupmenuex n_popupmenuex

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
PrivateWrite n_cst_popupmenu #ParentPopupMenu

Private:
ulong _lastSelectID
n_popupmenu _lastSelectSubMenu
end variables

forward prototypes
public function unsignedlong popup (readonly unsignedlong hwnd, readonly real x, readonly real y)
public function unsignedlong popupex (readonly unsignedlong hwnd, readonly unsignedlong hwndcallback, readonly real x, readonly real y, readonly unsignedlong flags)
public function unsignedlong of_getlastselectid ()
public function n_popupmenu of_getlastselectsubmenu ()
end prototypes

event oninit(n_cst_popupmenu popupmenu);if IsValidObject(popupmenu) then
	#ParentPopupMenu = popupmenu
end if
end event

public function unsignedlong popup (readonly unsignedlong hwnd, readonly real x, readonly real y);_lastSelectID = 0
SetNull(_lastSelectSubMenu)
return Super::Popup(hWnd,x,y)
end function

public function unsignedlong popupex (readonly unsignedlong hwnd, readonly unsignedlong hwndcallback, readonly real x, readonly real y, readonly unsignedlong flags);_lastSelectID = 0
SetNull(_lastSelectSubMenu)
return Super::PopupEx(hWnd,hWndCallback,x,y,flags)
end function

public function unsignedlong of_getlastselectid ();return _lastSelectID
end function

public function n_popupmenu of_getlastselectsubmenu ();return _lastSelectSubMenu
end function

on n_popupmenuex.create
call super::create
end on

on n_popupmenuex.destroy
call super::destroy
end on

event onmenuselect;call super::onmenuselect;if IsValidObject(#ParentPopupMenu) then
	if IsPrevented(#ParentPopupMenu.Event OnMenuSelecting(id)) then return 1
	_lastSelectID = id
	#ParentPopupMenu.Event OnMenuSelected(id)
end if
return 0
end event

event onsubmenuselect;call super::onsubmenuselect;if IsValidObject(#ParentPopupMenu) then
	n_popupmenuex subMenuEx
	subMenuEx = subMenu
	if IsPrevented(#ParentPopupMenu.Event OnSubMenuSelecting(subMenuEx.#ParentPopupMenu,id)) then return 1
	_lastSelectSubMenu = subMenu
	#ParentPopupMenu.Event OnSubMenuSelected(subMenuEx.#ParentPopupMenu,id)
end if
return 0
end event

