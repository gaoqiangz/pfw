$PBExportHeader$n_cst_singlelineedit_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_singlelineedit_theme from n_cst_base_theme
end type
end forward

global type n_cst_singlelineedit_theme from n_cst_base_theme
end type
global n_cst_singlelineedit_theme n_cst_singlelineedit_theme

type variables
/*--- Constants ---*/
Public:
//Color flags
Constant Uint CLR_BTNBKGND			= CLR_CUSTOM + 1
//Event flags
Constant Uint EVT_ICONPOSITION		= EVT_CUSTOM + 1
Constant Uint EVT_ICONSIZE			= EVT_CUSTOM + 2

/*--- Properties ---*/
Public:
ProtectedWrite Uint	#IconPosition 	= Enums.LEFT		//图标位置(Enums.LEFT,Enums.RIGHT)
ProtectedWrite SIZEF	#IconSize								//图标大小
end variables

forward prototypes
public function long of_seticonposition (unsignedinteger position)
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
public function long of_seticonsize (real width, real height)
end prototypes

public function long of_seticonposition (unsignedinteger position);if #IconPosition = position then return RetCode.OK

choose case position
	case Enums.LEFT,Enums.RIGHT
		
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

if IsAncestor(newTheme,"n_cst_singlelineedit_theme") then
	n_cst_singlelineedit_theme ln_newTheme
	ln_newTheme 	= newTheme
	#IconPosition 	= ln_newTheme.#IconPosition
	#IconSize 		= ln_newTheme.#IconSize
end if

return RetCode.OK
end function

public function long of_seticonsize (real width, real height);if width = 0 or height = 0 then return RetCode.E_INVALID_ARGUMENT
if #IconSize.cx = width and #IconSize.cy = height then return RetCode.OK

#IconSize.cx = width
#IconSize.cy = height

Event OnThemeChanged(EVT_ICONSIZE)

return RetCode.OK
end function

on n_cst_singlelineedit_theme.create
call super::create
end on

on n_cst_singlelineedit_theme.destroy
call super::destroy
end on

event constructor;call super::constructor;#IconSize.cx = Enums.SMALL
#IconSize.cy = Enums.SMALL
end event

event _ongetcolor;call super::_ongetcolor;choose case colorFlag
	case CLR_BTNBKGND
		if BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_PRESSED) then
			color = _themeColorL1
		end if
	case CLR_BORDER
		if BitTest(state,Enums.STATE_DISABLED) then
			color = _themeColorGray
		elseif BitTest(state,Enums.STATE_HOVER + Enums.STATE_FOCUS) then
			color = _themeColorD4
		elseif BitTest(state,Enums.STATE_HOVER) then
			color = _themeColorL2
		elseif BitTest(state,Enums.STATE_FOCUS) then
			color = _themeColorD4
		else
			color = _themeColor
		end if
end choose
end event

