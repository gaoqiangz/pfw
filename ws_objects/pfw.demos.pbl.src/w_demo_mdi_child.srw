$PBExportHeader$w_demo_mdi_child.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type w_demo_mdi_child from s_cst_window
end type
type cbx_14 from s_cst_checkbox within w_demo_mdi_child
end type
type cbx_10 from s_cst_checkbox within w_demo_mdi_child
end type
type cbx_8 from s_cst_checkbox within w_demo_mdi_child
end type
type cbx_7 from s_cst_checkbox within w_demo_mdi_child
end type
type sle_3 from s_cst_singlelineedit within w_demo_mdi_child
end type
type cb_2 from s_cst_button within w_demo_mdi_child
end type
type cb_1 from s_cst_button within w_demo_mdi_child
end type
type st_2 from statictext within w_demo_mdi_child
end type
type sle_2 from s_cst_singlelineedit within w_demo_mdi_child
end type
type sle_1 from s_cst_singlelineedit within w_demo_mdi_child
end type
type cbx_6 from s_cst_checkbox within w_demo_mdi_child
end type
type cbx_5 from s_cst_checkbox within w_demo_mdi_child
end type
type cbx_4 from s_cst_checkbox within w_demo_mdi_child
end type
type cbx_3 from s_cst_checkbox within w_demo_mdi_child
end type
type cbx_2 from s_cst_checkbox within w_demo_mdi_child
end type
type cbx_1 from s_cst_checkbox within w_demo_mdi_child
end type
type sle_icon from s_cst_singlelineedit within w_demo_mdi_child
end type
type sle_title from s_cst_singlelineedit within w_demo_mdi_child
end type
type cb_7 from s_cst_button within w_demo_mdi_child
end type
type cb_6 from s_cst_button within w_demo_mdi_child
end type
end forward

global type w_demo_mdi_child from s_cst_window
integer width = 2336
integer height = 1092
string title = "PowerFramework MDI 子窗口"
string menuname = "m_mdi_sheet"
windowstate windowstate = maximized!
long backcolor = 16777215
string icon = "Window!"
boolean center = false
cbx_14 cbx_14
cbx_10 cbx_10
cbx_8 cbx_8
cbx_7 cbx_7
sle_3 sle_3
cb_2 cb_2
cb_1 cb_1
st_2 st_2
sle_2 sle_2
sle_1 sle_1
cbx_6 cbx_6
cbx_5 cbx_5
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
sle_icon sle_icon
sle_title sle_title
cb_7 cb_7
cb_6 cb_6
end type
global w_demo_mdi_child w_demo_mdi_child

type variables

end variables

on w_demo_mdi_child.create
int iCurrent
call super::create
if this.MenuName = "m_mdi_sheet" then this.MenuID = create m_mdi_sheet
this.cbx_14=create cbx_14
this.cbx_10=create cbx_10
this.cbx_8=create cbx_8
this.cbx_7=create cbx_7
this.sle_3=create sle_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.sle_2=create sle_2
this.sle_1=create sle_1
this.cbx_6=create cbx_6
this.cbx_5=create cbx_5
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.sle_icon=create sle_icon
this.sle_title=create sle_title
this.cb_7=create cb_7
this.cb_6=create cb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_14
this.Control[iCurrent+2]=this.cbx_10
this.Control[iCurrent+3]=this.cbx_8
this.Control[iCurrent+4]=this.cbx_7
this.Control[iCurrent+5]=this.sle_3
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.sle_2
this.Control[iCurrent+10]=this.sle_1
this.Control[iCurrent+11]=this.cbx_6
this.Control[iCurrent+12]=this.cbx_5
this.Control[iCurrent+13]=this.cbx_4
this.Control[iCurrent+14]=this.cbx_3
this.Control[iCurrent+15]=this.cbx_2
this.Control[iCurrent+16]=this.cbx_1
this.Control[iCurrent+17]=this.sle_icon
this.Control[iCurrent+18]=this.sle_title
this.Control[iCurrent+19]=this.cb_7
this.Control[iCurrent+20]=this.cb_6
end on

