$PBExportHeader$w_sciter.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type w_sciter from window
end type
end forward

global type w_sciter from window
integer width = 1861
integer height = 1560
boolean titlebar = true
string title = "Sciter"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event type long onattachbehavior ( n_sciterelement element,  string name )
event type long onmouse ( n_sciterelement element,  n_sciterelement target,  unsignedlong eventflag,  real xpos,  real ypos,  unsignedlong mousebuttons,  unsignedlong keyboardstates )
event type long onkey ( n_sciterelement element,  n_sciterelement target,  unsignedlong eventflag,  unsignedlong code,  unsignedlong keyboardstates )
event type long onfocus ( n_sciterelement element,  n_sciterelement target,  unsignedlong eventflag )
event type long ontimer ( n_sciterelement element,  unsignedlong id )
event type long onsize ( n_sciterelement element )
event type long onscroll ( n_sciterelement element,  n_sciterelement target,  unsignedlong eventflag,  real pos,  boolean vertical )
event type long onevent ( n_sciterelement element,  n_sciterelement target,  n_sciterelement owner,  unsignedlong eventflag,  unsignedlong reason,  string name, any data )
event type any oninvokemethod ( n_sciterelement element,  string name,  any args[] )
event type long ondebugoutput ( unsignedlong subsystem,  unsignedlong severity,  string info )
event onclose pbm_close
event onopen pbm_open
event onpreopen ( )
event onpreclose ( )
event onpostopen ( )
end type
global w_sciter w_sciter

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
n_sciter _sciter
end variables

forward prototypes
public function long wf_loadfile (readonly string uri)
public function long wf_setoption (readonly unsignedlong option, readonly unsignedlong value)
public function long wf_attachevent (readonly unsignedlong filter)
public function long wf_detachevent ()
public function long wf_setcss (readonly string css, readonly string baseurl, readonly string mediatype)
public function long wf_setcss (readonly string css, readonly string baseurl)
public function long wf_setcss (readonly string css)
public function long wf_setmediatype (readonly string mediatype)
public function long wf_setmediavars (readonly string mediavars)
public function long wf_loadhtml (readonly string html, readonly string baseurl)
public function long wf_updatewindow ()
public function n_scitervalue wf_getviewexpando ()
public function n_sciterelement wf_getrootelement ()
public function n_sciterelement wf_getfocuselement ()
public function n_sciterelement wf_gethighlightedelement ()
public function n_sciterelement wf_getelementbyid (readonly string id)
public function n_sciterelement wf_getelementbyuid (readonly unsignedlong uid)
public function n_sciterelement wf_findelement (readonly string cssselector)
public function integer wf_findelements (readonly string cssselector, ref n_sciterelement els[])
public function long wf_setoption (readonly unsignedlong option, readonly boolean value)
public function long wf_setdebugoutput (readonly boolean enable)
public function n_sciterelement wf_elementfrompoint (readonly real xpos, readonly real ypos)
public function real wf_getminheight (readonly real forwidth)
public function real wf_getminwidth ()
public function any wf_invokefunction (readonly string name)
public function any wf_invokefunction (readonly string name, readonly any arg1)
public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2)
public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3)
public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3, readonly any arg4)
public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3, readonly any arg4, readonly any arg5)
public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3, readonly any arg4, readonly any arg5, readonly any arg6)
public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3, readonly any arg4, readonly any arg5, readonly any arg6, readonly any arg7)
public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3, readonly any arg4, readonly any arg5, readonly any arg6, readonly any arg7, readonly any arg8)
public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3, readonly any arg4, readonly any arg5, readonly any arg6, readonly any arg7, readonly any arg8, readonly any arg9)
public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3, readonly any arg4, readonly any arg5, readonly any arg6, readonly any arg7, readonly any arg8, readonly any arg9, readonly any arg10)
public function any wf_evaluate (readonly string scripting)
public function long wf_loadhtml (readonly string html)
public function long wf_loadurl (readonly string url)
public function n_sciterelement wf_createelement (readonly string tagname, readonly string stext)
public function n_sciterelement wf_createelement (readonly string tagname)
public function integer wf_getelementsbyclassname (readonly string name, ref n_sciterelement els[])
public function integer wf_getelementsbyname (readonly string name, ref n_sciterelement els[])
public function integer wf_getelementsbytagname (readonly string name, ref n_sciterelement els[])
public function ulong wf_gethandle ()
end prototypes

event onclose;Event OnPreClose()

if IsValidObject(this) then
	Event Close()
end if
if IsValidObject(this) then
	_sciter.Detach()
	Destroy _sciter
end if
return 0
end event

event onopen;_sciter = Create n_sciter
_sciter.Attach(this)

Event OnPreOpen()
Event Open()
Post Event OnPostOpen()
end event

public function long wf_loadfile (readonly string uri);return _sciter.LoadFile(uri)
end function

public function long wf_setoption (readonly unsignedlong option, readonly unsignedlong value);return _sciter.SetOption(option,value)
end function

public function long wf_attachevent (readonly unsignedlong filter);return _sciter.AttachEvent(filter)
end function

public function long wf_detachevent ();return _sciter.DetachEvent()
end function

