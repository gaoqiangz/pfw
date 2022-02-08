$PBExportHeader$w_test_sqlite.srw
forward
global type w_test_sqlite from window
end type
type st_1 from statictext within w_test_sqlite
end type
type cb_11 from commandbutton within w_test_sqlite
end type
type cb_10 from commandbutton within w_test_sqlite
end type
type cb_9 from commandbutton within w_test_sqlite
end type
type cb_8 from commandbutton within w_test_sqlite
end type
type dw_1 from datawindow within w_test_sqlite
end type
type cb_7 from commandbutton within w_test_sqlite
end type
type cb_6 from commandbutton within w_test_sqlite
end type
type cb_5 from commandbutton within w_test_sqlite
end type
type cb_4 from commandbutton within w_test_sqlite
end type
type cb_3 from commandbutton within w_test_sqlite
end type
type cb_2 from commandbutton within w_test_sqlite
end type
type cb_1 from commandbutton within w_test_sqlite
end type
end forward

global type w_test_sqlite from window
integer width = 3762
integer height = 2444
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
dw_1 dw_1
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_test_sqlite w_test_sqlite

type variables
n_sqlite _db
end variables

on w_test_sqlite.create
this.st_1=create st_1
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.dw_1=create dw_1
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.st_1,&
this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.dw_1,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_test_sqlite.destroy
destroy(this.st_1)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.dw_1)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;_db = Create n_sqlite
end event

event close;_db.Close()
Destroy _db
end event

type st_1 from statictext within w_test_sqlite
integer x = 2240
integer y = 588
integer width = 992
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sort by [Age ASC,Salary ASC]"
boolean focusrectangle = false
end type

type cb_11 from commandbutton within w_test_sqlite
integer x = 3269
integer y = 856
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "DeleteRow"
end type

event clicked;dw_1.DeleteRow(dw_1.GetRow())
end event

type cb_10 from commandbutton within w_test_sqlite
integer x = 3264
integer y = 700
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "AddRow"
end type

event clicked;dw_1.ScrollToRow(dw_1.InsertRow(0))
end event

type cb_9 from commandbutton within w_test_sqlite
integer x = 50
integer y = 528
integer width = 873
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "UPDATE by DataWindow"
end type

event clicked;string sErrText

if IsFailed(_db.Update(dw_1,true,false)) then
	sErrText = _db.SQLErrText()
	_db.Rollback()
	MessageBox("UPDATE",sErrText)
	return
end if

if IsFailed(_db.Commit()) then
	sErrText = _db.SQLErrText()
	_db.Rollback()
	MessageBox("COMMIT",sErrText)
	return
end if

dw_1.ResetUpdate()
end event

type cb_8 from commandbutton within w_test_sqlite
integer x = 46
integer y = 380
integer width = 754
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Retrieve DataWindow"
end type

event clicked;//检索到DataWindow
if IsFailed(_db.Query(dw_1/*[,sql]*/)) then
	MessageBox("SELECT",_db.SQLErrText())
	return
end if

end event

type dw_1 from datawindow within w_test_sqlite
integer x = 27
integer y = 680
integer width = 3209
integer height = 1624
integer taborder = 30
string title = "none"
string dataobject = "dw_sqlite"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_7 from commandbutton within w_test_sqlite
integer x = 942
integer y = 528
integer width = 782
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "UPDATE by DataStore"
end type

event clicked;long nRow,nRowCnt,i
string sErrText
datastore ds

//检索到DataStore
if IsFailed(_db.Query(ref ds,"SELECT * FROM COMPANY")) then
	MessageBox("SELECT",_db.SQLErrText())
	return
end if

nRowCnt = ds.RowCount()
for nRow = 1 to nRowCnt
	ds.SetItem(nRow,"name","gaoqiangz")
	ds.SetItem(nRow,"address","beijing")
	ds.SetItem(nRow,"salary",100 * nRow)
next
for i = 1 to 10
	nRow = ds.InsertRow(0)
	ds.SetItem(nRow,"name","gaoqiangz")
	ds.SetItem(nRow,"age",18)
	ds.SetItem(nRow,"address","shenzheng")
	ds.SetItem(nRow,"salary",123.456 * i)
	ds.SetItem(nRow,"birth",String(ToDay(),"YYYY-MM-DD"))
next

if IsFailed(_db.Update(ds)) then
	sErrText = _db.SQLErrText()
	_db.Rollback()
	MessageBox("UPDATE",sErrText)
	return
end if

if IsFailed(_db.Commit()) then
	sErrText = _db.SQLErrText()
	_db.Rollback()
	MessageBox("COMMIT",sErrText)
end if
end event

type cb_6 from commandbutton within w_test_sqlite
integer x = 553
integer y = 220
integer width = 462
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "UPDATE"
end type

event clicked;_db.SetAutoCommit(true)
if IsFailed(_db.Exec("UPDATE COMPANY SET SALARY = SALARY + 100 WHERE NAME = ? ",&
							"Paul")) then
	MessageBox("UPDATE",_db.SQLErrText())
end if
_db.SetAutoCommit(false)
end event

