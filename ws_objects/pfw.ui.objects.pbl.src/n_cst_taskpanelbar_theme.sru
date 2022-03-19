$PBExportHeader$n_cst_taskpanelbar_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_taskpanelbar_theme from n_cst_base_theme
end type
end forward

global type n_cst_taskpanelbar_theme from n_cst_base_theme
event ongetpanelcolor ( n_cst_taskpanelbar_panel panel,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event ongetitemcolor ( n_cst_taskpanelbar_baseitem item,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongetitemcolor ( n_cst_taskpanelbar_baseitem item,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongetpanelcolor ( n_cst_taskpanelbar_panel panel,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongettoolbaritemcolor ( n_cst_taskpanelbar_toolbar toolbar,  integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event ongettoolbaritemcolor ( n_cst_taskpanelbar_toolbar toolbar,  integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
end type
global n_cst_taskpanelbar_theme n_cst_taskpanelbar_theme

type variables
/*--- Constants --*/
Public:
//Color flags
Constant Uint CLR_TITLEBARBKGND		= CLR_CUSTOM + 1
Constant Uint CLR_TITLEBARBORDER		= CLR_CUSTOM + 2
Constant Uint CLR_TITLE		 				= CLR_CUSTOM + 3
//Event flags
Constant Uint EVT_PANELICONPOSITION		= EVT_CUSTOM + 1
Constant Uint EVT_PANELARROWPOSITION	= EVT_CUSTOM + 2
Constant Uint EVT_PANELBKGNDSTYLE		= EVT_CUSTOM + 3
Constant Uint EVT_TITLEBARBKGNDSTYLE	= EVT_CUSTOM + 4
Constant Uint EVT_ITEMBKGNDSTYLE			= EVT_CUSTOM + 5
Constant Uint EVT_PANELBORDERSTYLE		= EVT_CUSTOM + 6
Constant Uint EVT_ITEMBORDERSTYLE		= EVT_CUSTOM + 7
Constant Uint EVT_PANELMARGIN				= EVT_CUSTOM + 8
Constant Uint EVT_PANELROUNDSIZE			= EVT_CUSTOM + 9
Constant Uint EVT_ITEMROUNDSIZE			= EVT_CUSTOM + 10
Constant Uint EVT_PANELICONSIZE			= EVT_CUSTOM + 11
Constant Uint EVT_ITEMICONSIZE				= EVT_CUSTOM + 12

/*--- Properties ---*/
Public:
ProtectedWrite Uint			#PanelIconPosition		= Enums.LEFT				//Panel图标位置(Enums.LEFT,Enums.RIGHT)
ProtectedWrite Uint			#PanelArrowPosition		= Enums.LEFT				//Panel标题箭头位置(Enums.LEFT,Enums.RIGHT)
ProtectedWrite Uint			#PanelBkgndStyle 			= Enums.SOLID			//Panel背景风格
ProtectedWrite Uint			#TitleBarBkgndStyle 		= Enums.SOLID			//Panel标题栏背景风格
ProtectedWrite Uint			#ItemBkgndStyle 			= Enums.SOLID			//子项背景风格
ProtectedWrite Uint			#PanelBorderStyle 		= Enums.BS_SOLID		//Panel边框风格
ProtectedWrite Uint			#ItemBorderStyle 			= Enums.BS_SOLID		//子项边框风格
ProtectedWrite	real			#PanelMargin				= 4							//px
ProtectedWrite RADIUSF		#PanelRoundSize 											//Panel圆角大小(px,只有#PanelBorderStyle=BS_ROUND时有效)
ProtectedWrite RADIUSF		#ItemRoundSize											//子项圆角大小(px,只有#ItemBorderStyle=BS_ROUND时有效)
ProtectedWrite SIZEF			#PanelIconSize												//Panel图标大小
ProtectedWrite SIZEF			#ItemIconSize												//Item图标大小
end variables

forward prototypes
public function long of_setpanelborderstyle (readonly unsignedinteger style)
public function long of_setpanelborderstyle (readonly string style)
public function long of_setitembkgndstyle (readonly unsignedinteger style)
public function long of_setitembkgndstyle (readonly string style)
public function long of_setitemborderstyle (readonly unsignedinteger style)
public function long of_setitemborderstyle (readonly string style)
public function long of_setpanelbkgndstyle (readonly unsignedinteger style)
public function long of_setpanelbkgndstyle (readonly string style)
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
public function long of_settitlebarbkgndstyle (readonly unsignedinteger style)
public function long of_settitlebarbkgndstyle (readonly string style)
public function long of_setpanelarrowposition (readonly unsignedinteger position)
public function long of_setpaneliconposition (readonly unsignedinteger position)
public function unsignedlong of_getitemcolor (readonly n_cst_taskpanelbar_baseitem item, readonly unsignedinteger colorflag, readonly unsignedlong state)
public function unsignedlong of_getpanelcolor (readonly n_cst_taskpanelbar_panel panel, readonly unsignedinteger colorflag, readonly unsignedlong state)
public function unsignedlong of_gettoolbaritemcolor (readonly n_cst_taskpanelbar_toolbar toolbar, readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state)
public function long of_setitemiconsize (readonly real width, readonly real height)
public function long of_setitemroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
public function long of_setpaneliconsize (readonly real width, readonly real height)
public function long of_setpanelmargin (readonly real margin)
public function long of_setpanelroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
public function string of_getitemicon (readonly n_cst_taskpanelbar_baseitem item, readonly string uri, readonly unsignedlong state)
public function string of_getpanelicon (readonly n_cst_taskpanelbar_panel panel, readonly string uri, readonly unsignedlong state)
public function string of_gettoolbaritemicon (readonly n_cst_taskpanelbar_toolbar toolbar, readonly integer index, readonly string uri, readonly unsignedlong state)
end prototypes

event _ongetitemcolor(n_cst_taskpanelbar_baseitem item, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_BKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorD1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL3
		elseif BitTest(state,Enums.STATE_HIGHLIGHTED) then
			color = HIGHLIGHT
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

event _ongetpanelcolor(n_cst_taskpanelbar_panel panel, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_BKGND
		if BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		else
			color = _themeColorL1
		end if
	case CLR_BORDER
		color = _themeColorD3
	case CLR_TITLEBARBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorD2
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorD1
		else
			color = _themeColorD2
		end if
	case CLR_TITLEBARBORDER
		color = _themeColorD3
	case CLR_TITLE
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		else
			color = _themeColorDark
		end if
end choose
end event

event _ongettoolbaritemcolor(n_cst_taskpanelbar_toolbar toolbar, integer index, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_BKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorD1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL3
		elseif BitTest(state,Enums.STATE_HIGHLIGHTED) then
			color = HIGHLIGHT
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

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_taskpanelbar_theme") then
	n_cst_taskpanelbar_theme ln_newTheme
	ln_newTheme 			= newTheme
	#PanelIconPosition 	= ln_newTheme.#PanelIconPosition
	#PanelArrowPosition 	= ln_newTheme.#PanelArrowPosition
	#PanelBkgndStyle 		= ln_newTheme.#PanelBkgndStyle
	#TitleBarBkgndStyle 	= ln_newTheme.#TitleBarBkgndStyle
	#ItemBkgndStyle 		= ln_newTheme.#ItemBkgndStyle
	#PanelBorderStyle 	= ln_newTheme.#PanelBorderStyle
	#ItemBorderStyle 		= ln_newTheme.#ItemBorderStyle
	#PanelMargin 			= ln_newTheme.#PanelMargin
	#PanelRoundSize 		= ln_newTheme.#PanelRoundSize
	#ItemRoundSize 		= ln_newTheme.#ItemRoundSize
	#PanelIconSize 		= ln_newTheme.#PanelIconSize
	#ItemIconSize 			= ln_newTheme.#ItemIconSize
end if

return RetCode.OK
end function

public function long of_settitlebarbkgndstyle (readonly unsignedinteger style);if #TitleBarBkgndStyle = style then return RetCode.OK
	
choose case style
	case Enums.XP,Enums.VISTAEMBOSSED,Enums.VISTAORIGINAL,Enums.VISTAGLASS,Enums.SOLID,Enums.TRANSPARENT
		
		#TitleBarBkgndStyle = style
		Event OnThemeChanged(EVT_TITLEBARBKGNDSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_settitlebarbkgndstyle (readonly string style);Uint newStyle

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

return of_SetTitleBarBkgndStyle(newStyle)
end function

public function long of_setpanelarrowposition (readonly unsignedinteger position);if #PanelArrowPosition = position then return RetCode.OK

choose case position
	case Enums.LEFT,Enums.RIGHT
		
		#PanelArrowPosition = position
		Event OnThemeChanged(EVT_PANELARROWPOSITION)
	
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_setpaneliconposition (readonly unsignedinteger position);if #PanelIconPosition = position then return RetCode.OK

choose case position
	case Enums.LEFT,Enums.RIGHT
		
		#PanelIconPosition = position
		Event OnThemeChanged(EVT_PANELICONPOSITION)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function unsignedlong of_getitemcolor (readonly n_cst_taskpanelbar_baseitem item, readonly unsignedinteger colorflag, readonly unsignedlong state);Ulong color

SetNull(color)
Event OnGetItemColor(item,colorFlag,state,ref color)
if IsNull(color) then
	Event _OnGetItemColor(item,colorFlag,state,ref color)
end if
if IsNull(color) then color = of_GetColor(colorFlag,state)

return color
end function

public function unsignedlong of_getpanelcolor (readonly n_cst_taskpanelbar_panel panel, readonly unsignedinteger colorflag, readonly unsignedlong state);Ulong color

SetNull(color)
Event OnGetPanelColor(panel,colorFlag,state,ref color)
if IsNull(color) then
	Event _OnGetPanelColor(panel,colorFlag,state,ref color)
end if
if IsNull(color) then color = of_GetColor(colorFlag,state)

return color
end function

public function unsignedlong of_gettoolbaritemcolor (readonly n_cst_taskpanelbar_toolbar toolbar, readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state);Ulong color

SetNull(color)
Event OnGetToolBarItemColor(toolbar,index,colorFlag,state,ref color)
if IsNull(color) then
	Event _OnGetToolBarItemColor(toolbar,index,colorFlag,state,ref color)
end if
if IsNull(color) then color = of_GetColor(colorFlag,state)

return color
end function

public function long of_setitemiconsize (readonly real width, readonly real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if #ItemIconSize.cx = width and #ItemIconSize.cy = height then return RetCode.OK

#ItemIconSize.cx = width
#ItemIconSize.cy = height

Event OnThemeChanged(EVT_ITEMICONSIZE)

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

public function string of_getitemicon (readonly n_cst_taskpanelbar_baseitem item, readonly string uri, readonly unsignedlong state);if Pos(uri,".svg") > 0 then
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

public function string of_getpanelicon (readonly n_cst_taskpanelbar_panel panel, readonly string uri, readonly unsignedlong state);if Pos(uri,".svg") > 0 then
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

public function string of_gettoolbaritemicon (readonly n_cst_taskpanelbar_toolbar toolbar, readonly integer index, readonly string uri, readonly unsignedlong state);if Pos(uri,".svg") > 0 then
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

on n_cst_taskpanelbar_theme.create
call super::create
end on

on n_cst_taskpanelbar_theme.destroy
call super::destroy
end on

event constructor;call super::constructor;#PanelRoundSize.leftTop = 2
#PanelRoundSize.rightTop = 2
#PanelRoundSize.leftBottom = 2
#PanelRoundSize.rightBottom = 2
#ItemRoundSize.leftTop = 2
#ItemRoundSize.rightTop = 2
#ItemRoundSize.leftBottom = 2
#ItemRoundSize.rightBottom = 2

#PanelIconSize.cx = Enums.SMALL
#PanelIconSize.cy = Enums.SMALL
#ItemIconSize.cx = Enums.SMALL
#ItemIconSize.cy = Enums.SMALL

#BkgndOrientation = Enums.VERT
end event

event onsetpopupmenutheme;call super::onsetpopupmenutheme;pmTheme.of_SetItemBkgndStyle(#ItemBkgndStyle)
pmTheme.of_SetItemBorderStyle(#ItemBorderStyle)
return 0
end event

event _ongetcolor;call super::_ongetcolor;choose case colorFlag
	case CLR_SCROLLBARBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL3
		else
			color = _themeColorL2
		end if
	case CLR_SCROLLBARBORDER
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		else
			color = _themeColorD4
		end if
end choose
end event

