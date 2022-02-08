$PBExportHeader$n_cst_thread_task_sqlbase_ds.sru
$PBExportComments$线程SQL任务对象Datastore~r~n[运行在主线程]
forward
global type n_cst_thread_task_sqlbase_ds from datastore
end type
end forward

global type n_cst_thread_task_sqlbase_ds from datastore
event oninit ( n_cst_thread_task_sqlbase parenttask )
end type
global n_cst_thread_task_sqlbase_ds n_cst_thread_task_sqlbase_ds

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
privatewrite n_cst_thread_task_sqlbase	#ParentTask
privatewrite n_cst_thread					#ParentThread

protected:
long _nMaxRows
boolean _bRowsExceeded

long _nRowsInserted
long _nRowsUpdated
long _nRowsDeleted

private:
n_regexp _re

constant string RE_NCHAR_PAT = "(=|\(|,)(\s+)'"
constant string RE_NCHAR_RPL = "$1$2N'"
end variables
forward prototypes
public function boolean of_isrowsexceeded ()
public function long of_setmaxrows (readonly long maxrows)
public function long of_getinsertedcount ()
public function long of_getupdatedcount ()
public function long of_getdeletedcount ()
public subroutine of_clearstate ()
end prototypes

event oninit(n_cst_thread_task_sqlbase parenttask);#ParentTask = parentTask
#ParentThread = parentTask.#ParentThread
end event

public function boolean of_isrowsexceeded ();return _bRowsExceeded
end function

public function long of_setmaxrows (readonly long maxrows);_nMaxRows = maxRows
return RetCode.OK
end function

public function long of_getinsertedcount ();return _nRowsInserted
end function

public function long of_getupdatedcount ();return _nRowsUpdated
end function

public function long of_getdeletedcount ();return _nRowsDeleted
end function

public subroutine of_clearstate ();_nMaxRows = 0
_bRowsExceeded = false
_nRowsInserted = 0
_nRowsUpdated = 0
_nRowsDeleted = 0
end subroutine

on n_cst_thread_task_sqlbase_ds.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_thread_task_sqlbase_ds.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event dberror;if IsValid(#ParentTask) then
	return #ParentTask.Event OnDBError(sqldbcode,sqlerrtext,sqlsyntax,buffer,row)
end if
end event

event updateend;_nRowsInserted = rowsInserted
_nRowsUpdated = rowsUpdated
_nRowsDeleted = rowsDeleted

end event

event constructor;_re = Create n_regexp
_re.Compile(RE_NCHAR_PAT,true)
end event

event destructor;Destroy _re
end event

event sqlpreview;if sqlType <> PreviewSelect! then
	if #ParentTask.of_IsNCharBinding() then
		SetSqlPreview(_re.Replace(sqlSyntax,RE_NCHAR_RPL))
	end if
end if
return 0
end event

