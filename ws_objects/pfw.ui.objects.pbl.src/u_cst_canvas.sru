$PBExportHeader$u_cst_canvas.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_canvas from u_canvas
end type
type uo_logo from u_logo within u_cst_canvas
end type
end forward

global type u_cst_canvas from u_canvas
long backcolor = 67108864
event onpostconstructor ( )
event ongetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event onthemechanged ( unsignedinteger eventflag )
event onpreconstructor ( )
event onpredestructor ( )
event onconstructor pbm_constructor
event ondestructor pbm_destructor
event oninit ( )
event onuninit ( )
uo_logo uo_logo
end type
global u_cst_canvas u_cst_canvas

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
PrivateWrite 	Ulong		#Handle
PrivateWrite 	Window	#ParentWindow
ProtectedWrite 	Boolean	#Transparent		= false
Boolean						#LockUpdate		= false
Boolean						#FadeAnimation	= false
Uint							#FadeTime			= 250		//ms

/*--- Implementation ---*/
Private:
Constant String PRP_OBJECTCREATOR = "{OBJECT_CREATOR}"
end variables

forward prototypes
public function long of_updateparentbkgnd (readonly boolean bredraw)
public function long of_settransparent (readonly boolean transparent, readonly boolean bredraw)
public function long of_settransparent (readonly boolean transparent)
protected function boolean _of_openuserobject (ref dragobject object)
protected function boolean _of_openuserobject (ref dragobject object, readonly string clsname)
protected function boolean _of_isobjectcreator (readonly dragobject object)
protected function boolean _of_closeuserobject (readonly dragobject object)
end prototypes

event onconstructor;#Handle = GetHandle()
#ParentWindow = GetParentWindow(this)

Init()
Event OnInit()
Event OnPreConstructor()
Event Constructor()
Post Event OnPostConstructor( )
end event

event ondestructor;Event OnPreDestructor()
Event Destructor()
Event OnUninit()
end event

public function long of_updateparentbkgnd (readonly boolean bredraw);if Not #Transparent then return RetCode.E_NO_SUPPORT

Win32.UpdateParentBkgnd(#Handle,bRedraw)

return RetCode.OK
end function

public function long of_settransparent (readonly boolean transparent, readonly boolean bredraw);if #Transparent = transparent then return RetCode.OK

#Transparent = transparent
if #Transparent then
	Win32.UpdateParentBkgnd(#Handle,false)
end if
if bRedraw then
	SetRedraw(true)
end if

return RetCode.OK
end function

public function long of_settransparent (readonly boolean transparent);return of_SetTransparent(transparent,true)
end function

protected function boolean _of_openuserobject (ref dragobject object);return _of_OpenUserObject(object,"")
end function

protected function boolean _of_openuserobject (ref dragobject object, readonly string clsname);//始终采用#ParentWindow来创建新的对象
//2015-01-30
/*--- PB12以下版本使用下面的代码 ---*/
if Not IsValidObject(#ParentWindow) then return false
if Len(clsName) = 0 then
	#ParentWindow.OpenUserObjectWithParm(ref object,this)
else
	#ParentWindow.OpenUserObjectWithParm(ref object,this,clsName)
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
end function

protected function boolean _of_isobjectcreator (readonly dragobject object);if Not IsValidObject(object) then return false

return (Win32.GetProp(Handle(object),PRP_OBJECTCREATOR) = 1)
end function

protected function boolean _of_closeuserobject (readonly dragobject object);if Not IsValidObject(object) then return false
if Not _of_IsObjectCreator(object) then return false

Win32.RemoveProp(Handle(object),PRP_OBJECTCREATOR)

/*--- PB12以下版本使用下面的代码 ---*/
return (#ParentWindow.CloseUserObject(object) = 1)
/*--------------------------------------------------*/
/*
/*--- PB12及以上版本使用下面的代码 ---*/
return (CloseUserObject(object) = 1)
/*--------------------------------------------------*/
*/
end function

on u_cst_canvas.create
int iCurrent
call super::create
this.uo_logo=create uo_logo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_logo
end on

on u_cst_canvas.destroy
call super::destroy
destroy(this.uo_logo)
end on

type uo_logo from u_logo within u_cst_canvas
string tag = "Canvas"
integer taborder = 10
end type

on uo_logo.destroy
call u_logo::destroy
end on

event constructor;call super::constructor;/*
/*--- PB12以下版本使用下面的代码 ---*/
#ParentWindow.CloseUserObject(this)
/*--------------------------------------------------*/
*/

/*--- PB12及以上版本使用下面的代码 ---*/
Parent.CloseUserObject(this)
/*--------------------------------------------------*/
end event

