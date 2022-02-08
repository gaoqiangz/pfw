$PBExportHeader$w_test_progressbar.srw
forward
global type w_test_progressbar from window
end type
type cb_2 from commandbutton within w_test_progressbar
end type
type cb_1 from s_cst_button within w_test_progressbar
end type
type vpb_3 from s_cst_vprogressbar within w_test_progressbar
end type
type vpb_2 from s_cst_vprogressbar within w_test_progressbar
end type
type vpb_1 from s_cst_vprogressbar within w_test_progressbar
end type
type cb_14 from commandbutton within w_test_progressbar
end type
type cb_13 from commandbutton within w_test_progressbar
end type
type hpb_5 from s_cst_hprogressbar within w_test_progressbar
end type
type hpb_4 from s_cst_hprogressbar within w_test_progressbar
end type
type hpb_3 from s_cst_hprogressbar within w_test_progressbar
end type
type hpb_2 from hprogressbar within w_test_progressbar
end type
type cb_12 from commandbutton within w_test_progressbar
end type
type hpb_1 from hprogressbar within w_test_progressbar
end type
end forward

shared variables

end variables

global type w_test_progressbar from window
integer width = 2144
integer height = 1212
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
vpb_3 vpb_3
vpb_2 vpb_2
vpb_1 vpb_1
cb_14 cb_14
cb_13 cb_13
hpb_5 hpb_5
hpb_4 hpb_4
hpb_3 hpb_3
hpb_2 hpb_2
cb_12 cb_12
hpb_1 hpb_1
end type
global w_test_progressbar w_test_progressbar

type variables

end variables

on w_test_progressbar.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.vpb_3=create vpb_3
this.vpb_2=create vpb_2
this.vpb_1=create vpb_1
this.cb_14=create cb_14
this.cb_13=create cb_13
this.hpb_5=create hpb_5
this.hpb_4=create hpb_4
this.hpb_3=create hpb_3
this.hpb_2=create hpb_2
this.cb_12=create cb_12
this.hpb_1=create hpb_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.vpb_3,&
this.vpb_2,&
this.vpb_1,&
this.cb_14,&
this.cb_13,&
this.hpb_5,&
this.hpb_4,&
this.hpb_3,&
this.hpb_2,&
this.cb_12,&
this.hpb_1}
end on

on w_test_progressbar.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.vpb_3)
destroy(this.vpb_2)
destroy(this.vpb_1)
destroy(this.cb_14)
destroy(this.cb_13)
destroy(this.hpb_5)
destroy(this.hpb_4)
destroy(this.hpb_3)
destroy(this.hpb_2)
destroy(this.cb_12)
destroy(this.hpb_1)
end on

type cb_2 from commandbutton within w_test_progressbar
integer x = 713
integer y = 888
integer width = 457
integer height = 132
integer taborder = 70
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;
//messagebox("",String(hpb_3.Position / Double(hpb_3.MaxPosition - hpb_3.MinPosition + 13) * 100))
//messagebox("",Sprintf("{1}",hpb_3.Position / Double(hpb_3.MaxPosition - hpb_3.MinPosition + 13) * 100))

real db

db = 17.699115999999
messagebox("",db)
end event

type cb_1 from s_cst_button within w_test_progressbar
integer x = 1303
integer y = 900
integer taborder = 70
end type

type vpb_3 from s_cst_vprogressbar within w_test_progressbar
integer x = 1728
integer y = 36
unsignedinteger position = 0
boolean smoothscroll = true
boolean #animation = true
boolean #marquee = true
end type

type vpb_2 from s_cst_vprogressbar within w_test_progressbar
integer x = 1563
integer y = 32
unsignedinteger position = 0
boolean smoothscroll = true
boolean #animation = true
end type

type vpb_1 from s_cst_vprogressbar within w_test_progressbar
integer x = 1440
integer y = 32
unsignedinteger position = 0
boolean smoothscroll = true
boolean #transparent = true
boolean #animation = true
end type

event constructor;call super::constructor;theme.of_SetBkgndStyle(Enums.VISTAORIGINAL)
theme.of_SetBorderStyle(Enums.BS_ROUND)
theme.of_SetBkgndColorStyle(theme.PURPLE)
end event

event ongetcolor;call super::ongetcolor;if colorFlag = theme.CLR_FKGND then
	color = ARGB(255,0,200,40)
end if
end event

type cb_14 from commandbutton within w_test_progressbar
integer x = 567
integer y = 680
integer width = 457
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Dec"
end type

