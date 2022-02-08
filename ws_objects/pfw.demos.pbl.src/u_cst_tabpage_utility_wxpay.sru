$PBExportHeader$u_cst_tabpage_utility_wxpay.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_utility_wxpay from ue_cst_tabpage
end type
type cb_11 from se_cst_button within u_cst_tabpage_utility_wxpay
end type
type cb_2 from se_cst_button within u_cst_tabpage_utility_wxpay
end type
type cb_3 from se_cst_button within u_cst_tabpage_utility_wxpay
end type
type cb_4 from se_cst_button within u_cst_tabpage_utility_wxpay
end type
type cb_5 from se_cst_button within u_cst_tabpage_utility_wxpay
end type
type cb_6 from se_cst_button within u_cst_tabpage_utility_wxpay
end type
type cb_7 from se_cst_button within u_cst_tabpage_utility_wxpay
end type
type cb_8 from se_cst_button within u_cst_tabpage_utility_wxpay
end type
type cb_1 from se_cst_button within u_cst_tabpage_utility_wxpay
end type
type cb_10 from se_cst_button within u_cst_tabpage_utility_wxpay
end type
type st_1 from statictext within u_cst_tabpage_utility_wxpay
end type
type st_response from statictext within u_cst_tabpage_utility_wxpay
end type
type st_trade from statictext within u_cst_tabpage_utility_wxpay
end type
type st_config from statictext within u_cst_tabpage_utility_wxpay
end type
type st_10 from statictext within u_cst_tabpage_utility_wxpay
end type
type sle_trade_no from se_cst_singlelineedit within u_cst_tabpage_utility_wxpay
end type
type sle_subject from se_cst_singlelineedit within u_cst_tabpage_utility_wxpay
end type
type st_7 from statictext within u_cst_tabpage_utility_wxpay
end type
type st_8 from statictext within u_cst_tabpage_utility_wxpay
end type
type em_amount from se_cst_editmask within u_cst_tabpage_utility_wxpay
end type
type sle_auth_code from se_cst_singlelineedit within u_cst_tabpage_utility_wxpay
end type
type st_9 from statictext within u_cst_tabpage_utility_wxpay
end type
type st_6 from statictext within u_cst_tabpage_utility_wxpay
end type
type sle_key from se_cst_singlelineedit within u_cst_tabpage_utility_wxpay
end type
type sle_mchid from se_cst_singlelineedit within u_cst_tabpage_utility_wxpay
end type
type st_2 from statictext within u_cst_tabpage_utility_wxpay
end type
type cb_9 from se_cst_button within u_cst_tabpage_utility_wxpay
end type
type st_3 from statictext within u_cst_tabpage_utility_wxpay
end type
type st_4 from statictext within u_cst_tabpage_utility_wxpay
end type
type mle_cert from se_cst_multilineedit within u_cst_tabpage_utility_wxpay
end type
type mle_certkey from se_cst_multilineedit within u_cst_tabpage_utility_wxpay
end type
type st_5 from statictext within u_cst_tabpage_utility_wxpay
end type
type mle_response from se_cst_multilineedit within u_cst_tabpage_utility_wxpay
end type
type sle_appid from se_cst_singlelineedit within u_cst_tabpage_utility_wxpay
end type
type wxpay from n_cst_wxpay within u_cst_tabpage_utility_wxpay
end type
end forward

global type u_cst_tabpage_utility_wxpay from ue_cst_tabpage
integer width = 3762
integer height = 2960
boolean vscrollbar = true
cb_11 cb_11
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
cb_1 cb_1
cb_10 cb_10
st_1 st_1
st_response st_response
st_trade st_trade
st_config st_config
st_10 st_10
sle_trade_no sle_trade_no
sle_subject sle_subject
st_7 st_7
st_8 st_8
em_amount em_amount
sle_auth_code sle_auth_code
st_9 st_9
st_6 st_6
sle_key sle_key
sle_mchid sle_mchid
st_2 st_2
cb_9 cb_9
st_3 st_3
st_4 st_4
mle_cert mle_cert
mle_certkey mle_certkey
st_5 st_5
mle_response mle_response
sle_appid sle_appid
wxpay wxpay
end type
global u_cst_tabpage_utility_wxpay u_cst_tabpage_utility_wxpay

