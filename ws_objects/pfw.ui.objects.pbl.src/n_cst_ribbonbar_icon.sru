$PBExportHeader$n_cst_ribbonbar_icon.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_ribbonbar_icon from n_cst_ribbonbar_baseitem
end type
end forward

global type n_cst_ribbonbar_icon from n_cst_ribbonbar_baseitem
unsignedinteger #type = 8
event type boolean oninitdata ( string image,  unsignedinteger width,  unsignedinteger height )
end type
global n_cst_ribbonbar_icon n_cst_ribbonbar_icon

type variables
/*--- Properties ---*/
Public:
PrivateWrite String	#Image
PrivateWrite real		#Width	= Enums.SMALL	//px
PrivateWrite real		#Height	= Enums.SMALL	//px

/*--- Implementation ---*/
Private:
n_imagelist _ImageList

int _imageIndex = 0
end variables

forward prototypes
public function boolean of_hasintermediatemode ()
public function boolean of_hascompactmode ()
public function long of_setimage (readonly string image)
public function long of_setsize (readonly real width, readonly real height)
end prototypes

event type boolean oninitdata(string image, unsignedinteger width, unsignedinteger height);int imageIndex

if width = 0 or height = 0 then return false

_ImageList.SetImageSize(width,height)

imageIndex = _ImageList.AddImage(theme.of_GetItemIcon(this,image,0))

if imageIndex = 0 then return false

#Image = image
_imageIndex = imageIndex

#Width = width
#Height = height

return true
end event

public function boolean of_hasintermediatemode ();return false
end function

public function boolean of_hascompactmode ();return false
end function

public function long of_setimage (readonly string image);int newIndex

if #Image= image then return RetCode.OK

newIndex = _ImageList.AddImage(theme.of_GetItemIcon(this,image,0))

if newIndex = 0 then return RetCode.E_INVALID_IMAGE

#Image = image
_ImageIndex = newIndex

of_Redraw(true)

return RetCode.OK
end function

public function long of_setsize (readonly real width, readonly real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if #Width = width and #Height = height then return RetCode.OK

#Width = width
#Height = height

_ImageList.SetImageSize(#Width,#Height)
of_UpdatePoints()

return RetCode.OK
end function

on n_cst_ribbonbar_icon.create
call super::create
end on

on n_cst_ribbonbar_icon.destroy
call super::destroy
end on

event constructor;call super::constructor;_ImageList = Create n_imagelist

_ImageList.SetImageSize(#Width,#Height)
end event

event destructor;call super::destructor;Destroy _ImageList
end event

event onpaint;call super::onpaint;if AncestorReturnValue = 1 then return 1

_ImageList.Draw(_imageIndex,hdc,&
							rcPaint.left,&
							rcPaint.top,&
							Not of_IsEnabled())

return 1
end event

event oncalclayout;call super::oncalclayout;szLayouts[DPM_LARGE].cx = #Width
if #Height < _layoutHeight then
	szLayouts[DPM_LARGE].cy = #Height
else
	szLayouts[DPM_LARGE].cy = _layoutHeight
end if
szLayouts[DPM_INTERMEDIATE].cx = 0
szLayouts[DPM_INTERMEDIATE].cy = 0
szLayouts[DPM_COMPACT] = szLayouts[DPM_INTERMEDIATE]
end event

