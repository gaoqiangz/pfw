$PBExportHeader$w_test_eventful.srw
forward
global type w_test_eventful from window
end type
type cbx_1 from checkbox within w_test_eventful
end type
type cb_3 from commandbutton within w_test_eventful
end type
type cb_4 from commandbutton within w_test_eventful
end type
type cb_2 from commandbutton within w_test_eventful
end type
type cb_1 from commandbutton within w_test_eventful
end type
end forward

global type w_test_eventful from window
integer width = 2373
integer height = 1208
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event type long onbuttonclicked1 ( commandbutton button,  long wparam,  long lparam )
event type long onbuttonclicked2 ( commandbutton button,  long wparam,  long lparam )
event ontest ( string arg )
cbx_1 cbx_1
cb_3 cb_3
cb_4 cb_4
cb_2 cb_2
cb_1 cb_1
end type
global w_test_eventful w_test_eventful

type variables
n_cst_eventful _eventful
end variables

event type long onbuttonclicked1(commandbutton button, long wparam, long lparam);n_cst_eventful evtful

//*Message.PowerObjectParm为事件分发对象（n_cst_eventful）
evtful = Message.PowerObjectParm

MessageBox("OnButtonClicked1","source: " + button.text)

//阻止后续的调用链（订阅在此事件后面的处理过程将不再接收到此事件）
//evtful.of_Prevent()

//取消订阅（订阅在此事件后面的处理过程将不再接收到此事件）
//evtful.of_Off("clicked")

//禁用订阅（订阅在此事件后面的处理过程将不再接收到此事件）
//evtful.of_Disable("clicked",true)

//返回值不为null时做将为of_Trigger返回值（可以被覆盖）
//*如果返回值不等于[默认返回值]，那么evtful.of_IsProcessed()返回true同时设置evtful.of_GetReturnValue的值
return wparam + lparam
end event

event type long onbuttonclicked2(commandbutton button, long wparam, long lparam);long nLastReturnValue
n_cst_eventful evtful

//*Message.PowerObjectParm为事件分发对象（n_cst_eventful）
evtful = Message.PowerObjectParm

//前面有事件处理过则返回true
if evtful.of_IsProcessed() then
	//前面事件过程的返回值
	nLastReturnValue = evtful.of_GetReturnValue()
end if

MessageBox("OnButtonClicked2","source: " + button.text + "~nprocessed: " + iif(evtful.of_IsProcessed(),"已处理","未处理") + "~nlast return value: " + String(nLastReturnValue) )

//触发事件
evtful.of_Trigger("test","hello pfw!")

//返回值不为null时做将为of_Trigger返回值（可以被覆盖）
//*如果返回值不等于[默认返回值]，那么evtful.of_IsProcessed()返回true同时设置evtful.of_GetReturnValue的值
return wparam + lparam + nLastReturnValue
end event

event ontest(string arg);MessageBox("OnTest",arg)
end event

event open;_eventful = Create n_cst_eventful
end event

on w_test_eventful.create
this.cbx_1=create cbx_1
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cbx_1,&
this.cb_3,&
this.cb_4,&
this.cb_2,&
this.cb_1}
end on

on w_test_eventful.destroy
destroy(this.cbx_1)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event close;Destroy _eventful
end event

type cbx_1 from checkbox within w_test_eventful
integer x = 498
integer y = 792
integer width = 677
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "禁用订阅(Disable)"
end type

event clicked;//禁用指定对象所有订阅
//_eventful.of_Disable(parent,Checked)

//禁用指定对象之外所有订阅
//_eventful.of_Disable(parent,true,Checked)

//禁用指定对象事件相关的所有订阅
//_eventful.of_Disable(parent,"onButtonClicked1",Checked)

//禁用订阅
//_eventful.of_Disable("clicked",parent,"onButtonClicked1",Checked)

/*
	'^'开头为排除指定名称
		'^'+[事件名]
		'.'+'^'+[名称空间]
		'^'+[事件名]+'.'+'^'+[名称空间]
*/

