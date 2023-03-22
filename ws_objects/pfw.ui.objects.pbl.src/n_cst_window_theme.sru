$PBExportHeader$n_cst_window_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_window_theme from n_cst_base_theme
end type
type font from n_cst_font within n_cst_window_theme
end type
end forward

global type n_cst_window_theme from n_cst_base_theme
event ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  unsignedinteger objecttype,  ref unsignedlong color )
event _ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  unsignedinteger objecttype,  ref unsignedlong color )
font font
end type
global n_cst_window_theme n_cst_window_theme

type variables
/*--- Constants --*/
Public:
//Item styles
Constant Uint ITS_XP 		= 0
Constant Uint ITS_VISTA 	= 1
Constant Uint ITS_WIN8 		= 2
Constant Uint ITS_WIN10 	= 3
Constant Uint ITS_QQ 		= 4
//Color flags
Constant Uint CLR_TITLE						= CLR_CUSTOM + 1
Constant Uint CLR_MENUBARBKGND		= CLR_CUSTOM + 2
Constant Uint CLR_MENUBARBORDER		= CLR_CUSTOM + 3
Constant Uint CLR_TOOLBARBKGND		= CLR_CUSTOM + 4
Constant Uint CLR_TOOLBARBORDER		= CLR_CUSTOM + 5
//Changed event flags
Constant Uint EVT_TITLEBAR 							= EVT_CUSTOM + 1
Constant Uint EVT_MENUBAR 							= EVT_CUSTOM + 2
Constant Uint EVT_STATUSBAR 						= EVT_CUSTOM + 3
Constant Uint EVT_TOOLBAR 							= EVT_CUSTOM + 4
Constant Uint EVT_CLIENTTHEMEBKGND				= EVT_CUSTOM + 5
Constant Uint EVT_TITLEALIGN							= EVT_CUSTOM + 6
Constant Uint EVT_ITEMSTYLE							= EVT_CUSTOM + 7
Constant Uint EVT_ITEMBKGNDSTYLE					= EVT_CUSTOM + 8
Constant Uint EVT_MENUBARBKGNDSTYLE			= EVT_CUSTOM + 9
Constant Uint EVT_MENUBARBORDERSTYLE			= EVT_CUSTOM + 10
Constant Uint EVT_MENUBARITEMBKGNDSTYLE		= EVT_CUSTOM + 11
Constant Uint EVT_MENUBARITEMBORDERSTYLE	= EVT_CUSTOM + 12
Constant Uint EVT_TOOLBARBKGNDSTYLE			= EVT_CUSTOM + 13
Constant Uint EVT_TOOLBARBORDERSTYLE			= EVT_CUSTOM + 14
Constant Uint EVT_TOOLBARITEMBKGNDSTYLE		= EVT_CUSTOM + 15
Constant Uint EVT_TOOLBARITEMBORDERSTYLE	= EVT_CUSTOM + 16
Constant Uint EVT_TITLEBARHEIGHT					= EVT_CUSTOM + 17
Constant Uint EVT_MENUBARHEIGHT					= EVT_CUSTOM + 18
Constant Uint EVT_STATUSBARHEIGHT				= EVT_CUSTOM + 19
Constant Uint EVT_TOOLBARHEIGHT					= EVT_CUSTOM + 20
Constant Uint EVT_ICONSIZE							= EVT_CUSTOM + 21
Constant Uint EVT_SCROLLBARBORDERSTYLE		= EVT_CUSTOM + 22
Constant Uint EVT_SCROLLBARSIZE					= EVT_CUSTOM + 23
Constant Uint EVT_SCROLLBARARROW				= EVT_CUSTOM + 24
Constant Uint EVT_SCROLLBARARROWSIZE			= EVT_CUSTOM + 25
Constant Uint EVT_SCROLLBARROUNDSIZE			= EVT_CUSTOM + 26
Constant Uint EVT_SCROLLBARBORDERMARGIN	= EVT_CUSTOM + 27
Constant Uint EVT_FONT									= EVT_CUSTOM + 28

