$PBExportHeader$n_cst_threading_task_sqlbase.sru
$PBExportComments$线程SQL基类任务控制对象~r~n[运行在当前线程]
forward
global type n_cst_threading_task_sqlbase from n_cst_threading_task
end type
end forward

global type n_cst_threading_task_sqlbase from n_cst_threading_task
event ondberror ( readonly dberrordata err )
end type
global n_cst_threading_task_sqlbase n_cst_threading_task_sqlbase

type variables
/*--- Implementation ---*/
Protected:
Transaction _Trans
DBERRORDATA _lastDBError
Boolean _bHasTransData
Boolean _bHasParams
end variables

forward prototypes
public function dberrordata of_getlastdberrordata ()
public function transaction of_gettransobject ()
public function long of_reset ()
public function long of_settransobject (readonly transaction trans)
public function long of_settransdata (readonly string dbms, readonly string servername, readonly string database, readonly string logid, readonly string logpass, readonly string dbparm)
public function long of_settransdata (readonly transactiondata transdata)
public function long of_settransobject (readonly n_cst_thread_trans trans)
public function boolean of_hastransdata ()
public function long of_addparam (readonly any param)
public function long of_addparam (readonly string name, readonly any value)
public function long of_resetparams ()
public function boolean of_hasparams ()
end prototypes

event ondberror(readonly dberrordata err);_lastDBError = err
end event

public function dberrordata of_getlastdberrordata ();return _lastDBError
end function

public function transaction of_gettransobject ();return _Trans
end function

public function long of_reset ();long rtCode
n_cst_thread_task_sqlbase task
DBERRORDATA emptyData

if of_IsBusy() then return RetCode.E_BUSY

task = _Task

rtCode = task.of_Reset()
if IsFailed(rtCode) then return rtCode

_bHasParams = false
_lastDBError = emptyData

return RetCode.OK
end function

public function long of_settransobject (readonly transaction trans);long rtCode
TRANSACTIONDATA transData

if of_IsBusy() then return RetCode.E_BUSY
if Not IsValidObject(trans) then return RetCode.E_INVALID_OBJECT

transData.DBMS = trans.DBMS
transData.ServerName = trans.ServerName
transData.Database = trans.Database
transData.LogID = trans.LogID
transData.LogPass = trans.LogPass
transData.DBParm = trans.DBParm
transData.Lock = trans.Lock
transData.AutoCommit = trans.AutoCommit

rtCode = of_SetTransData(transData)
if IsSucceeded(rtCode) then
	_Trans = trans
end if

return rtCode
end function

public function long of_settransdata (readonly string dbms, readonly string servername, readonly string database, readonly string logid, readonly string logpass, readonly string dbparm);TRANSACTIONDATA transData

if of_IsBusy() then return RetCode.E_BUSY

transData.DBMS = DBMS
transData.ServerName = ServerName
transData.Database = Database
transData.LogID = LogID
transData.LogPass = LogPass
transData.DBParm = DBParm

return of_SetTransData(transData)
end function

public function long of_settransdata (readonly transactiondata transdata);long rtCode
n_cst_thread_task_sqlbase task

if of_IsBusy() then return RetCode.E_BUSY

task = _Task

rtCode = task.of_SetTransData(transData)
if IsSucceeded(rtCode) then
	_bHasTransData = true
end if

return rtCode
end function

public function long of_settransobject (readonly n_cst_thread_trans trans);long rtCode

if of_IsBusy() then return RetCode.E_BUSY
if Not IsValidObject(trans) then return RetCode.E_INVALID_OBJECT

rtCode = of_SetTransData(trans.of_GetTransData())
if IsSucceeded(rtCode) then
	_Trans = trans
end if

return rtCode
end function

public function boolean of_hastransdata ();return _bHasTransData
end function

public function long of_addparam (readonly any param);return of_AddParam("",param)
end function

public function long of_addparam (readonly string name, readonly any value);long rtCode
n_cst_thread_task_sqlbase task

if of_IsBusy() then return RetCode.E_BUSY

//参数只支持简单类型或简单类型的一维数组
//if IsNull(value) then return RetCode.E_INVALID_ARGUMENT
if UpperBound(value,2) >= 0 then return RetCode.E_INVALID_ARGUMENT
if UpperBound(value,1) = 0 then return RetCode.E_INVALID_ARGUMENT

task = _Task

rtCode = task.of_AddParam(name,value)
if IsSucceeded(rtCode) then
	_bHasParams = true
end if

return rtCode
end function

public function long of_resetparams ();n_cst_thread_task_sqlbase task

if of_IsBusy() then return RetCode.E_BUSY

_bHasParams = false

task = _Task

return task.of_ResetParams()
end function

public function boolean of_hasparams ();return _bHasParams
end function

on n_cst_threading_task_sqlbase.create
call super::create
end on

on n_cst_threading_task_sqlbase.destroy
call super::destroy
end on

event onprepare;call super::onprepare;DBERRORDATA emptyData

_lastDBError = emptyData

return 0 //continue
end event

