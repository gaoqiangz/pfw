$PBExportHeader$n_cst_alipay_response.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_alipay_response from nonvisualobject
end type
end forward

global type n_cst_alipay_response from nonvisualobject
event oninit ( n_cst_alipay alipay,  n_httpresponse rsp,  string errorinfo )
end type
global n_cst_alipay_response n_cst_alipay_response

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

/*--- Constants ---*/
Public:
//状态码
Constant Long STATUS_SUCCESS		= 0	//业务处理成功 (of_GetResult为服务器返回的数据)
Constant Long STATUS_FAILED 		= -1	//业务处理失败 (of_GetResult为服务器返回的数据)
Constant Long STATUS_ERROR 		= -2	//请求失败或业务接口发生错误 (of_GetErrorInfo获取错误信息,of_GetHttpResponse获取http原始响应数据)
Constant Long STATUS_CANCELLED 	= -3	//请求被取消

/*--- Implementation ---*/
Private:
n_httpresponse _rsp
n_json _jsonResult
string _errorInfo
long _status = STATUS_ERROR
end variables

forward prototypes
public function n_json of_getresult ()
public function long of_getstatus ()
public function boolean of_isfailed ()
public function boolean of_iserror ()
public function string of_geterrorinfo ()
public function n_httpresponse of_gethttpresponse ()
public function boolean of_issuccess ()
public function boolean of_iscancelled ()
end prototypes

event oninit(n_cst_alipay alipay, n_httpresponse rsp, string errorinfo);int nIndex,nCount
string ls_key
n_json jsonData

if IsValidObject(rsp) then
	if rsp.IsValid() then
		jsonData = Create n_json
		jsonData.Parse(rsp.GetDataString())
		if Not jsonData.IsEmpty() then
			nCount = jsonData.GetItemCount()
			for nIndex = 1 to nCount
				ls_key = jsonData.GetItemName(nIndex)
				if Right(ls_key,9) = "_response" then
					_jsonResult = jsonData.GetItem(nIndex).Duplicate()
					exit
				end if
			next
			if IsValidObject(_jsonResult) then
				if alipay._of_VerifySign(_jsonResult,jsonData.GetItemString("sign")) then
					if Not _jsonResult.HasItem("sub_code") then
						_status = STATUS_SUCCESS
					elseif Lower(Left(_jsonResult.GetItemString("sub_code"),3)) = "acq" then
						_status = STATUS_FAILED
						errorInfo = _jsonResult.GetItemString("sub_msg")
					else
						errorInfo = _jsonResult.GetItemString("sub_msg")
					end if
				else
					errorInfo = "签名验证失败"
				end if
			else
				errorInfo = "无效的响应数据"
			end if
		else
			errorInfo = "解析JSON数据失败"
		end if
		Destroy jsonData
	elseif rsp.IsCancelled() then
		_status = STATUS_CANCELLED
	else
		if errorInfo = "" then errorInfo = "无效的响应数据"
	end if
end if

_rsp = rsp
_errorInfo = errorInfo
end event

public function n_json of_getresult ();if Not IsValidObject(_jsonResult) then
	_jsonResult = Create n_json
end if
return _jsonResult
end function

public function long of_getstatus ();return _status
end function

public function boolean of_isfailed ();return (_status <> STATUS_SUCCESS)
end function

public function boolean of_iserror ();return (_status = STATUS_ERROR)
end function

public function string of_geterrorinfo ();return _errorInfo
end function

public function n_httpresponse of_gethttpresponse ();if Not IsValidObject(_rsp) then
	_rsp = Create n_httpresponse
end if
return _rsp
end function

public function boolean of_issuccess ();return (_status = STATUS_SUCCESS)
end function

public function boolean of_iscancelled ();return (_status = STATUS_CANCELLED)
end function

on n_cst_alipay_response.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_alipay_response.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;SetNull(_jsonResult)
SetNull(_rsp)
end event

