$PBExportHeader$s_cst_vprogressbar.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type s_cst_vprogressbar from vprogressbar
end type
type theme from n_cst_progressbar_theme within s_cst_vprogressbar
end type
type timer from n_timer within s_cst_vprogressbar
end type
end forward

global type s_cst_vprogressbar from vprogressbar
integer width = 69
integer height = 624
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
event onconstructor pbm_constructor
event onpostconstructor ( )
event onpreconstructor ( )
event onpredestructor ( )
event ondestructor pbm_destructor
event type long onpaint ( unsignedlong hdc )
event ongetcolor ( unsignedinteger colorflag,  unsignedlong state,  ref unsignedlong color )
event onthemechanged ( unsignedinteger eventflag )
theme theme
timer timer
end type
global s_cst_vprogressbar s_cst_vprogressbar

type variables
//* Copyright (c) 2013 - 2017
//* 著作权由金千枝（深圳）软件技术有限公司所有。著作权人保留一切权利。
//* 
//* 这份授权条款，在满足下列条件的前提下，允许使用者再发布经过或未经过
//* 修改的、源代码或二进制形式的本软件：
//* 
//* 1. 源代码的再发布，必须保留原来代码中的版权声明、这几条许可条件细目
//*    和下面的免责声明。
//* 2. 二进制形式的再发布，必须在随同提供的文档和其它媒介中，复制原来的
//*    版权声明、这几条许可条件细目和下面的免责声明。
//* 3. 所有使用到本软件功能的产品及宣传材料，都必须包还含下列之交待文字：
//*        “本产品内含有由金千枝（深圳）软件技术有限公司及其软件贡献者所开发的软件。”
//* 4. 如果没有特殊的事前书面许可，原作者的组织名称，和贡献者名字，都不能
//*    用于支持或宣传从既有软件派生的产品。
//* 
//* 免责声明：此软件由金千枝（深圳）软件技术有限公司和贡献者以“即此”方式提供，无论明示或
//* 暗示的，包括但不限于间接的关于基于某种目的的适销性、实用性，在此皆明示
//* 不予保证。在任何情况下，由于使用此软件造成的，直接、间接、连带、特别、
//* 惩戒或因此而造成的损害（包括但不限于获得替代品及服务，无法使用，丢失数
//* 据，损失盈利或业务中断），无论此类损害是如何造成的，基于何种责任推断，
//* 是否属于合同范畴，严格赔偿责任或民事侵权行为（包括疏忽和其他原因），即
//* 使预先被告知此类损害可能发生，金千枝（深圳）软件技术有限公司和贡献者均不承担任何责任。
//================================================================

/*--- 属性 ---*/
public:
privatewrite	ulong		#Handle
privatewrite	window	#Parentwindow
protectedwrite	boolean	#Transparent
boolean						#LockUpdate
protectedwrite boolean	#Animation		//动画效果
protectedwrite	boolean	#Marquee			//单方向循环滚动效果（表示当前没有处理的具体进度）

/*--- 私有 ---*/
private:
n_canvas _Canvas

uint _nPos
long _nSlidePos
long _nSlideTicks
boolean _bAnimating

//Timer ID
constant uint TM_ANIMATION = 1
//Timer interval
constant uint TMI_ANIMATION = 15
//Slide
constant long SLIDE_MAX_POS = 50
end variables

forward prototypes
public function long of_setmarquee (readonly boolean marquee)
public function long of_redraw ()
public function long of_setanimation (readonly boolean animation)
public function long of_updatepoints ()
public function long of_updateparentbkgnd (readonly boolean bredraw)
public function long of_settransparent (readonly boolean transparent, readonly boolean bredraw)
public function long of_settransparent (readonly boolean transparent)
end prototypes

event onconstructor;#Handle = Handle(this)
#ParentWindow = GetParentWindow(this)
_Canvas = Create n_canvas
_Canvas.Attach(This)

Event OnPreConstructor()
Event Constructor()
Post Event OnPostConstructor()

if #Animation or #Marquee then
	_bAnimating = true
	Timer.Start(TM_ANIMATION,TMI_ANIMATION)
end if
end event

event ondestructor;Event OnPreDestructor()
Event Destructor()

