$PBExportHeader$u_cst_tabpage_sciter_treeview.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_sciter_treeview from ue_cst_tabpage
end type
type cb_4 from commandbutton within u_cst_tabpage_sciter_treeview
end type
type cb_1 from se_cst_button within u_cst_tabpage_sciter_treeview
end type
type cbx_1 from checkbox within u_cst_tabpage_sciter_treeview
end type
type cb_2 from se_cst_button within u_cst_tabpage_sciter_treeview
end type
type cbx_2 from checkbox within u_cst_tabpage_sciter_treeview
end type
type cb_3 from se_cst_button within u_cst_tabpage_sciter_treeview
end type
type uo_tree from ue_cst_sciter_treeview within u_cst_tabpage_sciter_treeview
end type
type mle_event from se_cst_multilineedit within u_cst_tabpage_sciter_treeview
end type
type uo_splitcontainer from ue_cst_splitcontainer within u_cst_tabpage_sciter_treeview
end type
end forward

global type u_cst_tabpage_sciter_treeview from ue_cst_tabpage
integer width = 3387
integer height = 1472
cb_4 cb_4
cb_1 cb_1
cbx_1 cbx_1
cb_2 cb_2
cbx_2 cbx_2
cb_3 cb_3
uo_tree uo_tree
mle_event mle_event
uo_splitcontainer uo_splitcontainer
end type
global u_cst_tabpage_sciter_treeview u_cst_tabpage_sciter_treeview

type variables
long ii_optNum
end variables

forward prototypes
public subroutine of_appendevent (string newevent)
end prototypes

public subroutine of_appendevent (string newevent);mle_event.Text += newEvent + "~r~n"
mle_event.Scroll(mle_event.LineCount())
end subroutine

on u_cst_tabpage_sciter_treeview.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.cb_1=create cb_1
this.cbx_1=create cbx_1
this.cb_2=create cb_2
this.cbx_2=create cbx_2
this.cb_3=create cb_3
this.uo_tree=create uo_tree
this.mle_event=create mle_event
this.uo_splitcontainer=create uo_splitcontainer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.cbx_2
this.Control[iCurrent+6]=this.cb_3
this.Control[iCurrent+7]=this.uo_tree
this.Control[iCurrent+8]=this.mle_event
this.Control[iCurrent+9]=this.uo_splitcontainer
end on

on u_cst_tabpage_sciter_treeview.destroy
call super::destroy
destroy(this.cb_4)
destroy(this.cb_1)
destroy(this.cbx_1)
destroy(this.cb_2)
destroy(this.cbx_2)
destroy(this.cb_3)
destroy(this.uo_tree)
destroy(this.mle_event)
destroy(this.uo_splitcontainer)
end on

event resize;call super::resize;uo_splitcontainer.Move(0,uo_splitcontainer.y)
uo_splitcontainer.Resize(newWidth,newHeight - uo_splitcontainer.y)
end event

event onopen;call super::onopen;uo_splitcontainer.of_SetOrientation(Enums.VERT)
uo_splitcontainer.Panel2.of_SetCollapsible(true)
uo_splitcontainer.Panel1.of_SetSize(U2PX(uo_tree.Width))
uo_splitcontainer.Panel1.of_BindObject(uo_tree)
uo_splitcontainer.Panel2.of_BindObject(mle_event)

//加载IconFont
//*使用home://协议访问相对程序根目录的资源路径
uo_tree.of_SetIconFont("home://res\fonts\awesome.ttf")
end event

type cb_4 from commandbutton within u_cst_tabpage_sciter_treeview
integer x = 1591
integer y = 56
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

