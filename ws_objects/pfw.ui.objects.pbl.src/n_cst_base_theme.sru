$PBExportHeader$n_cst_base_theme.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_base_theme from nonvisualobject
end type
end forward

global type n_cst_base_theme from nonvisualobject
event _ongetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongetdefaultcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _onthemecolorchanged ( )
event onthemechanged ( unsignedinteger eventflag )
event ongetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type long onsetpopupmenutheme ( n_cst_popupmenu_theme pmtheme )
end type
global n_cst_base_theme n_cst_base_theme

type prototypes

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
//Colors
Constant Ulong CLASSIC 		= 4292203210	//ARGB(255,213,210,202)
Constant Ulong	BLUE 				= 4288003554 	//ARGB(255,149,189,226)
Constant Ulong PURPLE 			= 4289571785	//ARGB(255,173,171,201)
Constant Ulong OLIVE				= 4291549861	//ARGB(255,203,218,165)
Constant Ulong	SILVER			= 4290822336	//ARGB(255,192,192,192)
Constant Ulong DEFAULTTEXT 	= 14474460		//RGB(220,220,220)
Constant Ulong	CUSTOM			= 0
//Color flags
Constant Uint CLR_BKGND					= 0
Constant Uint CLR_BORDER					= 1
Constant Uint CLR_TEXT						= 2
Constant Uint CLR_LINE						= 3
Constant Uint CLR_ARROW					= 4
Constant Uint CLR_TRANSPARENT			= 5
Constant Uint CLR_SCROLLBARBKGND		= 6
Constant Uint CLR_SCROLLBARBORDER	= 7
Constant Uint CLR_SBARROWBKGND		= 8
Constant Uint CLR_SBARROWBORDER	= 9
Constant Uint CLR_SBTHUMBBKGND		= 10
Constant Uint CLR_SBTHUMBBORDER		= 11
Constant Uint CLR_CHEVRONBKGND		= 12
Constant Uint CLR_CHEVRONBORDER		= 13
Constant Uint CLR_ICON					= 14
Constant Uint CLR_CUSTOM					= 15
//Event flags
Constant Uint EVT_THEME					= 0
Constant Uint EVT_BKGNDSTYLE			= 1
Constant Uint EVT_BKGNDCOLORSTYLE	= 2
Constant Uint EVT_BKGNDORIENTATION	= 3
Constant Uint EVT_BORDERSTYLE			= 4
Constant Uint EVT_ROUNDSIZE				= 5
Constant Uint EVT_BORDERMARGIN		= 6
Constant Uint EVT_CUSTOM					= 7

/*--- Properties ---*/
Public:
ProtectedWrite Uint		#BkgndStyle			= Enums.SOLID		//背景风格
ProtectedWrite Ulong 		#BkgndColorStyle	= CLASSIC				//背景颜色风格
ProtectedWrite Uint 		#BkgndOrientation	= Enums.VERT			//背景填充方向
ProtectedWrite Uint		#BorderStyle		= Enums.BS_SOLID	//边框风格
ProtectedWrite RADIUSF	#RoundSize										//圆角大小(px,#BorderStyle=Enums.BS_ROUND时有效)
ProtectedWrite RECTF		#BorderMargin

/*--- Implementation ---*/
Protected:
/*--- 主题色 ---*/
Ulong _themeColor
//变暗级别(各分量递减10)
Ulong _themeColorD1
Ulong _themeColorD2
Ulong _themeColorD3
Ulong _themeColorD4
Ulong _themeColorD5
//变亮级别(各分量递增10)
Ulong _themeColorL1
Ulong _themeColorL2
Ulong _themeColorL3
Ulong _themeColorL4
Ulong _themeColorL5
//特定色
Ulong _themeColorGray		//灰色
Ulong _themeColorDark		//变暗70%
Ulong _themeColorLight		//变亮50%
Ulong _themeColorIcon
Ulong _themeColorIconHover		
Ulong _themeColorIconPressed	
Ulong _themeColorIconFocus
//固定色
Constant Ulong HIGHLIGHT = 4294623373	//ARGB(255,250,192,141)