_Canvas.Detach()
Destroy _Canvas
Timer.StopAll()
end event

event type long onpaint(unsignedlong hdc);uint nPos
ulong clrTransparent,clrFkgnd,hRgn
RECTF rcClient,rcSlide

clrTransparent = theme.of_GetColor(theme.CLR_TRANSPARENT,0)
clrFkgnd = theme.of_GetColor(theme.CLR_FKGND,0)

Painter.GetClientRect(#Handle,ref rcClient)

if clrTransparent <> 0 then
	Painter.FillRect(hdc,rcClient.left,rcClient.top,rcClient.right,rcClient.bottom,clrTransparent,clrTransparent,Enums.HORZ,false,false,0)
end if

Painter.ThemeFill(hdc,rcClient,theme.of_GetColor(theme.CLR_BKGND,0),Enums.HORZ,theme.#BkgndStyle,0,false,theme.#BorderStyle,0,theme.#RoundSize)

if Not #Marquee and Int(Position) >= Int(MinPosition) and MaxPosition > MinPosition then
	if SmoothScroll then
		nPos = _nPos
	else
		nPos = Position
	end if
	rcClient.top = (1 - (nPos / (MaxPosition - MinPosition))) * rcClient.bottom
	Painter.ThemeFill(hdc,rcClient,clrFkgnd,Enums.HORZ,theme.#BkgndStyle,0,false,theme.#BorderStyle,0,theme.#RoundSize)
end if

if ((Position < MaxPosition or _nSlidePos <> 0) and #Animation) or #Marquee then
	if theme.#BorderStyle = Enums.BS_ROUND then
		hRgn = Painter.CreateRoundRectRgn(rcClient,theme.#RoundSize)
	else
		hRgn = Painter.CreateRectRgn(rcClient)
	end if
	Painter.SelectClipRgn(hdc,hRgn)
	if theme.#BkgndStyle = Enums.SOLID or #Marquee then
		rcSlide.bottom = Min(rcClient.bottom,40)
	else
		rcSlide.bottom = Min(Max(rcClient.bottom,40),60)
	end if
	rcSlide.right = rcClient.right
	Painter.OffsetRect(ref rcSlide,0,rcClient.top + (1 - _nSlidePos / SLIDE_MAX_POS) * (rcClient.bottom - rcClient.top) + rcSlide.bottom)
	if theme.#BkgndStyle = Enums.SOLID or #Marquee then
		if Not #Marquee then
			clrFkgnd = ARGBLighten(clrFkgnd,0.3)
		end if
		Painter.FillRect(hdc,rcSlide.left,rcSlide.top,rcSlide.right,rcSlide.bottom,clrFkgnd,0,Enums.VERT,false,false,0)
	else
		if Not #Marquee then
			clrFkgnd = ARGBLighten(clrFkgnd,0.7)
		end if
		rcSlide.right *= 2.5
		Painter.FillOval(hdc,rcSlide.left,rcSlide.top,rcSlide.right,rcSlide.bottom,clrFkgnd,0,false,0)
	end if
	Painter.SelectClipRgn(hdc,0)
	Painter.DeleteRgn(hRgn)
	if rcSlide.bottom <= rcClient.top then
		_nSlidePos = 0
		_nSlideTicks = CPU()
	end if
end if

if theme.#BorderStyle <> Enums.BS_NONE then
	rcClient.top = 0
	Painter.DrawThemeBorder(hdc,rcClient,theme.of_GetColor(theme.CLR_BORDER,0),theme.#BkgndStyle,theme.#BorderStyle,theme.#RoundSize)
end if

if Not _bAnimating then
	if ((Position < MaxPosition or _nPos <> Position) and #Animation) or #Marquee then
		_bAnimating = true
		Timer.Start(TM_ANIMATION,TMI_ANIMATION)
	end if
end if

return 1
end event

public function long of_setmarquee (readonly boolean marquee);if #Marquee = marquee then return RetCode.OK
#Marquee = marquee
_nSlidePos = 0
if #Marquee and Not _bAnimating then
	_bAnimating = true
	Timer.Start(TM_ANIMATION,TMI_ANIMATION)
end if
of_Redraw()
return RetCode.OK
end function

public function long of_redraw ();ulong safeDC

if #LockUpdate then return RetCode.FAILED
if Not Visible then return RetCode.OK

safeDC=_Canvas.GetSafeDC()

if #Transparent then
	_Canvas.FillParentBkgnd(safeDC)
end if

Event OnPaint(safeDC)

_Canvas.ReleaseDC(safeDC,0)

return RetCode.OK
end function

public function long of_setanimation (readonly boolean animation);if #Animation = animation then return RetCode.OK
#Animation = animation
_nSlidePos = 0
if #Animation then
	if Not _bAnimating then
		_bAnimating = true
		Timer.Start(TM_ANIMATION,TMI_ANIMATION)
	end if
else
	if _bAnimating and Not #Marquee and Not SmoothScroll then
		_bAnimating = false
		Timer.Stop(TM_ANIMATION)
	end if
end if
of_Redraw()
return RetCode.OK
end function

public function long of_updatepoints ();if #LockUpdate then return RetCode.FAILED

of_Redraw()

return RetCode.OK
end function

public function long of_updateparentbkgnd (readonly boolean bredraw);if Not #Transparent then return RetCode.E_NO_SUPPORT

Win32.UpdateParentBkgnd(#Handle,bRedraw)

return RetCode.OK
end function

public function long of_settransparent (readonly boolean transparent, readonly boolean bredraw);if #Transparent = transparent then return RetCode.OK

#Transparent = transparent
if #Transparent then
	Win32.UpdateParentBkgnd(#Handle,false)
end if
if bRedraw and Visible then
	SetRedraw(true)
end if

return RetCode.OK
end function

public function long of_settransparent (readonly boolean transparent);return of_SetTransparent(transparent,true)
end function

on s_cst_vprogressbar.create
this.theme=create theme
this.timer=create timer
end on

on s_cst_vprogressbar.destroy
destroy(this.theme)
destroy(this.timer)
end on

type theme from n_cst_progressbar_theme within s_cst_vprogressbar descriptor "pb_nvo" = "true" 
end type

on theme.create
call super::create
end on

on theme.destroy
call super::destroy
end on

event onthemechanged;call super::onthemechanged;boolean dirty

if _Canvas.GetHandle() = 0 then return

choose case eventFlag
	case EVT_THEME
		dirty = true
end choose

if dirty then
	of_UpdatePoints()
else
	of_Redraw()
end if

Parent.Event OnThemeChanged(eventFlag)
end event

event ongetcolor;call super::ongetcolor;Parent.Event OnGetColor(colorFlag,state,ref color)
end event

type timer from n_timer within s_cst_vprogressbar descriptor "pb_nvo" = "true" 
end type

on timer.create
call super::create
end on

on timer.destroy
call super::destroy
end on

event ontimer;call super::ontimer;uint nPos
boolean bRedraw

choose case id
	case TM_ANIMATION
		if SmoothScroll then
			nPos = _nPos
			if Position >= MinPosition and Position <= MaxPosition then
				if _nPos < Position then
					_nPos += (Position - _nPos) / 15 + 1
					if _nPos > Position then _nPos = Position
					if _nPos > MaxPosition then _nPos = MaxPosition
					bRedraw = true
				elseif _nPos > Position then
					_nPos -= (_nPos - Position) / 15 + 1
					if _nPos < Position then _nPos = Position
					if _nPos < MinPosition then _nPos = MinPosition
					bRedraw = true
				end if
			else
				_nPos = Position
				if Int(_nPos) < Int(MinPosition) then _nPos = MinPosition
				if _nPos > MaxPosition then _nPos = MaxPosition
			end if
			bRedraw = (nPos <> _nPos)
		end if
		if #Animation or #Marquee then
			if CPU() - _nSlideTicks > 500 then
				_nSlideTicks  = 0
				_nSlidePos ++
				bRedraw = true
			end if
		end if
		if bRedraw then
			of_Redraw()
		end if
		if ((Position < MaxPosition or _nSlidePos <> 0) and #Animation) or ((_nPos <> Position and nPos <> _nPos) and SmoothScroll) or #Marquee then
			return true
		end if
		_bAnimating = false
end choose
return false
end event

