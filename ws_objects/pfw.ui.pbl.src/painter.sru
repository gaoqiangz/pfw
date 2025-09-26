$PBExportHeader$painter.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type painter from nonvisualobject
end type
end forward

global type painter from nonvisualobject
end type
global painter painter

type prototypes
Public:
/*--- PowerFramework ---*/
//Paint
function boolean ThemeFill( unsignedlong hdc, readonly RECTF rcPaint,  unsignedlong backcolor,  uint orientation,  uint style,  ulong state,  boolean rtlfill, uint borderstyle, unsignedlong bordercolor, readonly RADIUSF lpRadius) library "pfw.dll" alias for "pfwThemeFillRect"
function boolean ThemeFill( unsignedlong hdc, readonly RECTF rcPaint,  unsignedlong backcolor,  uint orientation,  uint style,  ulong state,  boolean rtlfill, uint borderstyle,  unsignedlong bordercolor,ulong lpRadius) library "pfw.dll" alias for "pfwThemeFillRect"
function boolean ThemeFill( unsignedlong hdc, readonly POINTF paintregion[], uint count,   unsignedlong backcolor,  uint orientation,  uint style,  ulong state,  boolean rtlfill, boolean border,  unsignedlong bordercolor) library "pfw.dll" alias for "pfwThemeFillPolygon"
function boolean ThemeFill( unsignedlong hdc, ulong lppath,   unsignedlong backcolor,  uint orientation,  uint style,  ulong state,  boolean rtlfill, boolean border,  unsignedlong bordercolor) library "pfw.dll" alias for "pfwThemeFillPath"
function boolean DrawThemeBorder( unsignedlong hdc, readonly RECTF rcPaint,  unsignedlong color,  uint bkgndstyle, uint borderstyle, readonly RADIUSF lpRadius) library "pfw.dll" alias for "pfwDrawThemeBorderRect"
function boolean DrawThemeBorder( unsignedlong hdc, readonly RECTF rcPaint,  unsignedlong color,  uint bkgndstyle, uint borderstyle, ulong lpRadius) library "pfw.dll" alias for "pfwDrawThemeBorderRect"
function boolean DrawThemeBorder( unsignedlong hdc, readonly POINTF paintregion[], uint count,   unsignedlong color,  uint bkgndstyle) library "pfw.dll" alias for "pfwDrawThemeBorderPolygon"
function boolean DrawThemeBorder( unsignedlong hdc, ulong lppath,   unsignedlong color,  uint bkgndstyle) library "pfw.dll" alias for "pfwDrawThemeBorderPath"
function boolean FillRect( unsignedlong hdc, real left, real top, real right, real bottom,  unsignedlong startcolor,  unsignedlong endcolor,  uint orientation,  boolean repeat, boolean border, ulong bordercolor) library "pfw.dll" alias for "pfwFillRect"
function boolean FillRoundRect( unsignedlong hdc, real left, real top, real right, real bottom,  unsignedlong startcolor,  unsignedlong endcolor,  uint orientation,  boolean repeat, boolean border, ulong bordercolor, readonly RADIUSF lpRadius) library "pfw.dll" alias for "pfwFillRoundRect"
function boolean FillRoundRect( unsignedlong hdc, real left, real top, real right, real bottom,  unsignedlong startcolor,  unsignedlong endcolor,  uint orientation,  boolean repeat, boolean border, ulong bordercolor, ulong lpRadius) library "pfw.dll" alias for "pfwFillRoundRect"
function boolean FillOval( unsignedlong hdc, real left, real top, real right, real bottom,  unsignedlong centercolor, unsignedlong surroundcolor,  boolean border, ulong bordercolor) library "pfw.dll" alias for "pfwFillOval"
function boolean FillTriangle( unsignedlong hdc, readonly POINTF pt1, readonly POINTF pt2, readonly POINTF pt3, unsignedlong startcolor,  unsignedlong endcolor,  uint orientation,  boolean repeat, boolean border, ulong bordercolor) library "pfw.dll" alias for "pfwFillTriangle"
function boolean FillPolygon( unsignedlong hdc, readonly POINTF paintregion[], uint count,   unsignedlong startcolor,  unsignedlong endcolor,  uint orientation,  boolean repeat, boolean border, ulong bordercolor) library "pfw.dll" alias for "pfwFillPolygon"
function boolean FillPath( unsignedlong hdc, ulong path,   unsignedlong startcolor,  unsignedlong endcolor,  uint orientation,  boolean repeat, boolean border, ulong bordercolor) library "pfw.dll" alias for "pfwFillPath"
function boolean DrawRect( unsignedlong hdc, real left, real top, real right, real bottom,  ulong color,  uint style,  real size) library "pfw.dll" alias for "pfwDrawRect"
function boolean DrawRoundRect( unsignedlong hdc, real left, real top, real right, real bottom, ulong color,  uint style,  real size, readonly RADIUSF lpRadius) library "pfw.dll" alias for "pfwDrawRoundRect"
function boolean DrawRoundRect( unsignedlong hdc, real left, real top, real right, real bottom, ulong color,  uint style,  real size, ulong lpRadius) library "pfw.dll" alias for "pfwDrawRoundRect"
function boolean DrawTriangle( unsignedlong hdc, readonly POINTF pt1, readonly POINTF pt2, readonly POINTF pt3, ulong color,  uint style,  real size) library "pfw.dll" alias for "pfwDrawTriangle"
function boolean DrawOval( unsignedlong hdc, real left, real top, real right, real bottom, ulong color,  uint style,  real size) library "pfw.dll" alias for "pfwDrawOval"
function boolean DrawPolygon( unsignedlong hdc, readonly POINTF paintregion[], uint count,   ulong color,  uint style,  real size) library "pfw.dll" alias for "pfwDrawPolygon"
function boolean DrawPath( unsignedlong hdc, ulong path,   ulong color,  uint style,  real size) library "pfw.dll" alias for "pfwDrawPath"
function boolean DrawLine( unsignedlong hdc, real x1, real y1, real x2, real y2, unsignedlong linecolor, uint linestyle,  boolean shadow,  real size) library "pfw.dll" alias for "pfwDrawLine"
function boolean DrawGradientLine( unsignedlong hdc, real x1, real y1, real x2, real y2,  unsignedlong startcolor,  unsignedlong endcolor, uint linestyle,  boolean shadow, boolean repeat,  real size) library "pfw.dll" alias for "pfwDrawGradientLine"
function boolean DrawText( unsignedlong hdc,  unsignedlong hfont, readonly string text,  readonly RECTF  textrect,  unsignedlong color,  boolean shadow,  ulong dtparam) library "pfw.dll"	alias for "pfwDrawText"
function boolean DrawGlowingText( unsignedlong hdc,  unsignedlong hfont,readonly string text, readonly RECTF  textrect,  unsignedlong color, real glowsize,  ulong dtparam) library "pfw.dll" alias for "pfwDrawGlowingText"
function boolean DrawVerticalText( unsignedlong hdc,  unsignedlong hfont,readonly string text,readonly  RECTF  textrect,  unsignedlong color,  boolean shadow,  ulong dtparam) library "pfw.dll" alias for "pfwDrawVerticalText"
//Measure
function boolean GetFontSize(ulong hFont,ref SIZEF lpSize) library "pfw.dll" alias for "pfwGetFontSize"
function boolean GetFontTextSize(ulong hFont,readonly string lpcsText,ref SIZEF lpSize) library "pfw.dll" alias for "pfwGetFontTextSize"
function boolean CalcFontTextSize(ulong hFont,readonly string lpcsText,ulong dtParam,ref RECTF lpRect) library "pfw.dll" alias for "pfwCalcFontTextSize"
//Region
function ulong CreateRectRgn(real x1,real y1,real x2,real y2) library "pfw.dll" alias for "pfwCreateRectRgn"
function ulong CreateRectRgn(readonly RECTF lpRect) library "pfw.dll" alias for "pfwCreateRectRgnIndirect"
function ulong CreateRoundRectRgn(real Left,real Top,real Right,real bottom,readonly RADIUSF lpRadius) library "pfw.dll" alias for "pfwCreateRoundRectRgn"
function ulong CreateRoundRectRgn(readonly RECTF lpRect,readonly RADIUSF lpRadius) library "pfw.dll" alias for "pfwCreateRoundRectRgnIndirect"
function long IntersectClipRect(ulong hdc,real x1,real y1,real x2,real y2) library "pfw.dll" alias for "pfwIntersectClipRect"
function long IntersectClipRect(ulong hdc,readonly RECTF lpRect) library "pfw.dll" alias for "pfwIntersectClipRectIndirect"
function long ExcludeClipRect(ulong hdc,real x1,real y1,real x2,real y2) library "pfw.dll" alias for "pfwExcludeClipRect"
function long ExcludeClipRect(ulong hdc,readonly RECTF lpRect) library "pfw.dll" alias for "pfwExcludeClipRectIndirect"
function long SelectClipRgn (ulong hdc,ulong hrgn) library "gdi32.DLL"
function ulong CombineRgn(ulong hDestRgn,ulong hSrcRgn1,ulong hSrcRgn2,ulong nCombineMode) library "gdi32.dll"
function boolean DeleteRgn(ulong hgdiobject) library "gdi32.dll" alias for "DeleteObject"
//Coordinate
function boolean SetWindowOrgExt(ulong hdc,real x,real y) library "pfw.dll" alias for "pfwSetWindowOrgExt"
function boolean SetWindowOrgExt(ulong hdc,readonly POINTF lppt) library "pfw.dll" alias for "pfwSetWindowOrgExtIndirect"
function boolean GetWindowOrgExt(ulong hdc,ref POINTF lppt) library "pfw.dll" alias for "pfwGetWindowOrgExt"
function boolean GetCursorPos(ref POINTF lppoint) library "pfw.dll" alias for "pfwGetCursorPos"
function boolean GetWindowRect(ulong hwnd,ref RECTF lpRect) library "pfw.dll" alias for "pfwGetWindowRect"
function boolean GetClientRect(ulong hwnd,ref RECTF lpRect) library "pfw.dll" alias for "pfwGetClientRect"
function boolean GetScreenRect(ref RECTF lpRect) library "pfw.dll" alias for "pfwGetScreenRect"
function boolean GetScreenWorkArea(ref RECTF lpRect) library "pfw.dll" alias for "pfwGetScreenWorkArea"
function boolean ClientToScreen(ulong hWnd,ref POINTF lpPoint) library "pfw.dll" alias for "pfwClientToScreenPoint"
function boolean ClientToScreen(ulong hWnd,ref RECTF lpRect) library "pfw.dll" alias for "pfwClientToScreenRect"
function boolean ScreenToClient(ulong hWnd,ref POINTF lpPoint) library "pfw.dll" alias for "pfwScreenToClientPoint"
function boolean ScreenToClient(ulong hWnd,ref RECTF lpRect) library "pfw.dll" alias for "pfwScreenToClientRect"
//Rect
function boolean IsRectEmpty(readonly RECTF lprc) library "pfw.dll" alias for "pfwIsRectEmpty"
function boolean SetRectEmpty(ref RECTF lprc) library "pfw.dll" alias for "pfwSetRectEmpty"
function boolean EqualRect(readonly RECTF lprcDst,readonly RECTF lpcrcSrc) library "pfw.dll" alias for "pfwEqualRect"
function boolean CopyRect(ref RECTF lprcDst,readonly RECTF lpcrcSrc) library "pfw.dll" alias for "pfwCopyRect"
function boolean CopyRect(ref RECTF lprcDst,ulong lpcrcSrc) library "pfw.dll" alias for "pfwCopyRect"
function boolean CopyRect(ulong lprcDst,readonly RECTF lpcrcSrc) library "pfw.dll" alias for "pfwCopyRect"
function boolean OffsetRect(ref RECTF lprc,real dx,real dy) library "pfw.dll" alias for "pfwOffsetRect"
function boolean InflateRect(ref RECTF lprc,real dx,real dy) library "pfw.dll" alias for "pfwInflateRect"
function boolean PtInRect(readonly RECTF lprc,real x,real y) library "pfw.dll" alias for "pfwPtInRect"
//DC
function ulong RestoreDC(ulong hdc,ulong nSavedDC) library "gdi32.dll"
function ulong SaveDC(ulong hdc) library "gdi32.dll"
//Misc
function ulong GetPixel(ulong hdc,real x,real y) library "pfw.dll" alias for "pfwGetPixel"
function boolean SetPixel(long hdc,real x,real y,ulong color) library "pfw.dll" alias for "pfwSetPixel"
function ulong GetPBColor(ulong colorindex) library "pfw.dll" alias for "pfwGetPBColor"
function ulong GetPBColorA(ulong colorindex) library "pfw.dll" alias for "pfwGetPBColorA"
function ulong GetSolidBrushColor(ulong hBrush) library "pfw.dll" alias for "pfwGetSolidBrushColor"
function ulong GetSolidBrushColorA(ulong hBrush) library "pfw.dll" alias for "pfwGetSolidBrushColorA"
//Path
function long CreatePath(long brushMode, ref ulong gPath) library "gdiplus.dll" alias for "GdipCreatePath"
function long DeletePath(ulong gPath) library "gdiplus.dll" alias for "GdipDeletePath"
function long ResetPath(ulong gPath) library "gdiplus.dll" alias for "GdipResetPath"
function long SetPathFillMode(ulong gPath, long fillMode) library "gdiplus.dll" alias for "GdipSetPathFillMode"
function long StartPathFigure(ulong gPath) library "gdiplus.dll" alias for "GdipStartPathFigure"
function long ClosePathFigure(ulong gPath) library "gdiplus.dll" alias for "GdipClosePathFigure"
function long AddPathLine(ulong gPath, real x1, real y1, real x2, real y2) library "pfw.dll" alias for "pfwAddPathLine"
function long AddPathArc(ulong gPath, real x, real y, real width, real height, real startAngle, real sweepAngle) library "pfw.dll" alias for "pfwAddPathArc"
function long AddPathRectangle(ulong gPath, real x, real y, real width, real height) library "pfw.dll" alias for "pfwAddPathRectangle"
function long AddPathEllipse(ulong gPath, real x, real y, real width, real height) library "pfw.dll" alias for "pfwAddPathEllipse"
function long AddPathPie(ulong gPath, real x, real y, real width, real height, real startAngle, real sweepAngle) library "pfw.dll" alias for "pfwAddPathPie"
function long AddPathPath(ulong gPath, ulong gAddPath, boolean connectPath) library "gdiplus.dll" alias for "GdipAddPathPath"
function boolean IsVisiblePathPoint(ulong gPath, real x, real y) library "pfw.dll" alias for "pfwIsVisiblePathPoint"
function boolean IsOutlineVisiblePathPoint(ulong gPath, real x, real y, ulong gPen) library "pfw.dll" alias for "pfwIsOutlineVisiblePathPoint"
function long TransformPath(ulong gPath, ulong gMatrix) library "gdiplus.dll" alias for "GdipTransformPath"
//Pen
function long CreatePen(ulong argb, real width, long unit, ref ulong gPen) library "gdiplus.dll" alias for "GdipCreatePen1"
function long DeletePen(ulong gPen) library "gdiplus.dll" alias for "GdipDeletePen"
//Matrix
function long CreateMatrix(ref ulong gMatrix) library "gdiplus.dll" alias for "GdipCreateMatrix"
function long DeleteMatrix(ulong gMatrix) library "gdiplus.dll" alias for "GdipDeleteMatrix"
function boolean TranslateMatrix(ulong gMatrix, real xOffset, real yOffset, long matrixOrder) library "pfw.dll" alias for "pfwTranslateMatrix"
end prototypes

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
/*--- Constants ---*/
//DrawText/CalcFontTextSize
Constant Long DT_TOP = 0
Constant Long DT_LEFT = 0
Constant Long DT_CENTER = 1
Constant Long DT_RIGHT = 2
Constant Long DT_VCENTER = 4
Constant Long DT_BOTTOM = 8
Constant Long DT_WORDBREAK = 16
Constant Long DT_SINGLELINE = 32
Constant Long DT_EXPANDTABS = 64
Constant Long DT_TABSTOP = 128
Constant Long DT_NOCLIP = 256
Constant Long DT_EXTERNALLEADING = 512
Constant Long DT_CALCRECT = 1024
Constant Long DT_NOPREFIX = 2048
Constant Long DT_INTERNAL = 4096
Constant Long DT_EDITCONTROL = 8192
Constant Long DT_PATH_ELLIPSIS = 16384
Constant Long DT_END_ELLIPSIS = 32768
Constant Long DT_MODIFYSTRING = 65536
Constant Long DT_RTLREADING = 131072
Constant Long DT_WORD_ELLIPSIS = 262144
Constant Long DT_NOFULLWIDTHCHARBREAK = 524288
Constant Long DT_HIDEPREFIX = 1048576
Constant Long DT_PREFIXONLY = 2097152
//CombineRgn
Constant Long RGN_AND=1
Constant Long RGN_OR=2
Constant Long RGN_XOR=3
Constant Long RGN_DIFF=4
Constant Long RGN_COPY=5
//DrawScrollBar
Constant Long DSF_ARROWUP		= 1
Constant Long DSF_ARROWLEFT	= 1
Constant Long DSF_ARROWDOWN	= 2
Constant Long DSF_ARROWRIGHT	= 2
Constant Long DSF_THUMB			= 4
Constant Long DSF_ALL			= 7 //DSF_ARROWUP | DSF_ARROWDOWN | DSF_THUMB
end variables

