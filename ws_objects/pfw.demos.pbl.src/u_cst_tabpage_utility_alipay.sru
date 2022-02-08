$PBExportHeader$u_cst_tabpage_utility_alipay.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_utility_alipay from ue_cst_tabpage
end type
type st_2 from statictext within u_cst_tabpage_utility_alipay
end type
type ddlb_signtype from se_cst_dropdownlist within u_cst_tabpage_utility_alipay
end type
type st_1 from statictext within u_cst_tabpage_utility_alipay
end type
type st_response from statictext within u_cst_tabpage_utility_alipay
end type
type cb_9 from se_cst_button within u_cst_tabpage_utility_alipay
end type
type st_9 from statictext within u_cst_tabpage_utility_alipay
end type
type sle_auth_code from se_cst_singlelineedit within u_cst_tabpage_utility_alipay
end type
type em_amount from se_cst_editmask within u_cst_tabpage_utility_alipay
end type
type st_8 from statictext within u_cst_tabpage_utility_alipay
end type
type st_7 from statictext within u_cst_tabpage_utility_alipay
end type
type sle_subject from se_cst_singlelineedit within u_cst_tabpage_utility_alipay
end type
type sle_trade_no from se_cst_singlelineedit within u_cst_tabpage_utility_alipay
end type
type st_6 from statictext within u_cst_tabpage_utility_alipay
end type
type st_5 from statictext within u_cst_tabpage_utility_alipay
end type
type mle_pubkey from se_cst_multilineedit within u_cst_tabpage_utility_alipay
end type
type mle_prikey from se_cst_multilineedit within u_cst_tabpage_utility_alipay
end type
type st_4 from statictext within u_cst_tabpage_utility_alipay
end type
type st_3 from statictext within u_cst_tabpage_utility_alipay
end type
type st_trade from statictext within u_cst_tabpage_utility_alipay
end type
type st_config from statictext within u_cst_tabpage_utility_alipay
end type
type cb_1 from se_cst_button within u_cst_tabpage_utility_alipay
end type
type cb_2 from se_cst_button within u_cst_tabpage_utility_alipay
end type
type cb_3 from se_cst_button within u_cst_tabpage_utility_alipay
end type
type cb_4 from se_cst_button within u_cst_tabpage_utility_alipay
end type
type cb_6 from se_cst_button within u_cst_tabpage_utility_alipay
end type
type cb_5 from se_cst_button within u_cst_tabpage_utility_alipay
end type
type cb_7 from se_cst_button within u_cst_tabpage_utility_alipay
end type
type cb_8 from se_cst_button within u_cst_tabpage_utility_alipay
end type
type mle_response from se_cst_multilineedit within u_cst_tabpage_utility_alipay
end type
type sle_appid from se_cst_singlelineedit within u_cst_tabpage_utility_alipay
end type
type alipay from n_cst_alipay within u_cst_tabpage_utility_alipay
end type
end forward

global type u_cst_tabpage_utility_alipay from ue_cst_tabpage
integer width = 3771
integer height = 3336
boolean vscrollbar = true
st_2 st_2
ddlb_signtype ddlb_signtype
st_1 st_1
st_response st_response
cb_9 cb_9
st_9 st_9
sle_auth_code sle_auth_code
em_amount em_amount
st_8 st_8
st_7 st_7
sle_subject sle_subject
sle_trade_no sle_trade_no
st_6 st_6
st_5 st_5
mle_pubkey mle_pubkey
mle_prikey mle_prikey
st_4 st_4
st_3 st_3
st_trade st_trade
st_config st_config
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_6 cb_6
cb_5 cb_5
cb_7 cb_7
cb_8 cb_8
mle_response mle_response
sle_appid sle_appid
alipay alipay
end type
global u_cst_tabpage_utility_alipay u_cst_tabpage_utility_alipay

