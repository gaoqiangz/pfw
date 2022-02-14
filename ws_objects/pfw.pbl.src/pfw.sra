$PBExportHeader$pfw.sra
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
long richtexteditx64type = 3
long richtexteditversion = 1
string richtexteditkey = ""
string appicon = "res\logo.ico"
string appruntimeversion = "21.0.0.1311"
boolean manualsession = false
boolean unsupportedapierror = false
end type
global pfw pfw

type prototypes

end prototypes

forward prototypes
public function integer _of_splitstring (string src, readonly string delimiter, ref string dstarray[])
end prototypes

public function integer _of_splitstring (string src, readonly string delimiter, ref string dstarray[]);long nPos,nLenDelimiter
string str
string emptyArray[]

nLenDelimiter =  Len(delimiter)
if nLenDelimiter = 0 then return 0

dstArray = emptyArray

nPos = Pos(src,delimiter)
do while (nPos > 0)
	str = Left(src,nPos - 1)
	dstArray[UpperBound(dstArray) + 1] = str
	src = Mid(src,nPos + nLenDelimiter)
	nPos = Pos(src,delimiter)
loop
if src <> "" then
	dstArray[UpperBound(dstArray) + 1] = src
end if

return UpperBound(dstArray)
end function

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

event systemerror;long nCount
string sErrInfo,sStackTrace,sMessages[]

if Error.Object = "assert" then
	nCount = _of_SplitString(Error.Text,"~r~n",ref sMessages)
	if nCount >= 2 then
		Error.Number = Long(sMessages[1])
		Error.Text = sMessages[2]
		if nCount = 7 then
			Error.WindowMenu = sMessages[3]
			Error.Object = sMessages[4]
			Error.ObjectEvent = sMessages[5]
			Error.Line = Long(sMessages[6])
			sStackTrace = sMessages[7]
		end if
	end if
end if

sErrInfo = "类型: SYSTEM"+&
					"~n信息: "+Error.Text
if Error.WindowMenu <> Error.Object then
	sErrInfo += "~n窗口: "+Error.WindowMenu
end if
sErrInfo += "~n对象: "+Error.Object
sErrInfo += "~n函数: "+Error.ObjectEvent+&
				"~n行号: "+String(Error.Line)
if sStackTrace <> "" then
	sErrInfo += "~n调用栈:~n"+sStackTrace
end if

MessageBox("系统错误",sErrInfo,StopSign!)

HALT CLOSE
end event

