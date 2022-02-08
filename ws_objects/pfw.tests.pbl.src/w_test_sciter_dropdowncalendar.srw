$PBExportHeader$w_test_sciter_dropdowncalendar.srw
forward
global type w_test_sciter_dropdowncalendar from window
end type
type sle_value from singlelineedit within w_test_sciter_dropdowncalendar
end type
type cb_1 from commandbutton within w_test_sciter_dropdowncalendar
end type
type sciter from n_cst_sciter within w_test_sciter_dropdowncalendar
end type
end forward

global type w_test_sciter_dropdowncalendar from window
integer width = 1979
integer height = 1140
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_value sle_value
cb_1 cb_1
sciter sciter
end type
global w_test_sciter_dropdowncalendar w_test_sciter_dropdowncalendar

type variables

end variables

on w_test_sciter_dropdowncalendar.create
this.sle_value=create sle_value
this.cb_1=create cb_1
this.sciter=create sciter
this.Control[]={this.sle_value,&
this.cb_1}
end on

on w_test_sciter_dropdowncalendar.destroy
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.sciter)
end on

event open;string sHtml
real fWidth,fHeight

sHtml = '<html>'+&
			'<head>'+&
			'<style>'+&
				'html{size:max-content;overflow:hidden}'+&
				'body{margin:0;}'+&
			'</style>'+&
			'<script type="text/javascript">'+&
				'document.$("input").onmouseup = function(evt){'+&
					'if(evt.button != 1) return;'+&
					'if(!evt.target.$is(".day") && !evt.target.$is(".today")) return;'+&
					'Window.this.xcall("closePopup",1);'+&
				'};'+&
				'document.$("input").onkeyup = function(evt){'+&
					'if(evt.code != "KeyRETURN") return;'+&
					'Window.this.xcall("closePopup",1);'+&
				'}'+&
			'</script>'+&
			'</head>'+&
			'<body><input#calendar type="calendar" /></body>'+&
			'</html>'
			
//创建Sciter窗口
sciter.CreateWindow(Enums.SC_WS_POPUP + Enums.SC_WS_ALPHA + Enums.SC_WS_TOOL,this)
//加载HTML
sciter.LoadHtml(sHtml)

//计算内容大小
fWidth = sciter.GetMinWidth()
fHeight = sciter.GetMinHeight(fWidth)
//设置窗口大小
sciter.Resize(fWidth,fHeight)
end event

type sle_value from singlelineedit within w_test_sciter_dropdowncalendar
integer x = 114
integer y = 424
integer width = 800
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_test_sciter_dropdowncalendar
integer x = 960
integer y = 424
integer width = 695
integer height = 128
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "DropDownCalendar"
end type

event clicked;RECTF rcWnd

Win32.GetWindowRect(Handle(this),ref rcWnd)

sciter.Move(rcWnd.left,rcWnd.bottom)
if sciter.Popup() = 1 then //返回值为1时说明选择了日期而不是点了其它地方导致退出了Popup
	sle_value.text = String(Date(sciter.GetElementByID("calendar").GetValue()))
end if
end event

type sciter from n_cst_sciter within w_test_sciter_dropdowncalendar descriptor "pb_nvo" = "true" 
end type

on sciter.create
call super::create
end on

on sciter.destroy
call super::destroy
end on

