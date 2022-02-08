$PBExportHeader$w_test_ribbonbar.srw
forward
global type w_test_ribbonbar from s_cst_window
end type
type cb_2 from commandbutton within w_test_ribbonbar
end type
type rb_19 from radiobutton within w_test_ribbonbar
end type
type rb_18 from radiobutton within w_test_ribbonbar
end type
type rb_17 from radiobutton within w_test_ribbonbar
end type
type rb_16 from radiobutton within w_test_ribbonbar
end type
type rb_15 from radiobutton within w_test_ribbonbar
end type
type rb_14 from radiobutton within w_test_ribbonbar
end type
type rb_13 from radiobutton within w_test_ribbonbar
end type
type rb_11 from radiobutton within w_test_ribbonbar
end type
type rb_10 from radiobutton within w_test_ribbonbar
end type
type rb_8 from radiobutton within w_test_ribbonbar
end type
type rb_6 from radiobutton within w_test_ribbonbar
end type
type rb_5 from radiobutton within w_test_ribbonbar
end type
type rb_4 from radiobutton within w_test_ribbonbar
end type
type rb_3 from radiobutton within w_test_ribbonbar
end type
type rb_2 from radiobutton within w_test_ribbonbar
end type
type rb_9 from radiobutton within w_test_ribbonbar
end type
type rb_1 from radiobutton within w_test_ribbonbar
end type
type cb_5 from commandbutton within w_test_ribbonbar
end type
type rb_12 from radiobutton within w_test_ribbonbar
end type
type rb_7 from radiobutton within w_test_ribbonbar
end type
type cb_1 from s_cst_button within w_test_ribbonbar
end type
type uo_ribbon from u_cst_ribbonbar within w_test_ribbonbar
end type
type gb_3 from groupbox within w_test_ribbonbar
end type
type gb_4 from groupbox within w_test_ribbonbar
end type
type gb_1 from groupbox within w_test_ribbonbar
end type
type gb_2 from groupbox within w_test_ribbonbar
end type
type gb_5 from groupbox within w_test_ribbonbar
end type
type gb_6 from groupbox within w_test_ribbonbar
end type
end forward

global type w_test_ribbonbar from s_cst_window
integer width = 4073
integer height = 2004
windowstate windowstate = maximized!
long backcolor = 16777215
boolean #bordershadow = true
cb_2 cb_2
rb_19 rb_19
rb_18 rb_18
rb_17 rb_17
rb_16 rb_16
rb_15 rb_15
rb_14 rb_14
rb_13 rb_13
rb_11 rb_11
rb_10 rb_10
rb_8 rb_8
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_9 rb_9
rb_1 rb_1
cb_5 cb_5
rb_12 rb_12
rb_7 rb_7
cb_1 cb_1
uo_ribbon uo_ribbon
gb_3 gb_3
gb_4 gb_4
gb_1 gb_1
gb_2 gb_2
gb_5 gb_5
gb_6 gb_6
end type
global w_test_ribbonbar w_test_ribbonbar

type variables
n_cst_PopupMenu	in_skinMenu
end variables

on w_test_ribbonbar.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.rb_19=create rb_19
this.rb_18=create rb_18
this.rb_17=create rb_17
this.rb_16=create rb_16
this.rb_15=create rb_15
this.rb_14=create rb_14
this.rb_13=create rb_13
this.rb_11=create rb_11
this.rb_10=create rb_10
this.rb_8=create rb_8
this.rb_6=create rb_6
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_9=create rb_9
this.rb_1=create rb_1
this.cb_5=create cb_5
this.rb_12=create rb_12
this.rb_7=create rb_7
this.cb_1=create cb_1
this.uo_ribbon=create uo_ribbon
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_5=create gb_5
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.rb_19
this.Control[iCurrent+3]=this.rb_18
this.Control[iCurrent+4]=this.rb_17
this.Control[iCurrent+5]=this.rb_16
this.Control[iCurrent+6]=this.rb_15
this.Control[iCurrent+7]=this.rb_14
this.Control[iCurrent+8]=this.rb_13
this.Control[iCurrent+9]=this.rb_11
this.Control[iCurrent+10]=this.rb_10
this.Control[iCurrent+11]=this.rb_8
this.Control[iCurrent+12]=this.rb_6
this.Control[iCurrent+13]=this.rb_5
this.Control[iCurrent+14]=this.rb_4
this.Control[iCurrent+15]=this.rb_3
this.Control[iCurrent+16]=this.rb_2
this.Control[iCurrent+17]=this.rb_9
this.Control[iCurrent+18]=this.rb_1
this.Control[iCurrent+19]=this.cb_5
this.Control[iCurrent+20]=this.rb_12
this.Control[iCurrent+21]=this.rb_7
this.Control[iCurrent+22]=this.cb_1
this.Control[iCurrent+23]=this.uo_ribbon
this.Control[iCurrent+24]=this.gb_3
this.Control[iCurrent+25]=this.gb_4
this.Control[iCurrent+26]=this.gb_1
this.Control[iCurrent+27]=this.gb_2
this.Control[iCurrent+28]=this.gb_5
this.Control[iCurrent+29]=this.gb_6
end on

