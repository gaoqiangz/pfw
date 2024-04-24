$PBExportHeader$n_cst_thread_task_sqlbase_ds_mt.sru
$PBExportComments$线程SQL任务对象Datastore~r~n[运行在子线程]
forward
global type n_cst_thread_task_sqlbase_ds_mt from n_cst_thread_task_sqlbase_ds
end type
end forward

global type n_cst_thread_task_sqlbase_ds_mt from n_cst_thread_task_sqlbase_ds
end type
global n_cst_thread_task_sqlbase_ds_mt n_cst_thread_task_sqlbase_ds_mt

type variables
private:
long _nUpdateCurrent
long _nUpdateTotal
long _nUpdateNotifyTick
end variables

on n_cst_thread_task_sqlbase_ds_mt.create
call super::create
end on

on n_cst_thread_task_sqlbase_ds_mt.destroy
call super::destroy
end on

event retrievestart;call super::retrievestart;if #ParentTask.of_IsCancelled() then return 1
end event

event sqlpreview;call super::sqlpreview;if #ParentTask.of_IsCancelled() then return 1
if sqlType <> PreviewSelect! then
	if sqlType = PreviewDelete! and (buffer = Primary! or buffer = Filter!) then
		//Delete-Then-Insert
		return AncestorReturnValue
	end if
	_nUpdateCurrent ++
	if CPU() - _nUpdateNotifyTick > 100 or _nUpdateCurrent = 1 or _nUpdateCurrent >= _nUpdateTotal then
		_nUpdateNotifyTick = CPU()
		if #ParentTask.Event OnNotify(n_cst_threading_task_sqlupdate.NCD_PROGRESS,MakeLong(_nUpdateCurrent,_nUpdateTotal),"") = 1 then
			return 1
		end if
	end if
end if
return AncestorReturnValue
end event

event updatestart;call super::updatestart;long nRow

if #ParentTask.of_IsCancelled() then return 1

_nUpdateCurrent = 0
_nUpdateTotal = ModifiedCount()
_nUpdateNotifyTick = CPU()

for nRow = DeletedCount() to 1 step -1
	choose case GetItemStatus(nRow,0,Delete!)
		case NotModified!,DataModified!
			_nUpdateTotal ++
	end choose
next
end event

event retrieverow;call super::retrieverow;if #ParentTask.of_IsCancelled() then return 1
if _nMaxRows > 0 and row > _nMaxRows then
	if #ParentTask.Event OnNotify(n_cst_threading_task_sqlquery.NCD_MAXROWS,row,"") = 1 then
		_nMaxRows = 0
		return 0
	end if
	_bRowsExceeded = true
	return 1
end if
end event

