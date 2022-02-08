$PBExportHeader$w_test_logger.srw
forward
global type w_test_logger from window
end type
type cb_9 from commandbutton within w_test_logger
end type
type cb_6 from commandbutton within w_test_logger
end type
type cb_5 from commandbutton within w_test_logger
end type
type cb_4 from commandbutton within w_test_logger
end type
type cb_3 from commandbutton within w_test_logger
end type
type cb_2 from commandbutton within w_test_logger
end type
type cb_1 from commandbutton within w_test_logger
end type
end forward

global type w_test_logger from window
integer width = 2162
integer height = 1052
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_9 cb_9
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_test_logger w_test_logger

type variables
n_logger _logger
end variables

event open;_logger = Create n_logger
_logger.OpenFile("pfw.log")
_logger.SetLevel(Enums.LOG_LEVEL_ALL)
_logger.SetTraceLevel(Enums.LOG_LEVEL_ALL)

_logger.SetHeaderPattern("{Y}-{M:02d}-{D:02d} {h:02d}:{m:02d}:{s:02d}.{ms:03d} [{L}] ")
end event

event close;Destroy _logger
end event

on w_test_logger.create
this.cb_9=create cb_9
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_9,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_test_logger.destroy
destroy(this.cb_9)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cb_9 from commandbutton within w_test_logger
integer x = 128
integer y = 692
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Sprintf"
end type

event clicked;//引用参数语法: {index[,alignment][:format]}
//*index为参数索引,从1开始
//*alignment为对齐长度,当字符串长度小于对齐长度时以空白符填充,aligment为正数时右对齐,为负时左对齐
//*format为字符串格式,参考String的函数格式说明
//*使用右斜杠'\'转义中括号:'{','}'

MessageBox("",Sprintf(/*格式化信息*/&
							"Sprintf~n\{1\}:{1:(@@@)-@@@@}~n\{2\}:{2,20:###,###,##0}~n\{3\}:{3:YYYY-MM-DD}~n\{4\}:{4}",+&
							/*传递参数*/&
							"1234567",123457,DateTime(ToDay(),Now()),Now()))
end event

type cb_6 from commandbutton within w_test_logger
integer x = 841
integer y = 212
integer width = 754
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "DisconnectToConsole"
end type

event clicked;_logger.DisconnectToConsole()
end event

type cb_5 from commandbutton within w_test_logger
integer x = 114
integer y = 212
integer width = 667
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ConnectToConsole"
end type

event clicked;_logger.ConnectToConsole()
end event

type cb_4 from commandbutton within w_test_logger
integer x = 1641
integer y = 464
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Debug"
end type

event clicked;//引用参数语法: {index[,alignment][:format]}
//*index为参数索引,从1开始
//*alignment为对齐长度,当字符串长度小于对齐长度时以空白符填充,aligment为正数时右对齐,为负时左对齐
//*format为字符串格式,参考String的函数格式说明
//*使用右斜杠'\'转义中括号:'{','}'

//只有开启了Debug级别才会输出
_logger.Debug(/*输出的格式化信息*/&
				"pfwLogger Info~n\{1\}:{1,20}~n\{2\}:{2,20:\{@@@\}-(@@@@@)}~n\{3\}:{3,20:###,###,##0.0}~n\{4\}:{4,20:MMM-DDD-YY HH:MM:SS}~n\{5\}:{5,20:H:MM:SS AM/PM}",+&
				/*传递参数*/&
				"Hello World!","12345678",123456.789,DateTime(ToDay(),Now()),Now())
end event

type cb_3 from commandbutton within w_test_logger
integer x = 1143
integer y = 464
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Error"
end type

event clicked;//引用参数语法: {index[,alignment][:format]}
//*index为参数索引,从1开始
//*alignment为对齐长度,当字符串长度小于对齐长度时以空白符填充,aligment为正数时右对齐,为负时左对齐
//*format为字符串格式,参考String的函数格式说明
//*使用右斜杠'\'转义中括号:'{','}'

_logger.Error(/*输出的格式化信息*/&
				"pfwLogger Info~n\{1\}:{1,20}~n\{2\}:{2,20:\{@@@\}-(@@@@@)}~n\{3\}:{3,20:###,###,##0.0}~n\{4\}:{4,20:MMM-DDD-YY HH:MM:SS}~n\{5\}:{5,20:H:MM:SS AM/PM}",+&
				/*传递参数*/&
				"Hello World!","12345678",123456.789,DateTime(ToDay(),Now()),Now())
_logger.Error("test~r~nddddd")
end event

type cb_2 from commandbutton within w_test_logger
integer x = 635
integer y = 464
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Warning"
end type

event clicked;//引用参数语法: {index[,alignment][:format]}
//*index为参数索引,从1开始
//*alignment为对齐长度,当字符串长度小于对齐长度时以空白符填充,aligment为正数时右对齐,为负时左对齐
//*format为字符串格式,参考String的函数格式说明
//*使用右斜杠'\'转义中括号:'{','}'

_logger.Warning(/*输出的格式化信息*/&
					"pfwLogger Info~n\{1\}:{1,20}~n\{2\}:{2,20:\{@@@\}-(@@@@@)}~n\{3\}:{3,20:###,###,##0.0}~n\{4\}:{4,20:MMM-DDD-YY HH:MM:SS}~n\{5\}:{5,20:H:MM:SS AM/PM}",+&
					/*传递参数*/&
					"Hello World!","12345678",123456.789,DateTime(ToDay(),Now()),Now())
end event

type cb_1 from commandbutton within w_test_logger
integer x = 119
integer y = 464
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Info"
end type

event clicked;//引用参数语法: {index[,alignment][:format]}
//*index为参数索引,从1开始
//*alignment为对齐长度,当字符串长度小于对齐长度时以空白符填充,aligment为正数时右对齐,为负时左对齐
//*format为字符串格式,参考String的函数格式说明
//*使用右斜杠'\'转义中括号:'{','}'

_logger.Info(/*输出的格式化信息*/&
				"pfwLogger Info~n\{1\}:{1,20}~n\{2\}:{2,20:\{@@@\}-(@@@@@)}~n\{3\}:{3,20:###,###,##0.0}~n\{4\}:{4,20:MMM-DDD-YY HH:MM:SS}~n\{5\}:{5,20:H:MM:SS AM/PM}",+&
				/*传递参数*/&
				"Hello World!","12345678",123456.789,DateTime(ToDay(),Now()),Now())
end event