on w_demo_mdi_child.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cbx_14)
destroy(this.cbx_10)
destroy(this.cbx_8)
destroy(this.cbx_7)
destroy(this.sle_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.cbx_6)
destroy(this.cbx_5)
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.sle_icon)
destroy(this.sle_title)
destroy(this.cb_7)
destroy(this.cb_6)
end on

event onpreopen;call super::onpreopen;#LockUpdate = true
theme.of_SetBkgndColorStyle(theme.SILVER)
theme.of_SetItemStyle(theme.ITS_WIN8)
theme.of_SetBkgndStyle(Enums.SOLID)
theme.of_SetItemBkgndStyle(Enums.SOLID)
theme.of_SetBorderStyle(Enums.BS_SOLID)
MenuBar.Font.of_SetSize(10)
//--- 添加窗口状态栏按钮 ---
StatusBar.of_AddIcon(Res.ICO_S_USER,left!)
StatusBar.of_AddLink("Powered by 金千枝（深圳）软件技术有限公司",left!)
//------------
#LockUpdate = false
wf_UpdatePoints()

m_mdi_frame lm_sheet
lm_sheet = MenuID
lm_sheet.of_SetParentWindow(this)
end event

event resize;call super::resize;/*
	***************** 注意!!!! *****************
	当子窗口在打开的时候宽度或高度比主窗口小(第一时间),并且子窗口的Center属性开启时子窗口的Resize事件会在先于窗口Open事件之前被触发(PB原生MDI子窗口也有这样的问题)
	这个触发时间甚至早于窗口上控件的Constructor事件,这里要特别留意!!!
*/
end event

event ongetitemcolor;call super::ongetitemcolor;if objectType = WOT_TITLEBAR then
	choose case colorFlag
		case theme.CLR_BKGND
			choose case index
				case CaptionBar.IDX_CLOSE
					if BitTest(state,Enums.STATE_PRESSED) then
						color = ARGB(255,243,116,103)
					elseif BitTest(state,Enums.STATE_HOVER) then
						color = ARGB(192,243,116,103)
					else
						color = ARGB(128,243,116,103)
					end if
				case CaptionBar.IDX_MAX, CaptionBar.IDX_MINI
					if BitTest(state,Enums.STATE_PRESSED) then
						color = ARGB(255,159,199,255)
					elseif BitTest(state,Enums.STATE_HOVER) then
						color = ARGB(128,159,199,255)
					end if
			end choose
	end choose
elseif objectType = WOT_MENUBAR then
	if index = 1 then
		if colorFlag = theme.CLR_BKGND and BitTest(state,Enums.STATE_HOVER) then
			color = ARGB(255,243,116,103)
		end if
	end if
end if
end event

type cbx_14 from s_cst_checkbox within w_demo_mdi_child
integer x = 1239
integer y = 716
integer width = 283
integer height = 80
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 16777215
string text = "闪烁"
end type

event clicked;if checked then
	MenuBar.of_Flash(long(sle_1.text),-1)
else
	MenuBar.of_Flash(long(sle_1.text),0)
end if
end event

type cbx_10 from s_cst_checkbox within w_demo_mdi_child
integer x = 1243
integer y = 632
integer width = 283
integer height = 80
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 16777215
string text = "高亮"
end type

event clicked;MenuBar.of_HighLight(long(sle_1.text),checked)
end event

type cbx_8 from s_cst_checkbox within w_demo_mdi_child
integer x = 1243
integer y = 532
integer width = 457
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 16777215
string text = "可见"
boolean checked = true
end type

event clicked;MenuBar.of_Visible(long(sle_1.text),checked)
end event

type cbx_7 from s_cst_checkbox within w_demo_mdi_child
integer x = 1243
integer y = 424
integer width = 457
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 16777215
string text = "可用"
boolean checked = true
end type

event clicked;MenuBar.of_Enable(long(sle_1.text),checked)
end event

type sle_3 from s_cst_singlelineedit within w_demo_mdi_child
integer x = 1234
integer y = 300
integer width = 489
integer height = 112
integer taborder = 60
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "save!"
end type

type cb_2 from s_cst_button within w_demo_mdi_child
integer x = 1751
integer y = 288
integer width = 457
integer height = 132
integer taborder = 50
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "设置图标"
end type

event clicked;MenuBar.of_SetImage(Long(sle_1.text),sle_3.text)
end event

