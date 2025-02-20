$PBExportHeader$n_cst_threading.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_threading from nonvisualobject
end type
type nameddata from structure within n_cst_threading
end type
end forward

type nameddata from structure
	string		name
	any		data
end type

global type n_cst_threading from nonvisualobject
event oninit ( n_cst_threading_pool parentthreadingpool )
event type string ongetthreadclsname ( )
event type long onerror ( long errcode,  string errinfo )
event onstop ( long exitcode )
event type long onstart ( )
event type long onprepare ( )
event onfinalize ( )
event onpoststop ( long exitcode )
event ontaskcreated ( n_cst_threading_task tasking )
event type long ontaskdestroy ( n_cst_threading_task tasking )
event type integer onmsgbox ( string title,  string text,  string detail,  icon ico,  button btn,  integer defbtn )
event onthreaddestroying ( )
event onthreaddestroyed ( )
event onthreadcreating ( )
event onthreadcreated ( n_cst_thread thread )
event onthreadexited ( )
event type long onthreadcreate ( string clsname,  ref n_cst_thread thread,  ref string instancename )
end type
global n_cst_threading n_cst_threading

type prototypes
Private:
Function ulong OpenThread(ulong dwDesiredAccess,boolean bInheritHandle,ulong dwThreadId) Library "kernel32.dll"
Function ulong SetThreadAffinityMask(ulong hThread,ulong dwThreadAffinityMask) Library "Kernel32.dll"
Function boolean SetThreadPriority(ulong hThread,long nPriority) Library "Kernel32.dll"
Function long SuspendThread(ulong hThread) Library "kernel32.dll"
Function long ResumeThread(ulong hThread) Library "kernel32.dll"
Function ulong CreateEvent(ulong lpEventAttributes,boolean bManualReset,boolean bInitialState,ulong lpName) Library "kernel32.dll" Alias for "CreateEventW"
Function boolean SetEvent(ulong hEvent) Library "kernel32.dll"
Function ulong WaitForSingleObject(ulong hHandle,ulong dwMilliseconds) Library "kernel32.dll"
Function boolean CloseHandle(ulong hObject) Library "kernel32.dll"
Function ulong SleepMs(ulong dwMilliseconds) Library "kernel32.dll" Alias for "Sleep"
Function ulong GetCurrentThreadId() Library "kernel32.dll"
Function boolean ThreadGenID(ref string lpszID,long dwSize) Library "pfw.dll" Alias for "pfwThreadGenID"
Function boolean ThreadProcessMessage() Library "pfw.dll" Alias for "pfwThreadProcessMessage"
Function boolean ThreadWait(ulong hThread,ulong dwID) Library "pfw.dll" Alias for "pfwThreadWait"
Public:
Function boolean ResetEvent(ulong hEvent) Library "kernel32.dll"
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
//Threading events (of_On/of_Off)
Constant String EVT_COMMONNOTIFY	= "common-notify"	//arguments
																	//  n_cst_threading source
																	//  long reason
																	//  long wparam
																	//  long lparam
																	//  string sparam
																	//return
																	//  long
																	
Constant String EVT_START			= "start"			//arguments
																	//  n_cst_threading source
																	//return
																	//  long (0:continue,1:prevent)
																	
Constant String EVT_STOP			= "stop"				//arguments
																	//  n_cst_threading source
																	//  long exitCode
																	//  string lastErrorInfo
																	//return
																	//  none
																	
Constant String EVT_ERROR			= "error"			//arguments
																	//  n_cst_threading source
																	//  long errorCode
																	//  string errorInfo
																	//return
																	//  long
																	
Constant String EVT_TASKCREATED	= "task-created"	//arguments
																	//  n_cst_threading source
																	//  n_cst_threading_task tasking
																	//return
																	//  none
																	
Constant String EVT_TASKDESTROY	= "task-destroy"	//arguments
																	//  n_cst_threading source
																	//  n_cst_threading_task tasking
																	//return
																	//  long (0:continue,1:prevent)

/*--- Properties ---*/
Public:
PrivateWrite n_cst_threading_pool #ParentThreadingPool
PrivateWrite Boolean 					#Running 					= false
PrivateWrite Boolean 					#AutoRelease				= false
PrivateWrite Boolean 					#IgnoreTaskError			= false
PrivateWrite Boolean 					#IgnoreTaskCancel			= true
String										#Tag
Any										#Data

