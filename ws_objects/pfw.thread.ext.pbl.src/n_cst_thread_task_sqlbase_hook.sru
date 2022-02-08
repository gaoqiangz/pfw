$PBExportHeader$n_cst_thread_task_sqlbase_hook.sru
$PBExportComments$线程SQL任务对象钩子~r~n[运行在子线程]
forward
global type n_cst_thread_task_sqlbase_hook from nonvisualobject
end type
end forward

global type n_cst_thread_task_sqlbase_hook from nonvisualobject
event type long onretrieve ( n_cst_thread_task_sqlbase task,  n_cst_thread_trans transobject,  datastore data )
end type
global n_cst_thread_task_sqlbase_hook n_cst_thread_task_sqlbase_hook

on n_cst_thread_task_sqlbase_hook.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_thread_task_sqlbase_hook.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

