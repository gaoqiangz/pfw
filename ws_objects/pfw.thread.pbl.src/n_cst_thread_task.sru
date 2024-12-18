$PBExportHeader$n_cst_thread_task.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_thread_task from nonvisualobject
end type
type nameddata from structure within n_cst_thread_task
end type
end forward

type nameddata from structure
	string		name
	any		data
end type

global type n_cst_thread_task from nonvisualobject
event type long onstart ( )
event onstop ( long exitcode )
event oninit ( n_cst_threading_task parenttasking,  n_cst_threading_eventful eventful,  unsignedlong hevtcancelled,  long group )
event type long ondotask ( )
event type long onerror ( long errcode,  string errinfo )
event type long onnotify ( long wparam,  long lparam,  string sparam )
event onpostnotify ( long wparam,  long lparam,  string sparam )
event oninitthread ( n_cst_thread parentthread,  unsignedlong id )
event type long onprepare ( )
event onfinalize ( )
event type long onthreadstart ( )
event onthreadstop ( long exitcode )
event onuninit ( )
end type
global n_cst_thread_task n_cst_thread_task

type prototypes
Protected:
Function ulong CreateEvent(ulong lpEventAttributes,boolean bManualReset,boolean bInitialState,ulong lpName) Library "kernel32.dll" Alias for "CreateEventW"
Function boolean SetEvent(ulong hEvent) Library "kernel32.dll"
Function boolean ResetEvent(ulong hEvent) Library "kernel32.dll"
Function ulong WaitForSingleObject(ulong hHandle,ulong dwMilliseconds) Library "kernel32.dll"
Function boolean CloseHandle(ulong hObject) Library "kernel32.dll"
end prototypes

type variables
//================================================================
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

/*--- Constants ---*/
Public:
//Execute group
constant long GROUP_NORMAL		= 0
constant long GROUP_PREPARE	= -1
constant long GROUP_POST		= 1

/*--- Properties---*/
Public:
PrivateWrite 	n_cst_threading_task 	#ParentTasking
PrivateWrite 	n_cst_thread		 	#ParentThread
PrivateWrite 	Long	 					#Group 			= GROUP_NORMAL
PrivateWrite 	Boolean 					#Running 			= false

/*--- Implementation ---*/
Private:
Ulong _id
Ulong _hEvtCancelled
n_cst_threading_eventful _eventful

Boolean _bSkip

Long		_lastErrCode
String	_lastErrInfo

double _fDelayFor //sec

NAMEDDATA _datas[]
end variables

forward prototypes
public function boolean of_iscancelled ()
public function unsignedlong of_getcancelevent ()
public function long of_execute ()
public function long of_cancel ()
public function boolean of_wait (readonly double timeout)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8, readonly any param9, readonly any param10)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8, readonly any param9)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2)
public function any of_trigger (readonly string name, readonly any param1)
public function any of_trigger (readonly string name)
public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8, readonly any param9, readonly any param10)
public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8, readonly any param9)
public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8)
public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7)
public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6)
public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5)
public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4)
public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3)
public subroutine of_post (readonly string name, readonly any param1, readonly any param2)
public subroutine of_post (readonly string name, readonly any param1)
public subroutine of_post (readonly string name)
public function integer of_getindex ()
public function ulong of_getid ()
public function integer of_msgbox (readonly string title, readonly string text, readonly string detail, readonly icon ico, readonly button btn, readonly integer defbtn)
public function int of_msgbox (readonly string title, readonly string text, readonly string detail, readonly icon ico, readonly button btn)
public function int of_msgbox (readonly string title, readonly string text, readonly string detail, readonly icon ico)
public function int of_msgbox (readonly string title, readonly string text, readonly string detail)
public function int of_msgbox (readonly string title, readonly string text, readonly icon ico, readonly button btn, readonly integer defbtn)
public function int of_msgbox (readonly string title, readonly string text, readonly icon ico, readonly button btn)
public function int of_msgbox (readonly string title, readonly string text, readonly icon ico)
public function int of_msgbox (readonly string title, readonly string text)
public function long of_removedatas ()
public function long of_setdata (readonly string name, readonly any data)
public function long of_removedata (readonly string name)
public function boolean of_hasdata (string name)
public function long of_getdata (readonly string name, ref any val)
public function boolean of_getdataboolean (readonly string name)
public function double of_getdatadouble (readonly string name)
public function long of_getdatalong (readonly string name)
public function string of_getdatastring (readonly string name)
public function long of_getdata (readonly string name, ref string val)
public function long of_getdata (readonly string name, ref boolean val)
public function long of_getdata (readonly string name, ref double val)
public function long of_getdata (readonly string name, ref long val)
public function string of_getdatastring (readonly string name, readonly string default)
public function long of_getdatalong (readonly string name, readonly long default)
public function double of_getdatadouble (readonly string name, readonly double default)
public function boolean of_getdataboolean (readonly string name, readonly boolean default)
public function any of_getdataany (readonly string name, readonly any default)
public function any of_getdataany (readonly string name)
public function any of_getdata (readonly string name)
public function long of_setdelayfor (readonly double seconds)
public function long of_getlasterrorcode ()
public function string of_getlasterrorinfo ()
public function long of_clearerror ()
public function long of_setskip (readonly boolean skip)
end prototypes

