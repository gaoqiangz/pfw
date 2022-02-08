$PBExportHeader$n_sqlite.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_sqlite from nonvisualobject
end type
end forward

global type n_sqlite from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function long SetCancelEvent(readonly ulong hevent)
public function long GetTimeout()
public function long SetTimeout(readonly long sec)
public function boolean IsAutoCommit()
public function long SetAutoCommit(readonly boolean enabled)
public function boolean IsOpened()
public function long Open(readonly string uri)
public function long Open(readonly string uri,readonly string password)
public function long Close()
public function long LoadExtension(readonly string filepath)
public function long LoadExtension(readonly string filepath,readonly string entrypoint)
public function long AutoCommit() /*[SQLCode=0]时[COMMIT],否则[ROLLBACK],[COMMIT]失败时也自动[ROLLBACK]*/
public function long Commit()
public function long Commit(readonly boolean autorollback /*[COMMIT]失败时自动[ROLLBACK],默认为true*/)
public function long Rollback()
public function long SQLNRows()
public function long SQLCode()
public function long SQLDBCode()
public function string SQLErrText()
public function boolean IsTableExists(readonly string table)
public function boolean IsTableExists(readonly string db, readonly string table)
public function long Exec(readonly string cmd)
public function long Exec(readonly string cmd, any arg1)
public function long Exec(readonly string cmd, any arg1, any arg2)
public function long Exec(readonly string cmd, any arg1, any arg2, any arg3)
public function long Exec(readonly string cmd, any arg1, any arg2, any arg3, any arg4)
public function long Exec(readonly string cmd, any arg1, any arg2, any arg3, any arg4, any arg5)
public function long Exec(readonly string cmd, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6)
public function long Exec(readonly string cmd, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7)
public function long Exec(readonly string cmd, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8)
public function long Exec(readonly string cmd, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8, any arg9)
public function long Exec(readonly string cmd, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8, any arg9, any arg10)
public function long Exec(readonly string cmd, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8, any arg9, any arg10, any arg11,...)
public function long Query(ref n_sqliterecordset rs, readonly string sql)
public function long Query(ref n_sqliterecordset rs, readonly string sql, any arg1)
public function long Query(ref n_sqliterecordset rs, readonly string sql, any arg1, any arg2)
public function long Query(ref n_sqliterecordset rs, readonly string sql, any arg1, any arg2, any arg3)
public function long Query(ref n_sqliterecordset rs, readonly string sql, any arg1, any arg2, any arg3, any arg4)
public function long Query(ref n_sqliterecordset rs, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5)
public function long Query(ref n_sqliterecordset rs, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6)
public function long Query(ref n_sqliterecordset rs, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7)
public function long Query(ref n_sqliterecordset rs, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8)
public function long Query(ref n_sqliterecordset rs, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8, any arg9)
public function long Query(ref n_sqliterecordset rs, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8, any arg9, any arg10)
public function long Query(ref n_sqliterecordset rs, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8, any arg9, any arg10, any arg11,...)
public function long Query(readonly datastore ds /*使用DataStore自己的sql*/)
public function long Query(ref datastore ds, readonly string sql /*为空时使用DataStore自己的sql*/)
public function long Query(ref datastore ds, readonly string sql, any arg1)
public function long Query(ref datastore ds, readonly string sql, any arg1, any arg2)
public function long Query(ref datastore ds, readonly string sql, any arg1, any arg2, any arg3)
public function long Query(ref datastore ds, readonly string sql, any arg1, any arg2, any arg3, any arg4)
public function long Query(ref datastore ds, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5)
public function long Query(ref datastore ds, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6)
public function long Query(ref datastore ds, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7)
public function long Query(ref datastore ds, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8)
public function long Query(ref datastore ds, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8, any arg9)
public function long Query(ref datastore ds, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8, any arg9, any arg10)
public function long Query(ref datastore ds, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8, any arg9, any arg10, any arg11,...)
public function long Query(readonly datawindow dw /*使用DataWindow自己的sql*/)
public function long Query(readonly datawindow dw, readonly string sql /*为空时使用DataWindow自己的sql*/)
public function long Query(readonly datawindow dw, readonly string sql, any arg1)
public function long Query(readonly datawindow dw, readonly string sql, any arg1, any arg2)
public function long Query(readonly datawindow dw, readonly string sql, any arg1, any arg2, any arg3)
public function long Query(readonly datawindow dw, readonly string sql, any arg1, any arg2, any arg3, any arg4)
public function long Query(readonly datawindow dw, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5)
public function long Query(readonly datawindow dw, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6)
public function long Query(readonly datawindow dw, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7)
public function long Query(readonly datawindow dw, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8)
public function long Query(readonly datawindow dw, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8, any arg9)
public function long Query(readonly datawindow dw, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8, any arg9, any arg10)
public function long Query(readonly datawindow dw, readonly string sql, any arg1, any arg2, any arg3, any arg4, any arg5, any arg6, any arg7, any arg8, any arg9, any arg10, any arg11,...)
public function long Update(readonly datastore ds)
public function long Update(readonly datastore ds, readonly boolean accept)
public function long Update(readonly datastore ds, readonly boolean accept,readonly boolean resetflag)
public function long Update(readonly datawindow dw)
public function long Update(readonly datawindow dw, readonly boolean accept)
public function long Update(readonly datawindow dw, readonly boolean accept,readonly boolean resetflag)
end type
global n_sqlite n_sqlite

on n_sqlite.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_sqlite.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

