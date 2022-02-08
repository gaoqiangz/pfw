$PBExportHeader$u_cameracapture.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cameracapture from userobject
end type
end forward

global type u_cameracapture from userobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function int GetDeviceCount()
public function string GetDeviceName(readonly int devindex)
public function string GetDeviceSymbolicLink(readonly int devindex)
public function int GetDeviceResolutions(readonly int devindex,ref ulong dimensions[])
public function long Open(readonly int devindex,readonly long nwidth,readonly long nheight)
public function long	Close()
public function boolean	IsConnected()
public function long GetVideoWidth()
public function long GetVideoHeight()
public function long	ShowSettingWindow()
public function long ShowVideoInfo(readonly boolean bshow)
public function long	SaveFrame(readonly string filename)
public function blob	SaveFrame(readonly long format)
event type long OnDeviceInterrupted()
event type long OnDeviceChanged()
integer width = 1298
integer height = 860
end type
global u_cameracapture u_cameracapture

on u_cameracapture.create
end on

on u_cameracapture.destroy
end on