end variables
forward prototypes
public function long of_setbkgndorientation (readonly unsignedinteger orientation)
public function long of_setbkgndstyle (readonly unsignedinteger style)
public function long of_setbkgndstyle (readonly string style)
public function long of_setborderstyle (readonly unsignedinteger style)
public function long of_setborderstyle (readonly string style)
public function long of_settheme (readonly n_cst_base_theme newtheme)
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
public function long of_setbkgndorientation (readonly string orientation)
public function long of_setbkgndcolorstyle (readonly unsignedlong colorstyle)
public function long of_setbkgndcolorstyle (readonly string colorstyle)
protected function unsignedlong _of_getthemecolor (readonly unsignedlong colorstyle)
public function unsignedlong of_getcolor (readonly unsignedinteger colorflag, readonly unsignedlong state)
public function long of_setbordermargin (readonly real left, readonly real top, readonly real right, readonly real bottom)
public function long of_setroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
protected function string _of_torgb (readonly unsignedlong clr)
public function string of_geticon (readonly string uri, readonly unsignedlong state)
end prototypes

event _ongetdefaultcolor(unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_BKGND
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		elseif BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_HIGHLIGHTED) then
			color = HIGHLIGHT
		else
			color = _themeColor
		end if
	case CLR_BORDER
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		else
			color = _themeColorD4
		end if
	case CLR_TEXT
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		else
			color = _themeColorDark
		end if
	case CLR_LINE
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		else
			color = _themeColorD4
		end if
	case CLR_ARROW
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		else
			color = _themeColorDark
		end if
	case CLR_SCROLLBARBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		else
			color = _themeColorL1
		end if
	case CLR_SCROLLBARBORDER
		color = _themeColor
	case CLR_SBARROWBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColor
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL1
		else
			color = _themeColor
		end if
	case CLR_SBARROWBORDER
		color = _themeColorD4
	case CLR_SBTHUMBBKGND
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		elseif BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColor
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL1
		else
			color = _themeColor
		end if
	case CLR_SBTHUMBBORDER
		color = _themeColorD4
	case CLR_CHEVRONBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		else
			color = _themeColor
		end if
	case CLR_CHEVRONBORDER
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		else
			color = _themeColorD3
		end if
	case CLR_ICON
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		elseif BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorIconPressed
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorIconHover
		elseif BitTest(state,Enums.STATE_FOCUS) then
			color = _themeColorIconFocus
		else
			color = _themeColorIcon
		end if
end choose
end event

event _onthemecolorchanged();Uint a,r,g,b

