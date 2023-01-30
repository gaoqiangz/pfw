$PBExportHeader$nx_mqttmessage.sru
forward
global type nx_mqttmessage from nonvisualobject
end type
end forward

global type nx_mqttmessage from nonvisualobject native "pfwx.dll"
public function boolean IsValid()
public function long SetRetained(boolean retain)
public function boolean IsRetained()
public function long SetTopic(string topic)
public function string GetTopic()
public function long SetQoS(long qos)
public function long GetQoS()
public function long SetData(readonly blob data)
public function long SetData(readonly string data)
public function long SetData(readonly string data, readonly long encoding)
public function long SetData(readonly nonvisualobject json_or_xml)
public function blob GetData()
public function string GetDataString()
public function string GetDataString(readonly long encoding)
public function nonvisualobject GetDataJSON()
public function nonvisualobject GetDataJSON(readonly long encoding)
public function nonvisualobject GetDataXML()
public function nonvisualobject GetDataXML(readonly long encoding)
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

