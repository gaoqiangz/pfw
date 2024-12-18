﻿$PBExportHeader$n_cst_threading_task_sqlcommand.sru
$PBExportComments$线程SQL命令任务控制对象~r~n[运行在当前线程]
forward
global type n_cst_threading_task_sqlcommand from n_cst_threading_task_sqlbase
end type
end forward

global type n_cst_threading_task_sqlcommand from n_cst_threading_task_sqlbase
string #type = "sqlcommand"
end type
global n_cst_threading_task_sqlcommand n_cst_threading_task_sqlcommand

type variables
/*--- Constants ---*/
public:
//Type
constant string TASK_TYPE = "sqlcommand"
//AutCommit type
constant long AC_OFF		= n_cst_thread_task_sqlcommand.AC_OFF
constant long AC_ON		= n_cst_thread_task_sqlcommand.AC_ON
constant long AC_NATIVE	= n_cst_thread_task_sqlcommand.AC_NATIVE

end variables

forward prototypes
private function n_cst_thread_task_sqlcommand _of_gettask ()
public function long of_setsql (readonly string sql)
public function long of_setautocommit (readonly long autocommit)
end prototypes

private function n_cst_thread_task_sqlcommand _of_gettask ();return _Task
end function

public function long of_setsql (readonly string sql);if of_IsBusy() then return RetCode.E_BUSY

#IF DEFINED DEBUG THEN
	Assert(Len(sql) > 0,"Len(sql) <= 0")
#END IF

return _of_GetTask().of_SetSQL(sql)
end function

public function long of_setautocommit (readonly long autocommit);if of_IsBusy() then return RetCode.E_BUSY

return _of_GetTask().of_SetAutoCommit(autoCommit)
end function

on n_cst_threading_task_sqlcommand.create
call super::create
end on

on n_cst_threading_task_sqlcommand.destroy
call super::destroy
end on

event ongettaskclsname;call super::ongettaskclsname;return "n_cst_thread_task_sqlcommand"
end event

