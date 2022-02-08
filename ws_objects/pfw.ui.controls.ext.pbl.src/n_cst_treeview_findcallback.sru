$PBExportHeader$n_cst_treeview_findcallback.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_treeview_findcallback from nonvisualobject
end type
end forward

global type n_cst_treeview_findcallback from nonvisualobject
event type boolean onPredicate ( treeviewitem item,  any param )
end type
global n_cst_treeview_findcallback n_cst_treeview_findcallback

on n_cst_treeview_findcallback.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_treeview_findcallback.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

