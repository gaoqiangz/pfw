$PBExportHeader$n_cst_thread_trans.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_thread_trans from transaction
end type
end forward

global type n_cst_thread_trans from transaction
event type long onbeforeconnect ( )
event onafterconnect ( )
event type long onbeforeretrieve ( datastore data )
event onafterretrieve ( datastore data,  long result )
event onbeforedisconnect ( )
event onafterdisconnect ( )
event onafterupdate ( datastore data,  long result )
event type long onbeforeupdate ( datastore data )
event type long onbeforecommand ( string sqlcmd )
event onaftercommand ( string sqlcmd )
event type long onbeforecommit ( )
event onaftercommit ( )
event type long onbeforerollback ( )
event onafterrollback ( )
event onattach ( n_cst_thread_task parenttask )
event onsyntaxfromsql ( readonly string sql,  readonly string presentation,  ref string sqlsyntax,  ref string errinfo )
event type long onsettransdata ( transactiondata data )
event type long ongettransdata ( ref transactiondata data,  ref string errinfo )
event onconnok ( )
end type
global n_cst_thread_trans n_cst_thread_trans

type variables
//* Copyright (c) 2013 - 2017
//* 著作权由金千枝（深圳）软件技术有限公司所有。著作权人保留一切权利。
//* 
//* 这份授权条款，在满足下列条件的前提下，允许使用者再发布经过或未经过
//* 修改的、源代码或二进制形式的本软件：
//* 
//* 1. 源代码的再发布，必须保留原来代码中的版权声明、这几条许可条件细目
//*    和下面的免责声明。
//* 2. 二进制形式的再发布，必须在随同提供的文档和其它媒介中，复制原来的
//*    版权声明、这几条许可条件细目和下面的免责声明。
//* 3. 所有使用到本软件功能的产品及宣传材料，都必须包还含下列之交待文字：
//*        “本产品内含有由金千枝（深圳）软件技术有限公司及其软件贡献者所开发的软件。”
//* 4. 如果没有特殊的事前书面许可，原作者的组织名称，和贡献者名字，都不能
//*    用于支持或宣传从既有软件派生的产品。
//* 
//* 免责声明：此软件由金千枝（深圳）软件技术有限公司和贡献者以“即此”方式提供，无论明示或
//* 暗示的，包括但不限于间接的关于基于某种目的的适销性、实用性，在此皆明示
//* 不予保证。在任何情况下，由于使用此软件造成的，直接、间接、连带、特别、
//* 惩戒或因此而造成的损害（包括但不限于获得替代品及服务，无法使用，丢失数
//* 据，损失盈利或业务中断），无论此类损害是如何造成的，基于何种责任推断，
//* 是否属于合同范畴，严格赔偿责任或民事侵权行为（包括疏忽和其他原因），即
//* 使预先被告知此类损害可能发生，金千枝（深圳）软件技术有限公司和贡献者均不承担任何责任。
//================================================================

public:
//Database type
constant long DBT_MSSQL		= 0
constant long DBT_ORACLE	= 1

public:
privatewrite n_cst_thread_task	#ParentTask
privatewrite n_cst_thread			#ParentThread

private:
ulong _nLastConnOK
end variables

forward prototypes
public function long of_connect ()
public function long of_disconnect ()
private subroutine _of_cleanrollback ()
public function long of_rollback ()
public function boolean of_isconnected ()
public function long of_exec (readonly string sqlcmd)
public function long of_commit (readonly boolean autorollback)
public function long of_retrieve (readonly datastore ds)
public function long of_update (readonly datastore ds)
public function string of_gridsyntaxfromsql (readonly string sql, ref string errinfo)
public function long of_query (readonly string sql, ref datastore ds, ref string errinfo)
public function boolean of_isfailed ()
public function boolean of_issucceeded ()
public function long of_settransdata (readonly transactiondata data)
public function long of_getdbtype ()
public subroutine of_clearstate ()
public function long of_autocommit ()
public function long of_commit ()
public function string of_gridsyntaxfromsql (readonly string sql)
public function long of_query (readonly string sql, ref datastore ds)
public function transactiondata of_gettransdata ()
public function long of_gettransdata (ref transactiondata data, ref string errinfo)
end prototypes

