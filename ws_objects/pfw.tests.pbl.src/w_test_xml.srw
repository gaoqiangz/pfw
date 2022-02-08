$PBExportHeader$w_test_xml.srw
forward
global type w_test_xml from window
end type
type mle_xml from multilineedit within w_test_xml
end type
type cb_1 from commandbutton within w_test_xml
end type
type uo_tv from u_cst_sciter_treeview within w_test_xml
end type
end forward

global type w_test_xml from window
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
mle_xml mle_xml
cb_1 cb_1
uo_tv uo_tv
end type
global w_test_xml w_test_xml

forward prototypes
public subroutine wf_buildtree (readonly n_xmlnode xml, readonly n_cst_sciter_treeview_option option)
end prototypes

public subroutine wf_buildtree (readonly n_xmlnode xml, readonly n_cst_sciter_treeview_option option);string ls_txt
n_xmlnode xmlNode
n_xmlattribute xmlAttr
n_cst_sciter_treeview_option optChild

if xml.HasAttributes() then
	optChild = option.of_AddChild("Attributes")
	xmlAttr = xml.GetFirstAttribute()
	do until xmlAttr.IsEmpty()
		optChild.of_AddChild(xmlAttr.GetName()).of_AddChild(xmlAttr.GetValueString())
		xmlAttr = xmlAttr.GetNext()
	loop
end if

xmlNode = xml.GetFirstChild()
do until xmlNode.IsEmpty()
	choose case xmlNode.GetType()
		case Enums.XML_NODE_DOCUMENT,Enums.XML_NODE_ELEMENT
			wf_BuildTree(xmlNode,option.of_AddChild(xmlNode.GetName()))
		case Enums.XML_NODE_PCDATA,Enums.XML_NODE_CDATA
			option.of_AddChild(xmlNode.GetValue())
	end choose
	xmlNode = xmlNode.GetNext()
loop
end subroutine

on w_test_xml.create
this.mle_xml=create mle_xml
this.cb_1=create cb_1
this.uo_tv=create uo_tv
this.Control[]={this.mle_xml,&
this.cb_1,&
this.uo_tv}
end on

on w_test_xml.destroy
destroy(this.mle_xml)
destroy(this.cb_1)
destroy(this.uo_tv)
end on

event open;mle_xml.text = "<note><to>George</to><from>John</from><heading>Reminder</heading><body>Don't forget the meeting!</body></note>"
end event

type mle_xml from multilineedit within w_test_xml
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

type cb_1 from commandbutton within w_test_xml
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

event clicked;n_xmldoc doc

doc = ParseXML(mle_xml.text)
if doc.IsValid() then
	uo_tv.of_RemoveAll()
	wf_BuildTree(doc,uo_tv.of_AddOption("XML"))
else
	MessageBox("","解析失败")
end if
end event

type uo_tv from u_cst_sciter_treeview within w_test_xml
integer x = 2734
integer y = 16
integer width = 1865
integer height = 1780
integer taborder = 20
end type

on uo_tv.destroy
call u_cst_sciter_treeview::destroy
end on

