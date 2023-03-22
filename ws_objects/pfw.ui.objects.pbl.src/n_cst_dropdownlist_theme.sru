$PBExportHeader$n_cst_dropdownlist_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_dropdownlist_theme from n_cst_base_theme
end type
type font from n_cst_font within n_cst_dropdownlist_theme
end type
end forward

global type n_cst_dropdownlist_theme from n_cst_base_theme
event ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
font font
end type
global n_cst_dropdownlist_theme n_cst_dropdownlist_theme

type variables
/*--- Constants ---*/
Public:
//Event flags
Constant Uint EVT_TEXTALIGN							= EVT_CUSTOM + 1
Constant Uint EVT_ICONSIZE							= EVT_CUSTOM + 2
Constant Uint EVT_SCROLLBARBORDERSTYLE		= EVT_CUSTOM + 3
Constant Uint EVT_SCROLLBARSIZE					= EVT_CUSTOM + 4
Constant Uint EVT_SCROLLBARARROW				= EVT_CUSTOM + 5
Constant Uint EVT_SCROLLBARARROWSIZE			= EVT_CUSTOM + 6
Constant Uint EVT_SCROLLBARROUNDSIZE			= EVT_CUSTOM + 7
Constant Uint EVT_SCROLLBARBORDERMARGIN	= EVT_CUSTOM + 8
Constant Uint EVT_FONT					= EVT_CUSTOM + 9

/*--- Properties ---*/
Public:
ProtectedWrite Alignment	#TextAlign					= Left!					//文字对齐方式(Left!,Center!,Right!)
ProtectedWrite SIZEF			#IconSize												//图标大小
ProtectedWrite Uint			#ScrollBarBorderStyle	= Enums.BS_SOLID	//滚动条边框风格
ProtectedWrite Real			#ScrollBarSize	 			= 14						//滚动条大小(px)
ProtectedWrite Boolean		#ScrollBarArrow										//显示滚动条箭头
ProtectedWrite Real			#ScrollBarArrowSize		= 12						//滚动条箭头大小(px)
ProtectedWrite RADIUSF		#ScrollBarRoundSize									//滚动条圆角大小(px,#ScrollBarBorderStyle=Enums.BS_ROUND时有效)
ProtectedWrite RECTF			#ScrollBarBorderMargin								//滚动条边框间距(px)
end variables
forward prototypes
public function long of_setscrollbarborderstyle (readonly unsignedinteger style)
public function long of_setscrollbarborderstyle (readonly string style)
public function long of_settextalign (readonly alignment align)
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
public function unsignedlong of_getitemcolor (readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state)
public function long of_seticonsize (readonly real width, readonly real height)
public function long of_setscrollbarbordermargin (readonly real left, readonly real top, readonly real right, readonly real bottom)
public function long of_setscrollbararrowsize (readonly real size)
public function long of_setscrollbarroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
public function long of_setscrollbarsize (readonly real size)
public function long of_setscrollbararrow (readonly boolean show)
end prototypes

