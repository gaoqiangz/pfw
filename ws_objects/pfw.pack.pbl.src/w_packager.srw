$PBExportHeader$w_packager.srw
forward
global type w_packager from window
end type
type cbx_utility_eventful from checkbox within w_packager
end type
type cbx_utility_misc from checkbox within w_packager
end type
type cbx_x_utility_dwparser from checkbox within w_packager
end type
type cbx_x_net_mqtt from checkbox within w_packager
end type
type cbx_x_net_http from checkbox within w_packager
end type
type st_11 from statictext within w_packager
end type
type st_remark from statictext within w_packager
end type
type st_9 from statictext within w_packager
end type
type st_8 from statictext within w_packager
end type
type cbx_2 from checkbox within w_packager
end type
type cbx_1 from checkbox within w_packager
end type
type cbx_compile from checkbox within w_packager
end type
type cbx_check_all from checkbox within w_packager
end type
type cbx_utility_dwsvc from checkbox within w_packager
end type
type cbx_ui_blink from checkbox within w_packager
end type
type cbx_ui_sciter_ext from checkbox within w_packager
end type
type cbx_ui_sciter from checkbox within w_packager
end type
type cbx_ui_ext from checkbox within w_packager
end type
type cbx_ui from checkbox within w_packager
end type
type st_7 from statictext within w_packager
end type
type cbx_net_websocket from checkbox within w_packager
end type
type cbx_net_ftp from checkbox within w_packager
end type
type cbx_net_http from checkbox within w_packager
end type
type st_6 from statictext within w_packager
end type
type cbx_net_http_ext from checkbox within w_packager
end type
type cbx_thread_ext from checkbox within w_packager
end type
type st_5 from statictext within w_packager
end type
type cbx_thread from checkbox within w_packager
end type
type cbx_crypto from checkbox within w_packager
end type
type st_4 from statictext within w_packager
end type
type cbx_utility_barcode from checkbox within w_packager
end type
type cb_2 from commandbutton within w_packager
end type
type st_3 from statictext within w_packager
end type
type sle_path from singlelineedit within w_packager
end type
type cbx_utility_zip from checkbox within w_packager
end type
type cbx_utility_compress from checkbox within w_packager
end type
type cbx_utiltiy_cameracapture from checkbox within w_packager
end type
type cbx_utility_devinfo from checkbox within w_packager
end type
type cbx_utility_compiler from checkbox within w_packager
end type
type cbx_utility_invoker from checkbox within w_packager
end type
type cbx_utility_regexp from checkbox within w_packager
end type
type cbx_utility_container from checkbox within w_packager
end type
type cbx_common from checkbox within w_packager
end type
type cbx_utility_filescanner from checkbox within w_packager
end type
type cbx_utility_logger from checkbox within w_packager
end type
type st_2 from statictext within w_packager
end type
type cbx_parser_sql from checkbox within w_packager
end type
type st_1 from statictext within w_packager
end type
type cbx_parser_xml from checkbox within w_packager
end type
type cbx_parser_json from checkbox within w_packager
end type
type cb_build from commandbutton within w_packager
end type
type ln_1 from line within w_packager
end type
type dependdata from structure within w_packager
end type
end forward

type dependdata from structure
	checkbox		obj
	checkbox		objdepend
end type

