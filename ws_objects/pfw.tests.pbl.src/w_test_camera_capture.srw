$PBExportHeader$w_test_camera_capture.srw
forward
global type w_test_camera_capture from window
end type
type p_preview from picture within w_test_camera_capture
end type
type st_2 from statictext within w_test_camera_capture
end type
type cb_4 from commandbutton within w_test_camera_capture
end type
type cbx_showinfo from checkbox within w_test_camera_capture
end type
type cb_3 from commandbutton within w_test_camera_capture
end type
type cb_2 from commandbutton within w_test_camera_capture
end type
type cb_1 from commandbutton within w_test_camera_capture
end type
type st_1 from statictext within w_test_camera_capture
end type
type uo_capture from u_cameracapture within w_test_camera_capture
end type
type ddlb_resolutions from dropdownlistbox within w_test_camera_capture
end type
type ddlb_devlist from dropdownlistbox within w_test_camera_capture
end type
end forward

global type w_test_camera_capture from window
integer width = 2711
integer height = 3388
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_preview p_preview
st_2 st_2
cb_4 cb_4
cbx_showinfo cbx_showinfo
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_1 st_1
uo_capture uo_capture
ddlb_resolutions ddlb_resolutions
ddlb_devlist ddlb_devlist
end type
global w_test_camera_capture w_test_camera_capture

forward prototypes
public subroutine wf_refreshdevlist ()
end prototypes

public subroutine wf_refreshdevlist ();int nIndex,nCount,nSelected

ddlb_devlist.Reset()

nCount = uo_capture.GetDeviceCount()
for nIndex = 1 to nCount
	if nSelected = 0 then nSelected = nIndex
	ddlb_devlist.AddItem(Sprintf("{1} {2}",nIndex,uo_capture.GetDeviceName(nIndex)))
next

ddlb_devlist.SelectItem(nSelected)
ddlb_devlist.Event SelectionChanged(nSelected)
end subroutine

on w_test_camera_capture.create
this.p_preview=create p_preview
this.st_2=create st_2
this.cb_4=create cb_4
this.cbx_showinfo=create cbx_showinfo
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.uo_capture=create uo_capture
this.ddlb_resolutions=create ddlb_resolutions
this.ddlb_devlist=create ddlb_devlist
this.Control[]={this.p_preview,&
this.st_2,&
this.cb_4,&
this.cbx_showinfo,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.uo_capture,&
this.ddlb_resolutions,&
this.ddlb_devlist}
end on

on w_test_camera_capture.destroy
destroy(this.p_preview)
destroy(this.st_2)
destroy(this.cb_4)
destroy(this.cbx_showinfo)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.uo_capture)
destroy(this.ddlb_resolutions)
destroy(this.ddlb_devlist)
end on

event open;wf_RefreshDevList()
end event

type p_preview from picture within w_test_camera_capture
integer x = 27
integer y = 1836
integer width = 2642
integer height = 1440
boolean enabled = false
boolean focusrectangle = false
end type

type st_2 from statictext within w_test_camera_capture
integer x = 1010
integer y = 1532
integer width = 233
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "分辨率"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_test_camera_capture
integer x = 1815
integer y = 1656
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "拍照"
end type

event clicked;/*string sCurrDir,sPath,sFileName

sCurrDir = GetCurrentDirectory()

try
	if GetFileSaveName("保存当前帧",ref sPath,ref sFileName, "jpg,png,gif,bmp", "JPEG Files (*.jpg),*.jpg,PNG Files (*.png),*.png,GIF Files (*.gif),*.gif,BMP Files (*.bmp),*.bmp") = 1 then
		uo_capture.SaveFrame(sPath)
	end if
finally
	ChangeDirectory(sCurrDir)
end try*/

p_preview.SetPicture(uo_capture.SaveFrame(Enums.IMAGE_FILE_FORMAT_JPEG))
end event

type cbx_showinfo from checkbox within w_test_camera_capture
integer x = 2208
integer y = 1524
integer width = 462
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "显示帧信息"
end type

event clicked;uo_capture.ShowVideoInfo(Checked)
end event

type cb_3 from commandbutton within w_test_camera_capture
integer x = 1042
integer y = 1656
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "设置"
end type

event clicked;uo_capture.ShowSettingWindow()
end event

type cb_2 from commandbutton within w_test_camera_capture
integer x = 553
integer y = 1656
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "断开"
end type

event clicked;uo_capture.Close()
end event

type cb_1 from commandbutton within w_test_camera_capture
integer x = 73
integer y = 1656
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "连接"
end type

event clicked;int nDevIndex,nResIndex
ulong nDims[]

nDevIndex = ddlb_devlist.FindItem(ddlb_devlist.Text,0)
if nDevIndex <= 0 then return

nResIndex = ddlb_resolutions.FindItem(ddlb_resolutions.Text,0)
if nResIndex <= 0 then return

uo_capture.GetDeviceResolutions(nDevIndex,ref nDims)
if nResIndex > UpperBound(nDims) then return

uo_capture.Open(nDevIndex,LoWord(nDims[nResIndex]),HiWord(nDims[nResIndex]))
end event

type st_1 from statictext within w_test_camera_capture
integer x = 55
integer y = 1528
integer width = 165
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "设备"
boolean focusrectangle = false
end type

type uo_capture from u_cameracapture within w_test_camera_capture
integer x = 27
integer y = 28
integer width = 2642
integer height = 1440
integer taborder = 10
end type

on uo_capture.destroy
call u_cameracapture::destroy
end on

event ondeviceinterrupted;call super::ondeviceinterrupted;//当前连接的设备异常断开
wf_RefreshDevList()
return 0
end event

event ondevicechanged;call super::ondevicechanged;//列表发生改变（设备插上或断开触发）
wf_RefreshDevList()
return 0
end event

type ddlb_resolutions from dropdownlistbox within w_test_camera_capture
integer x = 1257
integer y = 1520
integer width = 521
integer height = 476
integer taborder = 30
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_devlist from dropdownlistbox within w_test_camera_capture
integer x = 242
integer y = 1516
integer width = 750
integer height = 476
integer taborder = 20
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;int nIndex,nCount
ulong nDims[]

ddlb_resolutions.Reset()

nCount = uo_capture.GetDeviceResolutions(index,ref nDims)
for nIndex = 1 to nCount
	ddlb_resolutions.AddItem(Sprintf("{1} x {2}",LoWord(nDims[nIndex]),HiWord(nDims[nIndex])))
next
ddlb_resolutions.SelectItem(1)
end event