/*--- Implementation ---*/
Protected:
PrivateWrite n_cst_thread _Thread

Private:
n_cst_threading_task	Tasks[]
n_cst_threading_eventful _eventful

NAMEDDATA _datas[]

String 	_sid
Ulong 	_handle
Ulong		_id
Ulong 	_hEvtCancelled
Ulong 	_hEvtSync
Long		_lastExitCode
Long		_lastErrCode
String	_lastErrInfo
Long		_nExitCode
end variables

forward prototypes
public function long of_getlastexitcode ()
public function long of_getlasterrorcode ()
public function boolean of_isbusy ()
public function string of_getlasterrorinfo ()
public function long of_wait ()
public function boolean of_iscancelled ()
public function long of_wait (readonly boolean yield, readonly double timeout)
public function long of_wait (readonly boolean yield)
public function unsignedlong of_getcancelevent ()
private function long _of_sendnotify (readonly long reason, readonly long wparam, readonly long lparam, readonly string sparam)
public function integer of_getcount ()
public function long of_removeall ()
public function long of_remove (readonly integer index)
public function long of_run ()
public function long of_setpriority (readonly long priority)
public function long of_setaffinitymask (readonly unsignedlong mask)
public function long of_setaffinity (readonly unsignedinteger cpuindex)
private function string _of_getthreadclsname ()
public function long of_setautorelease (readonly boolean auto)
public function long of_setignoretaskerror (readonly boolean ignore)
public function long of_suspend ()
public function long of_resume ()
public function ulong of_gethandle ()
public function string of_getsid ()
public function ulong of_getid ()
public function long of_on (readonly string name, readonly powerobject object, readonly string evtname)
public function long of_off (readonly string name, readonly powerobject object, readonly string evtname)
public function long of_off (readonly powerobject object, readonly string evtname)
public function long of_off (readonly powerobject object)
public function long of_off ()
public function long of_gettask (readonly integer index, ref n_cst_threading_task tasking)
public function integer of_getindex (readonly n_cst_threading_task tasking)
public function long of_findtaskbytag (readonly string tag, ref n_cst_threading_task foundtasking)
public function long of_off (readonly string name)
public function long of_off (readonly string name, readonly powerobject object)
public function long of_gettaskbyid (readonly unsignedlong id, ref n_cst_threading_task tasking)
public function long of_removedata (readonly string name)
public function long of_setdata (readonly string name, readonly any data)
public function long of_removedatas ()
public function boolean of_hasdata (readonly string name)
public function string of_getdatastring (readonly string name)
public function long of_getdatalong (readonly string name)
public function long of_getdata (readonly string name, ref any val)
public function boolean of_getdataboolean (readonly string name)
public function double of_getdatadouble (readonly string name)
public function long of_getdata (readonly string name, ref boolean val)
public function long of_getdata (readonly string name, ref double val)
public function long of_getdata (readonly string name, ref long val)
public function long of_getdata (readonly string name, ref string val)
public function string of_getdatastring (readonly string name, readonly string default)
public function double of_getdatadouble (readonly string name, readonly double default)
public function boolean of_getdataboolean (readonly string name, readonly boolean default)
public function long of_getdatalong (readonly string name, readonly long default)
public function any of_getdata (readonly string name)
public function any of_getdataany (readonly string name)
public function any of_getdataany (readonly string name, readonly any default)
public function integer of_msgbox (readonly string title, readonly string text, readonly string detail, readonly icon ico, readonly button btn, readonly integer defbtn)
public function integer of_inserttask (readonly integer index, ref n_cst_threading_task newtasking, readonly string taskingclsname)
public function integer of_addtask (ref n_cst_threading_task newtasking, readonly string taskingclsname)
public function long of_remove (readonly n_cst_threading_task tasking)
public function long of_preventevent ()
public function long of_setignoretaskcancel (readonly boolean ignore)
public function long of_stop (readonly long exitcode)
public function long of_stop ()
public function long of_terminate (readonly long exitcode)
public function long of_terminate ()
public function long of_preventevent (readonly boolean deep)
public function integer of_inserttask (integer index, ref n_cst_threading_task newtasking, readonly string taskingclsname, readonly string taskclsname, readonly long group)
public function integer of_inserttask (readonly integer index, ref n_cst_threading_task newtasking, readonly string taskingclsname, readonly long group)
public function integer of_addtask (ref n_cst_threading_task newtasking, readonly string taskingclsname, readonly string taskclsname, readonly long group)
public function integer of_addtask (ref n_cst_threading_task newtasking, readonly string taskingclsname, readonly string taskclsname)
public function integer of_inserttask (readonly integer index, ref n_cst_threading_task newtasking, readonly string taskingclsname, readonly string taskclsname)
public function integer of_addtask (ref n_cst_threading_task newtasking, readonly string taskingclsname, readonly long group)
end prototypes

