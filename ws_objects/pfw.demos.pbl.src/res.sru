$PBExportHeader$res.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type res from nonvisualobject
end type
end forward

global type res from nonvisualobject
end type
global res res

type variables
/* Resource define */
/*
	PowerFramework支持从本地路径、资源文件和PowerBuilder预设资源加载图像，支持格式有bmp、ico、gif、png、apng、jpg、svg、icon-font，部分控件支持动画格式的gif和apng。
	资源协议:
		默认资源类型为bmp
		res://协议访问标准DLL内的资源,pbr://协议访问PB编译的PBD/PBL/DLL/EXE内的资源,pfw://协议加载pfw.dll内部资源
		data:[资源类型;]base64编码字符串
		font://字体名称[#16进制unicode码或单个字符]
		
		-data协议
		data:[resType;]base64
		
		-res/pbr协议
		格式1:
			res://resFile[/resType]/resName 或 res://resFile[|resType]|resName
			pbr://resFile[/resType]/resName 或 pbr://resFile[|resType]|resName
		格式2:
			res://resFile/resName[.resType] 或 res://resFile|resName[.resType]
			pbr://resFile/resName[.resType] 或 pbr://resFile|resName[.resType]
			
		-font-icon协议
		font:://facename[#ff00]
		
	扩展:
		所有协议都支持zip[path]来访问zip类型的资源内的元素:
			res://resFile/zip/resName[path] 或 res://resFile/resName.zip[path]
			pbr://resFile/zip/resName[path] 或 pbr://resFile/resName.zip[path]
			data:[resType;]base64[path]
		注:zip元素的[path]用'/'来分目录
		
	res协议默认资源文件类型为DLL,pbr协议默认资源文件类型为PBD
	
	附加参数：
		svg和icon-font支持附加参数:
			pbr://resFile/svg/resName{fill:red;stroke:#0000ff;stroke-width:1px} 或 pbr://resFile/resName.svg{fill:red;stroke:#0000ff;stroke-width:1px}
			font:://facename[#ff00]{color:red}
*/
Public:
//16 x 16
Constant String ICO_S_ABOUT					= "pfw://zip/images[win-help.svg]"
Constant String ICO_S_SKIN					= "pfw://zip/images[win-skin.svg]"
Constant String ICO_S_LOGO					= "res\images\logo.ico"
Constant String ICO_S_CLASSIC				= "res\images\classic.bmp"
Constant String ICO_S_BLUE					= "res\images\blue.bmp"
Constant String ICO_S_SILVER					= "res\images\silver.bmp"
Constant String ICO_S_OLIVE					= "res\images\olive.bmp"
Constant String ICO_S_PURPLE					= "res\images\purple.bmp"
Constant String ICO_S_GOLD					= "res\images\gold.bmp"
Constant String ICO_S_TAB_CLOSE			= "res\images\tab_close.png"
Constant String ICO_S_TAB_LOCK				= "res\images\lock.png"
Constant String ICO_S_TAB_UNLOCK			= "res\images\unlock.png"
Constant String ICO_S_TAB_FLOAT			= "res\images\float_window.png"
Constant String ICO_S_USER					= "res\images\user.png"
Constant String ICO_S_SCITER					= "res\images\sciter.png"
Constant String ICO_S_VSPAGE				= "res\images\vspage.png"
Constant String ICO_S_CHART					= "res\images\chart.png"
Constant String ICO_S_GRID					= "res\images\grid.png"
Constant String ICO_S_LIST						= "res\images\list.png"
Constant String ICO_S_PRINTING				= "res\images\printing.png"
Constant String ICO_S_ALIPAY					= "res\images\alipay.png"
Constant String ICO_S_WXPAY					= "res\images\wxpay.png"
Constant String AM_S_TIME						= "res\images\time.png"
Constant String AM_S_WAITING_GIF			= "res\images\waiting.gif"
Constant String AM_S_WAITING_APNG		= "res\images\waiting.png"
//32 x 32
Constant String ICO_L_CLASSIC				= "res\images\classic32.bmp"
Constant String ICO_L_BLUE						= "res\images\blue32.bmp"
Constant String ICO_L_SILVER					= "res\images\silver32.bmp"
Constant String ICO_L_OLIVE					= "res\images\olive32.bmp"
Constant String ICO_L_PURPLE					= "res\images\purple32.bmp"
Constant String ICO_L_GOLD					= "res\images\gold32.bmp"
Constant String ICO_L_BUTTONLISTBAR		= "res\images\buttonlistbar.png"
Constant String ICO_L_TABCONTROL			= "res\images\tabcontrol.png"
Constant String ICO_L_TASKPANELBAR		= "res\images\taskpanelbar.png"
Constant String ICO_L_TOOLBARSTRIP		= "res\images\toolbarstrip.png"
Constant String ICO_L_TOOL					= "res\images\tool.png"
Constant String ICO_L_SHORTCUTBAR		= "res\images\shortcutbar.png"
Constant String ICO_L_SPLITCONTAINER	= "res\images\splitcontainer.png"
Constant String ICO_L_TREEVIEW				= "res\images\treeview.png"
Constant String ICO_L_SCITER					= "res\images\sciter32.png"
Constant String ICO_L_VSPAGE					= "res\images\vspage32.png"
Constant String ICO_L_CHART					= "res\images\chart32.png"
Constant String ICO_L_GRID						= "res\images\grid32.png"
Constant String ICO_L_LIST						= "res\images\list32.png"
Constant String ICO_L_PRINTING				= "res\images\printing32.png"
Constant String ICO_L_ALIPAY					= "res\images\alipay32.png"
Constant String ICO_L_WXPAY					= "res\images\wxpay32.png"
//64 x 64
Constant String ICO_XXL_LOGO				= "res\images\logo.png"
//Login window
Constant String ICO_LW_KEY					= "res\images\loginwnd/key.png"
Constant String ICO_LW_USER					= "res\images\loginwnd/user.png"
Constant String AM_LW_LOWPOLY			= "res\images\loginwnd/lowpoly.gif"
//Sciter
//Sciter samples
Constant String SCITER_HTML_TRAYNOTIFICATION	= "samples\sciter\TrayNotification\main.htm" //"samples\sciter.zip[TrayNotification/main.htm]"
Constant String SCITER_HTML_CHART 				= "samples\sciter\charts\main.htm" //"samples\sciter.zip[charts/main.htm]"
Constant String SCITER_HTML_CLOCK 				= "samples\sciter\clock\main.htm" //"samples\sciter.zip[clock/main.htm]"
Constant String SCITER_HTML_PRINTING 			= "samples\sciter\printing\main.htm" //"samples\sciter.zip[printing/main.htm]"
Constant String SCITER_HTML_VSPAGE 				= "samples\sciter\vsstartpage\main.htm" //"samples\sciter.zip[vsstartpage/main.htm]"
Constant String SCITER_HTML_QQLOGIN 			= "samples\sciter\qqlogin\main.htm" //"samples\sciter.zip[qqlogin/main.htm]"
//Misc
Constant String IMG_POWERED					= "res\images\powered.png"	//104x26
end variables
on res.create
call super::create
TriggerEvent( this, "constructor" )
end on

on res.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

