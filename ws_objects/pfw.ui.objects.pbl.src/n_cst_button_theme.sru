$PBExportHeader$n_cst_button_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_button_theme from n_cst_base_theme
end type
type font from n_cst_font within n_cst_button_theme
end type
end forward

global type n_cst_button_theme from n_cst_base_theme descriptor "PB_ObjectCodeAssistants" = "{BB0DD54A-B36E-11D1-BB47-000086095DDA}" 
font font
end type
global n_cst_button_theme n_cst_button_theme

type variables
/*--- Constants ---*/
Public:
//Event flags
Constant Uint EVT_ICONPOSITION		= EVT_CUSTOM + 1
Constant Uint EVT_TEXTALIGN			= EVT_CUSTOM + 2
Constant Uint EVT_MULTILINE			= EVT_CUSTOM + 3
Constant Uint EVT_ICONSPACING	= EVT_CUSTOM + 4
Constant Uint EVT_ICONSIZE			= EVT_CUSTOM + 5
Constant Uint EVT_FONT					= EVT_CUSTOM + 6

/*--- Properties ---*/
Public:
ProtectedWrite Uint			#IconPosition 	= Enums.LEFT		//图标位置(Enums.LEFT,Enums.TOP,Enums.RIGHT,Enums.BOTTOM)
ProtectedWrite Alignment	#TextAlign		= Center!			//文字对齐方式(Left!,Center!,Right!)
ProtectedWrite Boolean		#MultiLine		= false				//多行文本
ProtectedWrite	real 			#IconSpacing	= 2 					//dip
ProtectedWrite SIZE			#IconSize								//图标大小
end variables

forward prototypes
public function long of_seticonposition (readonly unsignedinteger position)
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
public function long of_settextalign (readonly alignment align)
public function long of_setmultiline (readonly boolean multiline)
public function long of_seticonsize (readonly real width, readonly real height)
public function long of_seticonspacing (readonly real spacing)
end prototypes

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

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_button_theme") then
	n_cst_button_theme ln_newTheme
	ln_newTheme 	= newTheme
	#IconPosition 	= ln_newTheme.#IconPosition
	#TextAlign		= ln_newTheme.#TextAlign
	#MultiLine		= ln_newTheme.#MultiLine
	#IconSpacing = ln_newTheme.#IconSpacing
	#IconSize 		= ln_newTheme.#IconSize
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

public function long of_setmultiline (readonly boolean multiline);if #MultiLine = multiLine then return RetCode.OK

#MultiLine = multiLine
Event OnThemeChanged(EVT_MULTILINE)

return RetCode.OK
end function

public function long of_seticonsize (readonly real width, readonly real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if #IconSize.cx = width and #IconSize.cy = height then return RetCode.OK

#IconSize.cx = width
#IconSize.cy = height

Event OnThemeChanged(EVT_ICONSIZE)

return RetCode.OK
end function

public function long of_seticonspacing (readonly real spacing);if #IconSpacing = spacing then return RetCode.OK

#IconSpacing = spacing
Event OnThemeChanged(EVT_ICONSPACING)

return RetCode.OK
end function

on n_cst_button_theme.create
call super::create
this.font=create font
end on

on n_cst_button_theme.destroy
call super::destroy
destroy(this.font)
end on

event constructor;call super::constructor;#IconSize.cx = Enums.SMALL
#IconSize.cy = Enums.SMALL

#BkgndOrientation = Enums.VERT
end event

event onsetpopupmenutheme;call super::onsetpopupmenutheme;if Not IsValidObject(pmTheme) then return 1
pmTheme.of_SetItemBkgndStyle(#BkgndStyle)
pmTheme.of_SetItemBorderStyle(#BorderStyle)
return 0
end event

event _ongetcolor;call super::_ongetcolor;choose case colorFlag
	case CLR_BKGND,CLR_CHEVRONBKGND
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_FOCUS) then
			color = _themeColorD3
		elseif BitTest(state,Enums.STATE_HIGHLIGHTED) then
			color = HIGHLIGHT
		elseif BitTest(state,Enums.STATE_DEFAULT) then
			color = _themeColorL3
		else
			color = _themeColor
		end if
	case CLR_BORDER,CLR_CHEVRONBORDER
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		elseif BitTest(state,Enums.STATE_FOCUS) then
			color = _themeColorD5
		else
			color = _themeColorD3
		end if
end choose
end event

type font from n_cst_font within n_cst_button_theme descriptor "pb_nvo" = "true" 
end type

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(Parent.EVT_FONT)
end event

