$PBExportHeader$n_cst_window_mdiclient_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_window_mdiclient_theme from n_cst_base_theme
end type
type font from n_cst_font within n_cst_window_mdiclient_theme
end type
type selectedfont from n_cst_font within n_cst_window_mdiclient_theme
end type
end forward

global type n_cst_window_mdiclient_theme from n_cst_base_theme
unsignedinteger #borderstyle = 0
event ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
font font
selectedfont selectedfont
end type
global n_cst_window_mdiclient_theme n_cst_window_mdiclient_theme

type variables
/*--- Constants --*/
Public:
//Tab styles
Constant Uint TBS_REGULAR 	= 0
Constant Uint TBS_OFFICE 		= 1
Constant Uint TBS_RIBBON 		= 2
Constant Uint TBS_SOLID 		= 3
//Color flags
Constant Uint CLR_TABSTRIPBKGND			= CLR_CUSTOM + 1
Constant Uint CLR_CLIENTBKGND				= CLR_CUSTOM + 2
Constant Uint CLR_SYSBTNBKGND				= CLR_CUSTOM + 3
Constant Uint CLR_SYSBTNBORDER			= CLR_CUSTOM + 4
//Event flags
Constant Uint EVT_TABSTYLE					= EVT_CUSTOM + 1
Constant Uint EVT_TEXTALIGN					= EVT_CUSTOM + 2
Constant Uint EVT_SHEETLISTBUTTON		= EVT_CUSTOM + 3
Constant Uint EVT_ICONPOSITION				= EVT_CUSTOM + 4
Constant Uint EVT_FIXEDSIZE					= EVT_CUSTOM + 5
Constant Uint EVT_TABSTRIPBORDERSTYLE	= EVT_CUSTOM + 6
Constant Uint EVT_ITEMBKGNDSTYLE			= EVT_CUSTOM + 7
Constant Uint EVT_ITEMMINSIZE				= EVT_CUSTOM + 8
Constant Uint EVT_TABSTRIPSIZE				= EVT_CUSTOM + 9
Constant Uint EVT_ICONSIZE					= EVT_CUSTOM + 10
Constant Uint EVT_FONT							= EVT_CUSTOM + 11
Constant Uint EVT_SELECTEDFONT			= EVT_CUSTOM + 12

/*--- Properties ---*/
Public:
ProtectedWrite Uint 			#TabStyle 					= TBS_SOLID			//Tab风格
ProtectedWrite Alignment	#TextAlign					= Left!					//文字对齐方式(Left!,Center!,Right!)
ProtectedWrite Boolean		#SheetListButton			= true					//显示Sheet列表的按钮
ProtectedWrite Uint 			#IconPosition 				= Enums.LEFT			//图标位置(LEFT,TOP,RIGHT,BOTTOM)
ProtectedWrite	Boolean		#FixedSize					= true					//固定Tab最小大小
ProtectedWrite Uint			#TabStripBorderStyle 	= Enums.BS_NONE	//Tab导航栏边框风格
ProtectedWrite Uint 			#ItemBkgndStyle 			= Enums.SOLID		//Tab背景风格
ProtectedWrite	real 			#ItemMinSize	 			= 80 						//px
ProtectedWrite	real 			#TabStripSize				= 30						//Tab导航栏大小(px)
ProtectedWrite SIZEF			#IconSize												//按钮图标大小
ProtectedWrite Uint			#ScrollBarBorderStyle	= Enums.BS_SOLID	//滚动条边框风格
ProtectedWrite real			#ScrollBarSize	 			= 14						//滚动条大小(px)
ProtectedWrite real			#ScrollBarArrowSize		= 12						//滚动条箭头大小(px)
ProtectedWrite RADIUSF		#ScrollBarRoundSize									//滚动条圆角大小(px,#ScrollBarBorderStyle=Enums.BS_ROUND时有效)
ProtectedWrite RECTF			#ScrollBarBorderMargin								//滚动条边框间距(px)
end variables

forward prototypes
public function long of_setfixedsize (readonly boolean fixed)
public function long of_seticonposition (readonly unsignedinteger position)
public function long of_setitembkgndstyle (readonly unsignedinteger style)
public function long of_setitembkgndstyle (readonly string style)
public function long of_settabstyle (readonly unsignedinteger style)
public function long of_settabstyle (readonly string style)
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
protected function unsignedlong _of_getthemecolor (readonly unsignedlong colorstyle)
public function long of_settextalign (readonly alignment align)
public function long of_settabstripborderstyle (readonly unsignedinteger style)
public function long of_settabstripborderstyle (readonly string style)
public function long of_setsheetlistbutton (readonly boolean show)
public function unsignedlong of_getitemcolor (readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state)
public function long of_seticonsize (readonly real width, readonly real height)
public function long of_setitemminsize (readonly real size)
public function long of_settabstripsize (readonly real size)
end prototypes