event oninit(n_cst_threading_pool parentthreadingpool);#ParentThreadingPool = ParentThreadingPool
end event

event type long onerror(long errcode, string errinfo);long rtCode

SetNull(rtCode)
if of_IsCancelled() then return rtCode

_lastErrCode = errCode
_lastErrInfo = errInfo

return _of_SendNotify(Enums.TNR_ERROR,errCode,0,errInfo)
end event

event onstop(long exitcode);if of_IsCancelled() then
	exitCode = RetCode.CANCELLED
end if

if Not IsNull(_nExitCode) then
	if exitCode = RetCode.CANCELLED then
		exitCode = _nExitCode
	end if
	SetNull(_nExitCode)
end if

_lastExitCode = exitCode

Event OnFinalize()
Post Event OnPostStop(exitCode)

end event

event type long onstart();_lastErrCode = RetCode.OK
_lastExitCode = RetCode.OK
_lastErrInfo = ""
SetNull(_nExitCode)

if of_IsCancelled() then return RetCode.PREVENT

#Running = true
SetEvent(_hEvtSync)

if IsPrevented(Event OnPrepare()) then
	#Running = false
elseif IsPrevented(_of_SendNotify(Enums.TNR_START,0,0,"")) then
	#Running = false
end if

ResetEvent(_hEvtSync)

if Not #Running then return RetCode.PREVENT

return RetCode.ALLOW
end event

event onpoststop(long exitcode);#Running = false

_of_SendNotify(Enums.TNR_STOP,exitCode,0,_lastErrInfo)

