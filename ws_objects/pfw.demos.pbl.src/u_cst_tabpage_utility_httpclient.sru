$PBExportHeader$u_cst_tabpage_utility_httpclient.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_utility_httpclient from ue_cst_tabpage
end type
type st_transdata from se_cst_statictext within u_cst_tabpage_utility_httpclient
end type
type cb_8 from se_cst_button within u_cst_tabpage_utility_httpclient
end type
type cb_7 from se_cst_button within u_cst_tabpage_utility_httpclient
end type
type cb_5 from se_cst_button within u_cst_tabpage_utility_httpclient
end type
type cb_6 from se_cst_button within u_cst_tabpage_utility_httpclient
end type
type cb_30 from se_cst_button within u_cst_tabpage_utility_httpclient
end type
type cb_1 from se_cst_button within u_cst_tabpage_utility_httpclient
end type
type cb_2 from se_cst_button within u_cst_tabpage_utility_httpclient
end type
type cb_3 from se_cst_button within u_cst_tabpage_utility_httpclient
end type
type cb_4 from se_cst_button within u_cst_tabpage_utility_httpclient
end type
type cb_12 from se_cst_button within u_cst_tabpage_utility_httpclient
end type
type cb_26 from se_cst_button within u_cst_tabpage_utility_httpclient
end type
type cb_27 from se_cst_button within u_cst_tabpage_utility_httpclient
end type
type mle_response from se_cst_multilineedit within u_cst_tabpage_utility_httpclient
end type
type httpclient from n_httpclient within u_cst_tabpage_utility_httpclient
end type
end forward

global type u_cst_tabpage_utility_httpclient from ue_cst_tabpage
integer width = 4347
integer height = 1668
st_transdata st_transdata
cb_8 cb_8
cb_7 cb_7
cb_5 cb_5
cb_6 cb_6
cb_30 cb_30
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_12 cb_12
cb_26 cb_26
cb_27 cb_27
mle_response mle_response
httpclient httpclient
end type
global u_cst_tabpage_utility_httpclient u_cst_tabpage_utility_httpclient

type variables
//Request ID
Constant Long REQ_TEST		= 100
Constant Long REQ_DOWNLOAD	= 101
end variables

forward prototypes
public function string of_bytes2string (readonly unsignedlong bytes)
end prototypes

public function string of_bytes2string (readonly unsignedlong bytes);int nUnit
double fBytes
string UNITS[] = {"B","KB","MB","GB","TB","PB","EB"}

nUnit = 1
fBytes = bytes
do while (fBytes >= 1024)
	nUnit ++
	fBytes /= 1024
loop

return String(Round(fBytes,2)) + UNITS[nUnit]
end function

on u_cst_tabpage_utility_httpclient.create
int iCurrent
call super::create
this.st_transdata=create st_transdata
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_30=create cb_30
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_12=create cb_12
this.cb_26=create cb_26
this.cb_27=create cb_27
this.mle_response=create mle_response
this.httpclient=create httpclient
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_transdata
this.Control[iCurrent+2]=this.cb_8
this.Control[iCurrent+3]=this.cb_7
this.Control[iCurrent+4]=this.cb_5
this.Control[iCurrent+5]=this.cb_6
this.Control[iCurrent+6]=this.cb_30
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.cb_4
this.Control[iCurrent+11]=this.cb_12
this.Control[iCurrent+12]=this.cb_26
this.Control[iCurrent+13]=this.cb_27
this.Control[iCurrent+14]=this.mle_response
end on

on u_cst_tabpage_utility_httpclient.destroy
call super::destroy
destroy(this.st_transdata)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_30)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_12)
destroy(this.cb_26)
destroy(this.cb_27)
destroy(this.mle_response)
destroy(this.httpclient)
end on

event resize;call super::resize;long nHeight

nHeight = newHeight - mle_response.y - 4
if U2PY(nHeight) < 400 then nHeight= P2UY(400)

