$PBExportHeader$nx_mqttclient.sru
forward
global type nx_mqttclient from nonvisualobject
end type
end forward

global type nx_mqttclient from nonvisualobject native "pfwx.dll"
public function boolean IsOpen()
public function boolean IsClosed()
public function long Open(readonly string urls)
public function long Open(readonly string urls,readonly nx_mqttconfig cfg)
public function long Close()
public function long Publish(readonly string topic)
public function long Publish(readonly string topic,readonly long qos)
public function long Publish(readonly string topic,readonly long qos,readonly boolean retain)
public function long Publish(readonly string topic,readonly string data)
public function long Publish(readonly string topic,readonly string data,readonly long qos)
public function long Publish(readonly string topic,readonly string data,readonly long qos,readonly boolean retain)
public function long Publish(readonly string topic,readonly blob data)
public function long Publish(readonly string topic,readonly blob data,readonly long qos)
public function long Publish(readonly string topic,readonly blob data,readonly long qos,readonly boolean retain)
public function long Publish(readonly string topic,readonly nonvisualobject json_or_xml)
public function long Publish(readonly string topic,readonly nonvisualobject json_or_xml,readonly long qos)
public function long Publish(readonly string topic,readonly nonvisualobject json_or_xml,readonly long qos,readonly boolean retain)
public function long Subscribe(readonly string topicFilter)
public function long Subscribe(readonly string topicFilter,readonly long qos)
public function long Subscribe(readonly string topicFilters[])
public function long Subscribe(readonly string topicFilters[],readonly long qos[])
public function long Unsubscribe(readonly string topicFilter)
public function long Unsubscribe(readonly string topicFilters[])
event OnOpen(boolean reconnect)
event OnClose(long code, string info)
event OnError(long code, string info)
event OnMessage(nx_mqttmessage msg)
end type
global nx_mqttclient nx_mqttclient

on nx_mqttclient.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nx_mqttclient.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

