$PBExportHeader$pm_color.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type pm_color from n_cst_popupmenu
end type
end forward

global type pm_color from n_cst_popupmenu
end type
global pm_color pm_color

type variables
Public:
//Item IDs
Constant Int MID_CLASSIC		= 1
Constant Int MID_BLUE			= 2
Constant Int MID_SILVER 		= 3
Constant Int MID_OLIVE 			= 4
Constant Int MID_PURPLE 		= 5
Constant Int MID_GOLD 			= 6
end variables

on pm_color.create
call super::create
end on

on pm_color.destroy
call super::destroy
end on

event onpreconstructor;call super::onpreconstructor;//设置Menu图标大小
theme.of_SetIconSize(Enums.SMALL,Enums.SMALL)
//开启Menu的工具提示
of_SetToolTip( true)
//--- 添加Menu子项 ---
of_AddLabel( "颜色:")
of_AddMenu( "Classic", Res.ICO_S_CLASSIC,"Classic", MID_CLASSIC)
of_AddMenu( "Blue", Res.ICO_S_BLUE,"Blue",  MID_BLUE)
of_AddMenu( "Silver",Res.ICO_S_SILVER,"Silver",  MID_SILVER)
of_AddMenu( "Olive", Res.ICO_S_OLIVE,"Olive",  MID_OLIVE)
of_AddMenu( "Purple", Res.ICO_S_PURPLE,"Purple",  MID_PURPLE)
of_AddMenu( "Gold", Res.ICO_S_GOLD,"Gold", MID_GOLD)
//预设Menu item的选中状态
of_CheckRadios( MID_CLASSIC, MID_GOLD, MID_CLASSIC, false, true)
end event

event onmenuselected;call super::onmenuselected;pm_skin pmSkin

if Not IsValidObject(w_demo) then return

pmSkin = w_demo.wf_GetSkinMenu()

pmSkin.Event onmenuselected(id)
end event