on u_cst_tabpage_utility_alipay.create
int iCurrent
call super::create
this.st_2=create st_2
this.ddlb_signtype=create ddlb_signtype
this.st_1=create st_1
this.st_response=create st_response
this.cb_9=create cb_9
this.st_9=create st_9
this.sle_auth_code=create sle_auth_code
this.em_amount=create em_amount
this.st_8=create st_8
this.st_7=create st_7
this.sle_subject=create sle_subject
this.sle_trade_no=create sle_trade_no
this.st_6=create st_6
this.st_5=create st_5
this.mle_pubkey=create mle_pubkey
this.mle_prikey=create mle_prikey
this.st_4=create st_4
this.st_3=create st_3
this.st_trade=create st_trade
this.st_config=create st_config
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_7=create cb_7
this.cb_8=create cb_8
this.mle_response=create mle_response
this.sle_appid=create sle_appid
this.alipay=create alipay
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.ddlb_signtype
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_response
this.Control[iCurrent+5]=this.cb_9
this.Control[iCurrent+6]=this.st_9
this.Control[iCurrent+7]=this.sle_auth_code
this.Control[iCurrent+8]=this.em_amount
this.Control[iCurrent+9]=this.st_8
this.Control[iCurrent+10]=this.st_7
this.Control[iCurrent+11]=this.sle_subject
this.Control[iCurrent+12]=this.sle_trade_no
this.Control[iCurrent+13]=this.st_6
this.Control[iCurrent+14]=this.st_5
this.Control[iCurrent+15]=this.mle_pubkey
this.Control[iCurrent+16]=this.mle_prikey
this.Control[iCurrent+17]=this.st_4
this.Control[iCurrent+18]=this.st_3
this.Control[iCurrent+19]=this.st_trade
this.Control[iCurrent+20]=this.st_config
this.Control[iCurrent+21]=this.cb_1
this.Control[iCurrent+22]=this.cb_2
this.Control[iCurrent+23]=this.cb_3
this.Control[iCurrent+24]=this.cb_4
this.Control[iCurrent+25]=this.cb_6
this.Control[iCurrent+26]=this.cb_5
this.Control[iCurrent+27]=this.cb_7
this.Control[iCurrent+28]=this.cb_8
this.Control[iCurrent+29]=this.mle_response
this.Control[iCurrent+30]=this.sle_appid
end on

on u_cst_tabpage_utility_alipay.destroy
call super::destroy
destroy(this.st_2)
destroy(this.ddlb_signtype)
destroy(this.st_1)
destroy(this.st_response)
destroy(this.cb_9)
destroy(this.st_9)
destroy(this.sle_auth_code)
destroy(this.em_amount)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.sle_subject)
destroy(this.sle_trade_no)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.mle_pubkey)
destroy(this.mle_prikey)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_trade)
destroy(this.st_config)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.mle_response)
destroy(this.sle_appid)
destroy(this.alipay)
end on

event resize;call super::resize;long nHeight

st_config.Resize(newWidth - st_config.x * 2,st_config.height)
st_trade.Resize(newWidth - st_trade.x * 2,st_trade.height)
st_response.Resize(newWidth - st_response.x * 2,st_response.height)

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

type st_2 from statictext within u_cst_tabpage_utility_alipay
integer x = 119
integer y = 1104
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
string text = "签名算法"
boolean focusrectangle = false
end type

type ddlb_signtype from se_cst_dropdownlist within u_cst_tabpage_utility_alipay
integer x = 425
integer y = 1092
integer width = 393
integer taborder = 40
boolean sorted = false
string item[] = {"RSA","RSA2"}
end type

event constructor;call super::constructor;SelectItem(1)
end event

type st_1 from statictext within u_cst_tabpage_utility_alipay
integer x = 1271
integer y = 1700
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

type st_response from statictext within u_cst_tabpage_utility_alipay
integer x = 23
integer y = 2256
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

type cb_9 from se_cst_button within u_cst_tabpage_utility_alipay
integer x = 727
integer y = 1220
integer width = 338
integer height = 116
integer taborder = 40
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "应用"
end type

event clicked;alipay.of_SetAppID(sle_appid.Text)
alipay.of_SetKey(mle_prikey.Text,mle_pubKey.Text)
alipay.of_SetSignType(ddlb_signtype.Text)
end event

type st_9 from statictext within u_cst_tabpage_utility_alipay
integer x = 119
integer y = 1820
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

type sle_auth_code from se_cst_singlelineedit within u_cst_tabpage_utility_alipay
integer x = 389
integer y = 1816
integer width = 855
integer height = 100
integer taborder = 70
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = ""
end type

