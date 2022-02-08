$PBExportHeader$n_cst_taskpanelbar_space.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_taskpanelbar_space from n_cst_taskpanelbar_baseitem
end type
end forward

global type n_cst_taskpanelbar_space from n_cst_taskpanelbar_baseitem
unsignedinteger #type = 10
event type boolean oninitdata ( real width,  real height )
end type
global n_cst_taskpanelbar_space n_cst_taskpanelbar_space

type variables
/*--- Properties ---*/
Public:
PrivateWrite real #Width
PrivateWrite real #Height
end variables

forward prototypes
public function long of_setsize (readonly real width, readonly real height)
end prototypes

event type boolean oninitdata(real width, real height);if width < 0 or height < 0 then return false

#Width = width
#Height = height

return true
end event

public function long of_setsize (readonly real width, readonly real height);if width < 0 or height < 0 then return RetCode.E_INVALID_ARGUMENT
if #Width = width and #Height = height then return RetCode.OK

#Width = width
#Height = height

of_UpdatePoints()

return RetCode.OK
end function

on n_cst_taskpanelbar_space.create
call super::create
end on

on n_cst_taskpanelbar_space.destroy
call super::destroy
end on

event onhittest;call super::onhittest;return HTNOWHERE
end event

event onupdatelayout;call super::onupdatelayout;if AncestorReturnValue = 1 then return 1
_of_RecalcLayout()
return 0
end event

event oncalclayout;call super::oncalclayout;szLayout.cx = #Width
szLayout.cy = #Height
end event

