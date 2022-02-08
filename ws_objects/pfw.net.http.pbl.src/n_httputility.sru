$PBExportHeader$n_httputility.sru
$PBExportComments$PowerBuilder Extension~r~nBy gaoqiangz@msn.com
forward
global type n_httputility from nonvisualobject
end type
end forward

global type n_httputility from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function blob StringToBlob(readonly string data,readonly long encoding)
public function blob StringToBlob(readonly string data,readonly long encoding,readonly boolean includentc)
public function string BlobToString(readonly blob data,readonly long encoding)
public function string UrlEncode(readonly string url)
public function string UrlEncode(readonly string url,readonly long encoding)
public function string UrlEncode(readonly string url,readonly long encoding,readonly boolean uppercase)
public function string UrlDecode(readonly string url)
public function string UrlDecode(readonly string url,readonly long encoding)
end type
global n_httputility n_httputility

on n_httputility.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_httputility.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

