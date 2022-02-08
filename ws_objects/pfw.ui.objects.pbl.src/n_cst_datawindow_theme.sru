$PBExportHeader$n_cst_datawindow_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_datawindow_theme from n_cst_base_theme
end type
type font from n_cst_font within n_cst_datawindow_theme
end type
end forward

global type n_cst_datawindow_theme from n_cst_base_theme
event ongetsystembuttoncolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongetsystembuttoncolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
font font
end type
global n_cst_datawindow_theme n_cst_datawindow_theme

type variables
/*--- Constants ---*/
Public:
//Color flags
Constant Uint CLR_TITLEBAR 							= CLR_CUSTOM + 1
Constant Uint CLR_TITLE		 							= CLR_CUSTOM + 2
//Event flags
Constant Uint EVT_TITLEBARHEIGHT					= EVT_CUSTOM + 1
Constant Uint EVT_TITLEALIGN							= EVT_CUSTOM + 2
Constant Uint EVT_SYSBTNBKGNDSTYLE				= EVT_CUSTOM + 3
Constant Uint EVT_SYSBTNBORDERSTYLE			= EVT_CUSTOM + 4
Constant Uint EVT_SYSROUNDSIZE					= EVT_CUSTOM + 5
Constant Uint EVT_SYSICONSIZE						= EVT_CUSTOM + 6
Constant Uint EVT_ICONSIZE							= EVT_CUSTOM + 7
Constant Uint EVT_SCROLLBARBORDERSTYLE		= EVT_CUSTOM + 8
Constant Uint EVT_SCROLLBARSIZE					= EVT_CUSTOM + 9
Constant Uint EVT_SCROLLBARARROWSIZE			= EVT_CUSTOM + 10
Constant Uint EVT_SCROLLBARROUNDSIZE			= EVT_CUSTOM + 11
Constant Uint EVT_SCROLLBARBORDERMARGIN	= EVT_CUSTOM + 12
Constant Uint EVT_FONT									= EVT_CUSTOM + 13

/*--- Properties ---*/
Public:
ProtectedWrite	Real			#TitleBarHeight				= 24						//标题栏高度(px)
ProtectedWrite	Alignment	#TitleAlign					= Left!					//标题栏文本对齐方式(Left!,Center!,Right!)
ProtectedWrite Uint			#SysBtnBkgndStyle 		= Enums.SOLID		//系统按钮背景风格
ProtectedWrite Uint			#SysBtnBorderStyle 		= Enums.BS_SOLID	//系统按钮边框风格
ProtectedWrite RADIUSF		#SysRoundSize 										//系统按钮圆角大小(px,只有#SysBtnBorderStyle=BS_ROUND时有效)
ProtectedWrite SIZEF			#SysIconSize											//系统按钮图标大小
ProtectedWrite SIZEF			#IconSize												//窗口图标大小
ProtectedWrite Uint			#ScrollBarBorderStyle	= Enums.BS_SOLID	//滚动条边框风格
ProtectedWrite Real			#ScrollBarSize	 			= 14						//滚动条大小(px)
ProtectedWrite Real			#ScrollBarArrowSize		= 12						//滚动条箭头大小(px)
ProtectedWrite RADIUSF		#ScrollBarRoundSize									//滚动条圆角大小(px,#ScrollBarBorderStyle=Enums.BS_ROUND时有效)
ProtectedWrite RECTF			#ScrollBarBorderMargin								//滚动条边框间距(px)
end variables

forward prototypes
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
public function long of_setscrollbarborderstyle (readonly unsignedinteger style)
public function long of_setscrollbarborderstyle (readonly string style)
public function long of_settitlealign (readonly alignment align)
public function long of_setsysbtnborderstyle (readonly unsignedinteger style)
public function long of_setsysbtnborderstyle (readonly string style)
public function long of_setsysbtnbkgndstyle (readonly unsignedinteger style)
public function long of_setsysbtnbkgndstyle (readonly string style)
public function unsignedlong of_getsystembuttoncolor (readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state)
public function long of_seticonsize (readonly real width, readonly real height)
public function long of_setscrollbararrowsize (readonly real size)
public function long of_setscrollbarroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
public function long of_setscrollbarsize (readonly real size)
public function long of_setsysiconsize (readonly real width, readonly real height)
public function long of_setsysroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
public function long of_settitlebarheight (real height)
public function long of_setscrollbarbordermargin (readonly real left, readonly real top, readonly real right, readonly real bottom)
end prototypes