if IsValid(this) then
	if #AutoRelease and Not #Running then
		n_cst_threading thisThreading
		thisThreading = this
		if IsValidObject(#ParentThreadingPool) then
			#ParentThreadingPool.of_Release(ref thisThreading)
		else
			Destroy thisThreading
		end if
	end if
end if
end event

public function long of_getlastexitcode ();return _lastExitCode
end function

public function long of_getlasterrorcode ();return _lastErrCode
end function

public function boolean of_isbusy ();if Not #Running then return false
return (WaitForSingleObject(_hEvtSync,0) <> 0)
end function

public function string of_getlasterrorinfo ();return _lastErrInfo
end function

public function long of_wait ();return of_Wait(false,0)
end function

public function boolean of_iscancelled ();if _lastExitCode = RetCode.CANCELLED then return true
return (WaitForSingleObject(_hEvtCancelled,0) = 0) //WAIT_OBJECT_0
end function

public function long of_wait (readonly boolean yield, readonly double timeout);ulong startCPU

if Not #Running then return RetCode.OK
//if timeout <= 0 and WaitForSingleObject(_hEvtSync,0) = 0 then return RetCode.E_TIME_OUT

startCPU = CPU()

do while IsValid(this)
	if Not #Running then exit
	if timeout > 0 then
		if (CPU() - startCPU) >= (timeout * 1000) then
			return RetCode.E_TIME_OUT
		end if
	end if
	if yield then
		if Not Yield() then
			SleepMs(15)
		end if
	else
		if Not ThreadProcessMessage() then
			SleepMs(15)
		end if
	end if
loop

return RetCode.OK
end function

public function long of_wait (readonly boolean yield);return of_Wait(yield,0)
end function

public function unsignedlong of_getcancelevent ();return _hEvtCancelled
end function

private function long _of_sendnotify (readonly long reason, readonly long wparam, readonly long lparam, readonly string sparam);long rtCode,nVal
boolean bSilent

bSilent = _Eventful.#Silent
_Eventful.#Silent = true

if _Eventful.of_IsSubscribed(EVT_COMMONNOTIFY) then
	rtCode = _Eventful.of_Trigger(EVT_COMMONNOTIFY,reason,wparam,lparam,sparam)
end if

if (rtCode = 0 or IsNull(rtCode)) and IsValid(this) then
	SetNull(nVal)
	choose case reason
		case Enums.TNR_START
			if Not of_IsCancelled() then
				nVal = _Eventful.of_Trigger(EVT_START)
			end if
		case Enums.TNR_STOP
			if of_IsCancelled() then
				nVal = _Eventful.of_Trigger(EVT_STOP,RetCode.CANCELLED,sparam)
			else
				nVal = _Eventful.of_Trigger(EVT_STOP,wparam,sparam)
			end if
		case Enums.TNR_ERROR
			if Not of_IsCancelled() then
				nVal = _Eventful.of_Trigger(EVT_ERROR,wparam,sparam)
			end if
	end choose
	if Not IsNull(nVal) then
		rtCode = nVal
	end if
end if

if IsValid(this) then
	_Eventful.#Silent = bSilent
end if

return rtCode
end function

public function integer of_getcount ();return UpperBound(Tasks)
end function

public function long of_removeall ();int nIndex,nCount
long rtCode
n_cst_threading_task emptyTasks[]

//if #Running then return RetCode.E_BUSY
if of_IsBusy() then return RetCode.E_BUSY

nCount = UpperBound(Tasks)
if nCount = 0 then return RetCode.OK

for nIndex = 1 to nCount
	if Tasks[nIndex].#Running then return RetCode.E_BUSY
next

for nIndex = 1 to nCount
	if IsPrevented(Event OnTaskDestroy(Tasks[nIndex])) then return RetCode.FAILED
next

rtCode = _Thread.of_RemoveAll()
if IsFailed(rtCode) then return rtCode

for nIndex = 1 to nCount
	Tasks[nIndex].Event OnUninit()
	Destroy Tasks[nIndex]
next

Tasks = emptyTasks

return RetCode.OK
end function

public function long of_remove (readonly integer index);int i,nCount
long rtCode
n_cst_threading_task newTasks[]

//if #Running then return RetCode.E_BUSY
if of_IsBusy() then return RetCode.E_BUSY
nCount = UpperBound(Tasks)
if index < 1 or index > nCount then return RetCode.E_OUT_OF_BOUND
if Tasks[index].#Running then return RetCode.E_BUSY

if IsPrevented(Event OnTaskDestroy(Tasks[index])) then return RetCode.FAILED
if IsPrevented(_eventful.of_Trigger(EVT_TASKDESTROY,Tasks[index])) then return RetCode.FAILED

rtCode = _Thread.of_Remove(index)
if IsFailed(rtCode) then return rtCode

Tasks[index].Event OnUninit()
Destroy Tasks[index]

for i = 1 to nCount
	if i = index then continue
	newTasks[UpperBound(newTasks) + 1] = Tasks[i]
next

Tasks = newTasks

return RetCode.OK
end function

public function long of_run ();int nIndex

if #Running then return RetCode.E_BUSY
//if UpperBound(Tasks) = 0 then return RetCode.FAILED

#Running = true
ResetEvent(_hEvtCancelled)

for nIndex = UpperBound(Tasks) to 1 step -1
	ResetEvent(Tasks[nIndex].of_GetCancelEvent())
next

_Thread.Post of_Run()

return RetCode.OK
end function

public function long of_setpriority (readonly long priority);if #Running then return RetCode.E_BUSY
if Not SetThreadPriority(_handle,priority) then return RetCode.FAILED
return RetCode.OK
end function

public function long of_setaffinitymask (readonly unsignedlong mask);if #Running then return RetCode.E_BUSY
if SetThreadAffinityMask(_handle,mask) = 0 then return RetCode.FAILED
return RetCode.OK
end function

public function long of_setaffinity (readonly unsignedinteger cpuindex);if #Running then return RetCode.E_BUSY
if SetThreadAffinityMask(_handle,BitLSH(1,CPUIndex - 1)) = 0 then return RetCode.FAILED
return RetCode.OK
end function

private function string _of_getthreadclsname ();string clsName

clsName = Event OnGetThreadClsName()
if IsNull(clsName) or clsName = "" then clsName = "n_cst_thread"

return clsName
end function

public function long of_setautorelease (readonly boolean auto);if #AutoRelease = auto then return RetCode.OK

#AutoRelease = auto

return RetCode.OK
end function

public function long of_setignoretaskerror (readonly boolean ignore);if #IgnoreTaskError = ignore then return RetCode.OK

#IgnoreTaskError = ignore

return RetCode.OK
end function

public function long of_suspend ();if Not #Running then return RetCode.FAILED
return SuspendThread(_handle)
end function

public function long of_resume ();if Not #Running then return RetCode.FAILED
return ResumeThread(_handle)
end function

public function ulong of_gethandle ();return _handle
end function

public function string of_getsid ();return _sid
end function

public function ulong of_getid ();return _id
end function

public function long of_on (readonly string name, readonly powerobject object, readonly string evtname);return _Eventful.of_On(name,object,evtName)
end function

public function long of_off (readonly string name, readonly powerobject object, readonly string evtname);return _Eventful.of_Off(name,object,evtName)
end function

public function long of_off (readonly powerobject object, readonly string evtname);return _Eventful.of_Off(object,evtName)
end function

public function long of_off (readonly powerobject object);return _Eventful.of_Off(object)
end function

public function long of_off ();return _Eventful.of_Off(".^persistent")
end function

public function long of_gettask (readonly integer index, ref n_cst_threading_task tasking);if index < 1 or index > UpperBound(Tasks) then return RetCode.E_OUT_OF_BOUND

try
	tasking = Tasks[index]
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(tasking),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function integer of_getindex (readonly n_cst_threading_task tasking);int index,nCount

if Not IsValidObject(tasking) then return RetCode.E_INVALID_OBJECT

nCount = UpperBound(Tasks)
for index = 1 to nCount
	if Tasks[index] = tasking then return index
next

return 0
end function

public function long of_findtaskbytag (readonly string tag, ref n_cst_threading_task foundtasking);int index,nCount
n_cst_threading_task task

if tag = "" then return RetCode.E_INVALID_ARGUMENT

nCount = UpperBound(Tasks)
for index = 1 to nCount
	if Tasks[index].#Tag = tag then
		task = Tasks[index]
		exit
	end if
next
if index > nCount then return RetCode.E_OBJECT_NOT_FOUND

try
	foundTasking = task
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(foundTasking),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function long of_off (readonly string name);if Pos(name,".") > 0 then
	return _Eventful.of_Off(name)
else
	return _Eventful.of_Off(name + ".^persistent")
end if
end function

public function long of_off (readonly string name, readonly powerobject object);return _Eventful.of_Off(name,object)
end function

public function long of_gettaskbyid (readonly unsignedlong id, ref n_cst_threading_task tasking);int nIndex,nCount

nCount = UpperBound(Tasks)
for nIndex = 1 to nCount
	if Tasks[nIndex].of_GetID() = id then
		try
			tasking = Tasks[nIndex]
		catch(Throwable ex)
			return RetCode.E_INVALID_ARGUMENT
		end try
		return iif(IsValidObject(tasking),RetCode.OK,RetCode.E_INVALID_OBJECT)
	end if
next

return RetCode.E_OBJECT_NOT_FOUND
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

public function boolean of_hasdata (readonly string name);int nIndex,nCount

nCount = UpperBound(_datas)
for nIndex = 1 to nCount
	if _datas[nIndex].name = name then return true
next

return false
end function

public function string of_getdatastring (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return ""

return aVal
end function

public function long of_getdatalong (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return 0

return aVal
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

public function long of_getdata (readonly string name, ref string val);any aVal
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

public function double of_getdatadouble (readonly string name, readonly double default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function boolean of_getdataboolean (readonly string name, readonly boolean default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function long of_getdatalong (readonly string name, readonly long default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function any of_getdata (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return aVal

return aVal
end function

public function any of_getdataany (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return aVal

return aVal
end function

public function any of_getdataany (readonly string name, readonly any default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function integer of_msgbox (readonly string title, readonly string text, readonly string detail, readonly icon ico, readonly button btn, readonly integer defbtn);int rtCode

rtCode = Event OnMsgBox(title,text,detail,ico,btn,defBtn)
if Not IsNull(rtCode) then return rtCode

return MessageBox(title,text,ico,btn,defBtn)
end function

public function integer of_inserttask (readonly integer index, ref n_cst_threading_task newtasking, readonly string taskingclsname);return of_InsertTask(index,ref newTasking,taskingClsName,"",n_cst_threading_task.GROUP_NORMAL)
end function

public function integer of_addtask (ref n_cst_threading_task newtasking, readonly string taskingclsname);return of_InsertTask(0,ref newTasking,taskingClsName,"",n_cst_threading_task.GROUP_NORMAL)
end function

public function long of_remove (readonly n_cst_threading_task tasking);return of_Remove(of_GetIndex(tasking))
end function

public function long of_preventevent ();return _eventful.of_Prevent()
end function

public function long of_setignoretaskcancel (readonly boolean ignore);if #IgnoreTaskCancel = ignore then return RetCode.OK

#IgnoreTaskCancel = ignore

return RetCode.OK
end function

public function long of_stop (readonly long exitcode);int nIndex,nCount,nIndexRunning

if Not #Running then return RetCode.OK

nCount = UpperBound(Tasks)

for nIndex = 1 to nCount
	if Tasks[nIndex].#Running then
		nIndexRunning = nIndex
		exit
	end if
next

if nIndexRunning > 0 then
	for nIndex = nIndexRunning to nCount
		Tasks[nIndex].of_Cancel()
	next
end if

SetEvent(_hEvtCancelled)

do while(ResumeThread(_handle) > 1)
loop

_nExitCode = exitCode

return RetCode.OK
end function

public function long of_stop ();long nvl

SetNull(nvl)

return of_Stop(nvl)
end function

public function long of_terminate (readonly long exitcode);if Not #Running then return RetCode.OK
if IsFailed(of_Stop(exitCode)) then return RetCode.FAILED

return of_Wait()
end function

public function long of_terminate ();long nvl

SetNull(nvl)

return of_Terminate(nvl)
end function

public function long of_preventevent (readonly boolean deep);return _eventful.of_Prevent(deep)
end function

public function integer of_inserttask (integer index, ref n_cst_threading_task newtasking, readonly string taskingclsname, readonly string taskclsname, readonly long group);int i
long rtCode

//if #Running then return RetCode.E_BUSY
if of_IsBusy() then return RetCode.E_BUSY
if index < 0 or index > UpperBound(Tasks) + 1 then return RetCode.E_OUT_OF_RANGE
if taskingClsName = "" then return RetCode.E_INVALID_TYPE

try
	newTasking = Create Using taskingClsName
catch(Throwable ex)
	return RetCode.E_INVALID_TYPE
end try
if Not IsValidObject(newTasking) then return RetCode.E_INVALID_OBJECT

if index = 0 then
	for index = UpperBound(Tasks) to 1 step -1
		if group >= Tasks[index].#Group then
			index++
			exit
		end if
	next
	if index <= 0 then index = 1
end if

rtCode = newTasking.Event OnInit(this,_Thread,index,_hEvtSync,taskClsName,group)
if IsFailed(rtCode) then
	Destroy newTasking
	return rtCode
end if

for i = UpperBound(Tasks) + 1 to index + 1 step -1
	Tasks[i] = Tasks[i - 1]
next
Tasks[index] = newTasking

Event OnTaskCreated(newTasking)
_eventful.of_Trigger(EVT_TASKCREATED,newTasking)

return index
end function

public function integer of_inserttask (readonly integer index, ref n_cst_threading_task newtasking, readonly string taskingclsname, readonly long group);return of_InsertTask(index,ref newTasking,taskingClsName,"",group)
end function

public function integer of_addtask (ref n_cst_threading_task newtasking, readonly string taskingclsname, readonly string taskclsname, readonly long group);return of_InsertTask(0,ref newTasking,taskingClsName,taskClsName,group)
end function

public function integer of_addtask (ref n_cst_threading_task newtasking, readonly string taskingclsname, readonly string taskclsname);return of_InsertTask(0,ref newTasking,taskingClsName,taskClsName,n_cst_threading_task.GROUP_NORMAL)
end function

public function integer of_inserttask (readonly integer index, ref n_cst_threading_task newtasking, readonly string taskingclsname, readonly string taskclsname);return of_InsertTask(index,ref newTasking,taskingClsName,taskClsName,n_cst_threading_task.GROUP_NORMAL)
end function

public function integer of_addtask (ref n_cst_threading_task newtasking, readonly string taskingclsname, readonly long group);return of_InsertTask(0,ref newTasking,taskingClsName,"",group)
end function

on n_cst_threading.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_threading.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ulong nThisThreadId
string sClsName,sError
Constant Long THREAD_ALL_ACCESS = 2032639

Event OnThreadCreating()

sClsName = _of_GetThreadClsName()
nThisThreadId = GetCurrentThreadId()

if IsAllowed(Event OnThreadCreate(sClsName,ref _Thread,ref _sid)) then
	_sid = Space(64)
	ThreadGenID(ref _sid,64)
	choose case SharedObjectRegister(sClsName,_sid)
		case Success!
			choose case SharedObjectGet(_sid,ref _Thread)
				case Success!
					if Not IsValidObject(_Thread) then
						sError = "创建线程失败!~nError:Invalid Object!~nThread ID:" + _sid
						goto _Error_
					end if
				case SharedObjectCreateInstanceError!
					sError = "创建线程失败!~nError:The local reference to the shared object could not be created!~nThread ID:" + _sid
					goto _Error_
				case SharedObjectNotExistsError!
					sError = "创建线程失败!~nError:The instance name has not been registered!~nThread ID:" + _sid
					goto _Error_
			end choose
		case SharedObjectExistsError!
			sError = "创建线程失败!~nError:The instance name has already been used!~nThread ID:" + _sid
			goto _Error_
		case SharedObjectCreateInstanceError!
			sError = "创建线程失败!~nError:The object could not be created!~nThread ID:" + _sid
			goto _Error_
		case SharedObjectCreatePBSessionError!
			sError = "创建线程失败!~nError:The shared object session could not be created!~nThread ID:" + _sid
			goto _Error_
	end choose
end if
if Not IsValidObject(_Thread) then
	sError = "创建线程失败!~nError:Invalid Object!~nThread ID:" + _sid
	goto _Error_
end if

_hEvtCancelled = CreateEvent(0,true,false,0)
_hEvtSync = CreateEvent(0,true,false,0)
_Eventful = Create n_cst_threading_eventful
_Eventful.Event OnInit(this,_hEvtCancelled,_hEvtSync,_hEvtCancelled)

_Thread.Event OnInit(this,nThisThreadId,_hEvtCancelled)
_id = _Thread.of_GetId()
if _id <> nThisThreadId then
	_handle = OpenThread(THREAD_ALL_ACCESS,false,_id)
end if

Event OnThreadCreated(_Thread)

return

_Error_:

MessageBox("THREAD EXCEPTION",sError,StopSign!)
HALT
end event

event destructor;int nIndex,nCount
n_cst_threading_task	emptyTasks[]
NAMEDDATA emptyDatas[]

Event OnThreadDestroying()

#AutoRelease = false
of_Terminate()
if Not IsValid(this) then return

nCount = UpperBound(Tasks)
for nIndex = 1 to nCount
	if Not IsValid(Tasks[nIndex]) then continue
	Event OnTaskDestroy(Tasks[nIndex])
	_eventful.of_Trigger(EVT_TASKDESTROY,Tasks[nIndex])
	Tasks[nIndex].Event OnUninit()
	Destroy Tasks[nIndex]
next
Tasks = emptyTasks

CloseHandle(_hEvtCancelled)
CloseHandle(_hEvtSync)
Destroy _Eventful

nCount = UpperBound(_datas)
for nIndex = 1 to nCount
	SetNull(_datas[nIndex].data)
next
_datas = emptyDatas

if _handle <> 0 then
	if #Running then
		//NOTICE
		//可能引起死锁，建议线程完全停止后再销毁
		_Thread.Post Event OnUninit()
	else
		_Thread.Event OnUninit()
	end if
else
	_Thread.Event OnUninit()
end if
SetNull(_Thread)
if _sid <> "" then
	SharedObjectUnregister(_sid)
end if

if Not IsValidObject(#ParentThreadingPool) then
	if _handle <> 0 then
		ThreadWait(_handle,_id)
		CloseHandle(_handle)
	end if
	Event OnThreadExited()
end if

Event OnThreadDestroyed()

end event

