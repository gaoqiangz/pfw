$PBExportHeader$n_cst_autoinit.sru
forward
global type n_cst_autoinit from n_initializer
end type
end forward

global type n_cst_autoinit from n_initializer autoinstantiate
boolean #sciter = true
boolean #blink = true
boolean #orca = true
end type

on n_cst_autoinit.create
call super::create
end on

on n_cst_autoinit.destroy
call super::destroy
end on

