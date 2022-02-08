$PBExportHeader$w_test_sqlparser.srw
forward
global type w_test_sqlparser from window
end type
type cb_19 from commandbutton within w_test_sqlparser
end type
type cb_20 from commandbutton within w_test_sqlparser
end type
type cb_18 from commandbutton within w_test_sqlparser
end type
type cb_17 from commandbutton within w_test_sqlparser
end type
type cb_16 from commandbutton within w_test_sqlparser
end type
type cb_15 from commandbutton within w_test_sqlparser
end type
type cb_14 from commandbutton within w_test_sqlparser
end type
type cb_13 from commandbutton within w_test_sqlparser
end type
type cb_12 from commandbutton within w_test_sqlparser
end type
type cb_11 from commandbutton within w_test_sqlparser
end type
type cb_10 from commandbutton within w_test_sqlparser
end type
type cb_9 from commandbutton within w_test_sqlparser
end type
type cb_8 from commandbutton within w_test_sqlparser
end type
type cb_7 from commandbutton within w_test_sqlparser
end type
type st_4 from statictext within w_test_sqlparser
end type
type cb_6 from commandbutton within w_test_sqlparser
end type
type cb_5 from commandbutton within w_test_sqlparser
end type
type cb_4 from commandbutton within w_test_sqlparser
end type
type cb_3 from commandbutton within w_test_sqlparser
end type
type cb_2 from commandbutton within w_test_sqlparser
end type
type mle_detail from multilineedit within w_test_sqlparser
end type
type st_3 from statictext within w_test_sqlparser
end type
type mle_where from multilineedit within w_test_sqlparser
end type
type st_2 from statictext within w_test_sqlparser
end type
type st_1 from statictext within w_test_sqlparser
end type
type cb_1 from commandbutton within w_test_sqlparser
end type
type mle_sql from multilineedit within w_test_sqlparser
end type
type sle_selectindex from singlelineedit within w_test_sqlparser
end type
end forward

global type w_test_sqlparser from window
integer width = 4754
integer height = 3596
boolean titlebar = true
string title = "SQLParser"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_19 cb_19
cb_20 cb_20
cb_18 cb_18
cb_17 cb_17
cb_16 cb_16
cb_15 cb_15
cb_14 cb_14
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
st_4 st_4
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
mle_detail mle_detail
st_3 st_3
mle_where mle_where
st_2 st_2
st_1 st_1
cb_1 cb_1
mle_sql mle_sql
sle_selectindex sle_selectindex
end type
global w_test_sqlparser w_test_sqlparser

type variables
n_sql in_sql

end variables

on w_test_sqlparser.create
this.cb_19=create cb_19
this.cb_20=create cb_20
this.cb_18=create cb_18
this.cb_17=create cb_17
this.cb_16=create cb_16
this.cb_15=create cb_15
this.cb_14=create cb_14
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.st_4=create st_4
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.mle_detail=create mle_detail
this.st_3=create st_3
this.mle_where=create mle_where
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.mle_sql=create mle_sql
this.sle_selectindex=create sle_selectindex
this.Control[]={this.cb_19,&
this.cb_20,&
this.cb_18,&
this.cb_17,&
this.cb_16,&
this.cb_15,&
this.cb_14,&
this.cb_13,&
this.cb_12,&
this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_7,&
this.st_4,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.mle_detail,&
this.st_3,&
this.mle_where,&
this.st_2,&
this.st_1,&
this.cb_1,&
this.mle_sql,&
this.sle_selectindex}
end on

on w_test_sqlparser.destroy
destroy(this.cb_19)
destroy(this.cb_20)
destroy(this.cb_18)
destroy(this.cb_17)
destroy(this.cb_16)
destroy(this.cb_15)
destroy(this.cb_14)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.st_4)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.mle_detail)
destroy(this.st_3)
destroy(this.mle_where)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.mle_sql)
destroy(this.sle_selectindex)
end on

event open;in_sql = Create n_sql
end event

event close;Destroy in_sql
end event

type cb_19 from commandbutton within w_test_sqlparser
integer x = 50
integer y = 840
integer width = 434
integer height = 112
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "解析"
end type

event clicked;ulong cpu

cpu = CPU()

if IsFailed(in_sql.Parse(mle_sql.Text)) then
	mle_detail.text = "Invalid SQL"
