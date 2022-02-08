$PBExportHeader$w_demo_mdi.srw
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type w_demo_mdi from s_cst_window
end type
type mdi_1 from mdiclient within w_demo_mdi
end type
type uo_btnlist from u_cst_tabpage_control_shortcutbar_blb within w_demo_mdi
end type
type uo_splitcontainer from u_cst_splitcontainer within w_demo_mdi
end type
end forward

global type w_demo_mdi from s_cst_window
integer width = 2642
integer height = 1772
string title = "PowerFramework MDI窗口"
string menuname = "m_mdi_frame"
boolean hscrollbar = true
boolean vscrollbar = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 16777215
boolean clientedge = false
boolean #bordershadow = true
mdi_1 mdi_1
uo_btnlist uo_btnlist
uo_splitcontainer uo_splitcontainer
end type
global w_demo_mdi w_demo_mdi

type variables
n_image in_logoImage
end variables

on w_demo_mdi.create
int iCurrent
call super::create
if this.MenuName = "m_mdi_frame" then this.MenuID = create m_mdi_frame
this.mdi_1=create mdi_1
this.uo_btnlist=create uo_btnlist
this.uo_splitcontainer=create uo_splitcontainer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.uo_btnlist
this.Control[iCurrent+3]=this.uo_splitcontainer
end on

on w_demo_mdi.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.uo_btnlist)
destroy(this.uo_splitcontainer)
end on

event onpreopen;call super::onpreopen;#LockUpdate = true
theme.of_SetBkgndColorStyle(theme.CLASSIC)
theme.of_SetBKgndStyle(Enums.VISTAORIGINAL)
theme.of_SetItemStyle(theme.ITS_VISTA)
theme.of_SetItemBkgndStyle(Enums.VISTAORIGINAL)
//theme.of_SetClientThemeBkgnd(true)
theme.of_SetStatusBar(true)
theme.of_SetMenuBar(true)
theme.of_SetToolBar(true)
theme.of_SetMenuBarBkgndStyle(Enums.TRANSPARENT)
theme.of_SetMenuBarBorderStyle(Enums.BS_NONE)
theme.of_SetMenuBarItemBkgndStyle(Enums.VISTAORIGINAL)
theme.of_SetMenuBarItemBorderStyle(Enums.BS_ROUND)
theme.of_SetToolBarBkgndStyle(Enums.TRANSPARENT)
theme.of_SetToolBarBorderStyle(Enums.BS_NONE)
theme.of_SetToolBarItemBkgndStyle(Enums.VISTAORIGINAL)
theme.of_SetToolBarItemBorderStyle(Enums.BS_ROUND)
theme.of_SetTitleBarHeight(26)

//--- 添加窗口状态栏按钮 ---
StatusBar.of_AddIcon(Res.ICO_S_USER,left!)
StatusBar.of_AddLink("Powered by 金千枝（深圳）软件技术有限公司",left!)

in_logoImage = Create n_image
in_logoImage.SetImageSize(64,64)
in_logoImage.Load(Res.ICO_XXL_LOGO)
//------------
#LockUpdate = false
wf_UpdatePoints()

MDIClient.theme.of_SetBkgndColorStyle(theme.CLASSIC)
MDIClient.theme.of_SetBkgndStyle(Enums.TRANSPARENT)
MDIClient.theme.of_SetTabStripBorderStyle(Enums.BS_NONE)
MDIClient.theme.of_SetBorderStyle(Enums.BS_SOLID)
MDIClient.theme.of_SetTabStyle(MDIClient.theme.TBS_RIBBON)
MDIClient.theme.of_SetItemBkgndStyle(Enums.VISTAORIGINAL)
MDIClient.of_SetTransparent(true)
MDIClient.#AllowTabDrag = true
MDIClient.#SmoothDrag = true
MDIClient.#SmoothScroll = true

m_mdi_frame lm_frame
lm_frame = MenuID
lm_frame.of_SetParentWindow(this)

uo_splitcontainer.#LockUpdate = true

uo_splitcontainer.of_SetAttachMode(true)
uo_splitcontainer.Panel1.of_SetSize(100)
uo_splitcontainer.Panel1.of_SetCollapsible(true)
uo_splitcontainer.Panel1.of_BindObject(uo_btnlist)
uo_splitcontainer.Panel2.of_BindObject(mdi_1)

