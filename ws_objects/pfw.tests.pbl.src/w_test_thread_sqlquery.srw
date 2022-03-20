$PBExportHeader$w_test_thread_sqlquery.srw
forward
global type w_test_thread_sqlquery from window
end type
type st_desc from statictext within w_test_thread_sqlquery
end type
type sle_pageindex from singlelineedit within w_test_thread_sqlquery
end type
type st_2 from statictext within w_test_thread_sqlquery
end type
type st_1 from statictext within w_test_thread_sqlquery
end type
type dw_1 from datawindow within w_test_thread_sqlquery
end type
type cb_2 from commandbutton within w_test_thread_sqlquery
end type
type cb_1 from commandbutton within w_test_thread_sqlquery
end type
type sle_pagesize from singlelineedit within w_test_thread_sqlquery
end type
end forward

global type w_test_thread_sqlquery from window
integer width = 4160
integer height = 1924
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_desc st_desc
sle_pageindex sle_pageindex
st_2 st_2
st_1 st_1
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
sle_pagesize sle_pagesize
end type
global w_test_thread_sqlquery w_test_thread_sqlquery

type variables
n_cst_threading _thread
end variables

on w_test_thread_sqlquery.create
this.st_desc=create st_desc
this.sle_pageindex=create sle_pageindex
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_pagesize=create sle_pagesize
this.Control[]={this.st_desc,&
this.sle_pageindex,&
this.st_2,&
this.st_1,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.sle_pagesize}
end on

on w_test_thread_sqlquery.destroy
destroy(this.st_desc)
destroy(this.sle_pageindex)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_pagesize)
end on

event open;_thread = Create n_cst_threading
end event

event close;Destroy _thread
end event

type st_desc from statictext within w_test_thread_sqlquery
integer x = 1806
integer y = 292
integer width = 2222
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type sle_pageindex from singlelineedit within w_test_thread_sqlquery
integer x = 1289
integer y = 292
integer width = 457
integer height = 88
integer taborder = 40
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_test_thread_sqlquery
integer x = 905
integer y = 304
integer width = 402
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Page Index:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_test_thread_sqlquery
integer x = 64
integer y = 292
integer width = 347
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Page Size:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_test_thread_sqlquery
event onsqlquerystop ( n_cst_threading_task_sqlquery task,  long exitcode,  string lasterrorinfo )
event type long onsqlquerystart ( n_cst_threading_task_sqlquery task )
integer x = 82
integer y = 400
integer width = 3963
integer height = 1364
integer taborder = 30
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event onsqlquerystop(n_cst_threading_task_sqlquery task, long exitcode, string lasterrorinfo);//该事件为线程任务通知
if exitCode = RetCode.CANCELLED then return //任务被取消
if exitCode = RetCode.OK then //成功执行
	blob blbData
	//拷贝数据,也可以用RowsMove节省内存开销(如果表结构一致的话)
	task.Data.GetFullState(ref blbData)
	this.SetFullState(blbData)
	//获取记录数(如果开启了分页功能则为查询SQL的总行数)
	st_desc.Text = "Record Count:" + String(RowCount())
	if task.#Paged then
		//当前页设置的大小
		st_desc.Text += " Page Size:" + String(task.#PageSize)
		//总共页数
		st_desc.Text += " Page Count:" + String(task.of_GetPageCount())
		//当前页设置的码
		st_desc.Text += " Page Index:" + String(task.#PageIndex)
	end if
else
	choose case exitCode
		case RetCode.E_DB_ERROR,RetCode.E_INVALID_TRANSACTION //数据库相关的错误
			DBERRORDATA errData
			errData = task.of_GetLastDBErrorData()
			MessageBox("DBERROR",errData.SQLErrText)
		case else		//其它错误(sparam可能包含错误信息)
			MessageBox("EXCEPTION",Sprintf("wpara:{1}~nsparam:{2}",FormatRetCode(exitCode),lastErrorInfo))
	end choose
end if
end event

event type long onsqlquerystart(n_cst_threading_task_sqlquery task);//该事件为线程任务通知
//任务启动(返回1阻止)
MessageBox("","start")
return 0
end event

type cb_2 from commandbutton within w_test_thread_sqlquery
integer x = 773
integer y = 80
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;//请求停止线程并取消当前所有任务
_thread.of_Stop()
end event

type cb_1 from commandbutton within w_test_thread_sqlquery
integer x = 155
integer y = 84
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Query"
end type

event clicked;n_cst_threading_task_sqlquery sqlQuery

if _thread.of_GetCount() = 0 then
	//首次运行创建任务
	_thread.of_AddTask(ref sqlQuery,"n_cst_threading_task_sqlquery")
	//订阅任务事件
	sqlQuery.of_On("start",dw_1,"onsqlquerystart")
	sqlQuery.of_On("stop",dw_1,"onsqlquerystop")
	//设置事务连接参数
	//sqlQuery.of_SetTransData( /*readonly string dbms*/, /*readonly string servername*/, /*readonly string database*/, /*readonly string logid*/, /*readonly string logpass*/, /*readonly string dbparm */)
	//设置SQL语句或DataObject
	//sqlQuery.of_SetSQL("{SELECT SQL}")
	//sqlQuery.of_SetDataObject("{dw_xxx}")
	//设置参数,支持简单数据类型和简单数据类型数组的任意数量的参数(可选)
	//string sParams[]
	//sParams[1] = "arg1"
	//sParams[2] = "arg2"
	//sqlQuery.of_SetParam(sParams)
	//或者
	//sqlQuery.of_AddParam("args",{"arg1","arg2"})
	//开启分页功能
	//sqlQuery.of_SetPaged(true)
else
	_thread.of_GetTask(1,ref sqlQuery)
end if
//设置分页大小
//sqlQuery.of_SetPageSize(Long(sle_pagesize.Text))
//设置页码
//sqlQuery.of_SetPageIndex(Long(sle_pageindex.Text))
//运行
_thread.of_Run()
end event

type sle_pagesize from singlelineedit within w_test_thread_sqlquery
integer x = 416
integer y = 292
integer width = 457
integer height = 88
integer taborder = 30
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "500"
borderstyle borderstyle = stylelowered!
end type