global type w_packager from window
integer width = 4165
integer height = 2212
boolean titlebar = true
string title = "PowerFramework Packager"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event onchecked ( checkbox source )
cbx_utility_eventful cbx_utility_eventful
cbx_utility_misc cbx_utility_misc
cbx_x_utility_dwparser cbx_x_utility_dwparser
cbx_x_net_mqtt cbx_x_net_mqtt
cbx_x_net_http cbx_x_net_http
st_11 st_11
st_remark st_remark
st_9 st_9
st_8 st_8
cbx_2 cbx_2
cbx_1 cbx_1
cbx_compile cbx_compile
cbx_check_all cbx_check_all
cbx_utility_dwsvc cbx_utility_dwsvc
cbx_ui_blink cbx_ui_blink
cbx_ui_sciter_ext cbx_ui_sciter_ext
cbx_ui_sciter cbx_ui_sciter
cbx_ui_ext cbx_ui_ext
cbx_ui cbx_ui
st_7 st_7
cbx_net_websocket cbx_net_websocket
cbx_net_ftp cbx_net_ftp
cbx_net_http cbx_net_http
st_6 st_6
cbx_net_http_ext cbx_net_http_ext
cbx_thread_ext cbx_thread_ext
st_5 st_5
cbx_thread cbx_thread
cbx_crypto cbx_crypto
st_4 st_4
cbx_utility_barcode cbx_utility_barcode
cb_2 cb_2
st_3 st_3
sle_path sle_path
cbx_utility_zip cbx_utility_zip
cbx_utility_compress cbx_utility_compress
cbx_utiltiy_cameracapture cbx_utiltiy_cameracapture
cbx_utility_devinfo cbx_utility_devinfo
cbx_utility_compiler cbx_utility_compiler
cbx_utility_invoker cbx_utility_invoker
cbx_utility_regexp cbx_utility_regexp
cbx_utility_container cbx_utility_container
cbx_common cbx_common
cbx_utility_filescanner cbx_utility_filescanner
cbx_utility_logger cbx_utility_logger
st_2 st_2
cbx_parser_sql cbx_parser_sql
st_1 st_1
cbx_parser_xml cbx_parser_xml
cbx_parser_json cbx_parser_json
cb_build cb_build
ln_1 ln_1
end type
global w_packager w_packager

type prototypes
private:
function long PathCombine(ref string pszPathOut,readonly string pszPathIn,readonly string pszMore) library "Shlwapi.dll" alias for "PathCombineW"
function boolean PathIsRelative(readonly string lpszPath) library "Shlwapi.dll" alias for "PathIsRelativeW"
end prototypes

type variables
private:
DEPENDDATA _depends[]

constant string ORCASCR_EXE	= "orcascr190.exe"
constant string PACK_APP_PBD	= "pack.pbd"
constant long MATCH_FALSE			= 0
constant long MATCH_TRUE			= 1
constant long MATCH_ALWAYS_FALSE	= -1
constant long MATCH_ALWAYS_TRUE	= 2
end variables

forward prototypes
public function long _wf_split (string src, readonly string delimiter, ref string dstarray[], readonly boolean ignoreempty)
private function string _wf_getpathfilename (string path, readonly boolean includeext)
private function long _wf_matchentry (readonly string libname, readonly string entryname, string exp)
private function string _wf_getabsolutepath (readonly string relativepath)
private subroutine _wf_adddepend (readonly checkbox obj, readonly checkbox objdepend)
end prototypes

event onchecked(checkbox source);long nIndex,nCount,nIndex2

nCount = UpperBound(_depends)
for nIndex = 1 to nCount
	if _depends[nIndex].obj <> source then continue
	if Not source.Checked then
		for nIndex2 = 1 to nCount
			if nIndex2 = nIndex then continue
			if Not _depends[nIndex2].obj.Checked then continue
			if _depends[nIndex2].objDepend = _depends[nIndex].objDepend then exit
		next
		if nIndex2 <= nCount then continue
	end if
	if source.Checked and Not _depends[nIndex].objDepend.Checked then
		_depends[nIndex].objDepend.Checked = source.Checked
		_depends[nIndex].objDepend.Event Clicked()
	end if
	_depends[nIndex].objDepend.Enabled = Not source.Checked
next
end event

public function long _wf_split (string src, readonly string delimiter, ref string dstarray[], readonly boolean ignoreempty);long nPos,nLenDelimiter
string str
string emptyArray[]

if IsNull(src) then return 0

dstArray = emptyArray

nLenDelimiter =  Len(delimiter)
if nLenDelimiter = 0 then return 0

nPos = Pos(src,delimiter)
do while (nPos > 0)
	str = Left(src,nPos - 1)
	if str <> "" or Not ignoreEmpty then
		dstArray[UpperBound(dstArray) + 1] = str
	end if
	src = Mid(src,nPos + nLenDelimiter)
	nPos = Pos(src,delimiter)
loop
if src <> "" then
	dstArray[UpperBound(dstArray) + 1] = src
end if

return UpperBound(dstArray)
end function

