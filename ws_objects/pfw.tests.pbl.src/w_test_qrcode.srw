$PBExportHeader$w_test_qrcode.srw
forward
global type w_test_qrcode from window
end type
type cb_4 from commandbutton within w_test_qrcode
end type
type cb_3 from commandbutton within w_test_qrcode
end type
type ddlb_ecc from dropdownlistbox within w_test_qrcode
end type
type st_10 from statictext within w_test_qrcode
end type
type st_9 from statictext within w_test_qrcode
end type
type em_ver from editmask within w_test_qrcode
end type
type st_8 from statictext within w_test_qrcode
end type
type cb_1 from commandbutton within w_test_qrcode
end type
type st_info from statictext within w_test_qrcode
end type
type st_7 from statictext within w_test_qrcode
end type
type dw_1 from datawindow within w_test_qrcode
end type
type st_6 from statictext within w_test_qrcode
end type
type em_border_margin from editmask within w_test_qrcode
end type
type st_5 from statictext within w_test_qrcode
end type
type cbx_logo_border from checkbox within w_test_qrcode
end type
type cbx_logo_bkgnd from checkbox within w_test_qrcode
end type
type sle_logo from singlelineedit within w_test_qrcode
end type
type st_4 from statictext within w_test_qrcode
end type
type em_size from editmask within w_test_qrcode
end type
type st_3 from statictext within w_test_qrcode
end type
type rb_unit_dip from radiobutton within w_test_qrcode
end type
type rb_unit_pixel from radiobutton within w_test_qrcode
end type
type st_2 from statictext within w_test_qrcode
end type
type st_1 from statictext within w_test_qrcode
end type
type sle_text from singlelineedit within w_test_qrcode
end type
type uo_canvas from u_cst_canvas within w_test_qrcode
end type
type cb_2 from commandbutton within w_test_qrcode
end type
end forward

global type w_test_qrcode from window
integer width = 4430
integer height = 2900
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_3 cb_3
ddlb_ecc ddlb_ecc
st_10 st_10
st_9 st_9
em_ver em_ver
st_8 st_8
cb_1 cb_1
st_info st_info
st_7 st_7
dw_1 dw_1
st_6 st_6
em_border_margin em_border_margin
st_5 st_5
cbx_logo_border cbx_logo_border
cbx_logo_bkgnd cbx_logo_bkgnd
sle_logo sle_logo
st_4 st_4
em_size em_size
st_3 st_3
rb_unit_dip rb_unit_dip
rb_unit_pixel rb_unit_pixel
st_2 st_2
st_1 st_1
sle_text sle_text
uo_canvas uo_canvas
cb_2 cb_2
end type
global w_test_qrcode w_test_qrcode

type variables
n_qrcode _qrcode
end variables

forward prototypes
private subroutine wf_regenerate ()
end prototypes

private subroutine wf_regenerate ();_qrcode.Reset()

_qrcode.SetVer(Long(em_ver.Text))
choose case ddlb_ecc.Text
	case "L"
		_qrcode.SetEcc(Enums.QRCODE_ECC_LOW)
	case "M"
		_qrcode.SetEcc(Enums.QRCODE_ECC_MEDIUM)
	case "Q"
		_qrcode.SetEcc(Enums.QRCODE_ECC_QUARTILE)
	case "H"
		_qrcode.SetEcc(Enums.QRCODE_ECC_HIGH)
	case else
		_qrcode.SetEcc(Enums.QRCODE_ECC_AUTO)
end choose

if rb_unit_pixel.Checked then
	_qrcode.SetUnit(Enums.QRCODE_UNIT_PIXEL)
elseif rb_unit_dip.Checked then
	_qrcode.SetUnit(Enums.QRCODE_UNIT_DIP)
end if
_qrcode.SetSize(Long(em_size.Text))

_qrcode.SetBorderMargin(Long(em_border_margin.Text))

_qrcode.SetLogo(sle_logo.Text)
/*
	Logo Bkgnd默认颜色为白色
	Logo Border默认颜色为Logo图像的平均色
*/
_qrcode.SetLogoBkgnd(cbx_logo_bkgnd.Checked)
_qrcode.SetLogoBorder(cbx_logo_border.Checked)

_qrcode.Encode(sle_text.Text)

