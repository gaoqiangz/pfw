$PBExportHeader$w_test_splitcontainer.srw
forward
global type w_test_splitcontainer from window
end type
type dw_7 from datawindow within w_test_splitcontainer
end type
type dw_6 from datawindow within w_test_splitcontainer
end type
type dw_5 from datawindow within w_test_splitcontainer
end type
type cb_1 from commandbutton within w_test_splitcontainer
end type
type cbx_5 from checkbox within w_test_splitcontainer
end type
type cbx_4 from checkbox within w_test_splitcontainer
end type
type cbx_3 from checkbox within w_test_splitcontainer
end type
type cbx_2 from checkbox within w_test_splitcontainer
end type
type cbx_1 from checkbox within w_test_splitcontainer
end type
type dw_4 from datawindow within w_test_splitcontainer
end type
type dw_3 from datawindow within w_test_splitcontainer
end type
type dw_2 from datawindow within w_test_splitcontainer
end type
type dw_1 from datawindow within w_test_splitcontainer
end type
type uo_splitcontainer from u_cst_splitcontainer within w_test_splitcontainer
end type
end forward

global type w_test_splitcontainer from window
integer width = 3525
integer height = 1904
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_7 dw_7
dw_6 dw_6
dw_5 dw_5
cb_1 cb_1
cbx_5 cbx_5
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
dw_4 dw_4
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
uo_splitcontainer uo_splitcontainer
end type
global w_test_splitcontainer w_test_splitcontainer

event resize;//uo_splitcontainer.Move(0,0)
uo_splitcontainer.Resize(newWidth,newHeight - uo_splitcontainer.y)
end event

on w_test_splitcontainer.create
this.dw_7=create dw_7
this.dw_6=create dw_6
this.dw_5=create dw_5
this.cb_1=create cb_1
this.cbx_5=create cbx_5
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.uo_splitcontainer=create uo_splitcontainer
this.Control[]={this.dw_7,&
this.dw_6,&
this.dw_5,&
this.cb_1,&
this.cbx_5,&
this.cbx_4,&
this.cbx_3,&
this.cbx_2,&
this.cbx_1,&
this.dw_4,&
this.dw_3,&
this.dw_2,&
this.dw_1,&
this.uo_splitcontainer}
end on

on w_test_splitcontainer.destroy
destroy(this.dw_7)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.cb_1)
destroy(this.cbx_5)
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.uo_splitcontainer)
end on

event open;n_cst_splitcontainer splitContainer,splitContainer2,splitContainer3

uo_splitcontainer.theme.of_SetItemBkgndStyle(Enums.VISTAORIGINAL)
uo_splitcontainer.theme.of_SetBkgndColorStyle(ToARGB(255,Win32.GetPBColor(BackColor)))

uo_splitcontainer.of_SetOrientation(Enums.VERT)
uo_splitcontainer.Panel1.of_SetSize(0.3)
uo_splitcontainer.Panel2.of_SetSize(0.7)

uo_splitcontainer.Panel1.of_SetTitleBar(true)
uo_splitcontainer.Panel2.of_SetTitleBar(true)
uo_splitcontainer.Panel1.of_SetTitle("测试标题")
uo_splitcontainer.Panel2.of_SetTitle("测试标题")

uo_splitcontainer.Panel1.of_SetCollapsible(true)
uo_splitcontainer.Panel2.of_SetCollapsible(true)

splitContainer = uo_splitcontainer.Panel1.of_BindSplitContainer(Enums.HORZ)

splitContainer.Panel1.of_SetTitleBar(true)
splitContainer.Panel2.of_SetTitleBar(true)
splitContainer.Panel1.of_SetTitle("测试标题")
splitContainer.Panel2.of_SetTitle("测试标题")

splitContainer.Panel1.of_SetSize(0.3)
splitContainer.Panel2.of_SetSize(0.78)

splitContainer.Panel1.of_SetCollapsible(true)
splitContainer.Panel2.of_SetCollapsible(true)

splitContainer.Panel1.of_BindObject(dw_1)
splitContainer.Panel2.of_BindObject(dw_2)

splitContainer = uo_splitcontainer.Panel2.of_BindSplitContainer(Enums.HORZ)

splitContainer.Panel1.of_SetTitleBar(true)
splitContainer.Panel2.of_SetTitleBar(true)
splitContainer.Panel1.of_SetTitle("测试标题")
splitContainer.Panel2.of_SetTitle("测试标题")

splitContainer.Panel1.of_SetCollapsible(true)
splitContainer.Panel2.of_SetCollapsible(true)

