$PBExportHeader$n_qrcode.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_qrcode from nonvisualobject
end type
end forward

global type n_qrcode from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function long SetVer(readonly long ver)
public function long GetVer()
public function long GetVer(readonly boolean actual)
public function long SetEcc(readonly long ecl)
public function long GetEcc()
public function long GetEcc(readonly boolean actual)
public function long SetBorderMargin(readonly int margin)
public function int GetBorderMargin()
public function long SetBackColor(readonly ulong color)
public function ulong GetBackColor()
public function long SetColor(readonly ulong color)
public function ulong GetColor()
public function long SetLogo(readonly string uri)
public function string GetLogo()
public function long SetLogoBkgnd(readonly boolean bkgnd)
public function long SetLogoBkgnd(readonly boolean bkgnd,readonly ulong color)
public function long SetLogoBorder(readonly boolean border)
public function long SetLogoBorder(readonly boolean border,readonly ulong color)
public function long SetUnit(readonly long unit)
public function long GetUnit()
public function long SetSize(readonly real size)
public function real GetSize()
public function long Encode(readonly string data)
public function long Encode(readonly blob data)
public function long Reset()
public function long SaveFile(readonly string filename)
public function long SaveClipboard()
public function string GenSvgString()
public function string GenSvgString(readonly long ntype)
public function string GenDataString()
public function string GenDataString(readonly long ntype)
public function long Draw(readonly ulong hdc,readonly real x,readonly real y)
end type
global n_qrcode n_qrcode

on n_qrcode.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_qrcode.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