on u_cst_tabpage_utility_wxpay.create
int iCurrent
call super::create
this.cb_11=create cb_11
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_1=create cb_1
this.cb_10=create cb_10
this.st_1=create st_1
this.st_response=create st_response
this.st_trade=create st_trade
this.st_config=create st_config
this.st_10=create st_10
this.sle_trade_no=create sle_trade_no
this.sle_subject=create sle_subject
this.st_7=create st_7
this.st_8=create st_8
this.em_amount=create em_amount
this.sle_auth_code=create sle_auth_code
this.st_9=create st_9
this.st_6=create st_6
this.sle_key=create sle_key
this.sle_mchid=create sle_mchid
this.st_2=create st_2
this.cb_9=create cb_9
this.st_3=create st_3
this.st_4=create st_4
this.mle_cert=create mle_cert
this.mle_certkey=create mle_certkey
this.st_5=create st_5
this.mle_response=create mle_response
this.sle_appid=create sle_appid
this.wxpay=create wxpay
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_11
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_4
this.Control[iCurrent+5]=this.cb_5
this.Control[iCurrent+6]=this.cb_6
this.Control[iCurrent+7]=this.cb_7
this.Control[iCurrent+8]=this.cb_8
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_10
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.st_response
this.Control[iCurrent+13]=this.st_trade
this.Control[iCurrent+14]=this.st_config
this.Control[iCurrent+15]=this.st_10
this.Control[iCurrent+16]=this.sle_trade_no
this.Control[iCurrent+17]=this.sle_subject
this.Control[iCurrent+18]=this.st_7
this.Control[iCurrent+19]=this.st_8
this.Control[iCurrent+20]=this.em_amount
this.Control[iCurrent+21]=this.sle_auth_code
this.Control[iCurrent+22]=this.st_9
this.Control[iCurrent+23]=this.st_6
this.Control[iCurrent+24]=this.sle_key
this.Control[iCurrent+25]=this.sle_mchid
this.Control[iCurrent+26]=this.st_2
this.Control[iCurrent+27]=this.cb_9
this.Control[iCurrent+28]=this.st_3
this.Control[iCurrent+29]=this.st_4
this.Control[iCurrent+30]=this.mle_cert
this.Control[iCurrent+31]=this.mle_certkey
this.Control[iCurrent+32]=this.st_5
this.Control[iCurrent+33]=this.mle_response
this.Control[iCurrent+34]=this.sle_appid
end on

on u_cst_tabpage_utility_wxpay.destroy
call super::destroy
destroy(this.cb_11)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_1)
destroy(this.cb_10)
destroy(this.st_1)
destroy(this.st_response)
destroy(this.st_trade)
destroy(this.st_config)
destroy(this.st_10)
destroy(this.sle_trade_no)
destroy(this.sle_subject)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.em_amount)
destroy(this.sle_auth_code)
destroy(this.st_9)
destroy(this.st_6)
destroy(this.sle_key)
destroy(this.sle_mchid)
destroy(this.st_2)
destroy(this.cb_9)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.mle_cert)
destroy(this.mle_certkey)
destroy(this.st_5)
destroy(this.mle_response)
destroy(this.sle_appid)
destroy(this.wxpay)
end on

event resize;call super::resize;long nHeight

nHeight = newHeight - mle_response.y - 4
if U2PY(nHeight) < 400 then nHeight= P2UY(400)

mle_response.Resize(newWidth - mle_response.x * 2,nHeight)
end event

event other;call super::other;Int zDelta

