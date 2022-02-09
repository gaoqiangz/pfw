$PBExportHeader$n_test_threading_task.sru
forward
global type n_test_threading_task from n_cst_threading_task
end type
end forward

global type n_test_threading_task from n_cst_threading_task
end type
global n_test_threading_task n_test_threading_task

event ongettaskclsname;call super::ongettaskclsname;return "n_test_thread_task"
end event

on n_test_threading_task.create
call super::create
end on

on n_test_threading_task.destroy
call super::destroy
end on