//禁用指定事件的所有订阅
_eventful.of_Disable("clicked",Checked)

//禁用指定事件之外的所有订阅
//_eventful.of_Disable("^clicked",Checked)

//禁用指定名称空间所有订阅
//_eventful.of_Disable(".myns",Checked)

//禁用指定名称空间之外所有订阅
//_eventful.of_Disable(".^myns",Checked)

//禁用指定名称空间事件的所有订阅
//_eventful.of_Disable("clicked.myns",Checked)

//禁用指定名称空间指定事件之外的所有订阅
//_eventful.of_Disable("^clicked.myns",Checked)

//禁用指定名称空间之外的指定事件的所有订阅
//_eventful.of_Disable("clicked.^myns",Checked)

//禁用指定名称空间之外和指定事件之外的所有订阅
//_eventful.of_Disable("^clicked.^myns",Checked)

//禁用指定事件没有名称空间的所有订阅
//_eventful.of_Disable("clicked.",Checked)

//禁用指定事件有名称空间的所有订阅
//_eventful.of_Disable("clicked.^",Checked)

//禁用没有名称空间的所有订阅
//_eventful.of_Disable(".",Checked)

//禁用有名称空间的所有订阅
//_eventful.of_Disable(".^",Checked)

//禁用所有订阅
//_eventful.of_Disable(Checked)
end event

type cb_3 from commandbutton within w_test_eventful
integer x = 457
integer y = 580
integer width = 507
integer height = 136
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "订阅事件(On)"
end type

event clicked;/*
	事件名称，订阅使用规范（of_On:[name]）
		'-'开头表示插入到相同优先级队列的头部（默认插入到尾部）
		'!'开头表示最高分发优先级
		'@'开头表示最低分发优先级
		[数字]+':'开头表示自定义优先级（数字越大优先级越高,默认优先级为0）
	事件捕获标志（根据处理状态）
		'*'开头表示捕获所有处理状态的事件
		'%'开头表示捕获已经处理的事件（被前面的订阅处理）
		默认只捕获未被处理的事件
	可以含有名称空间
		[事件名]+'.'+[名称空间]
	示例：
			of_On("clicked",...)			//默认优先级
			of_On("!clicked",...)		//高优先级
			of_On("@clicked",...)		//低优先级
			of_On("-clicked",...)		//插入到默认优先级头部
			of_On("-!clicked",...)		//插入到高优先级头部
			of_On("-@clicked",...)		//插入到低优先级头部
			of_On("9999:clicked",...)	//优先级为9999
			of_On("clicked.myns",...)	//订阅事件在[.myns]名称空间下
			of_On("close.myns",...)		//订阅事件在[.myns]名称空间下（使用of_Off(".myns")取消所有订阅在该名称空间下的事件）
			of_On("*click",...)			//捕获所有事件
			of_On("%click",...)			//捕获已处理的事件
	注意：
		'!'/'@'符号与[数字]+':'不能同时使用，'*'与'%'也不能同时使用，其他随意组合（符号的顺序可以任意但必须在最开头）
		优先级与名称空间无关，名称空间一般仅与of_Off/of_Disable搭配使用
		事件的处理状态是通过of_SetDefaultValue函数设置的[默认返回值]来判断事件是否被订阅者处理了（返回值不等于[默认返回值]，没有返回值则定义为未被处理）
		事件的处理状态不能回滚（[已处理]就不能再变为[未处理]，但事件的返回值可以被后续的订阅过程覆盖）
		of_Prevent函数会阻止继续分发事件，所有之后的订阅过程都不会被调用
		在事件分发过程中调用of_On订阅新的事件将在下次分发时才会生效
		事件是以名称升序排列的，使用小名称可以提高查找和分发性能
	--- 特别说明 ---
		回调处理事件的参数数量不要求与of_Trigger参数数量一致，但必须顺序相同并且类型可以兼容
		如：
			event ontest(string arg1,string arg2)
			...
			of_On("test",this,"ontest")
			...
			of_Trigger("test","arg 1") //ontest事件的arg2参数为''（类型的初始值）
			of_Trigger("test","arg 1","arg 2","arg 3",...) //多余的参数将会被丢弃
*/
//订阅事件
_eventful.of_On("clicked" /*事件名（区分大小写）*/,parent /*回调对象*/,"onButtonClicked1" /*回调事件名（不区分大小写）*/)
_eventful.of_On("*clicked.myns" /*订阅在[.myns]名称空间（区分大小写）并且捕获所有处理状态的事件*/,parent,"onButtonClicked2")
_eventful.of_On("test.myns",parent,"onTest")