uo_splitcontainer.#LockUpdate = false
uo_splitcontainer.of_UpdatePoints()
end event

event open;call super::open;//Open sheet
wf_opensheet(w_demo_mdi_child,Original!)
end event

event close;call super::close;Destroy in_logoImage
end event

event onmdiclienterasebkgnd;call super::onmdiclienterasebkgnd;RECTF cliRect

if IsValid(in_logoImage) then
	Painter.GetClientRect(MDIClient.#Handle,ref cliRect)
	in_logoImage.Draw( hdc, cliRect.right - 100, cliRect.bottom - 100, false)
end if
return 1
end event

event onncerasebkgnd;//Override
RECTF rcWindow

if #LockUpdate then return 1

Painter.GetWindowRect(#Handle,ref rcWindow)
Painter.OffsetRect(ref rcWindow,-rcWindow.left,-rcWindow.top)

Painter.of_ThemeFill( hdc, rcWindow, theme,0)

return 1
end event

event onerasebkgnd;//Override
int nState
RECTF rcWindow,rcClient

if #LockUpdate then return 1

wf_GetClientRect(ref rcClient,true)
Painter.GetWindowRect(#Handle,ref rcWindow)
Painter.OffsetRect(ref rcWindow,-rcWindow.left,-rcWindow.top)

nState = Painter.SaveDC(hdc)

Win32.OffsetWindowOrgEx(hdc,rcClient.left,rcClient.top,0)
Painter.of_ThemeFill( hdc, rcWindow, theme,0)

Painter.RestoreDC(hdc,nState)
return 1
end event

event onmdiclientreposition;call super::onmdiclientreposition;return 1
end event

event resize;call super::resize;uo_splitcontainer.Move(0,0)
uo_splitcontainer.Resize(newWidth,newHeight)
end event

event onmdiclientgetcolor;call super::onmdiclientgetcolor;if colorFlag = MDIClient.theme.CLR_CLIENTBKGND then
	s_cst_window lw_active
	if IsSucceeded(wf_GetActiveSheet(lw_active)) then
		if Win32.IsZoomed(lw_active.#Handle) then
			color = Win32.GetPBColorA(lw_active.BackColor)
		end if
	end if
end if
end event

event ongetitemcolor;call super::ongetitemcolor;if objectType = WOT_TITLEBAR then
	choose case colorFlag
		case theme.CLR_BKGND
			choose case index
				case CaptionBar.IDX_CLOSE
					if BitTest(state,Enums.STATE_PRESSED) then
						color = ARGB(255,243,116,103)
					elseif BitTest(state,Enums.STATE_HOVER) then
						color = ARGB(192,243,116,103)
					else
						color = ARGB(128,243,116,103)
					end if
				case CaptionBar.IDX_MAX, CaptionBar.IDX_MINI
					if BitTest(state,Enums.STATE_PRESSED) then
						color = ARGB(255,159,199,255)
					elseif BitTest(state,Enums.STATE_HOVER) then
						color = ARGB(128,159,199,255)
					end if
			end choose
	end choose
end if
end event

type mdi_1 from mdiclient within w_demo_mdi
long BackColor=268435456
end type

type uo_btnlist from u_cst_tabpage_control_shortcutbar_blb within w_demo_mdi
integer x = 82
integer y = 28
integer taborder = 20
end type

on uo_btnlist.destroy
call u_cst_tabpage_control_shortcutbar_blb::destroy
end on

type uo_splitcontainer from u_cst_splitcontainer within w_demo_mdi
integer x = 27
integer y = 28
integer width = 2450
integer height = 1472
integer taborder = 20
boolean #transparent = true
end type

event constructor;call super::constructor;theme.of_SetBkgndStyle(Enums.TRANSPARENT)
theme.of_SetBorderStyle(Enums.BS_NONE)
end event

on uo_splitcontainer.destroy
call u_cst_splitcontainer::destroy
end on

event onpanelcollapsed;call super::onpanelcollapsed;MDIClient.of_UpdateParentBkgnd(true)
end event