type em_amount from se_cst_editmask within u_cst_tabpage_utility_alipay
integer x = 389
integer y = 1680
integer width = 855
integer height = 116
integer taborder = 60
string text = "1"
string mask = "###,###.00"
end type

type st_8 from statictext within u_cst_tabpage_utility_alipay
integer x = 119
integer y = 1692
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

type st_7 from statictext within u_cst_tabpage_utility_alipay
integer x = 119
integer y = 1564
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

type sle_subject from se_cst_singlelineedit within u_cst_tabpage_utility_alipay
integer x = 389
integer y = 1560
integer width = 855
integer height = 100
integer taborder = 50
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "标题"
end type

type sle_trade_no from se_cst_singlelineedit within u_cst_tabpage_utility_alipay
integer x = 389
integer y = 1448
integer width = 855
integer height = 100
integer taborder = 40
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "TESTBILLNO123456"
end type

type st_6 from statictext within u_cst_tabpage_utility_alipay
integer x = 119
integer y = 1452
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

type st_5 from statictext within u_cst_tabpage_utility_alipay
integer x = 119
integer y = 640
integer width = 407
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
string text = "支付宝公钥"
boolean focusrectangle = false
end type

type mle_pubkey from se_cst_multilineedit within u_cst_tabpage_utility_alipay
integer x = 119
integer y = 724
integer width = 1559
integer height = 360
integer taborder = 30
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = ""
boolean vscrollbar = true
boolean autovscroll = true
end type

type mle_prikey from se_cst_multilineedit within u_cst_tabpage_utility_alipay
integer x = 119
integer y = 320
integer width = 1559
integer height = 316
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = ""
boolean vscrollbar = true
boolean autovscroll = true
end type

type st_4 from statictext within u_cst_tabpage_utility_alipay
integer x = 119
integer y = 232
integer width = 571
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
string text = "应用私钥(PKCS1)"
boolean focusrectangle = false
end type

type st_3 from statictext within u_cst_tabpage_utility_alipay
integer x = 119
integer y = 132
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

type st_trade from statictext within u_cst_tabpage_utility_alipay
integer x = 23
integer y = 1352
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

type st_config from statictext within u_cst_tabpage_utility_alipay
integer x = 23
integer y = 24
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

type cb_1 from se_cst_button within u_cst_tabpage_utility_alipay
integer x = 64
integer y = 1944
integer width = 457
integer height = 132
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "请求支付"
end type

event clicked;n_cst_alipay_response rsp
n_json jsonParam,jsonResult

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)
jsonParam.SetItem("subject",sle_subject.Text)
jsonParam.SetItem("total_amount",Double(em_amount.Text))
jsonParam.SetItem("auth_code",sle_auth_code.Text)

rsp = alipay.of_Pay(jsonParam)
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

type cb_2 from se_cst_button within u_cst_tabpage_utility_alipay
integer x = 64
integer y = 2100
integer width = 503
integer height = 132
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "异步请求支付"
end type

event clicked;n_json jsonParam,jsonResult

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)
jsonParam.SetItem("subject",sle_subject.Text)
jsonParam.SetItem("total_amount",Double(em_amount.Text))
jsonParam.SetItem("auth_code",sle_auth_code.Text)

//在OnPayComplete事件中获取响应结果
alipay.of_PayAsync(jsonParam)

Destroy jsonParam
end event

type cb_3 from se_cst_button within u_cst_tabpage_utility_alipay
integer x = 608
integer y = 2100
integer width = 503
integer height = 132
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "异步查询订单"
end type

event clicked;n_json jsonParam,jsonResult

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)

//在OnQueryComplete事件中获取响应结果
alipay.of_QueryAsync(jsonParam)

Destroy jsonParam
end event

type cb_4 from se_cst_button within u_cst_tabpage_utility_alipay
integer x = 567
integer y = 1944
integer width = 457
integer height = 132
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "查询订单"
end type

event clicked;n_cst_alipay_response rsp
n_json jsonParam,jsonResult

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)

rsp = alipay.of_Query(jsonParam)
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

