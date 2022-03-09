$PBExportHeader$w_test_dwsvc_columnexp.srw
forward
global type w_test_dwsvc_columnexp from window
end type
type cb_4 from commandbutton within w_test_dwsvc_columnexp
end type
type dw_2 from se_cst_dw within w_test_dwsvc_columnexp
end type
type st_1 from statictext within w_test_dwsvc_columnexp
end type
type mle_trace from multilineedit within w_test_dwsvc_columnexp
end type
type cb_3 from commandbutton within w_test_dwsvc_columnexp
end type
type cb_2 from commandbutton within w_test_dwsvc_columnexp
end type
type sle_prec from singlelineedit within w_test_dwsvc_columnexp
end type
type cb_1 from commandbutton within w_test_dwsvc_columnexp
end type
type dw_1 from se_cst_dw within w_test_dwsvc_columnexp
end type
end forward

global type w_test_dwsvc_columnexp from window
integer width = 3968
integer height = 1856
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
dw_2 dw_2
st_1 st_1
mle_trace mle_trace
cb_3 cb_3
cb_2 cb_2
sle_prec sle_prec
cb_1 cb_1
dw_1 dw_1
end type
global w_test_dwsvc_columnexp w_test_dwsvc_columnexp

on w_test_dwsvc_columnexp.create
this.cb_4=create cb_4
this.dw_2=create dw_2
this.st_1=create st_1
this.mle_trace=create mle_trace
this.cb_3=create cb_3
this.cb_2=create cb_2
this.sle_prec=create sle_prec
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_4,&
this.dw_2,&
this.st_1,&
this.mle_trace,&
this.cb_3,&
this.cb_2,&
this.sle_prec,&
this.cb_1,&
this.dw_1}
end on

on w_test_dwsvc_columnexp.destroy
destroy(this.cb_4)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.mle_trace)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.sle_prec)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;/*
	表达示服务
		支持对多个列设置表达示（与计算列的语法相同），同一个列支持多个表达示，并且引入了宏变量/函数来扩展表达示功能
		
	宏语法:
		$变量名(静态展开)/$$变量名(动态展开)
		$函数名({表达示参数列表})/$$内置函数名({表达示参数列表})
		内置函数：
			expression $$('变量名') - 获取变量
			any $$Invoke('函数名'[,参数1[,参数2[,...]]]) - 调用函数
		*变量和函数名称区分大小写
*/

//开启表达示服务
dw_1.ColumnExp.of_SetEnabled(true)
//开启计算过程日志输出
dw_1.ColumnExp.of_SetTrace(true)

/*--- 设置表达示 ---*/

//定义变量

dw_1.ColumnExp.of_AddVarExp("损耗","1")
dw_1.ColumnExp.of_AddVarExp("倍率","2")
dw_1.ColumnExp.of_AddVarExp("回程","'3'")
dw_1.ColumnExp.of_AddVarExp("上月读数","4")
dw_1.ColumnExp.of_AddVarExp("本月读数","5")
dw_1.ColumnExp.of_AddVar("精度",0)

dw_1.ColumnExp.of_AddvarExp("num1","$FormatPrice($上月读数,$精度)")
dw_1.ColumnExp.of_AddvarExp("num2","$FormatPrice($本月读数,$精度)")
dw_1.ColumnExp.of_AddvarExp("exp1","$FormatPrice($本月读数*$倍率+$损耗,$精度)")
dw_1.ColumnExp.of_AddvarExp("exp2","$FormatPrice(($本月读数+dec($回程))*$倍率+$损耗,$精度)")

dw_1.ColumnExp.of_SetExp("n1","$$(if($num1-$num2>0 ,'exp1','exp2'))")
dw_1.ColumnExp.of_Calc(1)
end event

type cb_4 from commandbutton within w_test_dwsvc_columnexp
integer x = 1413
integer y = 944
integer width = 745
integer height = 136
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "设置新表达示(跨DW)"
end type

event clicked;//dw_2开启表达示服务
dw_2.ColumnExp.of_SetEnabled(true)

//dw_2定义变量

dw_2.ColumnExp.of_AddVarExp("数据汇总","SUM(n1)")

//引用dw_2变量
dw_1.ColumnExp.of_AddForeignVar("数据汇总",dw_2)