else
	mle_detail.text = "[SELECT]:"+string(in_sql.GetSelectCount())+"~r~nTime:"+string(CPU() - cpu)+" ms"
end if
end event

type cb_20 from commandbutton within w_test_sqlparser
integer x = 640
integer y = 1440
integer width = 503
integer height = 128
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "获取全部语句"
end type

event clicked;mle_detail.Text = 	"[SELECT]: "+sle_selectindex.text+&
								"~r~nColumns:~t"+in_sql.GetColumn(Long(sle_selectindex.text))+&
								"~r~nTables:~t"+in_sql.GetTable(Long(sle_selectindex.text))+&
								"~r~nWhere:~t"+in_sql.GetWhere(Long(sle_selectindex.text))+&
								"~r~nGroup by:~t"+in_sql.GetGroup(Long(sle_selectindex.text))+&
								"~r~nHaving:~t"+in_sql.GetHaving(Long(sle_selectindex.text))+&
								"~r~nOrder by:~t"+in_sql.GetOrder(Long(sle_selectindex.text))
end event

type cb_18 from commandbutton within w_test_sqlparser
integer x = 50
integer y = 1852
integer width = 517
integer height = 128
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "获取[WHERE]"
end type

event clicked;mle_detail.text = in_sql.GetWhere(Long(sle_selectindex.text))
end event

type cb_17 from commandbutton within w_test_sqlparser
integer x = 50
integer y = 1572
integer width = 517
integer height = 128
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "获取[COLUMN]"
end type

event clicked;mle_detail.text = in_sql.GetColumn(Long(sle_selectindex.text))
end event

type cb_16 from commandbutton within w_test_sqlparser
integer x = 50
integer y = 1712
integer width = 517
integer height = 128
integer taborder = 70
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "获取[TABLE]"
end type

event clicked;mle_detail.text = in_sql.GetTable(Long(sle_selectindex.text))
end event

type cb_15 from commandbutton within w_test_sqlparser
integer x = 50
integer y = 1992
integer width = 517
integer height = 128
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "获取[ORDER]"
end type

event clicked;mle_detail.text = in_sql.GetOrder(Long(sle_selectindex.text))
end event

type cb_14 from commandbutton within w_test_sqlparser
integer x = 50
integer y = 2132
integer width = 517
integer height = 128
integer taborder = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "获取[GROUP]"
end type

event clicked;mle_detail.text = in_sql.GetGroup(Long(sle_selectindex.text))
end event

type cb_13 from commandbutton within w_test_sqlparser
integer x = 50
integer y = 2272
integer width = 517
integer height = 128
integer taborder = 90
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "获取[HAVING]"
end type

event clicked;mle_detail.text = in_sql.GetHaving(Long(sle_selectindex.text))
end event

type cb_12 from commandbutton within w_test_sqlparser
integer x = 594
integer y = 2276
integer width = 517
integer height = 128
integer taborder = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "替换[HAVING]"
end type

event clicked;in_sql.ModifyHaving(Long(sle_selectindex.text),Enums.SQL_MS_REPLACE,mle_where.text)
mle_detail.text = in_sql.GetSQL()
end event

type cb_11 from commandbutton within w_test_sqlparser
integer x = 1166
integer y = 2276
integer width = 517
integer height = 128
integer taborder = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "添加[HAVING]"
end type

event clicked;in_sql.ModifyHaving(Long(sle_selectindex.text),Enums.SQL_MS_APPEND,mle_where.text)
mle_detail.text = in_sql.GetSQL()
end event

type cb_10 from commandbutton within w_test_sqlparser
integer x = 1166
integer y = 2136
integer width = 517
integer height = 128
integer taborder = 70
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "添加[GROUP]"
end type

event clicked;in_sql.ModifyGroup(Long(sle_selectindex.text),Enums.SQL_MS_APPEND,mle_where.text)
mle_detail.text = in_sql.GetSQL()
end event

type cb_9 from commandbutton within w_test_sqlparser
integer x = 594
integer y = 2136
integer width = 517
integer height = 128
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "替换[GROUP]"
end type

event clicked;in_sql.ModifyGroup(Long(sle_selectindex.text),Enums.SQL_MS_REPLACE,mle_where.text)
mle_detail.text = in_sql.GetSQL()
end event

