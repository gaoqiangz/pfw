$PBExportHeader$n_cst_wxpay.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_wxpay from nonvisualobject
end type
type httpclient from n_httpclient within n_cst_wxpay
end type
end forward

global type n_cst_wxpay from nonvisualobject
event onpaycomplete ( n_cst_wxpay_response response )
event onorderquerycomplete ( n_cst_wxpay_response response )
event onreversecomplete ( n_cst_wxpay_response response )
event onrefundcomplete ( n_cst_wxpay_response response )
event onrefundquerycomplete ( n_cst_wxpay_response response )
event onunifiedordercomplete ( n_cst_wxpay_response response )
event oncloseordercomplete ( n_cst_wxpay_response response )
httpclient httpclient
end type
global n_cst_wxpay n_cst_wxpay

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
Constant Long REQ_PAY 				= 100
Constant Long REQ_UFD_ORD 		= 101
Constant Long REQ_ORD_QUERY 	= 102
Constant Long REQ_CLOSE_ORD 	= 103
Constant Long REQ_REVERSE		= 104
Constant Long REQ_REFUND 		= 105
Constant Long REQ_RFD_QUERY	= 106

/*--- Properties ---*/
Public:
PrivateWrite String #AppID		//AppID
PrivateWrite String #MchID		//商户号
PrivateWrite String #Key			//支付密钥
PrivateWrite String #Cert		//PEM格式的证书 		(*of_Reverse/of_Refund接口必须提供证书信息!)
PrivateWrite String #CertKey	//PEM格式的证书私钥

/*--- Implementation ---*/
Private:
n_httputility _httpUtility
n_crypto _crypto

Constant String URL_PAY						= "https://api.mch.weixin.qq.com/pay/micropay"
Constant String URL_UNIFIED_ORDER	= "https://api.mch.weixin.qq.com/pay/unifiedorder"
Constant String URL_ORDER_QUERY		= "https://api.mch.weixin.qq.com/pay/orderquery"
Constant String URL_CLOSE_ORDER		= "https://api.mch.weixin.qq.com/pay/closeorder"
Constant String URL_REVERSE				= "https://api.mch.weixin.qq.com/secapi/pay/reverse"
Constant String URL_REFUND				= "https://api.mch.weixin.qq.com/secapi/pay/refund"
Constant String URL_REFUND_QUERY	= "https://api.mch.weixin.qq.com/pay/refundquery"
Constant String CONTENT_TYPE 			= "text/xml; charset=utf-8"
end variables

forward prototypes
public function long of_setappid (readonly string appid)
public function long of_setmchid (readonly string mchid)
public function long of_setkey (readonly string key)
private function string _of_checkrequiredparams (readonly n_json params, readonly string required[])
private function boolean _of_makesign (readonly n_json data)
private function string _of_toxmlstring (readonly n_json data)
public function n_cst_wxpay_response of_pay (readonly n_json params)
private function string _of_getpostdata (readonly n_json params)
public function boolean _of_verifysign (readonly n_json data)
public function long of_setcertinfo (readonly string cert, readonly string certkey)
public function n_cst_wxpay_response of_orderquery (readonly n_json params)
public function n_cst_wxpay_response of_reverse (readonly n_json params)
public function n_cst_wxpay_response of_refund (readonly n_json params)
public function n_cst_wxpay_response of_refundquery (readonly n_json params)
public function long of_payasync (readonly n_json params)
public function long of_orderqueryasync (readonly n_json params)
public function long of_refundasync (readonly n_json params)
public function long of_refundqueryasync (readonly n_json params)
public function long of_reverseasync (readonly n_json params)
public function n_cst_wxpay_response of_unifiedorder (readonly n_json params)
public function long of_unifiedorderasync (readonly n_json params)
public function n_cst_wxpay_response of_closeorder (readonly n_json params)
public function long of_closeorderasync (readonly n_json params)
end prototypes

public function long of_setappid (readonly string appid);if appID = "" then return RetCode.E_INVALID_ARGUMENT
#AppID = appID
return RetCode.OK
end function

public function long of_setmchid (readonly string mchid);if mchID = "" then return RetCode.E_INVALID_ARGUMENT
#MchID = mchID
return RetCode.OK
end function

public function long of_setkey (readonly string key);if key = "" then return RetCode.E_INVALID_ARGUMENT
#Key = key
return RetCode.OK
end function

private function string _of_checkrequiredparams (readonly n_json params, readonly string required[]);int nIndex,nCount

