$PBExportHeader$nx_httpconfig.sru
forward
global type nx_httpconfig from nonvisualobject
end type
end forward

global type nx_httpconfig from nonvisualobject native "pfwx.dll"
public function nx_httpconfig SetAgent(readonly string val)
public function nx_httpconfig SetDefaultHeader(readonly string key, readonly string val)
public function nx_httpconfig SetCookieStore(readonly boolean enabled)
public function nx_httpconfig SetCookieStore(readonly nx_httpcookie provider)
public function nx_httpconfig SetProxy(readonly string url)
public function nx_httpconfig SetProxy(readonly string url, readonly string user, readonly string psw)
public function nx_httpconfig AddRootCertificate(readonly string pem)
public function nx_httpconfig SetSysRootCertificate(readonly boolean enabled)
public function nx_httpconfig SetCertificate(readonly string pkcs8_pem, readonly string key)
public function nx_httpconfig SetCertificatePKCS12(readonly blob der, readonly string psw)
public function nx_httpconfig AcceptInvalidCert(readonly boolean enabled)
public function nx_httpconfig AcceptInvalidHost(readonly boolean enabled)
public function nx_httpconfig SetTimeout(readonly double secs)
public function nx_httpconfig SetConnectTimeout(readonly double secs)
public function nx_httpconfig SetHttpsOnly(readonly boolean enabled)
public function nx_httpconfig SetConcurrency(readonly ulong max_concurrency)
end type
global nx_httpconfig nx_httpconfig

on nx_httpconfig.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nx_httpconfig.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