event clicked;/*
OPTION OBJECT：
{
	text:"text",
	image:"url",
	imagePosition: 1,
	tipText: "tipText",
	disabledLook: false,
	checked: false,
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
string sData,sImg
n_scitervalue valData

sImg = ReplaceAll(Res.ICO_S_BLUE,"\","\\")

sData = '[{"text":"test1xxx","checked":true,"image":"' + sImg + '","tipText":"tipText1","attributes":{"_test":"test value","_atr":"afasdf"},"children":[{"text":"test2","image":"' + sImg + '","tipText":"tipText2"}]},{"text":"test2","image":"' + sImg + '","tipText":"tipText2"}]'
valData = Create n_scitervalue
valData.Parse(sData)
uo_tree.of_Load(valData)

end event

type cb_1 from se_cst_button within u_cst_tabpage_sciter_treeview
integer x = 5
integer y = 16
integer width = 306
integer height = 132
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "添加节点"
end type

event clicked;string ls_tipText

ii_optNum ++

if Mod(ii_optNum,2) = 0 then
	ls_tipText = "<b>Option " + String(ii_optNum) +" Tip!</b><br><img src=~"home://" + Res.ICO_S_LOGO + "~"/>测试<span style=~"font-size:20pt;color:rgb(255,0,0)~">测试</span>"
else
	ls_tipText = "Option " + String(ii_optNum) +" Normal Tip!"
end if

uo_tree.of_AddOption("Option " + String(ii_optNum),"#f270" /*IconFont字符码*/,ls_tipText).of_AddChild("Child","#f260","Child")
end event

type cbx_1 from checkbox within u_cst_tabpage_sciter_treeview
integer x = 9
integer y = 172
integer width = 681
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "开启节点勾选功能"
end type

event clicked;uo_tree.of_SetCheckBox(checked)
end event

type cb_2 from se_cst_button within u_cst_tabpage_sciter_treeview
integer x = 334
integer y = 20
integer width = 581
integer height = 132
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "获取当前节点文本"
end type

event clicked;messagebox("",uo_tree.of_GetSelected().of_GetText())
end event

type cbx_2 from checkbox within u_cst_tabpage_sciter_treeview
integer x = 699
integer y = 176
integer width = 553
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "勾选当前节点"
end type

event clicked;if checked then
	uo_tree.of_GetSelected().of_Check()
else
	uo_tree.of_GetSelected().of_Uncheck()
end if
end event

type cb_3 from se_cst_button within u_cst_tabpage_sciter_treeview
integer x = 919
integer y = 20
integer width = 617
integer height = 132
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "编辑当前节点文本"
end type

event clicked;uo_tree.of_GetSelected().of_EditText("new Text")
end event

type uo_tree from ue_cst_sciter_treeview within u_cst_tabpage_sciter_treeview
integer y = 316
integer width = 795
integer height = 1140
integer taborder = 20
boolean #allowdrag = true
end type

event ontvselectionchanged;call super::ontvselectionchanged;of_AppendEvent("OnTVSelectionChanged:" + newOption.of_GetText() + "  oldOption:" + oldOption.of_GetText())
return 0
end event

event ontvselectionchanging;call super::ontvselectionchanging;//返回1阻止
of_AppendEvent("OnTVSelectionChanging:" + newOption.of_GetText() + "  oldOption:" + oldOption.of_GetText())
return 0
end event

event ontvclicked;call super::ontvclicked;of_AppendEvent("OnTVClicked:" + option.of_GetText())
return 0
end event

event ontvrightclicked;call super::ontvrightclicked;of_AppendEvent("OnTVRightClicked:" + option.of_GetText())
return 0
end event

event ontvrightdoubleclicked;call super::ontvrightdoubleclicked;of_AppendEvent("OnTVRightDoubleClicked:" + option.of_GetText())
return 0
end event

event ontvexpanding;call super::ontvexpanding;//返回1阻止
of_AppendEvent("OnTVExpanding:" + option.of_GetText())
return 0
end event

event ontvexpanded;call super::ontvexpanded;of_AppendEvent("OnTVExpanded:" + option.of_GetText())
return 0
end event

event ontvcollapsing;call super::ontvcollapsing;//返回1阻止
of_AppendEvent("OnTVCollapsing:" + option.of_GetText())
return 0
end event

event ontvcollapsed;call super::ontvcollapsed;of_AppendEvent("OnTVCollapsed:" + option.of_GetText())
return 0
end event

event ontvcheckstatechanging;call super::ontvcheckstatechanging;//返回1阻止
string ls_state
choose case newState
	case CHECK_STATE_CHECKED
		ls_state = "CHECK_STATE_CHECKED"
	case CHECK_STATE_UNCHECKED
		ls_state = "CHECK_STATE_UNCHECKED"
	case CHECK_STATE_INDETERMINATE
		ls_state = "CHECK_STATE_INDETERMINATE"
end choose
of_AppendEvent("OnTVCheckStateChanging:" + option.of_GetText() + "  newState:" + ls_state)
return 0
end event

