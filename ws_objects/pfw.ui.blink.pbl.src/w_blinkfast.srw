$PBExportHeader$w_blinkfast.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type w_blinkfast from window
end type
end forward

global type w_blinkfast from window
integer width = 1861
integer height = 1560
boolean titlebar = true
string title = "Blink"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event type long onalertbox ( string msg )
event type long onconfirmbox ( string msg,  ref boolean result )
event type long onpromptbox ( string msg,  string default,  ref string result )
event type long ontitlereceived ( string newtitle )
event type long onfaviconreceived ( string url,  blob data )
event type long ondocumentready ( )
event type long onloadingfinish ( string url,  long result,  string failedreason )
event type long onnavigation ( long navtype,  string url )
event type long onurlchanged ( string url )
event type unsignedlong oncreateview ( long navtype,  string url,  real xpos,  real ypos,  real viewwidth,  real viewheight,  boolean viewresizable,  boolean viewfullscreen )
event type long ondebugoutput ( unsignedlong severity,  string info,  string source,  long line,  string stacktrace )
event type long onscriptquery ( long msg,  string request,  ref string response )
event type long onevaluatecomplete ( long id,  string result )
event type long ondownload ( string url,  string mime,  string disposition,  unsignedlong size,  ref string path )
event type long ondownloadcomplete ( string url,  string mime,  string disposition,  unsignedlong size,  string path,  long result )
event onclose pbm_close
event onopen pbm_open
event onpreopen ( )
event onpreclose ( )
event onpostopen ( )
end type
global w_blinkfast w_blinkfast

type variables
//* Copyright (c) 2013 - 2017
//* 著作权由金千枝（深圳）软件技术有限公司所有。著作权人保留一切权利。
//* 
//* 这份授权条款，在满足下列条件的前提下，允许使用者再发布经过或未经过
//* 修改的、源代码或二进制形式的本软件：
//* 
//* 1. 源代码的再发布，必须保留原来代码中的版权声明、这几条许可条件细目
//*    和下面的免责声明。
//* 2. 二进制形式的再发布，必须在随同提供的文档和其它媒介中，复制原来的
//*    版权声明、这几条许可条件细目和下面的免责声明。
//* 3. 所有使用到本软件功能的产品及宣传材料，都必须包还含下列之交待文字：
//*        “本产品内含有由金千枝（深圳）软件技术有限公司及其软件贡献者所开发的软件。”
//* 4. 如果没有特殊的事前书面许可，原作者的组织名称，和贡献者名字，都不能
//*    用于支持或宣传从既有软件派生的产品。
//* 
//* 免责声明：此软件由金千枝（深圳）软件技术有限公司和贡献者以“即此”方式提供，无论明示或
//* 暗示的，包括但不限于间接的关于基于某种目的的适销性、实用性，在此皆明示
//* 不予保证。在任何情况下，由于使用此软件造成的，直接、间接、连带、特别、
//* 惩戒或因此而造成的损害（包括但不限于获得替代品及服务，无法使用，丢失数
//* 据，损失盈利或业务中断），无论此类损害是如何造成的，基于何种责任推断，
//* 是否属于合同范畴，严格赔偿责任或民事侵权行为（包括疏忽和其他原因），即
//* 使预先被告知此类损害可能发生，金千枝（深圳）软件技术有限公司和贡献者均不承担任何责任。
//================================================================

/*--- Implementation ---*/
Private:
n_blinkfast _blink
end variables

forward prototypes
public function long wf_loadfile (readonly string uri)
public function long wf_setoption (readonly unsignedlong option, readonly unsignedlong value)
public function long wf_loadhtml (readonly string html, readonly string baseurl)
public function long wf_setoption (readonly unsignedlong option, readonly boolean value)
public function long wf_setdebugoutput (readonly boolean enable)
public function long wf_loadhtml (readonly string html)
public function long wf_loadurl (readonly string url)
public function long wf_setoption (readonly unsignedlong option, readonly string value)
public function long wf_setagent (readonly string name)
public function long wf_stoploading ()
public function long wf_reload ()
public function long wf_goback ()
public function ulong wf_gethandle ()
public function long wf_evaluateasync (readonly long id, readonly string scripting)
public function long wf_showdevtools ()
public function long wf_showdevtools (readonly string inspectorpath)
end prototypes

event onclose;Event OnPreClose()

if IsValidObject(this) then
	Event Close()
end if
if IsValidObject(this) then
	_blink.Detach()
	Destroy _blink
end if
return 0
end event

event onopen;_blink = Create n_blinkfast
_blink.Attach(this)

Event OnPreOpen()
Event Open()
Post Event OnPostOpen()
end event

public function long wf_loadfile (readonly string uri);return _blink.LoadFile(uri)
end function

public function long wf_setoption (readonly unsignedlong option, readonly unsignedlong value);return _blink.SetOption(option,value)
end function

public function long wf_loadhtml (readonly string html, readonly string baseurl);return _blink.LoadHtml(html,baseUrl)
end function

public function long wf_setoption (readonly unsignedlong option, readonly boolean value);return _blink.SetOption(option,value)
end function

public function long wf_setdebugoutput (readonly boolean enable);return _blink.SetDebugOutput(enable)
end function

public function long wf_loadhtml (readonly string html);return _blink.LoadHtml(html)
end function

public function long wf_loadurl (readonly string url);return _blink.LoadUrl(url)
end function

public function long wf_setoption (readonly unsignedlong option, readonly string value);return _blink.SetOption(option,value)
end function

public function long wf_setagent (readonly string name);return _blink.SetAgent(name)
end function

public function long wf_stoploading ();return _blink.StopLoading()
end function

public function long wf_reload ();return _blink.Reload()
end function

public function long wf_goback ();return _blink.GoBack()
end function

public function ulong wf_gethandle ();return _blink.GetHandle()
end function

public function long wf_evaluateasync (readonly long id, readonly string scripting);return _blink.EvaluateAsync(id,scripting)
end function

public function long wf_showdevtools ();return _blink.ShowDevTools()
end function

public function long wf_showdevtools (readonly string inspectorpath);return _blink.ShowDevTools(inspectorPath)
end function

on w_blinkfast.create
end on

on w_blinkfast.destroy
end on

