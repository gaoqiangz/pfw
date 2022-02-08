$PBExportHeader$w_test_websocket_mqtt.srw
forward
global type w_test_websocket_mqtt from window
end type
type cbx_proxy from checkbox within w_test_websocket_mqtt
end type
type cbx_clean from checkbox within w_test_websocket_mqtt
end type
type cbx_retain from checkbox within w_test_websocket_mqtt
end type
type st_6 from statictext within w_test_websocket_mqtt
end type
type sle_clientid from singlelineedit within w_test_websocket_mqtt
end type
type cb_5 from commandbutton within w_test_websocket_mqtt
end type
type cb_4 from commandbutton within w_test_websocket_mqtt
end type
type st_5 from statictext within w_test_websocket_mqtt
end type
type ddlb_qos from dropdownlistbox within w_test_websocket_mqtt
end type
type st_4 from statictext within w_test_websocket_mqtt
end type
type sle_topic from singlelineedit within w_test_websocket_mqtt
end type
type st_3 from statictext within w_test_websocket_mqtt
end type
type mle_response from multilineedit within w_test_websocket_mqtt
end type
type st_2 from statictext within w_test_websocket_mqtt
end type
type sle_message from singlelineedit within w_test_websocket_mqtt
end type
type cb_3 from commandbutton within w_test_websocket_mqtt
end type
type cb_2 from commandbutton within w_test_websocket_mqtt
end type
type cb_1 from commandbutton within w_test_websocket_mqtt
end type
type st_1 from statictext within w_test_websocket_mqtt
end type
type sle_url from singlelineedit within w_test_websocket_mqtt
end type
type wsclient from n_wsclient within w_test_websocket_mqtt
end type
end forward

global type w_test_websocket_mqtt from window
integer width = 3333
integer height = 1668
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cbx_proxy cbx_proxy
cbx_clean cbx_clean
cbx_retain cbx_retain
st_6 st_6
sle_clientid sle_clientid
cb_5 cb_5
cb_4 cb_4
st_5 st_5
ddlb_qos ddlb_qos
st_4 st_4
sle_topic sle_topic
st_3 st_3
mle_response mle_response
st_2 st_2
sle_message sle_message
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_1 st_1
sle_url sle_url
wsclient wsclient
end type
global w_test_websocket_mqtt w_test_websocket_mqtt

on w_test_websocket_mqtt.create
this.cbx_proxy=create cbx_proxy
this.cbx_clean=create cbx_clean
this.cbx_retain=create cbx_retain
this.st_6=create st_6
this.sle_clientid=create sle_clientid
this.cb_5=create cb_5
this.cb_4=create cb_4
this.st_5=create st_5
this.ddlb_qos=create ddlb_qos
this.st_4=create st_4
this.sle_topic=create sle_topic
this.st_3=create st_3
this.mle_response=create mle_response
this.st_2=create st_2
this.sle_message=create sle_message
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.sle_url=create sle_url
this.wsclient=create wsclient
this.Control[]={this.cbx_proxy,&
this.cbx_clean,&
this.cbx_retain,&
this.st_6,&
this.sle_clientid,&
this.cb_5,&
this.cb_4,&
this.st_5,&
this.ddlb_qos,&
this.st_4,&
this.sle_topic,&
this.st_3,&
this.mle_response,&
this.st_2,&
this.sle_message,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.sle_url}
end on

on w_test_websocket_mqtt.destroy
destroy(this.cbx_proxy)
destroy(this.cbx_clean)
destroy(this.cbx_retain)
destroy(this.st_6)
destroy(this.sle_clientid)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.st_5)
destroy(this.ddlb_qos)
destroy(this.st_4)
destroy(this.sle_topic)
destroy(this.st_3)
destroy(this.mle_response)
destroy(this.st_2)
destroy(this.sle_message)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.sle_url)
destroy(this.wsclient)
end on

event open;//使用WSS协议时不验证服务端证书
wsClient.SetValidateServer(false)
wsClient.SetAutoReconnect(true)
wsClient.SetValidateHost(false)

//wsClient.SetHeader("Pragma","no-cache")
//wsClient.SetHeader("Cache-Control","no-cache")

