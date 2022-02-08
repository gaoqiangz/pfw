$PBExportHeader$n_wsclient.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_wsclient from nonvisualobject
end type
end forward

global type n_wsclient from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean IsOpen()
public function boolean IsClosed()
public function boolean IsPending()
public function boolean IsReconnecting()
public function long GetState()
public function long SetAutoReconnect(readonly boolean auto)
public function boolean IsAutoReconnect()
public function long SetAgent(readonly string name)
public function string GetAgent()
public function long SetTimeout(readonly long sec)
public function long GetTimeout()
public function long SetHeader(readonly string name,readonly string value)
public function string GetHeader(readonly string name)
public function string GetHeaderName(readonly int index)
public function string GetHeaderValue(readonly int index)
public function int GetHeaderCount()
public function string GetHeaders()
public function long SetProxyAddress(readonly string address)
public function string GetProxyAddress()
public function long SetProxyCredential(readonly string user,readonly string psw)
public function long GetProxyCredential(ref string user,ref string psw)
public function long SetCA(readonly long ntype,readonly string ca)
public function string GetCA()
public function long SetCert(readonly long ntype,readonly string cert)
public function long SetCert(readonly long ntype,readonly string cert,readonly string psw)
public function string GetCert()
public function long SetCertKey(readonly long ntype,readonly string key)
public function string GetCertKey()
public function long SetValidateServer(readonly boolean validate)
public function boolean IsValidateServer()
public function long SetValidateHost(readonly boolean validate)
public function boolean IsValidateHost()
public function long Open(readonly string url)
public function long Open(readonly string url,readonly n_json mqttParams)
public function long Close()
public function long Close(readonly boolean wait)
public function long Send(readonly string data)
public function long Send(readonly blob data)
public function long Send(readonly n_json data)
public function long Send(readonly n_xmldoc data)
public function long Publish(readonly string topic)
public function long Publish(readonly string topic,readonly long qos)
public function long Publish(readonly string topic,readonly long qos,readonly boolean retain)
public function long Publish(readonly string topic,readonly string data)
public function long Publish(readonly string topic,readonly string data,readonly long qos)
public function long Publish(readonly string topic,readonly string data,readonly long qos,readonly boolean retain)
public function long Publish(readonly string topic,readonly blob data)
public function long Publish(readonly string topic,readonly blob data,readonly long qos)
public function long Publish(readonly string topic,readonly blob data,readonly long qos,readonly boolean retain)
public function long Publish(readonly string topic,readonly n_json data)
public function long Publish(readonly string topic,readonly n_json data,readonly long qos)
public function long Publish(readonly string topic,readonly n_json data,readonly long qos,readonly boolean retain)
public function long Publish(readonly string topic,readonly n_xmldoc data)
public function long Publish(readonly string topic,readonly n_xmldoc data,readonly long qos)
public function long Publish(readonly string topic,readonly n_xmldoc data,readonly long qos,readonly boolean retain)
public function long Subscribe(readonly string topicFilter)
public function long Subscribe(readonly string topicFilter,readonly long qos)
public function long Subscribe(readonly string topicFilters[])
public function long Subscribe(readonly string topicFilters[],readonly long qos[])
public function long Unsubscribe(readonly string topicFilter)
public function long Unsubscribe(readonly string topicFilters[])
event type long OnOpen ( boolean reconnect,boolean sessionPresent )
event type long OnClose (long code, string info)
event type long OnError (long code, string info)
event type long OnMessage (n_wsmessage msg)
end type
global n_wsclient n_wsclient

on n_wsclient.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_wsclient.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