event _ongetsystembuttoncolor(integer index, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_BKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		else
			color = _themeColor
		end if
	case CLR_BORDER
		color = _themeColorD4
end choose
end event

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_datawindow_theme") then
	n_cst_datawindow_theme ln_newTheme
	ln_newTheme 	= newTheme
	#TitleBarHeight 			= ln_newTheme.#TitleBarHeight
	#TitleAlign					= ln_newTheme.#TitleAlign
	#SysBtnBkgndStyle 		= ln_newTheme.#SysBtnBkgndStyle
	#SysBtnBorderStyle 		= ln_newTheme.#SysBtnBorderStyle
	#SysRoundSize 			= ln_newTheme.#SysRoundSize
	#SysIconSize 				= ln_newTheme.#SysIconSize
	#IconSize 					= ln_newTheme.#IconSize
	#ScrollBarSize 				= ln_newTheme.#ScrollBarSize
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

public function long of_settitlealign (readonly alignment align);if #TitleAlign = align then return RetCode.OK

choose case align
	case Left!,Center!,Right!
		
		#TitleAlign = align
		Event OnThemeChanged(EVT_TITLEALIGN)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setsysbtnborderstyle (readonly unsignedinteger style);if #SysBtnBorderStyle = style then return RetCode.OK
	
choose case style
	case Enums.BS_NONE,Enums.BS_SOLID,Enums.BS_ROUND
		
		#SysBtnBorderStyle = style
		Event OnThemeChanged(EVT_SYSBTNBORDERSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setsysbtnborderstyle (readonly string style);Uint newStyle

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

return of_SetSysBtnBorderStyle(newStyle)
end function

public function long of_setsysbtnbkgndstyle (readonly unsignedinteger style);if #SysBtnBkgndStyle = style then return RetCode.OK
	
choose case style
	case Enums.XP,Enums.VISTAEMBOSSED,Enums.VISTAORIGINAL,Enums.VISTAGLASS,Enums.SOLID,Enums.TRANSPARENT
		
		#SysBtnBkgndStyle = style
		Event OnThemeChanged(EVT_SYSBTNBKGNDSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setsysbtnbkgndstyle (readonly string style);Uint newStyle

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

return of_SetSysBtnBkgndStyle(newStyle)
end function

public function unsignedlong of_getsystembuttoncolor (readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state);Ulong color

SetNull(color)
Event OnGetSystemButtonColor(index,colorFlag,state,ref color)
if IsNull(color) then
	Event _OnGetSystemButtonColor(index,colorFlag,state,ref color)
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

public function long of_setsysiconsize (readonly real width, readonly real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if #SysIconSize.cx = width and #SysIconSize.cy = height then return RetCode.OK

#SysIconSize.cx = width
#SysIconSize.cy = height
Event OnThemeChanged(EVT_SYSICONSIZE)

return RetCode.OK
end function

public function long of_setsysroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom);if lefttop < 0 or righttop < 0 or leftbottom < 0 or rightbottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #SysRoundSize.leftTop = lefttop and #SysRoundSize.rightTop = righttop and #SysRoundSize.leftBottom = leftbottom and #SysRoundSize.rightBottom = rightbottom then return RetCode.OK

#SysRoundSize.leftTop = lefttop
#SysRoundSize.rightTop = righttop 
#SysRoundSize.leftBottom = leftbottom 
#SysRoundSize.rightBottom = rightbottom
Event OnThemeChanged(EVT_SYSROUNDSIZE)

return RetCode.OK
end function

public function long of_settitlebarheight (real height);if height = 0 then return RetCode.E_INVALID_ARGUMENT
if #TitleBarHeight = height then return RetCode.OK

#TitleBarHeight = height
Event OnThemeChanged(EVT_TITLEBARHEIGHT)

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

on n_cst_datawindow_theme.create
call super::create
this.font=create font
end on

on n_cst_datawindow_theme.destroy
call super::destroy
destroy(this.font)
end on

event constructor;call super::constructor;#SysIconSize.cx = Enums.SMALL
#SysIconSize.cy = Enums.SMALL

#SysRoundSize.leftTop = 2
#SysRoundSize.rightTop = 2
#SysRoundSize.leftBottom = 2
#SysRoundSize.rightBottom = 2

#IconSize.cx = Enums.SMALL
#IconSize.cy = Enums.SMALL

#ScrollBarRoundSize.leftTop = 2
#ScrollBarRoundSize.rightTop = 2
#ScrollBarRoundSize.leftBottom = 2
#ScrollBarRoundSize.rightBottom = 2
end event

event _ongetcolor;call super::_ongetcolor;choose case colorFlag
	case CLR_TITLEBAR
		color = _themeColor
	case CLR_TITLE
		color = _themeColorDark
end choose
end event

type font from n_cst_font within n_cst_datawindow_theme descriptor "pb_nvo" = "true" 
end type

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(Parent.EVT_FONT)
end event

