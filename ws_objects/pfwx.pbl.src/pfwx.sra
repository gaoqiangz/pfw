$PBExportHeader$pfwx.sra
$PBExportComments$Generated Application Object
forward
global type pfwx from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type pfwx from application
string appname = "pfwx"
string themepath = "C:\Program Files (x86)\Appeon\Shared\PowerBuilder\theme190"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 2
long richtexteditversion = 1
string richtexteditkey = ""
string appicon = ""
end type
global pfwx pfwx

type prototypes

end prototypes

on pfwx.create
appname="pfwx"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on pfwx.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;Open(wx_test_httpclient)
//Open(wx_test_mqttclient)
end event

event close;pfwxFinalize()
end event

