$PBExportHeader$n_cst_threading_pool.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_threading_pool from nonvisualobject
end type
type threaddata from structure within n_cst_threading_pool
end type
type flythreaddata from structure within n_cst_threading_pool
end type
type timing_collect from timing within n_cst_threading_pool
end type
end forward

type threaddata from structure
	n_cst_threading		threading
	boolean		locked
	unsignedlong		idlestarttime
end type

type flythreaddata from structure
	ulong		id
	ulong		handle
end type

global type n_cst_threading_pool from nonvisualobject
event type string ongetthreadingclsname ( )
event onthreadcreated ( n_cst_threading threading )
event type long onthreaddestroy ( n_cst_threading threading )
event oncollect ( )
event onthreadexited ( unsignedlong id )
timing_collect timing_collect
end type
global n_cst_threading_pool n_cst_threading_pool

type prototypes
Private:
Function ulong WaitForSingleObject(ulong hHandle,ulong dwMilliseconds) Library "kernel32.dll"
Function boolean CloseHandle(ulong hObject) Library "kernel32.dll"
Function boolean ThreadWait(ulong hThread,ulong dwID) Library "pfw.dll" Alias for "pfwThreadWait"
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

/*--- Properties ---*/
Public:
ProtectedWrite Uint #MinPool	= 5
ProtectedWrite Uint #MaxPool 	= 9999

/*--- Implementation ---*/
Private:
THREADDATA ThreadDatas[]
FLYTHREADDATA FlyThreadDatas[]

boolean _inTerminating

constant long COLLECT_THRESOLD = 180000
constant double COLLECT_INTERVAL = 3 //sec
end variables

forward prototypes
public function integer of_getcount ()
public function long of_setminpool (readonly unsignedinteger min)
public function long of_setmaxpool (readonly unsignedinteger max)
public function integer of_getidlecount ()
private function string _of_getthreadingclsname ()
public function long of_release (ref n_cst_threading threading)
public function long of_get (ref n_cst_threading threading)
public function long of_get (readonly integer index, ref n_cst_threading threading)
public function long of_create (ref n_cst_threading threading)
public function long of_releaseall ()
public function long of_setminmaxpool (readonly unsignedinteger min, readonly unsignedinteger max)
public function long of_releaseall (readonly boolean collectimmediate)
public function long of_collect (readonly boolean force)
public function long of_collect ()
public function boolean of_hasalive ()
private function boolean _of_checkfly ()
end prototypes

event oncollect();if _inTerminating then return
of_Collect()
end event

public function integer of_getcount ();return UpperBound(ThreadDatas)
end function

public function long of_setminpool (readonly unsignedinteger min);if _inTerminating then return RetCode.E_BUSY
if #MinPool = min then return RetCode.OK
if min > #MaxPool then return RetCode.E_INVALID_ARGUMENT

#MinPool = min

return RetCode.OK
end function

public function long of_setmaxpool (readonly unsignedinteger max);if _inTerminating then return RetCode.E_BUSY
if #MaxPool = max then return RetCode.OK
if max < #MinPool then return RetCode.E_INVALID_ARGUMENT

#MaxPool = max

return RetCode.OK
end function

public function integer of_getidlecount ();int index,nCount

for index = 1 To UpperBound(ThreadDatas)
	if ThreadDatas[index].Locked then continue
	if Not IsValid(ThreadDatas[index].Threading) then continue
	if ThreadDatas[index].Threading.#Running then continue
	nCount++
next

return nCount
end function

private function string _of_getthreadingclsname ();string clsName

clsName = Event OnGetThreadingClsName()
if IsNull(clsName) or clsName = "" then clsName = "n_cst_threading"

return clsName
end function

public function long of_release (ref n_cst_threading threading);int index,nCount,i
n_cst_threading_task tasking

if Not IsValidObject(threading) then return RetCode.E_INVALID_OBJECT
if threading.#ParentThreadingPool <> this then return RetCode.E_INVALID_ARGUMENT

nCount = UpperBound(ThreadDatas)
for index = 1 to nCount
	if ThreadDatas[index].Threading = threading then
		ThreadDatas[index].Locked = false
		if Not threading.#Running then
			ThreadDatas[index].idleStartTime = CPU()
		end if
		exit
	end if
next
if index > nCount then return RetCode.E_OBJECT_NOT_FOUND

