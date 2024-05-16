$PBExportHeader$n_cst_eventful.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_eventful from nonvisualobject
end type
type eventdata from structure within n_cst_eventful
end type
type retvaluedata from structure within n_cst_eventful
end type
end forward

type eventdata from structure
	string		ns
	string		name
	long		capture
	long		priority
	powerobject		object
	string		clschain
	string		evtname
	long		mid
	n_scriptinvoker		invoker
	boolean		invoking
	boolean		disabled
	boolean		invalid
end type

type retvaluedata from structure
	string		name
	any		value
end type

global type n_cst_eventful from nonvisualobject
event type long onprepare ( string name,  powerobject target,  n_scriptinvoker invoker,  integer argcount,  ref integer argpassed )
event type long ontriggering ( string name,  boolean ispost )
event ontriggered ( string name,  boolean ispost )
event type long onexception ( string name,  throwable ex )
end type
global n_cst_eventful n_cst_eventful

type prototypes

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

private:
EVENTDATA Events[]
RETVALUEDATA DefRetValues[]

string _sThisClsName
boolean _bSubclassing

long _nDeep
int _nIdxStack[]

any _aDefRetVal
any _aRetVal

boolean _bIsPost
boolean _bHasException
long _nPrevent

string _sFirstName
string _sLastName

//Symbols
constant string SYMBOL_PREPEND	= "-"
constant string SYMBOL_LOW			= "@"
constant string SYMBOL_HIGH		= "!"
constant string SYMBOL_PRIO		= ":"
constant string SYMBOL_HANDLED	= "%"
constant string SYMBOL_ALL			= "*"
constant string SYMBOL_NS			= "."
constant string SYMBOL_NOT			= "^"
//Capture flags
constant long CAP_UNHANDLED = 0
constant long CAP_HANDLED	 = 1
constant long CAP_ALL		 = 2
//Priorities
constant long PRIORITY_LOW		= -2147483648
constant long PRIORITY_NORMAL	= 0
constant long PRIORITY_HIGH	= 2147483647
//Modifications
constant long MOD_OFF		= 1
constant long MOD_DISABLE	= 2
//Prevent flags
constant long PREVENT_ONCE = 1
constant long PREVENT_DEEP = 2
end variables

forward prototypes
public function long of_off (readonly powerobject object, readonly string evtname)
public function long of_off (readonly powerobject object)
public function long of_off ()
public function any of_trigger (readonly string name)
public function any of_trigger (readonly string name, readonly any param1)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8, readonly any param9)
public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8, readonly any param9, readonly any param10)
public function long of_on (readonly string name, readonly powerobject object, readonly string evtname)
public function long of_on (readonly string name, readonly powerobject object, readonly string evtname, readonly string evtsign)
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
public function long of_setdefaultreturnvalue (readonly string name, readonly any value)
public function long of_setdefaultreturnvalue (readonly any value)
private function any _of_getdefaultreturnvalue (readonly string name)
public function long of_off (readonly powerobject object, readonly boolean excluding)
private subroutine _of_collect ()
private function boolean _of_passargs (readonly string name, readonly powerobject target, readonly n_scriptinvoker invoker, readonly any params[])
public function any of_getreturnvalue ()
public function boolean of_isprocessed ()
public function long of_off (readonly string name, readonly powerobject object, readonly string evtname)
public function long of_off (readonly string name)
public function boolean of_ispost ()
public function long of_off (readonly string name, readonly powerobject object)
public function boolean of_issubscribed (readonly string name)
private function any _of_trigger (readonly string name, readonly any params[], readonly boolean ispost)
private function string _of_getobjectclasschain (readonly powerobject object)
private function long _of_modify (string name, readonly powerobject object, string evtname, readonly boolean excluding, readonly long mod, readonly boolean val)
public function long of_disable (readonly string name, readonly powerobject object, readonly string evtname, readonly boolean disabled)
public function long of_disable (readonly string name, readonly powerobject object, readonly boolean disabled)
public function long of_disable (readonly string name, readonly boolean disabled)
public function long of_disable (readonly powerobject object, readonly string evtname, readonly boolean disabled)
public function long of_disable (readonly powerobject object, readonly boolean disabled)
public function long of_disable (readonly boolean disabled)
public function long of_disable (readonly powerobject object, readonly boolean disabled, readonly boolean excluding)
private function string _of_alignstring (readonly string align, string str)
public function long of_prevent (readonly boolean deep)
public function long of_prevent ()
end prototypes

