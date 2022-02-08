$PBExportHeader$n_barcode.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_barcode from nonvisualobject
end type
end forward

global type n_barcode from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function long SetType(readonly string stype)
public function string GetType()
public function long SetOption(readonly int option,readonly long val)
public function long GetOption(readonly int option)
public function long ShowText(readonly boolean showtext)
public function long SetText(readonly string text)
public function string GetText()
public function long SetBorderMargin(readonly int margin)
public function int GetBorderMargin()
public function long SetBackColor(readonly ulong color)
public function ulong GetBackColor()
public function long SetColor(readonly ulong color)
public function ulong GetColor()
public function long SetUnit(readonly long unit)
public function long GetUnit()
public function long SetSize(readonly real width,readonly real height)
public function long GetSize(ref real width,ref real height)
public function long GetSize(ref real width,ref real height,readonly boolean actual)
public function long Rotate(readonly int angle)
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
global n_barcode n_barcode

on n_barcode.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_barcode.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