nCount = UpperBound(required)
for nIndex = 1 to nCount
	if Not params.HasItem(required[nIndex]) then return required[nIndex]
next

return ""
end function

private function boolean _of_makesign (readonly n_json data);int nIndex,nCount
string ls_key,ls_value,ls_signString
n_vector vecArray

if #Key = "" then return false

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
			ls_value = String(data.GetItemDouble(ls_key))
		case Enums.JSON_TYPE_STRING
			ls_value = data.GetItemString(ls_key)
		case else
			ls_value = ""
	end choose
	if ls_value = "" then continue
	ls_signString += ls_key + "=" + ls_value + "&"
next

Destroy vecArray

if ls_signString = "" then return false
ls_signString += "key=" + #Key

ls_signString = _crypto.Hash(_httpUtility.StringToBlob(ls_signString,Enums.HTTP_ENCODING_UTF8),Enums.CRYPTO_HASH_MD5)
data.SetItem("sign",ls_signString)

return (ls_signString <> "")
end function

private function string _of_toxmlstring (readonly n_json data);int nIndex,nCount
string ls_key,ls_value,ls_xmlString

ls_xmlString = "<xml>"
nCount = data.GetItemCount()
for nIndex = 1 to nCount
	ls_key = String(data.GetItemName(nIndex))
	choose case data.GetItemType(nIndex)
		case Enums.JSON_TYPE_BOOLEAN
			ls_value = String(data.GetItemBoolean(nIndex))
		case Enums.JSON_TYPE_NUMBER
			ls_value = String(data.GetItemDouble(nIndex))
		case Enums.JSON_TYPE_STRING
			ls_value = "<![CDATA[" + data.GetItemString(nIndex) + "]]>"
		case else
			ls_value = ""
	end choose
	if ls_value = "" then continue
	ls_xmlString += "~r<" + ls_key + ">" + ls_value + "</" + ls_key + ">"
next
ls_xmlString += "~r</xml>"

return ls_xmlString
end function

public function n_cst_wxpay_response of_pay (readonly n_json params);/*
	订单支付(https://pay.weixin.qq.com/wiki/doc/api/micropay.php?chapter=9_10&index=1)
	参数:
		params:
			--- 必填项 ---
			out_trade_no		String(32)	//商户支付的订单号由商户自定义生成，微信支付要求商户订单号保持唯一性（建议根据当前系统时间加随机序列来生成订单号）。
													//重新发起一笔支付要使用原订单号，避免重复支付；已支付过或已调用关单、撤销的订单号不能重新发起支付。 
			body					String(32)	//商品或支付单简要描述
			total_fee				Int				//订单总金额，单位为分，只能为整数 (*** 自动处理 ***)
			auth_code			String(128) 	//扫码支付授权码，设备读取用户微信中的条码或者二维码信息
			--- 可选项 ---
			spbill_create_ip		String(16)  	//调用微信支付API的机器IP(默认:8.8.8.8)
			device_info			String(32)  	//终端设备号(商户自定义，如门店编号)
			detail					String(8192)//商品名称明细列表
			attach					String(127)	//附加数据，在查询API和支付通知中原样返回，该字段主要用于商户携带订单的自定义数据
			fee_type				String(16)	//符合ISO4217标准的三位字母代码，默认人民币：CNY
			goods_tag			String(32)	//商品标记，代金券或立减优惠功能的参数
			limit_pay				String(32)	//指定支付方式(no_credit:指定不能使用信用卡支付)
*/
string ls_postData
string ls_ret,ls_requiredParams[] = {"out_trade_no","body","total_fee","auth_code"}
n_httpresponse httpResponse
n_cst_wxpay_response rsp

rsp = Create n_cst_wxpay_response

if Not IsValidObject(params) then
	rsp.Event OnInit(this,httpResponse,"无效参数")
	return rsp
end if
ls_ret = _of_CheckRequiredParams(params,ls_requiredParams)
if ls_ret <> "" then
	rsp.Event OnInit(this,httpResponse,"缺少必填项[" + ls_ret + "]")
	return rsp
end if

if Not params.HasItem("spbill_create_ip") then
	params.SetItem("spbill_create_ip","8.8.8.8")
end if

//将金额单位转换为分
params.SetItem("total_fee",Round(params.GetItemDouble("total_fee"),2) * 100)

ls_postData = _of_GetPostData(params)
if ls_postData = "" then
	rsp.Event OnInit(this,httpResponse,"数据签名失败")
	return rsp