/*--- Properties ---*/
Public:
ProtectedWrite	Boolean		#TitleBar														//显示标题栏(为NULL时使用窗口的TitleBar属性,默认为NULL)
ProtectedWrite	Boolean		#MenuBar						= false					//显示菜单栏
ProtectedWrite	Boolean		#StatusBar						= false					//显示状态栏
ProtectedWrite	Boolean		#ToolBar							= false					//显示工具栏
ProtectedWrite	Boolean		#ClientThemeBkgnd			= false					//开启客户区主题背景
ProtectedWrite	Alignment	#TitleAlign						= Left!					//标题栏文本对齐方式(Left!,Center!,Right!)
ProtectedWrite Uint			#ItemStyle						= ITS_WIN8				//标题栏按钮风格(ITS_XP,ITS_VISTA,ITS_WIN8,ITS_WIN10,ITS_QQ)
ProtectedWrite Uint			#ItemBkgndStyle				= Enums.SOLID		//标题栏按钮背景风格
ProtectedWrite Uint			#MenuBarBkgndStyle			= Enums.SOLID		//菜单栏背景风格
ProtectedWrite Uint			#MenuBarBorderStyle			= Enums.BS_SOLID 	//菜单栏边框风格
ProtectedWrite Uint			#MenuBarItemBkgndStyle	= Enums.SOLID		//菜单栏按钮背景风格
ProtectedWrite Uint			#MenuBarItemBorderStyle	= Enums.BS_SOLID 	//菜单栏按钮边框风格
ProtectedWrite Uint			#ToolBarBkgndStyle			= Enums.SOLID		//菜单栏背景风格
ProtectedWrite Uint			#ToolBarBorderStyle			= Enums.BS_SOLID 	//菜单栏边框风格
ProtectedWrite Uint			#ToolBarItemBkgndStyle		= Enums.SOLID		//菜单栏按钮背景风格
ProtectedWrite Uint			#ToolBarItemBorderStyle	= Enums.BS_SOLID 	//菜单栏按钮边框风格
ProtectedWrite	real			#TitleBarHeight					= 36						//标题栏高度(px)
ProtectedWrite	real			#MenuBarHeight				= 24						//菜单栏高度(px)
ProtectedWrite	real			#StatusBarHeight				= 20						//状态栏高度(px)
ProtectedWrite	real			#ToolBarHeight					= 24						//工具栏高度(px)
ProtectedWrite	SIZEF			#IconSize													//窗口图标大小
ProtectedWrite Uint			#ScrollBarBorderStyle		= Enums.BS_SOLID	//滚动条边框风格
ProtectedWrite real			#ScrollBarSize	 				= 14						//滚动条大小(px)
ProtectedWrite Boolean		#ScrollBarArrow										//显示滚动条箭头
ProtectedWrite real			#ScrollBarArrowSize			= 12						//滚动条箭头大小(px)
ProtectedWrite RADIUSF		#ScrollBarRoundSize										//滚动条圆角大小(px,#ScrollBarBorderStyle=Enums.BS_ROUND时有效)
ProtectedWrite RECTF			#ScrollBarBorderMargin									//滚动条边框间距(px)
end variables
forward prototypes
public function long of_setclientthemebkgnd (readonly boolean enable)
public function long of_setitembkgndstyle (readonly unsignedinteger style)
public function long of_setitembkgndstyle (readonly string style)
public function long of_setitemstyle (readonly unsignedinteger style)
public function long of_setitemstyle (readonly string style)
public function long of_settitlealign (readonly alignment align)
public function long of_setstatusbar (readonly boolean show)
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
protected function unsignedlong _of_getthemecolor (readonly unsignedlong colorstyle)
public function long of_setmenubar (readonly boolean show)
public function long of_setmenubarbkgndstyle (readonly unsignedinteger style)
public function long of_setmenubaritembkgndstyle (readonly unsignedinteger style)
public function long of_setmenubarbkgndstyle (readonly string style)
public function long of_setmenubaritembkgndstyle (readonly string style)
public function long of_setmenubaritemborderstyle (readonly unsignedinteger style)
public function long of_setmenubaritemborderstyle (readonly string style)
public function long of_setscrollbarborderstyle (readonly unsignedinteger style)
public function long of_setscrollbarborderstyle (readonly string style)
public function long of_setmenubarborderstyle (readonly unsignedinteger style)
public function long of_setmenubarborderstyle (readonly string style)
public function long of_settoolbarbkgndstyle (readonly unsignedinteger style)
public function long of_settoolbarborderstyle (readonly unsignedinteger style)
public function long of_settoolbaritemborderstyle (readonly unsignedinteger style)
public function long of_settoolbaritembkgndstyle (readonly string style)
public function long of_settoolbaritembkgndstyle (readonly unsignedinteger style)
public function long of_settoolbaritemborderstyle (readonly string style)
public function long of_settoolbarborderstyle (readonly string style)
public function long of_settoolbarbkgndstyle (readonly string style)
public function long of_settoolbar (readonly boolean show)
public function unsignedlong of_getitemcolor (readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state, readonly unsignedinteger objecttype)
public function long of_settitlebar (readonly boolean show)
public function long of_seticonsize (readonly real width, readonly real height)
public function long of_setmenubarheight (readonly real height)
public function long of_setscrollbararrowsize (readonly real size)
public function long of_setscrollbarbordermargin (readonly real left, readonly real top, readonly real right, readonly real bottom)
public function long of_setscrollbarroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
public function long of_setscrollbarsize (readonly real size)
public function long of_setstatusbarheight (readonly real height)
public function long of_settitlebarheight (readonly real height)
public function long of_settoolbarheight (readonly real height)
public function string of_getitemicon (readonly integer index, readonly string uri, readonly unsignedlong state, readonly unsignedinteger objecttype)
public function long of_setscrollbararrow (readonly boolean show)
end prototypes

