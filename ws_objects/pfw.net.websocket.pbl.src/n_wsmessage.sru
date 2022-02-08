$PBExportHeader$n_wsmessage.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_wsmessage from nonvisualobject
end type
end forward

global type n_wsmessage from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean IsValid()
public function boolean IsText()
public function boolean IsBinary()
public function boolean IsRetained()
public function string GetTopic()
public function long GetQoS()
public function blob GetData()
public function string GetDataString()
public function n_json GetDataJSON()
public function n_xmldoc GetDataXML()
end type
global n_wsmessage n_wsmessage

on n_wsmessage.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_wsmessage.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