dw_1.ColumnExp.of_SetVarExp("未收","n1")
dw_1.ColumnExp.of_SetVarExp("应收","n3")
dw_1.ColumnExp.of_SetVarExp("实收","n2")

//n2 = n3 - n1
//静态展开【精度】变量
dw_1.ColumnExp.of_SetExp("n2","$FormatPrice($应收-$未收,$精度)")
//n3 = n1 + n2
//动态展开【精度】变量
dw_1.ColumnExp.of_SetExp("n3","$FormatPrice($未收+$实收,$$精度)")
//n1 = n3 - n2
//动态获取【精度】变量
dw_1.ColumnExp.of_SetExp("n1","$FormatPrice(n3-n2,$$('精度'))+$$数据汇总")

//*重新计算所有列的表达示时是以表达示添加的顺序执行的
dw_1.ColumnExp.of_CalcAll()
end event

type dw_2 from se_cst_dw within w_test_dwsvc_columnexp
integer x = 2103
integer y = 40
integer width = 1733
integer height = 872
integer taborder = 10
string dataobject = "dw_test_dwsvc_columnexp"
boolean vscrollbar = true
end type

type st_1 from statictext within w_test_dwsvc_columnexp
integer x = 9
integer y = 1112
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
string text = "DebugTrace:"
boolean focusrectangle = false
end type

type mle_trace from multilineedit within w_test_dwsvc_columnexp
integer y = 1220
integer width = 3886
integer height = 528
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
end type

type cb_3 from commandbutton within w_test_dwsvc_columnexp
integer x = 3118
integer y = 956
integer width = 722
integer height = 136
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "强制计算所有表达示"
end type

event clicked;//*重新计算所有列的表达示时是以表达示添加的顺序执行的
dw_1.ColumnExp.of_CalcAll(true)
end event

type cb_2 from commandbutton within w_test_dwsvc_columnexp
integer x = 786
integer y = 940
integer width = 503
integer height = 136
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "设置新表达示"
end type

event clicked;dw_1.ColumnExp.of_SetVarExp("未收","n1")
dw_1.ColumnExp.of_SetVarExp("应收","n3")
dw_1.ColumnExp.of_SetVarExp("实收","n2")

//n2 = n3 - n1
//*静态展开【精度】变量
dw_1.ColumnExp.of_SetExp("n2","$FormatPrice($应收-$未收,$精度)")
//n3 = n1 + n2
//*动态展开【精度】变量
dw_1.ColumnExp.of_SetExp("n3","$FormatPrice($未收+$实收,$$精度)")
//n1 = n3 - n2
//*动态获取【精度】变量
dw_1.ColumnExp.of_SetExp("n1","$FormatPrice(n3-n2,$$('精度'))")

//*重新计算所有列的表达示时是以表达示添加的顺序执行的
dw_1.ColumnExp.of_CalcAll()
end event

type sle_prec from singlelineedit within w_test_dwsvc_columnexp
integer x = 32
integer y = 960
integer width = 215
integer height = 108
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "2"
end type

type cb_1 from commandbutton within w_test_dwsvc_columnexp
integer x = 283
integer y = 940
integer width = 425
integer height = 136
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "设置精度"
end type

event clicked;//设置表达示变量的值并重新计算相关联的列
//*重新计算所有相关列的表达示时是以表达示添加的顺序执行的
dw_1.ColumnExp.of_SetVar("精度",Long(sle_prec.text),true)
end event

type dw_1 from se_cst_dw within w_test_dwsvc_columnexp
integer x = 37
integer y = 40
integer width = 2025
integer height = 872
integer taborder = 10
string dataobject = "dw_test_dwsvc_columnexp"
boolean vscrollbar = true
end type

event oncolumnexpinvokemethod;call super::oncolumnexpinvokemethod;//表达示服务请求执行函数
choose case name
	case "FormatPrice" //格式化金额
		return Round(Double(args[1]),Long(args[2]))
end choose
end event

event onitemchanged;call super::onitemchanged;//单元格值发生改变后触发（此时数据已经写入缓冲区）
end event

event oncolumnexptrace;call super::oncolumnexptrace;mle_trace.text += Sprintf("{,-4} {}({})>{}: {}, Expr: {}",mle_trace.LineCount() + 1,dwo.name,row,stack,value,expr) + "~r~n"
mle_trace.Scroll(mle_trace.LineCount())
end event

