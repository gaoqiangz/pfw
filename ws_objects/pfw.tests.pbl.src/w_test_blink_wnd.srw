$PBExportHeader$w_test_blink_wnd.srw
forward
global type w_test_blink_wnd from w_blink
end type
end forward

global type w_test_blink_wnd from w_blink
integer width = 3218
integer height = 1960
end type
global w_test_blink_wnd w_test_blink_wnd

event open;call super::open;//wf_SetOption(Enums.BLINK_OPT_ALPHA_WINDOW,true)
wf_LoadUrl("http://echarts.baidu.com/examples/")
end event

on w_test_blink_wnd.create
call super::create
end on

on w_test_blink_wnd.destroy
call super::destroy
end on

event ontitlereceived;call super::ontitlereceived;title = newTitle
return 0
end event