forward prototypes
public function boolean of_drawgraphicobject (readonly unsignedlong hdc, readonly graphicobject object)
public function long of_convertlinestyle (readonly linestyle style)
public function boolean of_calctextsize (readonly n_cst_font font, readonly string text, readonly unsignedlong dtparam, ref rectf calcrect)
public function boolean of_calcverttextsize (readonly n_cst_font font, readonly string text, readonly unsignedlong dtparam, ref rectf calcrect)
public function boolean of_drawscrollbar (readonly unsignedlong hdc, readonly scrollbardrawinfo sbdrawinfo, readonly boolean bvert, readonly long flags, readonly n_cst_base_theme theme, readonly long borderstyle, readonly radiusf rdborder)
public function boolean of_drawtext (readonly unsignedlong hdc, readonly n_cst_font font, readonly string text, readonly real left, readonly real top, readonly real right, readonly real bottom, readonly unsignedlong color, readonly unsignedlong dtparam)
public function boolean of_drawtext (readonly unsignedlong hdc, readonly n_cst_font font, readonly string text, readonly rectf rctext, readonly unsignedlong color, readonly unsignedlong dtparam)
public function boolean of_drawverticaltext (readonly unsignedlong hdc, readonly n_cst_font font, readonly string text, ref rectf rctext, readonly unsignedlong color, readonly unsignedlong dtparam)
public function boolean of_drawverticaltext (readonly unsignedlong hdc, readonly n_cst_font font, readonly string text, readonly real left, readonly real top, readonly real right, readonly real bottom, readonly unsignedlong color, readonly unsignedlong dtparam)
public function boolean of_fillpolygon (readonly unsignedlong hdc, readonly pointf paintregion[], readonly unsignedlong color, readonly boolean border, readonly unsignedlong bordercolor)
public function boolean of_fillpolygon (readonly unsignedlong hdc, readonly pointf paintregion[], readonly unsignedlong startcolor, readonly unsignedlong endcolor, readonly unsignedinteger orientation, readonly boolean repeat, readonly boolean border, readonly unsignedlong bordercolor)
public function boolean of_fillrect (readonly unsignedlong hdc, readonly rectf rcpaint, readonly unsignedlong startcolor, readonly unsignedlong endcolor, readonly unsignedinteger orientation, readonly boolean repeat, readonly boolean border, readonly unsignedlong bordercolor)
public function boolean of_fillrect (readonly unsignedlong hdc, readonly rectf rcpaint, readonly unsignedlong color, readonly boolean border, readonly unsignedlong bordercolor)
public function boolean of_fillroundrect (readonly unsignedlong hdc, readonly rectf rcpaint, readonly unsignedlong color, readonly boolean border, readonly unsignedlong bordercolor, radiusf radius)
public function boolean of_fillroundrect (readonly unsignedlong hdc, readonly rectf rcpaint, readonly unsignedlong color, readonly boolean border, readonly unsignedlong bordercolor)
public function boolean of_filltriangle (readonly unsignedlong hdc, readonly pointf pt1, readonly pointf pt2, readonly pointf pt3, readonly unsignedlong color, readonly boolean border, readonly unsignedlong bordercolor)
public function boolean of_themefill (readonly unsignedlong hdc, readonly rectf rcpaint, readonly n_cst_base_theme theme, readonly unsignedlong state)
public function boolean of_drawline (readonly unsignedlong hdc, readonly real x1, readonly real y1, readonly real x2, readonly real y2, readonly unsignedlong color, readonly boolean shadow, readonly real size)
public function boolean of_drawgradientline (readonly unsignedlong hdc, readonly real x1, readonly real y1, readonly real x2, readonly real y2, readonly unsignedlong color, readonly boolean shadow, readonly boolean repeat, readonly real size)
public function boolean of_drawpolygon (readonly unsignedlong hdc, readonly pointf paintregion[], readonly unsignedlong color, readonly unsignedinteger style, readonly real size)
public function boolean of_drawrect (readonly unsignedlong hdc, readonly rectf rcpaint, readonly unsignedlong color, readonly unsignedinteger style, readonly real size)
end prototypes

