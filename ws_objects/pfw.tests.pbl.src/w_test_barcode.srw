$PBExportHeader$w_test_barcode.srw
forward
global type w_test_barcode from window
end type
type cb_4 from commandbutton within w_test_barcode
end type
type cb_3 from commandbutton within w_test_barcode
end type
type st_10 from statictext within w_test_barcode
end type
type ddlb_angle from dropdownlistbox within w_test_barcode
end type
type st_9 from statictext within w_test_barcode
end type
type st_8 from statictext within w_test_barcode
end type
type sle_disp from singlelineedit within w_test_barcode
end type
type st_7 from statictext within w_test_barcode
end type
type st_4 from statictext within w_test_barcode
end type
type cbx_showtext from checkbox within w_test_barcode
end type
type st_5 from statictext within w_test_barcode
end type
type em_border_margin from editmask within w_test_barcode
end type
type st_6 from statictext within w_test_barcode
end type
type cb_1 from commandbutton within w_test_barcode
end type
type dw_1 from datawindow within w_test_barcode
end type
type em_width from editmask within w_test_barcode
end type
type st_3 from statictext within w_test_barcode
end type
type rb_unit_dip from radiobutton within w_test_barcode
end type
type rb_unit_pixel from radiobutton within w_test_barcode
end type
type st_2 from statictext within w_test_barcode
end type
type st_1 from statictext within w_test_barcode
end type
type sle_text from singlelineedit within w_test_barcode
end type
type uo_canvas from u_cst_canvas within w_test_barcode
end type
type cb_2 from commandbutton within w_test_barcode
end type
type em_height from editmask within w_test_barcode
end type
type ddlb_type from dropdownlistbox within w_test_barcode
end type
end forward

global type w_test_barcode from window
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
st_10 st_10
ddlb_angle ddlb_angle
st_9 st_9
st_8 st_8
sle_disp sle_disp
st_7 st_7
st_4 st_4
cbx_showtext cbx_showtext
st_5 st_5
em_border_margin em_border_margin
st_6 st_6
cb_1 cb_1
dw_1 dw_1
em_width em_width
st_3 st_3
rb_unit_dip rb_unit_dip
rb_unit_pixel rb_unit_pixel
st_2 st_2
st_1 st_1
sle_text sle_text
uo_canvas uo_canvas
cb_2 cb_2
em_height em_height
ddlb_type ddlb_type
end type
global w_test_barcode w_test_barcode

type variables
n_barcode _barcode

/*
有些条码支持扩展参数(SetOption)
由于种类和参数繁多，具体请参考官方文档：
http://www.zint.org.uk/Manual.aspx?type=p&page=6
如：
指定QR Code ECC level:
SetOption(Enums.BARCODE_OPT_SECURE,3 /* Q,25% */)
*/
end variables

forward prototypes
private subroutine wf_regenerate ()
end prototypes

private subroutine wf_regenerate ();_barcode.Reset()

_barcode.SetType(ddlb_type.Text)
_barcode.ShowText(cbx_showtext.Checked)
//文字为空时默认为编码的内容
_barcode.SetText(sle_disp.Text)

if rb_unit_pixel.Checked then
	_barcode.SetUnit(Enums.QRCODE_UNIT_PIXEL)
elseif rb_unit_dip.Checked then
	_barcode.SetUnit(Enums.QRCODE_UNIT_DIP)
end if
_barcode.SetSize(Long(em_width.Text),Long(em_height.Text))

_barcode.SetBorderMargin(Long(em_border_margin.Text))

_barcode.Rotate(Long(ddlb_angle.Text))

_barcode.Encode(sle_text.Text)

uo_canvas.SetRedraw(true)
end subroutine