choose case message.number
	case WinMSG.WM_MOUSEWHEEL
		zDelta = HiWord(wparam)
		if zDelta > 0 then
			if zDelta / WinMsg.WHEEL_DELTA > 1 then
				Send(Handle(this),WinMSG.WM_VSCROLL,WinMsg.SB_PAGEUP,0)
			else
				Send(Handle(this),WinMSG.WM_VSCROLL,WinMsg.SB_LINEUP,0)
			end if
		else
			if Abs(zDelta) / WinMsg.WHEEL_DELTA > 1 then
				Send(Handle(this),WinMSG.WM_VSCROLL,WinMsg.SB_PAGEDOWN,0)
			else
				Send(Handle(this),WinMSG.WM_VSCROLL,WinMsg.SB_LINEDOWN,0)
			end if
		end if
end choose
end event

type cb_11 from se_cst_button within u_cst_tabpage_utility_wxpay
integer x = 96
integer y = 2068
integer width = 457
integer height = 132
integer taborder = 40
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "请求支付"
end type

event clicked;n_cst_wxpay_response rsp
n_json jsonParam,jsonResult

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)
jsonParam.SetItem("body",sle_subject.Text)
jsonParam.SetItem("total_fee",Double(em_amount.Text)) //of_Pay函数内部自动转换金额单位为分!(微信接口要求金额单位为分并且不支持小数)
jsonParam.SetItem("auth_code",sle_auth_code.Text)

rsp = wxpay.of_Pay(jsonParam)
choose case rsp.of_GetStatus()
	case rsp.STATUS_SUCCESS
		jsonResult = rsp.of_GetResult()
		mle_response.Text = "------ STATUS_SUCCESS ------~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case rsp.STATUS_FAILED
		jsonResult = rsp.of_GetResult()
		mle_response.Text = "------ STATUS_FAILED ------~r~nError:~r~n" + rsp.of_GetErrorInfo() + "~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case rsp.STATUS_ERROR
		mle_response.Text = "------ STATUS_ERROR ------~r~n" + rsp.of_GetErrorInfo() + "~r~n------ Raw Response ------~r~n" + rsp.of_GetHttpResponse().GetDataString()
end choose

Destroy jsonParam
end event

type cb_2 from se_cst_button within u_cst_tabpage_utility_wxpay
integer x = 631
integer y = 2068
integer width = 457
integer height = 132
integer taborder = 40
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "查询订单"
end type

event clicked;n_cst_wxpay_response rsp
n_json jsonParam,jsonResult

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)

rsp = wxpay.of_OrderQuery(jsonParam)
choose case rsp.of_GetStatus()
	case rsp.STATUS_SUCCESS
		jsonResult = rsp.of_GetResult()
		mle_response.Text = "------ STATUS_SUCCESS ------~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case rsp.STATUS_FAILED
		jsonResult = rsp.of_GetResult()
		mle_response.Text = "------ STATUS_FAILED ------~r~nError:~r~n" + rsp.of_GetErrorInfo() + "~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case rsp.STATUS_ERROR
		mle_response.Text = "------ STATUS_ERROR ------~r~n" + rsp.of_GetErrorInfo() + "~r~n------ Raw Response ------~r~n" + rsp.of_GetHttpResponse().GetDataString()
end choose

Destroy jsonParam
end event

type cb_3 from se_cst_button within u_cst_tabpage_utility_wxpay
integer x = 1193
integer y = 2064
integer width = 457
integer height = 132
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "撤销订单"
end type

event clicked;n_cst_wxpay_response rsp
n_json jsonParam,jsonResult

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)