event _ongetitemcolor(integer index, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_BKGND
		if BitTest(state,Enums.STATE_HOVER + Enums.STATE_SELECTED) then
			if #ItemBkgndStyle = Enums.SOLID then
				color = _themeColorD3
			else
				color = _themeColor
			end if
		elseif BitTest(state,Enums.STATE_SELECTED) then
			if #ItemBkgndStyle = Enums.SOLID then
				color = _themeColorD4
			else
				color = _themeColorD1
			end if
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_HIGHLIGHTED) then
			color = HIGHLIGHT
		else
			color = _themeColorL1
		end if
	case CLR_BORDER
		color = _themeColorD4
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

public function long of_settabstyle (readonly unsignedinteger style);if #TabStyle = style then return RetCode.OK
	
choose case style
	case TBS_REGULAR,TBS_OFFICE,TBS_RIBBON,TBS_SOLID
		
		#TabStyle = style
		Event OnThemeChanged(EVT_TABSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_settabstyle (readonly string style);Uint newStyle

choose case Upper(style)
	case "REGULAR"
		newStyle = TBS_REGULAR
	case "OFFICE"
		newStyle = TBS_OFFICE
	case "RIBBON"
		newStyle = TBS_RIBBON
	case "SOLID"
		newStyle = TBS_SOLID
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return of_SetTabStyle(newStyle)
end function

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_window_mdiclient_theme") then
	n_cst_window_mdiclient_theme ln_newTheme
	ln_newTheme 			= newTheme
	#TabStyle 				= ln_newTheme.#TabStyle
	#TextAlign				= ln_newTheme.#TextAlign
	#SheetListButton 		= ln_newTheme.#SheetListButton
	#FixedSize 				= ln_newTheme.#FixedSize
	#TabStripBorderStyle = ln_newTheme.#TabStripBorderStyle
	#ItemBkgndStyle 		= ln_newTheme.#ItemBkgndStyle
	#ItemMinSize 			= ln_newTheme.#ItemMinSize
	#IconSize 				= ln_newTheme.#IconSize
	Font.of_SetFont(ln_newTheme.Font)
	SelectedFont.of_SetFont(ln_newTheme.SelectedFont)
end if

return RetCode.OK
end function

protected function unsignedlong _of_getthemecolor (readonly unsignedlong colorstyle);choose case colorStyle
	case CLASSIC
		return ARGB(255,233,230,222)
	case BLUE
		return ARGB(255,169,209,246)
	case PURPLE
		return ARGB(255,193,191,221)
	case OLIVE
		return ARGB(255,223,238,185)
	case SILVER
		return ARGB(255,202,202,202)
	case else
		return Super::_of_GetThemeColor(colorStyle)
end choose
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

public function long of_settabstripborderstyle (readonly unsignedinteger style);if #TabStripBorderStyle = style then return RetCode.OK

choose case style
	case Enums.BS_NONE,Enums.BS_SOLID
		
		#TabStripBorderStyle = style
		Event OnThemeChanged(EVT_TABSTRIPBORDERSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_settabstripborderstyle (readonly string style);Uint newStyle

choose case Upper(style)
	case "NONE"
		newStyle = Enums.BS_NONE
	case "SOLID"
		newStyle = Enums.BS_SOLID
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return of_SetTabStripBorderStyle(newStyle)
end function

public function long of_setsheetlistbutton (readonly boolean show);if #SheetListButton = show then return RetCode.OK

#SheetListButton = show
Event OnThemeChanged(EVT_SHEETLISTBUTTON)

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

public function long of_setitemminsize (readonly real size);if #ItemMinSize = Size then return RetCode.OK

#ItemMinSize = Size
Event OnThemeChanged(EVT_ITEMMINSIZE)

return RetCode.OK
end function

public function long of_settabstripsize (readonly real size);if #TabStripSize = Size then return RetCode.OK

#TabStripSize = Size
Event OnThemeChanged(EVT_TABSTRIPSIZE)

return RetCode.OK
end function

on n_cst_window_mdiclient_theme.create
call super::create
this.font=create font
this.selectedfont=create selectedfont
end on

on n_cst_window_mdiclient_theme.destroy
call super::destroy
destroy(this.font)
destroy(this.selectedfont)
end on

event constructor;call super::constructor;#IconSize.cx = Enums.SMALL
#IconSize.cy = Enums.SMALL

#BkgndOrientation = Enums.VERT
end event

event onsetpopupmenutheme;call super::onsetpopupmenutheme;pmTheme.of_SetItemBkgndStyle(#ItemBkgndStyle)
return 0
end event

event _ongetcolor;call super::_ongetcolor;choose case colorFlag
	case CLR_TABSTRIPBKGND
		color = _themeColor
	case CLR_SYSBTNBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		end if
	case CLR_SYSBTNBORDER
		color = _themeColorD4
	case CLR_SCROLLBARBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		else
			color = _themeColorL1
		end if
end choose
end event

type font from n_cst_font within n_cst_window_mdiclient_theme descriptor "pb_nvo" = "true" 
end type

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(Parent.EVT_FONT)
end event

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

type selectedfont from n_cst_font within n_cst_window_mdiclient_theme descriptor "pb_nvo" = "true" 
boolean #bold = true
end type

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(EVT_SELECTEDFONT)
end event

on selectedfont.create
call super::create
end on

on selectedfont.destroy
call super::destroy
end on

