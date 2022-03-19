$PBExportHeader$n_cst_ribbonbar_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_ribbonbar_theme from n_cst_base_theme
end type
type font from n_cst_font within n_cst_ribbonbar_theme
end type
type selectedfont from n_cst_font within n_cst_ribbonbar_theme
end type
end forward

global type n_cst_ribbonbar_theme from n_cst_base_theme
event ongetitemcolor ( n_cst_ribbonbar_baseitem item,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event ongettabcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event ongetpanelcolor ( n_cst_ribbonbar_panel panel,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event ongetcategorycolor ( n_cst_ribbonbar_category category,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongetcategorycolor ( n_cst_ribbonbar_category category,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongetitemcolor ( n_cst_ribbonbar_baseitem item,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongetpanelcolor ( n_cst_ribbonbar_panel panel,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongettabcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event ongettoolbaritemcolor ( n_cst_ribbonbar_toolbar toolbar,  integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongettoolbaritemcolor ( n_cst_ribbonbar_toolbar toolbar,  integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
font font
selectedfont selectedfont
end type
global n_cst_ribbonbar_theme n_cst_ribbonbar_theme

type variables
/*--- Constants --*/
Public:
//Ribbon styles
Constant Uint RBS_OFFICE2007	= 0
Constant Uint RBS_OFFICE2010	= 1
//Tab styles
Constant Uint TBS_OFFICE2007	= 0
Constant Uint TBS_OFFICE2013	= 1
Constant Uint TBS_WPS2012		= 2
Constant Uint TBS_WPS2013		= 3
//Color flags
Constant Uint CLR_TABSTRIPBKGND		= CLR_CUSTOM + 1
Constant Uint CLR_SYSBTNBKGND			= CLR_CUSTOM + 2
Constant Uint CLR_SYSBTNBORDER		= CLR_CUSTOM + 3
Constant Uint CLR_CAPTIONBKGND		= CLR_CUSTOM + 4
Constant Uint CLR_LAUNCHBTNBKGND	= CLR_CUSTOM + 5
Constant Uint CLR_LAUNCHBTNBORDER	= CLR_CUSTOM + 6
//Event flags
Constant Uint EVT_RIBBONSTYLE					= EVT_CUSTOM + 1
Constant Uint EVT_TABSTYLE 						= EVT_CUSTOM + 2
Constant Uint EVT_TEXTALIGN						= EVT_CUSTOM + 3
Constant Uint EVT_TABICONPOSITION			= EVT_CUSTOM + 4
Constant Uint EVT_TABSTRIPBAR					= EVT_CUSTOM + 5
Constant Uint EVT_COLLAPSEBUTTON			= EVT_CUSTOM + 6
Constant Uint EVT_RIBBONCOLLAPSED			= EVT_CUSTOM + 7
Constant Uint EVT_BORDERSHADOW				= EVT_CUSTOM + 8
Constant Uint EVT_FIXEDFIRSTTAB				= EVT_CUSTOM + 9
Constant Uint EVT_TABFIXEDSIZE					= EVT_CUSTOM + 10
Constant Uint EVT_TABSTRIPBKGNDSTYLE		= EVT_CUSTOM + 11
Constant Uint EVT_TABBKGNDSTYLE				= EVT_CUSTOM + 12
Constant Uint EVT_PANELBKGNDSTYLE			= EVT_CUSTOM + 13
Constant Uint EVT_ITEMBKGNDSTYLE				= EVT_CUSTOM + 14
Constant Uint EVT_TABSTRIPBORDERSTYLE		= EVT_CUSTOM + 15
Constant Uint EVT_PANELBORDERSTYLE			= EVT_CUSTOM + 16
Constant Uint EVT_ITEMBORDERSTYLE			= EVT_CUSTOM + 17
Constant Uint EVT_TABMINSIZE					= EVT_CUSTOM + 18
Constant Uint EVT_TABSTRIPSIZE					= EVT_CUSTOM + 19
Constant Uint EVT_TABMARGIN						= EVT_CUSTOM + 20
Constant Uint EVT_TABPADDING						= EVT_CUSTOM + 21
Constant Uint EVT_PANELMARGIN					= EVT_CUSTOM + 22
Constant Uint EVT_PANELROUNDSIZE				= EVT_CUSTOM + 23
Constant Uint EVT_ITEMROUNDSIZE				= EVT_CUSTOM + 24
Constant Uint EVT_SHADOWSIZE					= EVT_CUSTOM + 25
Constant Uint EVT_TABICONSIZE					= EVT_CUSTOM + 26
Constant Uint EVT_PANELICONSIZE				= EVT_CUSTOM + 27
Constant Uint EVT_SMALLICONSIZE				= EVT_CUSTOM + 28
Constant Uint EVT_LARGEICONSIZE				= EVT_CUSTOM + 29
Constant Uint EVT_TABSTRIPBORDERMARGIN	= EVT_CUSTOM + 30
Constant Uint EVT_TABSTRIPOFFSET				= EVT_CUSTOM + 31
Constant Uint EVT_FONT								= EVT_CUSTOM + 32
Constant Uint EVT_SELECTEDFONT				= EVT_CUSTOM + 33

/*--- Properties ---*/
Public:
ProtectedWrite Uint			#RibbonStyle				= RBS_OFFICE2010		//Ribbon风格
ProtectedWrite Uint			#TabStyle 					= TBS_OFFICE2013		//Tab风格
ProtectedWrite Alignment	#TextAlign					= Left!						//Tab文字对齐方式(Left!,Center!,Right!)
ProtectedWrite Uint			#TabIconPosition 			= Enums.LEFT				//Tab图标位置(LEFT,TOP,RIGHT,BOTTOM)
ProtectedWrite Boolean		#TabStripBar				= true						//显示Tab导航栏
ProtectedWrite Boolean		#CollapseButton	 		= true						//显示Ribbon折叠按钮
ProtectedWrite Boolean		#RibbonCollapsed	 		= false						//Ribbon的折叠状态
ProtectedWrite	Boolean		#BorderShadow			= false						//边框阴影
ProtectedWrite Boolean		#FixedFirstTab			 	= false						//固定第一个Tab(index=1),使其不被滚动
ProtectedWrite	Boolean		#TabFixedSize				= true						//固定Tab最小大小
ProtectedWrite Uint			#TabStripBkgndStyle 		= Enums.SOLID			//Tab导航栏背景风格
ProtectedWrite Uint			#TabBkgndStyle 			= Enums.SOLID			//Tab背景风格
ProtectedWrite Uint			#PanelBkgndStyle 			= Enums.SOLID			//Panel背景风格
ProtectedWrite Uint			#ItemBkgndStyle 			= Enums.SOLID			//子项背景风格
ProtectedWrite Uint			#TabStripBorderStyle 	= Enums.BS_SOLID		//Tab导航栏边框风格
ProtectedWrite Uint			#PanelBorderStyle 		= Enums.BS_SOLID		//Panel边框风格
ProtectedWrite Uint			#ItemBorderStyle 			= Enums.BS_SOLID		//子项边框风格
ProtectedWrite	real			#TabMinSize	 			= 30 							//dip
ProtectedWrite	real			#TabStripSize				= 30							//TabStrip高度(dip)
ProtectedWrite	real			#TabMargin					= 4							//固定Tab外间距大小(dip)
ProtectedWrite	real			#TabPadding					= 2						//固定Tab内间距大小(dip)
ProtectedWrite	real			#PanelMargin				= 4							//dip
ProtectedWrite	real			#ShadowSize				= 6							//dip
ProtectedWrite RADIUSF		#PanelRoundSize 											//Panel圆角大小(dip,只有#PanelBorderStyle=BS_ROUND时有效)
ProtectedWrite RADIUSF		#ItemRoundSize 											//子项圆角大小(dip,只有#ItemBorderStyle=BS_ROUND时有效)
ProtectedWrite SIZEF			#TabIconSize												//Tab图标大小
ProtectedWrite SIZEF		#PanelIconSize												//Panel图标大小
ProtectedWrite SIZEF			#SmallIconSize												//Samll图标大小
ProtectedWrite SIZEF		#LargeIconSize												//Large图标大小
ProtectedWrite	RECTF			#TabStripBorderMargin
ProtectedWrite RECTF			#TabStripOffset
end variables

forward prototypes
public function long of_setbordershadow (readonly boolean shadow)
public function long of_setitembkgndstyle (readonly unsignedinteger style)
public function long of_setitembkgndstyle (readonly string style)
public function long of_setitemborderstyle (readonly unsignedinteger style)
public function long of_setitemborderstyle (readonly string style)
public function long of_setpanelborderstyle (readonly unsignedinteger style)
public function long of_setpanelborderstyle (readonly string style)
public function long of_setribboncollapsed (readonly boolean collapsed)
public function long of_setribbonstyle (readonly unsignedinteger style)
public function long of_setribbonstyle (readonly string style)
public function long of_settabbkgndstyle (readonly unsignedinteger style)
public function long of_settabbkgndstyle (readonly string style)
public function long of_settabfixedsize (readonly boolean fixed)
public function long of_settabiconposition (readonly unsignedinteger position)
public function long of_settabstyle (readonly unsignedinteger style)
public function long of_settabstyle (readonly string style)
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
protected function unsignedlong _of_getthemecolor (readonly unsignedlong colorstyle)
public function long of_settabstripbar (readonly boolean show)
public function long of_setcollapsebutton (readonly boolean show)
public function long of_settabstripbkgndstyle (readonly unsignedinteger style)
public function long of_settabstripbkgndstyle (readonly string style)
public function long of_setpanelbkgndstyle (readonly unsignedinteger style)
public function long of_setpanelbkgndstyle (readonly string style)
public function long of_settextalign (readonly alignment align)
public function long of_settabstripborderstyle (readonly unsignedinteger style)
public function long of_settabstripborderstyle (readonly string style)
public function long of_setfixedfirsttab (readonly boolean fixed)
public function unsignedlong of_getcategorycolor (readonly n_cst_ribbonbar_category category, readonly unsignedinteger colorflag, readonly unsignedlong state)
public function unsignedlong of_getitemcolor (readonly n_cst_ribbonbar_baseitem item, readonly unsignedinteger colorflag, readonly unsignedlong state)
public function unsignedlong of_getpanelcolor (readonly n_cst_ribbonbar_panel panel, readonly unsignedinteger colorflag, readonly unsignedlong state)
public function unsignedlong of_gettabcolor (readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state)
public function unsignedlong of_gettoolbaritemcolor (readonly n_cst_ribbonbar_toolbar toolbar, readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state)
public function long of_setitemroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
public function long of_setlargeiconsize (readonly real width, readonly real height)
public function long of_setpaneliconsize (readonly real width, readonly real height)
public function long of_setpanelmargin (readonly real margin)
public function long of_setpanelroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
public function long of_setshadowsize (readonly real size)
public function long of_setsmalliconsize (readonly real width, readonly real height)
public function long of_settabiconsize (readonly real width, readonly real height)
public function long of_settabmargin (readonly real margin)
public function long of_settabminsize (readonly real size)
public function long of_settabstripbordermargin (readonly real left, readonly real top, readonly real right, readonly real bottom)
public function long of_settabstripoffset (readonly real left, readonly real top, readonly real right, readonly real bottom)
public function long of_settabstripsize (readonly real size)
public function long of_settabpadding (readonly real padding)
public function string of_getitemicon (readonly n_cst_ribbonbar_baseitem item, readonly string uri, readonly unsignedlong state)
public function string of_getpanelicon (readonly n_cst_ribbonbar_panel panel, readonly string uri, readonly unsignedlong state)
public function string of_gettabicon (readonly integer index, readonly string uri, readonly unsignedlong state)
public function string of_gettoolbaritemicon (readonly n_cst_ribbonbar_toolbar toolbar, readonly integer index, readonly string uri, readonly unsignedlong state)
end prototypes

event _ongetcategorycolor(n_cst_ribbonbar_category category, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_SCROLLBARBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL3
		else
			color = _themeColorL2
		end if
	case CLR_SCROLLBARBORDER
		color = _themeColorD4
	case CLR_SYSBTNBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		end if
	case CLR_SYSBTNBORDER
		color = _themeColorD4
end choose
end event

event _ongetitemcolor(n_cst_ribbonbar_baseitem item, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_BKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorD1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL3
		elseif BitTest(state,Enums.STATE_HIGHLIGHTED) then
			color = HIGHLIGHT
		else
			color = _themeColorL2
		end if
	case CLR_BORDER
		color = _themeColorD3
end choose
end event

event _ongetpanelcolor(n_cst_ribbonbar_panel panel, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_BKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColor
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		else
			color = _themeColorL1
		end if
	case CLR_BORDER
		color = _themeColorD3
	case CLR_CAPTIONBKGND
		if BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorD1
		else
			color = _themeColorD2
		end if
	case CLR_LAUNCHBTNBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL3
		end if
	case CLR_LAUNCHBTNBORDER
		color = _themeColorD3
end choose
end event

event _ongettabcolor(integer index, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_BKGND
		if BitTest(state,Enums.STATE_HOVER + Enums.STATE_SELECTED) then
			if #TabBkgndStyle = Enums.SOLID then
				color = _themeColorD3
			else
				color = _themeColor
			end if
		elseif BitTest(state,Enums.STATE_SELECTED) then
			if #TabBkgndStyle = Enums.SOLID then
				color = _themeColorD4
			else
				color = _themeColorD1
			end if
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL3
		elseif BitTest(state,Enums.STATE_HIGHLIGHTED) then
			color = HIGHLIGHT
		else
			color = _themeColorL2
		end if
	case CLR_BORDER
		color = _themeColorD4
end choose
end event

event _ongettoolbaritemcolor(n_cst_ribbonbar_toolbar toolbar, integer index, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_BKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorD1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL3
		elseif BitTest(state,Enums.STATE_HIGHLIGHTED) then
			color = HIGHLIGHT
		else
			color = _themeColorL2
		end if
	case CLR_CHEVRONBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorD1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL3
		end if
	case CLR_BORDER,CLR_CHEVRONBORDER
		color = _themeColorD3
end choose
end event

public function long of_setbordershadow (readonly boolean shadow);if #BorderShadow = shadow then return RetCode.OK

#BorderShadow = shadow
Event OnThemeChanged(EVT_BORDERSHADOW)

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

public function long of_setpanelborderstyle (readonly unsignedinteger style);if #PanelBorderStyle = style then return RetCode.OK

choose case style
	case Enums.BS_NONE,Enums.BS_SOLID,Enums.BS_ROUND
		
		#PanelBorderStyle = style
		Event OnThemeChanged(EVT_PANELBORDERSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setpanelborderstyle (readonly string style);Uint newStyle

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

return of_SetPanelBorderStyle(newStyle)
end function

public function long of_setribboncollapsed (readonly boolean collapsed);if #RibbonCollapsed = collapsed then return RetCode.OK
if collapsed and Not #TabStripBar then return RetCode.FAILED

#RibbonCollapsed = collapsed
Event OnThemeChanged(EVT_RIBBONCOLLAPSED)

return RetCode.OK
end function

public function long of_setribbonstyle (readonly unsignedinteger style);if #RibbonStyle = style then return RetCode.OK
	
choose case style
	case RBS_OFFICE2007,RBS_OFFICE2010
		
		#RibbonStyle = style
		Event OnThemeChanged(EVT_RIBBONSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setribbonstyle (readonly string style);Uint newStyle

choose case Upper(style)
	case "OFFICE2007"
		newStyle = RBS_OFFICE2007
	case "OFFICE2010"
		newStyle = RBS_OFFICE2010
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return of_SetRibbonStyle(newStyle)
end function

public function long of_settabbkgndstyle (readonly unsignedinteger style);if #TabBkgndStyle = style then return RetCode.OK
	
choose case style
	case Enums.XP,Enums.VISTAEMBOSSED,Enums.VISTAORIGINAL,Enums.VISTAGLASS,Enums.SOLID,Enums.TRANSPARENT
		
		#TabBkgndStyle = style
		Event OnThemeChanged(EVT_TABBKGNDSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_settabbkgndstyle (readonly string style);Uint newStyle

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

return of_SetTabBkgndStyle(newStyle)
end function

public function long of_settabfixedsize (readonly boolean fixed);if #TabFixedSize = fixed then return RetCode.OK

#TabFixedSize = fixed
Event OnThemeChanged(EVT_TABFIXEDSIZE)

return RetCode.OK
end function

public function long of_settabiconposition (readonly unsignedinteger position);if #TabIconPosition = position then return RetCode.OK

choose case position
	case Enums.LEFT,Enums.TOP,Enums.RIGHT,Enums.BOTTOM
		
		#TabIconPosition = position
		Event OnThemeChanged(EVT_TABICONPOSITION)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_settabstyle (readonly unsignedinteger style);if #TabStyle = style then return RetCode.OK
	
choose case style
	case TBS_OFFICE2007,TBS_OFFICE2013,TBS_WPS2012,TBS_WPS2013
		
		#TabStyle = style
		Event OnThemeChanged(EVT_TABSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_settabstyle (readonly string style);Uint newStyle

choose case Upper(style)
	case "OFFICE2007"
		newStyle = TBS_OFFICE2007
	case "OFFICE2013"
		newStyle = TBS_OFFICE2013
	case "WPS2012"
		newStyle = TBS_WPS2012
	case "WPS2013"
		newStyle = TBS_WPS2013
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return of_SetTabStyle(newStyle)
end function

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_ribbonbar_theme") then
	n_cst_ribbonbar_theme ln_newTheme
	ln_newTheme 				= newTheme
	#RibbonStyle				= ln_newTheme.#RibbonStyle
	#TabStyle 					= ln_newTheme.#TabStyle
	#TextAlign					= ln_newTheme.#TextAlign
	#TabIconPosition 			= ln_newTheme.#TabIconPosition
	#TabStripBar				= ln_newTheme.#TabStripBar
	#CollapseButton	 		= ln_newTheme.#CollapseButton
	#RibbonCollapsed	 		= ln_newTheme.#RibbonCollapsed
	#BorderShadow			= ln_newTheme.#BorderShadow
	#FixedFirstTab	 			= ln_newTheme.#FixedFirstTab
	#TabFixedSize				= ln_newTheme.#TabFixedSize
	#TabStripBkgndStyle 		= ln_newTheme.#TabStripBkgndStyle
	#TabBkgndStyle 			= ln_newTheme.#TabBkgndStyle
	#PanelBkgndStyle 			= ln_newTheme.#PanelBkgndStyle
	#ItemBkgndStyle 			= ln_newTheme.#ItemBkgndStyle
	#TabStripBorderStyle 	= ln_newTheme.#TabStripBorderStyle
	#PanelBorderStyle 		= ln_newTheme.#PanelBorderStyle
	#ItemBorderStyle 			= ln_newTheme.#ItemBorderStyle
	#TabMinSize	 			= ln_newTheme.#TabMinSize
	#TabStripSize				= ln_newTheme.#TabStripSize
	#TabMargin					= ln_newTheme.#TabMargin
	#TabPadding					= ln_newTheme.#TabPadding
	#PanelMargin				= ln_newTheme.#PanelMargin
	#ShadowSize				= ln_newTheme.#ShadowSize
	#PanelRoundSize 			= ln_newTheme.#PanelRoundSize
	#ItemRoundSize 			= ln_newTheme.#ItemRoundSize
	#TabIconSize				= ln_newTheme.#TabIconSize
	#PanelIconSize				= ln_newTheme.#PanelIconSize
	#SmallIconSize				= ln_newTheme.#SmallIconSize
	#LargeIconSize				= ln_newTheme.#LargeIconSize
	#TabStripBorderMargin	= ln_newTheme.#TabStripBorderMargin
	#TabStripOffset			= ln_newTheme.#TabStripOffset
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

public function long of_settabstripbar (readonly boolean show);if #TabStripBar = show then return RetCode.OK
if Not show and #RibbonCollapsed then return RetCode.FAILED

#TabStripBar = show
Event OnThemeChanged(EVT_TABSTRIPBAR)

return RetCode.OK
end function

public function long of_setcollapsebutton (readonly boolean show);if #CollapseButton = show then return RetCode.OK

#CollapseButton = show
Event OnThemeChanged(EVT_COLLAPSEBUTTON)

return RetCode.OK
end function

public function long of_settabstripbkgndstyle (readonly unsignedinteger style);if #TabStripBkgndStyle = style then return RetCode.OK
	
choose case style
	case Enums.XP,Enums.VISTAEMBOSSED,Enums.VISTAORIGINAL,Enums.VISTAGLASS,Enums.SOLID,Enums.TRANSPARENT
		
		#TabStripBkgndStyle = style
		Event OnThemeChanged(EVT_TABSTRIPBKGNDSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_settabstripbkgndstyle (readonly string style);Uint newStyle

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

return of_SetTabStripBkgndStyle(newStyle)
end function

public function long of_setpanelbkgndstyle (readonly unsignedinteger style);if #PanelBkgndStyle = style then return RetCode.OK
	
choose case style
	case Enums.XP,Enums.VISTAEMBOSSED,Enums.VISTAORIGINAL,Enums.VISTAGLASS,Enums.SOLID,Enums.TRANSPARENT
		
		#PanelBkgndStyle = style
		Event OnThemeChanged(EVT_PANELBKGNDSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setpanelbkgndstyle (readonly string style);Uint newStyle

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

return of_SetPanelBkgndStyle(newStyle)
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

public function long of_setfixedfirsttab (readonly boolean fixed);if #FixedFirstTab = fixed then return RetCode.OK

#FixedFirstTab = fixed
Event OnThemeChanged(EVT_FIXEDFIRSTTAB)

return RetCode.OK
end function

public function unsignedlong of_getcategorycolor (readonly n_cst_ribbonbar_category category, readonly unsignedinteger colorflag, readonly unsignedlong state);Ulong color

SetNull(color)
Event OnGetCategoryColor(category,colorFlag,state,ref color)
if IsNull(color) then
	Event _OnGetCategoryColor(category,colorFlag,state,ref color)
end if
if IsNull(color) then color = of_GetColor(colorFlag,state)

return color
end function

public function unsignedlong of_getitemcolor (readonly n_cst_ribbonbar_baseitem item, readonly unsignedinteger colorflag, readonly unsignedlong state);Ulong color

SetNull(color)
Event OnGetItemColor(item,colorFlag,state,ref color)
if IsNull(color) then
	Event _OnGetItemColor(item,colorFlag,state,ref color)
end if
if IsNull(color) then color = of_GetColor(colorFlag,state)

return color
end function

public function unsignedlong of_getpanelcolor (readonly n_cst_ribbonbar_panel panel, readonly unsignedinteger colorflag, readonly unsignedlong state);Ulong color

SetNull(color)
Event OnGetPanelColor(panel,colorFlag,state,ref color)
if IsNull(color) then
	Event _OnGetPanelColor(panel,colorFlag,state,ref color)
end if
if IsNull(color) then color = of_GetColor(colorFlag,state)

return color
end function

public function unsignedlong of_gettabcolor (readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state);Ulong color

SetNull(color)
Event OnGetTabColor(index,colorFlag,state,ref color)
if IsNull(color) then
	Event _OnGetTabColor(index,colorFlag,state,ref color)
end if
if IsNull(color) then color = of_GetColor(colorFlag,state)

return color
end function

public function unsignedlong of_gettoolbaritemcolor (readonly n_cst_ribbonbar_toolbar toolbar, readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state);Ulong color

SetNull(color)
Event OnGetToolBarItemColor(toolbar,index,colorFlag,state,ref color)
if IsNull(color) then
	Event _OnGetToolBarItemColor(toolbar,index,colorFlag,state,ref color)
end if
if IsNull(color) then color = of_GetColor(colorFlag,state)

return color
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

public function long of_setlargeiconsize (readonly real width, readonly real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if width < #SmallIconSize.cx or height < #SmallIconSize.cy then return RetCode.E_INVALID_ARGUMENT
if #LargeIconSize.cx = width and #LargeIconSize.cy = height then return RetCode.OK

#LargeIconSize.cx = width
#LargeIconSize.cy = height

Event OnThemeChanged(EVT_LARGEICONSIZE)

return RetCode.OK
end function

public function long of_setpaneliconsize (readonly real width, readonly real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if #PanelIconSize.cx = width and #PanelIconSize.cy = height then return RetCode.OK

#PanelIconSize.cx = width
#PanelIconSize.cy = height

Event OnThemeChanged(EVT_PANELICONSIZE)

return RetCode.OK
end function

public function long of_setpanelmargin (readonly real margin);if #PanelMargin = margin then return RetCode.OK

#PanelMargin = margin
Event OnThemeChanged(EVT_PANELMARGIN)

return RetCode.OK
end function

public function long of_setpanelroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom);if lefttop < 0 or righttop < 0 or leftbottom < 0 or rightbottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #PanelRoundSize.leftTop = lefttop and #PanelRoundSize.rightTop = righttop and #PanelRoundSize.leftBottom = leftbottom and #PanelRoundSize.rightBottom = rightbottom then return RetCode.OK

#PanelRoundSize.leftTop = lefttop
#PanelRoundSize.rightTop = righttop 
#PanelRoundSize.leftBottom = leftbottom 
#PanelRoundSize.rightBottom = rightbottom

Event OnThemeChanged(EVT_PANELROUNDSIZE)

return RetCode.OK
end function

public function long of_setshadowsize (readonly real size);//if size = 0 then return RetCode.E_INVALID_ARGUMENT
if size = #ShadowSize then return RetCode.OK

#ShadowSize = size
Event OnThemeChanged(EVT_SHADOWSIZE)

return RetCode.OK
end function

public function long of_setsmalliconsize (readonly real width, readonly real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if width > #LargeIconSize.cx or height > #LargeIconSize.cy then return RetCode.E_INVALID_ARGUMENT
if #SmallIconSize.cx = width and #SmallIconSize.cy = height then return RetCode.OK

#SmallIconSize.cx = width
#SmallIconSize.cy = height

Event OnThemeChanged(EVT_SMALLICONSIZE)

return RetCode.OK
end function

public function long of_settabiconsize (readonly real width, readonly real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if #TabIconSize.cx = width and #TabIconSize.cy = height then return RetCode.OK

#TabIconSize.cx = width
#TabIconSize.cy = height

Event OnThemeChanged(EVT_TABICONSIZE)

return RetCode.OK
end function

public function long of_settabmargin (readonly real margin);if #TabMargin = margin then return RetCode.OK

#TabMargin = margin
Event OnThemeChanged(EVT_TABMARGIN)

return RetCode.OK
end function

public function long of_settabminsize (readonly real size);if #TabMinSize = Size then return RetCode.OK

#TabMinSize = Size
Event OnThemeChanged(EVT_TABMINSIZE)

return RetCode.OK
end function

public function long of_settabstripbordermargin (readonly real left, readonly real top, readonly real right, readonly real bottom);if left < 0 or top < 0 or right < 0 or bottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #TabStripBorderMargin.left = left and #TabStripBorderMargin.top = top and &
	#TabStripBorderMargin.right = right and #TabStripBorderMargin.bottom = bottom then return RetCode.OK

#TabStripBorderMargin.left = left
#TabStripBorderMargin.top = top
#TabStripBorderMargin.right = right
#TabStripBorderMargin.bottom = bottom

Event OnThemeChanged(EVT_TABSTRIPBORDERMARGIN)

return RetCode.OK
end function

public function long of_settabstripoffset (readonly real left, readonly real top, readonly real right, readonly real bottom);if left < 0 or top < 0 or right < 0 or bottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #TabStripOffset.left = left and #TabStripOffset.top = top and &
	#TabStripOffset.right = right and #TabStripOffset.bottom = bottom then return RetCode.OK

#TabStripOffset.left = left
#TabStripOffset.top = top
#TabStripOffset.right = right
#TabStripOffset.bottom = bottom

Event OnThemeChanged(EVT_TABSTRIPOFFSET)

return RetCode.OK
end function

public function long of_settabstripsize (readonly real size);if #TabStripSize = Size then return RetCode.OK

#TabStripSize = Size
Event OnThemeChanged(EVT_TABSTRIPSIZE)

return RetCode.OK
end function

public function long of_settabpadding (readonly real padding);if #TabPadding = padding then return RetCode.OK

#TabPadding = padding
Event OnThemeChanged(EVT_TABPADDING)

return RetCode.OK
end function

public function string of_getitemicon (readonly n_cst_ribbonbar_baseitem item, readonly string uri, readonly unsignedlong state);if Pos(uri,".svg") > 0 then
	if Pos(uri,"{") = 0 then
		return uri + "{fill:" + _of_ToRGB(of_GetItemColor(item,CLR_ICON,state)) + "}"
	else
		return uri
	end if
elseif Left(uri,7) = "font://" then
	if Pos(uri,"{") = 0 then
		return uri + "{color:" + _of_ToRGB(of_GetItemColor(item,CLR_ICON,state)) + "}"
	else
		return uri
	end if
else
	return uri
end if
end function

public function string of_getpanelicon (readonly n_cst_ribbonbar_panel panel, readonly string uri, readonly unsignedlong state);if Pos(uri,".svg") > 0 then
	if Pos(uri,"{") = 0 then
		return uri + "{fill:" + _of_ToRGB(of_GetPanelColor(panel,CLR_ICON,state)) + "}"
	else
		return uri
	end if
elseif Left(uri,7) = "font://" then
	if Pos(uri,"{") = 0 then
		return uri + "{color:" + _of_ToRGB(of_GetPanelColor(panel,CLR_ICON,state)) + "}"
	else
		return uri
	end if
else
	return uri
end if
end function

public function string of_gettabicon (readonly integer index, readonly string uri, readonly unsignedlong state);if Pos(uri,".svg") > 0 then
	if Pos(uri,"{") = 0 then
		return uri + "{fill:" + _of_ToRGB(of_GetTabColor(index,CLR_ICON,state)) + "}"
	else
		return uri
	end if
elseif Left(uri,7) = "font://" then
	if Pos(uri,"{") = 0 then
		return uri + "{color:" + _of_ToRGB(of_GetTabColor(index,CLR_ICON,state)) + "}"
	else
		return uri
	end if
else
	return uri
end if
end function

public function string of_gettoolbaritemicon (readonly n_cst_ribbonbar_toolbar toolbar, readonly integer index, readonly string uri, readonly unsignedlong state);if Pos(uri,".svg") > 0 then
	if Pos(uri,"{") = 0 then
		return uri + "{fill:" + _of_ToRGB(of_GetToolbarItemColor(toolbar,index,CLR_ICON,state)) + "}"
	else
		return uri
	end if
elseif Left(uri,7) = "font://" then
	if Pos(uri,"{") = 0 then
		return uri + "{color:" + _of_ToRGB(of_GetToolbarItemColor(toolbar,index,CLR_ICON,state)) + "}"
	else
		return uri
	end if
else
	return uri
end if
end function

on n_cst_ribbonbar_theme.create
call super::create
this.font=create font
this.selectedfont=create selectedfont
end on

on n_cst_ribbonbar_theme.destroy
call super::destroy
destroy(this.font)
destroy(this.selectedfont)
end on

event constructor;call super::constructor;#PanelRoundSize.leftTop = 2
#PanelRoundSize.rightTop = 2
#PanelRoundSize.leftBottom = 2
#PanelRoundSize.rightBottom = 2
#ItemRoundSize.leftTop = 2
#ItemRoundSize.rightTop = 2
#ItemRoundSize.leftBottom = 2
#ItemRoundSize.rightBottom = 2

#TabIconSize.cx = Enums.SMALL
#TabIconSize.cy = Enums.SMALL
#PanelIconSize.cx = Enums.LARGE
#PanelIconSize.cy = Enums.LARGE
#SmallIconSize.cx = Enums.SMALL
#SmallIconSize.cy = Enums.SMALL
#LargeIconSize.cx = Enums.LARGE
#LargeIconSize.cy = Enums.LARGE

#TabStripBorderMargin.left = 2
#TabStripBorderMargin.top = 2
#TabStripBorderMargin.right = 2
#TabStripBorderMargin.bottom = 2

#BkgndOrientation = Enums.VERT
end event

event onsetpopupmenutheme;call super::onsetpopupmenutheme;pmTheme.of_SetItemBkgndStyle(#ItemBkgndStyle)
pmTheme.of_SetItemBorderStyle(#ItemBorderStyle)
pmTheme.of_SetItemBkgndStyle(#ItemBkgndStyle)
return 0
end event

event _ongetcolor;call super::_ongetcolor;choose case colorFlag
	case CLR_TABSTRIPBKGND
		color = _themeColorL1
	case CLR_SYSBTNBKGND
		if BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		end if
	case CLR_SYSBTNBORDER
		color = _themeColorD4
end choose
end event

type font from n_cst_font within n_cst_ribbonbar_theme descriptor "pb_nvo" = "true" 
end type

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(Parent.EVT_FONT)
end event

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

type selectedfont from n_cst_font within n_cst_ribbonbar_theme descriptor "pb_nvo" = "true" 
end type

on selectedfont.create
call super::create
end on

on selectedfont.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(EVT_SELECTEDFONT)
end event