if threading.#Running then
	for i = threading.of_GetCount() to 1 step -1
		if IsSucceeded(threading.of_GetTask(i,ref tasking)) then
			tasking.of_RemoveDatas()
			tasking.of_Off()
			tasking.of_PreventEvent(true)
			tasking.#Tag = ""
			SetNull(tasking.#Data)
		end if
	next
	threading.of_Stop()
else
	threading.of_RemoveAll()
end if

threading.of_SetAutoRelease(false)
threading.of_SetIgnoreTaskError(false)
threading.of_SetIgnoreTaskCancel(true)
threading.of_RemoveDatas()
threading.of_Off()
threading.of_PreventEvent(true)
threading.#Tag = ""
SetNull(threading.#Data)
SetNull(threading)

if Not _inTerminating then
	timing_collect.Start(COLLECT_INTERVAL)
end if

return RetCode.OK
end function

public function long of_get (ref n_cst_threading threading);int index,nCount

if _inTerminating then return RetCode.E_BUSY

nCount = UpperBound(ThreadDatas)
for index = 1 to nCount
	if ThreadDatas[index].Locked then continue
	if Not IsValid(ThreadDatas[index].Threading) then continue
	if ThreadDatas[index].Threading.#Running then continue
	if IsFailed(ThreadDatas[index].Threading.of_RemoveAll()) then continue
	ThreadDatas[index].Locked = true
	ThreadDatas[index].idleStartTime = 0
	threading = ThreadDatas[index].Threading
	return RetCode.OK
next

return of_Create(ref threading)
end function

public function long of_get (readonly integer index, ref n_cst_threading threading);if index < 1 or index > UpperBound(ThreadDatas) then return RetCode.E_OUT_OF_BOUND

threading = ThreadDatas[index].Threading

return RetCode.OK
end function

public function long of_create (ref n_cst_threading threading);int index,nCount

if _inTerminating then return RetCode.E_BUSY

nCount = UpperBound(ThreadDatas)
if nCount >= #MaxPool then return RetCode.E_OUT_OF_RANGE

try
	threading = Create Using _of_GetThreadingClsName()
catch(Throwable ex)
	return RetCode.E_INVALID_TYPE
end try
if Not IsValidObject(threading) then return RetCode.E_INVALID_OBJECT

threading.Event OnInit(this)

index = nCount + 1
ThreadDatas[index].Threading = threading
ThreadDatas[index].Locked = true
ThreadDatas[index].idleStartTime = 0

Event OnThreadCreated(threading)

return RetCode.OK
end function

public function long of_releaseall ();return of_ReleaseAll(true)
end function

public function long of_setminmaxpool (readonly unsignedinteger min, readonly unsignedinteger max);if _inTerminating then return RetCode.E_BUSY
if #MinPool = min and #MaxPool = max then return RetCode.OK
if min > max then return RetCode.E_INVALID_ARGUMENT

#MinPool = min
#MaxPool = max

return RetCode.OK
end function

public function long of_releaseall (readonly boolean collectimmediate);int nIndex,nCount,nIdxFly,i
n_cst_threading_task tasking
THREADDATA newThreadDatas[]
FLYTHREADDATA newFlyThreadDatas[]

if _inTerminating then return RetCode.E_BUSY

_inTerminating = true

nCount = UpperBound(ThreadDatas)
for nIndex = 1 to nCount
	if Not IsValid(ThreadDatas[nIndex].Threading) then continue
	ThreadDatas[nIndex].Locked = false
	ThreadDatas[nIndex].idleStartTime = CPU()
	if ThreadDatas[nIndex].Threading.#Running then
		for i = ThreadDatas[nIndex].Threading.of_GetCount() to 1 step -1
			if IsSucceeded(ThreadDatas[nIndex].Threading.of_GetTask(i,ref tasking)) then
				tasking.of_RemoveDatas()
				tasking.of_Off()
				tasking.of_PreventEvent(true)
				tasking.#Tag = ""
				SetNull(tasking.#Data)
			end if
		next
		ThreadDatas[nIndex].Threading.of_Stop()
	else
		ThreadDatas[nIndex].Threading.of_RemoveAll()
	end if
	ThreadDatas[nIndex].Threading.of_SetAutoRelease(false)
	ThreadDatas[nIndex].Threading.of_SetIgnoreTaskError(false)
	ThreadDatas[nIndex].Threading.of_SetIgnoreTaskCancel(true)
	ThreadDatas[nIndex].Threading.of_RemoveDatas()
	ThreadDatas[nIndex].Threading.of_Off()
	ThreadDatas[nIndex].Threading.of_PreventEvent(true)
	ThreadDatas[nIndex].Threading.#Tag = ""
	SetNull(ThreadDatas[nIndex].Threading.#Data)
next

if collectImmediate then
	timing_collect.Stop()
	
	for nIndex = 1 to nCount
		if Not IsValid(ThreadDatas[nIndex].Threading) then continue
		if ThreadDatas[nIndex].Threading.#Running then
			ThreadDatas[nIndex].Threading.of_Wait()
		end if
		if IsAllowed(Event OnThreadDestroy(ThreadDatas[nIndex].Threading)) then
			if ThreadDatas[nIndex].Threading.of_GetHandle() <> 0 then
				nIdxFly = UpperBound(FlyThreadDatas) + 1
				FlyThreadDatas[nIdxFly].id = ThreadDatas[nIndex].Threading.of_GetId()
				FlyThreadDatas[nIdxFly].handle = ThreadDatas[nIndex].Threading.of_GetHandle()
			end if
			Destroy ThreadDatas[nIndex].Threading
		else
			newThreadDatas[UpperBound(newThreadDatas) + 1] = ThreadDatas[nIndex]
		end if
	next
	ThreadDatas = newThreadDatas
	
	nCount = UpperBound(FlyThreadDatas)
	for nIndex = 1 to nCount
		ThreadWait(FlyThreadDatas[nIndex].handle,FlyThreadDatas[nIndex].id)
		CloseHandle(FlyThreadDatas[nIndex].handle)
		Event OnThreadExited(FlyThreadDatas[nIndex].id)
	next
	FlyThreadDatas = newFlyThreadDatas
else
	timing_collect.Start(COLLECT_INTERVAL)
end if

_inTerminating = false

return RetCode.OK
end function

public function long of_collect (readonly boolean force);int nIndex,nCount,nIdxFly
boolean bRelease
THREADDATA newThreadDatas[]

if _inTerminating then return RetCode.E_BUSY

nCount = UpperBound(ThreadDatas)
if nCount <= #MinPool and Not force then return RetCode.OK

for nIndex = 1 to nCount
	if Not IsValid(ThreadDatas[nIndex].Threading) then continue
	bRelease = (Not ThreadDatas[nIndex].Threading.#Running and Not ThreadDatas[nIndex].Locked and (force or (UpperBound(newThreadDatas) >= #MinPool and CPU() - ThreadDatas[nIndex].idleStartTime >= COLLECT_THRESOLD)))
	if bRelease then
		bRelease = IsAllowed(Event OnThreadDestroy(ThreadDatas[nIndex].Threading))
	end if
	if bRelease then
		if ThreadDatas[nIndex].Threading.of_GetHandle() <> 0 then
			nIdxFly = UpperBound(FlyThreadDatas) + 1
			FlyThreadDatas[nIdxFly].id = ThreadDatas[nIndex].Threading.of_GetId()
			FlyThreadDatas[nIdxFly].handle = ThreadDatas[nIndex].Threading.of_GetHandle()
		end if
		Destroy ThreadDatas[nIndex].Threading
	else
		if Not ThreadDatas[nIndex].Threading.#Running and Not ThreadDatas[nIndex].Locked then
			ThreadDatas[nIndex].Threading.of_RemoveAll()
		end if
		newThreadDatas[UpperBound(newThreadDatas) + 1] = ThreadDatas[nIndex]
	end if
next

ThreadDatas = newThreadDatas

_of_CheckFly()

return RetCode.OK
end function

public function long of_collect ();return of_Collect(false)
end function

public function boolean of_hasalive ();if UpperBound(ThreadDatas) > 0 then return true

return _of_CheckFly()
end function

private function boolean _of_checkfly ();int nIndex,nCount
FLYTHREADDATA newFlyThreadDatas[]

nCount = UpperBound(FlyThreadDatas)
for nIndex = 1 to nCount
	if WaitForSingleObject(FlyThreadDatas[nIndex].handle,0) = 258 /*WAIT_TIMEOUT*/ then
		newFlyThreadDatas[UpperBound(newFlyThreadDatas) + 1] = FlyThreadDatas[nIndex]
	else
		CloseHandle(FlyThreadDatas[nIndex].handle)
		Event OnThreadExited(FlyThreadDatas[nIndex].id)
	end if
next
FlyThreadDatas = newFlyThreadDatas

return UpperBound(FlyThreadDatas) > 0
end function

on n_cst_threading_pool.create
call super::create
this.timing_collect=create timing_collect
TriggerEvent( this, "constructor" )
end on

on n_cst_threading_pool.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.timing_collect)
end on

event destructor;timing_collect.Stop()
of_ReleaseAll(true)
end event

type timing_collect from timing within n_cst_threading_pool descriptor "pb_nvo" = "true" 
end type

on timing_collect.create
call super::create
TriggerEvent( this, "constructor" )
end on

on timing_collect.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event timer;if Not IsValid(parent) then
	Stop()
	return
end if
parent.Event OnCollect()
end event