on w_test_barcode.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.st_10=create st_10
this.ddlb_angle=create ddlb_angle
this.st_9=create st_9
this.st_8=create st_8
this.sle_disp=create sle_disp
this.st_7=create st_7
this.st_4=create st_4
this.cbx_showtext=create cbx_showtext
this.st_5=create st_5
this.em_border_margin=create em_border_margin
this.st_6=create st_6
this.cb_1=create cb_1
this.dw_1=create dw_1
this.em_width=create em_width
this.st_3=create st_3
this.rb_unit_dip=create rb_unit_dip
this.rb_unit_pixel=create rb_unit_pixel
this.st_2=create st_2
this.st_1=create st_1
this.sle_text=create sle_text
this.uo_canvas=create uo_canvas
this.cb_2=create cb_2
this.em_height=create em_height
this.ddlb_type=create ddlb_type
this.Control[]={this.cb_4,&
this.cb_3,&
this.st_10,&
this.ddlb_angle,&
this.st_9,&
this.st_8,&
this.sle_disp,&
this.st_7,&
this.st_4,&
this.cbx_showtext,&
this.st_5,&
this.em_border_margin,&
this.st_6,&
this.cb_1,&
this.dw_1,&
this.em_width,&
this.st_3,&
this.rb_unit_dip,&
this.rb_unit_pixel,&
this.st_2,&
this.st_1,&
this.sle_text,&
this.uo_canvas,&
this.cb_2,&
this.em_height,&
this.ddlb_type}
end on

on w_test_barcode.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.st_10)
destroy(this.ddlb_angle)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.sle_disp)
destroy(this.st_7)
destroy(this.st_4)
destroy(this.cbx_showtext)
destroy(this.st_5)
destroy(this.em_border_margin)
destroy(this.st_6)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.em_width)
destroy(this.st_3)
destroy(this.rb_unit_dip)
destroy(this.rb_unit_pixel)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_text)
destroy(this.uo_canvas)
destroy(this.cb_2)
destroy(this.em_height)
destroy(this.ddlb_type)
end on

event open;_barcode = Create n_barcode

dw_1.InsertRow(0)
end event

event close;Destroy _barcode
end event

type cb_4 from commandbutton within w_test_barcode
integer x = 2999
integer y = 1576
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

event clicked;_barcode.SaveClipboard()
end event

type cb_3 from commandbutton within w_test_barcode
integer x = 2423
integer y = 1576
integer width = 539
integer height = 200
integer taborder = 60
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

type st_10 from statictext within w_test_barcode
integer x = 55
integer y = 1532
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
string text = "旋转"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_angle from dropdownlistbox within w_test_barcode
integer x = 407
integer y = 1524
integer width = 288
integer height = 484
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"0","90","180","270"}
borderstyle borderstyle = stylelowered!
end type

event constructor;SelectItem(1)
end event

type st_9 from statictext within w_test_barcode
integer x = 37
integer y = 844
integer width = 1550
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "注：不同的条码类型对数据的要求可能会有不同"
long bordercolor = 67108864
boolean focusrectangle = false
end type

type st_8 from statictext within w_test_barcode
integer x = 1499
integer y = 1132
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
string text = "显示文字"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_disp from singlelineedit within w_test_barcode
integer x = 1851
integer y = 1108
integer width = 896
integer height = 120
integer taborder = 60
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

type st_7 from statictext within w_test_barcode
integer x = 681
integer y = 1388
integer width = 78
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "X"
boolean focusrectangle = false
end type

type st_4 from statictext within w_test_barcode
integer x = 55
integer y = 1124
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
string text = "类型"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_showtext from checkbox within w_test_barcode
integer x = 1061
integer y = 1124
integer width = 389
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "显示文字"
boolean checked = true
end type

type st_5 from statictext within w_test_barcode
integer x = 1042
integer y = 1388
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

type em_border_margin from editmask within w_test_barcode
integer x = 1376
integer y = 1360
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

type st_6 from statictext within w_test_barcode
integer x = 1664
integer y = 1392
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

type cb_1 from commandbutton within w_test_barcode
integer x = 1787
integer y = 1576
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
		_barcode.SaveFile(sPath)
	end if
finally
	ChangeDirectory(sCurrDir)
end try
end event

type dw_1 from datawindow within w_test_barcode
integer x = 64
integer y = 1816
integer width = 4311
integer height = 988
integer taborder = 30
string title = "none"
string dataobject = "dw_barcode"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_width from editmask within w_test_barcode
integer x = 407
integer y = 1360
integer width = 265
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

