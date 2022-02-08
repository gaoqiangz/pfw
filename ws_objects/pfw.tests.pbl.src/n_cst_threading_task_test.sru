$PBExportHeader$n_cst_threading_task_test.sru
forward
global type n_cst_threading_task_test from n_cst_threading_task
end type
end forward

global type n_cst_threading_task_test from n_cst_threading_task
end type
global n_cst_threading_task_test n_cst_threading_task_test

event ongettaskclsname;call super::ongettaskclsname;return "n_cst_thread_task_test"
end event

on n_cst_threading_task_test.create
call super::create
end on

on n_cst_threading_task_test.destroy
call super::destroy
end on

