$PBExportHeader$n_cst_alipay.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_alipay from nonvisualobject
end type
type httpclient from n_httpclient within n_cst_alipay
end type
end forward

global type n_cst_alipay from nonvisualobject
event onpaycomplete ( n_cst_alipay_response response )
event onquerycomplete ( n_cst_alipay_response response )
event oncancelcomplete ( n_cst_alipay_response response )
event onrefundcomplete ( n_cst_alipay_response response )
event onprecreatecomplete ( n_cst_alipay_response response )
httpclient httpclient
end type
global n_cst_alipay n_cst_alipay

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
//HttpClient async request IDs
Constant Long REQ_PAY 			= 100
Constant Long REQ_PRECREATE 	= 101
Constant Long REQ_QUERY 		= 102
Constant Long REQ_CANCEL 		= 103
Constant Long REQ_REFUND 		= 104

/*--- Properties ---*/
Public:
PrivateWrite String #AppID		//AppID
PrivateWrite String #PriKey	//商户私钥
PrivateWrite String #PubKey	//支付宝共钥
PrivateWrite String #SignType	//签名算法类型（RSA,RSA2）

/*--- Implementation ---*/
Private:
n_httputility _httpUtility
n_crypto _crypto

Constant String API_VERSION		= "1.0"
Constant String URL_MASTER			= "https://openapi.alipay.com/gateway.do"
Constant String METHOD_PAY			= "alipay.trade.pay"
Constant String METHOD_PRECREATE	= "alipay.trade.precreate"
Constant String METHOD_QUERY		= "alipay.trade.query"
Constant String METHOD_CANCEL		= "alipay.trade.cancel"
Constant String METHOD_REFUND		= "alipay.trade.refund"
Constant String CONTENT_TYPE 		= "application/x-www-form-urlencoded; charset=utf-8"
end variables

forward prototypes
public function long of_setappid (readonly string appid)
public function long of_setkey (readonly string prikey, readonly string pubkey)
private function boolean _of_makesign (readonly n_json data)
private function string _of_serialize (readonly n_json data)
public function n_cst_alipay_response of_pay (readonly n_json params)
private function string _of_checkrequiredparams (readonly n_json params, readonly string required[])
public function n_cst_alipay_response of_query (readonly n_json params)
public function n_cst_alipay_response of_cancel (readonly n_json params)
public function n_cst_alipay_response of_refund (readonly n_json params)
public function long of_payasync (readonly n_json params)
public function long of_queryasync (readonly n_json params)
public function long of_cancelasync (readonly n_json params)
public function long of_refundasync (readonly n_json params)
public function boolean _of_verifysign (readonly n_json data, readonly string sign)
private function boolean _of_getpostdata (readonly n_json params, readonly string method, ref blob data)
public function n_cst_alipay_response of_precreate (readonly n_json params)
public function long of_precreateasync (readonly n_json params)
public function long of_setsigntype (string stype)
private function long _of_gethashtype ()
end prototypes

public function long of_setappid (readonly string appid);if appID = "" then return RetCode.E_INVALID_ARGUMENT
#AppID = appid
return RetCode.OK
end function

public function long of_setkey (readonly string prikey, readonly string pubkey);if priKey = "" or pubKey = "" then return RetCode.E_INVALID_ARGUMENT
#PriKey = priKey
#PubKey = pubKey
return RetCode.OK
end function

private function boolean _of_makesign (readonly n_json data);int nIndex,nCount
string ls_key,ls_value,ls_signString
n_vector vecArray