event _ongetitemcolor(integer index, unsignedinteger colorflag, unsignedlong state, unsignedinteger objecttype, ref unsignedlong color);
choose case colorFlag
	case CLR_BKGND,CLR_CHEVRONBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_HIGHLIGHTED) then
			color = HIGHLIGHT
		else
			color = _themeColorL1
		end if
	case CLR_BORDER,CLR_CHEVRONBORDER
		color = _themeColorD1
	/*case CLR_CHEVRONBKGND
		if BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		end if
	case CLR_CHEVRONBORDER
		color = _themeColorD4*/
end choose
end event

public function long of_setclientthemebkgnd (readonly boolean enable);if #ClientThemeBkgnd = enable then return RetCode.OK

#ClientThemeBkgnd = enable
Event OnThemeChanged(EVT_CLIENTTHEMEBKGND)

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

public function long of_setitemstyle (readonly unsignedinteger style);if #ItemStyle = style then return RetCode.OK
	
choose case style
	case ITS_XP,ITS_VISTA,ITS_WIN8,ITS_WIN10,ITS_QQ
		
		#ItemStyle = style
		Event OnThemeChanged(EVT_ITEMSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setitemstyle (readonly string style);Uint newStyle

choose case Upper(style)
	case "XP"
		newStyle = ITS_XP
	case "VISTA"
		newStyle = ITS_VISTA
	case "WIN8"
		newStyle = ITS_WIN8
	case "WIN10"
		newStyle = ITS_WIN10
	case "QQ"
		newStyle = ITS_QQ
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return of_SetItemStyle(newStyle)
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

public function long of_setstatusbar (readonly boolean show);if #StatusBar = show then return RetCode.OK

#StatusBar = show
Event OnThemeChanged(EVT_STATUSBAR)

return RetCode.OK
end function

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_window_theme") then
	n_cst_window_theme ln_newTheme
	ln_newTheme 	= newTheme
	#TitleBar 						= ln_newTheme.#TitleBar
	#MenuBar 						= ln_newTheme.#MenuBar
	#StatusBar 						= ln_newTheme.#StatusBar
	#ToolBar 						= ln_newTheme.#ToolBar
	#ClientThemeBkgnd 			= ln_newTheme.#ClientThemeBkgnd
	#TitleAlign 						= ln_newTheme.#TitleAlign
	#ItemStyle 						= ln_newTheme.#ItemStyle
	#ItemBkgndStyle 				= ln_newTheme.#ItemBkgndStyle
	#MenuBarBkgndStyle 			= ln_newTheme.#MenuBarBkgndStyle
	#MenuBarBorderStyle			= ln_newTheme.#MenuBarBorderStyle
	#MenuBarItemBkgndStyle	= ln_newTheme.#MenuBarItemBkgndStyle
	#MenuBarItemBorderStyle	= ln_newTheme.#MenuBarItemBorderStyle
	#ToolBarBkgndStyle 			= ln_newTheme.#ToolBarBkgndStyle
	#ToolBarBorderStyle			= ln_newTheme.#ToolBarBorderStyle
	#ToolBarItemBkgndStyle		= ln_newTheme.#ToolBarItemBkgndStyle
	#ToolBarItemBorderStyle	= ln_newTheme.#ToolBarItemBorderStyle
	#TitleBarHeight 				= ln_newTheme.#TitleBarHeight
	#StatusBarHeight 				= ln_newTheme.#StatusBarHeight
	#ToolBarHeight 				= ln_newTheme.#ToolBarHeight
	#IconSize 						= ln_newTheme.#IconSize
	#ScrollBarSize 					= ln_newTheme.#ScrollBarSize
	#ScrollBarArrow	 			= ln_newTheme.#ScrollBarArrow
	#ScrollBarArrowSize 			= ln_newTheme.#ScrollBarArrowSize
	#ScrollBarBorderStyle 		= ln_newTheme.#ScrollBarBorderStyle
	#ScrollBarRoundSize 			= ln_newTheme.#ScrollBarRoundSize
	#ScrollBarBorderMargin 		= ln_newTheme.#ScrollBarBorderMargin
	Font.of_SetFont(ln_newTheme.Font)
end if

return RetCode.OK
end function

protected function unsignedlong _of_getthemecolor (readonly unsignedlong colorstyle);choose case colorStyle
	case BLUE
		return ARGB(255,166,202,240)
	case else
		return Super::_of_GetThemeColor(colorStyle)
end choose
end function

public function long of_setmenubar (readonly boolean show);if #MenuBar = show then return RetCode.OK

#MenuBar = show
Event OnThemeChanged(EVT_MENUBAR)

return RetCode.OK
end function

public function long of_setmenubarbkgndstyle (readonly unsignedinteger style);if #MenuBarBkgndStyle = style then return RetCode.OK
	
choose case style
	case Enums.XP,Enums.VISTAEMBOSSED,Enums.VISTAORIGINAL,Enums.VISTAGLASS,Enums.SOLID,Enums.TRANSPARENT
		
		#MenuBarBkgndStyle = style
		Event OnThemeChanged(EVT_MENUBARBKGNDSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setmenubaritembkgndstyle (readonly unsignedinteger style);if #MenuBarItemBkgndStyle = style then return RetCode.OK
	
choose case style
	case Enums.XP,Enums.VISTAEMBOSSED,Enums.VISTAORIGINAL,Enums.VISTAGLASS,Enums.SOLID,Enums.TRANSPARENT
		
		#MenuBarItemBkgndStyle = style
		Event OnThemeChanged(EVT_MENUBARITEMBKGNDSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setmenubarbkgndstyle (readonly string style);Uint newStyle

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

return of_SetMenuBarBkgndStyle(newStyle)
end function

public function long of_setmenubaritembkgndstyle (readonly string style);Uint newStyle

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

return of_SetMenuBarItemBkgndStyle(newStyle)
end function

public function long of_setmenubaritemborderstyle (readonly unsignedinteger style);if #MenuBarItemBorderStyle = style then return RetCode.OK
	
choose case style
	case Enums.BS_NONE,Enums.BS_SOLID,Enums.BS_ROUND
		
		#MenuBarItemBorderStyle = style
		Event OnThemeChanged(EVT_MENUBARITEMBORDERSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setmenubaritemborderstyle (readonly string style);Uint newStyle

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

return of_SetMenuBarItemBorderStyle(newStyle)
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

public function long of_setmenubarborderstyle (readonly unsignedinteger style);if #MenuBarBorderStyle = style then return RetCode.OK
	
choose case style
	case Enums.BS_NONE,Enums.BS_SOLID
		
		#MenuBarBorderStyle = style
		Event OnThemeChanged(EVT_MENUBARBORDERSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setmenubarborderstyle (readonly string style);Uint newStyle

choose case Upper(style)
	case "NONE"
		newStyle = Enums.BS_NONE
	case "SOLID"
		newStyle = Enums.BS_SOLID
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return of_SetMenuBarBorderStyle(newStyle)
end function

public function long of_settoolbarbkgndstyle (readonly unsignedinteger style);if #ToolBarBkgndStyle = style then return RetCode.OK
	
choose case style
	case Enums.XP,Enums.VISTAEMBOSSED,Enums.VISTAORIGINAL,Enums.VISTAGLASS,Enums.SOLID,Enums.TRANSPARENT
		
		#ToolBarBkgndStyle = style
		Event OnThemeChanged(EVT_TOOLBARBKGNDSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_settoolbarborderstyle (readonly unsignedinteger style);if #ToolBarBorderStyle = style then return RetCode.OK
	
choose case style
	case Enums.BS_NONE,Enums.BS_SOLID
		
		#ToolBarBorderStyle = style
		Event OnThemeChanged(EVT_TOOLBARBORDERSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_settoolbaritemborderstyle (readonly unsignedinteger style);if #ToolBarItemBorderStyle = style then return RetCode.OK
	
choose case style
	case Enums.BS_NONE,Enums.BS_SOLID,Enums.BS_ROUND
		
		#ToolBarItemBorderStyle = style
		Event OnThemeChanged(EVT_TOOLBARITEMBORDERSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_settoolbaritembkgndstyle (readonly string style);Uint newStyle

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

return of_SetToolBarItemBkgndStyle(newStyle)
end function

public function long of_settoolbaritembkgndstyle (readonly unsignedinteger style);if #ToolBarItemBkgndStyle = style then return RetCode.OK
	
choose case style
	case Enums.XP,Enums.VISTAEMBOSSED,Enums.VISTAORIGINAL,Enums.VISTAGLASS,Enums.SOLID,Enums.TRANSPARENT
		
		#ToolBarItemBkgndStyle = style
		Event OnThemeChanged(EVT_TOOLBARITEMBKGNDSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_settoolbaritemborderstyle (readonly string style);Uint newStyle

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

return of_SetToolBarItemBorderStyle(newStyle)
end function

public function long of_settoolbarborderstyle (readonly string style);Uint newStyle

choose case Upper(style)
	case "NONE"
		newStyle = Enums.BS_NONE
	case "SOLID"
		newStyle = Enums.BS_SOLID
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return of_SetToolBarBorderStyle(newStyle)
end function

public function long of_settoolbarbkgndstyle (readonly string style);Uint newStyle

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

return of_SetToolBarBkgndStyle(newStyle)
end function

public function long of_settoolbar (readonly boolean show);if #ToolBar = show then return RetCode.OK

#ToolBar = show
Event OnThemeChanged(EVT_TOOLBAR)

return RetCode.OK
end function

public function unsignedlong of_getitemcolor (readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state, readonly unsignedinteger objecttype);Ulong color

SetNull(color)
Event OnGetItemColor(index,colorFlag,state,objectType,ref color)
if IsNull(color) then
	Event _OnGetItemColor(index,colorFlag,state,objectType,ref color)
end if
if IsNull(color) then color = of_GetColor(colorFlag,state)

return color
end function

public function long of_settitlebar (readonly boolean show);if #TitleBar = show then return RetCode.OK

#TitleBar = show
Event OnThemeChanged(EVT_TITLEBAR)

return RetCode.OK
end function

public function long of_seticonsize (readonly real width, readonly real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if #IconSize.cx = width and #IconSize.cy = height then return RetCode.OK

#IconSize.cx = width
#IconSize.cy = height
Event OnThemeChanged(EVT_ICONSIZE)

return RetCode.OK
end function

public function long of_setmenubarheight (readonly real height);if height = 0 then return RetCode.E_INVALID_ARGUMENT
if #MenuBarHeight = height then return RetCode.OK

#MenuBarHeight = height
Event OnThemeChanged(EVT_MENUBARHEIGHT)

return RetCode.OK
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

public function long of_setstatusbarheight (readonly real height);if #StatusBarHeight = height then return RetCode.OK

#StatusBarHeight = height
Event OnThemeChanged(EVT_STATUSBARHEIGHT)

return RetCode.OK
end function

public function long of_settitlebarheight (readonly real height);if height = 0 then return RetCode.E_INVALID_ARGUMENT
if #TitleBarHeight = height then return RetCode.OK

#TitleBarHeight = height
Event OnThemeChanged(EVT_TITLEBARHEIGHT)

return RetCode.OK
end function

public function long of_settoolbarheight (readonly real height);if height = 0 then return RetCode.E_INVALID_ARGUMENT
if #ToolBarHeight = height then return RetCode.OK

#ToolBarHeight = height
Event OnThemeChanged(EVT_TOOLBARHEIGHT)

return RetCode.OK
end function

public function string of_getitemicon (readonly integer index, readonly string uri, readonly unsignedlong state, readonly unsignedinteger objecttype);if Pos(uri,".svg") > 0 then
	if Pos(uri,"{") = 0 then
		return uri + "{fill:" + _of_ToRGB(of_GetItemColor(index,CLR_ICON,state,objectType)) + "}"
	else
		return uri
	end if
elseif Left(uri,7) = "font://" then
	if Pos(uri,"{") = 0 then
		return uri + "{color:" + _of_ToRGB(of_GetItemColor(index,CLR_ICON,state,objectType)) + "}"
	else
		return uri
	end if
else
	return uri
end if
end function

public function long of_setscrollbararrow (readonly boolean show);if #ScrollBarArrow = show then return RetCode.OK

#ScrollBarArrow = show
Event OnThemeChanged(EVT_SCROLLBARARROW)

return RetCode.OK
end function

on n_cst_window_theme.create
call super::create
this.font=create font
end on

on n_cst_window_theme.destroy
call super::destroy
destroy(this.font)
end on

event constructor;call super::constructor;#RoundSize.leftTop = 1
#RoundSize.rightTop = 1
#RoundSize.leftBottom = 1
#RoundSize.rightBottom = 1

#IconSize.cx = Enums.SMALL
#IconSize.cy = Enums.SMALL

#BorderMargin.left = 4
#BorderMargin.top = 4
#BorderMargin.right = 4
#BorderMargin.bottom = 4

#BkgndOrientation = Enums.VERT

#ScrollBarRoundSize.leftTop = 2
#ScrollBarRoundSize.rightTop = 2
#ScrollBarRoundSize.leftBottom = 2
#ScrollBarRoundSize.rightBottom = 2

SetNull(#TitleBar)
end event

event onsetpopupmenutheme;call super::onsetpopupmenutheme;pmTheme.of_SetItemBkgndStyle(#ItemBkgndStyle)
if #ItemStyle = ITS_WIN8 or #ItemStyle = ITS_WIN10 then
	pmTheme.of_SetItemBorderStyle(Enums.BS_SOLID)
else
	pmTheme.of_SetItemBorderStyle(Enums.BS_ROUND)
end if
return 0
end event

event _ongetcolor;call super::_ongetcolor;choose case colorFlag
	case CLR_TITLE
		if BitTest(state,Enums.STATE_ACTIVE) then
			color = _themeColorDark
		else
			color = ARGBLighten(_themeColorDark,0.2)
		end if
	case CLR_CHEVRONBKGND
		if BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		end if
	case CLR_CHEVRONBORDER
		color = _themeColorD4
	case CLR_MENUBARBKGND
		color = _themeColorL1
	case CLR_MENUBARBORDER
		color = _themeColorD4
	case CLR_TOOLBARBKGND
		color = _themeColorL1
	case CLR_TOOLBARBORDER
		color = _themeColorD4
end choose
end event

event _onthemecolorchanged;call super::_onthemecolorchanged;Uint a,r,g,b

SplitARGB(_themeColor,ref a,ref r,ref g,ref b)

if r < 100 or g < 100 or b < 100 then
	_themeColorIcon = ARGB(255,255,255,255)
	_themeColorIconHover = _themeColorIcon
	_themeColorIconPressed = _themeColorIcon
	_themeColorIconFocus = _themeColorIcon
else
	_themeColorIcon = ARGB(255,80,80,80)
	_themeColorIconHover = ARGB(255,120,120,120)
	_themeColorIconPressed = ARGB(255,60,60,60)
	_themeColorIconFocus = ARGB(255,50,50,50)
end if
end event

type font from n_cst_font within n_cst_window_theme descriptor "pb_nvo" = "true" 
long #size = 12
boolean #bold = true
end type

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(Parent.EVT_FONT)
end event