public function long wf_setcss (readonly string css, readonly string baseurl, readonly string mediatype);return _sciter.SetCSS(css,baseUrl,mediaType)
end function

public function long wf_setcss (readonly string css, readonly string baseurl);return _sciter.SetCSS(css,baseUrl)
end function

public function long wf_setcss (readonly string css);return _sciter.SetCSS(css)
end function

public function long wf_setmediatype (readonly string mediatype);return _sciter.SetMediaType(mediaType)
end function

public function long wf_setmediavars (readonly string mediavars);return _sciter.SetMediaVars(mediaVars)
end function

public function long wf_loadhtml (readonly string html, readonly string baseurl);return _sciter.LoadHtml(html,baseUrl)
end function

public function long wf_updatewindow ();return _sciter.UpdateWindow()
end function

public function n_scitervalue wf_getviewexpando ();return _sciter.GetViewExpando()
end function

public function n_sciterelement wf_getrootelement ();return _sciter.GetRootElement()
end function

public function n_sciterelement wf_getfocuselement ();return _sciter.GetFocusElement()
end function

public function n_sciterelement wf_gethighlightedelement ();return _sciter.GetHighlightedElement()
end function

public function n_sciterelement wf_getelementbyid (readonly string id);return _sciter.GetElementByID(id)
end function

public function n_sciterelement wf_getelementbyuid (readonly unsignedlong uid);return _sciter.GetElementByUID(uid)
end function

public function n_sciterelement wf_findelement (readonly string cssselector);return _sciter.FindElement(CssSelector)
end function

public function integer wf_findelements (readonly string cssselector, ref n_sciterelement els[]);return _sciter.FindElements(CssSelector,ref els)
end function

public function long wf_setoption (readonly unsignedlong option, readonly boolean value);return _sciter.SetOption(option,value)
end function

public function long wf_setdebugoutput (readonly boolean enable);return _sciter.SetDebugOutput(enable)
end function

public function n_sciterelement wf_elementfrompoint (readonly real xpos, readonly real ypos);return _sciter.ElementFromPoint(xpos,ypos)
end function

public function real wf_getminheight (readonly real forwidth);return _sciter.GetMinHeight(forWidth)
end function

public function real wf_getminwidth ();return _sciter.GetMinWidth()
end function

public function any wf_invokefunction (readonly string name);return _sciter.InvokeFunction(name)
end function

public function any wf_invokefunction (readonly string name, readonly any arg1);return _sciter.InvokeFunction(name,arg1)
end function

public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2);return _sciter.InvokeFunction(name,arg1,arg2)
end function

public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3);return _sciter.InvokeFunction(name,arg1,arg2,arg3)
end function

public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3, readonly any arg4);return _sciter.InvokeFunction(name,arg1,arg2,arg3,arg4)
end function

public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3, readonly any arg4, readonly any arg5);return _sciter.InvokeFunction(name,arg1,arg2,arg3,arg4,arg5)
end function

public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3, readonly any arg4, readonly any arg5, readonly any arg6);return _sciter.InvokeFunction(name,arg1,arg2,arg3,arg4,arg5,arg6)
end function

public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3, readonly any arg4, readonly any arg5, readonly any arg6, readonly any arg7);return _sciter.InvokeFunction(name,arg1,arg2,arg3,arg4,arg5,arg6,arg7)
end function

public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3, readonly any arg4, readonly any arg5, readonly any arg6, readonly any arg7, readonly any arg8);return _sciter.InvokeFunction(name,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8)
end function

public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3, readonly any arg4, readonly any arg5, readonly any arg6, readonly any arg7, readonly any arg8, readonly any arg9);return _sciter.InvokeFunction(name,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9)
end function

public function any wf_invokefunction (readonly string name, readonly any arg1, readonly any arg2, readonly any arg3, readonly any arg4, readonly any arg5, readonly any arg6, readonly any arg7, readonly any arg8, readonly any arg9, readonly any arg10);return _sciter.InvokeFunction(name,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10)
end function

public function any wf_evaluate (readonly string scripting);return _sciter.Evaluate(scripting)
end function

public function long wf_loadhtml (readonly string html);return _sciter.LoadHtml(html)
end function

public function long wf_loadurl (readonly string url);return _sciter.LoadUrl(url)
end function

public function n_sciterelement wf_createelement (readonly string tagname, readonly string stext);return _sciter.CreateElement(tagName,sText)
end function

public function n_sciterelement wf_createelement (readonly string tagname);return _sciter.CreateElement(tagName)
end function

public function integer wf_getelementsbyclassname (readonly string name, ref n_sciterelement els[]);return _sciter.GetElementsByClassName(name,ref els)
end function

public function integer wf_getelementsbyname (readonly string name, ref n_sciterelement els[]);return _sciter.GetElementsByName(name,ref els)
end function

public function integer wf_getelementsbytagname (readonly string name, ref n_sciterelement els[]);return _sciter.GetElementsByTagName(name,ref els)
end function

public function ulong wf_gethandle ();return _sciter.GetHandle()
end function

on w_sciter.create
end on

on w_sciter.destroy
end on