private function string _wf_getpathfilename (string path, readonly boolean includeext);long nPos

if path = "" then return ""

nPos = LastPos(path,"\")
if nPos > 0 then
	path = Mid(path,nPos + 1)
end if

if includeExt then
	return path
else
	nPos = LastPos(path,".")
	if nPos > 0 then
		return Left(path,nPos - 1)
	else
		return path
	end if
end if
end function

private function long _wf_matchentry (readonly string libname, readonly string entryname, string exp);long nPos,nPos2,nLenPrefix,nIndex,nCount
string sSubExps[]
boolean bNot

nPos = Pos(exp,libName + ":")
if nPos = 0 then return MATCH_ALWAYS_FALSE

nLenPrefix = Len(libName + ":")
nPos2 = Pos(exp,"|",nPos + nLenPrefix)
if nPos2 > 0 then
	exp = Mid(exp,nPos + nLenPrefix,nPos2 - nPos - nLenPrefix)
else
	exp = Mid(exp,nPos + nLenPrefix)
end if
if exp = ".*" then return MATCH_ALWAYS_TRUE

if Left(exp,1) = "~~" then
	bNot = true
	exp = Mid(exp,2)
end if

nCount = _wf_Split(exp,";",ref sSubExps,true)
for nIndex = 1 to nCount
	if Match(entryName,"^" + sSubExps[nIndex] + "$") then
		if bNot then return MATCH_FALSE
		return MATCH_TRUE
	end if
next

if bNot then return MATCH_TRUE
return MATCH_FALSE
end function

private function string _wf_getabsolutepath (readonly string relativepath);string sAbsPath

if Not PathIsRelative(relativePath) then return relativePath

sAbsPath = Space(260)	//MAX_PATH
if PathCombine(ref sAbsPath,GetCurrentDirectory(),relativePath) = 0 then return ""

return sAbsPath
end function

private subroutine _wf_adddepend (readonly checkbox obj, readonly checkbox objdepend);long nIndex

nIndex = UpperBound(_depends) + 1
_depends[nIndex].obj = obj
_depends[nIndex].objDepend = objDepend
end subroutine

on w_packager.create
this.cbx_utility_eventful=create cbx_utility_eventful
this.cbx_utility_misc=create cbx_utility_misc
this.cbx_x_utility_dwparser=create cbx_x_utility_dwparser
this.cbx_x_net_mqtt=create cbx_x_net_mqtt
this.cbx_x_net_http=create cbx_x_net_http
this.st_11=create st_11
this.st_remark=create st_remark
this.st_9=create st_9
this.st_8=create st_8
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.cbx_compile=create cbx_compile
this.cbx_check_all=create cbx_check_all
this.cbx_utility_dwsvc=create cbx_utility_dwsvc
this.cbx_ui_blink=create cbx_ui_blink
this.cbx_ui_sciter_ext=create cbx_ui_sciter_ext
this.cbx_ui_sciter=create cbx_ui_sciter
this.cbx_ui_ext=create cbx_ui_ext
this.cbx_ui=create cbx_ui
this.st_7=create st_7
this.cbx_net_websocket=create cbx_net_websocket
this.cbx_net_ftp=create cbx_net_ftp
this.cbx_net_http=create cbx_net_http
this.st_6=create st_6
this.cbx_net_http_ext=create cbx_net_http_ext
this.cbx_thread_ext=create cbx_thread_ext
this.st_5=create st_5
this.cbx_thread=create cbx_thread
this.cbx_crypto=create cbx_crypto
this.st_4=create st_4
this.cbx_utility_barcode=create cbx_utility_barcode
this.cb_2=create cb_2
this.st_3=create st_3
this.sle_path=create sle_path
this.cbx_utility_zip=create cbx_utility_zip
this.cbx_utility_compress=create cbx_utility_compress
this.cbx_utiltiy_cameracapture=create cbx_utiltiy_cameracapture
this.cbx_utility_devinfo=create cbx_utility_devinfo
this.cbx_utility_compiler=create cbx_utility_compiler
this.cbx_utility_invoker=create cbx_utility_invoker
this.cbx_utility_regexp=create cbx_utility_regexp
this.cbx_utility_container=create cbx_utility_container
this.cbx_common=create cbx_common
this.cbx_utility_filescanner=create cbx_utility_filescanner
this.cbx_utility_logger=create cbx_utility_logger
this.st_2=create st_2
this.cbx_parser_sql=create cbx_parser_sql
this.st_1=create st_1
this.cbx_parser_xml=create cbx_parser_xml
this.cbx_parser_json=create cbx_parser_json
this.cb_build=create cb_build
this.ln_1=create ln_1
this.Control[]={this.cbx_utility_eventful,&
this.cbx_utility_misc,&
this.cbx_x_utility_dwparser,&
this.cbx_x_net_mqtt,&
this.cbx_x_net_http,&
this.st_11,&
this.st_remark,&
this.st_9,&
this.st_8,&
this.cbx_2,&
this.cbx_1,&
this.cbx_compile,&
this.cbx_check_all,&
this.cbx_utility_dwsvc,&
this.cbx_ui_blink,&
this.cbx_ui_sciter_ext,&
this.cbx_ui_sciter,&
this.cbx_ui_ext,&
this.cbx_ui,&
this.st_7,&
this.cbx_net_websocket,&
this.cbx_net_ftp,&
this.cbx_net_http,&
this.st_6,&
this.cbx_net_http_ext,&
this.cbx_thread_ext,&
this.st_5,&
this.cbx_thread,&
this.cbx_crypto,&
this.st_4,&
this.cbx_utility_barcode,&
this.cb_2,&
this.st_3,&
this.sle_path,&
this.cbx_utility_zip,&
this.cbx_utility_compress,&
this.cbx_utiltiy_cameracapture,&
this.cbx_utility_devinfo,&
this.cbx_utility_compiler,&
this.cbx_utility_invoker,&
this.cbx_utility_regexp,&
this.cbx_utility_container,&
this.cbx_common,&
this.cbx_utility_filescanner,&
this.cbx_utility_logger,&
this.st_2,&
this.cbx_parser_sql,&
this.st_1,&
this.cbx_parser_xml,&
this.cbx_parser_json,&
this.cb_build,&
this.ln_1}
end on

on w_packager.destroy
destroy(this.cbx_utility_eventful)
destroy(this.cbx_utility_misc)
destroy(this.cbx_x_utility_dwparser)
destroy(this.cbx_x_net_mqtt)
destroy(this.cbx_x_net_http)
destroy(this.st_11)
destroy(this.st_remark)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.cbx_compile)
destroy(this.cbx_check_all)
destroy(this.cbx_utility_dwsvc)
destroy(this.cbx_ui_blink)
destroy(this.cbx_ui_sciter_ext)
destroy(this.cbx_ui_sciter)
destroy(this.cbx_ui_ext)
destroy(this.cbx_ui)
destroy(this.st_7)
destroy(this.cbx_net_websocket)
destroy(this.cbx_net_ftp)
destroy(this.cbx_net_http)
destroy(this.st_6)
destroy(this.cbx_net_http_ext)
destroy(this.cbx_thread_ext)
destroy(this.st_5)
destroy(this.cbx_thread)
destroy(this.cbx_crypto)
destroy(this.st_4)
destroy(this.cbx_utility_barcode)
destroy(this.cb_2)
destroy(this.st_3)
destroy(this.sle_path)
destroy(this.cbx_utility_zip)
destroy(this.cbx_utility_compress)
destroy(this.cbx_utiltiy_cameracapture)
destroy(this.cbx_utility_devinfo)
destroy(this.cbx_utility_compiler)
destroy(this.cbx_utility_invoker)
destroy(this.cbx_utility_regexp)
destroy(this.cbx_utility_container)
destroy(this.cbx_common)
destroy(this.cbx_utility_filescanner)
destroy(this.cbx_utility_logger)
destroy(this.st_2)
destroy(this.cbx_parser_sql)
destroy(this.st_1)
destroy(this.cbx_parser_xml)
destroy(this.cbx_parser_json)
destroy(this.cb_build)
destroy(this.ln_1)
end on

