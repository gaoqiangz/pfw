$PBExportHeader$n_ftpclient.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_ftpclient from nonvisualobject
end type
end forward

global type n_ftpclient from nonvisualobject native "pfw.dll"
public function string CopyRight()
public function string GetVersion()
public function ulong GetLastError()
public function string GetLastErrorInfo()
public function long SetCancelEvent(readonly ulong hevent)
public function long SetTransCallback(readonly boolean enabled)
public function long SetMode(readonly long mode)
public function long GetMode()
public function long SetAgent(readonly string name)
public function string GetAgent()
public function long SetTimeout(readonly long sec)
public function long GetTimeout()
public function long SetRoot(readonly string root)
public function string GetRoot()
public function long SetCredential(readonly string name,readonly string psw)
public function long GetCredential(ref string user,ref string psw)
public function long ConnectRoot()
public function long DisconnectRoot()
public function boolean IsConnected()
public function boolean TestConnection()
public function long SetCurrentDir(readonly string dir)
public function string GetCurrentDir()
public function long List(ref string list[],readonly long flags)
public function boolean IsDirExists(readonly string dir)
public function boolean IsFileExists(readonly string name)
public function long CreateDir(readonly string dir)
public function long CompareFile(readonly string remotename,readonly string localfile,readonly long flags)
public function long DownloadFile(readonly string remotename,readonly string localfile)
public function long UploadFile(readonly string localfile,readonly string remotename)
public function long RenameFile(readonly string name,readonly string newname)
public function long RemoveFile(readonly string name)
public function long RemoveDir(readonly string dir)
event type long OnTransData(long totalsize,long transsize,long speed)
end type
global n_ftpclient n_ftpclient

on n_ftpclient.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_ftpclient.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