rsp = wxpay.of_Reverse(jsonParam)
choose case rsp.of_GetStatus()
	case rsp.STATUS_SUCCESS
		jsonResult = rsp.of_GetResult()
		mle_response.Text = "------ STATUS_SUCCESS ------~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case rsp.STATUS_FAILED
		jsonResult = rsp.of_GetResult()
		mle_response.Text = "------ STATUS_FAILED ------~r~nError:~r~n" + rsp.of_GetErrorInfo() + "~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case rsp.STATUS_ERROR
		mle_response.Text = "------ STATUS_ERROR ------~r~n" + rsp.of_GetErrorInfo() + "~r~n------ Raw Response ------~r~n" + rsp.of_GetHttpResponse().GetDataString()
end choose

Destroy jsonParam
end event

type cb_4 from se_cst_button within u_cst_tabpage_utility_wxpay
integer x = 1774
integer y = 2072
integer width = 457
integer height = 132
integer taborder = 40
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "退款"
end type

event clicked;n_cst_wxpay_response rsp
n_json jsonParam,jsonResult

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)
jsonParam.SetItem("out_refund_no",sle_trade_no.Text)
jsonParam.SetItem("total_fee",Double(em_amount.Text)) //of_Refund函数内部自动转换金额单位为分!(微信接口要求金额单位为分并且不支持小数)
jsonParam.SetItem("refund_fee",jsonParam.GetItemDouble("total_fee"))

rsp = wxpay.of_Refund(jsonParam)
choose case rsp.of_GetStatus()
	case rsp.STATUS_SUCCESS
		jsonResult = rsp.of_GetResult()
		mle_response.Text = "------ STATUS_SUCCESS ------~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case rsp.STATUS_FAILED
		jsonResult = rsp.of_GetResult()
		mle_response.Text = "------ STATUS_FAILED ------~r~nError:~r~n" + rsp.of_GetErrorInfo() + "~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case rsp.STATUS_ERROR
		mle_response.Text = "------ STATUS_ERROR ------~r~n" + rsp.of_GetErrorInfo() + "~r~n------ Raw Response ------~r~n" + rsp.of_GetHttpResponse().GetDataString()
end choose

Destroy jsonParam
end event

type cb_5 from se_cst_button within u_cst_tabpage_utility_wxpay
integer x = 2341
integer y = 2068
integer width = 489
integer height = 132
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "退款查询"
end type

event clicked;n_cst_wxpay_response rsp
n_json jsonParam,jsonResult

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)

rsp = wxpay.of_RefundQuery(jsonParam)
choose case rsp.of_GetStatus()
	case rsp.STATUS_SUCCESS
		jsonResult = rsp.of_GetResult()
		mle_response.Text = "------ STATUS_SUCCESS ------~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case rsp.STATUS_FAILED
		jsonResult = rsp.of_GetResult()
		mle_response.Text = "------ STATUS_FAILED ------~r~nError:~r~n" + rsp.of_GetErrorInfo() + "~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case rsp.STATUS_ERROR
		mle_response.Text = "------ STATUS_ERROR ------~r~n" + rsp.of_GetErrorInfo() + "~r~n------ Raw Response ------~r~n" + rsp.of_GetHttpResponse().GetDataString()
end choose

Destroy jsonParam
end event

type cb_6 from se_cst_button within u_cst_tabpage_utility_wxpay
integer x = 2345
integer y = 2212
integer width = 503
integer height = 132
integer taborder = 50
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "异步退款查询"
end type

event clicked;n_json jsonParam

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)

//在OnRefundQueryComplete事件中获取响应结果
wxpay.of_RefundQueryAsync(jsonParam)

Destroy jsonParam
end event

type cb_7 from se_cst_button within u_cst_tabpage_utility_wxpay
integer x = 1778
integer y = 2216
integer width = 457
integer height = 132
integer taborder = 50
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "异步退款"
end type

event clicked;n_json jsonParam

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)
jsonParam.SetItem("out_refund_no",sle_trade_no.Text)
jsonParam.SetItem("total_fee",Double(em_amount.Text)) //of_RefundAsync函数内部自动转换金额单位为分!(微信接口要求金额单位为分并且不支持小数)
jsonParam.SetItem("refund_fee",jsonParam.GetItemDouble("total_fee"))

