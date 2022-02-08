$PBExportHeader$u_cst_tabpage_sciter_sidebar.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_sciter_sidebar from ue_cst_tabpage
end type
type cb_4 from commandbutton within u_cst_tabpage_sciter_sidebar
end type
type cb_3 from se_cst_button within u_cst_tabpage_sciter_sidebar
end type
type cb_2 from se_cst_button within u_cst_tabpage_sciter_sidebar
end type
type cb_1 from se_cst_button within u_cst_tabpage_sciter_sidebar
end type
type mle_event from se_cst_multilineedit within u_cst_tabpage_sciter_sidebar
end type
type uo_sidebar from ue_cst_sciter_sidebar within u_cst_tabpage_sciter_sidebar
end type
type uo_splitcontainer from ue_cst_splitcontainer within u_cst_tabpage_sciter_sidebar
end type
end forward

global type u_cst_tabpage_sciter_sidebar from ue_cst_tabpage
integer width = 2418
integer height = 1660
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
mle_event mle_event
uo_sidebar uo_sidebar
uo_splitcontainer uo_splitcontainer
end type
global u_cst_tabpage_sciter_sidebar u_cst_tabpage_sciter_sidebar

type variables
private:
long _nOptNum

constant real NAV_COLLAPSED_WIDTH	= 40
constant real NAV_EXPANDED_WIDTH		= 200
end variables

forward prototypes
public subroutine of_appendevent (readonly string newevent)
end prototypes

public subroutine of_appendevent (readonly string newevent);mle_event.Text += newEvent + "~r~n"
mle_event.Scroll(mle_event.LineCount())
end subroutine

on u_cst_tabpage_sciter_sidebar.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.mle_event=create mle_event
this.uo_sidebar=create uo_sidebar
this.uo_splitcontainer=create uo_splitcontainer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.mle_event
this.Control[iCurrent+6]=this.uo_sidebar
this.Control[iCurrent+7]=this.uo_splitcontainer
end on

on u_cst_tabpage_sciter_sidebar.destroy
call super::destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.mle_event)
destroy(this.uo_sidebar)
destroy(this.uo_splitcontainer)
end on

event onopen;call super::onopen;uo_splitcontainer.of_SetOrientation(Enums.VERT)
uo_splitcontainer.Panel2.of_SetCollapsible(true)
uo_splitcontainer.Panel1.of_SetSize(NAV_EXPANDED_WIDTH)
uo_splitcontainer.Panel1.of_BindObject(uo_sidebar)
uo_splitcontainer.Panel2.of_BindObject(mle_event)

//加载IconFont
//*使用home://协议访问相对程序根目录的资源路径
uo_sidebar.of_SetIconFont("home://res\fonts\awesome.ttf")
end event

event resize;call super::resize;uo_splitcontainer.Move(0,uo_splitcontainer.y)
uo_splitcontainer.Resize(newWidth,newHeight - uo_splitcontainer.y)
end event

type cb_4 from commandbutton within u_cst_tabpage_sciter_sidebar
integer x = 1010
integer y = 60
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Load"
end type

event clicked;/*
OPTION OBJECT：
{
	text:"text",
	image:"url",
	imagePosition: 1,
	tipText: "tipText",
	disabledLook: false,
	attributes: {
		key1: "val1",
		key2: "val2",
		...
	},
	children: [
		{OPTION OBJECT},
		{OPTION OBJECT},
		...
	]
}
Load:
[{OPTION OBJECT},{OPTION OBJECT},...]
*/
string sData,sImg,sImg2
n_scitervalue valData

