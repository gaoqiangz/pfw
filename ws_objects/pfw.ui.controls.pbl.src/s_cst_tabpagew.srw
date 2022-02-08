$PBExportHeader$s_cst_tabpagew.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type s_cst_tabpagew from window
end type
type timer from n_timer within s_cst_tabpagew
end type
end forward

global type s_cst_tabpagew from window
integer width = 2199
integer height = 1492
boolean border = false
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean toolbarvisible = false
event ongetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event onthemechanged ( unsignedinteger eventflag )
event type boolean ontimer ( unsignedinteger id )
event oninit ( u_cst_tabcontrol parenttabcontrol )
event onpreclose ( )
event onpreopen ( )
event onpostopen ( )
event type long onactivating ( )
event type long ondeactivating ( )
event type long onfloating ( )
event onfloated ( )
event type long ondocking ( )
event ondocked ( )
event onopened ( )
event onclose pbm_custom75
event onprivo pbm_open
event ongetfloatminsize ( ref real minwidth,  ref real minheight )
event onreposition ( ref real newx,  ref real newy,  ref real newwidth,  ref real newheight )
timer timer
end type
global s_cst_tabpagew s_cst_tabpagew

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
//*** 特别说明 ***/
//通常情况下本窗口的CloseQuery事件只有在TabControl移除标签时会被触发一次
//但如果在TabControl标签未移除的情况下关闭父窗口（TabControl所有在顶层窗口）
//这个时候该窗口同样会调用本窗口的CloseQuery事件，此时如果返回1则将会阻止父窗口的关闭
//如果要避免这种情况请在父窗口关闭前将TabControl的所有标签移除

/*--- Properties ---*/
Public:
PrivateWrite u_cst_tabcontrol			#ParentTabControl
PrivateWrite n_cst_tabcontrol_theme	theme
end variables

forward prototypes
public function long wf_timer (readonly double interval)
public function long wf_timer (readonly unsignedlong id, readonly double interval)
public function boolean wf_istimerrunning (readonly unsignedlong id)
public function double wf_gettimerinterval (readonly unsignedlong id)
public function long wf_closetab ()
public function integer wf_gettabindex ()
public function string wf_gettabtext ()
public function boolean wf_istabfloated ()
public function boolean wf_istabselected ()
public function long wf_showtabfloatwindow ()
public function string wf_gettabtag ()
public function any wf_gettabdata ()
public function long wf_selecttab ()
end prototypes

event oninit(u_cst_tabcontrol parenttabcontrol);if IsValidObject(parenttabcontrol) then
	#ParentTabControl = parenttabcontrol
	theme = #ParentTabControl.theme
	Event OnThemeChanged(theme.EVT_THEME)
end if
end event

event onopened();Event OnPreOpen()
Event Open()
Post Event OnPostOpen()
end event

event onclose;Event OnPreClose()
Event Close()
Timer.StopAll()
end event

event onprivo;//Don't Touch!
Visible = false
return 0
end event

public function long wf_timer (readonly double interval);return wf_Timer(0,interval)
end function

public function long wf_timer (readonly unsignedlong id, readonly double interval);if Timer.Start(id,interval * 1000) then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function boolean wf_istimerrunning (readonly unsignedlong id);return Timer.IsRunning(id)
end function

public function double wf_gettimerinterval (readonly unsignedlong id);return (Double(Timer.GetInterval(id)) / 1000)
end function

public function long wf_closetab ();return #ParentTabControl.of_Remove(wf_GetTabIndex())
end function

public function integer wf_gettabindex ();return #ParentTabControl.of_GetIndex(this)
end function

public function string wf_gettabtext ();return #ParentTabControl.of_GetText(wf_GetTabIndex())
end function

public function boolean wf_istabfloated ();return #ParentTabControl.of_IsFloated(wf_GetTabIndex())
end function

public function boolean wf_istabselected ();return (#ParentTabControl.of_GetSelectedIndex() = wf_GetTabIndex())
end function

public function long wf_showtabfloatwindow ();return #ParentTabControl.of_ShowFloatWindow(wf_GetTabIndex())
end function

public function string wf_gettabtag ();return #ParentTabControl.of_GetTag(wf_GetTabIndex())
end function

public function any wf_gettabdata ();return #ParentTabControl.of_GetData(wf_GetTabIndex())
end function

public function long wf_selecttab ();return #ParentTabControl.of_Select(wf_GetTabIndex())
end function

on s_cst_tabpagew.create
this.timer=create timer
end on

on s_cst_tabpagew.destroy
destroy(this.timer)
end on

type timer from n_timer within s_cst_tabpagew descriptor "pb_nvo" = "true" 
end type

event ontimer;call super::ontimer;return Parent.Event OnTimer(id)
end event

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

