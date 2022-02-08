$PBExportHeader$ne_cst_i18n.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type ne_cst_i18n from n_cst_i18n
end type
end forward

global type ne_cst_i18n from n_cst_i18n
end type
global ne_cst_i18n ne_cst_i18n

type variables
/*--- Constants ---*/
Public:
//Category
Constant Long CAT_MSGBOX	= Enums.I18N_CAT_CUSTOM + 1
Constant Long CAT_DWSVC		= Enums.I18N_CAT_CUSTOM + 2
end variables

on ne_cst_i18n.create
call super::create
end on

on ne_cst_i18n.destroy
call super::destroy
end on