on w_test_ribbonbar.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.rb_19)
destroy(this.rb_18)
destroy(this.rb_17)
destroy(this.rb_16)
destroy(this.rb_15)
destroy(this.rb_14)
destroy(this.rb_13)
destroy(this.rb_11)
destroy(this.rb_10)
destroy(this.rb_8)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_9)
destroy(this.rb_1)
destroy(this.cb_5)
destroy(this.rb_12)
destroy(this.rb_7)
destroy(this.cb_1)
destroy(this.uo_ribbon)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_5)
destroy(this.gb_6)
end on

event resize;call super::resize;uo_ribbon.move(10,10)
uo_ribbon.width = newwidth - uo_ribbon.x * 2
end event

event close;call super::close;destroy in_skinmenu
end event

event open;call super::open;//初始化Skin menu
in_skinmenu = create n_cst_popupmenu
//设置Menu主题
in_skinMenu.theme.of_SetTheme(theme)
//开启Menu的工具提示
in_skinmenu.of_settooltip( true)
//开启Menu标题栏
in_skinmenu.theme.of_SetTitleBar(true)
//设置Menu标题
in_skinmenu.of_SetTitleText("皮肤")
//设置Menu标题图标
in_skinmenu.of_SetTitleImage( "pfw://zip/images[btn_skin.png]")
//设置Menu标题图标对齐方式
in_skinmenu.theme.of_SetTitleBarIconAlign(Center!)

//--- 添加Menu子项 ---
in_skinmenu.of_AddLabel( "颜色:")
in_skinmenu.of_AddMenu( "Blue", "pbr://Res.pbd/bmp/blue","blue color",   100)
in_skinmenu.of_AddMenu( "Silver","pbr://Res.pbd/bmp/silver","silver color",   101)
in_skinmenu.of_AddMenu( "Olive","pbr://Res.pbd/bmp/olive","olive color",   102)
in_skinmenu.of_AddMenu( "Purple","pbr://Res.pbd/bmp/purple","purple color",   103)
in_skinmenu.of_AddMenu( "Classic",  "pbr://Res.pbd/bmp/classic","classic color",  104)
in_skinmenu.of_AddLabel( "风格:")
in_skinmenu.of_AddMenu( "XP","","xp style", 106)
in_skinmenu.of_AddMenu( "Vista","","vista style",   107)
in_skinmenu.of_AddMenu( "Win8","","win8 style",   108)
//预设Menu item的选中状态
in_skinmenu.of_CheckRadios( 100, 104, 104, false, true)
in_skinmenu.of_CheckRadios( 106, 108, 106, false, true)

//uo_ribbon.theme.of_setbkgndstyle(theme.transparent)
//uo_ribbon.theme.of_setborderstyle( Enums.BS_NONE)
uo_ribbon.theme.of_SetBorderShadow(true)
end event

