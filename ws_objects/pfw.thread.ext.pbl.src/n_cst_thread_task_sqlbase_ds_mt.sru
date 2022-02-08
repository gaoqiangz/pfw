$PBExportHeader$n_cst_thread_task_sqlbase_ds_mt.sru
$PBExportComments$线程SQL任务对象Datastore~r~n[运行在子线程]
forward
global type n_cst_thread_task_sqlbase_ds_mt from n_cst_thread_task_sqlbase_ds
end type
end forward

global type n_cst_thread_task_sqlbase_ds_mt from n_cst_thread_task_sqlbase_ds
end type
global n_cst_thread_task_sqlbase_ds_mt n_cst_thread_task_sqlbase_ds_mt

on n_cst_thread_task_sqlbase_ds_mt.create
call super::create
end on

on n_cst_thread_task_sqlbase_ds_mt.destroy
call super::destroy
end on

event retrievestart;call super::retrievestart;if IsValid(#ParentTask) then
	if #ParentTask.of_IsCancelled() then return 1
end if
end event

event sqlpreview;call super::sqlpreview;if IsValid(#ParentTask) then
	if #ParentTask.of_IsCancelled() then return 1
end if
return AncestorReturnValue
end event

event updatestart;call super::updatestart;if IsValid(#ParentTask) then
	if #ParentTask.of_IsCancelled() then return 1
end if
end event

event retrieverow;call super::retrieverow;if IsValid(#ParentTask) then
	if #ParentTask.of_IsCancelled() then return 1
	if _nMaxRows > 0 and row > _nMaxRows then
		if #ParentTask.Event OnNotify(n_cst_threading_task_sqlquery.NCD_MAXROWS,row,"") = 1 then
			_nMaxRows = 0
			return 0
		end if
		_bRowsExceeded = true
		return 1
	end if
end if
end event

