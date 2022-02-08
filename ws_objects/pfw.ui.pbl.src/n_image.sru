$PBExportHeader$n_image.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_image from nonvisualobject
end type
end forward

global type n_image from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean ShareImage(readonly boolean shareimage)
public function boolean IsSharedImage()
public function boolean Load( readonly string imagename)
public function boolean SetImageSize(readonly real width,readonly real height)
public function real GetWidth()
public function real GetHeight()
public function string GetImageName()
public function uint GetFrameCount()
public function uint GetLoopCount()
public function uint GetFrame()
public function uint GetFrameDelayTime(readonly uint frame)
public function boolean SetFrame(readonly uint frame)
public function boolean NextFrame()
public function boolean IsPlaying()
public function boolean IsFrameChanged()
public function boolean Draw(readonly unsignedlong hdcdst, readonly real x, readonly real y, readonly boolean gray)
public function boolean DrawEx(readonly unsignedlong hdcdst, readonly real x, readonly real y, readonly real width, readonly real height, readonly boolean gray)
end type
global n_image n_image

on n_image.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_image.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

