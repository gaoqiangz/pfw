$PBExportHeader$n_cst_thememanager.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_thememanager from nonvisualobject
end type
type controldata from structure within n_cst_thememanager
end type
end forward

type controldata from structure
	powerobject		object
end type

global type n_cst_thememanager from nonvisualobject
end type
global n_cst_thememanager n_cst_thememanager

type prototypes
Private:
//注意：
//该函数修改的系统颜色将会影响整个进程内使用该系统色的控件
//为了避免不相关的控件被影响请将控件使用的颜色修改为非系统色即可
Function boolean SetSysColors(long nCount,long nIndexes[],ulong rgbColors[]) Library "pfw.dll" Alias for "pfwSetSysColors"
end prototypes

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

/*--- Constants ---*/
Public:
//主题样式风格
Constant Uint WIN8 	= 1
Constant Uint WIN7 	= 2
Constant Uint XP 		= 3
Constant Uint QQ 		= 4
//主题颜色风格
Constant Ulong CLASSIC 	= n_cst_base_theme.CLASSIC
Constant Ulong BLUE 			= n_cst_base_theme.BLUE
Constant Ulong SILVER 		= n_cst_base_theme.SILVER
Constant Ulong OLIVE 		= n_cst_base_theme.OLIVE
Constant Ulong PURPLE 		= n_cst_base_theme.PURPLE
Constant Ulong GOLD 			= 4293380499	//ARGB(255,231,201,147)

/*--- Properties ---*/
Public:
PrivateWrite Uint 		#Style			= WIN8
PrivateWrite Ulong 	#ColorStyle		= CLASSIC

/*--- Implementation ---*/
Private:
CONTROLDATA Controls[]
end variables

forward prototypes
public function long of_setstyle (readonly unsignedinteger style)
public function long of_registercontrol (readonly powerobject control)
public function long of_unregistercontrol (readonly powerobject control)
public function long of_setcolorstyle (readonly unsignedlong style)
private subroutine _of_updatetheme (boolean stylechanged, boolean colorchanged)
end prototypes

public function long of_setstyle (readonly unsignedinteger style);if #Style = style then return RetCode.OK

choose case style
	case WIN8,WIN7,XP,QQ
		#Style = style
		_of_UpdateTheme(true,true)
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_registercontrol (readonly powerobject control);int index
int newIndex
boolean bValidCtl
String strCtlClsName
String strValidCls[] = {&
							"se_cst_window",&
							"we_cst_tabfloat",&
							"se_cst_statictext",&
							"se_cst_button",&
							"se_cst_menubutton",&
							"se_cst_splitbutton",&
							"se_cst_singlelineedit",&
							"se_cst_multilineedit",&
							"se_cst_editmask",&
							"se_cst_radiobox",&
							"se_cst_checkbox",&
							"se_cst_datawindow",&
							"se_cst_treeview",&
							"se_cst_vscrollbar",&
							"se_cst_hscrollbar",&
							"se_cst_vprogressbar",&
							"se_cst_hprogressbar",&
							"se_cst_dropdownlist",&
							"ue_cst_buttonlistbar",&
							"ue_cst_ribbonbar",&
							"ue_cst_shortcutbar",&
							"ue_cst_tabcontrol",&
							"ue_cst_toolbarstrip",&
							"ue_cst_taskpanelbar",&
							"ue_cst_splitcontainer",&
							"ue_cst_layout",&
							"ne_cst_popupmenu"&
							}

if Not IsValidObject(control) then return RetCode.E_INVALID_OBJECT

for index = 1 to UpperBound(Controls)
	if Controls[index].object = control then return RetCode.OK
next

for index = 1 to UpperBound(strValidCls)
	if IsAncestor(control,strValidCls[index]) then
		bValidCtl = true
		exit
	end if
next

if Not bValidCtl then return RetCode.E_INVALID_TYPE

newIndex = UpperBound(Controls) + 1
Controls[newIndex].object = control
Controls[newIndex].Object.Dynamic Event OnThemeMgrNotify(true,true)

return RetCode.OK
end function

public function long of_unregistercontrol (readonly powerobject control);int index
boolean bSucceeded
CONTROLDATA newControls[]

for index = 1 to UpperBound(Controls)
	if Controls[index].object = control then
		bSucceeded =  true
		continue
	end if
	newControls[UpperBound(newControls) + 1] = Controls[index]
next

Controls = newControls

return iif(bSucceeded,RetCode.OK,RetCode.E_OBJECT_NOT_FOUND)
end function

public function long of_setcolorstyle (readonly unsignedlong style);if #ColorStyle = style then return RetCode.OK

choose case style
	case CLASSIC,BLUE,SILVER,OLIVE,PURPLE,GOLD
		#ColorStyle = style
		/*
		//2.4.2版本开始默认不开启
		choose case #ColorStyle
			case CLASSIC
				SetSysColors(3,&
							{Win32.COLOR_HIGHLIGHT,Win32.COLOR_BTNFACE,Win32.COLOR_WINDOWTEXT},&
							{RGB(203,200,192),RGB(203,200,192),RGBDarken(RGB(203,200,192),0.5)})
			case BLUE
				SetSysColors(3,&
							{Win32.COLOR_HIGHLIGHT,Win32.COLOR_BTNFACE,Win32.COLOR_WINDOWTEXT},&
							{RGB(109,176,225),RGB(109,176,225),RGBDarken(RGB(109,176,225),0.5)})
			case SILVER
				SetSysColors(3,&
							{Win32.COLOR_HIGHLIGHT,Win32.COLOR_BTNFACE,Win32.COLOR_WINDOWTEXT},&
							{RGB(192,192,192),RGB(192,192,192),RGBDarken(RGB(192,192,192),0.5)})
			case OLIVE
				SetSysColors(3,&
							{Win32.COLOR_HIGHLIGHT,Win32.COLOR_BTNFACE,Win32.COLOR_WINDOWTEXT},&
							{RGB(193,208,155),RGB(193,208,155),RGBDarken(RGB(193,208,155),0.5)})
			case PURPLE
				SetSysColors(3,&
							{Win32.COLOR_HIGHLIGHT,Win32.COLOR_BTNFACE,Win32.COLOR_WINDOWTEXT},&
							{RGB(173,171,201),RGB(173,171,201),RGBDarken(RGB(173,171,201),0.5)})
			case GOLD
				SetSysColors(3,&
							{Win32.COLOR_HIGHLIGHT,Win32.COLOR_BTNFACE,Win32.COLOR_WINDOWTEXT},&
							{RGB(211,181,127),RGB(211,181,127),RGBDarken(RGB(211,181,127),0.5)})
		end choose
		*/
		_of_UpdateTheme(false,true)
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

private subroutine _of_updatetheme (boolean stylechanged, boolean colorchanged);int index

for index = 1 to UpperBound(Controls)
	Controls[index].Object.Dynamic Event OnThemeMgrNotify(colorChanged,styleChanged)
next
end subroutine

on n_cst_thememanager.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_thememanager.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;Ulong colorStyle

//强制刷新一次颜色
colorStyle = #ColorStyle
SetNull(#ColorStyle)
of_SetColorStyle(colorStyle)
end event

event destructor;
end event

