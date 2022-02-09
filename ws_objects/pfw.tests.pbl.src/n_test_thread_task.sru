$PBExportHeader$n_test_thread_task.sru
forward
global type n_test_thread_task from n_cst_thread_task
end type
end forward

global type n_test_thread_task from n_cst_thread_task
end type
global n_test_thread_task n_test_thread_task

type variables

end variables

event ondotask;call super::ondotask;//该事件为任务的处理过程
//以下这段代码的目的是循环产生随机数通知主线程并打印到控制台
//当任务被取消时会退出循环并结束任务
long i

//循环直到任务或线程被取消
//threading.of_Stop/tasking.of_Stop都会触发取消信号

do 
	i ++
	
	//通知主线程
	//触发订阅事件：common-notify(reason=TNR_NOTIFY)/notify
	Event OnPostNotify(i,i + 1,"")
	
	//触发订阅事件：random
	Randomize(0)
	of_Trigger("random",Rand(i),Rand(i + 1))
	
//等待取消信号,如果没有信号则会将任务挂起并释放CPU
//*of_Wait可能会执行GC回收无引用的临时对象
loop while of_Wait(1 /*等待1s*/)

return RetCode.OK
end event

on n_test_thread_task.create
call super::create
end on

on n_test_thread_task.destroy
call super::destroy
end on

event onprepare;call super::onprepare;//该事件在任务OnDoTask之前被调用
//当返回值不为RetCode.OK时则会阻止任务运行,并将这个返回值做为任务的退出代码
return RetCode.OK
end event

event onthreadstart;call super::onthreadstart;//该事件在任务所在线程运行开始时被调用
//当返回值不为RetCode.OK时则会阻止线程运行,并将这个返回值做为线程的退出代码
return RetCode.OK
end event

event onthreadstop;call super::onthreadstop;//该事件在任务所在线程运行结束时被调用
end event

