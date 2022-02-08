$PBExportHeader$n_cst_ribbonbar_space.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_ribbonbar_space from n_cst_ribbonbar_baseitem
end type
end forward

global type n_cst_ribbonbar_space from n_cst_ribbonbar_baseitem
unsignedinteger #type = 10
event type boolean oninitdata ( real width,  real height )
end type
global n_cst_ribbonbar_space n_cst_ribbonbar_space

type variables
/*--- Properties ---*/
Public:
PrivateWrite SIZEF #LargeSize
PrivateWrite SIZEF #IntermediateSize
PrivateWrite SIZEF #CompactSize
end variables

forward prototypes
public function boolean of_hascompactmode ()
public function boolean of_hasintermediatemode ()
public function long of_setcompactsize (readonly real width, readonly real height)
public function long of_setintermediatesize (readonly real width, readonly real height)
public function long of_setlargesize (readonly real width, readonly real height)
end prototypes

event type boolean oninitdata(real width, real height);if width < 0 or height < 0 then return false

#LargeSize.cx = width
#LargeSize.cy = height
#IntermediateSize = #LargeSize
#CompactSize = #LargeSize

return true
end event

public function boolean of_hascompactmode ();return (#MinDisplayMode = DPM_COMPACT)
end function

public function boolean of_hasintermediatemode ();return (#MinDisplayMode = DPM_INTERMEDIATE or #MinDisplayMode = DPM_COMPACT)
end function

public function long of_setcompactsize (readonly real width, readonly real height);if width < 0 or height < 0 then return RetCode.E_INVALID_ARGUMENT
if width > #IntermediateSize.cx or height > #IntermediateSize.cy then return RetCode.E_INVALID_ARGUMENT
if #CompactSize.cx = width and #CompactSize.cy = height then return RetCode.OK

#CompactSize.cx = width
#CompactSize.cy = height

of_UpdatePoints()

return RetCode.OK
end function

public function long of_setintermediatesize (readonly real width, readonly real height);if width < 0 or height < 0 then return RetCode.E_INVALID_ARGUMENT
if width > #LargeSize.cx or height > #LargeSize.cy then return RetCode.E_INVALID_ARGUMENT
if width < #CompactSize.cx or height < #CompactSize.cy then return RetCode.E_INVALID_ARGUMENT
if #IntermediateSize.cx = width and #IntermediateSize.cy = height then return RetCode.OK

#IntermediateSize.cx = width
#IntermediateSize.cy = height

of_UpdatePoints()

return RetCode.OK
end function

public function long of_setlargesize (readonly real width, readonly real height);if width < 0 or height < 0 then return RetCode.E_INVALID_ARGUMENT
if width < #IntermediateSize.cx or height < #IntermediateSize.cy then return RetCode.E_INVALID_ARGUMENT
if #LargeSize.cx = width and #LargeSize.cy = height then return RetCode.OK

#LargeSize.cx = width
#LargeSize.cy = height

of_UpdatePoints()

return RetCode.OK
end function

on n_cst_ribbonbar_space.create
call super::create
end on

on n_cst_ribbonbar_space.destroy
call super::destroy
end on

event onhittest;call super::onhittest;return HTNOWHERE
end event

event oncalclayout;call super::oncalclayout;szLayouts[DPM_LARGE] = #LargeSize
szLayouts[DPM_INTERMEDIATE] = #IntermediateSize
szLayouts[DPM_COMPACT] = #CompactSize
end event