//在OnRefundComplete事件中获取响应结果
wxpay.of_RefundAsync(jsonParam)

Destroy jsonParam
end event

type cb_8 from se_cst_button within u_cst_tabpage_utility_wxpay
integer x = 1198
integer y = 2208
integer width = 503
integer height = 132
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "异步撤销订单"
end type

event clicked;n_json jsonParam

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)

//在OnReverseComplete事件中获取响应结果
wxpay.of_ReverseAsync(jsonParam)

Destroy jsonParam
end event

type cb_1 from se_cst_button within u_cst_tabpage_utility_wxpay
integer x = 635
integer y = 2212
integer width = 503
integer height = 132
integer taborder = 40
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "异步查询订单"
end type

event clicked;n_json jsonParam

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)

//在OnOrderQueryComplete事件中获取响应结果
wxpay.of_OrderQueryAsync(jsonParam)

Destroy jsonParam
end event

type cb_10 from se_cst_button within u_cst_tabpage_utility_wxpay
integer x = 101
integer y = 2212
integer width = 503
integer height = 132
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "异步请求支付"
end type

event clicked;n_json jsonParam

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)
jsonParam.SetItem("body",sle_subject.Text)
jsonParam.SetItem("total_fee",Double(em_amount.Text)) //of_PayAsync函数内部自动转换金额单位为分!(微信接口要求金额单位为分并且不支持小数)
jsonParam.SetItem("auth_code",sle_auth_code.Text)

//在OnPayComplete事件中获取响应结果
wxpay.of_PayAsync(jsonParam)

Destroy jsonParam
end event

type st_1 from statictext within u_cst_tabpage_utility_wxpay
integer x = 1262
integer y = 1840
integer width = 114
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "元"
boolean focusrectangle = false
end type

type st_response from statictext within u_cst_tabpage_utility_wxpay
integer x = 23
integer y = 2376
integer width = 3717
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = " 服务器响应数据"
boolean focusrectangle = false
end type

type st_trade from statictext within u_cst_tabpage_utility_wxpay
integer x = 23
integer y = 1480
integer width = 3717
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = " 交易"
boolean focusrectangle = false
end type

type st_config from statictext within u_cst_tabpage_utility_wxpay
integer x = 23
integer y = 32
integer width = 3717
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = " 接口配置"
boolean focusrectangle = false
end type

type st_10 from statictext within u_cst_tabpage_utility_wxpay
integer x = 114
integer y = 1580
integer width = 251
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "交易号"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_trade_no from se_cst_singlelineedit within u_cst_tabpage_utility_wxpay
integer x = 384
integer y = 1576
integer width = 855
integer height = 100
integer taborder = 30
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "TESTBILLNO123456"
end type

type sle_subject from se_cst_singlelineedit within u_cst_tabpage_utility_wxpay
integer x = 384
integer y = 1696
integer width = 855
integer height = 100
integer taborder = 30
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "标题"
end type

type st_7 from statictext within u_cst_tabpage_utility_wxpay
integer x = 114
integer y = 1700
integer width = 206
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "标题"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within u_cst_tabpage_utility_wxpay
integer x = 114
integer y = 1828
integer width = 251
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "金额"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_amount from se_cst_editmask within u_cst_tabpage_utility_wxpay
integer x = 384
integer y = 1816
integer width = 855
integer height = 116
integer taborder = 30
string text = "1"
string mask = "###,###.00"
end type

type sle_auth_code from se_cst_singlelineedit within u_cst_tabpage_utility_wxpay
integer x = 384
integer y = 1952
integer width = 855
integer height = 100
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = ""
end type

type st_9 from statictext within u_cst_tabpage_utility_wxpay
integer x = 114
integer y = 1956
integer width = 233
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "支付码"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within u_cst_tabpage_utility_wxpay
integer x = 123
integer y = 364
integer width = 306
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "商户私钥"
boolean focusrectangle = false
end type