sImg = ReplaceAll(Res.ICO_S_BLUE,"\","\\")
sImg2 = ReplaceAll(Res.ICO_S_OLIVE,"\","\\")

sData = '[{"text":"test1","image":"' + sImg + '","tipText":"tipText1","attributes":{"_test":"test value","_atr":"afasdf"},"children":[{"text":"test2","image":"' + sImg2 + '","tipText":"tipText2"}]},{"text":"test3","image":"' + sImg + '","tipText":"tipText3","children":[]}]'
valData = Create n_scitervalue
valData.Parse(sData)
uo_sidebar.of_Load(valData)

end event

type cb_3 from se_cst_button within u_cst_tabpage_sciter_sidebar
integer x = 338
integer y = 8
integer width = 581
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "获取当前节点文本"
end type

event clicked;messagebox("",uo_sidebar.of_GetSelected().of_GetText())
end event

type cb_2 from se_cst_button within u_cst_tabpage_sciter_sidebar
integer x = 14
integer y = 148
integer width = 375
integer taborder = 30
string text = "折叠/展开"
end type

event clicked;call super::clicked;uo_splitcontainer.#LockUpdate = true
uo_splitcontainer.of_ResetLayout()
if uo_sidebar.of_IsCollapsed() then
	uo_splitcontainer.#SplitbarDragable = true
	uo_splitcontainer.Panel1.of_SetSize(NAV_EXPANDED_WIDTH)
	uo_sidebar.of_SetCollapsed(false)
else
	uo_splitcontainer.#SplitbarDragable = false
	uo_splitcontainer.Panel1.of_SetMinSize(NAV_COLLAPSED_WIDTH)
	uo_splitcontainer.Panel1.of_SetSize(NAV_COLLAPSED_WIDTH)
	uo_sidebar.of_SetCollapsed(true)
end if
uo_splitcontainer.#LockUpdate = false
uo_splitcontainer.of_UpdatePoints()
end event

type cb_1 from se_cst_button within u_cst_tabpage_sciter_sidebar
integer x = 5
integer y = 8
integer width = 306
integer height = 132
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "添加节点"
end type

event clicked;string sTipText
n_cst_sciter_sidebar_option option

_nOptNum ++

if Mod(_nOptNum,2) = 0 then
	sTipText = "<b>Option " + String(_nOptNum) +" Tip!</b><br><img src=~"" + Res.ICO_S_LOGO + "~"/>测试<span style=~"font-size:20pt;color:rgb(255,0,0)~">测试</span>"
else
	sTipText = "Option " + String(_nOptNum) +" Normal Tip!"
end if

option = uo_sidebar.of_AddOption("Option " + String(_nOptNum),"#f270" /*IconFont字符码*/,sTipText)
if Mod(_nOptNum,2) = 0 then
	option.of_AddChild("Child <span style=~"font-size:20pt;color:rgb(255,0,0)~">测试</span>",Res.ICO_S_OLIVE,"Child",true /*textIsHtml*/)
else
	option.of_AddChild("Child","#f260","Child")
end if
end event

type mle_event from se_cst_multilineedit within u_cst_tabpage_sciter_sidebar
integer x = 649
integer y = 272
integer width = 1769
integer height = 1360
integer taborder = 20
string text = ""
end type

type uo_sidebar from ue_cst_sciter_sidebar within u_cst_tabpage_sciter_sidebar
integer y = 264
integer width = 631
integer height = 1364
integer taborder = 20
boolean #itemselect = true
end type

on uo_sidebar.destroy
call ue_cst_sciter_sidebar::destroy
end on

event onsbselectionchanging;call super::onsbselectionchanging;//返回1阻止
of_AppendEvent("OnSBSelectionChanging:" + newOption.of_GetText() + "  oldOption:" + oldOption.of_GetText())
return 0
end event

event onsbselectionchanged;call super::onsbselectionchanged;of_AppendEvent("OnSBSelectionChanged:" + newOption.of_GetText() + "  oldOption:" + oldOption.of_GetText())
end event

event onsbpopulate;call super::onsbpopulate;//节点被首次展开(仅触发一次)
//返回1阻止
of_AppendEvent("OnSBPopulate:" + option.of_GetText())
return 0
end event

event onsbexpanding;call super::onsbexpanding;//返回1阻止
of_AppendEvent("OnSBExpanding:" + option.of_GetText())
return 0
end event

event onsbexpanded;call super::onsbexpanded;of_AppendEvent("OnSBExpanded:" + option.of_GetText())
end event

event onsbcollapsing;call super::onsbcollapsing;//返回1阻止
of_AppendEvent("OnSBCollapsing:" + option.of_GetText())
return 0
end event

event onsbcollapsed;call super::onsbcollapsed;of_AppendEvent("OnSBCollapsed:" + option.of_GetText())
end event

event onsbclicked;call super::onsbclicked;of_AppendEvent("OnSBClicked:" + option.of_GetText())
end event

type uo_splitcontainer from ue_cst_splitcontainer within u_cst_tabpage_sciter_sidebar
integer y = 268
integer width = 2427
integer height = 1368
integer taborder = 20
end type

on uo_splitcontainer.destroy
call ue_cst_splitcontainer::destroy
end on