st_info.Text = Sprintf("Version:{1} Ecc:",_qrcode.GetVer(true))
choose case _qrcode.GetEcc(true)
	case Enums.QRCODE_ECC_LOW
		st_info.Text += "L"
	case Enums.QRCODE_ECC_MEDIUM
		st_info.Text += "M"
	case Enums.QRCODE_ECC_QUARTILE
		st_info.Text += "Q"
	case Enums.QRCODE_ECC_HIGH
		st_info.Text += "H"
end choose
uo_canvas.SetRedraw(true)
end subroutine

on w_test_qrcode.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.ddlb_ecc=create ddlb_ecc
this.st_10=create st_10
this.st_9=create st_9
this.em_ver=create em_ver
this.st_8=create st_8
this.cb_1=create cb_1
this.st_info=create st_info
this.st_7=create st_7
this.dw_1=create dw_1
this.st_6=create st_6
this.em_border_margin=create em_border_margin
this.st_5=create st_5
this.cbx_logo_border=create cbx_logo_border
this.cbx_logo_bkgnd=create cbx_logo_bkgnd
this.sle_logo=create sle_logo
this.st_4=create st_4
this.em_size=create em_size
this.st_3=create st_3
this.rb_unit_dip=create rb_unit_dip
this.rb_unit_pixel=create rb_unit_pixel
this.st_2=create st_2
this.st_1=create st_1
this.sle_text=create sle_text
this.uo_canvas=create uo_canvas
this.cb_2=create cb_2
this.Control[]={this.cb_4,&
this.cb_3,&
this.ddlb_ecc,&
this.st_10,&
this.st_9,&
this.em_ver,&
this.st_8,&
this.cb_1,&
this.st_info,&
this.st_7,&
this.dw_1,&
this.st_6,&
this.em_border_margin,&
this.st_5,&
this.cbx_logo_border,&
this.cbx_logo_bkgnd,&
this.sle_logo,&
this.st_4,&
this.em_size,&
this.st_3,&
this.rb_unit_dip,&
this.rb_unit_pixel,&
this.st_2,&
this.st_1,&
this.sle_text,&
this.uo_canvas,&
this.cb_2}
end on

on w_test_qrcode.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.ddlb_ecc)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.em_ver)
destroy(this.st_8)
destroy(this.cb_1)
destroy(this.st_info)
destroy(this.st_7)
destroy(this.dw_1)
destroy(this.st_6)
destroy(this.em_border_margin)
destroy(this.st_5)
destroy(this.cbx_logo_border)
destroy(this.cbx_logo_bkgnd)
destroy(this.sle_logo)
destroy(this.st_4)
destroy(this.em_size)
destroy(this.st_3)
destroy(this.rb_unit_dip)
destroy(this.rb_unit_pixel)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_text)
destroy(this.uo_canvas)
destroy(this.cb_2)
end on

event open;_qrcode = Create n_qrcode
end event

event close;Destroy _qrcode
end event

type cb_4 from commandbutton within w_test_qrcode
integer x = 2811
integer y = 1556
integer width = 539
integer height = 200
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "复制到粘贴板"
end type

event clicked;_qrcode.SaveClipboard()
end event

type cb_3 from commandbutton within w_test_qrcode
integer x = 2245
integer y = 1556
integer width = 539
integer height = 200
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "打印"
end type

event clicked;dw_1.Print()
end event

type ddlb_ecc from dropdownlistbox within w_test_qrcode
integer x = 1481
integer y = 1216
integer width = 329
integer height = 476
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"AUTO","L","M","Q","H"}
borderstyle borderstyle = stylelowered!
end type

event constructor;SelectItem(1)
end event

type st_10 from statictext within w_test_qrcode
integer x = 1120
integer y = 1236
integer width = 334
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "纠错级别"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_9 from statictext within w_test_qrcode
integer x = 814
integer y = 1232
integer width = 288
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "(0自动)"
boolean focusrectangle = false
end type

type em_ver from editmask within w_test_qrcode
integer x = 421
integer y = 1216
integer width = 366
integer height = 120
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
string mask = "####0"
string minmax = "0~~40"
end type

type st_8 from statictext within w_test_qrcode
integer x = 55
integer y = 1236
integer width = 334
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "版本"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_test_qrcode
integer x = 1609
integer y = 1556
integer width = 539
integer height = 200
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "保存到文件"
end type

event clicked;string sCurrDir,sPath,sFileName

wf_Regenerate()

sCurrDir = GetCurrentDirectory()

