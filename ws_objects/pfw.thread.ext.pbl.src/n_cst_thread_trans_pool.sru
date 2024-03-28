$PBExportHeader$n_cst_thread_trans_pool.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_thread_trans_pool from nonvisualobject
end type
type sharedtransactiondata from structure within n_cst_thread_trans_pool
end type
end forward

type sharedtransactiondata from structure
	transactiondata		transdata
	n_cst_thread_trans		transobject
	unsignedlong		refcount
	unsignedlong		idlestarttime
end type

shared variables

end variables

global type n_cst_thread_trans_pool from nonvisualobject
event onidle ( n_cst_thread thread )
event oninit ( n_cst_thread parentthread )
event type string ongettransclsname ( )
end type
global n_cst_thread_trans_pool n_cst_thread_trans_pool

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
private:
constant long KEEPALIVE_EXPIRE = 30000 //ms

SHAREDTRANSACTIONDATA _transactions[]

string _sTransCls
boolean _bKeepAlive
ulong _nKeepAliveExpireTime = KEEPALIVE_EXPIRE

end variables

forward prototypes
public function long of_removeref (readonly integer refindex)
public function long of_release (readonly integer refindex, ref n_cst_thread_trans transobject)
public function integer of_addref (readonly transactiondata transdata)
public function long of_get (readonly integer refindex, ref n_cst_thread_trans transobject)
public function boolean of_exists (readonly transactiondata transdata)
public function long of_removeall (readonly boolean force)
end prototypes

event onidle(n_cst_thread thread);int index,nCount
SHAREDTRANSACTIONDATA NewTransactions[]

nCount = UpperBound(_transactions)
for index = 1 to nCount
	if _transactions[index].refCount <= 0 and CPU() - _transactions[index].idleStartTime >= _nKeepAliveExpireTime then
		if IsValidObject(_transactions[index].TransObject) then
			_transactions[index].TransObject.of_Rollback()
			_transactions[index].TransObject.of_Disconnect()
			Destroy _transactions[index].TransObject
		end if
	else
		NewTransactions[UpperBound(NewTransactions) + 1] = _transactions[index]
	end if
next
_transactions = NewTransactions

end event

event oninit(n_cst_thread parentthread);if parentThread.#ParentThreading.of_GetDataBoolean("$SQL.TransPool.KeepAlive") then
	_bKeepAlive = true
	_nKeepAliveExpireTime = parentThread.#ParentThreading.of_GetDataDouble("$SQL.TransPool.KeepAliveExpireTime") * 1000
	if _nKeepAliveExpireTime <= 0 then _nKeepAliveExpireTime = KEEPALIVE_EXPIRE
	parentThread.of_On(parentThread.EVT_IDLE,this,"onidle")
end if
_sTransCls = Event OnGetTransClsName()
if IsNull(_sTransCls) or _sTransCls = "" then _sTransCls = parentThread.#ParentThreading.of_GetDataString("$SQL.TransPool.TransClass")
end event

public function long of_removeref (readonly integer refindex);int index,nCount
SHAREDTRANSACTIONDATA NewTransactions[]

if refIndex <= 0 or refIndex > UpperBound(_transactions) then return RetCode.E_OUT_OF_BOUND

_transactions[refIndex].refCount --

//移除并释放连接
if _transactions[refIndex].refCount <= 0 then
	if _bKeepAlive and IsValidObject(_transactions[refIndex].TransObject) then
		if Not _transactions[refIndex].TransObject.of_IsBroken() then
			_transactions[refIndex].idleStartTime = CPU()
			return RetCode.OK
		end if
	end if
	nCount = UpperBound(_transactions)
	for index = 1 to nCount
		if index = refIndex then
			if IsValidObject(_transactions[index].TransObject) then
				if Not _transactions[index].TransObject.of_IsBroken() then
					_transactions[index].TransObject.of_Rollback()
					_transactions[index].TransObject.of_Disconnect()
				end if
				Destroy _transactions[index].TransObject
			end if
		else
			NewTransactions[UpperBound(NewTransactions) + 1] = _transactions[index]
		end if
	next
	_transactions = NewTransactions
end if

return RetCode.OK
end function

public function long of_release (readonly integer refindex, ref n_cst_thread_trans transobject);if refIndex <= 0 or refIndex > UpperBound(_transactions) then return RetCode.E_OUT_OF_BOUND
if Not IsValidObject(TransObject) then return RetCode.E_INVALID_OBJECT

if _transactions[refIndex].refCount = 1 then
	//释放连接
	TransObject.of_Rollback()
	TransObject.of_Disconnect()
end if

TransObject.of_ClearState()
SetNull(TransObject)

return RetCode.OK
end function

public function integer of_addref (readonly transactiondata transdata);int index,nCount,nRefIdx

nCount = UpperBound(_transactions)
for index = 1 to nCount
	if _transactions[index].TransData = TransData then
		nRefIdx = index
		exit
	end if
next
if nRefIdx <= 0 then
	nRefIdx = nCount + 1
	_transactions[nRefIdx].TransData = TransData
end if

_transactions[nRefIdx].refCount ++
_transactions[nRefIdx].idleStartTime = 0

return nRefIdx
end function

public function long of_get (readonly integer refindex, ref n_cst_thread_trans transobject);if refIndex <= 0 or refIndex > UpperBound(_transactions) then return RetCode.E_OUT_OF_BOUND

try
	//初始化连接
	if IsValidObject(_transactions[refIndex].TransObject) then
		if Not _transactions[refIndex].TransObject.of_IsBroken() then
			TransObject = _transactions[refIndex].TransObject
			TransObject.of_ClearState()
			return RetCode.OK
		end if
		Destroy _transactions[refIndex].TransObject
	end if
	if _sTransCls <> "" then
		_transactions[refIndex].TransObject = Create Using _sTransCls
	else
		_transactions[refIndex].TransObject = Create n_cst_thread_trans
	end if
	_transactions[refIndex].TransObject.of_SetTransData(_transactions[refIndex].TransData)
	TransObject = _transactions[refIndex].TransObject
catch(throwable ex)
	return RetCode.E_INVALID_OBJECT
end try

return RetCode.OK
end function

public function boolean of_exists (readonly transactiondata transdata);int index,nCount

nCount = UpperBound(_transactions)
for index = 1 to nCount
	if _transactions[index].TransData = TransData then return true
next

return false
end function

public function long of_removeall (readonly boolean force);int index,nCount
SHAREDTRANSACTIONDATA NewTransactions[]

nCount = UpperBound(_transactions)
for index = 1 to nCount
	if _transactions[index].refCount <= 0 or force then
		if IsValidObject(_transactions[index].TransObject) then
			_transactions[index].TransObject.of_Rollback()
			_transactions[index].TransObject.of_Disconnect()
			Destroy _transactions[index].TransObject
		end if
	else
		NewTransactions[UpperBound(NewTransactions) + 1] = _transactions[index]
	end if
next

_transactions = NewTransactions

return RetCode.OK
end function

on n_cst_thread_trans_pool.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_thread_trans_pool.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;of_RemoveAll(true)
end event