public function long of_off (readonly powerobject object, readonly string evtname);//====================================================================
// Function: of_off()
//--------------------------------------------------------------------
// Description: 移除指定订阅事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	powerobject	object 	
// 	readonly	string     	evtname	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _of_Modify("",object,evtName,false,MOD_OFF,true)
end function

public function long of_off (readonly powerobject object);//====================================================================
// Function: of_off()
//--------------------------------------------------------------------
// Description: 移除指定对象订阅的所有事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	powerobject	object	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _of_Modify("",object,"",false,MOD_OFF,true)
end function

public function long of_off ();//====================================================================
// Function: of_off()
//--------------------------------------------------------------------
// Description: 移除所有订阅的事件
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
powerobject nullObj
SetNull(nullObj)
return _of_Modify("",nullObj,"",false,MOD_OFF,true)
end function

public function any of_trigger (readonly string name);any emptyParams[]
return _of_Trigger(name,emptyParams,false)
end function

public function any of_trigger (readonly string name, readonly any param1);return _of_Trigger(name,{param1},false)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2);return _of_Trigger(name,{param1,param2},false)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3);return _of_Trigger(name,{param1,param2,param3},false)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4);return _of_Trigger(name,{param1,param2,param3,param4},false)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5);return _of_Trigger(name,{param1,param2,param3,param4,param5},false)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6);return _of_Trigger(name,{param1,param2,param3,param4,param5,param6},false)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7);return _of_Trigger(name,{param1,param2,param3,param4,param5,param6,param7},false)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8);return _of_Trigger(name,{param1,param2,param3,param4,param5,param6,param7,param8},false)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8, readonly any param9);return _of_Trigger(name,{param1,param2,param3,param4,param5,param6,param7,param8,param9},false)
end function

public function any of_trigger (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8, readonly any param9, readonly any param10);return _of_Trigger(name,{param1,param2,param3,param4,param5,param6,param7,param8,param9,param10},false)
end function

public function long of_on (readonly string name, readonly powerobject object, readonly string evtname);//====================================================================
// Function: of_on()
//--------------------------------------------------------------------
// Description: 订阅事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string     	name   	事件符号名称
//													'-'开头表示插入到相同优先级队列的头部
//													'+'开头表示添加到相同优先级队列的尾部（默认，可选）
//													'!'开头表示分发优先级为：高
//													'@'开头表示分发优先级为：低
//													[数字]+':'开头表示自定义优先级（数字越大优先级越高）
//												可以含有名称空间
//													[事件名]+'.'+[名称空间]
// 	readonly	powerobject	object 	回调对象
// 	readonly	string     	evtname	回调事件名称
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return of_On(name,object,evtName,"")
end function

public function long of_on (readonly string name, readonly powerobject object, readonly string evtname, readonly string evtsign);//====================================================================
// Function: of_on()
//--------------------------------------------------------------------
// Description: 订阅事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string     	name   	事件符号名称
//													'-'开头表示插入到相同优先级队列的头部（默认插入到尾部）
//													'!'开头表示最高分发优先级
//													'@'开头表示最低分发优先级
//													[数字]+':'开头表示自定义优先级（数字越大优先级越高）
//												事件捕获标志
//													'*'开头表示捕获所有处理状态的事件
//													'%'开头表示捕获已经处理的事件（被前面的订阅处理）
//													默认只捕获未被处理的事件
//												可以含有名称空间
//													[事件名]+'.'+[名称空间]
// 	readonly	powerobject	object 	回调对象
// 	readonly	string     	evtname	回调事件名称
//		readonly string		evtsign	事件签名（可选）
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int nIndex,nCount,nInsertIdx,nLen,nPos
string sVal
boolean bPrepend,bCollect
EVENTDATA newEvent

