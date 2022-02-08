$PBExportHeader$n_imgcodec.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_imgcodec from nonvisualobject
end type
end forward

global type n_imgcodec from nonvisualobject
end type
global n_imgcodec n_imgcodec

on n_imgcodec.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_imgcodec.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

