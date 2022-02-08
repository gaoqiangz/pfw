$PBExportHeader$n_cst_threading_task.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_threading_task from nonvisualobject
end type
type nameddata from structure within n_cst_threading_task
end type
end forward

type nameddata from structure
	string		name
	any		data
end type

global type n_cst_threading_task from nonvisualobject
event type long oninit ( n_cst_threading parentthreading,  n_cst_thread parentthread,  integer index,  unsignedlong hevtsync,  string clsname )
event type string ongettaskclsname ( )
event type long onerror ( long errcode,  string errinfo )
event onstop ( long exitcode )
event type long onstart ( )
event type long onprepare ( )
event onfinalize ( )
event onuninit ( )
event type long onnotify ( long wparam,  long lparam,  string sparam )
event onpostnotify ( long wparam,  long lparam,  string sparam )
end type
global n_cst_threading_task n_cst_threading_task

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
//Threading events (of_On/of_Off)
Constant String EVT_COMMONNOTIFY	= "common-notify"	//arguments
																	//  n_cst_threading_task source
																	//  long reason
																	//  long wparam
																	//  long lparam
																	//  string sparam
																	//return
																	//  long
																	
Constant String EVT_START			= "start"			//arguments
																	//  n_cst_threading_task source
																	//return
																	//  long (0:continue,1:prevent)
																	
Constant String EVT_STOP			= "stop"				//arguments
																	//  n_cst_threading_task source
																	//  long exitCode
																	//  string lastErrorInfo
																	//return
																	//  none
																	
Constant String EVT_NOTIFY			= "notify"			//arguments
																	//  n_cst_threading_task source
																	//  long wparam
																	//  long lparam
																	//  string sparam
																	//return
																	//  long
																	
Constant String EVT_ERROR			= "error"			//arguments
																	//  n_cst_threading_task source
																	//  long errorCode
																	//  string errorInfo
																	//return
																	//  long

/*--- Properties ---*/
Public:
PrivateWrite 	n_cst_threading	#ParentThreading
ProtectedWrite String	 			#Type
ProtectedWrite Boolean 				#Running 			= false
String										#Tag
Any										#Data

/*--- Implementation ---*/
Protected:
PrivateWrite n_cst_thread_task  _Task
PrivateWrite n_cst_threading_eventful _Eventful

Private:
Ulong		_id
Ulong 	_hEvtCancelled
Ulong		_hEvtSync
Long		_lastExitCode
Long		_lastErrCode
String	_lastErrInfo
String 	_taskClsName

NAMEDDATA _datas[]

end variables

forward prototypes
public function boolean of_isbusy ()
public function long of_getlastexitcode ()
public function long of_getlasterrorcode ()
public function string of_getlasterrorinfo ()
public function boolean of_iscancelled ()
public function unsignedlong of_getcancelevent ()
private function long _of_sendnotify (readonly long reason, readonly long wparam, readonly long lparam, readonly string sparam)
public function long of_cancel ()
public function long of_on (readonly string name, readonly powerobject object, readonly string evtname)
public function long of_off (readonly string name, readonly powerobject object, readonly string evtname)
public function long of_off (readonly powerobject object, readonly string evtname)
public function long of_off (readonly powerobject object)
public function long of_off ()
public function long of_off (readonly string name)
public function long of_off (readonly string name, readonly powerobject object)
public function unsignedlong of_getid ()
public function integer of_getindex ()
public function long of_removedatas ()
public function long of_setdata (readonly string name, readonly any data)
public function long of_removedata (readonly string name)
public function boolean of_hasdata (readonly string name)
public function string of_getdatastring (readonly string name, readonly string default)
public function string of_getdatastring (readonly string name)
public function long of_getdatalong (readonly string name, readonly long default)
public function long of_getdatalong (readonly string name)
public function double of_getdatadouble (readonly string name, readonly double default)
public function double of_getdatadouble (readonly string name)
public function boolean of_getdataboolean (readonly string name, readonly boolean default)
public function long of_getdata (readonly string name, ref string val)
public function long of_getdata (readonly string name, ref any val)
public function long of_getdata (readonly string name, ref boolean val)
public function long of_getdata (readonly string name, ref double val)
public function long of_getdata (readonly string name, ref long val)
public function boolean of_getdataboolean (readonly string name)
public function any of_getdataany (readonly string name)
public function any of_getdataany (readonly string name, readonly any default)
public function any of_getdata (readonly string name)
public function string of_gettaskclassname ()
public function long of_preventevent ()
public function long of_setdelayfor (readonly double seconds)
public function long of_preventevent (boolean deep)
end prototypes

event type long oninit(n_cst_threading parentthreading, n_cst_thread parentthread, integer index, unsignedlong hevtsync, string clsname);long rtCode

#ParentThreading = ParentThreading

if clsName = "" then
	clsName = Event OnGetTaskClsName()
	Assert(clsName <> "","Task class name not specified")
end if

rtCode = ParentThread.of_InsertTask(index,ref _Task,clsName)
if IsFailed(rtCode) then return rtCode

_taskClsName = Lower(clsName)
_hEvtSync = hEvtSync