type cb_8 from commandbutton within w_test_sqlparser
integer x = 594
integer y = 1996
integer width = 517
integer height = 128
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "替换[ORDER]"
end type

event clicked;in_sql.ModifyOrder(Long(sle_selectindex.text),Enums.SQL_MS_REPLACE,mle_where.text)
mle_detail.text = in_sql.GetSQL()
end event

type cb_7 from commandbutton within w_test_sqlparser
integer x = 1166
integer y = 1996
integer width = 517
integer height = 128
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "添加[ORDER]"
end type

event clicked;in_sql.ModifyOrder(Long(sle_selectindex.text),Enums.SQL_MS_APPEND,mle_where.text)
mle_detail.text = in_sql.GetSQL()
end event

type st_4 from statictext within w_test_sqlparser
integer x = 41
integer y = 1456
integer width = 389
integer height = 72
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "INDEX:"
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_test_sqlparser
integer x = 1166
integer y = 1716
integer width = 517
integer height = 128
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "添加[TABLE]"
end type

event clicked;in_sql.ModifyTable(Long(sle_selectindex.text),Enums.SQL_MS_APPEND,mle_where.text)
mle_detail.text = in_sql.GetSQL()
end event

type cb_5 from commandbutton within w_test_sqlparser
integer x = 594
integer y = 1716
integer width = 517
integer height = 128
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "替换[TABLE]"
end type

event clicked;in_sql.ModifyTable(Long(sle_selectindex.text),Enums.SQL_MS_REPLACE,mle_where.text)
mle_detail.text = in_sql.GetSQL()
end event

type cb_4 from commandbutton within w_test_sqlparser
integer x = 594
integer y = 1576
integer width = 517
integer height = 128
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "替换[COLUMN]"
end type

event clicked;in_sql.ModifyColumn(Long(sle_selectindex.text),Enums.SQL_MS_REPLACE,mle_where.text)
mle_detail.text = in_sql.GetSQL()
end event

type cb_3 from commandbutton within w_test_sqlparser
integer x = 1166
integer y = 1576
integer width = 517
integer height = 128
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "添加[COLUMN]"
end type

event clicked;in_sql.ModifyColumn(Long(sle_selectindex.text),Enums.SQL_MS_APPEND,mle_where.text)
mle_detail.text = in_sql.GetSQL()
end event

type cb_2 from commandbutton within w_test_sqlparser
integer x = 1166
integer y = 1856
integer width = 517
integer height = 128
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "添加[WHERE]"
end type

event clicked;in_sql.ModifyWhere(Long(sle_selectindex.text),Enums.SQL_MS_APPEND,mle_where.text)
mle_detail.text = in_sql.GetSQL()

end event

type mle_detail from multilineedit within w_test_sqlparser
integer x = 50
integer y = 2560
integer width = 4594
integer height = 992
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_test_sqlparser
integer x = 69
integer y = 2460
integer width = 457
integer height = 72
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DETAIL:"
boolean focusrectangle = false
end type

type mle_where from multilineedit within w_test_sqlparser
integer x = 37
integer y = 1052
integer width = 4594
integer height = 376
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "[NEW CLAUSE]"
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_test_sqlparser
integer x = 41
integer y = 964
integer width = 517
integer height = 72
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NEW CLAUSE:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_test_sqlparser
integer x = 32
integer y = 28
integer width = 457
integer height = 72
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "SQL:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_test_sqlparser
integer x = 594
integer y = 1856
integer width = 517
integer height = 128
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "替换[WHERE]"
end type

event clicked;in_sql.ModifyWhere(Long(sle_selectindex.text),Enums.SQL_MS_REPLACE,mle_where.text)
mle_detail.text = in_sql.GetSQL()
end event

type mle_sql from multilineedit within w_test_sqlparser
integer x = 27
integer y = 116
integer width = 4594
integer height = 716
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "SELECT * FROM DUAL"
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

event modified;ulong cpu

cpu = CPU()

if IsFailed(in_sql.Parse(Text)) then
	mle_detail.text = "Invalid SQL"
else
	mle_detail.text = "[SELECT]:"+string(in_sql.GetSelectCount())+"~r~nTime:"+string(CPU() - cpu)+" ms"
end if
end event

type sle_selectindex from singlelineedit within w_test_sqlparser
integer x = 384
integer y = 1448
integer width = 247
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
end type

