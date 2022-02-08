$PBExportHeader$n_cst_checkbox_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_checkbox_theme from n_cst_base_theme
end type
type font from n_cst_font within n_cst_checkbox_theme
end type
end forward

global type n_cst_checkbox_theme from n_cst_base_theme
font font
end type
global n_cst_checkbox_theme n_cst_checkbox_theme

type variables
/*--- Constants ---*/
Public:
//Event flags
Constant Uint EVT_TEXTPOSITION	= EVT_CUSTOM + 1
Constant Uint EVT_TEXTALIGN			= EVT_CUSTOM + 2
Constant Uint EVT_MULTILINE			= EVT_CUSTOM + 3
Constant Uint EVT_FONT					= EVT_CUSTOM + 4

/*--- Properties ---*/
Public:
ProtectedWrite Uint			#TextPosition 	= Enums.RIGHT	//文本位置(Enums.LEFT,Enums.RIGHT)
ProtectedWrite Alignment	#TextAlign		= Left!				//文字对齐方式(Left!,Center!,Right!)
ProtectedWrite Boolean		#MultiLine		= false				//多行文本
end variables

forward prototypes
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
public function long of_settextalign (readonly alignment align)
public function long of_setmultiline (readonly boolean multiline)
public function long of_settextposition (readonly unsignedinteger position)
end prototypes

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_checkbox_theme") then
	n_cst_checkbox_theme ln_newTheme
	ln_newTheme 	= newTheme
	#TextPosition	= ln_newTheme.#TextPosition
	#TextAlign		= ln_newTheme.#TextAlign
	#MultiLine		= ln_newTheme.#MultiLine
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

public function long of_settextposition (readonly unsignedinteger position);if #TextPosition = position then return RetCode.OK

choose case position
	case Enums.LEFT,Enums.RIGHT
		
		#TextPosition = position
		Event OnThemeChanged(EVT_TEXTPOSITION)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

on n_cst_checkbox_theme.create
call super::create
this.font=create font
end on

on n_cst_checkbox_theme.destroy
call super::destroy
destroy(this.font)
end on

type font from n_cst_font within n_cst_checkbox_theme descriptor "pb_nvo" = "true" 
end type

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(Parent.EVT_FONT)
end event