type cb_2 from commandbutton within w_test_ribbonbar
integer x = 1573
integer y = 1580
integer width = 457
integer height = 132
integer taborder = 140
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;uo_ribbon.theme.of_SetTabPadding(uo_ribbon.theme.#TabPadding + 1)
end event

type rb_19 from radiobutton within w_test_ribbonbar
integer x = 87
integer y = 1128
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solid"
end type

event clicked;uo_ribbon.theme.of_SetBorderStyle("SOLID")
end event

type rb_18 from radiobutton within w_test_ribbonbar
integer x = 507
integer y = 1128
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "None"
end type

event clicked;uo_ribbon.theme.of_SetBorderStyle("NONE")
end event

type rb_17 from radiobutton within w_test_ribbonbar
integer x = 1157
integer y = 1120
integer width = 229
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Left"
boolean checked = true
end type

event clicked;uo_ribbon.theme.of_SetTextAlign(Left!)
end event

type rb_16 from radiobutton within w_test_ribbonbar
integer x = 1426
integer y = 1116
integer width = 256
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Center"
end type

event clicked;uo_ribbon.theme.of_SetTextAlign(Center!)
end event

type rb_15 from radiobutton within w_test_ribbonbar
integer x = 1714
integer y = 1116
integer width = 256
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Right"
end type

event clicked;uo_ribbon.theme.of_SetTextAlign(Right!)
end event

type rb_14 from radiobutton within w_test_ribbonbar
integer x = 2670
integer y = 1104
integer width = 256
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Right"
end type

event clicked;uo_ribbon.theme.of_SetTabIconPosition(Enums.RIGHT)
end event

type rb_13 from radiobutton within w_test_ribbonbar
integer x = 2386
integer y = 1104
integer width = 256
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Top"
end type

event clicked;uo_ribbon.theme.of_SetTabIconPosition(Enums.TOP)
end event

type rb_11 from radiobutton within w_test_ribbonbar
integer x = 2139
integer y = 1108
integer width = 229
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Left"
boolean checked = true
end type

event clicked;uo_ribbon.theme.of_SetTabIconPosition(Enums.LEFT)
end event

type rb_10 from radiobutton within w_test_ribbonbar
integer x = 2944
integer y = 1104
integer width = 274
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bottom"
end type

event clicked;uo_ribbon.theme.of_SetTabIconPosition(Enums.BOTTOM)
end event

type rb_8 from radiobutton within w_test_ribbonbar
integer x = 498
integer y = 884
integer width = 389
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "WPS 2013"
end type

event clicked;uo_ribbon.theme.of_SetBkgndStyle("SOLID")
uo_ribbon.theme.of_SetRibbonStyle("OFFICE2010")
uo_ribbon.theme.of_SetTabStyle("WPS2013")
end event

type rb_6 from radiobutton within w_test_ribbonbar
integer x = 59
integer y = 888
integer width = 389
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "WPS 2012"
end type

event clicked;uo_ribbon.theme.of_SetBkgndStyle("VISTAEMBOSSED")
uo_ribbon.theme.of_SetRibbonStyle("OFFICE2010")
uo_ribbon.theme.of_SetTabStyle("WPS2012")
end event

type rb_5 from radiobutton within w_test_ribbonbar
integer x = 1175
integer y = 784
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solid"
end type

event clicked;uo_ribbon.theme.of_setpanelBorderStyle("SOLID")
end event

type rb_4 from radiobutton within w_test_ribbonbar
integer x = 1175
integer y = 884
integer width = 521
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Round"
boolean checked = true
end type

event clicked;uo_ribbon.theme.of_setpanelBorderStyle("ROUND")
end event

type rb_3 from radiobutton within w_test_ribbonbar
integer x = 1765
integer y = 788
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "None"
end type

event clicked;uo_ribbon.theme.of_setpanelBorderStyle("NONE")
end event

type rb_2 from radiobutton within w_test_ribbonbar
integer x = 2939
integer y = 792
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "None"
end type

event clicked;uo_ribbon.theme.of_SetItemBorderStyle("NONE")
end event

type rb_9 from radiobutton within w_test_ribbonbar
integer x = 2350
integer y = 888
integer width = 521
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Round"
boolean checked = true
end type

event clicked;uo_ribbon.theme.of_setitemBorderStyle("ROUND")
end event

type rb_1 from radiobutton within w_test_ribbonbar
integer x = 2350
integer y = 788
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solid"
end type

event clicked;uo_ribbon.theme.of_setitemBorderStyle("SOLID")
end event

type cb_5 from commandbutton within w_test_ribbonbar
integer x = 530
integer y = 1396
integer width = 654
integer height = 132
integer taborder = 130
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add category data"
end type

event clicked;int index
n_cst_ribbonbar_category category
n_cst_ribbonbar_panel panel
n_cst_ribbonbar_button button
n_cst_ribbonbar_toolbar rbtoolbar

if IsFailed(uo_ribbon.of_GetCategory(uo_ribbon.of_GetSelectedIndex(),ref category)) then return

category.#LockUpdate = true
//Add button panel
panel = category.of_AddPanel("Buttons","Open!")
panel.of_SetLaunchButton(true)
panel.#LaunchTipText = "buttons"
panel.#TipText = "buttons"
//panel.of_SetAlwaysItemMode(true)
button = panel.of_addbutton("Large button~nMulti line text","Open!","Copy!","test tip")
button.of_SetAlwaysLargeMode(true)
button.of_setmultiline(true)
panel.of_addseparator()
button = panel.of_addbutton("Menu button","Open!","Copy!","test tip")
button.of_SetStyle(Enums.BTS_DROPDOWN)
button.of_SetPopupMenu(in_skinMenu)
button = panel.of_addbutton("Split button","Open!","Copy!","test tip")
button.of_SetStyle(Enums.BTS_SPLIT)
button.of_SetPopupMenu(in_skinMenu)
panel.of_SetIntermediateScaleOrder(3)
panel.of_SetCompactScaleOrder(1)
panel.of_SetCollapsedScaleOrder(3)
//Add check radio box panel
panel = category.of_AddPanel("Check Radio Box","Open!")
panel.of_SetLaunchButton(true)
panel.#LaunchTipText = "check radio boxes"
panel.#TipText = "check radio boxes"
panel.of_addradiobox("Radiobox unchecked",false,"test tip")
panel.of_addradiobox("Radiobox checked",true,"test tip")
panel.of_addseparator()
panel.of_addcheckbox("Checkbox unchecked",false,"test tip")
panel.of_addcheckbox("Checkbox checked",true,"test tip")
panel.of_SetIntermediateScaleOrder(2)
panel.of_SetCompactScaleOrder(2)
panel.of_SetCollapsedScaleOrder(1)
//Add toolbar panel
panel = category.of_AddPanel("ToolBar","Open!")
panel.of_SetLaunchButton(true)
panel.#LaunchTipText = "toolbar"
panel.#TipText = "toolbar"
rbtoolbar = panel.of_addtoolbar()
rbtoolbar.#Tag = "toolbar"
rbtoolbar.of_SetTextUnderImage(true)
rbtoolbar.of_addbutton( "Open", "Open!", "test tip")
rbtoolbar.of_addbutton( "Save", "Save!", "test tip")
rbtoolbar.of_addseparator()
rbtoolbar.of_addmenubutton(in_skinMenu,"Dropdown button","Copy!","test tips")
rbtoolbar.of_addsplitbutton(in_skinMenu,"Split button","Copy!","test tips")
rbtoolbar.of_addseparator()
rbtoolbar.of_addbutton( "Open", "", "test tip")
rbtoolbar.of_addbutton( "", "Open!", "test tip")
rbtoolbar.of_addsplitbutton(in_skinMenu,"Split button","","test tips")
rbtoolbar.of_addsplitbutton(in_skinMenu,"","Copy!","test tips")
//	panel.of_addseparator()
rbtoolbar = panel.of_addtoolbar()
rbtoolbar.#Tag = "toolbar"
rbtoolbar.of_addbutton( "Open", "Open!", "test tip")
rbtoolbar.of_addbutton( "Save", "Save!", "test tip")
rbtoolbar.of_addseparator()
rbtoolbar.of_addmenubutton(in_skinMenu,"Dropdown button","Copy!","test tips")
rbtoolbar.of_addsplitbutton(in_skinMenu,"Split button","Copy!","test tips")
rbtoolbar.of_addseparator()
rbtoolbar.of_addbutton( "Open", "", "test tip")
rbtoolbar.of_addbutton( "", "Open!", "test tip")
rbtoolbar.of_addsplitbutton(in_skinMenu,"Split button","","test tips")
rbtoolbar.of_addsplitbutton(in_skinMenu,"","Copy!","test tips")
panel.of_SetIntermediateScaleOrder(1)
panel.of_SetCompactScaleOrder(3)
panel.of_SetCollapsedScaleOrder(2)

/*
//测试所有项
for index = 1 to 2
	panel = category.of_AddPanel("Panel","Open!")
	panel.of_SetTipText("test tip")
	panel.of_SetLaunchButton(true)
	if index = 1 then
		panel.of_SetAlwaysItemMode(true)
	end if
	button = panel.of_addbutton("Large button~nMulti line text","Open!","Copy!","test tip")
	button.of_SetAlwaysLargeMode(true)
	button.of_setmultiline(true)
	panel.of_addseparator()
	button = panel.of_addbutton("Menu button","Open!","Copy!","test tip")
	button.of_SetStyle(Enums.BTS_DROPDOWN)
	button.of_SetPopupMenu(in_skinMenu)
	button = panel.of_addbutton("Split button","Open!","Copy!","test tip")
	button.of_SetStyle(Enums.BTS_SPLIT)
	button.of_SetPopupMenu(in_skinMenu)
	//button.of_SetAlwaysLargeMode(true)
	panel.of_addseparator()
	panel.of_addbutton("Text with large and small icon","Open!","Save!","test tip")
	panel.of_addbutton("Text with small icon","Open!","")
	panel.of_addbutton("Text with large icon","","Save!","test tip")
	panel.of_addbutton("Text only","","")
	panel.of_addseparator()
	panel.of_addbutton("","Open!","Save!","test tip")
	panel.of_addbutton("","Open!","")
	panel.of_addbutton("","","Save!","test tip")
	panel.of_addseparator()
	panel.of_addlabel("Test ribbonbar~nlabel multiline text!~nThis is a new line text")
	panel.of_addlink("Test Link text~nEmal:gaoqiangz@msn.com","Link tip text!","test tip")
next*/

category.#LockUpdate = false
category.of_updatepoints()
end event

type rb_12 from radiobutton within w_test_ribbonbar
integer x = 503
integer y = 772
integer width = 416
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Office 2013"
end type

event clicked;uo_ribbon.theme.of_SetBkgndStyle("SOLID")
uo_ribbon.theme.of_SetRibbonStyle("OFFICE2010")
uo_ribbon.theme.of_SetTabStyle("OFFICE2013")
end event

type rb_7 from radiobutton within w_test_ribbonbar
integer x = 73
integer y = 764
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Office 2007"
boolean checked = true
end type

event clicked;uo_ribbon.theme.of_SetBkgndStyle("XP")
uo_ribbon.theme.of_SetRibbonStyle("Office2007")
uo_ribbon.theme.of_SetTabStyle("Office2007")
end event

type cb_1 from s_cst_button within w_test_ribbonbar
integer x = 5
integer y = 1396
integer width = 507
integer height = 128
integer taborder = 20
string text = "Add Category"
end type

event clicked;call super::clicked;int newIndex
n_cst_ribbonbar_category category
category = uo_ribbon.of_AddCategory("Test Ribbon","Open!","tips text!~~")
end event

type uo_ribbon from u_cst_ribbonbar within w_test_ribbonbar
integer width = 3127
integer height = 616
integer taborder = 20
boolean #tooltip = true
boolean #smoothscroll = true
end type

on uo_ribbon.destroy
call u_cst_ribbonbar::destroy
end on

event onlaunchbuttonclicked;call super::onlaunchbuttonclicked;MessageBoxEx("",panel.#Caption)
end event

event onitemclicked;call super::onitemclicked;choose case item.#Type
	case item.ITT_BUTTON
		n_cst_ribbonbar_button button
		button = item
	//	MessageBoxEx(button.#ParentPanel.#Caption,button.#Text)
		button.of_settoggled(Not button.#Toggled)
	case item.ITT_LINK
		n_cst_ribbonbar_link link
		link = item
		MessageBoxEx(link.#ParentPanel.#Caption,link.#Text)
end choose
end event

event onmenuselected;call super::onmenuselected;choose case id
	case 100
		theme.of_SetBkgndColorStyle("BLUE")
		in_skinmenu.of_CheckRadios( 100, 105, 100, false, true)
	case 101
		theme.of_SetBkgndColorStyle("SILVER")
		in_skinmenu.of_CheckRadios( 100, 105, 101, false, true)
	case 102
		theme.of_SetBkgndColorStyle("OLIVE")
		in_skinmenu.of_CheckRadios( 100, 105, 102, false, true)
	case 103
		theme.of_SetBkgndColorStyle("PURPLE")
		in_skinmenu.of_CheckRadios( 100, 105, 103, false, true)
	case 104
		theme.of_SetBkgndColorStyle("CLASSIC")
		in_skinmenu.of_CheckRadios( 100, 105, 104, false, true)
	case 106
		theme.of_SetRibbonStyle("OFFICE2007")
		theme.of_SetItemBkgndStyle("XP")
		theme.of_SetBkgndStyle("XP")
		theme.of_SetTabBkgndStyle("XP")
		theme.of_SetTabStyle(theme.TBS_OFFICE2007)
		theme.of_SetPanelBorderStyle("ROUND")
		theme.of_SetItemBorderStyle("ROUND")
		in_skinmenu.of_CheckRadios( 105, 109, 106, false, true)
	case 107
		theme.of_SetRibbonStyle("OFFICE2013")
		theme.of_SetItemBkgndStyle("VISTAORIGINAL")
		theme.of_SetBkgndStyle("VISTAEMBOSSED")
		theme.of_SetTabBkgndStyle("VISTAEMBOSSED")
		theme.of_SetTabStyle(theme.TBS_OFFICE2013)
		theme.of_SetPanelBorderStyle("ROUND")
		theme.of_SetItemBorderStyle("ROUND")
		in_skinmenu.of_CheckRadios( 105, 109, 107, false, true)
	case 108
		theme.of_SetRibbonStyle("OFFICE2013")
		theme.of_SetItemBkgndStyle("SOLID")
		theme.of_SetBkgndStyle("SOLID")
		theme.of_SetTabBkgndStyle("SOLID")
		theme.of_SetTabStyle(theme.TBS_OFFICE2013)
		theme.of_SetPanelBorderStyle("SOLID")
		theme.of_SetItemBorderStyle("SOLID")
		in_skinmenu.of_CheckRadios( 105, 109, 108, false, true)
end choose
end event

event onitemchecked;call super::onitemchecked;choose case item.#Type
	case item.ITT_CHECKBOX
		n_cst_ribbonbar_checkbox checkbox
		checkbox = item
//		MessageBoxEx(checkbox.#ParentPanel.#Caption,checkbox.#Checked)
	case item.ITT_RADIOBOX
		n_cst_ribbonbar_radiobox radiobox
		radiobox = item
//		MessageBoxEx(radiobox.#ParentPanel.#Caption,radiobox.#Checked)
end choose
end event

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_TRANSPARENT
		color = ToARGB(255,Win32.GetPBColor(parent.backcolor))
end choose
end event

event onthemechanged;call super::onthemechanged;in_skinMenu.theme.of_SetTheme(theme)
end event

type gb_3 from groupbox within w_test_ribbonbar
integer x = 9
integer y = 668
integer width = 1029
integer height = 332
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ribbon风格"
end type

type gb_4 from groupbox within w_test_ribbonbar
integer x = 2286
integer y = 692
integer width = 1161
integer height = 324
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "按钮边框风格"
end type

type gb_1 from groupbox within w_test_ribbonbar
integer x = 1111
integer y = 692
integer width = 1161
integer height = 320
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Panel边框风格"
end type

type gb_2 from groupbox within w_test_ribbonbar
integer x = 1120
integer y = 1036
integer width = 905
integer height = 200
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "标题文本对齐方式"
end type

type gb_5 from groupbox within w_test_ribbonbar
integer x = 2103
integer y = 1024
integer width = 1143
integer height = 200
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "图标对齐方式"
end type

type gb_6 from groupbox within w_test_ribbonbar
integer x = 23
integer y = 1036
integer width = 1015
integer height = 244
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ribbon边框风格"
end type