string CERT_CA = "MIIEFjCCAv6gAwIBAgIJAJQhYXTjGo+xMA0GCSqGSIb3DQEBCwUAMIGfMQswCQYDVQQGEwJDTjESMBAGA1UECAwJR3Vhbmdkb25nMREwDwYDVQQHDAhTaGVuemhlbjEtMCsGA1UECgwkSlFaIEpld2VsIE1hbmFnZW1lbnQgU2VydmljZSBDby4sTHRkMSQwIgYDVQQLDBtKTVAgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxFDASBgNVBAMMC0pNUCBSb290IENBMB4XDTE3MDkwNjEwMTgyOFoXDTI3MDkwNDEwMTgyOFowgZ8xCzAJBgNVBAYTAkNOMRIwEAYDVQQIDAlHdWFuZ2RvbmcxETAPBgNVBAcMCFNoZW56aGVuMS0wKwYDVQQKDCRKUVogSmV3ZWwgTWFuYWdlbWVudCBTZXJ2aWNlIENvLixMdGQxJDAiBgNVBAsMG0pNUCBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTEUMBIGA1UEAwwLSk1QIFJvb3QgQ0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDBh6aTHhX5bFnlSrfKDTA57G9wtpQ/GFPvElKYP7bnQ69FQsy/iHJR1Tvg2uZ+/CeRFIMrSKb2Is1I/Gz1n1Z5jv56sPY/iDnFzNcSmjUqHSd0X0ruOiSd5jgBmtCb74y4qVGeMI8JPEAojcquZK1UXKvjTMVO/cis4LHWBSx2UiwdVti0ujTX0KUOIjldzwLWjEU33FKtnN+Oqe29qpJRUa9AI8Ys3j6cfY8uplHCh22orBk8gbhkBQW8eZC5XuxflmQIOy906H9elxdvlLjhHnvXB+OLgUE/yBdY/jFpdNNXks6pLzIJOa98e4pNIQt4hJ6+JVjqEa/yCmu9VDbvAgMBAAGjUzBRMB0GA1UdDgQWBBTz5I1L3+1AORG8GrVjPE7W0aRHTzAfBgNVHSMEGDAWgBTz5I1L3+1AORG8GrVjPE7W0aRHTzAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQA07Usa1CsgTQ5lcXPrxzGZNwdugHIld82UK+GO/jnuVl6hahQoU/ICS8Nak+y+4/N71lEi4d+GkAZTq8pgJ0x9xRt1SDbNRhm+uv7y8650MuZSinMUzYobQ8bRf3MuSqw4CzjpHZHT19CNcguVaRrPsHo/7s7u8izb3Q5mKbzKpCCnmlDdxHsrk8FrOw9hSP2E3CcYYi+s/Rh9MfKDaYlm751fmCSYSWgSUauML7I5kPnS6zWY6qSL0PXJ2GPbboiwU3qIF8XP4PcpskQTOjX3dcmG5jrKISGkY1njc3l0Tv09Efs7D0mJa+y8DpiyzH/NF9oFRfP29zmxu76+9c0T"
string CERT_PEM = "MIIDgTCCAmmgAwIBAgIBCzANBgkqhkiG9w0BAQsFADCBnzELMAkGA1UEBhMCQ04xEjAQBgNVBAgMCUd1YW5nZG9uZzERMA8GA1UEBwwIU2hlbnpoZW4xLTArBgNVBAoMJEpRWiBKZXdlbCBNYW5hZ2VtZW50IFNlcnZpY2UgQ28uLEx0ZDEkMCIGA1UECwwbSk1QIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MRQwEgYDVQQDDAtKTVAgUm9vdCBDQTAeFw0xODA5MDUxMDMyMTVaFw0yMTA4MjAxMDMyMTVaMGwxCzAJBgNVBAYTAkNOMRIwEAYDVQQIDAlHdWFuZ2RvbmcxLTArBgNVBAoMJEpRWiBKZXdlbCBNYW5hZ2VtZW50IFNlcnZpY2UgQ28uLEx0ZDEMMAoGA1UECwwDSk1QMQwwCgYDVQQDDANKTVAwgaIwDQYJKoZIhvcNAQEBBQADgZAAMIGMAoGEALegLYc1lZ8zaWUR3TU85XRtScgVGrHlz4gj54JSi1gAlrs52Itxx9DUGkTclTlVPD47lB32f/u6TmlaffDoZyYcCBlzVU4MueiYawCtPVmKGHLsJc8Q/UoEzdnNyLytz69THlNuIza+4+f6PdXlc9sX8XrpL4BCVVbvIoOPlHKkrirLAgMBAAGjezB5MAkGA1UdEwQCMAAwLAYJYIZIAYb4QgENBB8WHU9wZW5TU0wgR2VuZXJhdGVkIENlcnRpZmljYXRlMB0GA1UdDgQWBBQobPbsBRx9YIzRQ1AS/8afH24eYDAfBgNVHSMEGDAWgBTz5I1L3+1AORG8GrVjPE7W0aRHTzANBgkqhkiG9w0BAQsFAAOCAQEAKlfiOqpIio/aaAvLpBP8m0pwd0oDfuSpFsGQG0HCzhXUgsNCKyNs22Ejbwd0tjkRtJPLLcfzQXJ6TKfpnyvg//XL+T1KcQtO696K++Tiy/ntVLiDlgpCcWsV7UF5jAQ3zo/LdH9CjxNgL5AJoaZCInYPQLd2EsOtb9L+073UCqoL2POYtSnVOfvWEIUOPMeX57djhYzUaqFqescHvNYEWVhZpgxYCXDKPaZw5+YTo/UmuoRQf7zHyxGnZVflJIU3sIZF2eJV/uRcTyyfaTeo5eUaSZ0/zDpZhy/k+gMali8/jJLQFNpI6dkd9P3XFzjc0+KuPSXfDEwhuH4oCIWMgw=="
string CERT_KEY = "MIICaAIBAAKBhAC3oC2HNZWfM2llEd01POV0bUnIFRqx5c+II+eCUotYAJa7OdiLccfQ1BpE3JU5VTw+O5Qd9n/7uk5pWn3w6GcmHAgZc1VODLnomGsArT1Zihhy7CXPEP1KBM3Zzci8rc+vUx5TbiM2vuPn+j3V5XPbF/F66S+AQlVW7yKDj5RypK4qywIDAQABAoGDNf6kxJhuGbUdbbnWCRySAC1Ov8Xs5pjD8K1WGw04qjTqHb3BvidD8VUdMFiIjKZSo54TTMg6FARRoEsas2czRZJ6judWZWta4mT7c/21xy02hJBTFzmSAbv5et3vORDMPIgLfJQ1SShZ4bsGfIO+1PvTnQjSc+sbVkKMQeqradP3a2kCQg8dR1/dyrByVruEWzknyP4RFJKpyVF6lD84Fw4WX2br+PllZ5e5zBfVMUZRKJLz/GiPn7Ga0cqzfj6u13kfelC4XwJCDCYqG7aq5gJ8iVw8ocKGlxWDW4Rwc1kvE5GiZy9YjeomzPCvu/9Fdtqlrl5Uf/izTItQ8BBu5BN+rA7CQ8guWNUVAkIK3A6cYs9vV7fZo4+n0V4orj0J49QyJtC9W5+1D34chQ+uoZ189pIdzaBJ1aZBb+y7c/ZZtdNmwPDEOPu4m1VXCiECQgQNKhep193yUFOCRdnvw/BYRUDcrp9Yy2EsPMtKN67DugK39PKtkx2qlnvKi0VNy4UoJGqaIFDAy4pXNaNi+0m2bQJBGrPODnGcZAv5rBocdvseTpFT+dbz0t1WoCnAO5qeevFhx+YUQMvhR1xDmw0lI0iKY6QW9cM7OtUq/3aJSCIJwZ8="