/*--- 设置事件的默认返回值 ---*/
//*当事件没有被处理时返回该值（比如没有被订阅）
//*该值同样被用来判断是否被订阅者处理（返回值不等于[默认返回值]则定义为被处理）
//*建议始终为事件设置默认返回值

//设置所有事件的默认值返回值
_eventful.of_SetDefaultReturnValue(0)

//设置指定事件的默认值返回值
//_eventful.of_SetDefaultReturnValue("clicked",0)

/*
	如果没有设置事件默认返回值那么of_Trigger就可能返回一个为null的any类型的值
*/
end event

type cb_4 from commandbutton within w_test_eventful
integer x = 1102
integer y = 576
integer width = 553
integer height = 136
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "取消订阅(Off)"
end type

event clicked;//取消指定对象所有订阅
//_eventful.of_Off(parent)

//取消指定对象之外所有订阅
//_eventful.of_Off(parent,true)

//取消指定对象事件相关的所有订阅
//_eventful.of_Off(parent,"onButtonClicked1")

//取消订阅
//_eventful.of_Off("clicked",parent,"onButtonClicked1")

/*
	'^'开头为排除指定名称
		'^'+[事件名]
		'.'+'^'+[名称空间]
		'^'+[事件名]+'.'+'^'+[名称空间]
	*意为保留指定名称的订阅
*/

//取消指定事件的所有订阅
_eventful.of_Off("clicked")

//取消指定事件之外的所有订阅
//_eventful.of_Off("^clicked")

//取消指定名称空间所有订阅
//_eventful.of_Off(".myns")

//取消指定名称空间之外所有订阅
//_eventful.of_Off(".^myns")

//取消指定名称空间事件的所有订阅
//_eventful.of_Off("clicked.myns")

//取消指定名称空间指定事件之外的所有订阅
//_eventful.of_Off("^clicked.myns")

//取消指定名称空间之外的指定事件的所有订阅
//_eventful.of_Off("clicked.^myns")

//取消指定名称空间之外和指定事件之外的所有订阅
//_eventful.of_Off("^clicked.^myns")

//取消指定事件没有名称空间的所有订阅
//_eventful.of_Off("clicked.")

//取消指定事件有名称空间的所有订阅
//_eventful.of_Off("clicked.^")

//取消没有名称空间的所有订阅
//_eventful.of_Off(".")

//取消有名称空间的所有订阅
//_eventful.of_Off(".^")

//取消所有订阅
//_eventful.of_Off()
end event

type cb_2 from commandbutton within w_test_eventful
integer x = 1074
integer y = 296
integer width = 457
integer height = 136
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "我是按钮2"
end type

event clicked;any aRetVal
string sRetVal

//触发指定事件
aRetVal = _eventful.of_Trigger("clicked",this,10,20)
if IsNull(aRetVal) then
	sRetVal = "(none)"
else
	sRetVal = String(aRetVal)
end if

MessageBox("return",sRetVal)
end event

type cb_1 from commandbutton within w_test_eventful
integer x = 530
integer y = 300
integer width = 457
integer height = 136
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "我是按钮1"
end type

event clicked;any aRetVal
string sRetVal

//触发指定事件
aRetVal = _eventful.of_Trigger("clicked",this,1,2)
if IsNull(aRetVal) then
	sRetVal = "(none)"
else
	sRetVal = String(aRetVal)
end if

MessageBox("return",sRetVal)
end event