event onattach(n_cst_thread_task parenttask);#ParentTask = parentTask
#ParentThread = parentTask.#ParentThread
end event

event onconnok();_nLastConnOK = CPU()
end event

public function long of_connect ();if DBHandle() <> 0 then
	DISCONNECT USING this;
end if

_nLastConnOK = 0
of_ClearState()

if IsPrevented(Event OnBeforeConnect()) then
	if SQLCode <> 0 then return RetCode.E_DB_ERROR
	return RetCode.CANCELLED
end if

CONNECT USING this;

Event OnAfterConnect()

if SQLCode <> 0 then
	return RetCode.FAILED
end if

Event OnConnOK()

return RetCode.OK
end function

public function long of_disconnect ();if DBHandle() <= 0 then return RetCode.OK

Event OnBeforeDisconnect()
DISCONNECT USING this;
Event OnAfterDisconnect()

_nLastConnOK = 0

if SQLCode <> 0 then
	return RetCode.FAILED
end if

return RetCode.OK
end function

private subroutine _of_cleanrollback ();long nSQLCode,nSQLDBCode,nSQLNRows
string sSQLErrText,sSQLReturnData

nSQLCode = SQLCode
nSQLDBCode = SQLDBCode
nSQLNRows = SQLNRows
sSQLErrText = SQLErrText
sSQLReturnData = SQLReturnData

if IsPrevented(Event OnBeforeRollback()) then return

ROLLBACK USING this;

SQLCode = nSQLCode
SQLDBCode = nSQLDBCode
SQLNRows = nSQLNRows
SQLErrText = sSQLErrText
SQLReturnData = sSQLReturnData

Event OnAfterRollback()
end subroutine

public function long of_rollback ();if AutoCommit then return RetCode.FAILED

_of_CleanRollback()

return RetCode.OK
end function

public function boolean of_isconnected ();boolean bConnected

if _nLastConnOK = 0 then return false
if CPU() - _nLastConnOK < 10000 then return true

if Pos(Upper(DBMS),"ORACLE") > 0 then
	EXECUTE IMMEDIATE "SELECT 1 FROM DUAL" USING this;
else
	EXECUTE IMMEDIATE "SELECT 1" USING this;
end if

bConnected = (SQLNRows > 0)
if bConnected then
	_nLastConnOK = CPU()
else
	_nLastConnOK = 0
end if

return bConnected
end function

public function long of_exec (readonly string sqlcmd);if sqlCmd = "" or IsNull(sqlCmd) then return RetCode.E_INVALID_ARGUMENT

of_ClearState()

if IsPrevented(Event OnBeforeCommand(sqlCmd)) then
	if SQLCode <> 0 then return RetCode.E_DB_ERROR
	return RetCode.CANCELLED
end if

EXECUTE IMMEDIATE :sqlCmd USING this;

Event OnAfterCommand(sqlCmd)

if SQLCode <> 0 and SQLCode <> 100 then
	return RetCode.FAILED
end if

return RetCode.OK
end function

public function long of_commit (readonly boolean autorollback);if AutoCommit then return RetCode.FAILED

if IsPrevented(Event OnBeforeCommit()) then
	if SQLCode <> 0 then
		if autoRollback then
			_of_CleanRollback()
		end if
		return RetCode.E_DB_ERROR
	end if
	return RetCode.CANCELLED
end if

COMMIt USING this;

Event OnAfterCommit()

if SQLCode <> 0 then
	if autoRollback then
		_of_CleanRollback()
	end if
	return RetCode.FAILED
end if

return RetCode.OK
end function

public function long of_retrieve (readonly datastore ds);long rtCode
boolean bAutoCommit

if Not IsValidObject(ds) then return RetCode.E_INVALID_OBJECT
if ds.SetTransObject(this) <> 1 then return RetCode.E_INVALID_TRANSACTION 

of_ClearState()

if IsPrevented(Event OnBeforeRetrieve(ds)) then
	if SQLCode <> 0 then return RetCode.E_DB_ERROR
	return RetCode.CANCELLED
end if

bAutoCommit = AutoCommit
AutoCommit = true

rtCode = ds.Retrieve()

AutoCommit = bAutoCommit

