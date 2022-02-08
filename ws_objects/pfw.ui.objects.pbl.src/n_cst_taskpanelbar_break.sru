$PBExportHeader$n_cst_taskpanelbar_break.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_taskpanelbar_break from n_cst_taskpanelbar_baseitem
end type
end forward

global type n_cst_taskpanelbar_break from n_cst_taskpanelbar_baseitem
unsignedinteger #type = 11
end type
global n_cst_taskpanelbar_break n_cst_taskpanelbar_break

on n_cst_taskpanelbar_break.create
call super::create
end on

on n_cst_taskpanelbar_break.destroy
call super::destroy
end on

event onhittest;call super::onhittest;return HTNOWHERE
end event

