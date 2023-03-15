$PBExportHeader$n_cst_thread_task_sqlcommand.sru
$PBExportComments$线程SQL命令任务对象~r~n[运行在子线程]
forward
global type n_cst_thread_task_sqlcommand from n_cst_thread_task_sqlbase
end type
end forward

global type n_cst_thread_task_sqlcommand from n_cst_thread_task_sqlbase
end type
global n_cst_thread_task_sqlcommand n_cst_thread_task_sqlcommand

type variables
/*--- Constants ---*/
public:
//AutCommit type
constant long AC_OFF		= 0
constant long AC_ON		= 1	//开启事务并自动提交
constant long AC_NATIVE	= 2	//不开启事务

private:
long _nAutoCommit = AC_OFF
string _sSQL

end variables

forward prototypes
public function long of_reset ()
public function long of_setautocommit (readonly long autocommit)
public function long of_setsql (readonly string sql)
end prototypes

public function long of_reset ();if #Running then return RetCode.E_BUSY

_nAutoCommit = AC_OFF
_sSQL = ""

return super::of_Reset()
end function

public function long of_setautocommit (readonly long autocommit);_nAutoCommit = autoCommit

return RetCode.OK
end function

public function long of_setsql (readonly string sql);if sql = "" then return RetCode.E_INVALID_SQL

_sSQL = sql

return RetCode.OK
end function

on n_cst_thread_task_sqlcommand.create
call super::create
end on

on n_cst_thread_task_sqlcommand.destroy
call super::destroy
end on

event ondotask;call super::ondotask;long rtCode
string sSQL
n_cst_thread_trans transObject
DBERRORDATA dbErrData

if _sSQL = "" then
	Event OnError(RetCode.E_INVALID_SQL,"无效的SQL!")
	return RetCode.E_INVALID_SQL
end if

if IsFailed(of_GetTransObject(ref transObject,ref dbErrData)) then
	Event OnDBError(dbErrData.SQLDBCode,dbErrData.SQLErrText,"",Primary!,0)
	Event OnError(RetCode.E_INVALID_TRANSACTION,dbErrData.SQLErrText)
	return RetCode.E_INVALID_TRANSACTION
end if

if of_IsCancelled() then
	return RetCode.CANCELLED
end if

sSQL = _sSQL
if of_HasParams() then
	if IsFailed(_of_SQLBindParams(ref sSQL,TransObject.of_GetDBType())) then
		Event OnError(RetCode.E_SQL_BIND_ARG_FAILED,"SQL参数绑定失败!")
		return RetCode.E_SQL_BIND_ARG_FAILED
	end if
end if

if _nAutoCommit = AC_NATIVE then
	transObject.AutoCommit = true
end if

rtCode = transObject.of_Exec(sSQL)

if IsSucceeded(rtCode) then
	if _nAutoCommit = AC_NATIVE then
		transObject.AutoCommit = false
		Event OnCommitted()
	elseif _nAutoCommit = AC_ON then
		rtCode = of_Commit(true)
		if IsFailed(rtCode) then
			Event OnError(rtCode,transObject.SQLErrText)
		end if
	end if
else
	if _nAutoCommit = AC_NATIVE then
		transObject.AutoCommit = false
	else
		transObject.of_Rollback()
	end if
	Event OnDBError(transObject.SQLDBCode,transObject.SQLErrText,sSQL,Primary!,0)
	Event OnError(rtCode,transObject.SQLErrText)
end if

return rtCode
end event