event ontvcheckstatechanged;call super::ontvcheckstatechanged;string ls_state
choose case newState
	case CHECK_STATE_CHECKED
		ls_state = "CHECK_STATE_CHECKED"
	case CHECK_STATE_UNCHECKED
		ls_state = "CHECK_STATE_UNCHECKED"
	case CHECK_STATE_INDETERMINATE
		ls_state = "CHECK_STATE_INDETERMINATE"
end choose
of_AppendEvent("OnTVCheckStateChanged:" + option.of_GetText() + "  newState:" + ls_state)
return 0
end event

event ontvbegindrag;call super::ontvbegindrag;//返回1阻止
of_AppendEvent("OnTVBeginDrag:" + option.of_GetText())
return 0
end event

event ontvdragenter;call super::ontvdragenter;//返回1阻止进入该位置
string ls_where
choose case where
	case DD_DROP_WHERE_BEFORE
		ls_where = "DD_DROP_WHERE_BEFORE"
	case DD_DROP_WHERE_AFTER
		ls_where = "DD_DROP_WHERE_AFTER"
	case DD_DROP_WHERE_INSIDE
		ls_where = "DD_DROP_WHERE_INSIDE"
end choose
of_AppendEvent("OnTVDragEnter:" + option.of_GetText() + "  dragOption:" + dragOption.of_GetText() + "  where:" + ls_where)
return 0
end event

event ontvdragleave;call super::ontvdragleave;string ls_where
choose case where
	case DD_DROP_WHERE_BEFORE
		ls_where = "DD_DROP_WHERE_BEFORE"
	case DD_DROP_WHERE_AFTER
		ls_where = "DD_DROP_WHERE_AFTER"
	case DD_DROP_WHERE_INSIDE
		ls_where = "DD_DROP_WHERE_INSIDE"
end choose
of_AppendEvent("OnTVDragLeave:" + option.of_GetText() + "  dragOption:" + dragOption.of_GetText() + "  where:" + ls_where)
return 0
end event

event ontvdragdrop;call super::ontvdragdrop;//返回1阻止拖放到该位置
string ls_where
choose case where
	case DD_DROP_WHERE_BEFORE
		ls_where = "DD_DROP_WHERE_BEFORE"
	case DD_DROP_WHERE_AFTER
		ls_where = "DD_DROP_WHERE_AFTER"
	case DD_DROP_WHERE_INSIDE
		ls_where = "DD_DROP_WHERE_INSIDE"
end choose
of_AppendEvent("OnTVDragDrop:" + option.of_GetText() + "  dragOption:" + dragOption.of_GetText() + " where:" + ls_where)
return 0
end event

event ontvbegintextedit;call super::ontvbegintextedit;//返回1阻止
of_AppendEvent("OnTVBeginTextEdit:" + option.of_GetText())
return 0
end event

event ontvenddrag;call super::ontvenddrag;of_AppendEvent("OnTVEndDrag:" + option.of_GetText())
return 0
end event

on uo_tree.destroy
call ue_cst_sciter_treeview::destroy
end on

event ontvendtextedit;call super::ontvendtextedit;//返回1阻止
if Modified then
	option.of_SetTipText(newText)
	of_AppendEvent("OnTVEndTextEdit:" + option.of_GetText() + " newText:" + newText)
elseif reason = 2 then
	//被取消
	of_AppendEvent("OnTVEndTextEdit:" + option.of_GetText() + " reason:Cancelled")
end if
return 0
end event

event ontvdoubleclicked;call super::ontvdoubleclicked;//返回1阻止默认行为
of_AppendEvent("OnTVDoubleClicked:" + option.of_GetText())
return 0
end event

event ontvpopulate;call super::ontvpopulate;//节点被首次展开(仅触发一次)
of_AppendEvent("OnTVPopulate:" + option.of_GetText())
return 0
end event

type mle_event from se_cst_multilineedit within u_cst_tabpage_sciter_treeview
integer x = 818
integer y = 312
integer width = 1371
integer height = 1140
integer taborder = 10
integer textsize = -8
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = ""
boolean hscrollbar = true
boolean vscrollbar = true
boolean autovscroll = true
end type

type uo_splitcontainer from ue_cst_splitcontainer within u_cst_tabpage_sciter_treeview
integer y = 308
integer width = 2222
integer height = 1176
integer taborder = 20
end type

on uo_splitcontainer.destroy
call ue_cst_splitcontainer::destroy
end on