if name = "" or evtName = "" then return RetCode.E_INVALID_ARGUMENT
if Not IsValidObject(object) then return RetCode.E_INVALID_OBJECT

newEvent.priority = PRIORITY_NORMAL
newEvent.name = name
newEvent.evtName = Lower(evtName)
newEvent.object = object

nLen = Len(newEvent.name)
for nPos = 1 to nLen
	choose case Mid(newEvent.name,nPos,1)
		case SYMBOL_PREPEND
			if bPrepend then return RetCode.E_INVALID_ARGUMENT
			bPrepend = true
		case SYMBOL_HANDLED
			if newEvent.capture <> CAP_UNHANDLED then return RetCode.E_INVALID_ARGUMENT
			newEvent.capture = CAP_HANDLED
		case SYMBOL_ALL
			if newEvent.capture <> CAP_UNHANDLED then return RetCode.E_INVALID_ARGUMENT
			newEvent.capture = CAP_ALL
		case SYMBOL_LOW
			if newEvent.priority <> PRIORITY_NORMAL then return RetCode.E_INVALID_ARGUMENT
			newEvent.priority = PRIORITY_LOW
		case SYMBOL_HIGH
			if newEvent.priority <> PRIORITY_NORMAL then return RetCode.E_INVALID_ARGUMENT
			newEvent.priority = PRIORITY_HIGH
		case else
			exit
	end choose
next
if nPos > nLen then return RetCode.E_INVALID_ARGUMENT

newEvent.name = Mid(newEvent.name,nPos)

nPos = Pos(newEvent.name,SYMBOL_PRIO)
if nPos > 0 then
	sVal = Left(newEvent.name,nPos - 1)
	if IsNumber(sVal) then
		if newEvent.priority <> PRIORITY_NORMAL then return RetCode.E_INVALID_ARGUMENT
		newEvent.priority = Long(sVal)
		newEvent.name = Mid(newEvent.name,nPos + 1)
	end if
end if

nPos = Pos(newEvent.name,SYMBOL_NS)
if nPos > 0 then
	newEvent.ns = Mid(newEvent.name,nPos + 1)
	newEvent.name = Left(newEvent.name,nPos - 1)
	if newEvent.ns = "" then return RetCode.E_INVALID_ARGUMENT
end if
if newEvent.name = "" then return RetCode.E_INVALID_ARGUMENT

nCount = UpperBound(Events)

if _nDeep <= 0 then
	for nIndex = 1 to nCount
		if Not IsValidObject(Events[nIndex].object) then
			bCollect = true
			exit
		end if
	next
	if bCollect then
		_of_Collect()
		nCount = UpperBound(Events)
	end if
end if

newEvent.invoker = Create n_scriptinvoker
newEvent.mid = newEvent.invoker.Init(object,evtName,evtSign,ScriptEvent!)
if IsFailed(newEvent.mid) then
	Destroy newEvent.invoker
	return RetCode.E_EVENT_NOT_FOUND
end if
newEvent.invoker.Release()
newEvent.clsChain = _of_GetObjectClassChain(object)

for nIndex = 1 to nCount
	if Events[nIndex].name <> newEvent.name then
		if Events[nIndex].name > newEvent.name then
			nInsertIdx = nIndex
			exit
		end if
		continue
	end if
	nInsertIdx = nIndex
	if bPrepend then
		if Events[nIndex].priority <= newEvent.priority then exit
	else
		if Events[nIndex].priority < newEvent.priority then exit
	end if
	nInsertIdx++
next
if nInsertIdx > 0 then
	for nIndex = nCount + 1 to nInsertIdx + 1 step -1
		Events[nIndex] = Events[nIndex - 1]
	next
	if _nDeep > 0 then
		for nIndex = 1 to _nDeep
			if _nIdxStack[nIndex] >= nInsertIdx then
				_nIdxStack[nIndex] ++
			end if
		next
	end if
else
	nInsertIdx = nCount + 1
end if
Events[nInsertIdx] = newEvent

if _sFirstName > newEvent.name or _sFirstName = "" then _sFirstName = newEvent.name
if _sLastName < newEvent.name then _sLastName = newEvent.name

