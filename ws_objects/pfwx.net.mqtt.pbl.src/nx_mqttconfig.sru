$PBExportHeader$nx_mqttconfig.sru
forward
global type nx_mqttconfig from nonvisualobject
end type
end forward

global type nx_mqttconfig from nonvisualobject native "pfwx.dll"
public function nx_mqttconfig SetVersion(readonly long ver)
public function nx_mqttconfig SetClientId(readonly string id)
public function nx_mqttconfig SetCredential(readonly string user, readonly string psw)
public function nx_mqttconfig SetCleanSession(readonly boolean clean)
public function nx_mqttconfig SetPersistence(readonly boolean enabled)
public function nx_mqttconfig SetPersistence(readonly string filepath)
public function nx_mqttconfig SetOfflineQueue(readonly boolean enabled)
public function nx_mqttconfig SetAutoReconnect(readonly boolean enabled)
public function nx_httpconfig SetTimeout(readonly double secs)
end type
global nx_mqttconfig nx_mqttconfig

on nx_mqttconfig.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nx_mqttconfig.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on
