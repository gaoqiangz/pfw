$PBExportHeader$n_cst_shortcutbar_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_shortcutbar_theme from n_cst_base_theme
end type
type font from n_cst_font within n_cst_shortcutbar_theme
end type
type titlefont from n_cst_font within n_cst_shortcutbar_theme
end type
type selectedfont from n_cst_font within n_cst_shortcutbar_theme
end type
end forward

global type n_cst_shortcutbar_theme from n_cst_base_theme
event ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event _ongetitemcolor ( integer index,  unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
font font
titlefont titlefont
selectedfont selectedfont
end type
global n_cst_shortcutbar_theme n_cst_shortcutbar_theme

type variables
/*--- Constants --*/
Public:
//Color flags
Constant Uint CLR_TITLEBARBKGND	= CLR_CUSTOM + 1
Constant Uint CLR_TITLEBARBORDER	= CLR_CUSTOM + 2
Constant Uint CLR_TITLE					= CLR_CUSTOM + 3
Constant Uint CLR_SPLITBARBKGND	= CLR_CUSTOM + 4
Constant Uint CLR_SPLITBARBORDER	= CLR_CUSTOM + 5
//Event flags
Constant Uint EVT_TITLEBAR						= EVT_CUSTOM + 1
Constant Uint EVT_SPLITBAR						= EVT_CUSTOM + 2
Constant Uint EVT_ICONTRAYICONRTL			= EVT_CUSTOM + 3
Constant Uint EVT_ICONPOSITION					= EVT_CUSTOM + 4
Constant Uint EVT_TEXTALIGN						= EVT_CUSTOM + 5
Constant Uint EVT_FIXEDSIZE						= EVT_CUSTOM + 6
Constant Uint EVT_TITLEBARHEIGHT				= EVT_CUSTOM + 7
Constant Uint EVT_TITLEBARTEXTALIGN			= EVT_CUSTOM + 8
Constant Uint EVT_TITLEBARICONALIGN			= EVT_CUSTOM + 9
Constant Uint EVT_ITEMBKGNDSTYLE				= EVT_CUSTOM + 10
Constant Uint EVT_ITEMBORDERSTYLE			= EVT_CUSTOM + 11
Constant Uint EVT_ITEMMINSIZE					= EVT_CUSTOM + 12
Constant Uint EVT_ICONTRAYITEMMARGIN		= EVT_CUSTOM + 13
Constant Uint EVT_ITEMROUNDSIZE				= EVT_CUSTOM + 14
Constant Uint EVT_ICONSIZE						= EVT_CUSTOM + 15
Constant Uint EVT_TITLEBARICONSIZE			= EVT_CUSTOM + 16
Constant Uint EVT_ICONTRAYICONSIZE			= EVT_CUSTOM + 17
Constant Uint EVT_ICONTRAYBORDERMARGIN	= EVT_CUSTOM + 18
Constant Uint EVT_FONT								= EVT_CUSTOM + 19
Constant Uint EVT_SELECTEDFONT				= EVT_CUSTOM + 20
Constant Uint EVT_TITLEFONT						= EVT_CUSTOM + 21

/*--- Properties ---*/
Public:
ProtectedWrite	Boolean		#TitleBar 				= true					//显示标题栏
ProtectedWrite	Boolean		#SplitBar 				= true					//显示SplitBar
ProtectedWrite	Boolean		#IcontrayIconRTL		= false					//拖盘图标从右向左排列
ProtectedWrite Uint			#IconPosition 			= Enums.LEFT			//图标位置(LEFT,TOP,RIGHT,BOTTOM)
ProtectedWrite Alignment	#TextAlign				= Left!					//文字对齐方式(Left!,Center!,Right!)
ProtectedWrite	Boolean		#FixedSize				= true					//固定Item最小大小
ProtectedWrite	real			#TitleBarHeight			= 50						//标题栏高度(px),为0时自动计算
ProtectedWrite	Alignment	#TitleBarTextAlign		= Left!					//标题栏文本对齐方式(Left!,Center!,Right!)
ProtectedWrite	Alignment	#TitleBarIconAlign		= Left!					//标题栏图标对齐方式(Left!,Center!,Right!)
ProtectedWrite Uint			#ItemBkgndStyle 		= Enums.SOLID		//按钮背景风格
ProtectedWrite Uint 			#ItemBorderStyle		= Enums.BS_SOLID	//托盘按钮边框风格
ProtectedWrite	real			#ItemMinSize 			= 40 						//px
ProtectedWrite	real			#IcontrayItemMargin	= 4 						//px
ProtectedWrite RADIUSF		#ItemRoundSize									//托盘按钮圆角大小(px,只有#ItemBorderStyle=BS_ROUND时有效)
ProtectedWrite SIZEF		#IconSize											//按钮图标大小
ProtectedWrite SIZEF			#TitleBarIconSize									//标题栏图标大小
ProtectedWrite SIZEF			#IcontrayIconSize									//托盘图标大小
ProtectedWrite RECTF			#IcontrayBorderMargin
end variables

forward prototypes
public function long of_setfixedsize (readonly boolean fixed)
public function long of_seticonposition (readonly unsignedinteger position)
public function long of_seticontrayiconrtl (readonly boolean rtl)
public function long of_setitembkgndstyle (readonly unsignedinteger style)
public function long of_setitembkgndstyle (readonly string style)
public function long of_setsplitbar (readonly boolean show)
public function long of_settitlebar (readonly boolean show)
public function long of_settitlebariconalign (readonly alignment align)
public function long of_settitlebartextalign (readonly alignment align)
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
public function long of_setitemborderstyle (readonly unsignedinteger style)
public function long of_setitemborderstyle (readonly string style)
public function long of_settextalign (readonly alignment align)
public function unsignedlong of_getitemcolor (readonly integer index, readonly unsignedinteger colorflag, readonly unsignedlong state)
public function long of_seticonsize (readonly real width, readonly real height)
public function long of_seticontraybordermargin (readonly real left, readonly real top, readonly real right, readonly real bottom)
public function long of_seticontrayiconsize (readonly real width, readonly real height)
public function long of_seticontrayitemmargin (readonly real margin)
public function long of_setitemminsize (readonly real size)
public function long of_setitemroundsize (readonly real lefttop, readonly real righttop, readonly real leftbottom, readonly real rightbottom)
public function long of_settitlebarheight (readonly real height)
public function long of_settitlebariconsize (readonly real width, readonly real height)
public function string of_getitemicon (readonly integer index, readonly string uri, readonly unsignedlong state)
end prototypes

event _ongetitemcolor(integer index, unsignedinteger colorflag, unsignedlong state, ref unsignedlong color);choose case colorFlag
	case CLR_BKGND
		if BitTest(state,Enums.STATE_SELECTED) then
			color = _themeColorL1
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

public function long of_seticontrayiconrtl (readonly boolean rtl);if #IcontrayIconRTL = rtl then return RetCode.OK

#IcontrayIconRTL = rtl
Event OnThemeChanged(EVT_ICONTRAYICONRTL)

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

public function long of_setsplitbar (readonly boolean show);if #SplitBar = show then return RetCode.OK

#SplitBar = show
Event OnThemeChanged(EVT_SPLITBAR)

return RetCode.OK
end function

public function long of_settitlebar (readonly boolean show);if #TitleBar = show then return RetCode.OK

#TitleBar = show
Event OnThemeChanged(EVT_TITLEBAR)

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

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_shortcutbar_theme") then
	n_cst_shortcutbar_theme ln_newTheme
	ln_newTheme 	= newTheme
	#TitleBar 				= ln_newTheme.#TitleBar
	#SplitBar 				= ln_newTheme.#SplitBar
	#IcontrayIconRTL 		= ln_newTheme.#IcontrayIconRTL
	#IconPosition 			= ln_newTheme.#IconPosition
	#TextAlign 				= ln_newTheme.#TextAlign
	#FixedSize 				= ln_newTheme.#FixedSize
	#TitleBarHeight			= ln_newTheme.#TitleBarHeight
	#TitleBarTextAlign		= ln_newTheme.#TitleBarTextAlign
	#TitleBarIconAlign		= ln_newTheme.#TitleBarIconAlign
	#ItemBkgndStyle		= ln_newTheme.#ItemBkgndStyle
	#ItemBorderStyle		= ln_newTheme.#ItemBorderStyle
	#ItemMinSize			= ln_newTheme.#ItemMinSize
	#IcontrayItemMargin	= ln_newTheme.#IcontrayItemMargin
	#ItemRoundSize		= ln_newTheme.#ItemRoundSize
	#IconSize				= ln_newTheme.#IconSize
	#TitleBarIconSize		= ln_newTheme.#TitleBarIconSize
	#IcontrayIconSize		= ln_newTheme.#IcontrayIconSize
	Font.of_SetFont(ln_newTheme.Font)
	SelectedFont.of_SetFont(ln_newTheme.SelectedFont)
	TitleFont.of_SetFont(ln_newTheme.TitleFont)
end if

return RetCode.OK
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

public function long of_seticontraybordermargin (readonly real left, readonly real top, readonly real right, readonly real bottom);//if left < 0 or top < 0 or right < 0 or bottom < 0 then return RetCode.E_INVALID_ARGUMENT
if #IcontrayBorderMargin.left = left and #IcontrayBorderMargin.top = top and &
	#IcontrayBorderMargin.right = right and #IcontrayBorderMargin.bottom = bottom then return RetCode.OK

#IcontrayBorderMargin.left = left
#IcontrayBorderMargin.top = top
#IcontrayBorderMargin.right = right
#IcontrayBorderMargin.bottom = bottom

Event OnThemeChanged(EVT_ICONTRAYBORDERMARGIN)

return RetCode.OK
end function

public function long of_seticontrayiconsize (readonly real width, readonly real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if #IcontrayIconSize.cx = width and #IcontrayIconSize.cy = height then return RetCode.OK

#IcontrayIconSize.cx = width
#IcontrayIconSize.cy = height

Event OnThemeChanged(EVT_ICONTRAYICONSIZE)

return RetCode.OK
end function

public function long of_seticontrayitemmargin (readonly real margin);if #IcontrayItemMargin = margin then return RetCode.OK

#IcontrayItemMargin = margin
Event OnThemeChanged(EVT_ICONTRAYITEMMARGIN)

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

public function long of_settitlebarheight (readonly real height);if height = 0 then return RetCode.E_INVALID_ARGUMENT
if #TitleBarHeight = height then return RetCode.OK

#TitleBarHeight = height
Event OnThemeChanged(EVT_TITLEBARHEIGHT)

return RetCode.OK
end function

public function long of_settitlebariconsize (readonly real width, readonly real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if #TitleBarIconSize.cx = width and #TitleBarIconSize.cy = height then return RetCode.OK

#TitleBarIconSize.cx = width
#TitleBarIconSize.cy = height

Event OnThemeChanged(EVT_TITLEBARICONSIZE)

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

on n_cst_shortcutbar_theme.create
call super::create
this.font=create font
this.titlefont=create titlefont
this.selectedfont=create selectedfont
end on

on n_cst_shortcutbar_theme.destroy
call super::destroy
destroy(this.font)
destroy(this.titlefont)
destroy(this.selectedfont)
end on

event constructor;call super::constructor;#IconSize.cx = Enums.SMALL
#IconSize.cy = Enums.SMALL
#TitleBarIconSize = #IconSize
#IcontrayIconSize = #IconSize

#IcontrayBorderMargin.left = 2
#IcontrayBorderMargin.right = 2

#BkgndOrientation = Enums.VERT
end event

event onsetpopupmenutheme;call super::onsetpopupmenutheme;pmTheme.of_SetItemBkgndStyle(#ItemBkgndStyle)
pmTheme.of_SetItemBorderStyle(#ItemBorderStyle)
pmTheme.of_SetItemBkgndStyle(#ItemBkgndStyle)
return 0
end event

event _ongetcolor;call super::_ongetcolor;choose case colorFlag
	case CLR_TITLEBARBKGND
		color = _themeColorL1
	case CLR_TITLEBARBORDER
		color = _themeColorD4
	case CLR_TITLE
		color = _themeColorDark
	case CLR_SPLITBARBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		else
			color = _themeColorL1
		end if
	case CLR_SPLITBARBORDER
		color = _themeColorD4
	case CLR_CHEVRONBKGND
		if BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		end if
	case CLR_CHEVRONBORDER
		color = _themeColorD4
end choose
end event

type font from n_cst_font within n_cst_shortcutbar_theme descriptor "pb_nvo" = "true" 
end type

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(Parent.EVT_FONT)
end event

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

type titlefont from n_cst_font within n_cst_shortcutbar_theme descriptor "pb_nvo" = "true" 
long #size = 12
boolean #bold = true
end type

on titlefont.create
call super::create
end on

on titlefont.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(EVT_TITLEFONT)
end event

type selectedfont from n_cst_font within n_cst_shortcutbar_theme descriptor "pb_nvo" = "true" 
boolean #bold = true
end type

on selectedfont.create
call super::create
end on

on selectedfont.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(EVT_SELECTEDFONT)
end event