return RetCode.OK
end function

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8, readonly any param9, readonly any param10);Post _of_Trigger(name,{param1,param2,param3,param4,param5,param6,param7,param8,param9,param10},true)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8, readonly any param9);Post _of_Trigger(name,{param1,param2,param3,param4,param5,param6,param7,param8,param9},true)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7, readonly any param8);Post _of_Trigger(name,{param1,param2,param3,param4,param5,param6,param7,param8},true)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6, readonly any param7);Post _of_Trigger(name,{param1,param2,param3,param4,param5,param6,param7},true)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5, readonly any param6);Post _of_Trigger(name,{param1,param2,param3,param4,param5,param6},true)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4, readonly any param5);Post _of_Trigger(name,{param1,param2,param3,param4,param5},true)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3, readonly any param4);Post _of_Trigger(name,{param1,param2,param3,param4},true)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2, readonly any param3);Post _of_Trigger(name,{param1,param2,param3},true)
end subroutine

public subroutine of_post (readonly string name, readonly any param1, readonly any param2);Post _of_Trigger(name,{param1,param2},true)
end subroutine

public subroutine of_post (readonly string name, readonly any param1);Post _of_Trigger(name,{param1},true)
end subroutine

public subroutine of_post (readonly string name);any emptyParams[]
Post _of_Trigger(name,emptyParams,true)
end subroutine

public function long of_setdefaultreturnvalue (readonly string name, readonly any value);//====================================================================
// Function: of_setdefaultreturnvalue()
//--------------------------------------------------------------------
// Description: 设置指定事件的默认返回值（当事件未被处理或返回值为NULL时使用）
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	name	
// 	readonly	any   	value	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-07
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int nIndex,nCount
RETVALUEDATA valData

if _nDeep > 0 then return RetCode.FAILED
if name = "" then return RetCode.E_INVALID_ARGUMENT

valData.name = name

nCount = UpperBound(DefRetValues)
for nIndex = 1 to nCount
	if DefRetValues[nIndex].name = valData.name then
		DefRetValues[nIndex].value = value
		return RetCode.OK
	end if
next

valData.value = value
DefRetValues[nCount + 1] = valData

return RetCode.OK
end function

public function long of_setdefaultreturnvalue (readonly any value);//====================================================================
// Function: of_setdefaultreturnvalue()
//--------------------------------------------------------------------
// Description: 设置事件的默认返回值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	any	value	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-07
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if _nDeep > 0 then return RetCode.FAILED
_aDefRetVal = value
return RetCode.OK
end function

private function any _of_getdefaultreturnvalue (readonly string name);int nIndex,nCount

nCount = UpperBound(DefRetValues)
if nCount = 0 then return _aDefRetVal

for nIndex = 1 to nCount
	if DefRetValues[nIndex].name = name then
		return DefRetValues[nIndex].value
	end if
next

return _aDefRetVal
end function

public function long of_off (readonly powerobject object, readonly boolean excluding);//====================================================================
// Function: of_off()
//--------------------------------------------------------------------
// Description: 移除指定对象订阅的所有事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	powerobject	object	
// 	readonly	boolean		excluding 排除模式（移除指定对象之外的所有订阅事件）
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _of_Modify("",object,"",excluding,MOD_OFF,true)
end function

private subroutine _of_collect ();int nIndex,nCount
boolean bValid
EVENTDATA newEvents[]

if _nDeep > 0 then return

_sFirstName = ""
_sLastName = ""

nCount = UpperBound(Events)
for nIndex = 1 to nCount
	bValid = Not Events[nIndex].invalid
	if bValid then
		bValid = IsValidObject(Events[nIndex].object)
	end if
	if Not bValid then
		Destroy Events[nIndex].invoker
	else
		newEvents[UpperBound(newEvents) + 1] = Events[nIndex]
		if Not Events[nIndex].invalid and Not Events[nIndex].disabled then
			if _sFirstName = "" then _sFirstName = Events[nIndex].name
			_sLastName = Events[nIndex].name
		end if
	end if
next

Events = newEvents
end subroutine

private function boolean _of_passargs (readonly string name, readonly powerobject target, readonly n_scriptinvoker invoker, readonly any params[]);int nArgIdx,nArgCnt,nParmCnt