type cb_1 from s_cst_button within w_demo_mdi_child
integer x = 1746
integer y = 148
integer width = 457
integer height = 132
integer taborder = 50
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "设置文本"
end type

event clicked;MenuBar.of_SetText(Long(sle_1.text),sle_2.text)
end event

type st_2 from statictext within w_demo_mdi_child
integer x = 1221
integer y = 56
integer width = 210
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "index:"
boolean focusrectangle = false
end type

type sle_2 from s_cst_singlelineedit within w_demo_mdi_child
integer x = 1230
integer y = 160
integer width = 489
integer height = 112
integer taborder = 50
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

type sle_1 from s_cst_singlelineedit within w_demo_mdi_child
integer x = 1445
integer y = 52
integer width = 279
integer height = 84
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "1"
end type

type cbx_6 from s_cst_checkbox within w_demo_mdi_child
integer x = 768
integer y = 628
integer width = 471
integer height = 92
fontcharset fontcharset = ansi!
long backcolor = 16777215
string text = "关闭按钮"
boolean checked = true
end type

event clicked;captionbar.of_enable(captionbar.idx_close,Not captionbar.of_isenabled(captionbar.idx_close))
Checked = captionbar.of_isenabled(captionbar.idx_close)
end event

type cbx_5 from s_cst_checkbox within w_demo_mdi_child
integer x = 768
integer y = 504
integer width = 471
integer height = 92
fontcharset fontcharset = ansi!
long backcolor = 16777215
string text = "最小化按钮"
boolean checked = true
end type

event clicked;captionbar.of_enable(captionbar.idx_mini,Not captionbar.of_isenabled(captionbar.idx_mini))
Checked = captionbar.of_isenabled(captionbar.idx_mini)
end event

type cbx_4 from s_cst_checkbox within w_demo_mdi_child
integer x = 768
integer y = 380
integer width = 471
integer height = 92
fontcharset fontcharset = ansi!
long backcolor = 16777215
string text = "最大化按钮"
boolean checked = true
end type

event clicked;captionbar.of_enable(captionbar.idx_max,Not captionbar.of_isenabled(captionbar.idx_max))
Checked = captionbar.of_isenabled(captionbar.idx_max)
end event

type cbx_3 from s_cst_checkbox within w_demo_mdi_child
integer x = 50
integer y = 628
integer width = 608
integer height = 92
fontcharset fontcharset = ansi!
long backcolor = 16777215
string text = "显示最小化按钮"
boolean checked = true
end type

event clicked;minbox = Not minbox
Checked = minbox
end event

type cbx_2 from s_cst_checkbox within w_demo_mdi_child
integer x = 50
integer y = 504
integer width = 462
integer height = 92
fontcharset fontcharset = ansi!
long backcolor = 16777215
string text = "显示状态栏"
end type

event clicked;parent.theme.of_SetStatusBar(Not parent.theme.#StatusBar)
Checked = parent.theme.#StatusBar
end event

type cbx_1 from s_cst_checkbox within w_demo_mdi_child
integer x = 50
integer y = 380
integer width = 462
integer height = 92
fontcharset fontcharset = ansi!
long backcolor = 16777215
string text = "显示菜单栏"
end type

event clicked;parent.theme.of_SetMenuBar(Not parent.theme.#MenuBar)
Checked = parent.theme.#MenuBar
end event

type sle_icon from s_cst_singlelineedit within w_demo_mdi_child
integer x = 50
integer y = 228
integer height = 124
integer taborder = 50
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "window!"
end type

type sle_title from s_cst_singlelineedit within w_demo_mdi_child
integer x = 50
integer y = 48
integer height = 124
integer taborder = 70
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

type cb_7 from s_cst_button within w_demo_mdi_child
integer x = 535
integer y = 236
integer width = 503
integer taborder = 40
string text = "设置窗口图标"
end type

event clicked;call super::clicked;icon = sle_icon.text
end event

type cb_6 from s_cst_button within w_demo_mdi_child
integer x = 535
integer y = 56
integer width = 503
integer taborder = 40
string text = "设置窗口标题"
boolean #transparent = true
end type

event clicked;call super::clicked;title = sle_title.text
end event