event open;_wf_AddDepend(cbx_ui,cbx_common)
_wf_AddDepend(cbx_ui,cbx_utility_container)
_wf_AddDepend(cbx_ui_ext,cbx_ui)
_wf_AddDepend(cbx_ui_sciter_ext,cbx_ui_sciter)
_wf_AddDepend(cbx_net_websocket,cbx_parser_json)
_wf_AddDepend(cbx_net_websocket,cbx_parser_xml)
_wf_AddDepend(cbx_net_http,cbx_parser_json)
_wf_AddDepend(cbx_net_http,cbx_parser_xml)
_wf_AddDepend(cbx_net_http_ext,cbx_net_http)
_wf_AddDepend(cbx_thread,cbx_common)
_wf_AddDepend(cbx_thread,cbx_utility_invoker)
_wf_AddDepend(cbx_thread_ext,cbx_thread)
_wf_AddDepend(cbx_thread_ext,cbx_parser_sql)
_wf_AddDepend(cbx_utility_dwsvc,cbx_ui_ext)
_wf_AddDepend(cbx_utility_dwsvc,cbx_ui_ext)
_wf_AddDepend(cbx_utility_eventful,cbx_common)
_wf_AddDepend(cbx_utility_eventful,cbx_utility_invoker)

//pfwx
_wf_AddDepend(cbx_x_net_http,cbx_parser_json)
_wf_AddDepend(cbx_x_net_http,cbx_parser_xml)
_wf_AddDepend(cbx_x_net_mqtt,cbx_parser_json)
_wf_AddDepend(cbx_x_net_mqtt,cbx_parser_xml)
end event

