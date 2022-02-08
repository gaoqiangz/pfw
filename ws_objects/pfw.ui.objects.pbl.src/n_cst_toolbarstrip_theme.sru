$PBExportHeader$n_cst_toolbarstrip_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_toolbarstrip_theme from n_cst_base_theme
end type
type font from n_cst_font within n_cst_toolbarstrip_theme
end type
end forward

global type n_cst_toolbarstrip_theme from n_cst_base_theme
event ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
font font
end type
global n_cst_toolbarstrip_theme n_cst_toolbarstrip_theme

type variables
/*--- Constants --*/
Public:
//Event flags
Constant Uint EVT_ITEMORIENTATION	= EVT_CUSTOM + 1
Constant Uint EVT_TEXTORIENTATION	= EVT_CUSTOM + 2
Constant Uint EVT_TEXTALIGN				= EVT_CUSTOM + 3
Constant Uint EVT_ICONPOSITION			= EVT_CUSTOM + 4
Constant Uint EVT_FIXEDSIZE				= EVT_CUSTOM + 5
Constant Uint EVT_ITEMBKGNDSTYLE		= EVT_CUSTOM + 6
Constant Uint EVT_ITEMBORDERSTYLE	= EVT_CUSTOM + 7
Constant Uint EVT_ITEMMINSIZE			= EVT_CUSTOM + 8
Constant Uint EVT_ITEMMARGIN			= EVT_CUSTOM + 9
Constant Uint EVT_ITEMROUNDSIZE		= EVT_CUSTOM + 10
Constant Uint EVT_ICONSIZE				= EVT_CUSTOM + 11
Constant Uint EVT_FONT						= EVT_CUSTOM + 12

/*--- Properties ---*/
Public:
ProtectedWrite Uint 			#ItemOrientation	= Enums.HORZ			//Toolbar方向
ProtectedWrite Uint			#TextOrientation	= Enums.HORZ			//文本方向
ProtectedWrite Alignment	#TextAlign			= Left!					//文字对齐方式(Left!,Center!,Right!)
ProtectedWrite Uint 			#IconPosition		= Enums.LEFT			//图标位置(LEFT,TOP,RIGHT,BOTTOM)
ProtectedWrite	Boolean		#FixedSize			= false					//固定Item最小大小
ProtectedWrite Uint 			#ItemBkgndStyle	= Enums.SOLID		//按钮背景风格
ProtectedWrite Uint 			#ItemBorderStyle	= Enums.BS_SOLID	//按钮边框风格
ProtectedWrite	real			#ItemMinSize		= 40 						//px
ProtectedWrite	real 			#ItemMargin		= 4 						//px
ProtectedWrite RADIUSF		#ItemRoundSize								//按钮圆角大小(px,只有#ItemBorderStyle=BS_ROUND时有效)
ProtectedWrite SIZEF		#IconSize										//图标大小
end variables

forward prototypes
public function long of_setfixedsize (readonly boolean fixed)
public function long of_seticonposition (readonly unsignedinteger position)
public function long of_setitembkgndstyle (readonly unsignedinteger style)
public function long of_setitembkgndstyle (readonly string style)
public function long of_setitemborderstyle (readonly unsignedinteger style)
public function long of_setitemborderstyle (readonly string style)
public function long of_setitemorientation (readonly unsignedinteger orientation)
public function long of_settextorientation (readonly unsignedinteger orientation)
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
public function long of_settextalign (readonly alignment align)
public function unsignedlong of_getitemcolor (readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state)
public function long of_seticonsize (readonly real width, readonly real height)
public function long of_setitemmargin (readonly real margin)
public function long of_setitemminsize (readonly real size)
public function long of_setitemroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
end prototypes

