$PBExportHeader$n_cst_scrollbar_theme.sru
$PBExportComments$PowerUI~r~nBy gaoqiangz@msn.com
forward
global type n_cst_scrollbar_theme from n_cst_base_theme
end type
end forward

global type n_cst_scrollbar_theme from n_cst_base_theme
end type
global n_cst_scrollbar_theme n_cst_scrollbar_theme

type variables
/*--- Constants ---*/
Public:
//Event flags
Constant Uint EVT_ARROW				= EVT_CUSTOM + 1
Constant Uint EVT_ARROWSIZE			= EVT_CUSTOM + 2

/*--- Properties ---*/
Public:
ProtectedWrite Boolean		#Arrow										//显示滚动条箭头
ProtectedWrite Real			#ArrowSize		= 12						//滚动条箭头大小(px)
end variables
forward prototypes
protected function long _of_settheme (readonly n_cst_base_theme newtheme)
public function long of_setarrow (readonly boolean show)
public function long of_setarrowsize (readonly real size)
end prototypes

protected function long _of_settheme (readonly n_cst_base_theme newtheme);long rtCode

rtCode = Super::_of_SetTheme(newTheme)

if IsFailed(rtCode) then return rtCode

if IsAncestor(newTheme,"n_cst_scrollbar_theme") then
	n_cst_scrollbar_theme ln_newTheme
	ln_newTheme 	= newTheme
	#Arrow	 		= ln_newTheme.#Arrow
	#ArrowSize 		= ln_newTheme.#ArrowSize
end if

return RetCode.OK
end function

public function long of_setarrow (readonly boolean show);if #Arrow = show then return RetCode.OK

#Arrow = show
Event OnThemeChanged(EVT_ARROW)

return RetCode.OK
end function

public function long of_setarrowsize (readonly real size);if #ArrowSize = Size then return RetCode.OK
if Size < 4 then return RetCode.E_INVALID_ARGUMENT

#ArrowSize = Size
Event OnThemeChanged(EVT_ARROWSIZE)

return RetCode.OK
end function

on n_cst_scrollbar_theme.create
call super::create
end on

on n_cst_scrollbar_theme.destroy
call super::destroy
end on