event type long onstart();if of_IsCancelled() then return RetCode.PREVENT

#Running = true
if IsPrevented(#ParentTasking.Event OnStart()) then
	#Running = false
end if
if Not #Running or of_IsCancelled() then return RetCode.PREVENT

return RetCode.ALLOW
end event

event onstop(long exitcode);n_cst_threading_task tasking

tasking = #ParentTasking

#Running = false
tasking.Event OnStop(exitCode)
end event

event oninit(n_cst_threading_task parenttasking, n_cst_threading_eventful eventful, unsignedlong hevtcancelled, long group);#ParentTasking = ParentTasking
_eventful = eventful
_hEvtCancelled = hEvtCancelled
#Group = group
end event

event type long onerror(long errcode, string errinfo);long rtCode

_lastErrCode = errCode
_lastErrInfo = errInfo

SetNull(rtCode)

if Not of_IsCancelled() then
	rtCode = #ParentTasking.Event OnError(errCode,errInfo)
end if

return rtCode
end event

event type long onnotify(long wparam, long lparam, string sparam);long rtCode

SetNull(rtCode)

if Not of_IsCancelled() then
	rtCode = #ParentTasking.Event OnNotify(wparam,lparam,sparam)
end if

return rtCode
end event

event onpostnotify(long wparam, long lparam, string sparam);if Not of_IsCancelled() then
	#ParentTasking.Post Event OnPostNotify(wparam,lparam,sparam)
end if
end event

event oninitthread(n_cst_thread parentthread, unsignedlong id);#ParentThread = ParentThread
_id = id
end event

event onuninit();int nIndex,nCount
NAMEDDATA emptyDatas[]

SetNull(#ParentTasking)
SetNull(#ParentThread)
SetNull(_eventful)

nCount = UpperBound(_datas)
for nIndex = 1 to nCount
	SetNull(_datas[nIndex].data)
next
_datas = emptyDatas
end event

public function boolean of_iscancelled ();return (WaitForSingleObject(_hEvtCancelled,0) = 0) //WAIT_OBJECT_0
end function

public function unsignedlong of_getcancelevent ();return _hEvtCancelled
end function

public function long of_execute ();long nExitCode

if #Running then return RetCode.E_BUSY
if _bSkip then return RetCode.OK

of_ClearError()

if IsPrevented(Event OnStart()) then
	nExitCode = RetCode.CANCELLED
else
	try
		nExitCode = Event OnPrepare()
		if IsNull(nExitCode) or nExitCode = RetCode.OK then
			if _fDelayFor > 0 then
				of_Wait(_fDelayFor)
			end if
			if of_IsCancelled() then
				nExitCode = RetCode.CANCELLED
			else
				if Not _bSkip then
					nExitCode = Event OnDoTask()
				else
					nExitCode = RetCode.OK
				end if
			end if
		end if
	catch(Throwable ex)
		nExitCode = RetCode.E_INTERNAL_ERROR
		Event OnError(nExitCode,ex.GetMessage())
		//MessageBoxEx("Thread Task Exception", ClassName(this) + "~n" + ex.GetMessage())
	finally
		Event OnFinalize()
	end try
end if

Event OnStop(nExitCode)

return nExitCode
end function

public function long of_cancel ();SetEvent(_hEvtCancelled)
return RetCode.OK
end function

public function boolean of_wait (readonly double timeout);#ParentThread.of_AutoGC()
return (WaitForSingleObject(_hEvtCancelled,timeout * 1000) = 258) //WAIT_TIMEOUT
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8, readonly any param9, readonly any param10);return _eventful.of_Trigger(name,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8, readonly any param9);return _eventful.of_Trigger(name,param1,param2,param3,param4,param5,param6,param7,param8,param9)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8);return _eventful.of_Trigger(name,param1,param2,param3,param4,param5,param6,param7,param8)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7);return _eventful.of_Trigger(name,param1,param2,param3,param4,param5,param6,param7)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6);return _eventful.of_Trigger(name,param1,param2,param3,param4,param5,param6)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5);return _eventful.of_Trigger(name,param1,param2,param3,param4,param5)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4);return _eventful.of_Trigger(name,param1,param2,param3,param4)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3);return _eventful.of_Trigger(name,param1,param2,param3)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2);return _eventful.of_Trigger(name,param1,param2)
end function