type st_3 from statictext within w_test_barcode
integer x = 55
integer y = 1388
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
string text = "建议大小"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_unit_dip from radiobutton within w_test_barcode
integer x = 713
integer y = 1252
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

type rb_unit_pixel from radiobutton within w_test_barcode
integer x = 407
integer y = 1252
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

type st_2 from statictext within w_test_barcode
integer x = 55
integer y = 1252
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

type st_1 from statictext within w_test_barcode
integer x = 55
integer y = 972
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

type sle_text from singlelineedit within w_test_barcode
integer x = 407
integer y = 948
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
string text = "123456789"
borderstyle borderstyle = stylelowered!
end type

type uo_canvas from u_cst_canvas within w_test_barcode
event type long onpaint ( unsignedlong hdc )
integer x = 41
integer y = 20
integer width = 4352
integer height = 808
integer taborder = 30
end type

event type long onpaint(unsignedlong hdc);real fWidth,fHeight
RECTF rcClient

if Not IsValidObject(_barcode) then return 1

Win32.GetClientRect(#Handle,ref rcClient)

Painter.FillRect( hdc, 0, 0, rcClient.right, rcClient.bottom, ARGB(255,200,200,200), ARGB(255,200,200,200), Enums.HORZ, false, false, 0)

_barcode.GetSize(ref fWidth,ref fHeight,true /*获取编码后的真实大小*/)

if _barcode.GetUnit() = Enums.QRCODE_UNIT_PIXEL then
	_barcode.Draw(hdc,(D2PX(rcClient.right) - fWidth) / 2,(D2PY(rcClient.bottom) - fHeight) / 2)
else
	_barcode.Draw(hdc,(rcClient.right - fWidth) / 2,(rcClient.bottom - fHeight) / 2)
end if

return 1
end event

on uo_canvas.destroy
call u_cst_canvas::destroy
end on

type cb_2 from commandbutton within w_test_barcode
integer x = 1152
integer y = 1576
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

type em_height from editmask within w_test_barcode
integer x = 741
integer y = 1360
integer width = 265
integer height = 120
integer taborder = 40
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "100"
borderstyle borderstyle = stylelowered!
string mask = "####0"
end type

type ddlb_type from dropdownlistbox within w_test_barcode
integer x = 407
integer y = 1108
integer width = 599
integer height = 1748
integer taborder = 50
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"CODE11","C25MATRIX","C25INTER","C25IATA","C25LOGIC","C25IND","CODE39","EXCODE39","EANX","EANX_CHK","EAN128","CODABAR","CODE128","DPLEIT","DPIDENT","CODE16K","CODE49","CODE93","FLAT","RSS14","RSS_LTD","RSS_EXP","TELEPEN","UPCA","UPCA_CHK","UPCE","UPCE_CHK","POSTNET","MSI_PLESSEY","FIM","LOGMARS","PHARMA","PZN","PHARMA_TWO","PDF417","PDF417TRUNC","QRCODE","CODE128B","AUSPOST","AUSREPLY","AUSROUTE","AUSREDIRECT","ISBNX","RM4SCC","DATAMATRIX","MAXICODE","EAN14","CODABLOCKF","NVE18","JAPANPOST","KOREAPOST","RSS14STACK","RSS14STACK_OMNI","RSS_EXPSTACK","PLANET","MICROPDF417","ONECODE","PLESSEY","TELEPEN_NUM","ITF14","KIX","AZTEC","DAFT","MICROQR","HIBC_128","HIBC_39","HIBC_DM","HIBC_QR","HIBC_PDF","HIBC_MICPDF","HIBC_BLOCKF","HIBC_AZTEC","AZRUNE","CODE32","EANX_CC","EAN128_CC","RSS14_CC","RSS_LTD_CC","RSS_EXP_CC","UPCA_CC","UPCE_CC","RSS14STACK_CC","RSS14_OMNI_CC","RSS_EXPSTACK_CC","CHANNEL","CODEONE","GRIDMATRIX","DOTCODE","HANXIN"}
borderstyle borderstyle = stylelowered!
end type

event constructor;SelectItem(FindItem("CODE128",0))
end event