mle_response.Resize(newWidth - mle_response.x * 2,nHeight)
end event

event onopen;call super::onopen;//接收HTTP异常信息
httpClient.SetAcceptException(true)
end event

type st_transdata from se_cst_statictext within u_cst_tabpage_utility_httpclient
integer x = 32
integer y = 472
integer width = 4256
long backcolor = 16777215
string text = ""
end type

type cb_8 from se_cst_button within u_cst_tabpage_utility_httpclient
integer x = 2725
integer y = 56
integer width = 498
integer height = 132
integer taborder = 40
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "DownloadFile"
end type

event clicked;httpClient.DownloadFile(REQ_DOWNLOAD,"GET","https://dldir1.qq.com/qqfile/qq/QQ8.9.6/22404/QQ8.9.6.exe","d:\qq.exe",true)
end event

type cb_7 from se_cst_button within u_cst_tabpage_utility_httpclient
integer x = 3671
integer y = 272
integer width = 571
integer height = 132
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "获取本机公网IP"
end type

event clicked;/*
* HttpClient 同步请求 - 获取本机公网IP
*/
n_httpresponse httpResponse

//无代理
httpClient.SetProxyMode(Enums.HTTP_PROXY_NONE)
//发送请求并接收响应数据
httpResponse = httpClient.Request("GET","http://ipinfo.io/ip")
//显示响应结果
if httpResponse.IsValid() then
	mle_response.Text = httpResponse.GetDataString()
else
	mle_response.Text = "Error:" + String(httpResponse.GetError()) + "~r~nError Info:~r~n" + httpResponse.GetErrorInfo()
end if
end event

type cb_5 from se_cst_button within u_cst_tabpage_utility_httpclient
integer x = 2085
integer y = 268
integer width = 457
integer height = 132
integer taborder = 40
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "UrlEncode"
end type

event clicked;n_httputility httpUtility

httpUtility = Create n_httputility

mle_response.Text = httpUtility.UrlEncode(mle_response.Text)

Destroy httpUtility
end event

type cb_6 from se_cst_button within u_cst_tabpage_utility_httpclient
integer x = 2610
integer y = 268
integer width = 457
integer height = 132
integer taborder = 40
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "UrlDecode"
end type

event clicked;n_httputility httpUtility

httpUtility = Create n_httputility

mle_response.Text = httpUtility.UrlDecode(mle_response.Text)

Destroy httpUtility
end event

type cb_30 from se_cst_button within u_cst_tabpage_utility_httpclient
integer x = 3136
integer y = 268
integer width = 457
integer height = 132
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "UriBuilder"
end type

event clicked;n_uribuilder uriBuilder

uriBuilder = Create n_uribuilder

mle_response.text = uriBuilder.SetHost("http://www.baidu.com").AddPath("baidu").AddQuery("wd","PowerFramework").Serialize()

Destroy uriBuilder
end event

type cb_1 from se_cst_button within u_cst_tabpage_utility_httpclient
integer x = 55
integer y = 56
integer width = 457
integer height = 132
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "Sync"
end type

event clicked;/*
* HttpClient 同步请求
*/
n_httpresponse httpResponse

//无代理
httpClient.SetProxyMode(Enums.HTTP_PROXY_NONE)
//发送请求并接收响应数据
httpResponse = httpClient.Request("GET","http://www.baidu.com")
//显示响应结果
if httpResponse.IsValid() then
	mle_response.Text = "Headers:~r~n" + httpResponse.GetHeaders() + "~r~nResponse:~r~n" + httpResponse.GetDataString()
else
	mle_response.Text = "Error:" + String(httpResponse.GetError()) + "~r~nError Info:~r~n" + httpResponse.GetErrorInfo()
end if
end event

type cb_2 from se_cst_button within u_cst_tabpage_utility_httpclient
integer x = 567
integer y = 56
integer width = 457
integer height = 132
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "Async"
end type