type cbx_utility_eventful from checkbox within w_packager
string tag = "pfw.utility.invoker:n_cst_eventful"
integer x = 992
integer y = 1488
integer width = 357
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Eventful"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_utility_misc from checkbox within w_packager
string tag = "pfw.utility:~~n_logger;n_filescanner"
integer x = 1426
integer y = 1488
integer width = 279
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Misc"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_x_utility_dwparser from checkbox within w_packager
string tag = "pfw.utility.parser:.*dwparser"
integer x = 2450
integer y = 616
integer width = 425
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "DWSyntax"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_x_net_mqtt from checkbox within w_packager
string tag = "pfwx.net.mqtt:.*"
integer x = 2752
integer y = 412
integer width = 297
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "MQTT"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_x_net_http from checkbox within w_packager
string tag = "pfwx.net.http:.*"
integer x = 2450
integer y = 412
integer width = 279
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "HTTP"
end type

event clicked;parent.Event OnChecked(this)
end event

type st_11 from statictext within w_packager
integer x = 2432
integer y = 512
integer width = 1659
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 268435456
string text = "Parser"
boolean focusrectangle = false
end type

type st_remark from statictext within w_packager
integer x = 2455
integer y = 160
integer width = 1623
integer height = 132
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 67108864
boolean focusrectangle = false
end type

event constructor;text = "pfwx不需要初始化,与pfw共享的对象(编译时不依赖):~r~nenum/retcode/n_json/n_xmldoc"
end event

type st_9 from statictext within w_packager
integer x = 2432
integer y = 324
integer width = 1659
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 268435456
string text = "Network"
boolean focusrectangle = false
end type

type st_8 from statictext within w_packager
integer x = 3031
integer y = 28
integer width = 457
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8388608
string text = "pfwx"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_2 from checkbox within w_packager
string tag = "pfw.utility.sqlite:.*"
integer x = 55
integer y = 1488
integer width = 416
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "SQLite"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_1 from checkbox within w_packager
string tag = "pfw.ui:n_trayicon"
integer x = 55
integer y = 220
integer width = 384
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "TrayIcon"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_compile from checkbox within w_packager
integer x = 2482
integer y = 1984
integer width = 361
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Compile"
end type

type cbx_check_all from checkbox within w_packager
integer x = 2482
integer y = 1888
integer width = 393
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select All"
end type

event clicked;long nIndex,nCount
checkbox cbx

nCount = UpperBound(Control)
for nIndex = 1 to nCount
	if Control[nIndex] = this then continue
	if Control[nIndex].tag = "" then continue
	if Control[nIndex].TypeOf() <> CheckBox! then continue
	cbx = Control[nIndex]
	if cbx.Checked = Checked then continue
	cbx.Checked = Checked
	cbx.Event Clicked()