public function any of_trigger (readonly string name, readonly any param1);return _eventful.of_Trigger(name,param1)
end function

public function any of_trigger (readonly string name);return _eventful.of_Trigger(name)
end function

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8, readonly any param9, readonly any param10);if of_IsCancelled() then return
_eventful.Post of_Post(name,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8, readonly any param9);if of_IsCancelled() then return
_eventful.Post of_Post(name,param1,param2,param3,param4,param5,param6,param7,param8,param9)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8);if of_IsCancelled() then return
_eventful.Post of_Post(name,param1,param2,param3,param4,param5,param6,param7,param8)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7);if of_IsCancelled() then return
_eventful.Post of_Post(name,param1,param2,param3,param4,param5,param6,param7)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6);if of_IsCancelled() then return
_eventful.Post of_Post(name,param1,param2,param3,param4,param5,param6)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5);if of_IsCancelled() then return
_eventful.Post of_Post(name,param1,param2,param3,param4,param5)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4);if of_IsCancelled() then return
_eventful.Post of_Post(name,param1,param2,param3,param4)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3);if of_IsCancelled() then return
_eventful.Post of_Post(name,param1,param2,param3)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2);if of_IsCancelled() then return
_eventful.Post of_Post(name,param1,param2)
end subroutine

public subroutine of_post (readonly string name, readonly any param1);if of_IsCancelled() then return
_eventful.Post of_Post(name,param1)
end subroutine

public subroutine of_post (readonly string name);if of_IsCancelled() then return
_eventful.Post of_Post(name)
end subroutine

public function integer of_getindex ();return #ParentThread.of_GetIndex(this)
end function

public function ulong of_getid ();return _id
end function

public function integer of_msgbox (readonly string title, readonly string text, readonly string detail, readonly icon ico, readonly button btn, readonly integer defbtn);return #ParentThread.#ParentThreading.of_MsgBox(title,text,detail,ico,btn,defBtn)
end function

public function int of_msgbox (readonly string title, readonly string text, readonly string detail, readonly icon ico, readonly button btn);return of_MsgBox(title,text,detail,ico,btn,1)
end function

public function int of_msgbox (readonly string title, readonly string text, readonly string detail, readonly icon ico);return of_MsgBox(title,text,detail,ico,OK!,1)
end function

public function int of_msgbox (readonly string title, readonly string text, readonly string detail);return of_MsgBox(title,text,detail,Information!,OK!,1)
end function

public function int of_msgbox (readonly string title, readonly string text, readonly icon ico, readonly button btn, readonly integer defbtn);return of_MsgBox(title,text,"",ico,btn,defBtn)
end function

public function int of_msgbox (readonly string title, readonly string text, readonly icon ico, readonly button btn);return of_MsgBox(title,text,"",ico,btn,1)
end function