nArgCnt = invoker.GetArgCount()
if _bSubclassing then
	if IsPrevented(Event OnPrepare(name,target,invoker,nArgCnt,ref nArgIdx)) then return false
	if nArgIdx <= 0 then nArgIdx = 0
end if

nParmCnt = Min(nArgCnt - nArgIdx,UpperBound(params))
nArgIdx++
invoker.SetArgs(nArgIdx,params,1,nParmCnt)

return true
end function

public function any of_getreturnvalue ();//====================================================================
// Function: of_getreturnvalue()
//--------------------------------------------------------------------
// Description: 获取当前的事件分发过程的返回值（最近一次,of_IsProcessed返回true时有效）
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  any
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-08
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _aRetVal
end function

public function boolean of_isprocessed ();//====================================================================
// Function: of_isprocessed()
//--------------------------------------------------------------------
// Description: 判断当前的事件分发过程是否被处理过
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-08
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return Not IsNull(_aRetVal)
end function

public function long of_off (readonly string name, readonly powerobject object, readonly string evtname);//====================================================================
// Function: of_off()
//--------------------------------------------------------------------
// Description: 移除指定订阅事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string     	name   	
// 	readonly	powerobject	object 	
// 	readonly	string     	evtname	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _of_Modify(name,object,evtName,false,MOD_OFF,true)
end function

public function long of_off (readonly string name);//====================================================================
// Function: of_off()
//--------------------------------------------------------------------
// Description: 移除指定事件名称的所有订阅事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	name	移除指定名称空间下所有订阅的事件：[事件名]+'.'+[名称空间]（[事件名]可选）
//										'^'开头为排除指定名称:
//											'^'+[事件名]
//											'.'+'^'+[名称空间]
//											'^'+[事件名]+'.'+'^'+[名称空间]
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
powerobject nullObject
SetNull(nullObject)
return _of_Modify(name,nullObject,"",false,MOD_OFF,true)
end function

public function boolean of_ispost ();//====================================================================
// Function: of_ispost()
//--------------------------------------------------------------------
// Description: 判断当前的事件是否为POST调用
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-08
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _bIsPost
end function

public function long of_off (readonly string name, readonly powerobject object);//====================================================================
// Function: of_off()
//--------------------------------------------------------------------
// Description: 移除指定订阅事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string     	name   	
// 	readonly	powerobject	object 	
// 	readonly	string     	evtname	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _of_Modify(name,object,"",false,MOD_OFF,true)
end function

public function boolean of_issubscribed (readonly string name);//====================================================================
// Function: of_issubscribed()
//--------------------------------------------------------------------
// Description: 检查是否有指定的订阅事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	name	
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int nIndex,nCount

if name = "" then return false
if name = _sFirstName then return true
if name = _sLastName then return true
if name < _sFirstName then return false
if name > _sLastName then return false

nCount = UpperBound(Events)
if nCount = 0 then return false

for nIndex = 2 to nCount - 1
	if Events[nIndex].invalid then continue
	if Events[nIndex].disabled then continue
	if Events[nIndex].name = name then return true
	if Events[nIndex].name > name then return false
next

return false
end function

private function any _of_trigger (readonly string name, readonly any params[], readonly boolean ispost);int nIndex,nCount,nIdxStart
long nDeep,nPrevent,nCap = CAP_UNHANDLED
boolean bInvoking,bIsPost,bSubscribed,bCollect,bIsValid = true
string sThisClsName,sObjClsChain,sEvtName,sException
any aRetVal,aDefRetVal,aVal
powerobject objMsgParm
n_scriptinvoker invoker

if name = "" then return _aDefRetVal

aDefRetVal = _of_GetDefaultReturnValue(name)

if name < _sFirstName then return aDefRetVal
if name > _sLastName then return aDefRetVal

nIdxStart = 1
nCount = UpperBound(Events)
if nCount > 3 then
	if Events[nCount / 2].name < name then
		nIdxStart = nCount / 2 + 1
	end if
end if

nDeep = _nDeep
_nDeep++
bIsPost = _bIsPost
_bIsPost = isPost
nPrevent = _nPrevent
_nPrevent = 0