type cb_5 from commandbutton within w_test_sqlite
integer x = 1522
integer y = 384
integer width = 663
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Retrieve Recordset"
end type

event clicked;long nCol,nColCnt
string sRecordStr
n_sqliterecordset rs

//检索到Recordset
if IsFailed(_db.Query(ref rs,"SELECT * FROM COMPANY")) then
	MessageBox("SELECT",_db.SQLErrText())
	return
end if

nColCnt = rs.GetColumnCount()
for nCol = 1 to nColCnt
	if nCol > 1 then sRecordStr += " ~t "
	sRecordStr += rs.GetColumnName(nCol)
next

/*do while rs.HasData()
	sRecordStr += Sprintf("~n{1}~t{2}~t{3}~t{4}~t{5:#.0#}~{6}",rs.GetColumnData("id"),rs.GetColumnData("name"),rs.GetColumnData("age"),rs.GetColumnData("address"),rs.GetColumnData("salary"),rs.GetColumnData("birth"))
	rs.NextRow()
loop*/
do
	sRecordStr += Sprintf("~n{1}~t{2}~t{3}~t{4}~t{5:#.0#}~t{6:YYYY-MM-DD}",rs.GetColumnNumber("id"),rs.GetColumnString("name"),rs.GetColumnNumber("age"),rs.GetColumnString("address"),rs.GetColumnNumber("salary"),rs.GetColumnDate("birth"))
loop while rs.NextRow()

MessageBox("Recordset",sRecordStr)
end event

type cb_4 from commandbutton within w_test_sqlite
integer x = 41
integer y = 220
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "INSERT"
end type

event clicked;long i
string sErrText

//批量插入
if IsFailed(_db.Exec("INSERT INTO COMPANY (NAME,AGE,ADDRESS,SALARY,BIRTH) "  	+&
							"VALUES ('Paul', 32, 'California', 20000.00, '1991-05-11'); " 	+&
							"INSERT INTO COMPANY (NAME,AGE,ADDRESS,SALARY,BIRTH) " 	+&
							"VALUES ('Allen', 25, 'Texas', 15000.88, '1980-05-11'); "     	+&
							"INSERT INTO COMPANY (NAME,AGE,ADDRESS,SALARY,BIRTH)" 	+&
							"VALUES ('Teddy', 23, 'Norway', 20000.32, '1995-10-11');" 		+&
							"INSERT INTO COMPANY (NAME,AGE,ADDRESS,SALARY,BIRTH)" 	+&
							"VALUES ('Mark', 25, 'Rich-Mond ', 65000.16, '1988-07-28')")) then
	sErrText = _db.SQLErrText()
	_db.Rollback()
	MessageBox("BATCH INSERT",sErrText)
	return
end if

//动态逐条插入
for i = 1 to 10
	//*'@'前缀使语句缓存提高再次执行时的解析速度（空间换时间）
	if IsFailed(_db.Exec("@INSERT INTO COMPANY (NAME,AGE,ADDRESS,SALARY,BIRTH) " +&
								"VALUES (?, ?, ?, ?, ?)",&
								"Paul",32,"California",20000,"1999-05-08")) then
		sErrText = _db.SQLErrText()
		_db.Rollback()
		MessageBox("INSERT",sErrText)
		return
	end if
next

if IsFailed(_db.Commit()) then
	sErrText = _db.SQLErrText()
	_db.Rollback()
	MessageBox("COMMIT",sErrText)
end if
end event

type cb_3 from commandbutton within w_test_sqlite
integer x = 544
integer y = 52
integer width = 517
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "DISCONNECT"
end type

event clicked;_db.Close()
end event

type cb_2 from commandbutton within w_test_sqlite
integer x = 27
integer y = 48
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CONNECT"
end type

event clicked;if _db.IsOpened() then return

FileDelete("test.db")

//URI协议参见(https://www.sqlite.org/uri.html)
if IsFailed(_db.Open("test.db?mode=rwc"/*[,password]*/)) then
	MessageBox("OPEN",_db.SQLErrText())
	return
end if

_db.SetAutoCommit(true)

if IsFailed(_db.Exec("CREATE TABLE IF NOT EXISTS COMPANY(" 	+&
							"ID INTEGER PRIMARY KEY NOT NULL," 		+ /*自增列*/&
							"NAME           TEXT    NOT NULL," 		+&
							"AGE            INT     NOT NULL," 		+&
							"ADDRESS        CHAR(50)," 				+&
							"SALARY         REAL," 						+&
							"BIRTH          TEXT)")) then
	MessageBox("CREATE TABLE",_db.SQLErrText())
end if

_db.SetAutoCommit(false)
end event

type cb_1 from commandbutton within w_test_sqlite
integer x = 814
integer y = 380
integer width = 663
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Retrieve DataStore"
end type

event clicked;datastore ds

//检索到DataStore
if IsFailed(_db.Query(ref ds,"SELECT * FROM COMPANY")) then
	MessageBox("SELECT",_db.SQLErrText())
	return
end if

MessageBox("DataStore",ds.Describe("DataWindow.Data"))
end event