end if

httpResponse = httpClient.Request("POST",URL_PAY,ls_postData,CONTENT_TYPE)
rsp.Event OnInit(this,httpResponse,httpResponse.GetErrorInfo())

return rsp
end function

private function string _of_getpostdata (readonly n_json params);int nIndex,nCount
string ls_key,ls_value,ls_data
n_json jsonData

jsonData = params.Duplicate()
jsonData.SetItem("appid",#AppID)
jsonData.SetItem("mch_id",#MchID)
jsonData.SetItem("nonce_str",_crypto.GenRandomString(32))

if _of_MakeSign(jsonData) then
	ls_data = _of_ToXMLString(jsonData)
end if

Destroy jsonData

return ls_data
end function

public function boolean _of_verifysign (readonly n_json data);string ls_oldSign

if Not IsValidObject(data) then return false

ls_oldSign = data.GetItemString("sign")
if ls_oldSign = "" then return false

data.RemoveItem("sign")
if Not _of_MakeSign(data) then return false

return (ls_oldSign = data.GetItemString("sign"))
end function

public function long of_setcertinfo (readonly string cert, readonly string certkey);long rtCode
if cert = "" or certKey = "" then return RetCode.E_INVALID_ARGUMENT
#Cert = cert
#CertKey = certKey
rtCode = httpClient.SetCert(Enums.HTTP_CERT_PEM,cert)
if rtCode <> RetCode.OK then return rtCode
rtCode = httpClient.SetCertKey(Enums.HTTP_CERT_KEY_PEM,certKey)
return rtCode
end function

public function n_cst_wxpay_response of_orderquery (readonly n_json params);/*
	订单查询(https://pay.weixin.qq.com/wiki/doc/api/micropay.php?chapter=9_2)
	参数:
		params:
			--- 必填项 ---
					 --- out_trade_no		String(32)	//商户系统内部的订单号，当没提供transaction_id时需要传这个。
			二选一|											 
					 --- transaction_id		String(32)	//微信的订单号，优先使用。
*/
string ls_postData
n_httpresponse httpResponse
n_cst_wxpay_response rsp

rsp = Create n_cst_wxpay_response

if Not IsValidObject(params) then
	rsp.Event OnInit(this,httpResponse,"无效参数")
	return rsp
end if
if Not params.HasItem("out_trade_no") and Not params.HasItem("transaction_id") then
	rsp.Event OnInit(this,httpResponse,"缺少必填项")
	return rsp
end if

ls_postData = _of_GetPostData(params)
if ls_postData = "" then
	rsp.Event OnInit(this,httpResponse,"数据签名失败")
	return rsp
end if

httpResponse = httpClient.Request("POST",URL_ORDER_QUERY,ls_postData,CONTENT_TYPE)
rsp.Event OnInit(this,httpResponse,httpResponse.GetErrorInfo())

return rsp
end function

public function n_cst_wxpay_response of_reverse (readonly n_json params);/*
	撤销订单(https://pay.weixin.qq.com/wiki/doc/api/micropay.php?chapter=9_11&index=3)
	参数:
		params:
			--- 必填项 ---
					 --- out_trade_no		String(32)	//商户系统内部的订单号，当没提供transaction_id时需要传这个。
			二选一|											 
					 --- transaction_id		String(32)	//微信的订单号，优先使用。
*/
string ls_postData
n_httpresponse httpResponse
n_cst_wxpay_response rsp

rsp = Create n_cst_wxpay_response

if #Cert = "" or #CertKey = "" then
	rsp.Event OnInit(this,httpResponse,"缺少证书信息")
	return rsp
end if
if Not IsValidObject(params) then
	rsp.Event OnInit(this,httpResponse,"无效参数")
	return rsp
end if
if Not params.HasItem("out_trade_no") and Not params.HasItem("transaction_id") then
	rsp.Event OnInit(this,httpResponse,"缺少必填项")
	return rsp
end if

ls_postData = _of_GetPostData(params)
if ls_postData = "" then
	rsp.Event OnInit(this,httpResponse,"数据签名失败")
	return rsp
end if

httpResponse = httpClient.Request("POST",URL_REVERSE,ls_postData,CONTENT_TYPE)
rsp.Event OnInit(this,httpResponse,httpResponse.GetErrorInfo())

return rsp
end function

public function n_cst_wxpay_response of_refund (readonly n_json params);/*
	申请退款(https://pay.weixin.qq.com/wiki/doc/api/micropay.php?chapter=9_4)
	参数:
		params:
			--- 必填项 ---
					 --- out_trade_no		String(32)	//商户系统内部的订单号，当没提供transaction_id时需要传这个。
			二选一|										 
					 --- transaction_id		String(32)	//微信的订单号，优先使用。
			out_refund_no					String(32)	//商户系统内部的退款单号，商户系统内部唯一，同一退款单号多次请求只退一笔
			total_fee							Int				//订单总金额，单位为分，只能为整数 (*** 自动处理 ***)
			refund_fee						Int				//退款总金额，订单总金额，单位为分，只能为整数 (*** 自动处理 ***)
			--- 可选项 ---
			op_user_id						String(32)	//操作员帐号, 默认为商户号
			refund_fee_type				String(8)		//符合ISO4217标准的三位字母代码，默认人民币：CNY
*/
string ls_postData
string ls_ret,ls_requiredParams[] = {"out_trade_no","total_fee","refund_fee"}
n_httpresponse httpResponse
n_cst_wxpay_response rsp

rsp = Create n_cst_wxpay_response

if #Cert = "" or #CertKey = "" then
	rsp.Event OnInit(this,httpResponse,"缺少证书信息")
	return rsp
end if
if Not IsValidObject(params) then
	rsp.Event OnInit(this,httpResponse,"无效参数")
	return rsp
end if
if Not params.HasItem("out_trade_no") and Not params.HasItem("transaction_id") then
	rsp.Event OnInit(this,httpResponse,"缺少必填项")
	return rsp
end if
ls_ret = _of_CheckRequiredParams(params,ls_requiredParams)
if ls_ret <> "" then
	rsp.Event OnInit(this,httpResponse,"缺少必填项[" + ls_ret + "]")
	return rsp
end if

if Not params.HasItem("op_user_id") then
	params.SetItem("op_user_id",#MchID)
end if

//将金额单位转换为分
params.SetItem("total_fee",Round(params.GetItemDouble("total_fee"),2) * 100)
params.SetItem("refund_fee",Round(params.GetItemDouble("refund_fee"),2) * 100)

ls_postData = _of_GetPostData(params)
if ls_postData = "" then
	rsp.Event OnInit(this,httpResponse,"数据签名失败")
	return rsp
end if

httpResponse = httpClient.Request("POST",URL_REFUND,ls_postData,CONTENT_TYPE)
rsp.Event OnInit(this,httpResponse,httpResponse.GetErrorInfo())

return rsp
end function

public function n_cst_wxpay_response of_refundquery (readonly n_json params);/*
	退款查询(https://pay.weixin.qq.com/wiki/doc/api/micropay.php?chapter=9_5)
	参数:
		params:
			--- 必填项 ---
					 ---	out_trade_no	String(32)	//商户系统内部的订单号
					|											 
			四选一|		transaction_id	String(32)	//微信订单号
					|		out_refund_no	String(32)	//商户传给微信的退款单号
					 ---	refund_id		String(28)	//微信生成的退款单号，在申请退款接口有返回
*/
string ls_postData
n_httpresponse httpResponse
n_cst_wxpay_response rsp

rsp = Create n_cst_wxpay_response

if Not IsValidObject(params) then
	rsp.Event OnInit(this,httpResponse,"无效参数")
	return rsp
end if
if Not params.HasItem("out_trade_no") and Not params.HasItem("transaction_id") and Not params.HasItem("out_refund_no") and Not params.HasItem("refund_id") then
	rsp.Event OnInit(this,httpResponse,"缺少必填项")
	return rsp
end if

ls_postData = _of_GetPostData(params)
if ls_postData = "" then
	rsp.Event OnInit(this,httpResponse,"数据签名失败")
	return rsp
end if

httpResponse = httpClient.Request("POST",URL_REFUND_QUERY,ls_postData,CONTENT_TYPE)
rsp.Event OnInit(this,httpResponse,httpResponse.GetErrorInfo())

return rsp
end function

public function long of_payasync (readonly n_json params);/*
	异步订单支付(https://pay.weixin.qq.com/wiki/doc/api/micropay.php?chapter=9_10&index=1)
	参数:
		params:
			--- 必填项 ---
			out_trade_no		String(32)	//商户支付的订单号由商户自定义生成，微信支付要求商户订单号保持唯一性（建议根据当前系统时间加随机序列来生成订单号）。
													//重新发起一笔支付要使用原订单号，避免重复支付；已支付过或已调用关单、撤销的订单号不能重新发起支付。 
			body					String(32)	//商品或支付单简要描述
			total_fee				Int				//订单总金额，单位为分，只能为整数 (*** 自动处理 ***)
			auth_code			String(128) 	//扫码支付授权码，设备读取用户微信中的条码或者二维码信息
			--- 可选项 ---
			spbill_create_ip		String(16)  	//调用微信支付API的机器IP(默认:8.8.8.8)
			device_info			String(32)  	//终端设备号(商户自定义，如门店编号)
			detail					String(8192)//商品名称明细列表
			attach					String(127)	//附加数据，在查询API和支付通知中原样返回，该字段主要用于商户携带订单的自定义数据
			fee_type				String(16)	//符合ISO4217标准的三位字母代码，默认人民币：CNY
			goods_tag			String(32)	//商品标记，代金券或立减优惠功能的参数
			limit_pay				String(32)	//指定支付方式(no_credit:指定不能使用信用卡支付)
	事件:
	OnPayComplete(n_cst_wxpay_response)
*/
string ls_postData
string ls_requiredParams[] = {"out_trade_no","body","total_fee","auth_code"}

if httpClient.HasRequest(REQ_PAY) then return RetCode.E_BUSY
if Not IsValidObject(params) then return RetCode.E_INVALID_ARGUMENT
if _of_CheckRequiredParams(params,ls_requiredParams) <> "" then return RetCode.E_INVALID_ARGUMENT

if Not params.HasItem("spbill_create_ip") then
	params.SetItem("spbill_create_ip","8.8.8.8")
end if

//将金额单位转换为分
params.SetItem("total_fee",Round(params.GetItemDouble("total_fee"),2) * 100)

ls_postData = _of_GetPostData(params)
if ls_postData = "" then return RetCode.FAILED

return httpClient.Request(REQ_PAY,"POST",URL_PAY,ls_postData,CONTENT_TYPE)
end function

public function long of_orderqueryasync (readonly n_json params);/*
	异步订单查询(https://pay.weixin.qq.com/wiki/doc/api/micropay.php?chapter=9_2)
	参数:
		params:
			--- 必填项 ---
					 --- out_trade_no		String(32)	//商户系统内部的订单号，当没提供transaction_id时需要传这个。
			二选一|											 
					 --- transaction_id		String(32)	//微信的订单号，优先使用。
	事件:
	OnOrderQueryComplete(n_cst_wxpay_response)
*/
string ls_postData

if httpClient.HasRequest(REQ_ORD_QUERY) then return RetCode.E_BUSY
if Not IsValidObject(params) then return RetCode.E_INVALID_ARGUMENT
if Not params.HasItem("out_trade_no") and Not params.HasItem("transaction_id") then return RetCode.E_INVALID_ARGUMENT

ls_postData = _of_GetPostData(params)
if ls_postData = "" then return RetCode.FAILED

return httpClient.Request(REQ_ORD_QUERY,"POST",URL_ORDER_QUERY,ls_postData,CONTENT_TYPE)
end function

public function long of_refundasync (readonly n_json params);/*
	异步申请退款(https://pay.weixin.qq.com/wiki/doc/api/micropay.php?chapter=9_4)
	参数:
		params:
			--- 必填项 ---
					 --- out_trade_no		String(32)	//商户系统内部的订单号，当没提供transaction_id时需要传这个。
			二选一|										 
					 --- transaction_id		String(32)	//微信的订单号，优先使用。
			out_refund_no					String(32)	//商户系统内部的退款单号，商户系统内部唯一，同一退款单号多次请求只退一笔
			total_fee							Int				//订单总金额，单位为分，只能为整数 (*** 自动处理 ***)
			refund_fee						Int				//退款总金额，订单总金额，单位为分，只能为整数 (*** 自动处理 ***)
			--- 可选项 ---
			op_user_id						String(32)	//操作员帐号, 默认为商户号
			refund_fee_type				String(8)		//符合ISO4217标准的三位字母代码，默认人民币：CNY
	事件:
	OnRefundComplete(n_cst_wxpay_response)
*/
string ls_postData
string ls_requiredParams[] = {"out_trade_no","total_fee","refund_fee"}

if #Cert = "" or #CertKey = "" then return RetCode.FAILED
if httpClient.HasRequest(REQ_REFUND) then return RetCode.E_BUSY
if Not IsValidObject(params) then return RetCode.E_INVALID_ARGUMENT
if Not params.HasItem("out_trade_no") and Not params.HasItem("transaction_id") then return RetCode.E_INVALID_ARGUMENT
if _of_CheckRequiredParams(params,ls_requiredParams) <> "" then return RetCode.E_INVALID_ARGUMENT

if Not params.HasItem("op_user_id") then
	params.SetItem("op_user_id",#MchID)
end if

//将金额单位转换为分
params.SetItem("total_fee",Round(params.GetItemDouble("total_fee"),2) * 100)
params.SetItem("refund_fee",Round(params.GetItemDouble("refund_fee"),2) * 100)

ls_postData = _of_GetPostData(params)
if ls_postData = "" then return RetCode.FAILED

return httpClient.Request(REQ_REFUND,"POST",URL_REFUND,ls_postData,CONTENT_TYPE)
end function

public function long of_refundqueryasync (readonly n_json params);/*
	异步退款查询(https://pay.weixin.qq.com/wiki/doc/api/micropay.php?chapter=9_5)
	参数:
		params:
			--- 必填项 ---
					 ---	out_trade_no	String(32)	//商户系统内部的订单号
					|											 
			四选一|		transaction_id	String(32)	//微信订单号
					|		out_refund_no	String(32)	//商户传给微信的退款单号
					 ---	refund_id		String(28)	//微信生成的退款单号，在申请退款接口有返回
	事件:
	OnRefundQueryComplete(n_cst_wxpay_response)
*/
string ls_postData

if httpClient.HasRequest(REQ_RFD_QUERY) then return RetCode.E_BUSY
if Not IsValidObject(params) then return RetCode.E_INVALID_ARGUMENT
if Not params.HasItem("out_trade_no") and Not params.HasItem("transaction_id") and Not params.HasItem("out_refund_no") and Not params.HasItem("refund_id") then return RetCode.E_INVALID_ARGUMENT

ls_postData = _of_GetPostData(params)
if ls_postData = "" then return RetCode.FAILED

return httpClient.Request(REQ_RFD_QUERY,"POST",URL_REFUND_QUERY,ls_postData,CONTENT_TYPE)
end function

public function long of_reverseasync (readonly n_json params);/*
	异步撤销订单(https://pay.weixin.qq.com/wiki/doc/api/micropay.php?chapter=9_11&index=3)
	参数:
		params:
			--- 必填项 ---
					 --- out_trade_no		String(32)	//商户系统内部的订单号，当没提供transaction_id时需要传这个。
			二选一|											 
					 --- transaction_id		String(32)	//微信的订单号，优先使用。
	事件:
	OnReverseComplete(n_cst_wxpay_response)
*/
string ls_postData

if #Cert = "" or #CertKey = "" then return RetCode.FAILED
if httpClient.HasRequest(REQ_REVERSE) then return RetCode.E_BUSY
if Not IsValidObject(params) then return RetCode.E_INVALID_ARGUMENT
if Not params.HasItem("out_trade_no") and Not params.HasItem("transaction_id") then return RetCode.E_INVALID_ARGUMENT

ls_postData = _of_GetPostData(params)
if ls_postData = "" then return RetCode.FAILED

return httpClient.Request(REQ_REVERSE,"POST",URL_REVERSE,ls_postData,CONTENT_TYPE)
end function

public function n_cst_wxpay_response of_unifiedorder (readonly n_json params);/*
	统一下单(https://pay.weixin.qq.com/wiki/doc/api/native.php?chapter=9_1)
		注：除被扫支付场景以外，商户系统先调用该接口在微信支付服务后台生成预支付交易单，返回正确的预支付交易回话标识后再按扫码、JSAPI、APP等不同场景生成交易串调起支付。
	参数:
		params:
			--- 必填项 ---
			out_trade_no		String(32)	//商户支付的订单号由商户自定义生成，微信支付要求商户订单号保持唯一性（建议根据当前系统时间加随机序列来生成订单号）。
													//重新发起一笔支付要使用原订单号，避免重复支付；已支付过或已调用关单、撤销的订单号不能重新发起支付。 
			body					String(32)	//商品或支付单简要描述
			total_fee				Int				//订单总金额，单位为分，只能为整数 (*** 自动处理 ***)
			--- 可选项 ---
			notify_url		String(256)  	//异步接收微信支付结果通知的回调地址，通知url必须为外网可访问的url，不能携带参数。
			spbill_create_ip		String(16)  	//调用微信支付API的机器IP(默认:8.8.8.8)
			device_info			String(32)  	//终端设备号(商户自定义，如门店编号)
			detail					String(8192)//商品名称明细列表
			attach					String(127)	//附加数据，在查询API和支付通知中原样返回，该字段主要用于商户携带订单的自定义数据
			fee_type				String(16)	//符合ISO4217标准的三位字母代码，默认人民币：CNY
			goods_tag			String(32)	//商品标记，代金券或立减优惠功能的参数
			limit_pay				String(32)	//指定支付方式(no_credit:指定不能使用信用卡支付)
*/
string ls_postData
string ls_ret,ls_requiredParams[] = {"out_trade_no","body","total_fee"}
n_httpresponse httpResponse
n_cst_wxpay_response rsp

rsp = Create n_cst_wxpay_response

if Not IsValidObject(params) then
	rsp.Event OnInit(this,httpResponse,"无效参数")
	return rsp
end if
ls_ret = _of_CheckRequiredParams(params,ls_requiredParams)
if ls_ret <> "" then
	rsp.Event OnInit(this,httpResponse,"缺少必填项[" + ls_ret + "]")
	return rsp
end if

params.SetItem("trade_type","NATIVE")
if Not params.HasItem("notify_url") then
	params.SetItem("notify_url","-")
end if
if Not params.HasItem("spbill_create_ip") then
	params.SetItem("spbill_create_ip","8.8.8.8")
end if

//将金额单位转换为分
params.SetItem("total_fee",Round(params.GetItemDouble("total_fee"),2) * 100)

ls_postData = _of_GetPostData(params)
if ls_postData = "" then
	rsp.Event OnInit(this,httpResponse,"数据签名失败")
	return rsp
end if

httpResponse = httpClient.Request("POST",URL_UNIFIED_ORDER,ls_postData,CONTENT_TYPE)
rsp.Event OnInit(this,httpResponse,httpResponse.GetErrorInfo())

return rsp
end function

public function long of_unifiedorderasync (readonly n_json params);/*
	异步统一下单(https://pay.weixin.qq.com/wiki/doc/api/native.php?chapter=9_1)
		注：除被扫支付场景以外，商户系统先调用该接口在微信支付服务后台生成预支付交易单，返回正确的预支付交易回话标识后再按扫码、JSAPI、APP等不同场景生成交易串调起支付。
	参数:
		params:
			--- 必填项 ---
			out_trade_no		String(32)	//商户支付的订单号由商户自定义生成，微信支付要求商户订单号保持唯一性（建议根据当前系统时间加随机序列来生成订单号）。
													//重新发起一笔支付要使用原订单号，避免重复支付；已支付过或已调用关单、撤销的订单号不能重新发起支付。 
			body					String(32)	//商品或支付单简要描述
			total_fee				Int				//订单总金额，单位为分，只能为整数 (*** 自动处理 ***)
			--- 可选项 ---
			notify_url		String(256)  	//异步接收微信支付结果通知的回调地址，通知url必须为外网可访问的url，不能携带参数。
			spbill_create_ip		String(16)  	//调用微信支付API的机器IP(默认:8.8.8.8)
			device_info			String(32)  	//终端设备号(商户自定义，如门店编号)
			detail					String(8192)//商品名称明细列表
			attach					String(127)	//附加数据，在查询API和支付通知中原样返回，该字段主要用于商户携带订单的自定义数据
			fee_type				String(16)	//符合ISO4217标准的三位字母代码，默认人民币：CNY
			goods_tag			String(32)	//商品标记，代金券或立减优惠功能的参数
			limit_pay				String(32)	//指定支付方式(no_credit:指定不能使用信用卡支付)
	事件:
	OnUnifiedOrderComplete(n_cst_wxpay_response)
*/
string ls_postData
string ls_requiredParams[] = {"out_trade_no","body","total_fee"}

if httpClient.HasRequest(REQ_UFD_ORD) then return RetCode.E_BUSY
if Not IsValidObject(params) then return RetCode.E_INVALID_ARGUMENT
if _of_CheckRequiredParams(params,ls_requiredParams) <> "" then return RetCode.E_INVALID_ARGUMENT

params.SetItem("trade_type","NATIVE")
if Not params.HasItem("notify_url") then
	params.SetItem("notify_url","-")
end if
if Not params.HasItem("spbill_create_ip") then
	params.SetItem("spbill_create_ip","8.8.8.8")
end if

//将金额单位转换为分
params.SetItem("total_fee",Round(params.GetItemDouble("total_fee"),2) * 100)

ls_postData = _of_GetPostData(params)
if ls_postData = "" then return RetCode.FAILED

return httpClient.Request(REQ_UFD_ORD,"POST",URL_UNIFIED_ORDER,ls_postData,CONTENT_TYPE)
end function

public function n_cst_wxpay_response of_closeorder (readonly n_json params);/*
	关闭订单(https://pay.weixin.qq.com/wiki/doc/api/native.php?chapter=9_3)
	注：以下情况需要调用关单接口：商户订单支付失败需要生成新单号重新发起支付，要对原订单号调用关单，避免重复支付；系统下单后，用户支付超时，系统退出不再受理，避免用户继续，请调用关单接口。
			注意：订单生成后不能马上调用关单接口，最短调用时间间隔为5分钟。 
	参数:
		params:
			--- out_trade_no		String(32)	//商户系统内部订单号
*/
string ls_postData
n_httpresponse httpResponse
n_cst_wxpay_response rsp

rsp = Create n_cst_wxpay_response

if #Cert = "" or #CertKey = "" then
	rsp.Event OnInit(this,httpResponse,"缺少证书信息")
	return rsp
end if
if Not IsValidObject(params) then
	rsp.Event OnInit(this,httpResponse,"无效参数")
	return rsp
end if
if Not params.HasItem("out_trade_no") then
	rsp.Event OnInit(this,httpResponse,"缺少必填项")
	return rsp
end if

ls_postData = _of_GetPostData(params)
if ls_postData = "" then
	rsp.Event OnInit(this,httpResponse,"数据签名失败")
	return rsp
end if

httpResponse = httpClient.Request("POST",URL_CLOSE_ORDER,ls_postData,CONTENT_TYPE)
rsp.Event OnInit(this,httpResponse,httpResponse.GetErrorInfo())

return rsp
end function

public function long of_closeorderasync (readonly n_json params);/*
	关闭订单(https://pay.weixin.qq.com/wiki/doc/api/native.php?chapter=9_3)
	注：以下情况需要调用关单接口：商户订单支付失败需要生成新单号重新发起支付，要对原订单号调用关单，避免重复支付；系统下单后，用户支付超时，系统退出不再受理，避免用户继续，请调用关单接口。
			注意：订单生成后不能马上调用关单接口，最短调用时间间隔为5分钟。 
	参数:
		params:
			--- out_trade_no		String(32)	//商户系统内部订单号
	事件:
	OnCloseOrderComplete(n_cst_wxpay_response)
*/
string ls_postData

if httpClient.HasRequest(REQ_CLOSE_ORD) then return RetCode.E_BUSY
if Not IsValidObject(params) then return RetCode.E_INVALID_ARGUMENT
if Not params.HasItem("out_trade_no") then return RetCode.E_INVALID_ARGUMENT

ls_postData = _of_GetPostData(params)
if ls_postData = "" then return RetCode.FAILED

return httpClient.Request(REQ_CLOSE_ORD,"POST",URL_CLOSE_ORDER,ls_postData,CONTENT_TYPE)
end function

on n_cst_wxpay.create
call super::create
this.httpclient=create httpclient
TriggerEvent( this, "constructor" )
end on

on n_cst_wxpay.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.httpclient)
end on

event constructor;_httpUtility = Create n_httputility
_crypto = Create n_crypto
end event

event destructor;Destroy _httpUtility
Destroy _crypto
end event

type httpclient from n_httpclient within n_cst_wxpay descriptor "pb_nvo" = "true" 
end type

on httpclient.create
call super::create
end on

on httpclient.destroy
call super::destroy
end on

event oncomplete;call super::oncomplete;n_cst_wxpay_response rsp

rsp = Create n_cst_wxpay_response
rsp.Event OnInit(parent,response,response.GetErrorInfo())

choose case id
	case REQ_PAY
		Parent.Event OnPayComplete(rsp)
	case REQ_UFD_ORD
		Parent.Event OnUnifiedOrderComplete(rsp)
	case REQ_ORD_QUERY
		Parent.Event OnOrderQueryComplete(rsp)
	case REQ_CLOSE_ORD
		Parent.Event OnCloseOrderComplete(rsp)
	case REQ_REVERSE
		Parent.Event OnReverseComplete(rsp)
	case REQ_REFUND
		Parent.Event OnRefundComplete(rsp)
	case REQ_RFD_QUERY
		Parent.Event OnRefundQueryComplete(rsp)
end choose

return 0
end event

