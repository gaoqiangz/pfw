$PBExportHeader$u_cst_tabpage_sciter_browser.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_sciter_browser from ue_cst_tabpage
end type
type sle_url from se_cst_singlelineedit within u_cst_tabpage_sciter_browser
end type
type cb_load from se_cst_button within u_cst_tabpage_sciter_browser
end type
type cb_select from se_cst_button within u_cst_tabpage_sciter_browser
end type
type uo_sciter from u_sciter within u_cst_tabpage_sciter_browser
end type
type ln_separator from line within u_cst_tabpage_sciter_browser
end type
end forward

global type u_cst_tabpage_sciter_browser from ue_cst_tabpage
integer width = 2208
integer height = 1476
sle_url sle_url
cb_load cb_load
cb_select cb_select
uo_sciter uo_sciter
ln_separator ln_separator
end type
global u_cst_tabpage_sciter_browser u_cst_tabpage_sciter_browser

on u_cst_tabpage_sciter_browser.create
int iCurrent
call super::create
this.sle_url=create sle_url
this.cb_load=create cb_load
this.cb_select=create cb_select
this.uo_sciter=create uo_sciter
this.ln_separator=create ln_separator
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_url
this.Control[iCurrent+2]=this.cb_load
this.Control[iCurrent+3]=this.cb_select
this.Control[iCurrent+4]=this.uo_sciter
this.Control[iCurrent+5]=this.ln_separator
end on

on u_cst_tabpage_sciter_browser.destroy
call super::destroy
destroy(this.sle_url)
destroy(this.cb_load)
destroy(this.cb_select)
destroy(this.uo_sciter)
destroy(this.ln_separator)
end on

event resize;call super::resize;uo_sciter.Move(0,uo_sciter.y)
uo_sciter.Resize(newWidth,newHeight - uo_sciter.y)
ln_separator.BeginX = 0
ln_separator.EndX = newWidth
end event

type sle_url from se_cst_singlelineedit within u_cst_tabpage_sciter_browser
integer x = 475
integer y = 12
integer width = 1577
integer taborder = 30
integer textsize = -10
string text = ""
end type

type cb_load from se_cst_button within u_cst_tabpage_sciter_browser
integer x = 5
integer y = 12
integer width = 457
integer height = 132
integer taborder = 10
integer weight = 400
string text = "加载"
end type

event clicked;uo_sciter.LoadFile(sle_url.text)
end event

type cb_select from se_cst_button within u_cst_tabpage_sciter_browser
integer x = 2057
integer y = 12
integer width = 151
integer height = 132
integer taborder = 20
integer weight = 400
string text = "..."
icon #tooltipicon = information!
string #tiptext = "选择加载的文件"
end type

event clicked;string ls_path,ls_filename
string ls_currDir

ls_currDir = GetCurrentDirectory()

if GetFileOpenName("Select HTML file",ref ls_path,ref ls_fileName,"htm","HTM files(*.htm),*.htm,HTML files(*.html),*.html,zip files(*.html),*.zip,All files(*.*),*.*") < 1 then return

ChangeDirectory(ls_currDir)

sle_url.Text = "file://"+ls_path
end event

event constructor;call super::constructor;of_SetToolTipStyle(Enums.TTS_NORMAL)
end event

type uo_sciter from u_sciter within u_cst_tabpage_sciter_browser
integer y = 164
integer width = 2208
integer height = 1308
integer taborder = 40
end type

on uo_sciter.destroy
call u_sciter::destroy
end on

type ln_separator from line within u_cst_tabpage_sciter_browser
long linecolor = 67108864
integer linethickness = 4
integer beginy = 152
integer endx = 2203
integer endy = 152
end type