next
end event

type cbx_utility_dwsvc from checkbox within w_packager
string tag = "pfw.datawindow.services:.*;n_cst_eventful;n_scriptinvoker"
integer x = 1426
integer y = 1392
integer width = 786
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "DataWindow Services"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_ui_blink from checkbox within w_packager
string tag = "pfw.ui.blink:.*"
integer x = 1760
integer y = 116
integer width = 302
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Blink"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_ui_sciter_ext from checkbox within w_packager
string tag = "pfw.ui.sciter.ext:.*"
integer x = 1097
integer y = 116
integer width = 640
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sciter Extensions"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_ui_sciter from checkbox within w_packager
string tag = "pfw.ui.sciter:.*"
integer x = 795
integer y = 116
integer width = 297
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sciter"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_ui_ext from checkbox within w_packager
string tag = "pfw.ui.controls.ext:.*"
integer x = 247
integer y = 116
integer width = 544
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "UI Extensions"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_ui from checkbox within w_packager
string tag = "pfw.ui:.*|pfw.ui.objects:.*|pfw.ui.controls:.*"
integer x = 55
integer y = 116
integer width = 187
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "UI"
end type

event clicked;parent.Event OnChecked(this)
end event

type st_7 from statictext within w_packager
integer x = 9
integer y = 28
integer width = 2277
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 268435456
string text = "GUI"
boolean focusrectangle = false
end type

type cbx_net_websocket from checkbox within w_packager
string tag = "pfw.net.websocket:.*"
integer x = 1285
integer y = 412
integer width = 448
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "WebSocket"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_net_ftp from checkbox within w_packager
string tag = "pfw.net.ftp:.*"
integer x = 1015
integer y = 412
integer width = 251
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "FTP"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_net_http from checkbox within w_packager
string tag = "pfw.net.http:.*"
integer x = 55
integer y = 412
integer width = 279
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "HTTP"
end type

event clicked;parent.Event OnChecked(this)
end event

type st_6 from statictext within w_packager
integer x = 9
integer y = 324
integer width = 2277
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 268435456
string text = "Network"
boolean focusrectangle = false
end type

type cbx_net_http_ext from checkbox within w_packager
string tag = "pfw.net.http.ext:.*"
integer x = 352
integer y = 412
integer width = 645
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "HTTP Extensions"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_thread_ext from checkbox within w_packager
string tag = "pfw.thread.ext:.*"
integer x = 402
integer y = 604
integer width = 690
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Thread Extensions"
end type

event clicked;parent.Event OnChecked(this)
end event

type st_5 from statictext within w_packager
integer x = 9
integer y = 512
integer width = 2277
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 268435456
string text = "Thread"
boolean focusrectangle = false
end type

type cbx_thread from checkbox within w_packager
string tag = "pfw.thread:.*"
integer x = 55
integer y = 604
integer width = 325
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Thread"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_crypto from checkbox within w_packager
string tag = "pfw.crypto:.*"
integer x = 55
integer y = 800
integer width = 311
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Crypto"
end type

event clicked;parent.Event OnChecked(this)
end event

type st_4 from statictext within w_packager
integer x = 9
integer y = 708
integer width = 2277
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 268435456
string text = "Crypto"
boolean focusrectangle = false
end type

type cbx_utility_barcode from checkbox within w_packager
string tag = "pfw.utility.barcode:.*"
integer x = 992
integer y = 1392
integer width = 416
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Barcode"
end type

event clicked;parent.Event OnChecked(this)
end event

type cb_2 from commandbutton within w_packager
integer x = 3941
integer y = 1716
integer width = 169
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;string sCurrDir,sDefPath,sPath,sFileName
long rtCode

sPath = sle_path.Text
sCurrDir = GetCurrentDirectory()

rtCode = GetFileSaveName("Packeted PBL Path",ref sPath,ref sFileName, "pbl", "PowerBuilder Library File (*.pbl),*.pbl")

ChangeDirectory(sCurrDir)

if rtCode = 1 then
	sle_path.Text = sPath
end if
end event

type st_3 from statictext within w_packager
integer x = 9
integer y = 1608
integer width = 4128
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 268435456
string text = "Build"
boolean focusrectangle = false
end type

