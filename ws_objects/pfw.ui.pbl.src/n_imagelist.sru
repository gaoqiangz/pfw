$PBExportHeader$n_imagelist.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_imagelist from nonvisualobject
end type
end forward

global type n_imagelist from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean ShareImage(readonly boolean shareimage)
public function boolean IsSharedImage()
public function boolean SetImageSize(readonly real width,readonly real height)
public function real GetWidth()
public function real GetHeight()
public function integer AddImage(readonly string imagename)
public function integer AddHIcon(readonly ulong hicon)
public function integer AddHBitmap(readonly ulong hbitmap)
public function integer AddHBitmap(readonly ulong hbitmap,readonly ulong maskcolor)
public function integer GetIndex(readonly string imagename)
public function integer GetIndex(readonly ulong himage)
public function integer GetCount()
public function string GetImage(readonly integer index)
public function ulong GetHIcon(readonly integer index)
public function ulong GetHBitmap(readonly integer index)
public function boolean Draw(readonly integer index, readonly unsignedlong hdcdst, readonly real x, readonly real y, readonly boolean gray)
public function boolean DrawEx(readonly integer index, readonly unsignedlong hdcdst, readonly real x, readonly real y, readonly real width, readonly real height, readonly boolean gray)
end type
global n_imagelist n_imagelist

on n_imagelist.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_imagelist.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