//wsClient.SetCA(Enums.WS_CERT_PEM,CERT_CA)
//wsClient.SetCert(Enums.WS_CERT_PEM,CERT_PEM)
//wsClient.SetCertKey(Enums.WS_CERT_KEY_PEM_RSA,CERT_KEY)

sle_url.text = "mqtts://120.79.21.130:8301/mqtt"

/*
	mqtt://120.79.21.130:8201/mqtt

	mqtts://120.79.21.130:8301/mqtt
MQTT:
120.79.21.130
administrator
rym@Nx7Ykn#q
*/
end event

type cbx_proxy from checkbox within w_test_websocket_mqtt
integer x = 1152
integer y = 472
integer width = 457
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Proxy"
end type

type cbx_clean from checkbox within w_test_websocket_mqtt
integer x = 1925
integer y = 88
integer width = 265
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Clean"
boolean checked = true
end type

type cbx_retain from checkbox within w_test_websocket_mqtt
integer x = 1847
integer y = 464
integer width = 302
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Retain"
end type

type st_6 from statictext within w_test_websocket_mqtt
integer x = 1106
integer y = 88
integer width = 302
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Client Id:"
boolean focusrectangle = false
end type

type sle_clientid from singlelineedit within w_test_websocket_mqtt
integer x = 1413
integer y = 72
integer width = 498
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "pfwMQTTClient"
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within w_test_websocket_mqtt
integer x = 2693
integer y = 284
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Unsubscribe"
end type

event clicked;wsClient.Unsubscribe(sle_topic.Text)
end event

type cb_4 from commandbutton within w_test_websocket_mqtt
integer x = 2208
integer y = 280
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Subscribe"
end type

event clicked;wsClient.Subscribe(sle_topic.Text,Long(ddlb_qos.text))
end event

type st_5 from statictext within w_test_websocket_mqtt
integer x = 1838
integer y = 220
integer width = 347
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "QoS level:"
boolean focusrectangle = false
end type

type ddlb_qos from dropdownlistbox within w_test_websocket_mqtt
integer x = 1851
integer y = 348
integer width = 279
integer height = 476
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"0","1","2"}
borderstyle borderstyle = stylelowered!
end type

event constructor;SelectItem(1)
end event

