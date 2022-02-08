$PBExportHeader$n_sqliterecordset.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_sqliterecordset from nonvisualobject
end type
end forward

global type n_sqliterecordset from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean IsValid()
public function boolean IsEmpty()
public function boolean HasData()
public function boolean NextRow()
public function long GetColumnCount()
public function long GetColumnID(readonly string col)
public function string GetColumnName(readonly long col)
public function string GetColumnDBName(readonly long col)
public function string GetColumnDBName(readonly string col)
public function string GetColumnDataType(readonly long col)
public function string GetColumnDataType(readonly string col)
public function long GetColumnType(readonly long col)
public function long GetColumnType(readonly string col)
public function string GetColumnString(readonly long col)
public function string GetColumnString(readonly string col)
public function decimal GetColumnDecimal(readonly long col)
public function decimal GetColumnDecimal(readonly string col)
public function double GetColumnNumber(readonly long col)
public function double GetColumnNumber(readonly string col)
public function long GetColumnLong(readonly long col)
public function long GetColumnLong(readonly string col)
public function datetime GetColumnDateTime(readonly long col)
public function datetime GetColumnDateTime(readonly string col)
public function date GetColumnDate(readonly long col)
public function date GetColumnDate(readonly string col)
public function time GetColumnTime(readonly long col)
public function time GetColumnTime(readonly string col)
public function blob GetColumnBlob(readonly long col)
public function blob GetColumnBlob(readonly string col)
public function any GetColumnData(readonly long col)
public function any GetColumnData(readonly string col)
end type
global n_sqliterecordset n_sqliterecordset

on n_sqliterecordset.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_sqliterecordset.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