Event OnAfterRetrieve(ds,rtCode)

if SQLCode <> 0 and rtCode >= 0 then
	rtCode = -1
	ds.Reset()
end if

return rtCode
end function

public function long of_update (readonly datastore ds);long rtCode

if Not IsValidObject(ds) then return RetCode.E_INVALID_OBJECT
if ds.SetTransObject(this) <> 1 then return RetCode.E_INVALID_TRANSACTION 

of_ClearState()

if IsPrevented(Event OnBeforeUpdate(ds)) then
	if SQLCode <> 0 then return RetCode.E_DB_ERROR
	return RetCode.CANCELLED
end if

rtCode = ds.Update(true,false)

Event OnAfterUpdate(ds,rtCode)

if SQLCode <> 0 and rtCode = 1 then
	rtCode = -1
end if

return rtCode
end function

public function string of_gridsyntaxfromsql (readonly string sql, ref string errinfo);string sSyntax

Event OnSyntaxFromSQL(sql,"style(type=grid)",ref sSyntax,ref errInfo)
if sSyntax = "" and errInfo = "" then
	sSyntax = SyntaxFromSQL(sql,"style(type=grid)",ref errInfo)
end if

return sSyntax
end function

public function long of_query (readonly string sql, ref datastore ds, ref string errinfo);long rtCode
string sSqlSyntax
boolean bCreated,bSucc

if sql = "" then return RetCode.E_INVALID_SQL

of_ClearState()

if Not IsValidObject(ds) then
	bCreated = true
	ds = Create DataStore
end if

try
	sSqlSyntax = of_GridSyntaxFromSQL(sql,ref errInfo)
	if sSqlSyntax = "" then return RetCode.E_INVALID_SQL
	if ds.Create(sSqlSyntax) <> 1 then return RetCode.E_INVALID_SQL
	rtCode = of_Retrieve(ds)
	bSucc = IsSucceeded(rtCode)
	return rtCode
finally
	if Not bSucc and bCreated then
		Destroy ds
	end if
end try
end function

public function boolean of_isfailed ();return (SQLCode < 0)
end function

public function boolean of_issucceeded ();return (SQLCode >= 0)
end function

public function long of_settransdata (readonly transactiondata data);if Event OnSetTransData(data) = 1 then return RetCode.OK

DBMS = data.DBMS
ServerName = data.ServerName
Database = data.Database
LogID = data.LogID
LogPass = data.LogPass
DBParm = data.DBParm
Lock = data.Lock

return RetCode.OK
end function

public function long of_getdbtype ();if Pos(Upper(DBMS),"ORACLE") > 0 then
	return DBT_ORACLE
else
	return DBT_MSSQL
end if
end function

public subroutine of_clearstate ();SQLCode = 0
SQLDBCode = 0
SQLNRows = 0
SQLErrText = ""
SQLReturnData = ""
end subroutine

public function long of_autocommit ();if SQLCode <> 0 then
	if Not AutoCommit then
		_of_CleanRollback()
	end if
	return RetCode.FAILED
end if
if Not AutoCommit then
	return of_Commit(true)
end if

return RetCode.OK
end function

public function long of_commit ();return of_Commit(true)
end function

public function string of_gridsyntaxfromsql (readonly string sql);string errInfo
return of_GridSyntaxFromSQL(sql,ref errInfo)
end function

public function long of_query (readonly string sql, ref datastore ds);string errInfo
return of_Query(sql,ref ds,ref errInfo)
end function

public function transactiondata of_gettransdata ();string sErrInfo
TRANSACTIONDATA data

of_GetTransData(ref data,ref sErrInfo)

return data
end function

public function long of_gettransdata (ref transactiondata data, ref string errinfo);errInfo = ""

if Event OnGetTransData(ref data,ref errInfo) = 1 then
	if errInfo <> "" then return RetCode.FAILED
	return RetCode.OK
end if
if errInfo <> "" then return RetCode.FAILED

data.DBMS = DBMS
data.ServerName = ServerName
data.Database = Database
data.LogID = LogID
data.LogPass = LogPass
data.DBParm = DBParm
data.Lock = Lock

return RetCode.OK
end function

on n_cst_thread_trans.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_thread_trans.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