public function boolean of_drawgraphicobject (readonly unsignedlong hdc, readonly graphicobject object);Long nLineStyle
Real nLineSize
Ulong nBackColor,nLineColor
RECTF rc
RADIUSF rds

if Not object.Visible then return true

choose case object.TypeOf()
	case Line!
		Line ln
		ln = object
		nLineStyle = of_ConvertLineStyle(ln.LineStyle)
		if nLineStyle = -1 then return true
		nLineColor = GetPBColorA(ln.LineColor)
		nLineSize = U2DX(ln.LineThickness)
		DrawLine(hdc,&
					U2DX(ln.BeginX),&
					U2DY(ln.BeginY),&
					U2DX(ln.EndX),&
					U2DY(ln.EndY),&
					nLineColor,&
					nLineStyle,&
					false,&
					nLineSize)
	case Oval!
		Oval ov
		ov = object
		nLineStyle = of_ConvertLineStyle(ov.LineStyle)
		nLineSize = U2DX(ov.LineThickness)
		nBackColor = GetPBColorA(ov.FillColor)
		nLineColor = GetPBColorA(ov.LineColor)
		rc.Left = U2DX(ov.X)
		rc.Top = U2DY(ov.Y)
		rc.Right = rc.Left + U2DX(ov.Width)
		rc.Bottom = rc.Top + U2DY(ov.Height)
		
		FillOval(hdc, rc.Left, rc.Top, rc.Right, rc.Bottom, nBackColor, nBackColor,  false, 0)
		if nLineStyle <> -1 then
			DrawOval(hdc, rc.Left, rc.Top, rc.Right, rc.Bottom, nLineColor,  nLineStyle,  nLineSize)
		end if
	case Rectangle!
		Rectangle rec
		rec = object
		nLineStyle = of_ConvertLineStyle(rec.LineStyle)
		nLineSize = U2DX(rec.LineThickness)
		nBackColor = GetPBColorA(rec.FillColor)
		nLineColor = GetPBColorA(rec.LineColor)
		rc.Left = U2DX(rec.X)
		rc.Top = U2DY(rec.Y)
		rc.Right = rc.Left + U2DX(rec.Width)
		rc.Bottom = rc.Top + U2DY(rec.Height)
		
		FillRect(hdc, rc.Left, rc.Top, rc.Right, rc.Bottom, nBackColor, nBackColor,  Enums.VERT,  false, false, 0)
		if nLineStyle <> -1 then
			DrawRect(hdc, rc.Left, rc.Top, rc.Right, rc.Bottom, nLineColor,  nLineStyle,  nLineSize)
		end if
	case RoundRectangle!
		RoundRectangle rrec
		rrec = object
		nLineStyle = of_ConvertLineStyle(rrec.LineStyle)
		nLineSize = U2DX(rrec.LineThickness)
		nBackColor = GetPBColorA(rrec.FillColor)
		nLineColor = GetPBColorA(rrec.LineColor)
		rc.Left = U2DX(rrec.X)
		rc.Top = U2DY(rrec.Y)
		rc.Right = rc.Left + U2DX(rrec.Width)
		rc.Bottom = rc.Top + U2DY(rrec.Height)
		rds.LeftTop = U2DY(rrec.CornerHeight)
		rds.RightTop = rds.LeftTop
		rds.LeftBottom = rds.LeftTop
		rds.RightBottom = rds.LeftTop
		FillRoundRect(hdc, rc.Left, rc.Top, rc.Right, rc.Bottom, nBackColor, nBackColor,  Enums.VERT,  false, false, 0, ref rds)
		if nLineStyle <> -1 then
			DrawRoundRect(hdc, rc.Left, rc.Top, rc.Right, rc.Bottom, nLineColor,  nLineStyle,  nLineSize, ref rds)
		end if
	case else
		return false
