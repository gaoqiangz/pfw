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
public function long Publish(readonly nx_mqttmessage msg)
public function long Subscribe(readonly string topicFilter)
public function long Subscribe(readonly string topicFilter,readonly long qos)
public function long Subscribe(readonly string topicFilters[])
public function long Subscribe(readonly string topicFilters[],readonly long qos[])
public function long Unsubscribe(readonly string topicFilter)
public function long Unsubscribe(readonly string topicFilters[])
event OnOpen(boolean reconnect,boolean sessionPresent)
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

