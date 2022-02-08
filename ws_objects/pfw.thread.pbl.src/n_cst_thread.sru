$PBExportHeader$n_cst_thread.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_thread from nonvisualobject
end type
type nameddata from structure within n_cst_thread
end type
end forward

type nameddata from structure
	string		name
	any		data
end type

global type n_cst_thread from nonvisualobject
event type long onstart ( )
event onstop ( long exitcode )
event oninit ( n_cst_threading parentthreading,  unsignedlong parentthreadid,  unsignedlong hevtcancelled )
event type long onerror ( long errcode,  string errinfo )
event type long ondotasks ( )
event onuninit ( )
event onidle ( )
event type long onpreparetask ( n_cst_thread_task task )
end type
global n_cst_thread n_cst_thread

type prototypes
Private:
Function long SuspendThread(ulong hThread) Library "kernel32.dll"
Function boolean SetEvent(ulong hEvent) Library "kernel32.dll"
Function boolean ResetEvent(ulong hEvent) Library "kernel32.dll"
Function ulong WaitForSingleObject(ulong hHandle,ulong dwMilliseconds) Library "kernel32.dll"
Function ulong SleepMs(ulong dwMilliseconds) Library "kernel32.dll" Alias for "Sleep"
Function ulong GetCurrentThreadId() Library "kernel32.dll"
Function ulong GetCurrentThread() Library "kernel32.dll"
Function ulong OpenThread(ulong dwDesiredAccess,boolean bInheritHandle,ulong dwThreadId) Library "kernel32.dll"
Function Boolean ImmDisableIME(ulong idThread) Library "Imm32.dll"
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
//Thread events (of_On/of_Off)
Constant String EVT_IDLE	= "idle"	//arguments
												//  n_cst_thread source
												//return
												//  none
																	
/*--- Properties ---*/
Public:
PrivateWrite 	n_cst_threading 	#ParentThreading
PrivateWrite 	Boolean 				#Running 			= false

/*--- Implementation ---*/
Private:
Ulong _handle
Ulong _id
Ulong _idMain
Ulong _hEvtCancelled
n_cst_thread_task Tasks[]

n_cst_eventful _eventful

NAMEDDATA _datas[]

Long _nLastGC
Long _nExecIndex
Ulong _nExecCount
Ulong _nTaskNextId
end variables

forward prototypes
public function integer of_inserttask (readonly integer index, ref n_cst_thread_task newtask, readonly string tasktypename)
public function integer of_addtask (ref n_cst_thread_task newtask, string tasktypename)
public function integer of_getindex (readonly n_cst_thread_task task)
public function integer of_getcount ()
public function long of_remove (readonly integer index)
public function long of_removeall ()
public function long of_gettask (readonly integer index, ref n_cst_thread_task task)
public function boolean of_iscancelled ()
public function unsignedlong of_gethandle ()
public function long of_run ()
public function long of_stop ()
public function unsignedlong of_getcancelevent ()
public function long of_cancel ()
public function long of_release ()
public function long of_sleep (readonly double sec)
public function boolean of_wait (readonly double timeout)
public function unsignedlong of_getid ()
public function long of_autogc ()
public function unsignedlong of_getexeccount ()
public function long of_gettaskbyid (readonly unsignedlong id, ref n_cst_thread_task task)
public function long of_setdata (readonly string name, readonly any data)
public function long of_removedata (readonly string name)
public function long of_removedatas ()
public function long of_off ()
public function long of_off (readonly powerobject object)
public function long of_off (readonly string name)
public function long of_off (readonly string name, readonly powerobject object)
public function long of_off (readonly string name, readonly powerobject object, readonly string evtname)
public function long of_on (readonly string name, readonly powerobject object, readonly string evtname)
public function long of_off (readonly powerobject object, readonly string evtname)
public function boolean of_hasdata (readonly string name)
public function long of_getdata (readonly string name, ref any val)
public function boolean of_getdataboolean (readonly string name)
public function double of_getdatadouble (readonly string name)
public function long of_getdatalong (readonly string name)
public function string of_getdatastring (readonly string name)
public function long of_getdata (readonly string name, ref boolean val)
public function long of_getdata (readonly string name, ref double val)
public function long of_getdata (readonly string name, ref long val)
public function long of_getdata (readonly string name, ref string val)
public function boolean of_getdataboolean (readonly string name, readonly boolean default)
public function double of_getdatadouble (readonly string name, readonly double default)
public function long of_getdatalong (readonly string name, readonly long default)
public function string of_getdatastring (readonly string name, readonly string default)
public function any of_getdataany (readonly string name, readonly any default)
public function any of_getdataany (readonly string name)
public function any of_getdata (readonly string name)
public function long of_suspend ()
public function boolean of_ismainthread ()
end prototypes

event type long onstart();if of_IsCancelled() then return RetCode.PREVENT