event clicked;/*
* HttpClient 异步请求
*/

//无代理
httpClient.SetProxyMode(Enums.HTTP_PROXY_NONE)
//发送请求
//*可以通过REQ_TEST来取消该请求
//*在httpclient对象的OnComplete事件中接收响应结果
httpClient.Request(REQ_TEST,"GET","http://www.baidu.com")
end event

type cb_3 from se_cst_button within u_cst_tabpage_utility_httpclient
integer x = 1079
integer y = 56
integer width = 457
integer height = 132
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "SyncProxy"
end type

event clicked;/*
* HttpClient 代理测试
*/
n_httpresponse httpResponse

//设置超时时间为10s
httpClient.SetTimeout(10)
//设置代理模式为自动检查(使用IE的代理配置,支持PAC)
httpClient.SetProxyMode(Enums.HTTP_PROXY_AUTO)
//也可以直接指定代理
//httpClient.SetProxyMode(Enums.HTTP_PROXY_PROVIDED)
//httpClient.SetProxyAddress("http://127.0.0.1:1080")
//httpClient.SetProxyCredential("test","test")
//发送请求并接收响应数据
httpResponse = httpClient.Request("GET","http://www.google.com")
//显示响应结果
if httpResponse.IsValid() then
	mle_response.Text = "Headers:~r~n" + httpResponse.GetHeaders() + "~r~nResponse:~r~n" + httpResponse.GetDataString()
else
	mle_response.Text = "Error:" + String(httpResponse.GetError()) + "~r~nError Info:~r~n" + httpResponse.GetErrorInfo()
end if
end event

type cb_4 from se_cst_button within u_cst_tabpage_utility_httpclient
integer x = 1591
integer y = 56
integer width = 457
integer height = 132
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "AsyncProxy"
end type

event clicked;/*
* HttpClient 异步代理测试
*/

//设置超时时间为10s
httpClient.SetTimeout(10)
//设置代理模式为自动检查(使用IE的代理配置,支持PAC)
httpClient.SetProxyMode(Enums.HTTP_PROXY_AUTO)
//也可以直接指定代理
//httpClient.SetProxyMode(Enums.HTTP_PROXY_PROVIDED)
//httpClient.SetProxyAddress("http://127.0.0.1:1080")
//httpClient.SetProxyCredential("test","test")
//发送请求
//*可以通过REQ_TEST来取消该请求
//*在httpclient对象的OnComplete事件中接收响应结果
httpClient.Request(REQ_TEST,"GET","https://www.google.hk")
end event

type cb_12 from se_cst_button within u_cst_tabpage_utility_httpclient
integer x = 2103
integer y = 56
integer width = 571
integer height = 132
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "CancelRequest"
end type

event clicked;httpClient.Cancel(REQ_TEST)
end event

type cb_26 from se_cst_button within u_cst_tabpage_utility_httpclient
integer x = 759
integer y = 268
integer width = 635
integer height = 132
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "Async RESTful"
end type

event clicked;/*
*	HttpClient 异步请求 - RESTful风格
*/
n_json json,jsonParm,jsonResult

json = Create n_json
jsonParm = Create n_json

//构建JSON数据包
//该数据包字符串化为:
// '{"sid":"sid","method":"query","param":{"qid":1},"timestamp":"YYYY-MM-DD HH:MM:SS","sign":"sign"}'
jsonParm.SetItem("qid",1)
json.SetItem("sid","sid")
json.SetItem("method","query")
json.SetItem("param",jsonParm)
json.SetItem("timestamp",String(DateTime(ToDay(),Now()),"YYYY-MM-DD HH:MM:SS"))
json.SetItem("sign","sign")

