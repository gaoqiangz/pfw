$PBExportHeader$n_cst_i18n_chs.sru
forward
global type n_cst_i18n_chs from ne_cst_i18n
end type
end forward

global type n_cst_i18n_chs from ne_cst_i18n
end type
global n_cst_i18n_chs n_cst_i18n_chs

on n_cst_i18n_chs.create
call super::create
end on

on n_cst_i18n_chs.destroy
call super::destroy
end on

event ontranslate;call super::ontranslate;/*
	source:来源
	category:分类 
	text:待转换的文本
	返回1代表已处理
*/
if source = Enums.I18N_SRC_PFW then return 1
return 0
end event

