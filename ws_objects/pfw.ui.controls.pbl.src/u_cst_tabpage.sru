$PBExportHeader$u_cst_tabpage.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage from userobject
end type
type timer from n_timer within u_cst_tabpage
end type
end forward

global type u_cst_tabpage from userobject
integer width = 2199
integer height = 1492
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ongetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event onthemechanged ( unsignedinteger eventflag )
event type boolean ontimer ( unsignedinteger id )
event onpostconstructor ( )
event oninit ( u_cst_tabcontrol parenttabcontrol )
event type long onclosequery ( )
event onopened ( any parm )
event onpreconstructor ( )
event onpredestructor ( )
event onpreopen ( any parm )
event onpostopen ( )
event type long onactivating ( )
event type long ondeactivating ( )
event onactivated ( )
event ondeactivated ( )
event type long onfloating ( )
event onfloated ( )
event type long ondocking ( )
event ondocked ( )
event onconstructor pbm_constructor
event ondestructor pbm_destructor
event onopen ( any parm )
event onclose ( )
event ongetfloatminsize ( ref real minwidth,  ref real minheight )
event onreposition ( ref real newx,  ref real newy,  ref real newwidth,  ref real newheight )
timer timer
end type
global u_cst_tabpage u_cst_tabpage

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
PrivateWrite u_cst_tabcontrol			#ParentTabControl
PrivateWrite n_cst_tabcontrol_theme	theme
end variables

forward prototypes
public function long of_timer (readonly double interval)
public function double of_gettimerinterval (readonly unsignedlong id)
public function boolean of_istimerrunning (readonly unsignedlong id)
public function long of_timer (readonly unsignedlong id, readonly double interval)
public function integer of_gettabindex ()
public function long of_closetab ()
public function string of_gettabtext ()
public function boolean of_istabfloated ()
public function boolean of_istabselected ()
public function long of_showtabfloatwindow ()
public function string of_gettabtag ()
public function any of_gettabdata ()
public function long of_selecttab ()
end prototypes

event oninit(u_cst_tabcontrol parenttabcontrol);if IsValidObject(parenttabcontrol) then
	#ParentTabControl = parenttabcontrol
	theme = #ParentTabControl.theme
	Event OnThemeChanged(theme.EVT_THEME)
end if
end event

event onopened(any parm);Event OnPreOpen(parm)
Event OnOpen(parm)
Post Event OnPostOpen()
end event

event onconstructor;Visible = false

Event OnPreConstructor()
Event Constructor()
Post Event OnPostConstructor( )
end event

event ondestructor;Event OnPreDestructor()
Event Destructor()
Timer.StopAll()
end event

public function long of_timer (readonly double interval);return of_Timer(0,interval)
end function

public function double of_gettimerinterval (readonly unsignedlong id);return (Double(Timer.GetInterval(id)) / 1000)
end function

public function boolean of_istimerrunning (readonly unsignedlong id);return Timer.IsRunning(id)
end function

public function long of_timer (readonly unsignedlong id, readonly double interval);if Timer.Start(id,interval * 1000) then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function integer of_gettabindex ();return #ParentTabControl.of_GetIndex(this)
end function

public function long of_closetab ();return #ParentTabControl.of_Remove(of_GetTabIndex())
end function

public function string of_gettabtext ();return #ParentTabControl.of_GetText(of_GetTabIndex())
end function

public function boolean of_istabfloated ();return #ParentTabControl.of_IsFloated(of_GetTabIndex())
end function

public function boolean of_istabselected ();return (#ParentTabControl.of_GetSelectedIndex() = of_GetTabIndex())
end function

public function long of_showtabfloatwindow ();return #ParentTabControl.of_ShowFloatWindow(of_GetTabIndex())
end function

public function string of_gettabtag ();return #ParentTabControl.of_GetTag(of_GetTabIndex())
end function

public function any of_gettabdata ();return #ParentTabControl.of_GetData(of_GetTabIndex())
end function

public function long of_selecttab ();return #ParentTabControl.of_Select(of_GetTabIndex())
end function

on u_cst_tabpage.create
this.timer=create timer
end on

on u_cst_tabpage.destroy
destroy(this.timer)
end on

type timer from n_timer within u_cst_tabpage descriptor "pb_nvo" = "true" 
end type

event ontimer;call super::ontimer;return Parent.Event OnTimer(id)
end event

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

