$PBExportHeader$n_cst_statictext_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_statictext_theme from n_cst_base_theme
end type
type font from n_cst_font within n_cst_statictext_theme
end type
end forward

global type n_cst_statictext_theme from n_cst_base_theme
font font
end type
global n_cst_statictext_theme n_cst_statictext_theme

type variables
/*--- Constants ---*/
Public:
//Event flags
Constant Uint EVT_TEXTALIGN	= EVT_CUSTOM + 1
Constant Uint EVT_TEXTVALIGN	= EVT_CUSTOM + 2
Constant Uint EVT_MULTILINE	= EVT_CUSTOM + 3
Constant Uint EVT_FONT			= EVT_CUSTOM + 4

/*--- Properties ---*/
Public:
ProtectedWrite Alignment	#TextAlign		= Left!	//文字对齐方式(Left!,Center!,Right!)
ProtectedWrite VTextAlign	#TextVAlign		= Top!	//文字垂直对齐方式(Top!,Bottom!,VCenter!)
ProtectedWrite Boolean		#MultiLine		= true	//多行文本
end variables

forward prototypes
public function long of_setmultiline (readonly boolean multiline)
public function long of_settextalign (readonly alignment align)
public function long of_settextvalign (readonly vtextalign align)
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
end prototypes

public function long of_setmultiline (readonly boolean multiline);if #MultiLine = multiLine then return RetCode.OK

#MultiLine = multiLine
Event OnThemeChanged(EVT_MULTILINE)

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

public function long of_settextvalign (readonly vtextalign align);if #TextVAlign = align then return RetCode.OK

choose case align
	case Top!,Bottom!,VCenter!
		
		#TextVAlign = align
		Event OnThemeChanged(EVT_TEXTVALIGN)
		
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return RetCode.OK
end function

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_checkbox_theme") then
	n_cst_statictext_theme ln_newTheme
	ln_newTheme 	= newTheme
	#TextAlign		= ln_newTheme.#TextAlign
	#TextVAlign		= ln_newTheme.#TextVAlign
	#MultiLine		= ln_newTheme.#MultiLine
	Font.of_SetFont(ln_newTheme.Font)
end if

return RetCode.OK
end function

on n_cst_statictext_theme.create
call super::create
this.font=create font
end on

on n_cst_statictext_theme.destroy
call super::destroy
destroy(this.font)
end on

type font from n_cst_font within n_cst_statictext_theme descriptor "pb_nvo" = "true" 
end type

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(Parent.EVT_FONT)
end event