aRetVal = _aRetVal
SetNull(_aRetVal)
aVal = _aRetVal

try
	for _nIdxStack[_nDeep] = nIdxStart to UpperBound(Events)
		if Not bIsValid then exit
		if _nPrevent <> 0 then exit
		nIndex = _nIdxStack[_nDeep]
		if Events[nIndex].name <> name then
			if bSubscribed then exit
			if Events[nIndex].name > name then exit
			continue
		end if
		if Events[nIndex].invalid then continue
		if Events[nIndex].disabled then continue
		if Events[nIndex].capture <> nCap then
			if Events[nIndex].capture <> CAP_ALL then continue
		end if
		if Not IsValid(Events[nIndex].object) then
			bCollect = true
			continue
		end if
		if Not bSubscribed then
			if _bSubclassing then
				if IsPrevented(Event OnTriggering(name,isPost)) then
					exit
				end if
			end if
			bSubscribed = true
			sThisClsName = _sThisClsName
			objMsgParm = Message.PowerObjectParm
			Message.PowerObjectParm = this
		end if
		sObjClsChain = Events[nIndex].clsChain
		sEvtName = Events[nIndex].evtName
		bInvoking = Events[nIndex].invoking
		if bInvoking then
			invoker = Create n_scriptinvoker
		else
			invoker = Events[nIndex].invoker
		end if
		try
			SetNull(aVal)
			if invoker.Init(Events[nIndex].object,Events[nIndex].mid,ScriptEvent!) <> RetCode.OK then
				pfwThrowException("Invalid method")
			end if
			if Not _of_PassArgs(name,Events[nIndex].object,invoker,params) then
				continue
			end if
			Events[nIndex].invoking = true
			aVal = invoker.Invoke()
		catch(throwable ex)
			sException = ex.text
			bIsValid = IsValid(this)
			if bIsValid then
				if Not _bHasException then
					_bHasException = true
					if ClassName(ex) = "assertionfailed" then
						assertionfailed f
						f = ex
						sException = f.#Info + "~nStackTrace:~n" + f.#StackTraceInfo
					else
						sException = "[" + ClassName(ex) + "]~n" + sException
					end if
				end if
				sException = _of_AlignString("Exception: ~n",sException)
			end if
			ex.text = "Subscribe: " + name + "~n" +&
						"Target: " + sObjClsChain + "~n" +&
						"Event: " + sEvtName + "~n" +&
						"Exception: ~n" + sException
			if bIsValid then
				if _bSubclassing then
					choose case Event OnException(name,ex)
						case 1 //Prevent
							exit
						case 2 //Continue
							_bHasException = false
							continue
					end choose
				end if
			end if
			//Throw it
			if nDeep = 0 then
				ex.text = sThisClsName + "~n" + ex.text
			end if
			throw ex
		finally
			if bInvoking then Destroy invoker
			bIsValid = IsValid(this)
			if bIsValid then
				if Not bInvoking then invoker.Release()
				Events[nIndex].invoking = bInvoking
				if Not IsNull(aVal) then
					if nCap = CAP_UNHANDLED then
						try
							if IsNull(aDefRetVal) then
								nCap = CAP_HANDLED
							elseif ClassName(aDefRetVal) = "any" then
								nCap = CAP_HANDLED
							elseif aVal <> aDefRetVal then
								nCap = CAP_HANDLED
							end if
						catch(throwable ex3)
							nCap = CAP_HANDLED
						end try
						if nCap = CAP_HANDLED then
							_aRetVal = aVal
						end if
					else
						try
							if aVal <> aDefRetVal then
								_aRetVal = aVal
							end if
						catch(throwable ex4)
							_aRetVal = aVal
						end try
					end if
				end if
			end if
		end try
		if Not bIsValid then exit
	next
catch(throwable ex2)
	throw ex2