event _ongetitemcolor(integer index, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_BKGND
		if BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		else
			color = ARGB(255,255,255,255)
		end if
end choose
end event

public function long of_setscrollbarborderstyle (readonly unsignedinteger style);if #ScrollBarBorderStyle = style then return RetCode.OK
	
choose case style
	case Enums.BS_NONE,Enums.BS_SOLID,Enums.BS_ROUND
		
		#ScrollBarBorderStyle = style
		Event OnThemeChanged(EVT_SCROLLBARBORDERSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setscrollbarborderstyle (readonly string style);Uint newStyle

choose case Upper(style)
	case "NONE"
		newStyle = Enums.BS_NONE
	case "SOLID"
		newStyle = Enums.BS_SOLID
	case "ROUND"
		newStyle = Enums.BS_ROUND
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return of_SetScrollBarBorderStyle(newStyle)
end function

public function long of_settextalign (readonly alignment align);if #TextAlign = align then return RetCode.OK

choose case align
	case Left!,Center!,Right!
		
		#TextAlign = align
		Event OnThemeChanged(EVT_TEXTALIGN)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_dropdownlist_theme") then
	n_cst_dropdownlist_theme ln_newTheme
	ln_newTheme 	= newTheme
	#TextAlign					= ln_newTheme.#TextAlign
	#IconSize 					= ln_newTheme.#IconSize
	#ScrollBarSize 				= ln_newTheme.#ScrollBarSize
	#ScrollBarArrow	 		= ln_newTheme.#ScrollBarArrow
	#ScrollBarArrowSize 		= ln_newTheme.#ScrollBarArrowSize
	#ScrollBarBorderStyle 	= ln_newTheme.#ScrollBarBorderStyle
	#ScrollBarRoundSize 		= ln_newTheme.#ScrollBarRoundSize
	#ScrollBarBorderMargin 	= ln_newTheme.#ScrollBarBorderMargin
end if

return RetCode.OK
end function

public function unsignedlong of_getitemcolor (readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state);Ulong color

SetNull(color)
Event OnGetItemColor(index,colorFlag,state,ref color)
if IsNull(color) then
	Event _OnGetItemColor(index,colorFlag,state,ref color)
end if
if IsNull(color) then color = of_GetColor(colorFlag,state)

return color
end function

public function long of_seticonsize (readonly real width, readonly real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if #IconSize.cx = width and #IconSize.cy = height then return RetCode.OK

#IconSize.cx = width
#IconSize.cy = height

Event OnThemeChanged(EVT_ICONSIZE)

return RetCode.OK
end function

public function long of_setscrollbarbordermargin (readonly real left, readonly real top, readonly real right, readonly real bottom);if left < 0 or top < 0 or right < 0 or bottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #ScrollBarBorderMargin.left = left and #ScrollBarBorderMargin.top = top and &
	#ScrollBarBorderMargin.right = right and #ScrollBarBorderMargin.bottom = bottom then return RetCode.OK

#ScrollBarBorderMargin.left = left
#ScrollBarBorderMargin.top = top
#ScrollBarBorderMargin.right = right
#ScrollBarBorderMargin.bottom = bottom

Event OnThemeChanged(EVT_SCROLLBARBORDERMARGIN)

return RetCode.OK
end function

public function long of_setscrollbararrowsize (readonly real size);if #ScrollBarArrowSize = Size then return RetCode.OK
if Size < 4 then return RetCode.E_INVALID_ARGUMENT

#ScrollBarArrowSize = Size
Event OnThemeChanged(EVT_SCROLLBARARROWSIZE)

return RetCode.OK
end function

public function long of_setscrollbarroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom);if lefttop < 0 or righttop < 0 or leftbottom < 0 or rightbottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #ScrollBarRoundSize.leftTop = lefttop and #ScrollBarRoundSize.rightTop = righttop and #ScrollBarRoundSize.leftBottom = leftbottom and #ScrollBarRoundSize.rightBottom = rightbottom then return RetCode.OK

#ScrollBarRoundSize.leftTop = lefttop
#ScrollBarRoundSize.rightTop = righttop
#ScrollBarRoundSize.leftBottom = leftbottom
#ScrollBarRoundSize.rightBottom = rightbottom

Event OnThemeChanged(EVT_SCROLLBARROUNDSIZE)

return RetCode.OK
end function

public function long of_setscrollbarsize (readonly real size);if #ScrollBarSize = Size then return RetCode.OK
if Size < 4 then return RetCode.E_INVALID_ARGUMENT

#ScrollBarSize = Size
Event OnThemeChanged(EVT_SCROLLBARSIZE)

return RetCode.OK
end function

public function long of_setscrollbararrow (readonly boolean show);if #ScrollBarArrow = show then return RetCode.OK

#ScrollBarArrow = show
Event OnThemeChanged(EVT_SCROLLBARARROW)

return RetCode.OK
end function

on n_cst_dropdownlist_theme.create
call super::create
this.font=create font
end on

on n_cst_dropdownlist_theme.destroy
call super::destroy
destroy(this.font)
end on

event constructor;call super::constructor;#IconSize.cx = Enums.SMALL
#IconSize.cy = Enums.SMALL
end event

event _ongetcolor;call super::_ongetcolor;choose case colorFlag
	case CLR_BKGND
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		elseif BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_FOCUS) then
			color = _themeColorD1
		else
			color = _themeColor
		end if
	case CLR_BORDER
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		elseif BitTest(state,Enums.STATE_FOCUS) then
			color = _themeColorD5
		else
			color = _themeColorD3
		end if
	case CLR_CHEVRONBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		end if
end choose
end event

type font from n_cst_font within n_cst_dropdownlist_theme descriptor "pb_nvo" = "true" 
end type

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(Parent.EVT_FONT)
end event

