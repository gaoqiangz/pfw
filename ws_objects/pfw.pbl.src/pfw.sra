﻿$PBExportHeader$pfw.sra
$PBExportComments$Generated Application Object
forward
global type pfw from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

shared variables

end variables

global variables
string gs_var = "abcd"
end variables

global type pfw from application
string appname = "pfw"
boolean freedblibraries = true
string themepath = "C:\Program Files (x86)\Appeon\Shared\PowerBuilder\theme190"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 2
long richtexteditversion = 1
string richtexteditkey = ""
string appicon = "res\logo.ico"
end type
global pfw pfw

type prototypes

end prototypes

on pfw.create
appname="pfw"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on pfw.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;string lang
n_cst_i18n locale

pfwInitialize(Enums.INIT_FLAG_ENABLE_ALL)

//多语言支持
lang = "en"
choose case lang
	case "en"
		locale = Create n_cst_i18n_en
	case "chs"
		locale = Create n_cst_i18n_chs
	case "cht"
		locale = Create n_cst_i18n_cht
end choose
I18N(locale)

Open(w_demo_selector)
end event

event close;pfwFinalize() 
end event