type sle_key from se_cst_singlelineedit within u_cst_tabpage_utility_wxpay
integer x = 425
integer y = 360
integer width = 791
integer height = 100
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = ""
end type

type sle_mchid from se_cst_singlelineedit within u_cst_tabpage_utility_wxpay
integer x = 361
integer y = 248
integer width = 855
integer height = 100
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = ""
end type

type st_2 from statictext within u_cst_tabpage_utility_wxpay
integer x = 123
integer y = 248
integer width = 251
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "商户号"
boolean focusrectangle = false
end type

type cb_9 from se_cst_button within u_cst_tabpage_utility_wxpay
integer x = 718
integer y = 1344
integer width = 361
integer height = 120
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "应用"
end type

event clicked;call super::clicked;wxpay.of_SetAppID(sle_appid.Text)
wxpay.of_SetMchID(sle_mchid.Text)
wxpay.of_SetKey(sle_key.Text)
wxpay.of_SetCertInfo(mle_cert.Text,mle_certkey.Text)
end event

type st_3 from statictext within u_cst_tabpage_utility_wxpay
integer x = 123
integer y = 140
integer width = 251
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "AppID"
boolean focusrectangle = false
end type

type st_4 from statictext within u_cst_tabpage_utility_wxpay
integer x = 123
integer y = 468
integer width = 1600
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "商户证书 (PEM格式的证书,如:apiclient_cert.pem)"
boolean focusrectangle = false
end type

type mle_cert from se_cst_multilineedit within u_cst_tabpage_utility_wxpay
integer x = 123
integer y = 556
integer width = 1559
integer height = 316
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = ""
boolean vscrollbar = true
boolean autovscroll = true
end type

type mle_certkey from se_cst_multilineedit within u_cst_tabpage_utility_wxpay
integer x = 123
integer y = 968
integer width = 1559
integer height = 360
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = ""
boolean vscrollbar = true
boolean autovscroll = true
end type

type st_5 from statictext within u_cst_tabpage_utility_wxpay
integer x = 123
integer y = 880
integer width = 1970
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "商户证书私钥 (PEM PKCS8格式的证书,如:apiclient_key.pem)"
boolean focusrectangle = false
end type

type mle_response from se_cst_multilineedit within u_cst_tabpage_utility_wxpay
integer x = 18
integer y = 2464
integer width = 3721
integer height = 484
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = ""
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
boolean displayonly = true
end type

type sle_appid from se_cst_singlelineedit within u_cst_tabpage_utility_wxpay
integer x = 361
integer y = 136
integer width = 855
integer height = 100
integer taborder = 10
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = ""
end type

type wxpay from n_cst_wxpay within u_cst_tabpage_utility_wxpay descriptor "pb_nvo" = "true" 
end type

on wxpay.create
call super::create
end on

on wxpay.destroy
call super::destroy
end on

event onorderquerycomplete;call super::onorderquerycomplete;n_json jsonResult

choose case response.of_GetStatus()
	case response.STATUS_SUCCESS
		jsonResult = response.of_GetResult()
		mle_response.Text = "------ Async Order Query - STATUS_SUCCESS ------~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case response.STATUS_FAILED
		jsonResult = response.of_GetResult()
		mle_response.Text = "------ Async Order Query - STATUS_FAILED ------~r~nError:~r~n" + response.of_GetErrorInfo() + "~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case response.STATUS_ERROR
		mle_response.Text = "------ Async Order Query - STATUS_ERROR ------~r~n" + response.of_GetErrorInfo() + "~r~n------ Raw Response ------~r~n" + response.of_GetHttpResponse().GetDataString()
	case response.STATUS_CANCELLED
		mle_response.Text = "------ Async Order Query - STATUS_CANCELLED ------~r~n" + response.of_GetErrorInfo()
