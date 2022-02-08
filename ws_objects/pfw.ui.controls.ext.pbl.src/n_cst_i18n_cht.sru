$PBExportHeader$n_cst_i18n_cht.sru
forward
global type n_cst_i18n_cht from ne_cst_i18n
end type
end forward

global type n_cst_i18n_cht from ne_cst_i18n
end type
global n_cst_i18n_cht n_cst_i18n_cht

type variables
protected:
privatewrite n_xmldoc _doc
end variables

on n_cst_i18n_cht.create
call super::create
end on

on n_cst_i18n_cht.destroy
call super::destroy
end on

event ontranslate;call super::ontranslate;/*
	source:来源
	category:分类 
	text:待转换的文本
	返回1代表已处理
*/
string sCat,sTo
n_xmlqueryresult xqs

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
	sTo = _doc.Query(Sprintf("string(pfw/{}[@lang='cht']/tr[@text='{}']/@to)",sCat,text)).GetValueString( )
	if sTo <> "" then
		text = sTo
		return 1
	end if
end if

return 0
end event

event constructor;call super::constructor;_doc = Create n_xmldoc
_doc.LoadFile("pfw.i18n.xml")
end event

event destructor;call super::destructor;Destroy _doc
end event