event clicked;long nIndex,nCount

nCount = UpperBound(Control)
for nIndex = 1 to nCount
	choose case Control[nIndex].TypeOf()
		case HProgressBar!
			hprogressbar hpb
			hpb = Control[nIndex]
			hpb.Position -= 20
			if IsAncestor(Control[nIndex],"s_cst_hprogressbar") then
				s_cst_hprogressbar shpb
				shpb = Control[nIndex]
				shpb.of_SetText(Sprintf("正在干点什么({1}%)",hpb.Position / (hpb.MaxPosition - hpb.MinPosition) * 100))
			end if
		case VProgressBar!
			vprogressbar vpb
			vpb = Control[nIndex]
			vpb.Position -= 20
		case else
			continue
	end choose
next
end event

type cb_13 from commandbutton within w_test_progressbar
integer x = 64
integer y = 852
integer width = 457
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Marquee"
end type

event clicked;hpb_5.of_SetMarquee(Not hpb_5.#Marquee)
vpb_3.of_SetMarquee(Not vpb_3.#Marquee)
end event

type hpb_5 from s_cst_hprogressbar within w_test_progressbar
integer x = 745
integer y = 236
integer height = 76
unsignedinteger position = 0
boolean smoothscroll = true
boolean #transparent = true
boolean #animation = true
end type

event constructor;call super::constructor;//theme.of_SetBkgndStyle(Enums.VISTAORIGINAL)
//theme.of_SetBorderStyle(Enums.BS_ROUND)
theme.of_SetBkgndColorStyle(theme.PURPLE)
of_SetMarquee(true)
end event

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_FKGND
		//color = ARGB(255,0,200,40)
	case theme.CLR_TEXT
		//color = ARGB(255,255,255,255)
end choose
end event

type hpb_4 from s_cst_hprogressbar within w_test_progressbar
integer x = 82
integer y = 372
integer height = 76
unsignedinteger position = 0
boolean smoothscroll = true
boolean #transparent = true
boolean #animation = true
end type

event constructor;call super::constructor;//theme.of_SetBkgndStyle(Enums.VISTAORIGINAL)
//theme.of_SetBorderStyle(Enums.BS_ROUND)
theme.of_SetBkgndColorStyle(theme.PURPLE)
end event

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_FKGND
		//color = ARGB(255,0,200,40)
	case theme.CLR_TEXT
		//color = ARGB(255,255,255,255)
end choose
end event

type hpb_3 from s_cst_hprogressbar within w_test_progressbar
integer x = 78
integer y = 220
integer height = 76
unsignedinteger position = 0
boolean smoothscroll = true
boolean #transparent = true
boolean #animation = true
end type

event constructor;call super::constructor;theme.of_SetBkgndStyle(Enums.VISTAGLASS)
theme.of_SetBorderStyle(Enums.BS_ROUND)
//theme.of_SetBkgndColorStyle(theme.BLUE)
end event

event ongetcolor;call super::ongetcolor;choose case colorFlag
	case theme.CLR_FKGND
		color = ARGB(255,0,200,40)
	case theme.CLR_TEXT
		color = ARGB(255,255,255,255)
end choose
end event

type hpb_2 from hprogressbar within w_test_progressbar
integer x = 741
integer y = 56
integer width = 622
integer height = 68
unsignedinteger maxposition = 100
integer setstep = 10
boolean smoothscroll = true
end type

type cb_12 from commandbutton within w_test_progressbar
integer x = 59
integer y = 664
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Inc"
end type

event clicked;long nIndex,nCount

nCount = UpperBound(Control)
for nIndex = 1 to nCount
	choose case Control[nIndex].TypeOf()
		case HProgressBar!
			hprogressbar hpb
			hpb = Control[nIndex]
			hpb.Position += 20
			if IsAncestor(Control[nIndex],"s_cst_hprogressbar") then
				s_cst_hprogressbar shpb
				shpb = Control[nIndex]
				shpb.of_SetText(Sprintf("正在干点什么({1}%)",hpb.Position / (hpb.MaxPosition - hpb.MinPosition) * 100))
			end if
		case VProgressBar!
			vprogressbar vpb
			vpb = Control[nIndex]
			vpb.Position += 20
		case else
			continue
	end choose
next
end event

type hpb_1 from hprogressbar within w_test_progressbar
integer x = 78
integer y = 52
integer width = 622
integer height = 68
unsignedinteger maxposition = 100
integer setstep = 10
boolean smoothscroll = true
end type

