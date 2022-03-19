$PBExportHeader$n_cst_popupmenu_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_popupmenu_theme from n_cst_base_theme
end type
type font from n_cst_font within n_cst_popupmenu_theme
end type
end forward

global type n_cst_popupmenu_theme from n_cst_base_theme
event ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event type long onthemechanging ( n_cst_base_theme newtheme )
font font
end type
global n_cst_popupmenu_theme n_cst_popupmenu_theme

type variables
/*--- Constants --*/
Public:
//Event flags
Constant Uint EVT_TITLEBAR					= EVT_CUSTOM + 1
Constant Uint EVT_SELECTBOLD				= EVT_CUSTOM + 2
Constant Uint EVT_TITLEBARTEXTALIGN		= EVT_CUSTOM + 3
Constant Uint EVT_TITLEBARICONALIGN		= EVT_CUSTOM + 4
Constant Uint EVT_ITEMBKGNDSTYLE			= EVT_CUSTOM + 5
Constant Uint EVT_ITEMBORDERSTYLE		= EVT_CUSTOM + 6
Constant Uint EVT_ICONSIZE					= EVT_CUSTOM + 7
Constant Uint EVT_FONT							= EVT_CUSTOM + 8

/*--- Properties ---*/
Public:
ProtectedWrite	Boolean		#TitleBar 				= false					//显示标题栏
ProtectedWrite	Boolean		#SelectBold				= false					//鼠标下的菜单项加粗
ProtectedWrite	Alignment	#TitleBarTextAlign		= Left!					//标题栏文本对齐方式(Left!,Center!,Right!)
ProtectedWrite	Alignment	#TitleBarIconAlign		= Left!					//标题栏图标对齐方式(Left!,Center!,Right!)
ProtectedWrite Uint 			#ItemBkgndStyle		= Enums.SOLID		//按钮背景风格
ProtectedWrite Uint 			#ItemBorderStyle		= Enums.BS_SOLID	//按钮边框风格
ProtectedWrite SIZEF		#IconSize											//图标大小
end variables

forward prototypes
public function long of_setitembkgndstyle (readonly unsignedinteger style)
public function long of_setitembkgndstyle (readonly string style)
public function long of_setitemborderstyle (readonly unsignedinteger style)
public function long of_setitemborderstyle (readonly string style)
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
public function long of_settitlebar (readonly boolean show)
public function long of_setselectbold (readonly boolean bold)
public function long of_settitlebariconalign (readonly alignment align)
public function long of_settitlebartextalign (readonly alignment align)
public function unsignedlong of_getitemcolor (readonly integer index, readonly unsignedlong state, readonly unsignedinteger colorflag)
public function long of_seticonsize (readonly real width, readonly real height)
public function string of_getitemicon (readonly integer index, readonly string uri, readonly unsignedlong state)
end prototypes

event _ongetitemcolor(integer index, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_BKGND
		color = _themeColorL2
	case CLR_BORDER
		color = _themeColorD2
end choose
end event

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

protected function long _of_settheme (readonly n_cst_base_theme newtheme);boolean bColorChanged
long rtCode

if Not IsValidObject(newTheme) then return RetCode.E_INVALID_OBJECT
if newTheme = this then return RetCode.FAILED
if IsPrevented(Event OnThemeChanging(newTheme)) then return RetCode.FAILED

bColorChanged = (#BkgndColorStyle	<> newTheme.#BkgndColorStyle)

#BkgndStyle	 		= newTheme.#BkgndStyle
#BkgndColorStyle	= newTheme.#BkgndColorStyle

if IsAncestor(newTheme,"n_cst_popupmenu_theme") then
	n_cst_popupmenu_theme ln_newTheme
	ln_newTheme 	= newTheme
	#BkgndOrientation	= ln_newTheme.#BkgndOrientation
	#BorderStyle 		= ln_newTheme.#BorderStyle
	#RoundSize 		= ln_newTheme.#RoundSize
	#BorderMargin		= ln_newTheme.#BorderMargin
	#TitleBar				= ln_newTheme.#TitleBar
	#SelectBold			= ln_newTheme.#SelectBold
	#TitleBarTextAlign	= ln_newTheme.#TitleBarTextAlign
	#TitleBarIconAlign	= ln_newTheme.#TitleBarIconAlign
	#ItemBkgndStyle 	= ln_newTheme.#ItemBkgndStyle
	#ItemBorderStyle 	= ln_newTheme.#ItemBorderStyle
	#IconSize 			= ln_newTheme.#IconSize
	Font.of_SetFont(ln_newTheme.Font)
else
	if #BkgndStyle = Enums.TRANSPARENT then
		#BkgndStyle = Enums.SOLID
	end if
	newTheme.Event OnSetPopupMenuTheme(this)
end if

if bColorChanged then
	Event _OnThemeColorChanged()
end if

return RetCode.OK
end function

public function long of_settitlebar (readonly boolean show);if #TitleBar = show then return RetCode.OK

#TitleBar = show
Event OnThemeChanged(EVT_TITLEBAR)

return RetCode.OK
end function

public function long of_setselectbold (readonly boolean bold);if #SelectBold = bold then return RetCode.OK

#SelectBold = bold
Event OnThemeChanged(EVT_SELECTBOLD)

return RetCode.OK
end function

public function long of_settitlebariconalign (readonly alignment align);if #TitleBarIconAlign = align then return RetCode.OK

choose case align
	case Left!,Center!,Right!
		
		#TitleBarIconAlign = align
		Event OnThemeChanged(EVT_TITLEBARICONALIGN)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function long of_settitlebartextalign (readonly alignment align);if #TitleBarTextAlign = align then return RetCode.OK

choose case align
	case Left!,Center!,Right!
		
		#TitleBarTextAlign = align
		Event OnThemeChanged(EVT_TITLEBARTEXTALIGN)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

public function unsignedlong of_getitemcolor (readonly integer index, readonly unsignedlong state, readonly unsignedinteger colorflag);Ulong color

SetNull(color)
Event OnGetItemColor(index,colorFlag,state,ref color)
if IsNull(color) then
	Event _OnGetColor(colorFlag,state,ref color)
end if
if IsNull(color) then
	Event _OnGetItemColor(index,colorFlag,state,ref color)
end if
if IsNull(color) then color = 0

return color
end function

public function long of_seticonsize (readonly real width, readonly real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if #IconSize.cx = width and #IconSize.cy = height then return RetCode.OK

#IconSize.cx = width
#IconSize.cy = height

Event OnThemeChanged(EVT_ICONSIZE)

return RetCode.OK
end function

public function string of_getitemicon (readonly integer index, readonly string uri, readonly unsignedlong state);if Pos(uri,".svg") > 0 then
	if Pos(uri,"{") = 0 then
		return uri + "{fill:" + _of_ToRGB(of_GetItemColor(index,CLR_ICON,state)) + "}"
	else
		return uri
	end if
elseif Left(uri,7) = "font://" then
	if Pos(uri,"{") = 0 then
		return uri + "{color:" + _of_ToRGB(of_GetItemColor(index,CLR_ICON,state)) + "}"
	else
		return uri
	end if
else
	return uri
end if
end function

on n_cst_popupmenu_theme.create
call super::create
this.font=create font
end on

on n_cst_popupmenu_theme.destroy
call super::destroy
destroy(this.font)
end on

event constructor;call super::constructor;#IconSize.cx = Enums.SMALL
#IconSize.cy = Enums.SMALL
end event

type font from n_cst_font within n_cst_popupmenu_theme descriptor "pb_nvo" = "true" 
end type

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(Parent.EVT_FONT)
end event

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

