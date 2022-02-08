$PBExportHeader$n_cst_progressbar_theme.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_progressbar_theme from n_cst_base_theme
end type
type font from n_cst_font within n_cst_progressbar_theme
end type
end forward

global type n_cst_progressbar_theme from n_cst_base_theme
font font
end type
global n_cst_progressbar_theme n_cst_progressbar_theme

type variables
/*--- Constants ---*/
Public:
//Color flags
Constant Uint CLR_FKGND = CLR_CUSTOM + 1

/*--- Constants ---*/
Public:
//Event flags
Constant Uint EVT_TEXTALIGN	= EVT_CUSTOM + 1
Constant Uint EVT_FONT			= EVT_CUSTOM + 2

/*--- Properties ---*/
Public:
ProtectedWrite Alignment #TextAlign = Center!			//文字对齐方式(Left!,Center!,Right!)
end variables

forward prototypes
public function long of_settextalign (readonly alignment align)
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
end prototypes

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

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_progressbar_theme") then
	n_cst_progressbar_theme ln_newTheme
	ln_newTheme 	= newTheme
	#TextAlign		= ln_newTheme.#TextAlign
	Font.of_SetFont(ln_newTheme.Font)
end if

return RetCode.OK
end function

on n_cst_progressbar_theme.create
call super::create
this.font=create font
end on

on n_cst_progressbar_theme.destroy
call super::destroy
destroy(this.font)
end on

event _ongetcolor;call super::_ongetcolor;choose case colorFlag
	case CLR_BKGND
		color = ARGB(255,230,230,230)
	case CLR_FKGND
		color = _themeColor //ARGB(255,0,200,40)
end choose
end event

type font from n_cst_font within n_cst_progressbar_theme descriptor "pb_nvo" = "true" 
long #size = 8
end type

on font.create
call super::create
end on

on font.destroy
call super::destroy
end on

event onfontchanged;call super::onfontchanged;Parent.Event OnThemeChanged(Parent.EVT_FONT)
end event

