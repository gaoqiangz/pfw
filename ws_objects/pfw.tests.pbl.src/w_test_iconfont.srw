$PBExportHeader$w_test_iconfont.srw
forward
global type w_test_iconfont from window
end type
type cb_2 from s_cst_button within w_test_iconfont
end type
type cb_1 from s_cst_button within w_test_iconfont
end type
end forward

global type w_test_iconfont from window
integer width = 2043
integer height = 1420
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
end type
global w_test_iconfont w_test_iconfont

type variables
ulong hFontRes
end variables

on w_test_iconfont.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.cb_1}
end on

on w_test_iconfont.destroy
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;/*
	协议：
		font://字体名称[#16进制unicode码或单个字符]
	附加参数：
			font:://facename[#ff00]{color:red}
*/
//加载字体
//1.该字体包含一个字体名为[awesome]
//2.如果是在进程其实都要使用的字体可以不必保存AddFontResource的返回值，进程退出时会自动释放加载的字体
hFontRes = AddFontResource("res\Fonts\awesome.ttf")

cb_1.theme.of_SetIconPosition(Enums.LEFT)
cb_1.theme.of_SetIconSize(24,24)
cb_1.of_SetImage("font://awesome[#fd01]{color:red}")

cb_2.theme.of_SetIconPosition(Enums.RIGHT)
cb_2.theme.of_SetIconSize(32,32)
cb_2.of_SetImage("font://awesome[#fd02]{color:green}")
end event

event close;RemoveFontResource(hFontRes)
end event

type cb_2 from s_cst_button within w_test_iconfont
integer x = 969
integer y = 552
integer width = 379
integer height = 200
integer taborder = 20
end type

type cb_1 from s_cst_button within w_test_iconfont
integer x = 494
integer y = 544
integer width = 379
integer height = 200
integer taborder = 10
end type