type sle_path from singlelineedit within w_packager
integer x = 50
integer y = 1720
integer width = 3858
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "pack\pfw.min.pbl"
borderstyle borderstyle = stylelowered!
end type

type cbx_utility_zip from checkbox within w_packager
string tag = "pfw.utility.zip:n_.*zip"
integer x = 503
integer y = 1392
integer width = 416
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Zip"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_utility_compress from checkbox within w_packager
string tag = "pfw.utility.zip:.*compress.*"
integer x = 55
integer y = 1392
integer width = 416
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Compress"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_utiltiy_cameracapture from checkbox within w_packager
string tag = "pfw.utility.devinfo:u_cameracapture"
integer x = 1426
integer y = 1296
integer width = 617
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Camera Capture"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_utility_devinfo from checkbox within w_packager
string tag = "pfw.utility.devinfo:n_devinfo"
integer x = 992
integer y = 1296
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
string text = "DevInfo"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_utility_compiler from checkbox within w_packager
string tag = "pfw.utility.compiler:.*"
integer x = 503
integer y = 1296
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
string text = "Compiler"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_utility_invoker from checkbox within w_packager
string tag = "pfw.utility.invoker:~~n_cst_eventful"
integer x = 55
integer y = 1296
integer width = 347
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Invoker"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_utility_regexp from checkbox within w_packager
string tag = "pfw.utility.regexp:.*"
integer x = 1426
integer y = 1200
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
string text = "RegExp"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_utility_container from checkbox within w_packager
string tag = "pfw.utility.container:.*"
integer x = 992
integer y = 1200
integer width = 485
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Container"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_common from checkbox within w_packager
string tag = "pfw.common:.*"
integer x = 55
integer y = 1200
integer width = 393
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Common"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_utility_filescanner from checkbox within w_packager
string tag = "pfw.utility:n_filescanner"
integer x = 503
integer y = 1200
integer width = 485
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "File Scanner"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_utility_logger from checkbox within w_packager
string tag = "pfw.utility:n_logger"
integer x = 503
integer y = 1488
integer width = 320
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Logger"
end type

event clicked;parent.Event OnChecked(this)
end event

type st_2 from statictext within w_packager
integer x = 9
integer y = 1100
integer width = 2277
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 268435456
string text = "Utility"
boolean focusrectangle = false
end type

type cbx_parser_sql from checkbox within w_packager
string tag = "pfw.utility.parser:n_sql"
integer x = 617
integer y = 992
integer width = 251
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "SQL"
end type

event clicked;parent.Event OnChecked(this)
end event

type st_1 from statictext within w_packager
integer x = 9
integer y = 904
integer width = 2277
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 268435456
string text = "Parser"
boolean focusrectangle = false
end type

type cbx_parser_xml from checkbox within w_packager
string tag = "pfw.utility.parser:.*xml.*"
integer x = 343
integer y = 992
integer width = 251
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "XML"
end type

event clicked;parent.Event OnChecked(this)
end event

type cbx_parser_json from checkbox within w_packager
string tag = "pfw.utility.parser:.*json"
integer x = 55
integer y = 992
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
string text = "JSON"
end type

event clicked;parent.Event OnChecked(this)
end event

type cb_build from commandbutton within w_packager
integer x = 1563
integer y = 1892
integer width = 759
integer height = 176
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "BUILD"
end type

event clicked;long hFile,nIndex,nCount,nExpIdx,nExpCnt,nPos,nCmpResult
string sPackFilePath,sPBLFiles[],sIncludeExps[],sFileName
string sEntryFullStr,sEntryLine,sEntryName,sEntryType
boolean bIncludePFWBase
checkbox cbx

sPackFilePath = sle_path.Text
if sPackFilePath = "" then return

sIncludeExps[1] = "pfw.shared:.*"

nCount = UpperBound(Control)
for nIndex = 1 to nCount
	if Control[nIndex].TypeOf() <> CheckBox! then continue
	cbx = Control[nIndex]
	if Not cbx.Checked then continue
	nExpCnt = UpperBound(sIncludeExps) + 1
	sIncludeExps[nExpCnt] = Lower(cbx.Tag)
	if Lower(Left(cbx.Tag,4)) = "pfw." and Lower(Left(cbx.Tag,10)) <> "pfw.common" then
		bIncludePFWBase = true
	end if