public function int of_msgbox (readonly string title, readonly string text, readonly icon ico);return of_MsgBox(title,text,"",ico,OK!,1)
end function

public function int of_msgbox (readonly string title, readonly string text);return of_MsgBox(title,text,"",Information!,OK!,1)
end function

public function long of_removedatas ();int nIndex,nCount
NAMEDDATA newDatas[]

nCount = UpperBound(_datas)
for nIndex = 1 to nCount
	if Left(_datas[nIndex].name,1) = "$" then
		newDatas[UpperBound(newDatas) + 1] = _datas[nIndex]
	else
		SetNull(_datas[nIndex].data)
	end if
next

_datas = newDatas

return RetCode.OK
end function

public function long of_setdata (readonly string name, readonly any data);int nIndex,nCount

if name = "" then return RetCode.E_INVALID_ARGUMENT

nCount = UpperBound(_datas)
for nIndex = 1 to nCount
	if _datas[nIndex].name = name then
		_datas[nIndex].data = data
		return RetCode.OK
	end if
next

nCount ++
_datas[nCount].name = name
_datas[nCount].data = data

return RetCode.OK
end function

public function long of_removedata (readonly string name);int nIndex,nCount
NAMEDDATA newDatas[]

nCount = UpperBound(_datas)
for nIndex = 1 to nCount
	if _datas[nIndex].name <> name then
		newDatas[UpperBound(newDatas) + 1] = _datas[nIndex]
	else
		SetNull(_datas[nIndex].data)
	end if
next

_datas = newDatas

return RetCode.OK
end function

public function boolean of_hasdata (string name);int nIndex,nCount

nCount = UpperBound(_datas)
for nIndex = 1 to nCount
	if _datas[nIndex].name = name then return true
next

return false
end function

public function long of_getdata (readonly string name, ref any val);int nIndex,nCount

nCount = UpperBound(_datas)
for nIndex = 1 to nCount
	if _datas[nIndex].name = name then
		val = _datas[nIndex].data
		return RetCode.OK
	end if
next

return RetCode.E_DATA_NOT_FOUND
end function

public function boolean of_getdataboolean (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return false

return aVal
end function

public function double of_getdatadouble (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return 0

return aVal
end function

public function long of_getdatalong (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return 0

return aVal
end function

public function string of_getdatastring (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return ""

return aVal
end function

public function long of_getdata (readonly string name, ref string val);any aVal
long rtCode

rtCode = of_GetData(name,ref aVal)
if rtCode <> RetCode.OK then return rtCode

val = aVal

return RetCode.OK
end function

public function long of_getdata (readonly string name, ref boolean val);any aVal
long rtCode

rtCode = of_GetData(name,ref aVal)
if rtCode <> RetCode.OK then return rtCode

val = aVal

return RetCode.OK
end function

public function long of_getdata (readonly string name, ref double val);any aVal
long rtCode

rtCode = of_GetData(name,ref aVal)
if rtCode <> RetCode.OK then return rtCode

val = aVal

return RetCode.OK
end function

public function long of_getdata (readonly string name, ref long val);any aVal
long rtCode

rtCode = of_GetData(name,ref aVal)
if rtCode <> RetCode.OK then return rtCode

val = aVal

return RetCode.OK
end function

public function string of_getdatastring (readonly string name, readonly string default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function long of_getdatalong (readonly string name, readonly long default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function double of_getdatadouble (readonly string name, readonly double default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function boolean of_getdataboolean (readonly string name, readonly boolean default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function any of_getdataany (readonly string name, readonly any default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function any of_getdataany (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return aVal

return aVal
end function

public function any of_getdata (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return aVal

return aVal
end function

public function long of_setdelayfor (readonly double seconds);_fDelayFor = seconds
return RetCode.OK
end function

public function long of_getlasterrorcode ();return _lastErrCode
end function

public function string of_getlasterrorinfo ();return _lastErrInfo
end function

public function long of_clearerror ();_lastErrCode = 0
_lastErrInfo = ""

return RetCode.OK
end function

public function long of_setskip (readonly boolean skip);_bSkip = skip
return RetCode.OK
end function

on n_cst_thread_task.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_thread_task.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