//设置主题色
_themeColor = _of_GetThemeColor(#BkgndColorStyle)

SplitARGB(_themeColor,ref a,ref r,ref g,ref b)

if a > 0 then
	_themeColorDark	= ARGBDarken(_themeColor,0.7)
	_themeColorLight	= ARGBLighten(_themeColor,0.5)
	_themeColorGray 	= ARGBToGray(_themeColor)
	_themeColorD1 	= ARGB(a,iif(Int(r - 10) < 0,0,r - 10),iif(Int(g - 10) < 0,0,g - 10),iif(Int(b - 10) < 0,0,b - 10))
	_themeColorD2 	= ARGB(a,iif(Int(r - 20) < 0,0,r - 20),iif(Int(g - 20) < 0,0,g - 20),iif(Int(b - 20) < 0,0,b - 20))
	_themeColorD3 	= ARGB(a,iif(Int(r - 30) < 0,0,r - 30),iif(Int(g - 30) < 0,0,g - 30),iif(Int(b - 30) < 0,0,b - 30))
	_themeColorD4		= ARGB(a,iif(Int(r - 40) < 0,0,r - 40),iif(Int(g - 40) < 0,0,g - 40),iif(Int(b - 40) < 0,0,b - 40))
	_themeColorD5 	= ARGB(a,iif(Int(r - 50) < 0,0,r - 50),iif(Int(g - 50) < 0,0,g - 50),iif(Int(b - 50) < 0,0,b - 50))
	_themeColorL1 	= ARGB(a,iif(Int(r + 10) > 255,255,r + 10),iif(Int(g + 10) > 255,255,g + 10),iif(Int(b + 10) > 255,255,b + 10))
	_themeColorL2 	= ARGB(a,iif(Int(r + 20) > 255,255,r + 20),iif(Int(g + 20) > 255,255,g + 20),iif(Int(b + 20) > 255,255,b + 20))
	_themeColorL3 	= ARGB(a,iif(Int(r + 30) > 255,255,r + 30),iif(Int(g + 30) > 255,255,g + 30),iif(Int(b + 30) > 255,255,b + 30))
	_themeColorL4		= ARGB(a,iif(Int(r + 40) > 255,255,r + 40),iif(Int(g + 40) > 255,255,g + 40),iif(Int(b + 40) > 255,255,b + 40))
	_themeColorL5 	= ARGB(a,iif(Int(r + 50) > 255,255,r + 50),iif(Int(g + 50) > 255,255,g + 50),iif(Int(b + 50) > 255,255,b + 50))
	if r < 100 or g < 100 or b < 100 then
		_themeColorIcon = ARGB(255,255,255,255)
		_themeColorIconHover = ARGB(255,245,245,245)
		_themeColorIconPressed = ARGB(255,235,235,235)
		_themeColorIconFocus = ARGB(255,235,235,235)
	else
		_themeColorIcon = _themeColorDark
		_themeColorIconHover = ARGBDarken(_themeColor,0.5)
		_themeColorIconPressed = ARGBDarken(_themeColor,0.7)
		_themeColorIconFocus = ARGBDarken(_themeColor,0.8)
	end if
else
	_themeColor 		= 0
	_themeColorDark 	= 0
	_themeColorLight	= 0
	_themeColorGray	= 0
	_themeColorD1 	= 0
	_themeColorD2 	= 0
	_themeColorD3 	= 0
	_themeColorD4 	= 0
	_themeColorD5 	= 0
	_themeColorL1 	= 0
	_themeColorL2 	= 0
	_themeColorL3 	= 0
	_themeColorL4 	= 0
	_themeColorL5 	= 0
	_themeColorIcon = 0
	_themeColorIconHover = 0
	_themeColorIconPressed = 0
	_themeColorIconFocus = 0
end if
end event

public function long of_setbkgndorientation (readonly unsignedinteger orientation);if #BkgndOrientation = Orientation then return RetCode.OK
	
choose case Orientation
	case Enums.HORZ,Enums.VERT
		
		#BkgndOrientation = Orientation
		Event OnThemeChanged(EVT_BKGNDORIENTATION)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setbkgndstyle (readonly unsignedinteger style);if #BkgndStyle = style then return RetCode.OK

choose case style
	case Enums.XP,Enums.VISTAEMBOSSED,Enums.VISTAORIGINAL,Enums.VISTAGLASS,Enums.SOLID,Enums.TRANSPARENT
		
		#BkgndStyle = style
		Event OnThemeChanged(EVT_BKGNDSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setbkgndstyle (readonly string style);Uint newStyle

choose case Upper(style)
	case "XP"
		newStyle = Enums.XP
	case "VISTAEMBOSSED"
		newStyle = Enums.VISTAEMBOSSED
	case "VISTAORIGINAL"
		newStyle = Enums.VISTAORIGINAL
	case "VISTAGLASS"
		newStyle = Enums.VISTAGLASS
	case "SOLID"
		newStyle = Enums.SOLID
	case "TRANSPARENT"
		newStyle = Enums.TRANSPARENT
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return of_SetBkgndStyle(newStyle)
end function

public function long of_setborderstyle (readonly unsignedinteger style);if #BorderStyle = style then return RetCode.OK

choose case style
	case Enums.BS_NONE,Enums.BS_SOLID,Enums.BS_RAISED,Enums.BS_ROUND
		
		#BorderStyle = style
		Event OnThemeChanged(EVT_BORDERSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setborderstyle (readonly string style);Uint newStyle

choose case Upper(style)
	case "NONE"
		newStyle = Enums.BS_NONE
	case "SOLID"
		newStyle = Enums.BS_SOLID
	case "ROUND"
		newStyle = Enums.BS_ROUND
	case "RAISED"
		newStyle = Enums.BS_RAISED
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return of_SetBorderStyle(newStyle)
end function

public function long of_settheme (readonly n_cst_base_theme newtheme);long rtCode

if Not IsValidObject(newTheme) then return RetCode.E_INVALID_OBJECT
if newTheme = this then return RetCode.E_INVALID_ARGUMENT

rtCode = _of_SetTheme(newTheme)
if IsFailed(rtCode) then return rtCode

Event OnThemeChanged(EVT_THEME)

return RetCode.OK
end function

protected function long _of_settheme (readonly n_cst_base_theme newtheme);boolean bColorChanged

if Not IsValidObject(newTheme) then return RetCode.E_INVALID_OBJECT
if newTheme = this then return RetCode.FAILED

bColorChanged = (#BkgndColorStyle	<> newTheme.#BkgndColorStyle)

#BkgndStyle	 		= newTheme.#BkgndStyle
#BkgndColorStyle	= newTheme.#BkgndColorStyle
#BkgndOrientation	= newTheme.#BkgndOrientation
#BorderStyle 		= newTheme.#BorderStyle
#RoundSize 		= newTheme.#RoundSize
#BorderMargin		= newTheme.#BorderMargin

if bColorChanged then
	Event _OnThemeColorChanged()
end if

return RetCode.OK
end function

public function long of_setbkgndorientation (readonly string orientation);choose case Upper(orientation)
	case "HORZ"
		return of_SetBkgndOrientation(Enums.HORZ)
	case "VERT"
		return of_SetBkgndOrientation(Enums.VERT)
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose
end function

public function long of_setbkgndcolorstyle (readonly unsignedlong colorstyle);long rtCode

if #BkgndColorStyle = colorStyle then return RetCode.OK

#BkgndColorStyle = colorStyle

Event _OnThemeColorChanged()
Event OnThemeChanged(EVT_BKGNDCOLORSTYLE)

return RetCode.OK
end function

public function long of_setbkgndcolorstyle (readonly string colorstyle);Ulong newColor

choose case Upper(colorStyle)
	case "CLASSIC"
		newColor = CLASSIC
	case "BLUE"
		newColor = BLUE
	case "PURPLE"
		newColor = PURPLE
	case "OLIVE"
		newColor = OLIVE
	case "SILVER"
		newColor = SILVER
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return of_SetBkgndColorStyle(newColor)
end function

protected function unsignedlong _of_getthemecolor (readonly unsignedlong colorstyle);return colorStyle
end function

public function unsignedlong of_getcolor (readonly unsignedinteger colorflag, readonly unsignedlong state);Ulong color

SetNull(color)
Event OnGetColor(colorFlag,state,ref color)
if IsNull(color) then
	Event _OnGetColor(colorFlag,state,ref color)
end if
if IsNull(color) then
	Event _OnGetDefaultColor(colorFlag,state,ref color)
end if
if IsNull(color) then color = 0

return color
end function

public function long of_setbordermargin (readonly real left, readonly real top, readonly real right, readonly real bottom);//if left < 0 or top < 0 or right < 0 or bottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #BorderMargin.left = left and #BorderMargin.top = top and #BorderMargin.right = right and #BorderMargin.bottom = bottom then return RetCode.OK

#BorderMargin.left = left
#BorderMargin.top = top
#BorderMargin.right = right
#BorderMargin.bottom = bottom

Event OnThemeChanged(EVT_BORDERMARGIN)

return RetCode.OK
end function

public function long of_setroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom);if lefttop < 0 or righttop < 0 or leftbottom < 0 or rightbottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #RoundSize.leftTop = lefttop and #RoundSize.rightTop = righttop and #RoundSize.leftBottom = leftbottom and #RoundSize.rightBottom = rightbottom then return RetCode.OK

#RoundSize.leftTop = lefttop
#RoundSize.rightTop = righttop 
#RoundSize.leftBottom = leftbottom 
#RoundSize.rightBottom = rightbottom

Event OnThemeChanged(EVT_ROUNDSIZE)

return RetCode.OK
end function

protected function string _of_torgb (readonly unsignedlong clr);Uint a,r,g,b

SplitARGB(clr,ref a,ref r,ref g,ref b)

return Sprintf("rgb({},{},{})",r,g,b)
end function

public function string of_geticon (readonly string uri, readonly unsignedlong state);if Pos(uri,".svg") > 0 then
	if Pos(uri,"{") = 0 then
		return uri + "{fill:" + _of_ToRGB(of_GetColor(CLR_ICON,state)) + "}"
	else
		return uri
	end if
elseif Left(uri,7) = "font://" then
	if Pos(uri,"{") = 0 then
		return uri + "{color:" + _of_ToRGB(of_GetColor(CLR_ICON,state)) + "}"
	else
		return uri
	end if
else
	return uri
end if
end function

on n_cst_base_theme.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_base_theme.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;#RoundSize.leftTop = 2
#RoundSize.rightTop = 2
#RoundSize.leftBottom = 2
#RoundSize.rightBottom = 2

#BorderMargin.left = 2
#BorderMargin.top = 2
#BorderMargin.right = 2
#BorderMargin.bottom = 2

Event _OnThemeColorChanged()
end event