next
if nExpCnt = 0 then return

if bIncludePFWBase then
	nExpCnt += 1
	sIncludeExps[nExpCnt] = "pfw.base:.*"
end if

FileDelete(sPackFilePath)
FileDelete(Left(sPackFilePath,Len(sPackFilePath) - 3) + "pbd")
if LibraryCreate(sPackFilePath,"PowerFramework~n(c)金千枝（深圳）软件技术有限公司") = -1 then
	MessageBox("错误","创建PBL失败！~n" + sPackFilePath,StopSign!)
	return
end if

/*--- build.bat ---*/
hFile = FileOpen("build.bat",LineMode!,Write!,LockReadWrite!,Replace!)
if hFile = -1 then
	MessageBox("错误","生成脚本失败！",StopSign!)
	return
end if

FileWrite(hFile,'@ECHO OFF')
FileWrite(hFile,'CD /D "%~~dp0"')
FileWrite(hFile,ORCASCR_EXE + ' script.bat || pause')
FileWrite(hFile,'DEL /F /Q script.bat')
FileWrite(hFile,'DEL /F /Q build.bat')

FileClose(hFile)

/*--- script.bat ---*/
hFile = FileOpen("script.bat",LineMode!,Write!,LockReadWrite!,Replace!,EncodingUTF16LE!)
if hFile = -1 then
	MessageBox("错误","生成脚本失败！",StopSign!)
	return
end if

FileWrite(hFile,"start session")

nCount = _wf_Split(GetLibraryList(),",",ref sPBLFiles,true)
for nIndex = 1 to nCount
	sFileName = _wf_GetPathFileName(sPBLFiles[nIndex],false)
	for nExpIdx = 1 to nExpCnt
		if _wf_MatchEntry(sFileName,"",sIncludeExps[nExpIdx]) <> MATCH_ALWAYS_FALSE then exit
	next
	if nExpIdx > nExpCnt then continue
	sEntryFullStr = LibraryDirectoryEx(sPBLFiles[nIndex],DirAll!)
	SetNull(nCmpResult)
	do
		nPos = Pos(sEntryFullStr,"~n")
		if nPos = 0 then exit
		sEntryLine = Left(sEntryFullStr,nPos - 1)
		sEntryName = Left(sEntryLine,Pos(sEntryLine,"~t") - 1)
		sEntryType = Lower(Mid(sEntryLine,LastPos(sEntryLine,"~t") + 1))
		sEntryFullStr = Mid(sEntryFullStr,nPos + 1)
		if nCmpResult = MATCH_ALWAYS_TRUE then
		else
			for nExpIdx = 1 to nExpCnt
				nCmpResult = _wf_MatchEntry(sFileName,sEntryName,sIncludeExps[nExpIdx])
				if nCmpResult = MATCH_TRUE or nCmpResult = MATCH_ALWAYS_TRUE then exit
			next
		end if
		choose case nCmpResult
			case MATCH_TRUE,MATCH_ALWAYS_TRUE
				FileWrite(hFile,Sprintf('copy entry "{1}" {2} {3} "{4}"',sPBLFiles[nIndex],sEntryName,sEntryType,sPackFilePath))
		end choose
	loop while true
next

if cbx_compile.Checked then
	FileWrite(hFile,Sprintf('set liblist "{1};{2}"',PACK_APP_PBD,sPackFilePath))
	FileWrite(hFile,Sprintf('set application "{1}" pfw',PACK_APP_PBD))
	FileWrite(hFile,'build application full')
	FileWrite(hFile,Sprintf('build library "{1}" "" pbd',sPackFilePath))
end if

FileWrite(hFile,"end session")

FileClose(hFile)

//执行
Run('cmd /c "' + _wf_GetAbsolutePath("build.bat") + '"')

end event

type ln_1 from line within w_packager
long linecolor = 33554432
integer linethickness = 4
integer beginx = 2377
integer beginy = 88
integer endx = 2377
integer endy = 1500
end type

