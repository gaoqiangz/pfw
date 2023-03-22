$PBExportHeader$n_cst_multilineedit_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_multilineedit_theme from n_cst_base_theme
end type
end forward

global type n_cst_multilineedit_theme from n_cst_base_theme
end type
global n_cst_multilineedit_theme n_cst_multilineedit_theme

type variables
/*--- Constants ---*/
Public:
//Event flags
Constant Uint EVT_SCROLLBARBORDERSTYLE		= EVT_CUSTOM + 1
Constant Uint EVT_SCROLLBARSIZE					= EVT_CUSTOM + 2
Constant Uint EVT_SCROLLBARARROW				= EVT_CUSTOM + 3
Constant Uint EVT_SCROLLBARARROWSIZE			= EVT_CUSTOM + 4
Constant Uint EVT_SCROLLBARROUNDSIZE			= EVT_CUSTOM + 5
Constant Uint EVT_SCROLLBARBORDERMARGIN	= EVT_CUSTOM + 6

/*--- Properties ---*/
Public:
ProtectedWrite Uint		#ScrollBarBorderStyle	= Enums.BS_SOLID	//滚动条边框风格
ProtectedWrite real		#ScrollBarSize	 			= 14						//滚动条大小(px)
ProtectedWrite Boolean	#ScrollBarArrow										//显示滚动条箭头
ProtectedWrite real		#ScrollBarArrowSize		= 12						//滚动条箭头大小(px)
ProtectedWrite RADIUSF	#ScrollBarRoundSize									//滚动条圆角大小(px,#ScrollBarBorderStyle=Enums.BS_ROUND时有效)
ProtectedWrite RECTF		#ScrollBarBorderMargin								//滚动条边框间距(px)
end variables
forward prototypes
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
public function long of_setscrollbarborderstyle (readonly unsignedinteger style)
public function long of_setscrollbarborderstyle (readonly string style)
public function long of_setscrollbararrowsize (readonly real size)
public function long of_setscrollbarbordermargin (readonly real left, readonly real top, readonly real right, readonly real bottom)
public function long of_setscrollbarroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
public function long of_setscrollbarsize (readonly real size)
public function long of_setscrollbararrow (readonly boolean show)
end prototypes

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_multilineedit_theme") then
	n_cst_multilineedit_theme ln_newTheme
	ln_newTheme 	= newTheme
	#ScrollBarSize 				= ln_newTheme.#ScrollBarSize
	#ScrollBarArrow	 		= ln_newTheme.#ScrollBarArrow
	#ScrollBarArrowSize 		= ln_newTheme.#ScrollBarArrowSize
	#ScrollBarBorderStyle 	= ln_newTheme.#ScrollBarBorderStyle
	#ScrollBarRoundSize 		= ln_newTheme.#ScrollBarRoundSize
	#ScrollBarBorderMargin 	= ln_newTheme.#ScrollBarBorderMargin
end if

return RetCode.OK
end function

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

public function long of_setscrollbararrowsize (readonly real size);if #ScrollBarArrowSize = Size then return RetCode.OK
if Size < 4 then return RetCode.E_INVALID_ARGUMENT

#ScrollBarArrowSize = Size
Event OnThemeChanged(EVT_SCROLLBARARROWSIZE)

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

on n_cst_multilineedit_theme.create
call super::create
end on

on n_cst_multilineedit_theme.destroy
call super::destroy
end on

event constructor;call super::constructor;#ScrollBarRoundSize.leftTop = 2
#ScrollBarRoundSize.rightTop = 2
#ScrollBarRoundSize.leftBottom = 2
#ScrollBarRoundSize.rightBottom = 2
end event

event _ongetcolor;call super::_ongetcolor;choose case colorFlag
	case CLR_BORDER
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		elseif BitTest(state,Enums.STATE_HOVER + Enums.STATE_FOCUS) then
			color = _themeColorD4
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_FOCUS) then
			color = _themeColorD4
		else
			color = _themeColor
		end if
end choose
end event

