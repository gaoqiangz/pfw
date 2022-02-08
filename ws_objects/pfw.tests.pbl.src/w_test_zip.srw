$PBExportHeader$w_test_zip.srw
forward
global type w_test_zip from window
end type
type cb_7 from commandbutton within w_test_zip
end type
type cb_6 from commandbutton within w_test_zip
end type
type cb_5 from commandbutton within w_test_zip
end type
type cb_4 from commandbutton within w_test_zip
end type
type mle_result from multilineedit within w_test_zip
end type
type cb_2 from commandbutton within w_test_zip
end type
type cb_1 from commandbutton within w_test_zip
end type
end forward

global type w_test_zip from window
integer width = 3835
integer height = 2640
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
mle_result mle_result
cb_2 cb_2
cb_1 cb_1
end type
global w_test_zip w_test_zip

on w_test_zip.create
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.mle_result=create mle_result
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.mle_result,&
this.cb_2,&
this.cb_1}
end on

on w_test_zip.destroy
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.mle_result)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cb_7 from commandbutton within w_test_zip
integer x = 2789
integer y = 348
integer width = 457
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "UnzipMem"
end type

event clicked;int nIndex,nCount
n_zip zip
n_unzip unzip


zip = Create n_zip
unzip = Create n_unzip

zip.CreateMemZip()
zip.AddFolder("pfw测试")
zip.AddFile("pfw测试/测试.txt",Blob("Power         哈哈                                Framework",EncodingANSI!))

unzip.OpenZip(zip.CloseMemZip())

nCount = unzip.GetItemCount()
for nIndex = 1 to nCount
	mle_result.Text += unzip.GetItemName(nIndex) + "~r~n"
next

unzip.UnzipFile("pfw测试/测试.txt","d:\测试.txt")

unzip.CloseZip()

Destroy unzip
Destroy zip
end event

type cb_6 from commandbutton within w_test_zip
integer x = 2107
integer y = 332
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Unzip"
end type

event clicked;int nIndex,nCount
n_unzip unzip

unzip = Create n_unzip

unzip.OpenZip("d:\pfw测试.zip","123")

nCount = unzip.GetItemCount()
for nIndex = 1 to nCount
	mle_result.Text += unzip.GetItemName(nIndex) + "~r~n"
next

unzip.UnzipFile("分机程序.rar","d:\分机程序_unzip.rar")
//messagebox("",unzip.hasFolder("LoginWnd"))
//messagebox("",unzip.UnzipFolder("LoginWnd","d:\LoginWnd"))

unzip.CloseZip()

Destroy unzip
end event

type cb_5 from commandbutton within w_test_zip
integer x = 2743
integer y = 168
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "MemZip"
end type

event clicked;blob blbData
n_zip zip

zip = Create n_zip

zip.CreateMemZip()
zip.AddFolder("pfw测试")
zip.AddFile("pfw测试/测试.txt",Blob("Power         哈哈                                Framework",EncodingANSI!))
blbData = zip.CloseMemZip()
messagebox("",len(blbData))
mle_result.Text = Base64Encode(blbData)

Destroy zip

end event

type cb_4 from commandbutton within w_test_zip
integer x = 2117
integer y = 164
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ZipFile"
end type

event clicked;n_zip zip

zip = Create n_zip

zip.CreateZip("d:\pfw测试.zip")
zip.AddFolder("pfw测试")
zip.AddFile("pfw测试/测试.txt",Blob("Power         哈哈                                Framework",EncodingANSI!))
//zip.AddFile("PowerBuilder12.5.2_build5006.zip","E:\IDEs\PowerBuilder12.5.2\PowerBuilder12.5.2_build5006.zip")
zip.CloseZip()

Destroy zip
end event

type mle_result from multilineedit within w_test_zip
integer x = 114
integer y = 520
integer width = 3474
integer height = 1820
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_test_zip
integer x = 814
integer y = 200
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Unzip"
end type

event clicked;mle_result.Text = ZipUncompress(mle_result.Text,Enums.ZIP_FORMAT_PFW)
end event

type cb_1 from commandbutton within w_test_zip
integer x = 151
integer y = 196
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Zip"
end type

event clicked;mle_result.Text = ZipCompress(mle_result.Text,Enums.ZIP_FORMAT_PFW,8)
end event