end choose

return true
end function

public function long of_convertlinestyle (readonly linestyle style);Long nStyle

choose case style
	case Continuous!
		nStyle = Enums.LS_SOLID
	case Dash!
		nStyle = Enums.LS_DASH
	case Dot!
		nStyle = Enums.LS_DOT
	case DashDot!
		nStyle = Enums.LS_DASHDOT
	case DashDotDot!
		nStyle = Enums.LS_DASHDOTDOT
	case else
		nStyle = -1
end choose

return nStyle
end function

public function boolean of_calctextsize (readonly n_cst_font font, readonly string text, readonly unsignedlong dtparam, ref rectf calcrect);if CalcFontTextSize(Font.#Handle,Text,dtparam,ref calcRect) then
	if Font.#ShadowStyle = Font.SDS_GLOWING then
		calcRect.right += Font.#GlowSize / 2
		calcRect.bottom += Font.#GlowSize / 2
	end if
	return true
else
	return false
end if
end function

public function boolean of_calcverttextsize (readonly n_cst_font font, readonly string text, readonly unsignedlong dtparam, ref rectf calcrect);SIZEF szText

if GetFontTextSize(Font.#Handle,Text,ref szText) then
	calcRect.right = szText.cy
	calcRect.bottom = szText.cy * Len(Text)
	return true
else
	return false
end if
end function

public function boolean of_drawscrollbar (readonly unsignedlong hdc, readonly scrollbardrawinfo sbdrawinfo, readonly boolean bvert, readonly long flags, readonly n_cst_base_theme theme, readonly long borderstyle, readonly radiusf rdborder);ulong bkColor,borderColor,arrowColor,nMainState,nState
long nBkgndOrientation
boolean bDrawArrowUp,bDrawArrowDown,bDrawThumb
POINTF pt1,pt2,pt3
RADIUSF rdBorderArrow
Constant real ARROWSIZE = 6

if Not sbDrawInfo.Visible then return false

bDrawArrowUp = (sbDrawInfo.btnArrowUp.Visible and BitAND(flags,DSF_ARROWUP) <> 0)
bDrawArrowDown = (sbDrawInfo.btnArrowDown.Visible and BitAND(flags,DSF_ARROWDOWN) <> 0)
bDrawThumb = (sbDrawInfo.btnThumb.Visible and BitAND(flags,DSF_THUMB) <> 0)

if bVert then
	nBkgndOrientation = Enums.HORZ
else
	nBkgndOrientation = Enums.VERT
end if

//Background
if sbDrawInfo.MouseOver then nMainState += Enums.STATE_HOVER
if sbDrawInfo.MouseDown then nMainState += Enums.STATE_PRESSED

bkColor = theme.of_GetColor(theme.CLR_SCROLLBARBKGND,nMainState)
borderColor = theme.of_GetColor(theme.CLR_SCROLLBARBORDER,nMainState)
if theme.#BkgndStyle = Enums.SOLID or theme.#BkgndStyle = Enums.TRANSPARENT then
	ThemeFill( hdc, sbDrawInfo.rcPaint, bkColor, nBkgndOrientation, Enums.SOLID, Enums.STATE_NONE, false,borderStyle,borderColor,rdBorder)
else
	if borderStyle = Enums.BS_ROUND then
		FillRoundRect( hdc, sbDrawInfo.rcPaint.left,sbDrawInfo.rcPaint.top,sbDrawInfo.rcPaint.right,sbDrawInfo.rcPaint.bottom, bkColor,ARGBLighten(bkColor,0.2), nBkgndOrientation,  true,true,borderColor,rdBorder)
	else
		FillRect( hdc, sbDrawInfo.rcPaint.left,sbDrawInfo.rcPaint.top,sbDrawInfo.rcPaint.right,sbDrawInfo.rcPaint.bottom, bkColor,ARGBLighten(bkColor,0.2), nBkgndOrientation,  true,true,borderColor)
	end if
end if

//Arrows
if sbDrawInfo.MouseOver or sbDrawInfo.btnThumb.MouseDown or sbDrawInfo.btnArrowUp.MouseDown or sbDrawInfo.btnArrowDown.MouseDown then
	if bDrawArrowUp and sbDrawInfo.btnArrowUp.Enabled and sbDrawInfo.Enabled then
		nState = MakeLong(0,nMainState)
		if sbDrawInfo.btnArrowUp.MouseOver then nState += Enums.STATE_HOVER
		if sbDrawInfo.btnArrowUp.MouseDown then nState += Enums.STATE_PRESSED
		bkColor = theme.of_GetColor(theme.CLR_SBARROWBKGND,nState)
		borderColor = theme.of_GetColor(theme.CLR_SBARROWBORDER,nState)
	
		rdBorderArrow = rdBorder
		if bVert then
			rdBorderArrow.leftBottom = 0
			rdBorderArrow.rightBottom = 0
		else
			rdBorderArrow.rightTop = 0
			rdBorderArrow.rightBottom = 0
		end if
		ThemeFill( hdc, sbDrawInfo.btnArrowUp.rcPaint, bkColor, nBkgndOrientation, theme.#BkgndStyle, nState, false,borderStyle,borderColor,rdBorderArrow)
	end if
	
	if bDrawArrowDown and sbDrawInfo.btnArrowDown.Enabled and sbDrawInfo.Enabled then
		nState = MakeLong(0,nMainState)
		if sbDrawInfo.btnArrowDown.MouseOver then nState += Enums.STATE_HOVER
		if sbDrawInfo.btnArrowDown.MouseDown then nState += Enums.STATE_PRESSED
		bkColor = theme.of_GetColor(theme.CLR_SBARROWBKGND,nState)
		borderColor = theme.of_GetColor(theme.CLR_SBARROWBORDER,nState)
		
		rdBorderArrow = rdBorder
		if bVert then
			rdBorderArrow.leftTop = 0
			rdBorderArrow.rightTop = 0
		else
			rdBorderArrow.leftTop = 0
			rdBorderArrow.leftBottom = 0
		end if
		ThemeFill( hdc, sbDrawInfo.btnArrowDown.rcPaint, bkColor, nBkgndOrientation, theme.#BkgndStyle, nState, false,borderStyle,borderColor,rdBorderArrow)
	end if
end if

if bVert then
	//箭头向上
	if bDrawArrowUp then
		pt1.x = sbDrawInfo.btnArrowUp.rcPaint.left + (sbDrawInfo.btnArrowUp.rcPaint.right - sbDrawInfo.btnArrowUp.rcPaint.left - ARROWSIZE)/2 + ARROWSIZE/2
		pt1.y = sbDrawInfo.btnArrowUp.rcPaint.top + (sbDrawInfo.btnArrowUp.rcPaint.bottom - sbDrawInfo.btnArrowUp.rcPaint.top - ARROWSIZE / 2 ) / 2
		pt2.x = pt1.x + ARROWSIZE / 2
		pt2.y = pt1.y + ARROWSIZE / 2
		pt3.x = pt1.x - ARROWSIZE / 2
		pt3.y = pt1.y + ARROWSIZE / 2
		if sbDrawInfo.btnArrowUp.Enabled and sbDrawInfo.Enabled then
			arrowColor	= theme.of_GetColor(theme.CLR_ARROW,0)
		else
			arrowColor	= theme.of_GetColor(theme.CLR_ARROW,Enums.STATE_DISABLED)
		end if
		FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
	end if
	//箭头向下
	if bDrawArrowDown then
		pt1.x = sbDrawInfo.btnArrowDown.rcPaint.left + (sbDrawInfo.btnArrowDown.rcPaint.right - sbDrawInfo.btnArrowDown.rcPaint.left - ARROWSIZE)/2
		pt1.y = sbDrawInfo.btnArrowDown.rcPaint.top + (sbDrawInfo.btnArrowDown.rcPaint.bottom - sbDrawInfo.btnArrowDown.rcPaint.top - ARROWSIZE / 2) / 2 
		pt2.x = pt1.x + ARROWSIZE
		pt2.y = pt1.y
		pt3.x = pt1.x + ARROWSIZE / 2
		pt3.y = pt1.y + ARROWSIZE / 2
		if sbDrawInfo.btnArrowDown.Enabled and sbDrawInfo.Enabled then
			arrowColor	= theme.of_GetColor(theme.CLR_ARROW,0)
		else
			arrowColor	= theme.of_GetColor(theme.CLR_ARROW,Enums.STATE_DISABLED)
		end if
		FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
	end if
else
	//箭头向左
	if bDrawArrowUp then
		pt1.x = sbDrawInfo.btnArrowUp.rcPaint.left + (sbDrawInfo.btnArrowUp.rcPaint.right - sbDrawInfo.btnArrowUp.rcPaint.left - ARROWSIZE / 2) / 2
		pt1.y = sbDrawInfo.btnArrowUp.rcPaint.top + (sbDrawInfo.btnArrowUp.rcPaint.bottom - sbDrawInfo.btnArrowUp.rcPaint.top - ARROWSIZE ) / 2  + ARROWSIZE/2
		pt2.x = pt1.x + ARROWSIZE / 2
		pt2.y = pt1.y - ARROWSIZE / 2
		pt3.x = pt1.x + ARROWSIZE / 2
		pt3.y = pt1.y + ARROWSIZE / 2
		if sbDrawInfo.btnArrowUp.Enabled and sbDrawInfo.Enabled then
			arrowColor	= theme.of_GetColor(theme.CLR_ARROW,0)
		else
			arrowColor	= theme.of_GetColor(theme.CLR_ARROW,Enums.STATE_DISABLED)
		end if
		FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
	end if
	//箭头向右
	if bDrawArrowDown then
		pt1.x = sbDrawInfo.btnArrowDown.rcPaint.left + (sbDrawInfo.btnArrowDown.rcPaint.right - sbDrawInfo.btnArrowDown.rcPaint.left - ARROWSIZE / 2) / 2
		pt1.y = sbDrawInfo.btnArrowDown.rcPaint.top + (sbDrawInfo.btnArrowDown.rcPaint.bottom - sbDrawInfo.btnArrowDown.rcPaint.top - ARROWSIZE) / 2
		pt2.x = pt1.x + ARROWSIZE / 2
		pt2.y = pt1.y + ARROWSIZE / 2
		pt3.x = pt1.x
		pt3.y = pt1.y + ARROWSIZE
		if sbDrawInfo.btnArrowDown.Enabled and sbDrawInfo.Enabled then
			arrowColor	= theme.of_GetColor(theme.CLR_ARROW,0)
		else
			arrowColor	= theme.of_GetColor(theme.CLR_ARROW,Enums.STATE_DISABLED)
		end if
		FillTriangle(hdc,pt1,pt2,pt3,arrowColor,arrowColor,Enums.HORZ,false,true,arrowColor)
	end if
end if

//Thumb
if bDrawThumb then
	nState = MakeLong(0,nMainState)
	if sbDrawInfo.btnThumb.MouseOver then nState += Enums.STATE_HOVER
	if sbDrawInfo.btnThumb.MouseDown then nState += Enums.STATE_PRESSED
	if Not sbDrawInfo.btnThumb.Enabled then nState += Enums.STATE_DISABLED
	bkColor = theme.of_GetColor(theme.CLR_SBTHUMBBKGND,nState)
	borderColor = theme.of_GetColor(theme.CLR_SBTHUMBBORDER,nState)
	ThemeFill( hdc, sbDrawInfo.btnThumb.rcPaint, bkColor, nBkgndOrientation, theme.#BkgndStyle, nState, false,borderStyle,borderColor,rdBorder)
end if

return true
end function

public function boolean of_drawtext (readonly unsignedlong hdc, readonly n_cst_font font, readonly string text, readonly real left, readonly real top, readonly real right, readonly real bottom, readonly unsignedlong color, readonly unsignedlong dtparam);RECTF rcText

rcText.left = left
rcText.top = top
rcText.right = right
rcText.bottom = bottom

return of_DrawText(hdc,Font,text,ref rcText,color,dtparam)
end function

public function boolean of_drawtext (readonly unsignedlong hdc, readonly n_cst_font font, readonly string text, readonly rectf rctext, readonly unsignedlong color, readonly unsignedlong dtparam);if Font.#ShadowStyle = Font.SDS_GLOWING then
	return DrawGlowingText(hdc,Font.#Handle,text,ref rcText,Color,Font.#GlowSize,dtparam)
else
	return DrawText(hdc,Font.#Handle,text,ref rcText,Color,(Font.#ShadowStyle = Font.SDS_NORMAL),dtparam)
end if
end function

public function boolean of_drawverticaltext (readonly unsignedlong hdc, readonly n_cst_font font, readonly string text, ref rectf rctext, readonly unsignedlong color, readonly unsignedlong dtparam);return DrawVerticalText(hdc,Font.#Handle,text,ref rcText,Color,(Font.#ShadowStyle = Font.SDS_NORMAL),dtparam)
end function

public function boolean of_drawverticaltext (readonly unsignedlong hdc, readonly n_cst_font font, readonly string text, readonly real left, readonly real top, readonly real right, readonly real bottom, readonly unsignedlong color, readonly unsignedlong dtparam);RECTF rcText

rcText.left = left
rcText.top = top
rcText.right = right
rcText.bottom = bottom

return of_DrawVerticalText(hdc,Font,text,ref rcText,color,dtparam)
end function

public function boolean of_fillpolygon (readonly unsignedlong hdc, readonly pointf paintregion[], readonly unsignedlong color, readonly boolean border, readonly unsignedlong bordercolor);return FillPolygon( hdc, paintregion[], UpperBound(paintregion),   color,  color,  0,  false, border, bordercolor)
end function

public function boolean of_fillpolygon (readonly unsignedlong hdc, readonly pointf paintregion[], readonly unsignedlong startcolor, readonly unsignedlong endcolor, readonly unsignedinteger orientation, readonly boolean repeat, readonly boolean border, readonly unsignedlong bordercolor);return FillPolygon( hdc, paintregion[], UpperBound(paintregion),   startcolor,  endcolor,  orientation,  repeat, border, bordercolor)
end function

public function boolean of_fillrect (readonly unsignedlong hdc, readonly rectf rcpaint, readonly unsignedlong startcolor, readonly unsignedlong endcolor, readonly unsignedinteger orientation, readonly boolean repeat, readonly boolean border, readonly unsignedlong bordercolor);return FillRect( hdc, rcPaint.left,rcPaint.top,rcPaint.right,rcPaint.bottom,  startcolor,  endcolor,orientation,repeat,border,bordercolor) 
end function

public function boolean of_fillrect (readonly unsignedlong hdc, readonly rectf rcpaint, readonly unsignedlong color, readonly boolean border, readonly unsignedlong bordercolor);return FillRect( hdc, rcPaint.left,rcPaint.top,rcPaint.right,rcPaint.bottom,  color,  color,0,false,border,bordercolor) 
end function

public function boolean of_fillroundrect (readonly unsignedlong hdc, readonly rectf rcpaint, readonly unsignedlong color, readonly boolean border, readonly unsignedlong bordercolor, radiusf radius);return FillRoundRect( hdc, rcPaint.left,rcPaint.top,rcPaint.right,rcPaint.bottom,  color,  color,0,false,border,bordercolor,ref radius) 
end function

public function boolean of_fillroundrect (readonly unsignedlong hdc, readonly rectf rcpaint, readonly unsignedlong color, readonly boolean border, readonly unsignedlong bordercolor);return FillRoundRect( hdc, rcPaint.left,rcPaint.top,rcPaint.right,rcPaint.bottom,  color,  color,0,false,border,bordercolor,0) 
end function

public function boolean of_filltriangle (readonly unsignedlong hdc, readonly pointf pt1, readonly pointf pt2, readonly pointf pt3, readonly unsignedlong color, readonly boolean border, readonly unsignedlong bordercolor);return FillTriangle(hdc,pt1,pt2,pt3,color,color,0,false,border,bordercolor)
end function

public function boolean of_themefill (readonly unsignedlong hdc, readonly rectf rcpaint, readonly n_cst_base_theme theme, readonly unsignedlong state);return ThemeFill( hdc, rcPaint,  theme.of_GetColor(theme.CLR_BKGND,state),  theme.#BkgndOrientation,  theme.#BkgndStyle, state, false, theme.#BorderStyle,  theme.of_GetColor(theme.CLR_BORDER,state), theme.#RoundSize)
end function

public function boolean of_drawline (readonly unsignedlong hdc, readonly real x1, readonly real y1, readonly real x2, readonly real y2, readonly unsignedlong color, readonly boolean shadow, readonly real size);return DrawLine(hdc,x1,y1,x2,y2,color,Enums.LS_SOLID,shadow,size)
end function

public function boolean of_drawgradientline (readonly unsignedlong hdc, readonly real x1, readonly real y1, readonly real x2, readonly real y2, readonly unsignedlong color, readonly boolean shadow, readonly boolean repeat, readonly real size);return DrawGradientLine(hdc,x1,y1,x2,y2,0,color,Enums.LS_SOLID,shadow,repeat,size)
end function

public function boolean of_drawpolygon (readonly unsignedlong hdc, readonly pointf paintregion[], readonly unsignedlong color, readonly unsignedinteger style, readonly real size);return DrawPolygon( hdc, paintregion, UpperBound(paintregion) , color,  style,  size)
end function

public function boolean of_drawrect (readonly unsignedlong hdc, readonly rectf rcpaint, readonly unsignedlong color, readonly unsignedinteger style, readonly real size);return DrawRect( hdc, rcPaint.left,rcPaint.top,rcPaint.right,rcPaint.bottom,  color,  style,  size) 
end function

on painter.create
call super::create
TriggerEvent( this, "constructor" )
end on

on painter.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

