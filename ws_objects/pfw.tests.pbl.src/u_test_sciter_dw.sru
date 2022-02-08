$PBExportHeader$u_test_sciter_dw.sru
forward
global type u_test_sciter_dw from datawindow
end type
end forward

global type u_test_sciter_dw from datawindow
integer width = 920
integer height = 624
end type
global u_test_sciter_dw u_test_sciter_dw

type variables
n_scitervalue fnItemChanged
end variables

forward prototypes
public function long of_registeritemchanged (readonly n_scitervalue fn)
end prototypes

public function long of_registeritemchanged (readonly n_scitervalue fn);fnItemChanged = fn
return 0
end function

on u_test_sciter_dw.create
end on

on u_test_sciter_dw.destroy
end on

event itemchanged;if Not IsValidObject(fnItemChanged) then return 0

//转发ItemChanged事件给JS
return Long(fnItemChanged.Invoke(row,dwo.Name,data))
end event

