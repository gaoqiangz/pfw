$PBExportHeader$w_test_sciter_wnd.srw
forward
global type w_test_sciter_wnd from w_cst_sciter
end type
type sciterfunctor from n_sciterfunctor within w_test_sciter_wnd
end type
type scitereventhandler from n_scitereventhandler within w_test_sciter_wnd
end type
end forward

global type w_test_sciter_wnd from w_cst_sciter
sciterfunctor sciterfunctor
scitereventhandler scitereventhandler
end type
global w_test_sciter_wnd w_test_sciter_wnd

event open;call super::open;//捕获JS脚本调用(Window.this.xcall([Method]))
wf_AttachEvent(Enums.SC_HANDLE_INVOKE_METHOD)
//设置元素事件处理对象的事件过滤类型,这里设置为Sciter预定行为事件和JS脚本调用(element.xcall([Method]))
SciterEventHandler.SetFilter(Enums.SC_HANDLE_EVENT + Enums.SC_HANDLE_INVOKE_METHOD)

wf_LoadFile("tests\sciter\window.htm")

//设置元素的事件处理对象
n_sciterelement el
el = wf_GetElementByID("test-eventhandler") //通过GetElementByID取元素
el.AttachEventHandler(SciterEventHandler)
end event

on w_test_sciter_wnd.create
call super::create
this.sciterfunctor=create sciterfunctor
this.scitereventhandler=create scitereventhandler
end on

on w_test_sciter_wnd.destroy
call super::destroy
destroy(this.sciterfunctor)
destroy(this.scitereventhandler)
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
		retValue.SetItem("Element",wf_FindElement("#notifyInfo"))
		//返回PB字符串值
		retValue.SetItem("PBValue","uo_sciter::PBValue")
	case else
		retValue.MakeError("Throw error from PB!")
end choose

return retValue
end event

type sciterfunctor from n_sciterfunctor within w_test_sciter_wnd descriptor "pb_nvo" = "true" 
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

type scitereventhandler from n_scitereventhandler within w_test_sciter_wnd descriptor "pb_nvo" = "true" 
end type

on scitereventhandler.create
call super::create
end on

on scitereventhandler.destroy
call super::destroy
end on

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

