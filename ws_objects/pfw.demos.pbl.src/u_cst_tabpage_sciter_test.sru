$PBExportHeader$u_cst_tabpage_sciter_test.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_sciter_test from ue_cst_tabpage
end type
type dw_test from se_cst_datawindow within u_cst_tabpage_sciter_test
end type
type uo_sciter from u_sciter within u_cst_tabpage_sciter_test
end type
type scitereventhandler from n_scitereventhandler within u_cst_tabpage_sciter_test
end type
type sciterfunctor from n_sciterfunctor within u_cst_tabpage_sciter_test
end type
end forward

global type u_cst_tabpage_sciter_test from ue_cst_tabpage
dw_test dw_test
uo_sciter uo_sciter
scitereventhandler scitereventhandler
sciterfunctor sciterfunctor
end type
global u_cst_tabpage_sciter_test u_cst_tabpage_sciter_test

on u_cst_tabpage_sciter_test.create
int iCurrent
call super::create
this.dw_test=create dw_test
this.uo_sciter=create uo_sciter
this.scitereventhandler=create scitereventhandler
this.sciterfunctor=create sciterfunctor
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_test
this.Control[iCurrent+2]=this.uo_sciter
end on

on u_cst_tabpage_sciter_test.destroy
call super::destroy
destroy(this.dw_test)
destroy(this.uo_sciter)
destroy(this.scitereventhandler)
destroy(this.sciterfunctor)
end on

event resize;call super::resize;uo_sciter.Move(0,0)
uo_sciter.Resize(newWidth,newHeight)
end event

event onopen;call super::onopen;n_sciterelement el

//捕获TIScript脚本调用(view.[Method])
uo_sciter.AttachEvent(Enums.SC_HANDLE_INVOKE_METHOD)
//设置文字渲染的平滑模式为Clear-Type(High Quality)
uo_sciter.SetOption(Enums.SC_OPT_FONT_SMOOTHING,Enums.SC_OPTV_FONT_CLEAR_TYPE)
//设置元素事件处理对象的事件过滤类型,这里设置为Sciter预定行为事件和TIScript脚本调用(element.[Method])
SciterEventHandler.SetFilter(Enums.SC_HANDLE_EVENT + Enums.SC_HANDLE_INVOKE_METHOD)

//加载html文件
uo_sciter.LoadFile("html\sciter\main.htm")

//设置元素的事件处理对象
el = uo_sciter.GetElementByID("test-eventhandler") //通过GetElementByID取元素
el.AttachEventHandler(SciterEventHandler)

//元素绑定PB控件(DataWindow)
el = uo_sciter.FindElement("#dw") //通过CSS选择器取元素
el.AttachObject(dw_test)
end event

type dw_test from se_cst_datawindow within u_cst_tabpage_sciter_test
integer x = 645
integer y = 504
integer taborder = 20
string dataobject = "dw_test"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type uo_sciter from u_sciter within u_cst_tabpage_sciter_test
integer width = 2213
integer height = 1496
integer taborder = 10
end type

on uo_sciter.destroy
call u_sciter::destroy
end on

event oninvokemethod;call super::oninvokemethod;n_scitervalue retValue

retValue = Create n_scitervalue

choose case name
	case "testSciterFunctionObject"
		//调用Sciter函数对象
		//*args[1]为Sciter函数对象
		n_scitervalue valFn
		valFn = args[1]
		valFn.Invoke("PB value")
	case "getValueFromPB"
		//返回PB函数对象
		retValue.SetItem("PBFunc",sciterfunctor)
		//返回Sciter element对象
		retValue.SetItem("Element",uo_sciter.FindElement("#notifyInfo"))
		//返回PB字符串值
		retValue.SetItem("PBValue","uo_sciter::PBValue")
	case else
		retValue.MakeError("Throw error from PB!")
end choose

return retValue
end event

type scitereventhandler from n_scitereventhandler within u_cst_tabpage_sciter_test descriptor "pb_nvo" = "true" 
end type

on scitereventhandler.create
call super::create
end on

on scitereventhandler.destroy
call super::destroy
end on

event oninvokemethod;call super::oninvokemethod;n_scitervalue retValue

retValue = Create n_scitervalue

choose case name
	case "testElementMethod"
		MessageBoxEx("PB - SciterEventHandler::OnInvokeMethod",String(args[1]) + Space(50))
		retValue.SetValue("SciterEventHandler::PBValue")
	case else
		retValue.MakeError("Throw error from PB!")
end choose

return retValue
end event

event onevent;call super::onevent;//[eventFlag]包含事件当前传播的阶段,可以与Enums::PHASH_MASK标志做[AND]运算来过滤相应的阶段事件
//*返回1表示已经处理,这时候其它地方捕获到该事件的时[eventFlag]将会包含Enums::PASH_MASK::SC_PHASE_HANDLED标志

choose case eventFlag
	case Enums.SC_EVT_BUTTON_CLICK + Enums.SC_PHASE_SINKING
		//按钮单击事件 - 当前事件阶段为捕获阶段
		MessageBoxEx("PB - SciterEventHandler::OnEvent","Clicked! - SINKING" + Space(20))
		return 0 //试试返回1看看会有什么不同!
	case Enums.SC_EVT_BUTTON_CLICK + Enums.SC_PHASE_BUBBLING //SC_PHASE_BUBBLING为0,可以不写
		//按钮单击事件 - 当前的事件为冒泡阶段 
		MessageBoxEx("PB - SciterEventHandler::OnEvent","Clicked! - BUBBLING" + Space(20))
	case Enums.SC_EVT_BUTTON_CLICK + Enums.SC_PHASE_HANDLED
		//按钮单击事件 - 当前事件为目标阶段
		MessageBoxEx("PB - SciterEventHandler::OnEvent","Clicked! - HANDLED" + Space(20))
end choose

return 0
end event

type sciterfunctor from n_sciterfunctor within u_cst_tabpage_sciter_test descriptor "pb_nvo" = "true" 
end type

on sciterfunctor.create
call super::create
end on

on sciterfunctor.destroy
call super::destroy
end on

event oninvoke;call super::oninvoke;MessageBoxEx("PB - SciterFunctor::OnInvoke",String(args[1]) + Space(20))

return true
end event