finally
	if bSubscribed then
		if bIsValid then
			if _bSubclassing then
				Event OnTriggered(name,isPost)
			end if
		end if
		Message.PowerObjectParm = objMsgParm
	end if
	if bIsValid then
		_aRetVal = aRetVal
		_nDeep = nDeep
		_bIsPost = bIsPost
		if nPrevent <> 0 then
			_nPrevent = nPrevent
		elseif _nPrevent = PREVENT_ONCE or _nDeep = 0 then
			_nPrevent = 0
		end if
		if _nDeep = 0 then
			_bHasException = false
		end if
		if bCollect then
			_of_Collect()
		end if
	end if
	if Not isPost then
		if IsNull(aVal) then
			aVal = aDefRetVal
		end if
	end if
end try

return aVal
end function

private function string _of_getobjectclasschain (readonly powerobject object);string sChain,sClsName
powerobject objectParent
classdefinition clsDef

if Not IsValidObject(object) then return ""

sChain = ClassName(object)
objectParent = object.GetParent()
do while(IsValid(objectParent))
	sClsName = ClassName(objectParent)
	sChain = sClsName + "/" + sChain
	objectParent = objectParent.GetParent()
loop

return sChain
end function

private function long _of_modify (string name, readonly powerobject object, string evtname, readonly boolean excluding, readonly long mod, readonly boolean val);int nIndex,nCount,nPos
string sNamespace
boolean bNoName,bNoNamespace,bNoEvtName,bNoObject,bNotName,bNotNamespace,bMatched,bDirty
EVENTDATA newEvents[]

evtName = Lower(evtName)

nPos = Pos(name,SYMBOL_NS)
if nPos > 0 then
	sNamespace = Mid(name,nPos + 1)
	name = Left(name,nPos - 1)
else
	bNoNamespace = true
end if

if Left(name,1) = SYMBOL_NOT then
	bNotName = true
	name = Mid(name,2)
end if
if Left(sNamespace,1) = SYMBOL_NOT then
	bNotNamespace = true
	sNamespace = Mid(sNamespace,2)
end if

bNoName = (name = "")
bNoObject = IsNull(object)
bNoEvtName = (evtName = "")

if bNotName then
	if bNoName then return RetCode.E_INVALID_ARGUMENT
end if

_sFirstName = ""
_sLastName = ""

nCount = UpperBound(Events)
for nIndex = 1 to nCount
	bMatched = bNoName
	if Not bMatched then
		if bNotName then
			bMatched = (Events[nIndex].name <> name)
		else
			bMatched = (Events[nIndex].name = name)
		end if
	end if
	if bMatched and Not bNoNamespace then
		if bNotNamespace then
			bMatched = (Events[nIndex].ns <> sNamespace)
		else
			bMatched = (Events[nIndex].ns = sNamespace)
		end if
	end if
	if bMatched and Not bNoObject then
		bMatched = (Events[nIndex].object = object)
	end if
	if bMatched and Not bNoEvtName then
		bMatched = (Events[nIndex].evtName = evtName)
	end if
	if excluding then
		bMatched = Not bMatched
	end if
	if mod = MOD_OFF then
		if _nDeep > 0 then
			if bMatched then
				Events[nIndex].invalid = true
				bDirty = true
			end if
		else
			if bMatched then
				Destroy Events[nIndex].invoker
				bDirty = true
			else
				newEvents[UpperBound(newEvents) + 1] = Events[nIndex]
			end if
		end if
	elseif mod = MOD_DISABLE then
		if bMatched then
			Events[nIndex].disabled = val
		end if
	end if
	if Not bMatched or mod = MOD_DISABLE then
		if Not Events[nIndex].invalid and Not Events[nIndex].disabled then
			if _sFirstName = "" then _sFirstName = Events[nIndex].name
			_sLastName = Events[nIndex].name
		end if
	end if
next

if bDirty then
	if _nDeep > 0 then
		Post _of_Collect()
	else
		Events = newEvents
	end if
end if

return RetCode.OK
end function

public function long of_disable (readonly string name, readonly powerobject object, readonly string evtname, readonly boolean disabled);//====================================================================
// Function: of_disable()
//--------------------------------------------------------------------
// Description: 禁用指定订阅事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string     	name   	
// 	readonly	powerobject	object 	
// 	readonly	string     	evtname	
// 	readonly	boolean    	disabled	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _of_Modify(name,object,evtName,false,MOD_DISABLE,disabled)
end function

