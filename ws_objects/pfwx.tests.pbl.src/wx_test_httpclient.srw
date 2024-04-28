$PBExportHeader$wx_test_httpclient.srw
forward
global type wx_test_httpclient from window
end type
type cb_6 from commandbutton within wx_test_httpclient
end type
type cb_5 from commandbutton within wx_test_httpclient
end type
type cb_4 from commandbutton within wx_test_httpclient
end type
type st_progress from statictext within wx_test_httpclient
end type
type hpb_progress from hprogressbar within wx_test_httpclient
end type
type cb_3 from commandbutton within wx_test_httpclient
end type
type st_1 from statictext within wx_test_httpclient
end type
type cb_2 from commandbutton within wx_test_httpclient
end type
type cb_1 from commandbutton within wx_test_httpclient
end type
type mle_1 from multilineedit within wx_test_httpclient
end type
type httpclient from nx_httpclient within wx_test_httpclient
end type
end forward

global type wx_test_httpclient from window
integer width = 3442
integer height = 2508
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
st_progress st_progress
hpb_progress hpb_progress
cb_3 cb_3
st_1 st_1
cb_2 cb_2
cb_1 cb_1
mle_1 mle_1
httpclient httpclient
end type
global wx_test_httpclient wx_test_httpclient

forward prototypes
public subroutine wf_show (readonly nx_httpresponse resp)
public function string wf_bytes2string (readonly unsignedlong bytes)
end prototypes

public subroutine wf_show (readonly nx_httpresponse resp);mle_1.SetRedraw(false)
mle_1.text = ""
if resp.IsAsync() then
	mle_1.text += "---- ASYNC-RESPONSE ----~r~n"
	mle_1.text += "[Id]"
	mle_1.text += "~r~n~r~n"
	mle_1.text += String(resp.GetAsyncId())
	mle_1.text += "~r~n~r~n"
else
	mle_1.text += "---- RESPONSE ----~r~n"
end if
mle_1.text += "[Elapsed]"
mle_1.text += "~r~n~r~n"
mle_1.text += String(resp.GetElapsed()) + "ms"
mle_1.text += "~r~n~r~n"
if Not resp.IsValid() then
	mle_1.text += "[ErrorInfo]"
	mle_1.text += "~r~n~r~n"
	mle_1.text += resp.GetErrorInfo()
	mle_1.text += "~r~n~r~n"
end if
mle_1.text += "[Status]"
mle_1.text += "~r~n~r~n"
mle_1.text += String(resp.GetHttpStatus())
mle_1.text += "~r~n~r~n"
mle_1.text += "[ContentType]"
mle_1.text += "~r~n~r~n"
mle_1.text += resp.GetContentType()
mle_1.text += "~r~n~r~n"
mle_1.text += "[Charset]"
mle_1.text += "~r~n~r~n"
mle_1.text += resp.GetCharset()
mle_1.text += "~r~n~r~n"
mle_1.text += "[Headers]"
mle_1.text += "~r~n~r~n"
mle_1.text += resp.GetHeaders()
mle_1.text += "~r~n~r~n"
mle_1.text += "[Payload]"
mle_1.text += "~r~n~r~n"
if resp.IsCancelled() then
	mle_1.text += "-- cancelled --"
elseif resp.IsBinary() then
	mle_1.text += "-- binary --"
else
	mle_1.text += resp.GetDataString()
end if
mle_1.text += "~r~n~r~n"
mle_1.SetRedraw(true)
end subroutine

public function string wf_bytes2string (readonly unsignedlong bytes);int nUnit
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

on wx_test_httpclient.create
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.st_progress=create st_progress
this.hpb_progress=create hpb_progress
this.cb_3=create cb_3
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.mle_1=create mle_1
this.httpclient=create httpclient
this.Control[]={this.cb_6,&
this.cb_5,&
this.cb_4,&
this.st_progress,&
this.hpb_progress,&
this.cb_3,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.mle_1}
end on

on wx_test_httpclient.destroy
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.st_progress)
destroy(this.hpb_progress)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.mle_1)
destroy(this.httpclient)
end on

type cb_6 from commandbutton within wx_test_httpclient
integer x = 613
integer y = 676
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Upload"
end type

event clicked;nx_httprequest req
nx_httpmultipart multipart

multipart = Create nx_httpmultipart
multipart.AddFile("file","D:\QQ9.7.1.28934.exe")

req = httpclient.Request("POST","http://8.130.98.132:8848/upload")
req.SetBody(multipart)
req.AsyncSend(123,true)

end event

type cb_5 from commandbutton within wx_test_httpclient
integer x = 599
integer y = 428
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;httpclient.Cancel(123)
end event

type cb_4 from commandbutton within wx_test_httpclient
integer x = 1152
integer y = 676
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;httpclient.Cancel(234)
end event

type st_progress from statictext within wx_test_httpclient
integer x = 82
integer y = 840
integer width = 2501
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type hpb_progress from hprogressbar within wx_test_httpclient
integer x = 78
integer y = 932
integer width = 1582
integer height = 68
unsignedinteger maxposition = 100
integer setstep = 10
boolean smoothscroll = true
end type

type cb_3 from commandbutton within wx_test_httpclient
integer x = 101
integer y = 676
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Download"
end type

event clicked;nx_httprequest req

req = httpclient.Request("GET","https://dldir1.qq.com/qqfile/qq/QQNT/Windows/QQ_9.9.9_240428_x64_01.exe")
req.SetReceiveFile("D:\QQ9.7.1.28934.exe")
req.AsyncSend(234,true)

end event

type st_1 from statictext within wx_test_httpclient
integer x = 37
integer y = 288
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
string text = "Async:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within wx_test_httpclient
integer x = 91
integer y = 420
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "GET"
end type

event clicked;nx_httprequest req

req = httpclient.Request("GET","https://www.taobao.com")
req.AsyncSend(123)

end event

type cb_1 from commandbutton within wx_test_httpclient
integer x = 73
integer y = 52
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "GET"
end type

event clicked;nx_httprequest req
nx_httpresponse resp

req = httpclient.Request("GET","https://www.taobao.com")
resp = req.Send()

wf_Show(resp)
end event

type mle_1 from multilineedit within wx_test_httpclient
integer y = 1024
integer width = 3383
integer height = 1392
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type httpclient from nx_httpclient within wx_test_httpclient descriptor "pb_nvo" = "true" 
end type

on httpclient.create
call super::create
end on

on httpclient.destroy
call super::destroy
end on

event oncomplete;call super::oncomplete;wf_Show(response)

end event

event onreceive;call super::onreceive;st_progress.text = Sprintf("total: {}, received: {}, speed: {}/s",wf_Bytes2String(total),wf_Bytes2String(received),wf_Bytes2String(speed))
if total > 0 then
	hpb_progress.position = received / total * 100
end if

//返回1阻止
return 0
end event

event onsend;call super::onsend;st_progress.text = Sprintf("total: {}, sent: {}, speed: {}/s",wf_Bytes2String(total),wf_Bytes2String(sent),wf_Bytes2String(speed))
if total > 0 then
	hpb_progress.position = sent / total * 100
end if

//返回1阻止
return 0
end event

