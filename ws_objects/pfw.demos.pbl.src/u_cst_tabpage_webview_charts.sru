$PBExportHeader$u_cst_tabpage_webview_charts.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_webview_charts from ue_cst_tabpage
end type
type st_1 from statictext within u_cst_tabpage_webview_charts
end type
type uo_editor from u_cst_webview within u_cst_tabpage_webview_charts
end type
type cb_refresh from se_cst_button within u_cst_tabpage_webview_charts
end type
type uo_webview from u_cst_webview within u_cst_tabpage_webview_charts
end type
type uo_splitcontainer from ue_cst_splitcontainer within u_cst_tabpage_webview_charts
end type
end forward

global type u_cst_tabpage_webview_charts from ue_cst_tabpage
integer width = 3424
integer height = 1652
st_1 st_1
uo_editor uo_editor
cb_refresh cb_refresh
uo_webview uo_webview
uo_splitcontainer uo_splitcontainer
end type
global u_cst_tabpage_webview_charts u_cst_tabpage_webview_charts

forward prototypes
public subroutine of_refresh ()
end prototypes

public subroutine of_refresh ();if uo_editor.EvaluateSync("hasEditorError()") = "true" then return

uo_webview.Evaluate(uo_editor.EvaluateSync("editor.getValue()"))
uo_webview.Evaluate("refresh()")
end subroutine

on u_cst_tabpage_webview_charts.create
int iCurrent
call super::create
this.st_1=create st_1
this.uo_editor=create uo_editor
this.cb_refresh=create cb_refresh
this.uo_webview=create uo_webview
this.uo_splitcontainer=create uo_splitcontainer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.uo_editor
this.Control[iCurrent+3]=this.cb_refresh
this.Control[iCurrent+4]=this.uo_webview
this.Control[iCurrent+5]=this.uo_splitcontainer
end on

on u_cst_tabpage_webview_charts.destroy
call super::destroy
destroy(this.st_1)
destroy(this.uo_editor)
destroy(this.cb_refresh)
destroy(this.uo_webview)
destroy(this.uo_splitcontainer)
end on

event onpreopen;call super::onpreopen;uo_splitcontainer.#LockUpdate = true

uo_splitcontainer.of_SetOrientation(Enums.VERT)
uo_splitcontainer.Panel1.of_BindObject(uo_editor)
uo_splitcontainer.Panel2.of_BindObject(uo_webview)

uo_splitcontainer.Panel1.of_SetSize(0.3)

uo_splitcontainer.#LockUpdate = false
uo_splitcontainer.of_UpdatePoints()
end event

event resize;call super::resize;uo_splitcontainer.Move(0,uo_splitcontainer.y)
uo_splitcontainer.Resize(newWidth,newHeight - uo_splitcontainer.y)
end event

event onopen;call super::onopen;constant string HTML = '<html>'+&
									'<head>'+&
										'<script src="tests/webview/echarts/echarts.min.js"></script>'+&
										'<style>'+&
											'html,body,#main {'+&
												 'width: 100%;'+&
												 'height: 100%;'+&
												 'margin: 0;'+&
											'} '+&
											'#main {'+&
												 'background: #fff;'+&
											'}'+&
										'</style>'+&
									'</head>'+&
									'<body>'+&
										'<div id="main"></div>'+&
									'</body>'+&
									'<script type="text/javascript">'+&
										'var chart = null;'+&
										'var option = null;'+&
										'window.onresize = function() {'+&
											  'chart && chart.resize();'+&
										'};'+&
										'function refresh() {'+&
											'if(chart) chart.dispose();'+&
											'chart = echarts.init(document.getElementById("main"));'+&
											'option && chart.setOption(option);'+&
										'}~n'+&
										'refresh();'+&
									'</script>'+&
								'</html>'
								
uo_webview.LoadHtmlSync(HTML, GetCurrentDirectory() /* baseUrl */)
uo_editor.LoadFileSync("tests\webview\echarts\editor.html")
of_Refresh()
end event

type st_1 from statictext within u_cst_tabpage_webview_charts
integer x = 411
integer y = 44
integer width = 2190
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "文档见：http://echarts.baidu.com/examples/"
boolean focusrectangle = false
end type

type uo_editor from u_cst_webview within u_cst_tabpage_webview_charts
integer y = 144
integer width = 942
integer height = 1504
integer taborder = 30
end type

on uo_editor.destroy
call u_cst_webview::destroy
end on

type cb_refresh from se_cst_button within u_cst_tabpage_webview_charts
integer x = 18
integer y = 8
integer width = 379
integer height = 124
integer taborder = 20
string text = "刷新"
end type

event clicked;call super::clicked;of_Refresh()
end event

type uo_webview from u_cst_webview within u_cst_tabpage_webview_charts
integer x = 951
integer y = 152
integer width = 2482
integer height = 1496
integer taborder = 20
end type

on uo_webview.destroy
call u_cst_webview::destroy
end on

event onengineerror;call super::onengineerror;MessageBox("OnEngineError",reason)
end event

type uo_splitcontainer from ue_cst_splitcontainer within u_cst_tabpage_webview_charts
integer y = 136
integer width = 3438
integer height = 1532
integer taborder = 20
end type

on uo_splitcontainer.destroy
call ue_cst_splitcontainer::destroy
end on