public function long of_disable (readonly string name, readonly powerobject object, readonly boolean disabled);//====================================================================
// Function: of_disable()
//--------------------------------------------------------------------
// Description: 禁用指定订阅事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string     	name   	
// 	readonly	powerobject	object 	
// 	readonly	string     	evtname	
// 	readonly	boolean    	disabled	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _of_Modify(name,object,"",false,MOD_DISABLE,disabled)
end function

public function long of_disable (readonly string name, readonly boolean disabled);//====================================================================
// Function: of_disable()
//--------------------------------------------------------------------
// Description: 禁用指定事件名称的所有订阅事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	name	禁用指定名称空间下所有订阅的事件：[事件名]+'.'+[名称空间]（[事件名]可选）
//										'^'开头为排除指定名称:
//											'^'+[事件名]
//											'.'+'^'+[名称空间]
//											'^'+[事件名]+'.'+'^'+[名称空间]
// 	readonly	boolean 	disabled	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
powerobject nullObject
SetNull(nullObject)
return _of_Modify(name,nullObject,"",false,MOD_DISABLE,disabled)
end function

public function long of_disable (readonly powerobject object, readonly string evtname, readonly boolean disabled);//====================================================================
// Function: of_disable()
//--------------------------------------------------------------------
// Description: 禁用指定订阅事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	powerobject	object 	
// 	readonly	string     	evtname	
// 	readonly	boolean    	disabled	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _of_Modify("",object,evtName,false,MOD_DISABLE,disabled)
end function

public function long of_disable (readonly powerobject object, readonly boolean disabled);//====================================================================
// Function: of_disabled()
//--------------------------------------------------------------------
// Description: 禁用指定对象订阅的所有事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	powerobject	object	
// 	readonly	boolean    	disabled	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _of_Modify("",object,"",false,MOD_DISABLE,disabled)
end function

public function long of_disable (readonly boolean disabled);//====================================================================
// Function: of_disable()
//--------------------------------------------------------------------
// Description: 禁用所有订阅的事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	boolean    	disabled	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
powerobject nullObj
SetNull(nullObj)
return _of_Modify("",nullObj,"",false,MOD_DISABLE,disabled)
end function

public function long of_disable (readonly powerobject object, readonly boolean disabled, readonly boolean excluding);//====================================================================
// Function: of_disable()
//--------------------------------------------------------------------
// Description: 禁用指定对象订阅的所有事件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	powerobject	object	
// 	readonly	boolean    	disabled	
// 	readonly	boolean		excluding 排除模式（禁用指定对象之外的所有订阅事件）
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-06
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _of_Modify("",object,"",excluding,MOD_DISABLE,disabled)
end function

private function string _of_alignstring (readonly string align, string str);long nPos
string sRet,sSpaces

sSpaces = Fill(" ",Len(align) / 2)
if Right(align,1) = "~n" then
	sRet = sSpaces
end if

do 
	nPos = Pos(str,"~n")
	if nPos <= 0 then
		sRet += str
		exit
	end if
	sRet += Left(str,nPos)
	str = Mid(str,nPos + 1)
	if str <> "" then
		sRet += sSpaces
	end if
loop while (true)

return sRet
end function

public function long of_prevent (readonly boolean deep);//====================================================================
// Function: of_prevent()
//--------------------------------------------------------------------
// Description: 阻止当前的事件分发过程
//--------------------------------------------------------------------
// Arguments:
//		readonly boolean deep 为true时阻止整个分发调用链（整个调用深度）
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-05-08
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if _nDeep <= 0 then return RetCode.FAILED
if deep then 
	_nPrevent = PREVENT_DEEP
else
	_nPrevent = PREVENT_ONCE
end if
return RetCode.OK
end function

public function long of_prevent ();return of_Prevent(false)
end function

on n_cst_eventful.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_eventful.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;int nIndex,nCount

nCount = UpperBound(Events)
for nIndex = 1 to nCount
	Destroy Events[nIndex].invoker
next
end event

event constructor;_sThisClsName = ClassName(this)
_bSubclassing = (_sThisClsName <> "n_cst_eventful")
SetNull(_aDefRetVal)
_aRetVal = _aDefRetVal
end event