type cb_6 from se_cst_button within u_cst_tabpage_utility_alipay
integer x = 1152
integer y = 2100
integer width = 503
integer height = 132
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "异步撤销订单"
end type

event clicked;n_json jsonParam,jsonResult

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)

//在OnCancelComplete事件中获取响应结果
alipay.of_CancelAsync(jsonParam)

Destroy jsonParam
end event

type cb_5 from se_cst_button within u_cst_tabpage_utility_alipay
integer x = 1070
integer y = 1944
integer width = 457
integer height = 132
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "撤销订单"
end type

event clicked;n_cst_alipay_response rsp
n_json jsonParam,jsonResult

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)

rsp = alipay.of_Cancel(jsonParam)
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

type cb_7 from se_cst_button within u_cst_tabpage_utility_alipay
integer x = 1573
integer y = 1944
integer width = 457
integer height = 132
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "退款"
end type

event clicked;n_cst_alipay_response rsp
n_json jsonParam,jsonResult

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)
jsonParam.SetItem("refund_amount",Double(em_amount.Text))

rsp = alipay.of_Refund(jsonParam)
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

type cb_8 from se_cst_button within u_cst_tabpage_utility_alipay
integer x = 1696
integer y = 2100
integer width = 503
integer height = 132
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "异步退款"
end type

event clicked;n_json jsonParam,jsonResult

//接口参数请查看官方文档
jsonParam = Create n_json
jsonParam.SetItem("out_trade_no",sle_trade_no.Text)
jsonParam.SetItem("refund_amount",Double(em_amount.Text))

//在OnRefundComplete事件中获取响应结果
alipay.of_RefundAsync(jsonParam)

Destroy jsonParam
end event

type mle_response from se_cst_multilineedit within u_cst_tabpage_utility_alipay
integer x = 23
integer y = 2360
integer width = 3707
integer height = 848
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

type sle_appid from se_cst_singlelineedit within u_cst_tabpage_utility_alipay
integer x = 357
integer y = 128
integer width = 855
integer height = 100
integer taborder = 10
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = ""
end type

type alipay from n_cst_alipay within u_cst_tabpage_utility_alipay descriptor "pb_nvo" = "true" 
end type

on alipay.create
call super::create
end on

on alipay.destroy
call super::destroy
end on

event oncancelcomplete;call super::oncancelcomplete;n_json jsonResult

choose case response.of_GetStatus()
	case response.STATUS_SUCCESS
		jsonResult = response.of_GetResult()
		mle_response.Text = "------ Async Cancel - STATUS_SUCCESS ------~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case response.STATUS_FAILED
		jsonResult = response.of_GetResult()
		mle_response.Text = "------ Async Cancel - STATUS_FAILED ------~r~nError:~r~n" + response.of_GetErrorInfo() + "~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case response.STATUS_ERROR
		mle_response.Text = "------ Async Cancel - STATUS_ERROR ------~r~n" + response.of_GetErrorInfo() + "~r~n------ Raw Response ------~r~n" + response.of_GetHttpResponse().GetDataString()
	case response.STATUS_CANCELLED
		mle_response.Text = "------ Async Cancel - STATUS_CANCELLED ------~r~n" + response.of_GetErrorInfo()
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

event onquerycomplete;call super::onquerycomplete;n_json jsonResult

choose case response.of_GetStatus()
	case response.STATUS_SUCCESS
		jsonResult = response.of_GetResult()
		mle_response.Text = "------ Async Query - STATUS_SUCCESS ------~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case response.STATUS_FAILED
		jsonResult = response.of_GetResult()
		mle_response.Text = "------ Async Query - STATUS_FAILED ------~r~nError:~r~n" + response.of_GetErrorInfo() + "~r~nResult:~r~n" + ReplaceAll(jsonResult.Serialize(Enums.JSON_FORMAT_INDENT),"~n","~r~n",true)
	case response.STATUS_ERROR
		mle_response.Text = "------ Async Query - STATUS_ERROR ------~r~n" + response.of_GetErrorInfo() + "~r~n------ Raw Response ------~r~n" + response.of_GetHttpResponse().GetDataString()
	case response.STATUS_CANCELLED
		mle_response.Text = "------ Async Query - STATUS_CANCELLED ------~r~n" + response.of_GetErrorInfo()
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

