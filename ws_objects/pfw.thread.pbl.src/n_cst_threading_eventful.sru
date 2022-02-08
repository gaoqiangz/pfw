$PBExportHeader$n_cst_threading_eventful.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_threading_eventful from n_cst_eventful
end type
type retvaluedata from structure within n_cst_threading_eventful
end type
end forward

global type n_cst_threading_eventful from n_cst_eventful
event oninit ( powerobject source,  unsignedlong hevtcancelled,  unsignedlong hevtsync,  unsignedlong hevtexception )
end type
global n_cst_threading_eventful n_cst_threading_eventful

type prototypes
Private:
Function boolean SetEvent(ulong hEvent) Library "kernel32.dll"
Function boolean ResetEvent(ulong hEvent) Library "kernel32.dll"
Function ulong WaitForSingleObject(ulong hHandle,ulong dwMilliseconds) Library "kernel32.dll"
end prototypes

type variables
public:
boolean #Silent

private:
powerobject _source

ulong _hEvtCancelled
ulong _hEvtSync
ulong _hEvtException
end variables

event oninit(powerobject source, unsignedlong hevtcancelled, unsignedlong hevtsync, unsignedlong hevtexception);_source = source
_hEvtCancelled = hEvtCancelled
_hEvtSync = hEvtSync
_hEvtException = hEvtException
end event

on n_cst_threading_eventful.create
call super::create
end on

on n_cst_threading_eventful.destroy
call super::destroy
end on

event onprepare;call super::onprepare;if Not #Silent then
	if WaitForSingleObject(_hEvtCancelled,0) = 0 then
		of_Prevent()
		return 1
	end if
end if
if argCount < 1 or target = _source then return 0
invoker.SetArg(1,_source)
argPassed = 1
return 0
end event

event ontriggering;call super::ontriggering;if #Silent then return 0
if WaitForSingleObject(_hEvtCancelled,0) = 0 then return 1
if Not isPost then
	SetEvent(_hEvtSync)
end if
return 0
end event

event ontriggered;call super::ontriggered;if #Silent then return
if Not isPost then
	ResetEvent(_hEvtSync)
end if
end event

event constructor;call super::constructor;//long nvl
//SetNull(nvl)
of_SetDefaultReturnValue(0)
end event

event onexception;call super::onexception;SetEvent(_hEvtCancelled)
SetEvent(_hEvtException)

if WaitForSingleObject(_hEvtSync,0) = 0 then
	MessageBox("Thread Exception", ex.GetMessage(),StopSign!)
	return 1
end if

return 0
end event

