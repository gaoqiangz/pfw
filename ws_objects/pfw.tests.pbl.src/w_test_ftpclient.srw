$PBExportHeader$w_test_ftpclient.srw
forward
global type w_test_ftpclient from window
end type
type cb_3 from commandbutton within w_test_ftpclient
end type
type cb_2 from commandbutton within w_test_ftpclient
end type
type cb_1 from commandbutton within w_test_ftpclient
end type
end forward

global type w_test_ftpclient from window
integer width = 2903
integer height = 2040
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_test_ftpclient w_test_ftpclient

on w_test_ftpclient.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_test_ftpclient.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cb_3 from commandbutton within w_test_ftpclient
integer x = 1458
integer y = 536
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CreateDir"
end type

event clicked;int i
n_ftpclient ftpClient

for i = 1 to 100
	ftpClient = Create n_ftpclient
	ftpClient.SetMode(Enums.FTP_MODE_PASSIVE)
	ftpClient.SetRoot("ftp://ftp.jqzms.com")
	ftpClient.SetCredential("jmp","jpupr34#,^8,?2s")
	ftpClient.ConnectRoot()
	ftpClient.CreateDir("DIR_" + String(i))
	ftpClient.RemoveDir("DIR_" + String(i))
	ftpClient.DisconnectRoot()
	Destroy ftpClient
next
end event

type cb_2 from commandbutton within w_test_ftpclient
integer x = 594
integer y = 1116
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;n_ftpclient ftpClient

ftpClient = Create n_ftpclient
//ftpClient.SetMode(Enums.FTP_MODE_ACTIVE)
ftpClient.SetAgent("Mozilla Firefox")
//root url如果带路径，为连接之后的初始目录
ftpClient.SetRoot("ftp://47.105.158.198")
ftpClient.SetCredential("Mark","111111")
ftpClient.ConnectRoot()
ftpClient.SetCurrentDir("F01")
messagebox("B2",ftpClient.IsDirExists("B2"))
messagebox("",ftpClient.GetLastErrorInfo())
messagebox("",ftpClient.IsFileExists("dsds"))
ftpClient.DisconnectRoot()
Destroy ftpClient
end event

type cb_1 from commandbutton within w_test_ftpclient
integer x = 114
integer y = 428
integer width = 498
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "DownloadFile"
end type

event clicked;FtpDownload("ftp://ftp.adobe.com/pub/adobe/cs6/downloads/DesignStandard_CS6_LS6.exe","d:\DesignStandard_CS6_LS6.exe")

//与下面的代码等价

/*n_ftpclient ftpClient

ftpClient = Create n_ftpclient
//ftpClient.SetMode(Enums.FTP_MODE_ACTIVE)
ftpClient.SetAgent("Mozilla Firefox")
//root url如果带路径，为连接之后的初始目录
ftpClient.SetRoot("ftp://ftp.adobe.com/pub/adobe/cs6/downloads")
//ftpClient.SetCredential("user","psw")
ftpClient.ConnectRoot()
//ftpClient.SetCurrentDir("pub/adobe/cs6/downloads/")
//Messagebox("",ftpClient.GetCurrentDir())
ftpClient.DownloadFile("DesignStandard_CS6_LS6.exe","d:\DesignStandard_CS6_LS6.exe")
ftpClient.DisconnectRoot()
Destroy ftpClient*/

end event

