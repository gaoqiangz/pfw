$PBExportHeader$w_test_filescanner.srw
forward
global type w_test_filescanner from window
end type
type cb_3 from commandbutton within w_test_filescanner
end type
type cb_2 from commandbutton within w_test_filescanner
end type
type mle_1 from multilineedit within w_test_filescanner
end type
type cb_1 from commandbutton within w_test_filescanner
end type
type filescanner from n_filescanner within w_test_filescanner
end type
end forward

global type w_test_filescanner from window
integer width = 5591
integer height = 1884
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
mle_1 mle_1
cb_1 cb_1
filescanner filescanner
end type
global w_test_filescanner w_test_filescanner

on w_test_filescanner.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.mle_1=create mle_1
this.cb_1=create cb_1
this.filescanner=create filescanner
this.Control[]={this.cb_3,&
this.cb_2,&
this.mle_1,&
this.cb_1}
end on

on w_test_filescanner.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.mle_1)
destroy(this.cb_1)
destroy(this.filescanner)
end on

type cb_3 from commandbutton within w_test_filescanner
integer x = 1093
integer y = 44
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ScanFolders"
end type

event clicked;long nIndex,nCount
string sFiles[]

mle_1.SetRedraw(false)
mle_1.text = ""

nCount = fileScanner.ScanFolders("*",ref sFiles,Enums.FILE_SCANNER_SORT_ASC,true)
for nIndex = 1 to nCount
	mle_1.text += sFiles[nIndex] + "~r~n"
next

mle_1.SetRedraw(true)
end event

type cb_2 from commandbutton within w_test_filescanner
integer x = 576
integer y = 44
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ScanFiles"
end type

event clicked;long nIndex,nCount
string sFiles[]

mle_1.SetRedraw(false)
mle_1.text = ""

nCount = fileScanner.ScanFiles("*",ref sFiles,true)
for nIndex = 1 to nCount
	mle_1.text += sFiles[nIndex] + "~r~n"
next

mle_1.SetRedraw(true)
end event

type mle_1 from multilineedit within w_test_filescanner
integer x = 55
integer y = 216
integer width = 5458
integer height = 1520
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier New"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_test_filescanner
integer x = 64
integer y = 44
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Traverse"
end type

event clicked;mle_1.SetRedraw(false)
mle_1.text = ""
fileScanner.Traverse("*",Enums.FILE_SCANNER_SORT_ASC,true)
mle_1.SetRedraw(true)
end event

type filescanner from n_filescanner within w_test_filescanner descriptor "pb_nvo" = "true" 
end type

on filescanner.create
call super::create
end on

on filescanner.destroy
call super::destroy
end on

event ontraverse;call super::ontraverse;if mle_1.text = "" then
	mle_1.text = Sprintf("{1,-20}~t{2,-4}~t{3,-10}~t{4,-20}~t{5,-20}~r~n","名称","类型","大小","创建日期","最后修改日期")
end if
mle_1.text += Sprintf("{1,-20}~t{2,-4}~t{3,-10}~t{4:YYYY-MM-DD HH:MM:SS}~t{5:YYYY-MM-DD HH:MM:SS}~r~n",name,iif(isFolder,"DIR","FILE"),String(Long(fileSize/1024)) + "KB",creationTime,lastWriteTime)
return 0
end event