_hEvtCancelled = CreateEvent(0,true,false,0)
_Eventful = Create n_cst_threading_eventful

_Eventful.Event OnInit(this,_hEvtCancelled,_hEvtSync,#ParentThreading.of_GetCancelEvent())

_Task.Event OnInit(this,_Eventful,_hEvtCancelled)

_id = _Task.of_GetID()

return RetCode.OK
end event

event type long onerror(long errcode, string errinfo);long rtCode

SetNull(rtCode)
if of_IsCancelled() then return rtCode

_lastErrCode = errCode
_lastErrInfo = errInfo

SetEvent(_hEvtSync)
rtCode = _of_SendNotify(Enums.TNR_ERROR,errCode,0,errInfo)
ResetEvent(_hEvtSync)

return rtCode
end event

event onstop(long exitcode);ulong hEvtSync
n_cst_threading threading

threading = #ParentThreading
hEvtSync = _hEvtSync

if of_IsCancelled() then
	exitCode = RetCode.CANCELLED
end if

#Running = false
_lastExitCode = exitCode
SetEvent(hEvtSync)

Event OnFinalize()

_of_SendNotify(Enums.TNR_STOP,exitCode,0,_lastErrInfo)

if IsValid(this) then
	ResetEvent(hEvtSync)
else
	threading.ResetEvent(hEvtSync)
end if
end event

event type long onstart();_lastErrCode = RetCode.OK
_lastExitCode = RetCode.OK
_lastErrInfo = ""

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

event onuninit();int nIndex,nCount
NAMEDDATA emptyDatas[]

SetNull(_Task)

CloseHandle(_hEvtCancelled)
Destroy _Eventful

nCount = UpperBound(_datas)
for nIndex = 1 to nCount
	SetNull(_datas[nIndex].data)
next
_datas = emptyDatas

end event

event type long onnotify(long wparam, long lparam, string sparam);long rtCode

SetNull(rtCode)
if of_IsCancelled() then return rtCode

SetEvent(_hEvtSync)

rtCode = _of_SendNotify(Enums.TNR_NOTIFY,wparam,lparam,sparam)

ResetEvent(_hEvtSync)

return rtCode
end event

event onpostnotify(long wparam, long lparam, string sparam);if of_IsCancelled() then return

_of_SendNotify(Enums.TNR_NOTIFY,wparam,lparam,sparam)
end event

public function boolean of_isbusy ();if Not #Running then return #ParentThreading.of_IsBusy()
return (WaitForSingleObject(_hEvtSync,0) <> 0)
end function

public function long of_getlastexitcode ();return _lastExitCode
end function

public function long of_getlasterrorcode ();return _lastErrCode
end function

public function string of_getlasterrorinfo ();return _lastErrInfo
end function

public function boolean of_iscancelled ();if _lastExitCode = RetCode.CANCELLED then return true
return (WaitForSingleObject(_hEvtCancelled,0) = 0) //WAIT_OBJECT_0
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
		case Enums.TNR_NOTIFY
			if Not of_IsCancelled() then
				nVal = _Eventful.of_Trigger(EVT_NOTIFY,wparam,lparam,sparam)
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

public function long of_cancel ();SetEvent(_hEvtCancelled)
return RetCode.OK
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

public function long of_off (readonly string name);if Pos(name,".") > 0 then
	return _Eventful.of_Off(name)
else
	return _Eventful.of_Off(name + ".^persistent")
end if
end function

public function long of_off (readonly string name, readonly powerobject object);return _Eventful.of_Off(name,object)
end function

public function unsignedlong of_getid ();return _id
end function

public function integer of_getindex ();return #ParentThreading.of_GetIndex(this)
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

public function boolean of_hasdata (readonly string name);int nIndex,nCount

nCount = UpperBound(_datas)
for nIndex = 1 to nCount
	if _datas[nIndex].name = name then return true
next

return false
end function

public function string of_getdatastring (readonly string name, readonly string default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function string of_getdatastring (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return ""

return aVal
end function

public function long of_getdatalong (readonly string name, readonly long default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function long of_getdatalong (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return 0

return aVal
end function

public function double of_getdatadouble (readonly string name, readonly double default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function double of_getdatadouble (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return 0

return aVal
end function

public function boolean of_getdataboolean (readonly string name, readonly boolean default);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return default

return aVal
end function

public function long of_getdata (readonly string name, ref string val);any aVal
long rtCode

rtCode = of_GetData(name,ref aVal)
if rtCode <> RetCode.OK then return rtCode

val = aVal

return RetCode.OK
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

public function boolean of_getdataboolean (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return false

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

public function any of_getdata (readonly string name);any aVal

if of_GetData(name,ref aVal) <> RetCode.OK then return aVal

return aVal
end function

public function string of_gettaskclassname ();return _taskClsName
end function

public function long of_preventevent ();return _eventful.of_Prevent()
end function

public function long of_setdelayfor (readonly double seconds);if #Running then return RetCode.E_BUSY
return _Task.of_SetDelayFor(seconds)
end function

public function long of_preventevent (boolean deep);return _eventful.of_Prevent(deep)
end function

on n_cst_threading_task.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_threading_task.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