type st_4 from statictext within w_test_websocket_mqtt
integer x = 78
integer y = 220
integer width = 311
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Topic:"
boolean focusrectangle = false
end type

type sle_topic from singlelineedit within w_test_websocket_mqtt
integer x = 78
integer y = 328
integer width = 841
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "test"
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_test_websocket_mqtt
integer x = 64
integer y = 488
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Response:"
boolean focusrectangle = false
end type

type mle_response from multilineedit within w_test_websocket_mqtt
integer x = 64
integer y = 572
integer width = 3173
integer height = 956
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_test_websocket_mqtt
integer x = 978
integer y = 220
integer width = 311
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Message:"
boolean focusrectangle = false
end type

type sle_message from singlelineedit within w_test_websocket_mqtt
integer x = 978
integer y = 328
integer width = 841
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "测试MQTT over pfwWebSocket"
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_test_websocket_mqtt
integer x = 2203
integer y = 432
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Publish"
end type

event clicked;wsClient.Publish(sle_topic.Text,sle_message.text,Long(ddlb_qos.text),cbx_retain.Checked)
end event

type cb_2 from commandbutton within w_test_websocket_mqtt
integer x = 2697
integer y = 72
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Disconnect"
end type

event clicked;wsClient.Close()
end event

type cb_1 from commandbutton within w_test_websocket_mqtt
integer x = 2213
integer y = 72
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Connect"
end type

event clicked;/*
	MQTT params:
		{
			"clean": true,					//清除会话状态 (默认true)
			"keepAlive": 60,				//会话心跳最大时间  (秒,最低10,0禁用心跳,默认60)
			"clientId": "client id",	//客户端ID
			"userName": "name",			//用户名
			"password": "pass",			//密码
			"will": {						//遗言
				"topic": "topic",			//主题名
				"data": "content",		//主题内容
				"qos": 0						//服务等级
			},
			"offlinePublish": false,	//离线状态下将发布消息加入队列，连接之后继续发布 (默认false)
			"offlineSize": 5000,			//离线发布队列的大小 (默认5000)
			"queueQoS0": true,			//如果发布QoS0主题时处于离线状态，则将消息放入队列中，连接之后继续发布 (offlinePublish=true有效,默认true)
			"resubscribe": true,			//连接后自动重新订阅主题 (clean=true有效,默认true)
			"storageFile": "mqtt.dat"	//会话状态持久存储文件(clean=false有效,默认"mqtt.dat")
		}
*/
n_json jsParams,jsWill

jsParams = Create n_json
jsParams.SetItem("clientId",sle_clientid.Text)
jsParams.SetItem("clean",cbx_clean.Checked)
jsParams.SetItem("userName","jmp")
jsParams.SetItem("password","j@mp?m_qt|ty")

/*jsWill = Create n_json
jsWill.SetItem("topic","will_test")
jsWill.SetItem("data","will_test data")
jsParams.SetItem("will",jsWill)*/

if cbx_proxy.checked then
	wsClient.SetProxyAddress("http://127.0.0.1:8888")
else
	wsClient.SetProxyAddress("")
end if
wsClient.Open(sle_url.Text,jsParams)
end event

type st_1 from statictext within w_test_websocket_mqtt
integer x = 69
integer y = 88
integer width = 187
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "URL:"
boolean focusrectangle = false
end type

type sle_url from singlelineedit within w_test_websocket_mqtt
integer x = 261
integer y = 72
integer width = 841
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "mqtt://iot.eclipse.org/ws"
borderstyle borderstyle = stylelowered!
end type

type wsclient from n_wsclient within w_test_websocket_mqtt descriptor "pb_nvo" = "true" 
end type

on wsclient.create
call super::create
end on

on wsclient.destroy
call super::destroy
end on

event onopen;call super::onopen;mle_response.Text += Sprintf("Connection {1}! {2}~r~n",iif(reconnect,"Reconnected","Open"),iif(sessionPresent,"[Session Present]",""))
mle_response.Scroll(mle_response.LineCount())
return 0
end event

event onclose;call super::onclose;mle_response.Text += Sprintf("Connection Closed! Code:{1} Info:{2} {3}~r~n",code,info,iif(IsReconnecting(),"[Reconnecting]",""))
mle_response.Scroll(mle_response.LineCount())
return 0
end event

event onerror;call super::onerror;mle_response.Text += Sprintf("Connection Error! Code:{1} Info:{2} {3}~r~n",code,info,iif(IsReconnecting(),"[Reconnecting]",""))
mle_response.Scroll(mle_response.LineCount())
return 0
end event

event onmessage;call super::onmessage;mle_response.Text += Sprintf("Topic:{1} QoS:{2} Message:~r~n{3}~r~n",msg.GetTopic(),msg.GetQoS(),msg.GetDataString())
mle_response.Scroll(mle_response.LineCount())
return 0
end event