end choose
end event

event onpaycomplete;call super::onpaycomplete;n_json jsonResult

choose case response.of_GetStatus()
	case response.STATUS_SUCCESS
		jsonResult = response.of_GetResult()
		mle_response.Text = "------ Async Pay - STATUS_SUCCESS ------~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case response.STATUS_FAILED
		jsonResult = response.of_GetResult()
		mle_response.Text = "------ Async Pay - STATUS_FAILED ------~r~nError:~r~n" + response.of_GetErrorInfo() + "~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case response.STATUS_ERROR
		mle_response.Text = "------ Async Pay - STATUS_ERROR ------~r~n" + response.of_GetErrorInfo() + "~r~n------ Raw Response ------~r~n" + response.of_GetHttpResponse().GetDataString()
	case response.STATUS_CANCELLED
		mle_response.Text = "------ Async Pay - STATUS_CANCELLED ------~r~n" + response.of_GetErrorInfo()
end choose
end event

event onrefundcomplete;call super::onrefundcomplete;n_json jsonResult

choose case response.of_GetStatus()
	case response.STATUS_SUCCESS
		jsonResult = response.of_GetResult()
		mle_response.Text = "------ Async Refund - STATUS_SUCCESS ------~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case response.STATUS_FAILED
		jsonResult = response.of_GetResult()
		mle_response.Text = "------ Async Refund - STATUS_FAILED ------~r~nError:~r~n" + response.of_GetErrorInfo() + "~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case response.STATUS_ERROR
		mle_response.Text = "------ Async Refund - STATUS_ERROR ------~r~n" + response.of_GetErrorInfo() + "~r~n------ Raw Response ------~r~n" + response.of_GetHttpResponse().GetDataString()
	case response.STATUS_CANCELLED
		mle_response.Text = "------ Async Refund - STATUS_CANCELLED ------~r~n" + response.of_GetErrorInfo()
end choose
end event

event onrefundquerycomplete;call super::onrefundquerycomplete;n_json jsonResult

choose case response.of_GetStatus()
	case response.STATUS_SUCCESS
		jsonResult = response.of_GetResult()
		mle_response.Text = "------ Async Refund Query - STATUS_SUCCESS ------~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case response.STATUS_FAILED
		jsonResult = response.of_GetResult()
		mle_response.Text = "------ Async Refund Query - STATUS_FAILED ------~r~nError:~r~n" + response.of_GetErrorInfo() + "~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case response.STATUS_ERROR
		mle_response.Text = "------ Async Refund Query - STATUS_ERROR ------~r~n" + response.of_GetErrorInfo() + "~r~n------ Raw Response ------~r~n" + response.of_GetHttpResponse().GetDataString()
	case response.STATUS_CANCELLED
		mle_response.Text = "------ Async Refund Query - STATUS_CANCELLED ------~r~n" + response.of_GetErrorInfo()
end choose
end event

event onreversecomplete;call super::onreversecomplete;n_json jsonResult

choose case response.of_GetStatus()
	case response.STATUS_SUCCESS
		jsonResult = response.of_GetResult()
		mle_response.Text = "------ Async Reverse - STATUS_SUCCESS ------~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case response.STATUS_FAILED
		jsonResult = response.of_GetResult()
		mle_response.Text = "------ Async Reverse - STATUS_FAILED ------~r~nError:~r~n" + response.of_GetErrorInfo() + "~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case response.STATUS_ERROR
		mle_response.Text = "------ Async Reverse - STATUS_ERROR ------~r~n" + response.of_GetErrorInfo() + "~r~n------ Raw Response ------~r~n" + response.of_GetHttpResponse().GetDataString()
	case response.STATUS_CANCELLED
		mle_response.Text = "------ Async Reverse - STATUS_CANCELLED ------~r~n" + response.of_GetErrorInfo()
end choose
end event

