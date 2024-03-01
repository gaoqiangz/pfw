$PBExportHeader$w_test_webview.srw
forward
global type w_test_webview from window
end type
type cb_6 from commandbutton within w_test_webview
end type
type cb_5 from commandbutton within w_test_webview
end type
type cb_4 from commandbutton within w_test_webview
end type
type cb_3 from commandbutton within w_test_webview
end type
type cb_2 from commandbutton within w_test_webview
end type
type sle_url from singlelineedit within w_test_webview
end type
type cb_1 from commandbutton within w_test_webview
end type
type uo_webview from u_cst_webview within w_test_webview
end type
type webview from n_cst_webview within w_test_webview
end type
end forward

global type w_test_webview from window
integer width = 5714
integer height = 2428
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
cb_3 cb_3
cb_2 cb_2
sle_url sle_url
cb_1 cb_1
uo_webview uo_webview
webview webview
end type
global w_test_webview w_test_webview

on w_test_webview.create
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.sle_url=create sle_url
this.cb_1=create cb_1
this.uo_webview=create uo_webview
this.webview=create webview
this.Control[]={this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.sle_url,&
this.cb_1,&
this.uo_webview}
end on

on w_test_webview.destroy
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.sle_url)
destroy(this.cb_1)
destroy(this.uo_webview)
destroy(this.webview)
end on

event resize;uo_webview.Resize(newWidth - uo_webview.x * 2,newHeight - uo_webview.y - uo_webview.x)
end event

event open;//为确保API兼容性请安装WebView2 Runtime 109.0.1518.78及以上版本运行时
//注意：Windows7/8仅支持到109.0.1518.78版
//https://blogs.windows.com/msedgedev/2022/12/09/microsoft-edge-and-webview2-ending-support-for-windows-7-and-windows-8-8-1/
//历史版本WebView2运行时下载
//https://github.com/westinyang/WebView2RuntimeArchive/releases

//从指定目录加载运行时，运行使用Evergreen模式
//https://learn.microsoft.com/en-us/microsoft-edge/webview2/concepts/distribution#evergreen-distribution-mode
//WebViewSetRuntimeMode(Enums.WEBVIEW_RUNTIME_FIXED)
//[msedgewebview2.exe]文件所在目录
//WebViewSetRuntimeDir("E:\Downloads\WebView2 Runtime 109.0.1518.78\Microsoft.WebView2.FixedVersionRuntime.109.0.1518.78.x64")

uo_webview.SetOption(4,true)
end event

type cb_6 from commandbutton within w_test_webview
integer x = 4233
integer y = 28
integer width = 457
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "GetVersion"
end type

event clicked;MessageBox("",WebViewGetVersion())
end event

type cb_5 from commandbutton within w_test_webview
integer x = 3003
integer y = 28
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Evaluate"
end type

event clicked;MessageBox("",uo_webview.Evaluate("1+1"))
end event

type cb_4 from commandbutton within w_test_webview
integer x = 2505
integer y = 28
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "DevTools"
end type

event clicked;uo_webview.ShowDevTools()
end event

type cb_3 from commandbutton within w_test_webview
integer x = 4713
integer y = 24
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "LoadEngine"
end type

event clicked;//【同步】初始化浏览器引擎
//一般情况下你不需要显示初始化，因为LoadFile/LoadHtml/LoadUrl会自动按需初始化
//此函数唯一的使用场景是检查是否可以正常加载浏览器内核，方便提示用户安装webview2运行时
uo_webview.LoadEngine()
end event

type cb_2 from commandbutton within w_test_webview
integer x = 5198
integer y = 24
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Popup"
end type

event clicked;constant string HTML = '<html>'+&
									'<head>'+&
										'<style>'+&
											'body {'+&
												 'background: transparent;'+&
											'}'+&
											'#main {'+&
												 'background: #f00;'+&
												 'width: 100px;'+&
												 'height: 100px;'+&
											'}'+&
										'</style>'+&
										'<script src="http://pfw.mem/test.js"></script>'+&
									'</head>'+&
									'<body>'+&
										'<div id="main"></div>'+&
									'</body>'+&
								'</html>'
								
POINTF pt

Win32.GetCursorPos(ref pt)

if Not webview.IsValid() then
	webview.CreateWindow(Enums.WEBVIEW_WS_TITLEBAR + Enums.WEBVIEW_WS_RESIZEABLE + Enums.WEBVIEW_WS_CONTROLS + Enums.WEBVIEW_WS_TOOL)
	//webview.CreateWindow(Enums.WEBVIEW_WS_TOOL + Enums.WEBVIEW_WS_ALPHA)
	webview.SetTitle("WebView")
	webview.SetIcon("save!")
	webview.Resize(500,600)
	webview.Move(pt.x,pt.y + 10)
	//webview.LoadUrl(sle_url.text)
	webview.LoadHtml(HTML)
end if

webview.Popup()

end event

type sle_url from singlelineedit within w_test_webview
integer x = 55
integer y = 32
integer width = 1897
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "https://www.baidu.com"
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_test_webview
integer x = 2011
integer y = 28
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Load"
end type

event clicked;//LoadUrl会自动调用异步LoadEngine
uo_webview.LoadUrl(sle_url.text)

end event

type uo_webview from u_cst_webview within w_test_webview
integer x = 37
integer y = 212
integer width = 5637
integer height = 2100
integer taborder = 10
end type

on uo_webview.destroy
call u_cst_webview::destroy
end on

event oninvoke;call super::oninvoke;int nIndex,nCnt
string sArgList

//测试异常
//pfwThrowException("test ex")

nCnt = UpperBound(args)
for nIndex = 1 to nCnt
	sArgList += args[nIndex]
	if nIndex < nCnt then sArgList += ","
next

return "OnInvoke: " + method + ", [" + sArgList + "]"
end event

event onengineerror;call super::onengineerror;MessageBox("OnEngineError",reason)
end event

type webview from n_cst_webview within w_test_webview descriptor "pb_nvo" = "true" 
end type

on webview.create
call super::create
end on

on webview.destroy
call super::destroy
end on

event onloadresource;call super::onloadresource;if url = "mem://test.js" then
	data = Blob("alert('inject script')",EncodingUTF8!)
end if
end event