try
	if GetFileSaveName("导出文件",ref sPath,ref sFileName, "jpg,png,gif,bmp,svg", "JPEG Files (*.jpg),*.jpg,PNG Files (*.png),*.png,GIF Files (*.gif),*.gif,BMP Files (*.bmp),*.bmp,SVG Files (*.svg),*.svg") = 1 then
		_qrcode.SaveFile(sPath)
	end if
finally
	ChangeDirectory(sCurrDir)
end try
end event

type st_info from statictext within w_test_qrcode
integer x = 2825
integer y = 944
integer width = 1554
integer height = 92
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

type st_7 from statictext within w_test_qrcode
integer x = 50
integer y = 836
integer width = 1303
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "支持：Mode 2,Version 1-40,Ecc 4 levels"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_test_qrcode
integer x = 64
integer y = 1816
integer width = 4311
integer height = 988
integer taborder = 30
string title = "none"
string dataobject = "dw_qrcode"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_test_qrcode
integer x = 2505
integer y = 1084
integer width = 343
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "(modules)"
boolean focusrectangle = false
end type

type em_border_margin from editmask within w_test_qrcode
integer x = 2217
integer y = 1064
integer width = 261
integer height = 120
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
string mask = "####0"
string minmax = "1~~20"
end type

type st_5 from statictext within w_test_qrcode
integer x = 1883
integer y = 1084
integer width = 297
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "边框间距"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_logo_border from checkbox within w_test_qrcode
integer x = 3081
integer y = 1428
integer width = 283
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "边框"
boolean checked = true
end type

type cbx_logo_bkgnd from checkbox within w_test_qrcode
integer x = 2779
integer y = 1428
integer width = 283
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "背景"
boolean checked = true
end type

type sle_logo from singlelineedit within w_test_qrcode
integer x = 407
integer y = 1408
integer width = 2341
integer height = 120
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "pbr://res/zip/images[logo.png]"
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_test_qrcode
integer x = 55
integer y = 1428
integer width = 334
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Logo"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_size from editmask within w_test_qrcode
integer x = 1344
integer y = 1064
integer width = 457
integer height = 120
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "200"
borderstyle borderstyle = stylelowered!
string mask = "####0"
end type

type st_3 from statictext within w_test_qrcode
integer x = 992
integer y = 1076
integer width = 334
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "大小"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_unit_dip from radiobutton within w_test_qrcode
integer x = 699
integer y = 1076
integer width = 219
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "DIP"
end type

type rb_unit_pixel from radiobutton within w_test_qrcode
integer x = 407
integer y = 1076
integer width = 247
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pixel"
boolean checked = true
end type

type st_2 from statictext within w_test_qrcode
integer x = 55
integer y = 1080
integer width = 334
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "单位"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_test_qrcode
integer x = 55
integer y = 956
integer width = 334
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "字符串值"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_text from singlelineedit within w_test_qrcode
integer x = 407
integer y = 936
integer width = 2341
integer height = 120
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "PowerFramework"
borderstyle borderstyle = stylelowered!
end type

type uo_canvas from u_cst_canvas within w_test_qrcode
event type long onpaint ( unsignedlong hdc )
integer x = 41
integer y = 20
integer width = 4352
integer height = 808
integer taborder = 30
end type

event type long onpaint(unsignedlong hdc);RECTF rcClient

if Not IsValidObject(_qrcode) then return 1

Win32.GetClientRect(#Handle,ref rcClient)

Painter.FillRect( hdc, 0, 0, rcClient.right, rcClient.bottom, ARGB(255,200,200,200), ARGB(255,200,200,200), Enums.HORZ, false, false, 0)

if _qrcode.GetUnit() = Enums.QRCODE_UNIT_PIXEL then
	_qrcode.Draw(hdc,(D2PX(rcClient.right) - _qrcode.GetSize()) / 2,(D2PY(rcClient.bottom) - _qrcode.GetSize()) / 2)
else
	_qrcode.Draw(hdc,(rcClient.right - _qrcode.GetSize()) / 2,(rcClient.bottom - _qrcode.GetSize()) / 2)
end if

return 1
end event

on uo_canvas.destroy
call u_cst_canvas::destroy
end on

type cb_2 from commandbutton within w_test_qrcode
integer x = 974
integer y = 1556
integer width = 539
integer height = 200
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "生成"
end type

event clicked;wf_Regenerate()
end event

