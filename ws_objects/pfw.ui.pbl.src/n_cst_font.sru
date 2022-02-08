$PBExportHeader$n_cst_font.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_font from nonvisualobject
end type
type logfont from structure within n_cst_font
end type
end forward

type logfont from structure
	long		lfheight
	long		lfwidth
	long		lfescapement
	long		lforientation
	long		lfweight
	byte		lfitalic
	byte		lfunderline
	byte		lfstrikeout
	byte		lfcharset
	byte		lfoutprecision
	byte		lfclipprecision
	byte		lfquality
	byte		lfpitchandfamily
	character lffacename[32]
end type

shared variables

end variables

global type n_cst_font from nonvisualobject
event onfontchanged ( unsignedinteger eventflag )
end type
global n_cst_font n_cst_font

type prototypes
private:
function long GetObject(ulong hObject,ulong nCount,ref LOGFONT lpObject) Library "gdi32.dll" Alias for "GetObjectW"
//PowerFramework
function ulong CreateFont(string fontname, long fontsize, boolean bold, boolean italic, boolean underline, boolean strikeout, long escapment) Library "pfw.dll" Alias for "pfwCreateFont"
function long GetFontPoint(ulong hFont) library "pfw.dll" alias for "pfwGetFontPoint"
function boolean GetFontTextSize(ulong hFont,readonly string lpcsText,ref SIZEF lpSize) library "pfw.dll" alias for "pfwGetFontTextSize"
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
//Shadow styles
Constant Uint SDS_NONE 		= 0
Constant Uint SDS_NORMAL 	= 1
Constant Uint SDS_GLOWING 	= 2
//Event flags
Constant Uint EVT_FONT					= 0
Constant Uint EVT_NAME					= 1
Constant Uint EVT_SIZE					= 2
Constant Uint EVT_BOLD					= 3
Constant Uint EVT_UNDERLINE			= 4
Constant Uint EVT_ITALIC				= 5
Constant Uint EVT_STRIKEOUT			= 6
Constant Uint EVT_SHADOWSTYLE 	= 7
Constant Uint EVT_GLOWSIZE		 	= 8

/*--- Propties ---*/
Public:
ProtectedWrite String 	#Name 			= "Arial"			//名称
ProtectedWrite long 	#Size 			= 10				//大小 (pt)
ProtectedWrite Boolean 	#Bold				= false			//加粗
ProtectedWrite Boolean	#Italic			= false			//斜体
ProtectedWrite Boolean	#UnderLine		= false			//下划线
ProtectedWrite Boolean	#StrikeOut		= false			//删除线
ProtectedWrite Uint		#ShadowStyle	= SDS_NONE	//阴影风格
ProtectedWrite Real		#GlowSize		= 4				//发光阴影的大小(px,#ShadowStyle = SDS_GLOWING时有效)
PrivateWrite		Ulong		#Handle			= 0				//句柄
PrivateWrite		SIZEF		#WordSize

/*--- Implementation ---*/
Private:


































































/*
/*LOGFONT define*/
//ANSI
type logfont from structure
	long		lfheight
	long		lfwidth
	long		lfescapement
	long		lforientation
	long		lfweight
	character		lfitalic
	character		lfunderline
	character		lfstrikeout
	character		lfcharset
	character		lfoutprecision
	character		lfclipprecision
	character		lfquality
	character		lfpitchandfamily
	character		lffacename[32]
end type
//UNICODE
type logfont from structure
	long		lfheight
	long		lfwidth
	long		lfescapement
	long		lforientation
	long		lfweight
	byte		lfitalic
	byte		lfunderline
	byte		lfstrikeout
	byte		lfcharset
	byte		lfoutprecision
	byte		lfclipprecision
	byte		lfquality
	byte		lfpitchandfamily
	character lffacename[32]
end type
*/
end variables

forward prototypes
public function long of_setbold (readonly boolean bold)
public function long of_setfont (readonly n_cst_font newfont)
protected function long _of_createfont ()
public function long of_setitalic (readonly boolean italic)
public function long of_setname (readonly string name)
public function long of_setstrikeout (readonly boolean strikeout)
public function long of_setunderline (readonly boolean underline)
public function long of_setshadowstyle (readonly unsignedinteger style)
public function long of_setfont (readonly unsignedlong hfont)
public function long of_setglowsize (readonly real size)
public function long of_setsize (readonly long size)
public function long of_setfont (readonly string name, readonly long size, readonly boolean bold, readonly boolean italic, readonly boolean underline, readonly boolean strikeout, readonly unsignedinteger shadowstyle)
end prototypes

public function long of_setbold (readonly boolean bold);if #Bold = bold then return RetCode.OK

#Bold = bold

