$PBExportHeader$w_test_json.srw
forward
global type w_test_json from window
end type
type cb_3 from commandbutton within w_test_json
end type
type cb_2 from commandbutton within w_test_json
end type
type mle_json from multilineedit within w_test_json
end type
type cb_1 from commandbutton within w_test_json
end type
type uo_tv from u_cst_sciter_treeview within w_test_json
end type
end forward

global type w_test_json from window
integer width = 4695
integer height = 1956
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_2 cb_2
mle_json mle_json
cb_1 cb_1
uo_tv uo_tv
end type
global w_test_json w_test_json

type variables

end variables

forward prototypes
public subroutine wf_buildtree (readonly n_json json, readonly n_cst_sciter_treeview_option option)
end prototypes

public subroutine wf_buildtree (readonly n_json json, readonly n_cst_sciter_treeview_option option);long nIndex,nCount

choose case json.GetType()
	case Enums.JSON_TYPE_OBJECT
		nCount = json.GetItemCount()
		for nIndex = 1 to nCount
			wf_BuildTree(json.GetItem(nIndex),option.of_AddChild(json.GetItemName(nIndex)))
		next
	case Enums.JSON_TYPE_ARRAY
		nCount = json.GetItemCount()
		for nIndex = 1 to nCount
			wf_BuildTree(json.GetItem(nIndex),option.of_AddChild("["+String(nIndex)+"]"))
		next
	case Enums.JSON_TYPE_BOOLEAN
		option.of_AddChild(String(json.GetValueBoolean()))
	case Enums.JSON_TYPE_NUMBER
		option.of_AddChild(String(json.GetValueDouble()))
	case Enums.JSON_TYPE_STRING
		option.of_AddChild(json.GetValueString())
	case Enums.JSON_TYPE_NULL
		option.of_AddChild("NULL")
end choose

end subroutine

on w_test_json.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.mle_json=create mle_json
this.cb_1=create cb_1
this.uo_tv=create uo_tv
this.Control[]={this.cb_3,&
this.cb_2,&
this.mle_json,&
this.cb_1,&
this.uo_tv}
end on

on w_test_json.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.mle_json)
destroy(this.cb_1)
destroy(this.uo_tv)
end on

event open;mle_json.text = '{"employees": [{ "firstName":"Bill" , "lastName":"Gates" },{ "firstName":"George" , "lastName":"Bush" },{ "firstName":"Thomas" , "lastName":"Carter" }]}'
end event

type cb_3 from commandbutton within w_test_json
integer x = 1248
integer y = 80
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ToObject"
end type

event clicked;n_json json

json = Create n_json

json.Parse('{"title":"test title","mle_json":{"text":"test abacdfefqe"}}')

json.ToObject(parent)
end event

type cb_2 from commandbutton within w_test_json
integer x = 722
integer y = 72
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "FromObject"
end type

event clicked;n_json json

json = Create n_json

json.Parse('{"title":null,"width":null,"height":null,"x":null,"y":null,"mle_json":{"text":null}}')
json.FromObject(parent,true /* 以当前对象为模版解析目标对象的属性 */)
messagebox("",json.Serialize(Enums.JSON_FORMAT_INDENT))
end event

type mle_json from multilineedit within w_test_json
integer x = 110
integer y = 280
integer width = 2505
integer height = 1488
integer taborder = 20
integer textsize = -12
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

type cb_1 from commandbutton within w_test_json
integer x = 87
integer y = 68
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Parse"
end type

event clicked;n_json json

json = ParseJSON(mle_json.text)
if json.IsValid() then
	uo_tv.of_RemoveAll()
	wf_BuildTree(json,uo_tv.of_AddOption("JSON"))
else
	MessageBox("","解析失败")
end if

end event

type uo_tv from u_cst_sciter_treeview within w_test_json
integer x = 2734
integer y = 16
integer width = 1865
integer height = 1780
integer taborder = 20
end type

on uo_tv.destroy
call u_cst_sciter_treeview::destroy
end on

