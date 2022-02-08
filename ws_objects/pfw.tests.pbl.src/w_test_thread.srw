$PBExportHeader$w_test_thread.srw
forward
global type w_test_thread from window
end type
type cb_4 from commandbutton within w_test_thread
end type
type cb_3 from commandbutton within w_test_thread
end type
type mle_1 from multilineedit within w_test_thread
end type
type cb_2 from commandbutton within w_test_thread
end type
type cb_1 from commandbutton within w_test_thread
end type
end forward

global type w_test_thread from window
integer width = 4754
integer height = 1980
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event type long onthreadstart ( n_cst_threading threading )
event onthreadstop ( n_cst_threading threading,  long exitcode,  string lasterrorinfo )
event type long ontaskrandom ( n_cst_threading_task tasking,  long wparam,  long lparam )
event type long ontaskstart ( n_cst_threading_task tasking )
event ontaskstop ( n_cst_threading_task tasking,  long exitcode,  string lasterrorinfo )
event type long ontasknotify ( n_cst_threading_task tasking,  long wparam,  long lparam,  string sparam )
cb_4 cb_4
cb_3 cb_3
mle_1 mle_1
cb_2 cb_2
cb_1 cb_1
end type
global w_test_thread w_test_thread

type prototypes
Function Ulong GetTickCount() Library "Kernel32.dll"
Function ulong SleepMS(ulong dwMilliseconds) Library "kernel32.dll" Alias for "Sleep"
end prototypes

type variables
n_cst_threading threads[]
end variables

event type long onthreadstart(n_cst_threading threading);mle_1.Text += "~r~nThread Start:" + threading.#Tag
mle_1.Scroll(mle_1.LineCount())
return 0 //返回1阻止
end event

event onthreadstop(n_cst_threading threading, long exitcode, string lasterrorinfo);mle_1.Text += "~r~nThread Stop:" + threading.#Tag
mle_1.Scroll(mle_1.LineCount())
end event

event type long ontaskrandom(n_cst_threading_task tasking, long wparam, long lparam);mle_1.Text += "~r~nOnTaskRandom:" + tasking.#Tag +&
					"~r~nwparam:" + String(wparam) +&
					"~r~nlparam:" + String(lparam)

mle_1.Scroll(mle_1.LineCount())
return 0
end event

event type long ontaskstart(n_cst_threading_task tasking);mle_1.Text += "~r~nTask Start:" + tasking.#Tag
mle_1.Scroll(mle_1.LineCount())
return 0 //返回1阻止
end event

event ontaskstop(n_cst_threading_task tasking, long exitcode, string lasterrorinfo);mle_1.Text += "~r~nTask Stop:" + tasking.#Tag
mle_1.Scroll(mle_1.LineCount())
end event

event type long ontasknotify(n_cst_threading_task tasking, long wparam, long lparam, string sparam);mle_1.Text += "~r~nTask Notify:" + tasking.#Tag +&
					"~r~nwparam:" + String(wparam) +&
					"~r~nlparam:" + String(lparam) +&
					"~r~nsparam:" + sparam
mle_1.Scroll(mle_1.LineCount())
return 0
end event

on w_test_thread.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.mle_1=create mle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.mle_1,&
this.cb_2,&
this.cb_1}
end on

on w_test_thread.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.mle_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event close;int nIndex

for nIndex = 1 to UpperBound(threads)
	threads[nIndex].of_Terminate()
	Destroy threads[nIndex]
next
end event

event open;int index
n_cst_threading_task_test task

for index = 1 to 2
	//创建线程对象
	threads[index] = Create n_cst_threading
	//设置线程名称
	threads[index].#Tag = "THREAD ID " + String(index)
	//订阅线程事件
	threads[index].of_On("start" /*事件名称*/,this /*回调对象*/,"onThreadStart" /*回调事件名称*/)
	threads[index].of_On("stop",this,"onThreadStop")
	//绑定线程CPU
	threads[index].of_SetAffinity(index)
	//添加任务
	threads[index].of_AddTask(ref task,"n_cst_threading_task_test")
	//设置任务名称
	task.#Tag = "TASK ID " + String(index)
	//订阅任务事件
	task.of_On("start" /*事件名称*/,this /*回调对象*/,"onTaskStart" /*回调事件名称*/)
	task.of_On("stop",this,"onTaskStop")
	task.of_On("notify",this,"onTaskNotify")
	//-任务自定义事件
	task.of_On("random",this,"onTaskRandom")
next

end event

type cb_4 from commandbutton within w_test_thread
integer x = 2482
integer y = 416
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Resume"
end type

event clicked;int nIndex

for nIndex = 1 to UpperBound(threads)
	threads[nIndex].of_Resume()
next
end event

type cb_3 from commandbutton within w_test_thread
integer x = 1911
integer y = 408
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Suspend"
end type

event clicked;int nIndex

for nIndex = 1 to UpperBound(threads)
	threads[nIndex].of_Suspend()
next
end event

type mle_1 from multilineedit within w_test_thread
integer x = 165
integer y = 784
integer width = 3991
integer height = 956
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_test_thread
integer x = 1033
integer y = 388
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Stop"
end type

event clicked;int nIndex

for nIndex = 1 to UpperBound(threads)
	threads[nIndex].of_Stop()
next
end event

type cb_1 from commandbutton within w_test_thread
integer x = 430
integer y = 380
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Start"
end type

event clicked;int nIndex

for nIndex = 1 to UpperBound(threads)
	threads[nIndex].of_Run()
next
end event