splitContainer2 = splitContainer.Panel1.of_BindSplitContainer(Enums.HORZ)

splitContainer2.Panel1.of_SetCollapsible(true)
splitContainer2.Panel2.of_SetCollapsible(true)

splitContainer2.Panel1.of_BindObject(dw_3)
splitContainer2.Panel2.of_BindObject(dw_4)

splitContainer2 = splitContainer.Panel2.of_BindSplitContainer(Enums.VERT)

splitContainer2.Panel1.of_SetSize(0.3)
splitContainer2.Panel2.of_SetSize(0.7)

splitContainer2.Panel1.of_SetCollapsible(true)
splitContainer2.Panel2.of_SetCollapsible(true)

splitContainer2.Panel1.of_BindObject(dw_5)

splitContainer3 = splitContainer2.Panel2.of_BindSplitContainer(Enums.VERT)

splitContainer3.Panel1.of_SetCollapsible(true)
splitContainer3.Panel2.of_SetCollapsible(true)

splitContainer3.Panel1.of_BindObject(dw_6)
splitContainer3.Panel2.of_BindObject(dw_7)
end event

type dw_7 from datawindow within w_test_splitcontainer
integer x = 2226
integer y = 1128
integer width = 439
integer height = 608
integer taborder = 60
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_6 from datawindow within w_test_splitcontainer
integer x = 1650
integer y = 1120
integer width = 539
integer height = 612
integer taborder = 50
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_test_splitcontainer
integer x = 1102
integer y = 1120
integer width = 498
integer height = 624
integer taborder = 40
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_test_splitcontainer
integer x = 14
integer y = 104
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "重置布局"
end type

event clicked;uo_splitcontainer.#LockUpdate = true
uo_splitcontainer.of_ResetLayout()
uo_splitcontainer.#LockUpdate = false
uo_splitcontainer.of_UpdatePoints()
end event

type cbx_5 from checkbox within w_test_splitcontainer
integer x = 681
integer y = 16
integer width = 645
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Panel2 Collapsed"
end type

event clicked;uo_splitcontainer.Panel2.of_SetCollapsed(Checked)
end event

type cbx_4 from checkbox within w_test_splitcontainer
integer y = 8
integer width = 645
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Panel1 Collapsed"
end type

event clicked;uo_splitcontainer.Panel1.of_SetCollapsed(Checked)
end event

type cbx_3 from checkbox within w_test_splitcontainer
integer x = 2496
integer y = 16
integer width = 928
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Panel2 - Container Visible"
boolean checked = true
end type

event clicked;n_cst_splitcontainer splitContainer

uo_splitcontainer.Panel2.of_GetSplitContainer(ref splitContainer)
splitContainer.Panel2.of_GetSplitContainer(ref splitContainer)
splitContainer.of_SetVisible(Checked)
end event

type cbx_2 from checkbox within w_test_splitcontainer
integer x = 1906
integer y = 24
integer width = 544
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Panel2 Visible"
boolean checked = true
end type

event clicked;uo_splitcontainer.Panel2.of_SetVisible(Checked)
end event

type cbx_1 from checkbox within w_test_splitcontainer
integer x = 1344
integer y = 16
integer width = 544
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Panel1 Visible"
boolean checked = true
end type

event clicked;uo_splitcontainer.Panel1.of_SetVisible(Checked)
end event

type dw_4 from datawindow within w_test_splitcontainer
integer x = 1102
integer y = 764
integer width = 1559
integer height = 300
integer taborder = 30
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_3 from datawindow within w_test_splitcontainer
integer x = 1088
integer y = 312
integer width = 1582
integer height = 404
integer taborder = 20
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_test_splitcontainer
integer x = 41
integer y = 976
integer width = 914
integer height = 764
integer taborder = 30
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_test_splitcontainer
integer x = 46
integer y = 316
integer width = 914
integer height = 640
integer taborder = 20
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_splitcontainer from u_cst_splitcontainer within w_test_splitcontainer
integer y = 256
integer width = 3429
integer height = 1524
integer taborder = 20
boolean #tooltip = true
end type

on uo_splitcontainer.destroy
call u_cst_splitcontainer::destroy
end on

event onpanelcollapsed;call super::onpanelcollapsed;/*if Panel = Panel1 then
	Panel2.of_SetSize(-1)
elseif Panel = Panel2 then
	Panel1.of_SetSize(-1)
end if*/
end event

event onpanelexpanded;call super::onpanelexpanded;/*if Panel = Panel1 then
	Panel1.of_SetSize(0.3)
elseif Panel = Panel2 then
	Panel2.of_SetSize(0.7)
end if*/
end event