#Running = true
if IsPrevented(#ParentThreading.Event OnStart()) then
	#Running = false
end if
if Not #Running or of_IsCancelled() then return RetCode.PREVENT

return RetCode.ALLOW
end event

event onstop(long exitcode);_nExecIndex = 0
#Running = false
#ParentThreading.Post Event OnStop(exitCode)
end event

event oninit(n_cst_threading parentthreading, unsignedlong parentthreadid, unsignedlong hevtcancelled);Constant Long THREAD_ALL_ACCESS = 2032639

#ParentThreading = ParentThreading
_hEvtCancelled = hEvtCancelled

_idMain = parentThreadId
_id = GetCurrentThreadId()
_handle = GetCurrentThread() //OpenThread(THREAD_ALL_ACCESS,false,_id)

if _idMain <> _id then
	ImmDisableIME(0)
end if

_nTaskNextId = _id + 10000

_eventful = Create n_cst_eventful
end event

event type long onerror(long errcode, string errinfo);long rtCode

SetNull(rtCode)

if Not of_IsCancelled() then
	rtCode = #ParentThreading.Event OnError(errCode,errInfo)
end if

return rtCode
end event

event type long ondotasks();long rtCode
boolean bIgnoreTaskError,bIgnoreTaskCancel,bCancelled

bIgnoreTaskError = #ParentThreading.#IgnoreTaskError
bIgnoreTaskCancel = #ParentThreading.#IgnoreTaskCancel

bCancelled = of_IsCancelled()
_nExecIndex = 1
do while(Not bCancelled and _nExecIndex <= UpperBound(Tasks))
	rtCode = Event OnPrepareTask(Tasks[_nExecIndex])
	if IsAllowed(rtCode) then
		rtCode = Tasks[_nExecIndex].of_Execute()
	end if
	if IsFailed(rtCode) then
		if Not bIgnoreTaskError and Not of_IsCancelled() then
			_nExecIndex = 0
			Event OnError(rtCode,"")
			return rtCode
		end if
	end if
	if rtCode = RetCode.CANCELLED and Not bIgnoreTaskCancel then
		of_Cancel()
		bCancelled = true
		exit
	end if
	bCancelled = of_IsCancelled()
	_nExecIndex++
loop
_nExecIndex = 0
if bCancelled then return RetCode.CANCELLED

return RetCode.OK
end event

event onuninit();int nIndex,nCount
n_cst_thread_task emptyTasks[]
NAMEDDATA emptyDatas[]

nCount = UpperBound(Tasks)
for nIndex = 1 to nCount
	Tasks[nIndex].Event OnUninit()
	Destroy Tasks[nIndex]
next
Tasks = emptyTasks

SetNull(#ParentThreading)

Destroy _eventful

nCount = UpperBound(_datas)
for nIndex = 1 to nCount
	SetNull(_datas[nIndex].data)
next
_datas = emptyDatas
end event

event onidle();_Eventful.of_Trigger(EVT_IDLE,this)
end event

public function integer of_inserttask (readonly integer index, ref n_cst_thread_task newtask, readonly string tasktypename);int i

//if #Running then return RetCode.E_BUSY
if index < 1 or index > UpperBound(Tasks) + 1 then return RetCode.E_OUT_OF_RANGE
if taskTypeName = "" then return RetCode.E_INVALID_TYPE

try
	newTask = Create Using taskTypeName
catch(RuntimeError ex)
	return RetCode.E_INVALID_TYPE
end try

if Not IsValidObject(newTask) then return RetCode.E_INVALID_OBJECT

_nTaskNextId += Rand(50)
newTask.Event OnInitThread(this,_nTaskNextId)

for i = UpperBound(Tasks) + 1 to index + 1 step -1
	Tasks[i] = Tasks[i - 1]
next
Tasks[index] = newTask

if index <= _nExecIndex then _nExecIndex ++

return index
end function

public function integer of_addtask (ref n_cst_thread_task newtask, string tasktypename);return of_InsertTask(UpperBound(Tasks) + 1,ref newTask,taskTypeName)
end function

public function integer of_getindex (readonly n_cst_thread_task task);int nIndex

for nIndex = 1 to UpperBound(Tasks)
	if Tasks[nIndex] = task then return nIndex
next

return 0
end function

public function integer of_getcount ();return UpperBound(Tasks)
end function

public function long of_remove (readonly integer index);int i,nCount
n_cst_thread_task newTasks[]

//if #Running then return RetCode.E_BUSY
if index < 1 or index > UpperBound(Tasks) then return RetCode.E_OUT_OF_BOUND
if Tasks[index].#Running then return RetCode.E_BUSY

Tasks[index].Event OnUninit()
Destroy Tasks[index]

nCount = UpperBound(Tasks)
for i = 1 to nCount
	if i = index then continue
	newTasks[UpperBound(newTasks) + 1] = Tasks[i]
next

Tasks = newTasks

if index <= _nExecIndex then _nExecIndex --

return RetCode.OK
end function

public function long of_removeall ();int nIndex,nCount
n_cst_thread_task emptyTasks[]

nCount = UpperBound(Tasks)
if nCount = 0 then return RetCode.OK

for nIndex = 1 to nCount
	if Tasks[nIndex].#Running then return RetCode.E_BUSY
next

for nIndex = 1 to nCount
	Tasks[nIndex].Event OnUninit()
	Destroy Tasks[nIndex]
next

Tasks = emptyTasks

_nExecIndex = 0

return RetCode.OK
end function

public function long of_gettask (readonly integer index, ref n_cst_thread_task task);if index < 1 or index > UpperBound(Tasks) then return RetCode.E_OUT_OF_BOUND

try
	task = Tasks[index]
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(task),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

public function boolean of_iscancelled ();return (WaitForSingleObject(_hEvtCancelled,0) = 0) //WAIT_OBJECT_0
end function

public function unsignedlong of_gethandle ();return _handle
end function

public function long of_run ();long nExitCode,nIndex

if #Running then return RetCode.E_BUSY

_nExecCount ++

if IsPrevented(Event OnStart()) then
	nExitCode = RetCode.CANCELLED
else
	try
		for nIndex = 1 to UpperBound(Tasks)
			if IsPrevented(Tasks[nIndex].Event OnThreadStart()) then
				nExitCode = RetCode.CANCELLED
				exit
			end if
		next
		if nExitCode <> RetCode.CANCELLED then
			nExitCode = Event OnDoTasks()
			for nIndex = UpperBound(Tasks) to 1 step -1
				Tasks[nIndex].Event OnThreadStop(nExitCode)
			next
		end if
	catch(Throwable ex)
		nExitCode = RetCode.E_INTERNAL_ERROR
		Event OnError(nExitCode,ex.GetMessage())
		//MessageBoxEx("Thread Exception", ClassName(this) + "~n" + ex.GetMessage())
	end try
end if

Event OnStop(nExitCode)

return nExitCode
end function

public function long of_stop ();if Not #Running then return RetCode.OK

return of_Cancel()
end function

public function unsignedlong of_getcancelevent ();return _hEvtCancelled
end function

public function long of_cancel ();int nIndex,nCount

SetEvent(_hEvtCancelled)

if _nExecIndex > 0 then
	nCount = UpperBound(Tasks)
	for nIndex = _nExecIndex to nCount
		Tasks[nIndex].of_Cancel()
	next
end if

return RetCode.OK
end function

public function long of_release ();n_cst_thread thisObj

if #Running then return RetCode.E_BUSY

thisObj = this
Destroy thisObj

return RetCode.OK
end function

public function long of_sleep (readonly double sec);SleepMs(sec * 1000)
return RetCode.OK
end function

public function boolean of_wait (readonly double timeout);of_AutoGC()
return (WaitForSingleObject(_hEvtCancelled,timeout * 1000) = 258) //WAIT_TIMEOUT
end function

public function unsignedlong of_getid ();return _id
end function

public function long of_autogc ();boolean bGC

Event OnIdle()

if Abs(CPU() - _nLastGC) >= GarbageCollectGetTimeLimit() then
	bGC = (_nLastGC <> 0)
	_nLastGC = CPU()
end if
if bGC then
	GarbageCollect()
end if

return RetCode.OK
end function

public function unsignedlong of_getexeccount ();return _nExecCount
end function

public function long of_gettaskbyid (readonly unsignedlong id, ref n_cst_thread_task task);int nIndex,nCount

nCount = UpperBound(Tasks)
for nIndex = 1 to nCount
	if Tasks[nIndex].of_GetID() = id then
		try
			task = Tasks[nIndex]
		catch(Throwable ex)
			return RetCode.E_INVALID_ARGUMENT
		end try
		return iif(IsValidObject(task),RetCode.OK,RetCode.E_INVALID_OBJECT)
	end if
next

return RetCode.E_OBJECT_NOT_FOUND
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

public function long of_off ();return _Eventful.of_Off(".^persistent")
end function

public function long of_off (readonly powerobject object);return _Eventful.of_Off(object)
end function

public function long of_off (readonly string name);if Pos(name,".") > 0 then
	return _Eventful.of_Off(name)
else
	return _Eventful.of_Off(name + ".^persistent")
end if
end function

public function long of_off (readonly string name, readonly powerobject object);return _Eventful.of_Off(name,object)
end function

public function long of_off (readonly string name, readonly powerobject object, readonly string evtname);return _Eventful.of_Off(name,object,evtName)
end function

public function long of_on (readonly string name, readonly powerobject object, readonly string evtname);return _Eventful.of_On(name,object,evtName)
end function

public function long of_off (readonly powerobject object, readonly string evtname);return _Eventful.of_Off(object,evtName)
end function

public function boolean of_hasdata (readonly string name);int nIndex,nCount

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

public function boolean of_getdataboolean (readonly string name, readonly boolean default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function double of_getdatadouble (readonly string name, readonly double default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function long of_getdatalong (readonly string name, readonly long default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function string of_getdatastring (readonly string name, readonly string default);any aVal

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

public function long of_suspend ();if Not #Running then return RetCode.FAILED
return SuspendThread(_handle)
end function

public function boolean of_ismainthread ();return _idMain = _id
end function

on n_cst_thread.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_thread.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

