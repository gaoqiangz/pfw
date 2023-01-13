$PBExportHeader$nx_mqttmessage.sru
forward
global type nx_mqttmessage from nonvisualobject
end type
end forward

global type nx_mqttmessage from nonvisualobject native "pfwx.dll"
public function boolean IsValid()
public function boolean IsRetained()
public function string GetTopic()
public function long GetQoS()
public function blob GetData()
public function string GetDataString()
end type
global nx_mqttmessage nx_mqttmessage

on nx_mqttmessage.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nx_mqttmessage.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

