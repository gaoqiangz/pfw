$PBExportHeader$n_cst_splitcontainer_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_splitcontainer_theme from n_cst_base_theme
end type
end forward

global type n_cst_splitcontainer_theme from n_cst_base_theme
event ongetpanelcolor ( n_cst_splitcontainer_panel panel,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongetpanelcolor ( n_cst_splitcontainer_panel panel,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
end type
global n_cst_splitcontainer_theme n_cst_splitcontainer_theme

type variables
/*--- Constants --*/
Public:
//Color flags
Constant Uint CLR_COLLAPSEBUTTONBKGND	= CLR_CUSTOM + 1
Constant Uint CLR_COLLAPSEBUTTONBORDER	= CLR_CUSTOM + 2
Constant Uint CLR_TITLEBARBKGND				= CLR_CUSTOM + 3
Constant Uint CLR_TITLEBARBORDER				= CLR_CUSTOM + 4
//Event flags
Constant Uint EVT_TITLEBARBKGNDSTYLE	= EVT_CUSTOM + 1
Constant Uint EVT_TITLEBARBORDERSTYLE	= EVT_CUSTOM + 2
Constant Uint EVT_ITEMBKGNDSTYLE			= EVT_CUSTOM + 3
Constant Uint EVT_ITEMBORDERSTYLE		= EVT_CUSTOM + 4
Constant Uint EVT_PANELBORDERSTYLE		= EVT_CUSTOM + 5
Constant Uint EVT_TITLEBARROUNDSIZE		= EVT_CUSTOM + 6
Constant Uint EVT_ITEMROUNDSIZE			= EVT_CUSTOM + 7
Constant Uint EVT_PANELROUNDSIZE			= EVT_CUSTOM + 8

/*--- Properties ---*/
Public:
ProtectedWrite Uint		#TitleBarBkgndStyle 	= Enums.SOLID		//Panel标题栏背景风格
ProtectedWrite Uint		#TitleBarBorderStyle 	= Enums.BS_SOLID	//Panel标题栏边框风格
ProtectedWrite Uint		#ItemBkgndStyle 		= Enums.SOLID		//按钮背景风格
ProtectedWrite Uint 		#ItemBorderStyle		= Enums.BS_SOLID	//按钮边框风格
ProtectedWrite Uint		#PanelBorderStyle 	= Enums.BS_SOLID	//Panel边框风格
ProtectedWrite RADIUSF	#TitleBarRoundSize 								//Panel标题栏圆角大小(px,只有#TitleBarBorderStyle=BS_ROUND时有效)
ProtectedWrite RADIUSF	#ItemRoundSize									//按钮圆角大小(px,只有#ItemBorderStyle=BS_ROUND时有效)
ProtectedWrite RADIUSF	#PanelRoundSize									//按钮圆角大小(px,只有#PanelBorderStyle=BS_ROUND时有效)
end variables

forward prototypes
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
public function long of_setitembkgndstyle (readonly unsignedinteger style)
public function long of_setitembkgndstyle (readonly string style)
public function long of_setitemborderstyle (readonly unsignedinteger style)
public function long of_setitemborderstyle (readonly string style)
public function long of_settitlebarbkgndstyle (readonly unsignedinteger style)
public function long of_settitlebarbkgndstyle (readonly string style)
public function long of_settitlebarborderstyle (readonly string style)
public function long of_settitlebarborderstyle (readonly unsignedinteger style)
public function long of_setpanelborderstyle (readonly unsignedinteger style)
public function long of_setpanelborderstyle (readonly string style)
public function unsignedlong of_getpanelcolor (readonly n_cst_splitcontainer_panel panel, readonly unsignedinteger colorflag, readonly unsignedlong state)
public function long of_settitlebarroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
public function long of_setpanelroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
public function long of_setitemroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
end prototypes

event _ongetpanelcolor(n_cst_splitcontainer_panel panel, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_TITLEBARBKGND
		color = _themeColorD1
	case CLR_TITLEBARBORDER
		color = _themeColorD4
end choose
end event

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_splitcontainer_theme") then
	n_cst_splitcontainer_theme ln_newTheme
	ln_newTheme 	= newTheme
	#PanelBorderStyle		= ln_newTheme.#PanelBorderStyle
	#TitleBarBkgndStyle	= ln_newTheme.#TitleBarBkgndStyle
	#TitleBarBorderStyle	= ln_newTheme.#TitleBarBorderStyle
	#ItemBkgndStyle 		= ln_newTheme.#ItemBkgndStyle
	#ItemBorderStyle 		= ln_newTheme.#ItemBorderStyle
	#TitleBarRoundSize	= ln_newTheme.#TitleBarRoundSize
	#ItemRoundSize 		= ln_newTheme.#ItemRoundSize
	#PanelRoundSize 		= ln_newTheme.#PanelRoundSize
end if

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

public function long of_settitlebarborderstyle (readonly string style);Uint newStyle

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

return of_SetTitleBarBorderStyle(newStyle)
end function

public function long of_settitlebarborderstyle (readonly unsignedinteger style);if #TitleBarBorderStyle = style then return RetCode.OK
	
choose case style
	case Enums.BS_NONE,Enums.BS_SOLID,Enums.BS_ROUND
		
		#TitleBarBorderStyle = style
		Event OnThemeChanged(EVT_TITLEBARBORDERSTYLE)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
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

public function unsignedlong of_getpanelcolor (readonly n_cst_splitcontainer_panel panel, readonly unsignedinteger colorflag, readonly unsignedlong state);Ulong color

SetNull(color)
Event OnGetPanelColor(panel,colorFlag,state,ref color)
if IsNull(color) then
	Event _OnGetPanelColor(panel,colorFlag,state,ref color)
end if
if IsNull(color) then color = of_GetColor(colorFlag,state)

return color
end function

public function long of_settitlebarroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom);if lefttop < 0 or righttop < 0 or leftbottom < 0 or rightbottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #TitleBarRoundSize.leftTop = lefttop and #TitleBarRoundSize.rightTop = righttop and #TitleBarRoundSize.leftBottom = leftbottom and #TitleBarRoundSize.rightBottom = rightbottom then return RetCode.OK

#TitleBarRoundSize.leftTop = lefttop
#TitleBarRoundSize.rightTop = righttop 
#TitleBarRoundSize.leftBottom = leftbottom 
#TitleBarRoundSize.rightBottom = rightbottom

Event OnThemeChanged(EVT_TITLEBARROUNDSIZE)

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

public function long of_setitemroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom);if lefttop < 0 or righttop < 0 or leftbottom < 0 or rightbottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #ItemRoundSize.leftTop = lefttop and #ItemRoundSize.rightTop = righttop and #ItemRoundSize.leftBottom = leftbottom and #ItemRoundSize.rightBottom = rightbottom then return RetCode.OK

#ItemRoundSize.leftTop = lefttop
#ItemRoundSize.rightTop = righttop 
#ItemRoundSize.leftBottom = leftbottom 
#ItemRoundSize.rightBottom = rightbottom

Event OnThemeChanged(EVT_ITEMROUNDSIZE)

return RetCode.OK
end function

on n_cst_splitcontainer_theme.create
call super::create
end on

on n_cst_splitcontainer_theme.destroy
call super::destroy
end on

event constructor;call super::constructor;#TitleBarRoundSize.leftTop = 2
#TitleBarRoundSize.rightTop = 2
#TitleBarRoundSize.leftBottom = 2
#TitleBarRoundSize.rightBottom = 2

#ItemRoundSize = #TitleBarRoundSize
#PanelRoundSize = #TitleBarRoundSize
end event

event _ongetcolor;call super::_ongetcolor;choose case colorFlag
	case CLR_COLLAPSEBUTTONBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorD1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		else
			color = _themeColorL1
		end if
	case CLR_COLLAPSEBUTTONBORDER
		color = _themeColorD4
end choose
end event