data.SetItem("sign_type",#SignType)
nCount = data.GetItemCount()

vecArray = Create n_vector
vecArray.Reserve(nCount)

for nIndex = 1 to nCount
	vecArray.Append(data.GetItemName(nIndex))
next
vecArray.Sort( )
for nIndex = 1 to nCount
	ls_key = String(vecArray.GetAt(nIndex))
	choose case data.GetItemType(ls_key)
		case Enums.JSON_TYPE_BOOLEAN
			ls_value = String(data.GetItemBoolean(ls_key))
		case Enums.JSON_TYPE_NUMBER
			ls_value = String(Round(data.GetItemDouble(ls_key),2))
		case Enums.JSON_TYPE_STRING
			ls_value = data.GetItemString(ls_key)
		case Enums.JSON_TYPE_OBJECT,Enums.JSON_TYPE_ARRAY
			ls_value = _of_Serialize(data.GetItem(ls_key))
		case else
			ls_value = ""
	end choose
	if ls_value = "" then continue
	if ls_signString <> "" then ls_signString += "&"
	ls_signString += ls_key + "=" + ls_value
next

Destroy vecArray

if ls_signString = "" then return false

ls_signString = _crypto.BlobToString(_crypto.RSASign(_httpUtility.StringToBlob(ls_signString,Enums.HTTP_ENCODING_UTF8,true), #PriKey, _of_GetHashType()),Enums.CRYPTO_ENCODING_BASE64)
data.SetItem("sign",ls_signString)

return (ls_signString <> "")
end function

private function string _of_serialize (readonly n_json data);int nIndex,nCount
string ls_key,ls_value,ls_jsonString

nCount = data.GetItemCount()
if nCount = 0 then return ""

if data.GetType() = Enums.JSON_TYPE_OBJECT then
	for nIndex = 1 to nCount
		ls_key = data.GetItemName(nIndex)
		choose case data.GetItemType(nIndex)
			case Enums.JSON_TYPE_BOOLEAN
				ls_value = String(data.GetItemBoolean(nIndex))
			case Enums.JSON_TYPE_NUMBER
				ls_value = String(Round(data.GetItemDouble(nIndex),2))
			case Enums.JSON_TYPE_STRING
				if ls_key = "qr_code" then //特殊处理URL转义
					ls_value = "~"" + ReplaceAll(data.GetItemString(nIndex),"/","\/",true) + "~""
				else
					ls_value = "~"" + data.GetItemString(nIndex) + "~""
				end if
			case Enums.JSON_TYPE_OBJECT,Enums.JSON_TYPE_ARRAY
				ls_value = _of_Serialize(data.GetItem(nIndex))
			case else
				ls_value = ""
		end choose
		if ls_value = "" then continue
		if ls_jsonString <> "" then ls_jsonString += ","
		ls_jsonString += "~"" + ls_key + "~":" + ls_value
	next
	return "{" + ls_jsonString + "}"
else
	for nIndex = 1 to nCount
		choose case data.GetItemType(nIndex)
			case Enums.JSON_TYPE_BOOLEAN
				ls_value = String(data.GetItemBoolean(nIndex))
			case Enums.JSON_TYPE_NUMBER
				ls_value = String(Round(data.GetItemDouble(nIndex),2))
			case Enums.JSON_TYPE_STRING
				if ls_key = "qr_code" then //特殊处理URL转义
					ls_value = "~"" + ReplaceAll(data.GetItemString(nIndex),"/","\/",true) + "~""
				else
					ls_value = "~"" + data.GetItemString(nIndex) + "~""
				end if
			case Enums.JSON_TYPE_OBJECT,Enums.JSON_TYPE_ARRAY
				ls_value = _of_Serialize(data.GetItem(nIndex))
			case else
				ls_value = ""
		end choose
		if ls_value = "" then continue
		if ls_jsonString <> "" then ls_jsonString += ","
		ls_jsonString += ls_value
	next
	return "[" + ls_jsonString + "]"
end if
end function

public function n_cst_alipay_response of_pay (readonly n_json params);/*
	订单支付(https://doc.open.alipay.com/doc2/apiDetail.htm?spm=a219a.7395905.0.0.6TKhN0&docType=4&apiId=850)
		注:只支持条码支付!
	参数:
		params:
			--- 必填项 ---
			out_trade_no				String(64)	//商户订单号,64个字符以内、可包含字母、数字、下划线；需保证在商户端不重复
			subject						String(256)	//订单标题
			auth_code					String(32)	//支付授权码
			total_amount				Double		//订单总金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]。
			--- 可选项 ---
			discountable_amount		Double		//可打折金额，参与优惠计算的金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]。
			undiscountable_amount	Double		//不可打折金额，不参与优惠计算的金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]。
			body							String(128)  //订单描述
			operator_id					String(28)	//商户操作员编号
			store_id 						String(32)	//商户门店编号
			terminal_id 					String(32)	//商户机具终端编号
			alipay_store_id				String(32)	//支付宝的店铺编号
			timeout_express			String(6)		//该笔订单允许的最晚付款时间，逾期将关闭交易。
															//取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。 
															//该参数数值不接受小数点， 如 1.5h，可转换为 90m
			goods_detail           		 JSON Array	//订单包含的商品列表信息，Json格式，其它说明详见商品明细说明(见链接中的接口说明!)
			extend_params				JSON			//业务扩展参数(见链接中的接口说明!)
			royalty_info					JSON			//描述分账信息，Json格式，其它说明详见分账说明(见链接中的接口说明!)
*/
blob blbData
string ls_ret,ls_requiredParams[] = {"out_trade_no","subject","auth_code","total_amount"}
n_httpresponse httpResponse
n_cst_alipay_response rsp

rsp = Create n_cst_alipay_response

if Not IsValidObject(params) then
	rsp.Event OnInit(this,httpResponse,"无效参数")
	return rsp
end if
ls_ret = _of_CheckRequiredParams(params,ls_requiredParams)
if ls_ret <> "" then
	rsp.Event OnInit(this,httpResponse,"缺少必填项[" + ls_ret + "]")
	return rsp
end if
if Not params.HasItem("discountable_amount") then
	params.SetItem("discountable_amount",0)
end if
if Not params.HasItem("undiscountable_amount") then
	params.SetItem("undiscountable_amount",params.GetItemDouble("total_amount") - params.GetItemDouble("discountable_amount"))
end if
if params.GetItemDouble("total_amount") <> params.GetItemDouble("discountable_amount") + params.GetItemDouble("undiscountable_amount") then
	rsp.Event OnInit(this,httpResponse,"[total_amount]不等于[discountable_amount]与[undiscountable_amount]之和")
	return rsp
end if

//只支持条码支付
params.SetItem("scene","bar_code")

if Not _of_GetPostData(params,METHOD_PAY,ref blbData) then
	rsp.Event OnInit(this,httpResponse,"数据签名失败")
	return rsp
end if

httpResponse = httpClient.Request("POST",blbData,CONTENT_TYPE)
rsp.Event OnInit(this,httpResponse,httpResponse.GetErrorInfo())

return rsp
end function

private function string _of_checkrequiredparams (readonly n_json params, readonly string required[]);int nIndex,nCount

nCount = UpperBound(required)
for nIndex = 1 to nCount
	if Not params.HasItem(required[nIndex]) then return required[nIndex]
next

return ""
end function

public function n_cst_alipay_response of_query (readonly n_json params);/*
	订单查询(https://doc.open.alipay.com/doc2/apiDetail.htm?spm=a219a.7395905.0.0.A8Jj0g&docType=4&apiId=757)
	参数:
		params:
			--- 必填项 ---
					  --- out_trade_no	String(64)	//原支付请求的商户订单号,和支付宝交易号不能同时为空
			二选一 |
					  --- trade_no		String(64)	//支付宝交易号，和商户订单号不能同时为空
*/
blob blbData
n_httpresponse httpResponse
n_cst_alipay_response rsp

rsp = Create n_cst_alipay_response

if Not IsValidObject(params) then
	rsp.Event OnInit(this,httpResponse,"无效参数")
	return rsp
end if
if Not params.HasItem("out_trade_no") and Not params.HasItem("trade_no") then
	rsp.Event OnInit(this,httpResponse,"缺少必填项")
	return rsp
end if

if Not _of_GetPostData(params,METHOD_QUERY,ref blbData) then
	rsp.Event OnInit(this,httpResponse,"数据签名失败")
	return rsp
end if

httpResponse = httpClient.Request("POST",blbData,CONTENT_TYPE)
rsp.Event OnInit(this,httpResponse,httpResponse.GetErrorInfo())

return rsp
end function

public function n_cst_alipay_response of_cancel (readonly n_json params);/*
	撤销订单(https://doc.open.alipay.com/doc2/apiDetail.htm?spm=a219a.7395905.0.0.TzehIe&docType=4&apiId=866)
	参数:
		params:
			--- 必填项 ---
					  --- out_trade_no	String(64)	//原支付请求的商户订单号,和支付宝交易号不能同时为空
			二选一 |
					  --- trade_no			String(64)	//支付宝交易号，和商户订单号不能同时为空
*/
blob blbData
n_httpresponse httpResponse
n_cst_alipay_response rsp

rsp = Create n_cst_alipay_response

if Not IsValidObject(params) then
	rsp.Event OnInit(this,httpResponse,"无效参数")
	return rsp
end if
if Not params.HasItem("out_trade_no") and Not params.HasItem("trade_no") then
	rsp.Event OnInit(this,httpResponse,"缺少必填项")
	return rsp
end if

if Not _of_GetPostData(params,METHOD_CANCEL,ref blbData) then
	rsp.Event OnInit(this,httpResponse,"数据签名失败")
	return rsp
end if

httpResponse = httpClient.Request("POST","",blbData,CONTENT_TYPE)
rsp.Event OnInit(this,httpResponse,httpResponse.GetErrorInfo())

return rsp
end function

public function n_cst_alipay_response of_refund (readonly n_json params);/*
	申请退款(https://doc.open.alipay.com/doc2/apiDetail.htm?spm=a219a.7395905.0.0.MLCAYU&docType=4&apiId=759)
	参数:
		params:
			--- 必填项 ---
					  --- out_trade_no		String(64)	//原支付请求的商户订单号,和支付宝交易号不能同时为空
			二选一 |
					  --- trade_no			String(64)	//支付宝交易号，和商户订单号不能同时为空
			refund_amount					Double		//需要退款的金额，该金额不能大于订单金额,单位为元，支持两位小数
			条件选择 out_request_no 	String(64)	//标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传。
			--- 可选项 ---
			refund_reason 					String(256) //退款的原因说明
			operator_id  					String(30)	//商户的操作员编号
			store_id   						String(32)	//商户的门店编号
			terminal_id    					String(32)	//商户的终端编号
*/
blob blbData
n_httpresponse httpResponse
n_cst_alipay_response rsp

rsp = Create n_cst_alipay_response

if Not IsValidObject(params) then
	rsp.Event OnInit(this,httpResponse,"无效参数")
	return rsp
end if
if (Not params.HasItem("out_trade_no") and Not params.HasItem("trade_no")) or Not params.HasItem("refund_amount") then
	rsp.Event OnInit(this,httpResponse,"缺少必填项")
	return rsp
end if

if Not _of_GetPostData(params,METHOD_REFUND,ref blbData) then
	rsp.Event OnInit(this,httpResponse,"数据签名失败")
	return rsp
end if

httpResponse = httpClient.Request("POST",blbData,CONTENT_TYPE)
rsp.Event OnInit(this,httpResponse,httpResponse.GetErrorInfo())

return rsp
end function

public function long of_payasync (readonly n_json params);/*
	异步订单支付(https://doc.open.alipay.com/doc2/apiDetail.htm?spm=a219a.7395905.0.0.6TKhN0&docType=4&apiId=850)
		注:只支持条码支付!
	参数:
		params:
			--- 必填项 ---
			out_trade_no				String(64)	//商户订单号,64个字符以内、可包含字母、数字、下划线；需保证在商户端不重复
			subject						String(256)	//订单标题
			auth_code					String(32)	//支付授权码
			total_amount				Double		//订单总金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]。
			--- 可选项 ---
			discountable_amount		Double		//可打折金额，参与优惠计算的金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]。
			undiscountable_amount	Double		//不可打折金额，不参与优惠计算的金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]。
			body							String(128)  //订单描述
			operator_id					String(28)	//商户操作员编号
			store_id 						String(32)	//商户门店编号
			terminal_id 					String(32)	//商户机具终端编号
			alipay_store_id				String(32)	//支付宝的店铺编号
			timeout_express			String(6)		//该笔订单允许的最晚付款时间，逾期将关闭交易。
															//取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。 
															//该参数数值不接受小数点， 如 1.5h，可转换为 90m
			goods_detail           		 JSON Array	//订单包含的商品列表信息，Json格式，其它说明详见商品明细说明(见链接中的接口说明!)
			extend_params				JSON			//业务扩展参数(见链接中的接口说明!)
			royalty_info					JSON			//描述分账信息，Json格式，其它说明详见分账说明(见链接中的接口说明!)
	事件:
	OnPayComplete(n_cst_alipay_response)
*/
blob blbData
string ls_requiredParams[] = {"out_trade_no","subject","auth_code","total_amount"}

if httpClient.HasRequest(REQ_PAY) then return RetCode.E_BUSY
if Not IsValidObject(params) then return RetCode.E_INVALID_ARGUMENT
if _of_CheckRequiredParams(params,ls_requiredParams) <> "" then return RetCode.E_INVALID_ARGUMENT

if Not params.HasItem("discountable_amount") then
	params.SetItem("discountable_amount",0)
end if
if Not params.HasItem("undiscountable_amount") then
	params.SetItem("undiscountable_amount",params.GetItemDouble("total_amount") - params.GetItemDouble("discountable_amount"))
end if
if params.GetItemDouble("total_amount") <> params.GetItemDouble("discountable_amount") + params.GetItemDouble("undiscountable_amount") then return RetCode.E_INVALID_ARGUMENT

//只支持条码支付
params.SetItem("scene","bar_code")

if Not _of_GetPostData(params,METHOD_PAY,ref blbData) then return RetCode.E_INVALID_ARGUMENT

return httpClient.Request(REQ_PAY,"POST",blbData,CONTENT_TYPE)
end function

public function long of_queryasync (readonly n_json params);/*
	异步订单查询(https://doc.open.alipay.com/doc2/apiDetail.htm?spm=a219a.7395905.0.0.A8Jj0g&docType=4&apiId=757)
	参数:
		params:
			--- 必填项 ---
					  --- out_trade_no	String(64)	//原支付请求的商户订单号,和支付宝交易号不能同时为空
			二选一 |
					  --- trade_no		String(64)	//支付宝交易号，和商户订单号不能同时为空
	事件:
	OnQueryComplete(n_cst_alipay_response)
*/
blob blbData

if httpClient.HasRequest(REQ_QUERY) then return RetCode.E_BUSY
if Not IsValidObject(params) then return RetCode.E_INVALID_ARGUMENT
if Not params.HasItem("out_trade_no") and Not params.HasItem("trade_no") then return RetCode.E_INVALID_ARGUMENT

if Not _of_GetPostData(params,METHOD_QUERY,ref blbData) then return RetCode.E_INVALID_ARGUMENT

return httpClient.Request(REQ_QUERY,"POST",blbData,CONTENT_TYPE)
end function

public function long of_cancelasync (readonly n_json params);/*
	异步撤销订单(https://doc.open.alipay.com/doc2/apiDetail.htm?spm=a219a.7395905.0.0.TzehIe&docType=4&apiId=866)
	参数:
		params:
			--- 必填项 ---
					  --- out_trade_no	String(64)	//原支付请求的商户订单号,和支付宝交易号不能同时为空
			二选一 |
					  --- trade_no			String(64)	//支付宝交易号，和商户订单号不能同时为空
	事件:
	OnCancelComplete(n_cst_alipay_response)
*/
blob blbData

if httpClient.HasRequest(REQ_CANCEL) then return RetCode.E_BUSY
if Not IsValidObject(params) then return RetCode.E_INVALID_ARGUMENT
if Not params.HasItem("out_trade_no") and Not params.HasItem("trade_no") then return RetCode.E_INVALID_ARGUMENT

if Not _of_GetPostData(params,METHOD_CANCEL,ref blbData) then return RetCode.E_INVALID_ARGUMENT

return httpClient.Request(REQ_CANCEL,"POST",blbData,CONTENT_TYPE)
end function

public function long of_refundasync (readonly n_json params);/*
	申请退款(https://doc.open.alipay.com/doc2/apiDetail.htm?spm=a219a.7395905.0.0.MLCAYU&docType=4&apiId=759)
	参数:
		params:
			--- 必填项 ---
					  --- out_trade_no		String(64)	//原支付请求的商户订单号,和支付宝交易号不能同时为空
			二选一 |
					  --- trade_no			String(64)	//支付宝交易号，和商户订单号不能同时为空
			refund_amount					Double		//需要退款的金额，该金额不能大于订单金额,单位为元，支持两位小数
			条件选择 out_request_no 	String(64)	//标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传。
			--- 可选项 ---
			refund_reason 					String(256) //退款的原因说明
			operator_id  					String(30)	//商户的操作员编号
			store_id   						String(32)	//商户的门店编号
			terminal_id    					String(32)	//商户的终端编号
	事件:
	OnRefundComplete(n_cst_alipay_response)
*/
blob blbData

if httpClient.HasRequest(REQ_REFUND) then return RetCode.E_BUSY
if Not IsValidObject(params) then return RetCode.E_INVALID_ARGUMENT
if (Not params.HasItem("out_trade_no") and Not params.HasItem("trade_no")) or Not params.HasItem("refund_amount") then return RetCode.E_INVALID_ARGUMENT

if Not _of_GetPostData(params,METHOD_REFUND,ref blbData) then return RetCode.E_INVALID_ARGUMENT

return httpClient.Request(REQ_REFUND,"POST",blbData,CONTENT_TYPE)
end function

public function boolean _of_verifysign (readonly n_json data, readonly string sign);return _crypto.VerifyRSASign(_httpUtility.StringToBlob(_of_Serialize(data),Enums.HTTP_ENCODING_UTF8), _crypto.StringToBlob(sign,Enums.CRYPTO_ENCODING_BASE64), #PubKey, _of_GetHashType())
end function

private function boolean _of_getpostdata (readonly n_json params, readonly string method, ref blob data);int nIndex,nCount
string ls_key,ls_value,ls_data
n_json jsonData

jsonData = Create n_json

jsonData.SetItem("method",method)
jsonData.SetItem("charset","utf-8")
jsonData.SetItem("format","JSON")
jsonData.SetItem("version",API_VERSION)
jsonData.SetItem("timestamp",String(DateTime(ToDay(),Now()),"YYYY-MM-DD HH:MM:YY"))
jsonData.SetItem("app_id",#AppID)
jsonData.SetItem("biz_content",params)

if _of_MakeSign(jsonData) then
	nCount = jsonData.GetItemCount()
	for nIndex = 1 to nCount
		ls_key = jsonData.GetItemName(nIndex)
		if ls_key = "version" then continue
		choose case jsonData.GetItemType(nIndex)
			case Enums.JSON_TYPE_BOOLEAN
				ls_value = String(jsonData.GetItemBoolean(nIndex))
			case Enums.JSON_TYPE_NUMBER
				ls_value = String(Round(jsonData.GetItemDouble(nIndex),2))
			case Enums.JSON_TYPE_STRING
				ls_value = jsonData.GetItemString(nIndex)
			case Enums.JSON_TYPE_OBJECT,Enums.JSON_TYPE_ARRAY
				ls_value = _of_Serialize(jsonData.GetItem(nIndex))
			case else
				ls_value = ""
		end choose
		if ls_value = "" then continue
		if ls_data <> "" then ls_data += "&"
		ls_data += ls_key + "=" + _httpUtility.URLEncode(ls_value)
	next
	ls_data += "&version=" + jsonData.GetItemString("version")
end if

Destroy jsonData

if ls_data = "" then return false

data = _httpUtility.StringToBlob(ls_data,Enums.HTTP_ENCODING_UTF8,true)
return true
end function

public function n_cst_alipay_response of_precreate (readonly n_json params);/*
	统一收单线下交易预创建(https://doc.open.alipay.com/doc2/apiDetail.htm?spm=a219a.7629065.0.0.PlTwKb&apiId=862&docType=4)
		注:收银员通过收银台或商户后台调用支付宝接口，生成二维码后，展示给用户，由用户扫描二维码完成订单支付。
	参数:
		params:
			--- 必填项 ---
			out_trade_no				String(64)	//商户订单号,64个字符以内、可包含字母、数字、下划线；需保证在商户端不重复
			subject						String(256)	//订单标题
			total_amount				Double		//订单总金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]。
			--- 可选项 ---
			discountable_amount		Double		//可打折金额，参与优惠计算的金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]。
			undiscountable_amount	Double		//不可打折金额，不参与优惠计算的金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]。
			body							String(128)  //订单描述
			operator_id					String(28)	//商户操作员编号
			store_id 						String(32)	//商户门店编号
			terminal_id 					String(32)	//商户机具终端编号
			alipay_store_id				String(32)	//支付宝的店铺编号
			timeout_express			String(6)		//该笔订单允许的最晚付款时间，逾期将关闭交易。
															//取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。 
															//该参数数值不接受小数点， 如 1.5h，可转换为 90m
			goods_detail           		 JSON Array	//订单包含的商品列表信息，Json格式，其它说明详见商品明细说明(见链接中的接口说明!)
			extend_params				JSON			//业务扩展参数(见链接中的接口说明!)
			royalty_info					JSON			//描述分账信息，Json格式，其它说明详见分账说明(见链接中的接口说明!)
*/
blob blbData
string ls_ret,ls_requiredParams[] = {"out_trade_no","subject","total_amount"}
n_httpresponse httpResponse
n_cst_alipay_response rsp

rsp = Create n_cst_alipay_response

if Not IsValidObject(params) then
	rsp.Event OnInit(this,httpResponse,"无效参数")
	return rsp
end if
ls_ret = _of_CheckRequiredParams(params,ls_requiredParams)
if ls_ret <> "" then
	rsp.Event OnInit(this,httpResponse,"缺少必填项[" + ls_ret + "]")
	return rsp
end if
if Not params.HasItem("discountable_amount") then
	params.SetItem("discountable_amount",0)
end if
if Not params.HasItem("undiscountable_amount") then
	params.SetItem("undiscountable_amount",params.GetItemDouble("total_amount") - params.GetItemDouble("discountable_amount"))
end if
if params.GetItemDouble("total_amount") <> params.GetItemDouble("discountable_amount") + params.GetItemDouble("undiscountable_amount") then
	rsp.Event OnInit(this,httpResponse,"[total_amount]不等于[discountable_amount]与[undiscountable_amount]之和")
	return rsp
end if

if Not _of_GetPostData(params,METHOD_PRECREATE,ref blbData) then
	rsp.Event OnInit(this,httpResponse,"数据签名失败")
	return rsp
end if

httpResponse = httpClient.Request("POST",blbData,CONTENT_TYPE)
rsp.Event OnInit(this,httpResponse,httpResponse.GetErrorInfo())

return rsp
end function

public function long of_precreateasync (readonly n_json params);/*
	异步统一收单线下交易预创建(https://doc.open.alipay.com/doc2/apiDetail.htm?spm=a219a.7629065.0.0.PlTwKb&apiId=862&docType=4)
		注:收银员通过收银台或商户后台调用支付宝接口，生成二维码后，展示给用户，由用户扫描二维码完成订单支付。
	参数:
		params:
			--- 必填项 ---
			out_trade_no				String(64)	//商户订单号,64个字符以内、可包含字母、数字、下划线；需保证在商户端不重复
			subject						String(256)	//订单标题
			total_amount				Double		//订单总金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]。
			--- 可选项 ---
			discountable_amount		Double		//可打折金额，参与优惠计算的金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]。
			undiscountable_amount	Double		//不可打折金额，不参与优惠计算的金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]。
			body							String(128)  //订单描述
			operator_id					String(28)	//商户操作员编号
			store_id 						String(32)	//商户门店编号
			terminal_id 					String(32)	//商户机具终端编号
			alipay_store_id				String(32)	//支付宝的店铺编号
			timeout_express			String(6)		//该笔订单允许的最晚付款时间，逾期将关闭交易。
															//取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。 
															//该参数数值不接受小数点， 如 1.5h，可转换为 90m
			goods_detail           		 JSON Array	//订单包含的商品列表信息，Json格式，其它说明详见商品明细说明(见链接中的接口说明!)
			extend_params				JSON			//业务扩展参数(见链接中的接口说明!)
			royalty_info					JSON			//描述分账信息，Json格式，其它说明详见分账说明(见链接中的接口说明!)
	事件:
	OnPrecreateComplete(n_cst_alipay_response)
*/
blob blbData
string ls_requiredParams[] = {"out_trade_no","subject","total_amount"}

if httpClient.HasRequest(REQ_PRECREATE) then return RetCode.E_BUSY
if Not IsValidObject(params) then return RetCode.E_INVALID_ARGUMENT
if _of_CheckRequiredParams(params,ls_requiredParams) <> "" then return RetCode.E_INVALID_ARGUMENT

if Not params.HasItem("discountable_amount") then
	params.SetItem("discountable_amount",0)
end if
if Not params.HasItem("undiscountable_amount") then
	params.SetItem("undiscountable_amount",params.GetItemDouble("total_amount") - params.GetItemDouble("discountable_amount"))
end if
if params.GetItemDouble("total_amount") <> params.GetItemDouble("discountable_amount") + params.GetItemDouble("undiscountable_amount") then return RetCode.E_INVALID_ARGUMENT

if Not _of_GetPostData(params,METHOD_PRECREATE,ref blbData) then return RetCode.E_INVALID_ARGUMENT

return httpClient.Request(REQ_PRECREATE,"POST",blbData,CONTENT_TYPE)
end function

public function long of_setsigntype (string stype);if sType = "" then return RetCode.E_INVALID_ARGUMENT
sType = Upper(sType)
choose case sType
	case "RSA","RSA2"
		#SignType = sType
		return RetCode.OK
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose
end function

private function long _of_gethashtype ();long hashType

choose case #SignType
	case "RSA"
		hashType = Enums.CRYPTO_HASH_SHA1
	case "RSA2"
		hashType = Enums.CRYPTO_HASH_SHA256
end choose

return hashType
end function

on n_cst_alipay.create
call super::create
this.httpclient=create httpclient
TriggerEvent( this, "constructor" )
end on

on n_cst_alipay.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.httpclient)
end on

event constructor;_httpUtility = Create n_httputility
_crypto = Create n_crypto

httpClient.SetHost(URL_MASTER)
end event

event destructor;Destroy _httpUtility
Destroy _crypto
end event

type httpclient from n_httpclient within n_cst_alipay descriptor "pb_nvo" = "true" 
end type

on httpclient.create
call super::create
end on

on httpclient.destroy
call super::destroy
end on

event oncomplete;call super::oncomplete;n_cst_alipay_response rsp

rsp = Create n_cst_alipay_response
rsp.Event OnInit(parent,response,response.GetErrorInfo())

choose case id
	case REQ_PAY
		Parent.Event OnPayComplete(rsp)
	case REQ_PRECREATE
		Parent.Event OnPrecreateComplete(rsp)
	case REQ_QUERY
		Parent.Event OnQueryComplete(rsp)
	case REQ_CANCEL
		Parent.Event OnCancelComplete(rsp)
	case REQ_REFUND
		Parent.Event OnRefundComplete(rsp)
end choose

return 0
end event