if IsSucceeded(_of_CreateFont()) then
	Event OnFontChanged(EVT_BOLD)
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_setfont (readonly n_cst_font newfont);if Not IsValidObject(newFont) then return RetCode.E_INVALID_OBJECT
if newFont = this then return RetCode.FAILED
if newFont.#Handle = 0 then return RetCode.E_INVALID_ARGUMENT

#Name 			= newFont.#Name
#Size 			= newFont.#Size
#Bold 			= newFont.#Bold
#Italic 			= newFont.#Italic
#UnderLine 		= newFont.#UnderLine
#StrikeOut 		= newFont.#StrikeOut
#ShadowStyle 	= newFont.#ShadowStyle
#GlowSize		= newFont.#GlowSize
#Handle	 		= newFont.#Handle
Event OnFontChanged(EVT_FONT)

return RetCode.OK
end function

protected function long _of_createfont ();string word

#Handle = 0
#WordSize.cx = 0
#WordSize.cy = 0

#Handle = CreateFont(#Name, #Size, #Bold,#Italic,#UnderLine,#StrikeOut,0)

word = "国"
GetFontTextSize(#Handle,ref word,ref #WordSize)

if #Handle > 0 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_setitalic (readonly boolean italic);if #Italic = Italic then return RetCode.OK

#Italic = Italic

if IsSucceeded(_of_CreateFont()) then
	Event OnFontChanged(EVT_ITALIC)
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_setname (readonly string name);if #Name = Name then return RetCode.OK

#Name = Name

if IsSucceeded(_of_CreateFont()) then
	Event OnFontChanged(EVT_NAME)
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_setstrikeout (readonly boolean strikeout);if #StrikeOut  = StrikeOut  then return RetCode.OK

#StrikeOut  = StrikeOut

if IsSucceeded(_of_CreateFont()) then
	Event OnFontChanged(EVT_STRIKEOUT)
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_setunderline (readonly boolean underline);if #UnderLine = UnderLine then return RetCode.OK

#UnderLine = UnderLine

if IsSucceeded(_of_CreateFont()) then
	Event OnFontChanged(EVT_UNDERLINE)
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_setshadowstyle (readonly unsignedinteger style);if #ShadowStyle = style then return RetCode.OK

choose case style
	case SDS_NONE,SDS_NORMAL,SDS_GLOWING
		
		#ShadowStyle = style
		
		Event OnFontChanged(EVT_SHADOWSTYLE)
		return RetCode.OK
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose
end function

public function long of_setfont (readonly unsignedlong hfont);long nPt
LOGFONT logFont
//Constants
Constant Uint SIZEOF_LOGFONT	= 92		//ANSI:60;UNICODE:92
Constant Uint FW_BOLD				= 700

if hFont = 0 then return RetCode.E_INVALID_ARGUMENT
if GetObject(hFont,SIZEOF_LOGFONT,ref logFont) = 0 then return RetCode.E_INVALID_ARGUMENT

nPt = GetFontPoint(hFont)

//UNICODE
return of_SetFont(String(logFont.lffacename),&
						nPt,&
						(logFont.lfWeight = FW_BOLD),&
						(logFont.lfItalic = 1),&
						(logFont.lfUnderLine = 1),&
						(logFont.lfStrikeout = 1),&
						#ShadowStyle)

/*
//ANSI
return of_SetFont(String(logFont.lffacename),&
						nPt,&
						(logFont.lfWeight = FW_BOLD),&
						(logFont.lfItalic = Char(1)),&
						(logFont.lfUnderLine = Char(1)),&
						(logFont.lfStrikeout = Char(1)),&
						#ShadowStyle)
*/
end function

public function long of_setglowsize (readonly real size);if size < 0 then return RetCode.E_INVALID_ARGUMENT
if #GlowSize = size then return RetCode.OK

#GlowSize = size
Event OnFontChanged(EVT_GLOWSIZE)

return RetCode.OK
end function

public function long of_setsize (readonly long size);if #Size = Size then return RetCode.OK

#Size = Size

if IsSucceeded(_of_CreateFont()) then
	Event OnFontChanged(EVT_SIZE)
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_setfont (readonly string name, readonly long size, readonly boolean bold, readonly boolean italic, readonly boolean underline, readonly boolean strikeout, readonly unsignedinteger shadowstyle);if #Name = Name and #Size = Size and #Bold = Bold and #Italic = Italic and #UnderLine = UnderLine and #StrikeOut = StrikeOut and #ShadowStyle = ShadowStyle then return RetCode.OK

#Name 			= Name
#Size 			= Size
#Bold 			= Bold
#Italic 			= Italic
#UnderLine 		= UnderLine
#StrikeOut 		= StrikeOut
#ShadowStyle 	= ShadowStyle

if IsSucceeded(_of_CreateFont()) then
	Event OnFontChanged(EVT_FONT)
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

on n_cst_font.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_font.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;_of_CreateFont()
end event