event _ongetitemcolor(integer index, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_BKGND,CLR_CHEVRONBKGND
		if BitTest(state,Enums.STATE_HOVER + Enums.STATE_PRESSED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_HIGHLIGHTED) then
			color = HIGHLIGHT
		end if
	case CLR_BORDER,CLR_CHEVRONBORDER
		color = _themeColorD2
end choose
end event

public function long of_setfixedsize (readonly boolean fixed);if #FixedSize = fixed then return RetCode.OK

#FixedSize = fixed
Event OnThemeChanged(EVT_FIXEDSIZE)

return RetCode.OK
end function

public function long of_seticonposition (readonly unsignedinteger position);if #IconPosition = position then return RetCode.OK

choose case position
	case Enums.LEFT,Enums.TOP,Enums.RIGHT,Enums.BOTTOM
		
		#IconPosition = position
		Event OnThemeChanged(EVT_ICONPOSITION)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setitembkgndstyle (readonly unsignedinteger style);if #ItemBkgndStyle = style then return RetCode.OK
	
choose case style
	case Enums.XP,Enums.VISTAEMBOSSED,Enums.VISTAORIGINAL,Enums.VISTAGLASS,Enums.SOLID,Enums.TRANSPARENT
		
		#ItemBkgndStyle = style
		Event OnThemeChanged(EVT_ITEMBKGNDSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setitembkgndstyle (readonly string style);Uint newStyle

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

return of_SetItemBkgndStyle(newStyle)
end function

public function long of_setitemborderstyle (readonly unsignedinteger style);if #ItemBorderStyle = style then return RetCode.OK
	
choose case style
	case Enums.BS_NONE,Enums.BS_SOLID,Enums.BS_ROUND
		
		#ItemBorderStyle = style
		Event OnThemeChanged(EVT_ITEMBORDERSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setitemborderstyle (readonly string style);Uint newStyle

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

return of_SetItemBorderStyle(newStyle)
end function

public function long of_setitemorientation (readonly unsignedinteger orientation);if #ItemOrientation = orientation then return RetCode.OK

choose case orientation
	case Enums.HORZ,Enums.VERT
		
		#ItemOrientation = orientation
		Event OnThemeChanged(EVT_ITEMORIENTATION)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_settextorientation (readonly unsignedinteger orientation);if #TextOrientation = orientation then return RetCode.OK

choose case orientation
	case Enums.HORZ,Enums.VERT
		
		#TextOrientation = orientation
		Event OnThemeChanged(EVT_TEXTORIENTATION)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_toolbarstrip_theme") then
	n_cst_toolbarstrip_theme ln_newTheme
	ln_newTheme 	= newTheme
	#ItemOrientation 	= ln_newTheme.#ItemOrientation
	#TextOrientation 	= ln_newTheme.#TextOrientation
	#TextAlign			= ln_newTheme.#TextAlign
	#IconPosition 		= ln_newTheme.#IconPosition
	#ItemBkgndStyle 	= ln_newTheme.#ItemBkgndStyle
	#ItemBorderStyle 	= ln_newTheme.#ItemBorderStyle
	#ItemRoundSize 	= ln_newTheme.#ItemRoundSize
	#ItemMargin 		= ln_newTheme.#ItemMargin
	#IconSize 			= ln_newTheme.#IconSize
	Font.of_SetFont(ln_newTheme.Font)
end if

return RetCode.OK
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

public function long of_setitemmargin (readonly real margin);if #ItemMargin = margin then return RetCode.OK

#ItemMargin = margin
Event OnThemeChanged(EVT_ITEMMARGIN)

return RetCode.OK
end function

public function long of_setitemminsize (readonly real size);if #ItemMinSize = Size then return RetCode.OK

#ItemMinSize = Size
Event OnThemeChanged(EVT_ITEMMINSIZE)

return RetCode.OK
end function

public function long of_setitemroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom);if lefttop < 0 or righttop < 0 or leftbottom < 0 or rightbottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #ItemRoundSize.leftTop = lefttop and #ItemRoundSize.rightTop = righttop and #ItemRoundSize.leftBottom = leftbottom and #ItemRoundSize.rightBottom = rightbottom then return RetCode.OK

#ItemRoundSize.leftTop = lefttop
#ItemRoundSize.rightTop = righttop 
#ItemRoundSize.leftBottom = leftbottom 
#ItemRoundSize.rightBottom = rightbottom

Event OnThemeChanged(EVT_ITEMROUNDSIZE)

return RetCode.OK
end function

on n_cst_toolbarstrip_theme.create
call super::create
this.font=create font
end on

on n_cst_toolbarstrip_theme.destroy
call super::destroy
destroy(this.font)
end on

event constructor;call super::constructor;#ItemRoundSize.leftTop = 2
#ItemRoundSize.rightTop = 2
#ItemRoundSize.leftBottom = 2
#ItemRoundSize.rightBottom = 2

#IconSize.cx = Enums.SMALL
#IconSize.cy = Enums.SMALL

#BkgndOrientation = Enums.VERT
end event

event onsetpopupmenutheme;call super::onsetpopupmenutheme;pmTheme.of_SetItemBkgndStyle(#ItemBkgndStyle)
pmTheme.of_SetItemBorderStyle(#ItemBorderStyle)
return 0
end event

type font from n_cst_font within n_cst_toolbarstrip_theme descriptor "pb_nvo" = "true" 
end type

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(Parent.EVT_FONT)
end event

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

