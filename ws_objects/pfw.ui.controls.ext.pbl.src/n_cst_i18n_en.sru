$PBExportHeader$n_cst_i18n_en.sru
forward
global type n_cst_i18n_en from ne_cst_i18n
end type
end forward

global type n_cst_i18n_en from ne_cst_i18n
end type
global n_cst_i18n_en n_cst_i18n_en

type variables
protected:
privatewrite n_xmldoc _doc
end variables

on n_cst_i18n_en.create
call super::create
end on

on n_cst_i18n_en.destroy
call super::destroy
end on

event ontranslate;call super::ontranslate;/*
	source:来源
	category:分类 
	text:待转换的文本
	返回1代表已处理
*/
string sCat,sTo

if source <> Enums.I18N_SRC_PFW then return 0

choose case category
	case Enums.I18N_CAT_WINDOW,Enums.I18N_CAT_DATAWINDOW
		sCat = "window"
	case Enums.I18N_CAT_RIBBONBAR
		sCat = "ribbonbar"
	case Enums.I18N_CAT_SPLITCONTAINER
		sCat = "splitcontainer"
	case Enums.I18N_CAT_TABCONTROL
		sCat = "tabcontrol"
	case CAT_MSGBOX
		sCat = "msgbox"
	case CAT_DWSVC
		sCat = "dwsvc"
end choose

if sCat <> "" then
	//XPATH
	sTo = _doc.Query(Sprintf("string(pfw/{}[@lang='en']/tr[@text='{}']/@to)",sCat,text)).GetValueString( )
	if sTo <> "" then
		text = sTo
		return 1
	end if
end if

/*
choose case category
	case Enums.I18N_CAT_WINDOW,Enums.I18N_CAT_DATAWINDOW
		choose case text
			case "最大化"
				text = "Maximize"
			case "最小化"
				text = "Minimize"
			case "还原"
				text = "Restore"
			case "关闭"
				text = "Close"
			case "窗口列表"
				text = "Window List"
			case "层叠排列"
				text = "Cascade"
			case "平铺排列"
				text = "Layer"
			case "水平排列"
				text = "Tile Horizontal"
			case "垂直排列"
				text = "Tile Vertical"
			case "排列图标"
				text = "Arrange Icons"
			case "关闭所有窗口"
				text = "Close All"
		end choose
	case Enums.I18N_CAT_RIBBONBAR
		choose case text
			case "折叠功能区"
				text = "Collapse"
			case "展开功能区"
				text = "Expand"
		end choose
	case Enums.I18N_CAT_SPLITCONTAINER
		choose case text
			case "双击折叠左侧面板"
				text = "Double-click to collapse the left panel"
			case "双击折叠右侧面板"
				text = "Double-click to collapse the right panel"
			case "双击折叠上侧面板"
				text = "Double-click to collapse the top panel"
			case "双击折叠下侧面板"
				text = "Double-click to collapse the bottom panel"
			case "双击展开左侧面板"
				text = "Double-click to expand the left panel"
			case "双击展开右侧面板"
				text = "Double-click to expand the right panel"
			case "双击展开上侧面板"
				text = "Double-click to expand the top panel"
			case "双击展开下侧面板"
				text = "Double-click to expand the bottom panel"
			case "展开左侧面板"
				text = "Expand the left panel"
			case "展开右侧面板"
				text = "Expand the right panel"
			case "展开上侧面板"
				text = "Expand the top panel"
			case "展开下侧面板"
				text = "Expand the bottom panel"
		end choose
	case Enums.I18N_CAT_TABCONTROL
		if text = "固定" then
			text = "Dock"
		end if
	case CAT_MSGBOX
		choose case text
			case "提示"
				text = "Information"
			case "询问"
				text = "Question"
			case "警告"
				text = "Warning"
			case "错误"
				text = "Error"
			case "确定"
				text = "OK"
			case "取消"
				text = "Cancel"
			case "是"
				text = "Yes"
			case "否"
				text = "No"
			case "中止"
				text = "Abort"
			case "重试"
				text = "Retry"
			case "忽略"
				text = "Ignore"
			case "查看详情"
				text = "Show details"
			case "隐藏"
				text = "Hide details"
		end choose
end choose
*/

return 0
end event

event constructor;call super::constructor;_doc = Create n_xmldoc
_doc.LoadFile("pfw.i18n.xml")
end event

event destructor;call super::destructor;Destroy _doc
end event

