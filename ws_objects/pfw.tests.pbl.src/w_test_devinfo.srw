$PBExportHeader$w_test_devinfo.srw
forward
global type w_test_devinfo from window
end type
type cb_8 from commandbutton within w_test_devinfo
end type
end forward

shared variables
string iss_test = "hahaha"
end variables

global type w_test_devinfo from window
integer width = 1381
integer height = 880
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_8 cb_8
end type
global w_test_devinfo w_test_devinfo

type variables

end variables

forward prototypes
public function string wf_test (ref double a, ref long b, ref string c, ref n_xmldoc doc)
public subroutine wf_test2 ()
public function string wf_test3 ()
end prototypes

public function string wf_test (ref double a, ref long b, ref string c, ref n_xmldoc doc);a = 100.452
b = 123
c = "test"

doc = Create n_xmldoc
doc.Parse("<xml>test</xml>")

return "ok"
end function

public subroutine wf_test2 ();messagebox("","wf_test2")
end subroutine

public function string wf_test3 ();return "ok"
end function

on w_test_devinfo.create
this.cb_8=create cb_8
this.Control[]={this.cb_8}
end on

on w_test_devinfo.destroy
destroy(this.cb_8)
end on

type cb_8 from commandbutton within w_test_devinfo
integer x = 375
integer y = 276
integer width = 594
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "List Devices Info"
end type

event clicked;int i,n,nCount
string ls_devs[],ls_devString
n_devinfo devInfo

devInfo = Create n_devinfo

for i = Enums.DEV_TYPE_HDD to Enums.DEV_TYPE_IPV6
	nCount = devInfo.GetDevices(i,ref ls_devs)
	ls_devString += "TYPE " + String(i) + ":~n"
	for n = 1 to nCount
		ls_devString += "~t" + ls_devs[n] + "~n"
	next
next

Destroy devInfo

messagebox("",ls_devString)
end event