//发送请求
//*发送JSON对象时默认Content-Type为application/json; charset=utf-8,你也可以手动指定为其它的
//*可以通过REQ_TEST来取消该请求
//*在httpclient对象的OnComplete事件中接收响应结果
httpClient.Request(REQ_TEST,Enums.HTTP_METHOD_POST,"http://你的RESTful服务地址",json)

Destroy json
Destroy jsonParm
end event

type cb_27 from se_cst_button within u_cst_tabpage_utility_httpclient
integer x = 55
integer y = 268
integer width = 594
integer height = 132
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "Sync RESTful"
end type

event clicked;/*
*	HttpClient 同步请求 - RESTful风格
*/
n_httpresponse httpResponse
n_json json,jsonParm,jsonResult

json = Create n_json
jsonParm = Create n_json

//构建JSON数据包
//该数据包字符串化为:
// '{"sid":"sid","method":"query","param":{"qid":1},"timestamp":"YYYY-MM-DD HH:MM:SS","sign":"sign"}'
jsonParm.SetItem("qid",1)
json.SetItem("sid","sid")
json.SetItem("method","query")
json.SetItem("param",jsonParm)
json.SetItem("timestamp",String(DateTime(ToDay(),Now()),"YYYY-MM-DD HH:MM:SS"))
json.SetItem("sign","sign")

//发送请求并接收响应数据
//*发送JSON对象时默认Content-Type为application/json; charset=utf-8,你也可以手动指定为其它的
httpResponse = httpClient.Request(Enums.HTTP_METHOD_POST,"http://你的RESTful服务地址",json)
//显示响应结果
if httpResponse.IsValid() then
	mle_response.Text = "Headers:~r~n" + httpResponse.GetHeaders() + "~r~nResponse:~r~n" + httpResponse.GetDataString()
else
	mle_response.Text = "Error:" + String(httpResponse.GetError()) + "~r~nError Info:~r~n" + httpResponse.GetErrorInfo()
end if

//获取JSON数据(自动解析为JSON对象)
jsonResult = httpResponse.GetDataJSON()

//取响应数据的sign节点值
MessageBox("sign",jsonResult.GetItemString("sign"))

Destroy json
Destroy jsonParm
end event

type mle_response from se_cst_multilineedit within u_cst_tabpage_utility_httpclient
integer x = 14
integer y = 572
integer width = 4315
integer height = 1096
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = ""
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
end type

type httpclient from n_httpclient within u_cst_tabpage_utility_httpclient descriptor "pb_nvo" = "true" 
end type

on httpclient.create
call super::create
end on

on httpclient.destroy
call super::destroy
end on

event oncomplete;call super::oncomplete;/*
*	HttpClient 异步请求结束通知 
*	该事件无论请求成功或失败都会被触发,OnSuccess只有在请求发送成功才会触发,OnError则只有在请求发送失败才会触发
*/
st_transdata.Text = ""
if response.IsValid() then
	mle_response.Text = "Request ID:" + String(id) + "~r~nHeaders:~r~n" + response.GetHeaders() + "~r~nResponse:~r~n" + response.GetDataString()
else
	mle_response.Text = "Request ID:" + String(id) + "~r~nHTTP Status:" + String(response.GetHttpStatus()) + "~r~nError:" + String(response.GetError()) + "~r~nError Info:~r~n" + response.GetErrorInfo()
end if
return 0
end event

event ontransdata;call super::ontransdata;/*
*	HttpClient 异步请求数据传输通知 
*	返回1取消传输同时取消请求
*/
string sTransType

choose case transType
	case Enums.HTTP_TRANS_READ
		sTransType = "HTTP_TRANS_READ"
	case Enums.HTTP_TRANS_WRITE
		sTransType = "HTTP_TRANS_WRITE"
end choose

st_transdata.Text = Sprintf("id {1} transType {2} totalSize {3} transSize {4} speed {5}",id,sTransType,of_Bytes2String(totalSize),of_Bytes2String(transSize),of_Bytes2String(speed))

return 0
end event

