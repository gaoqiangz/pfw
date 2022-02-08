$PBExportHeader$w_test_sciter.srw
forward
global type w_test_sciter from window
end type
type cb_2 from commandbutton within w_test_sciter
end type
type st_3 from statictext within w_test_sciter
end type
type st_2 from statictext within w_test_sciter
end type
type st_1 from statictext within w_test_sciter
end type
type mle_debug from multilineedit within w_test_sciter
end type
type dw_2 from datawindow within w_test_sciter
end type
type dw_1 from datawindow within w_test_sciter
end type
type cb_1 from commandbutton within w_test_sciter
end type
type uo_sciter from u_sciter within w_test_sciter
end type
end forward

global type w_test_sciter from window
integer width = 4677
integer height = 2556
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event type string ontest ( string arg )
cb_2 cb_2
st_3 st_3
st_2 st_2
st_1 st_1
mle_debug mle_debug
dw_2 dw_2
dw_1 dw_1
cb_1 cb_1
uo_sciter uo_sciter
end type
global w_test_sciter w_test_sciter

type variables

end variables

forward prototypes
public function string wf_test (string str, long num, double fnum, decimal dnum, string strary[], long numary[], double fnumary[], decimal dnumary[])
end prototypes

event type string ontest(string arg);messagebox("ontest",arg)
return arg + " xxxx"
end event

public function string wf_test (string str, long num, double fnum, decimal dnum, string strary[], long numary[], double fnumary[], decimal dnumary[]);int i
string ls_strAry,ls_numAry,ls_fnumAry,ls_dnumAry
for i = 1 to UpperBound(strAry)
	ls_strAry += strAry[i]
	if i < UpperBound(strAry) then ls_strAry += ","
next
for i = 1 to UpperBound(numary)
	ls_numAry += String(numary[i])
	if i < UpperBound(numary) then ls_numAry += ","
next
for i = 1 to UpperBound(fnumary)
	ls_fnumAry += String(fnumary[i])
	if i < UpperBound(fnumary) then ls_fnumAry += ","
next
for i = 1 to UpperBound(dnumary)
	ls_dnumAry += String(dnumary[i])
	if i < UpperBound(dnumary) then ls_dnumAry += ","
next
return Sprintf("str:{1} num:{2} fnum:{3} dnum:{4}~nstrary:{5}~nnumary:{6}~nfnumary:{7}~ndnumary:{8}",str,num,fnum,dnum,ls_strAry,ls_numAry,ls_fnumAry,ls_dnumAry)
end function

on w_test_sciter.create
this.cb_2=create cb_2
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.mle_debug=create mle_debug
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.uo_sciter=create uo_sciter
this.Control[]={this.cb_2,&
this.st_3,&
this.st_2,&
this.st_1,&
this.mle_debug,&
this.dw_2,&
this.dw_1,&
this.cb_1,&
this.uo_sciter}
end on

on w_test_sciter.destroy
destroy(this.cb_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_debug)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.uo_sciter)
end on

type cb_2 from commandbutton within w_test_sciter
integer x = 3008
integer y = 36
integer width = 704
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "PB DS访问性能测试"
end type

event clicked;DataStore ds
ulong nCpu
long nRow,nCol,nColCnt
Constant Long ROWCNT = 200000

nCPU = CPU()

ds = Create DataStore
ds.DataObject = "dw_test"

nColCnt = Long(ds.Describe("DataWindow.Column.Count"))
for nRow = 1 to ROWCNT
	//InsertRow被调用20W次
	ds.InsertRow(0)
	for nCol = 1 to nColCnt
		//SetItem被调用80W次
		ds.SetItem(nRow,nCol,"abcd")
	next
next

//释放ds
Destroy ds

mle_debug.Text += String(CPU() - nCPU) + "ms~r~n"
mle_debug.Scroll(mle_debug.LineCount())
end event

type st_3 from statictext within w_test_sciter
integer x = 3008
integer y = 1348
integer width = 576
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "dw_2:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_test_sciter
integer x = 3008
integer y = 228
integer width = 553
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "dw_1:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_test_sciter
integer x = 69
integer y = 1348
integer width = 576
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Debug Output:"
boolean focusrectangle = false
end type

type mle_debug from multilineedit within w_test_sciter
integer x = 50
integer y = 1468
integer width = 2834
integer height = 952
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_test_sciter
integer x = 3008
integer y = 1468
integer width = 1627
integer height = 952
integer taborder = 30
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_test_sciter
integer x = 3008
integer y = 328
integer width = 1627
integer height = 952
integer taborder = 20
string title = "none"
string dataobject = "dw_test"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_test_sciter
integer x = 64
integer y = 28
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Load"
end type

event clicked;uo_sciter.LoadFile("tests\sciter\interop.htm")
end event

type uo_sciter from u_sciter within w_test_sciter
event ue_evtname ( string arg )
integer x = 50
integer y = 204
integer width = 2834
integer height = 1080
integer taborder = 10
end type

event ue_evtname(string arg);messagebox("ue_evtname",arg)
end event

on uo_sciter.destroy
call u_sciter::destroy
end on

event constructor;call super::constructor;SetDebugOutput(true)
end event

event ondebugoutput;call super::ondebugoutput;mle_debug.Text += info + "~r~n"
mle_debug.Scroll(mle_debug.LineCount())
return 1
end event

