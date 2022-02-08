$PBExportHeader$n_cst_sciter_traynotification.sru
forward
global type n_cst_sciter_traynotification from nonvisualobject
end type
end forward

global type n_cst_sciter_traynotification from nonvisualobject
end type
global n_cst_sciter_traynotification n_cst_sciter_traynotification

type variables
private:
n_cst_sciter _trayNotification

end variables

forward prototypes
public function long of_notify (string title, string msg, readonly icon ico, readonly double delay)
public function long of_notify (readonly string title, readonly string msg, readonly icon ico)
public function long of_notify (readonly string title, readonly string msg)
public function long of_notify (readonly string msg, readonly icon ico, readonly double delay)
public function long of_notify (readonly string msg, readonly icon ico)
public function long of_notify (readonly string msg)
end prototypes

public function long of_notify (string title, string msg, readonly icon ico, readonly double delay);//====================================================================
// Function: of_notify()
//--------------------------------------------------------------------
// Description: 托盘通知
//--------------------------------------------------------------------
// Arguments:
// 	value   	string	title	
// 	value   	string	msg  	
// 	readonly	icon  	ico  	
// 	readonly	double	delay	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2019-02-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sIcon

if msg = "" then return RetCode.E_INVALID_ARGUMENT

if Not IsValidObject(_trayNotification) then
	_trayNotification = Create n_cst_sciter
	_trayNotification.CreateWindow(Enums.SC_WS_POPUP + Enums.SC_WS_ALPHA + Enums.SC_WS_TOOL,100000,100000,1,1)
	_trayNotification.LoadFile(Res.SCITER_HTML_TRAYNOTIFICATION)
	_trayNotification.Show()
end if
if Not _trayNotification.IsValid() then return RetCode.FAILED

if title = "" then
	choose case ico
		case Information!
			title = "提示"
		case Question!
			title = "询问"
		case Exclamation!
			title = "警告"
		case StopSign!
			title = "错误"
	end choose
end if

choose case ico
	case Exclamation!
		sIcon = "warning"
	case StopSign!
		sIcon = "error"
	case else
		sIcon = "info"
end choose

if Pos(msg,"~n") > 0 then
	msg = ReplaceAll(msg,"~n","<br/>",true)
end if

_trayNotification.InvokeFunction("showMessage",title,msg,sIcon,Long(delay * 1000))

return RetCode.OK
end function

public function long of_notify (readonly string title, readonly string msg, readonly icon ico);return of_Notify(title,msg,ico,0)
end function

public function long of_notify (readonly string title, readonly string msg);return of_Notify(title,msg,Information!,0)
end function

public function long of_notify (readonly string msg, readonly icon ico, readonly double delay);return of_Notify("",msg,ico,delay)
end function

public function long of_notify (readonly string msg, readonly icon ico);return of_Notify("",msg,ico,0)
end function

public function long of_notify (readonly string msg);return of_Notify("",msg,Information!,0)
end function

on n_cst_sciter_traynotification.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_sciter_traynotification.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;if IsValidObject(_trayNotification) then
	_trayNotification.Close()
	Destroy _trayNotification
end if
end event

