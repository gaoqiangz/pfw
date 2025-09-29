$PBExportHeader$win32.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type win32 from nonvisualobject
end type
end forward

shared variables

end variables

global type win32 from nonvisualobject
end type
global win32 win32

type prototypes
public:
//Window management
function boolean IsWindow(ulong hwnd) library "user32.dll"
function ulong GetDesktopWindow() library "user32.dll"
function ulong GetWindow(ulong hwnd,ulong wCmd) library "user32.dll"
function ulong GetAncestor(ulong uhwnd,ulong gaFlags) library "user32.dll"
function ulong GetParent (ulong lchild) library "user32.dll"
function long SetParent (ulong lchild,ulong lparent) library "user32.dll"
function boolean IsZoomed(ulong hwnd) library "user32.dll"
function boolean IsIconic(ulong hwnd) library "user32.dll"
function boolean IsWindowVisible(ulong hwnd) library "user32.dll"
function boolean IsWindowEnabled(ulong hwnd) library "user32.dll"
function ulong ShowWindow(ulong hwnd,ulong nCmdShow) library "user32.dll"
function boolean ShowWindowAsync(ulong hwnd,ulong nCmdShow) library "user32.dll"
function ulong GetActiveWindow() library "user32.dll"
function ulong SetActiveWindow(ulong hwnd) library "user32.dll"
function ulong GetForegroundWindow() library "user32.dll"
function ulong SetForegroundWindow(ulong hwnd) library "user32.dll"
function ulong BringWindowToTop(ulong hwnd) library "user32.dll"
subroutine SwitchToThisWindow(ulong hwnd,boolean fAltTab) library "user32.dll"
function boolean EnableWindow(ulong hwnd,boolean fenable) library "user32.dll"
function boolean SetWindowPos (long hwnd,long m,long nleft,long ntop,long nwidth,long nheight,long flags) library "user32.dll"
function ulong BeginDeferWindowPos(ulong nNumWindows) library "user32.dll"
function ulong DeferWindowPos(ulong hWinPosInfo,ulong hwnd,ulong hWndInsertAfter,ulong X,ulong Y,ulong cx,ulong cy,ulong wFlags) library "user32.dll"
function ulong EndDeferWindowPos(ulong hWinPosInfo) library "user32.dll"
function ulong FindWindow(String lpClassName,String lpWindowName) library "user32.dll" alias for "FindWindowW"
function ulong FindWindowEx(ulong hWnd1,ulong hWnd2,String lpClassName,String lpWindowName) library "user32.dll" alias for "FindWindowExW"
function boolean RedrawWindow(ulong hwnd,ref RECT lprcUpdate,ulong hrgnUpdate,ulong fuRedraw) library "user32.dll"
function boolean RedrawWindow(ulong hwnd,ulong lprcUpdate,ulong hrgnUpdate,ulong fuRedraw) library "user32.dll"
function ulong GetCapture() library "user32.dll"
function ulong SetCapture (ulong hwnd) library "user32.dll"
function boolean ReleaseCapture () library "user32.dll"
function boolean TrackMouseEvent (ref TRACKMOUSEEVENT lptrackmouseevent) library "user32.dll"
function ulong FlashWindow(ulong hwnd,boolean bInvert) library "user32.dll"
function boolean EndMenu() library "user32.dll"
function ulong GetProp(ulong hwnd,String lpstring) library "user32.dll" alias for "GetPropW"
function boolean SetProp(ulong hwnd,String lpstring,ulong hData) library "user32.dll" alias for "SetPropW"
function boolean RemoveProp(ulong hwnd,String lpstring) library "user32.dll" alias for "RemovePropW"
function long GetWindowLong(ulong hWnd,long nlndex) library "user32.dll" alias for "GetWindowLongA"
//System
function int GetSystemMetrics (ulong nIndex) library "user32.dll"
function boolean SystemParametersInfo (UInt uiaction,UInt uiparam,ref Any pvparam,UInt fwinini) library "user32.dll" alias for "SystemParametersInfoW"
function boolean SystemParametersInfo (UInt uiaction,UInt uiparam,ref RECT pvparam,UInt fwinini) library "user32.dll" alias for "SystemParametersInfoW"
function boolean SystemParametersInfo (UInt uiaction,UInt uiparam,long pvparam,UInt fwinini) library "user32.dll" alias for "SystemParametersInfoW"
//Thread
function ulong CreateEvent(ulong lpEventAttributes,boolean bManualReset,boolean bInitialState,ulong lpName) library "kernel32.dll" alias for "CreateEventW"
function boolean SetEvent(ulong hEvent) library "kernel32.dll"
function boolean ResetEvent(ulong hEvent) library "kernel32.dll"
function ulong WaitForSingleObject(ulong hHandle,ulong dwMilliseconds) library "kernel32.dll"
function ulong SleepMs(ulong dwMilliseconds) library "kernel32.dll" alias for "Sleep"
function ulong CloseHandle(ulong hObject) library "kernel32.dll"
//Process
function ulong GetModuleFileName(ulong hModule,ref string lpFilename,ulong nSize) library "kernel32.dll" alias for "GetModuleFileNameW"
function boolean SetdllDirectory(String lpszPath) library "kernel32.dll" alias for "SetdllDirectoryW"
//Memory
function long GlobalAlloc (long flags,ulong bytes) library "kernel32.dll"
function long GlobalFree (long memhandle) library "kernel32.dll"
function long GlobalLock (long memhandle) library "kernel32.dll"
function long GlobalUnlock (long memhandle) library "kernel32.dll"
function long LocalAlloc (long flags,ulong bytes) library "kernel32.dll"
function long LocalFree (long memhandle) library "kernel32.dll"
function long lstrcpy (long destination,String Source) library "kernel32.dll" alias for "lstrcpyW"
function long MulDiv (long nnumber,long nnumerator,long ndenominator) library "kernel32.dll"
//GDI
function ulong SetBkColor(ulong hdc,ulong crColor) library "gdi32.dll"
function ulong CreateSolidBrush(ulong clrColor) library "gdi32.dll"
function boolean DeleteObject (ulong hgdiobject) library "gdi32.dll"
function ulong OffsetWindowOrgEx(ulong hdc,long nX,long nY,ref POINT lppoint) library "gdi32.dll"
function ulong OffsetWindowOrgEx(ulong hdc,long nX,long nY,ulong lppoint) library "gdi32.dll"
function ulong SetWindowOrgEx(ulong hdc,long nX,long nY,ref POINT lppoint) library "gdi32.dll"
function ulong SetWindowOrgEx(ulong hdc,long nX,long nY,ulong lppoint) library "gdi32.dll"
//Coordinate
function boolean GetWindowRect (ulong hwnd,ref RECT RECT) library "user32.dll" alias for "GetWindowRect"
function long GetClientRect (long hwnd,ref RECT lpRect) library "user32"
function boolean GetCursorPos (ref POINT lppoint) library "user32.dll"
function boolean ClientToScreen (ulong hwnd,ref POINT lppoint) library "user32.dll"
function boolean ScreenToClient (ulong hwnd,ref POINT lppoint) library "user32.dll"
function boolean PtInRegion (ulong hRgn,long X,long Y) library "gdi32.dll"
function boolean PtInRect(ref RECT lpRect,long X,long Y) library "user32.dll"
function boolean RectInRegion(ulong hRgn,ref RECT lpRect) library "gdi32.dll"
function boolean CopyRect(ref RECT lpDestRect,ref RECT lpSourceRect) library "user32.dll"
function boolean CopyRect(ref RECT lpDestRect,ulong lpSourceRect) library "user32.dll"
function boolean CopyRect(ulong lpDestRect,ref RECT lpSourceRect) library "user32.dll"
function boolean IsRectEmpty(ref RECT lpRect) library "user32.dll"
function boolean EqualRect(ref RECT lpRect1,ref RECT lpRect2) library "user32.dll"
function ulong InflateRect(ref RECT lpRect,long X,long Y) library "user32.dll"
function ulong OffsetRect(ref RECT lpRect,long X,long Y) library "user32.dll"
function ulong OffsetRgn(ulong hRgn,long X,long Y) library "gdi32.dll"
function ulong OffsetClipRgn(ulong hdc,long X,long Y) library "gdi32.dll"
function ulong SubtractRect(ref RECT lprcDst,ref RECT lprcSrc1,ref RECT lprcSrc2) library "user32.dll"
function ulong IntersectRect(ref RECT lpDestRect,ref RECT lpSrc1Rect,ref RECT lpSrc2Rect) library "user32.dll"
function ulong UnionRect(ref RECT lpDestRect,ref RECT lpSrc1Rect,ref RECT lpSrc2Rect) library "user32.dll"
function ulong SetRect(ref RECT lpRect,long x1,long y1,long x2,long y2) library "user32.dll"
function ulong SetRectEmpty(ref RECT lpRect) library "user32.dll"
//Misc
function ulong GetSysColor (ulong nIndex) library "user32.dll"
function ulong SetCursor(ulong hCursor) library "user32.dll"
function ulong SetCursorPos(ulong X,ulong Y) library "user32.dll"
function ulong LoadCursor(ulong hInstance,ref String lpCursorName) library "user32.dll" alias for "LoadCursorW"
function ulong LoadCursor(ulong hInstance,ulong lpCursorName) library "user32.dll" alias for "LoadCursorW"
function boolean SetProcessDPIAware() library "user32.dll"

/*--- PowerFramework ---*/
//Coordinate(dip)
function boolean GetCursorPos(ref POINTF lppoint) library "pfw.dll" alias for "pfwGetCursorPos"
function boolean GetWindowRect(ulong hwnd,ref RECTF lpRect) library "pfw.dll" alias for "pfwGetWindowRect"
function boolean GetClientRect(ulong hwnd,ref RECTF lpRect) library "pfw.dll" alias for "pfwGetClientRect"
function boolean GetScreenRect(ref RECTF lpRect) library "pfw.dll" alias for "pfwGetScreenRect"
function boolean GetScreenWorkArea(ref RECTF lpRect) library "pfw.dll" alias for "pfwGetScreenWorkArea"
function boolean ClientToScreen(ulong hWnd,ref POINTF lpPoint) library "pfw.dll" alias for "pfwClientToScreenPoint"
function boolean ClientToScreen(ulong hWnd,ref RECTF lpRect) library "pfw.dll" alias for "pfwClientToScreenRect"
function boolean ScreenToClient(ulong hWnd,ref POINTF lpPoint) library "pfw.dll" alias for "pfwScreenToClientPoint"
function boolean ScreenToClient(ulong hWnd,ref RECTF lpRect) library "pfw.dll" alias for "pfwScreenToClientRect"
//Rect(dip)
function boolean IsRectEmpty(readonly RECTF lprc) library "pfw.dll" alias for "pfwIsRectEmpty"
function boolean SetRectEmpty(ref RECTF lprc) library "pfw.dll" alias for "pfwSetRectEmpty"
function boolean EqualRect(readonly RECTF lprcDst,readonly RECTF lpcrcSrc) library "pfw.dll" alias for "pfwEqualRect"
function boolean CopyRect(ref RECTF lprcDst,readonly RECTF lpcrcSrc) library "pfw.dll" alias for "pfwCopyRect"
function boolean CopyRect(ref RECTF lprcDst,ulong lpcrcSrc) library "pfw.dll" alias for "pfwCopyRect"
function boolean CopyRect(ulong lprcDst,readonly RECTF lpcrcSrc) library "pfw.dll" alias for "pfwCopyRect"
function boolean OffsetRect(ref RECTF lprc,real dx,real dy) library "pfw.dll" alias for "pfwOffsetRect"
function boolean InflateRect(ref RECTF lprc,real dx,real dy) library "pfw.dll" alias for "pfwInflateRect"
function boolean PtInRect(readonly RECTF lprc,real x,real y) library "pfw.dll" alias for "pfwPtInRect"
//Convertion
function long GetDPIX() library "pfw.dll" alias for "pfwGetDPIX"
function long GetDPIY() library "pfw.dll" alias for "pfwGetDPIY"
function long PT2PXX(long pt) library "pfw.dll" alias for "pfwPT2PXX"
function long PT2PXY(long pt) library "pfw.dll" alias for "pfwPT2PXY"
function long PX2PTX(long px) library "pfw.dll" alias for "pfwPX2PTX"
function long PX2PTY(long px) library "pfw.dll" alias for "pfwPX2PTY"
function long MM2PXX(real mm) library "pfw.dll" alias for "pfwMM2PXX"
function long MM2PXY(real mm) library "pfw.dll" alias for "pfwMM2PXY"
function real PX2MMX(long px) library "pfw.dll" alias for "pfwPX2MMX"
function real PX2MMY(long px) library "pfw.dll" alias for "pfwPX2MMY"
//Misc
function ulong GetPBColor( ulong colorindex) library "pfw.dll" alias for "pfwGetPBColor"
function ulong GetPBColorA( ulong colorindex) library "pfw.dll" alias for "pfwGetPBColorA"
function ulong GetSolidBrushColor( ulong hBrush) library "pfw.dll" alias for "pfwGetSolidBrushColor"
function ulong GetSolidBrushColorA( ulong hBrush) library "pfw.dll" alias for "pfwGetSolidBrushColorA"
function boolean SetSysColor(long nIndex,ulong rgbColor) library "pfw.dll" alias for "pfwSetSysColor"
function boolean SetSysColors(long ncount,long nIndexes[],ulong rgbColors[]) library "pfw.dll" alias for "pfwSetSysColors"
function long SendMessageGetScrollBarDrawInfo(ulong hWnd,ulong uMsg,ulong wparam,ref SCROLLBARDRAWINFO lparam) library "user32.dll" alias for "SendMessageW"
Subroutine CopyScrollBarCreateInfo(ref SCROLLBARCREATEINFO lpsbci,ulong lpcsbci,ulong nLength) library "kernel32.dll" alias for "RtlMoveMemory"
Subroutine CopyScrollBarCreateInfo(ulong lpsbci,ref SCROLLBARCREATEINFO lpcsbci,ulong nLength) library "kernel32.dll" alias for "RtlMoveMemory"
Subroutine CopyScrollBarDrawInfo(ref SCROLLBARDRAWINFO lpsbdi,ulong lpcsbdi,ulong nLength) library "kernel32.dll" alias for "RtlMoveMemory"
//strDst需要调用前分配内存
//function boolean StrReplace(ref String strDst,String strSrc,String strRplSrc,String strRplDst,boolean bMatchCase) library "pfw.dll" alias for "pfwStrReplaceW"

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

//Constants
Public:
// System Metrics
Constant Long SM_CXSCREEN = 0
Constant Long SM_CYSCREEN = 1
Constant Long SM_CXVSCROLL = 2
Constant Long SM_CYHSCROLL = 3
Constant Long SM_CYCAPTION = 4
Constant Long SM_CXBORDER = 5
Constant Long SM_CYBORDER = 6
Constant Long SM_CXDLGFRAME = 7
Constant Long SM_CYDLGFRAME = 8
Constant Long SM_CYVTHUMB = 9
Constant Long SM_CXHTHUMB = 10
Constant Long SM_CXICON = 11
Constant Long SM_CYICON = 12
Constant Long SM_CXCURSOR = 13
Constant Long SM_CYCURSOR = 14
Constant Long SM_CYMENU = 15
Constant Long SM_CXFULLSCREEN = 16
Constant Long SM_CYFULLSCREEN = 17
Constant Long SM_CYKANJIWINDOW = 18
Constant Long SM_MOUSEPRESENT = 19
Constant Long SM_CYVSCROLL = 20
Constant Long SM_CXHSCROLL = 21
Constant Long SM_DEBUG = 22
Constant Long SM_SWAPBUTTON = 23
Constant Long SM_RESERVED1 = 24
Constant Long SM_RESERVED2 = 25
Constant Long SM_RESERVED3 = 26
Constant Long SM_RESERVED4 = 27
Constant Long SM_CXMIN = 28
Constant Long SM_CYMIN = 29
Constant Long SM_CXSIZE = 30
Constant Long SM_CYSIZE = 31
Constant Long SM_CXFRAME = 32
Constant Long SM_CYFRAME = 33
Constant Long SM_CXMINTRACK = 34
Constant Long SM_CYMINTRACK = 35
Constant Long SM_CXDOUBLECLK = 36
Constant Long SM_CYDOUBLECLK = 37
Constant Long SM_CXICONSPACING = 38
Constant Long SM_CYICONSPACING = 39
Constant Long SM_MENUDROPALIGNMENT = 40
Constant Long SM_PENWINDOWS = 41
Constant Long SM_DBCSENABLED = 42
Constant Long SM_CMOUSEBUTTONS = 43
Constant Long SM_CXFIXEDFRAME = SM_CXDLGFRAME /* ;win40 name change */
Constant Long SM_CYFIXEDFRAME = SM_CYDLGFRAME /* ;win40 name change */
Constant Long SM_CXSIZEFRAME = SM_CXFRAME /* ;win40 name change */
Constant Long SM_CYSIZEFRAME = SM_CYFRAME /* ;win40 name change */
Constant Long SM_SECURE = 44
Constant Long SM_CXEDGE = 45
Constant Long SM_CYEDGE = 46
Constant Long SM_CXMINSPACING = 47
Constant Long SM_CYMINSPACING = 48
Constant Long SM_CXSMICON = 49
Constant Long SM_CYSMICON = 50
Constant Long SM_CYSMCAPTION = 51
Constant Long SM_CXSMSIZE = 52
Constant Long SM_CYSMSIZE = 53
Constant Long SM_CXMENUSIZE = 54
Constant Long SM_CYMENUSIZE = 55
Constant Long SM_ARRANGE = 56
Constant Long SM_CXMINIMIZED = 57
Constant Long SM_CYMINIMIZED = 58
Constant Long SM_CXMAXTRACK = 59
Constant Long SM_CYMAXTRACK = 60
Constant Long SM_CXMAXIMIZED = 61
Constant Long SM_CYMAXIMIZED = 62
Constant Long SM_NETWORK = 63
Constant Long SM_CLEANBOOT = 67
Constant Long SM_CXDRAG = 68
Constant Long SM_CYDRAG = 69
Constant Long SM_SHOWSOUNDS = 70
Constant Long SM_CXMENUCHECK = 71   /* Use instead of GetMenuCheckMarkDimensions()! */
Constant Long SM_CYMENUCHECK = 72
Constant Long SM_SLOWMACHINE = 73
Constant Long SM_MIDEASTENABLED = 74
Constant Long SM_CMETRICS = 76
Constant Long SBS_SIZEGRIP = 16
//TrackMouseEvent
Constant Long TME_HOVER=1
Constant Long TME_LEAVE=2
Constant Long TME_NONCLIENT=16
Constant Long TME_QUERY=1073741824
Constant Long TME_CANCEL=2147483648 
// Color Constants
Constant Long CTLCOLOR_MSGBOX         					= 0
Constant Long CTLCOLOR_EDIT           						= 1
Constant Long CTLCOLOR_LISTBOX        					= 2
Constant Long CTLCOLOR_BTN            						= 3
Constant Long CTLCOLOR_DLG            						= 4
Constant Long CTLCOLOR_SCROLLBAR     					= 5
Constant Long CTLCOLOR_STATIC         					= 6
Constant Long CTLCOLOR_MAX            						= 7
Constant Long COLOR_SCROLLBAR         					= 0
Constant Long COLOR_BACKGROUND        					= 1
Constant Long COLOR_ACTIVECAPTION     					= 2
Constant Long COLOR_INACTIVECAPTION   					= 3
Constant Long COLOR_MENU             						= 4
Constant Long COLOR_WINDOW            						= 5
Constant Long COLOR_WINDOWFRAME       				= 6
Constant Long COLOR_MENUTEXT          					= 7
Constant Long COLOR_WINDOWTEXT        					= 8
Constant Long COLOR_CAPTIONTEXT       					= 9
Constant Long COLOR_ACTIVEBORDER      					= 10
Constant Long COLOR_INACTIVEBORDER    					= 11
Constant Long COLOR_APPWORKSPACE      				= 12
Constant Long COLOR_HIGHLIGHT         						= 13
Constant Long COLOR_HIGHLIGHTTEXT    					= 14
Constant Long COLOR_BTNFACE           						= 15
Constant Long COLOR_BTNSHADOW        					= 16
Constant Long COLOR_GRAYTEXT          					= 17
Constant Long COLOR_BTNTEXT           						= 18
Constant Long COLOR_INACTIVECAPTIONTEXT 			= 19
Constant Long COLOR_BTNHIGHLIGHT    						= 20
Constant Long COLOR_INFOTEXT          						= 23
Constant Long COLOR_INFOBK            						= 24
Constant Long COLOR_HOTLIGHT          						= 26
Constant Long COLOR_GRADIENTACTIVECAPTION 		= 27
Constant Long COLOR_GRADIENTINACTIVECAPTION 		= 28
Constant Long COLOR_MENUHILIGHT    						= 29
Constant Long COLOR_MENUBAR         						= 30
Constant Long COLOR_DESKTOP         					  	= COLOR_BACKGROUND
Constant Long COLOR_3DFACE            						= COLOR_BTNFACE
Constant Long COLOR_3DSHADOW      	  					= COLOR_BTNSHADOW
Constant Long COLOR_3DHIGHLIGHT    	  					= COLOR_BTNHIGHLIGHT
Constant Long COLOR_3DHILIGHT         						= COLOR_BTNHIGHLIGHT
Constant Long COLOR_BTNHILIGHT        						= COLOR_BTNHIGHLIGHT
Constant Long COLOR_PBTRANSPARENT						= 553648127
//GetWindow
Constant ULong GW_HWNDFIRST = 0
Constant ULong GW_HWNDLAST = 1
Constant ULong GW_HWNDNEXT = 2
Constant ULong GW_HWNDPREV = 3
Constant ULong GW_OWNER = 4
Constant ULong GW_CHILD = 5
//GetAncestor
Constant ULong GA_PARENT = 1
Constant ULong GA_ROOT = 2
Constant ULong GA_ROOTOWNER = 3
//SetWindowPos flags
Constant Long HWND_BROADCAST = 65535
Constant Long HWND_MESSAGE = -3
Constant Long HWND_DESKTOP = 0
Constant Long HWND_TOP = 0
Constant Long HWND_BOTTOM = 1
Constant Long HWND_TOPMOST = -1
Constant Long HWND_NOTOPMOST = -2
Constant Long SWP_NOSIZE = 1
Constant Long SWP_NOMOVE = 2
Constant Long SWP_NOZORDER = 4
Constant Long SWP_NOREDRAW = 8
Constant Long SWP_NOACTIVATE = 16
Constant Long SWP_FRAMECHANGED = 32
Constant Long SWP_SHOWWINDOW = 64
Constant Long SWP_HIDEWINDOW = 128
Constant Long SWP_NOCOPYBITS = 256
Constant Long SWP_NOOWNERZORDER = 512
Constant Long SWP_NOSENDCHANGING = 1024
Constant Long SWP_DRAWFRAME = SWP_FRAMECHANGED
Constant Long SWP_NOREPOSITION = SWP_NOOWNERZORDER
Constant Long SWP_DEFERERASE = 8192
Constant Long SWP_ASYNCWINDOWPOS = 16384
// Tooltip flags
Constant Long TTF_IDISHWND		 = 1
Constant Long TTF_CENTERTIP 		 = 2
Constant Long TTF_RTLREADING	 = 4
Constant Long TTF_SUBCLASS		 = 16
Constant Long TTF_TRACK		 = 32
Constant Long TTF_ABSOLUTE		 = 128
Constant Long TTF_TRANSPARENT	 = 256
Constant Long TTF_DI_SETITEM		 = 32768
// Tooltip Styles
Constant Long TTS_BALLOON = 64
Constant Long TTS_NOPREFIX = 2
Constant Long TTS_ALWAYSTIP = 1
//ToolTip icon
Constant Long TTI_NONE = 0
Constant Long TTI_INFO = 1
Constant Long TTI_WARNING = 2
Constant Long TTI_ERROR = 3
//ToolTip SetDelayTime
Constant Long TTDT_AUTOMATIC	=0
Constant Long TTDT_RESHOW		=1
Constant Long TTDT_AUTOPOP	=2
Constant Long TTDT_INITIAL		=3
//Show Window
Constant Long SW_HIDE             = 0
Constant Long SW_SHOWNORMAL       = 1
Constant Long SW_NORMAL           = 1
Constant Long SW_SHOWMINIMIZED    = 2
Constant Long SW_SHOWMAXIMIZED    = 3
Constant Long SW_MAXIMIZE         = 3
Constant Long SW_SHOWNOACTIVATE   = 4
Constant Long SW_SHOW             = 5
Constant Long SW_MINIMIZE         = 6
Constant Long SW_SHOWMINNOACTIVE  = 7
Constant Long SW_SHOWNA           = 8
Constant Long SW_RESTORE          = 9
Constant Long SW_SHOWDEFAULT      = 10
Constant Long SW_FORCEMINIMIZE    = 11
Constant Long SW_MAX              = 11
//TrackPopupMenu
Constant Long TPM_LEFTBUTTON  = 0
Constant Long TPM_RIGHTBUTTON = 2
Constant Long TPM_LEFTALIGN   = 0
Constant Long TPM_CENTERALIGN = 4
Constant Long TPM_RIGHTALIGN  = 8
Constant Long TPM_TOPALIGN        = 0
Constant Long TPM_VCENTERALIGN    = 16
Constant Long TPM_BOTTOMALIGN     = 32
Constant Long TPM_HORIZONTAL      = 0     /* Horz alignment matters more */
Constant Long TPM_VERTICAL        = 64     /* Vert alignment matters more */
Constant Long TPM_NONOTIFY        = 128     /* Don't send any notification msgs */
Constant Long TPM_RETURNCMD       = 256
Constant Long TPM_RECURSE         = 1
Constant Long TPM_HORPOSANIMATION = 1024
Constant Long TPM_HORNEGANIMATION = 2048
Constant Long TPM_VERPOSANIMATION = 4096
Constant Long TPM_VERNEGANIMATION = 8192
Constant Long TPM_LAYOUTRTL = 32768
Constant Long TPM_WORKAREA = 65536
//RedrawWindow
Constant Long RDW_INVALIDATE=1
Constant Long RDW_INTERNALPAINT=2
Constant Long RDW_ERASE=4
Constant Long RDW_VALIDATE=8
Constant Long RDW_NOINTERNALPAINT=16
Constant Long RDW_NOERASE=32
Constant Long RDW_NOCHILDREN=64
Constant Long RDW_ALLCHILDREN=128
Constant Long RDW_UPDATENOW=256
Constant Long RDW_ERASENOW=512
Constant Long RDW_FRAME=1024
Constant Long RDW_NOFRAME=2048
//LoadCursor
Constant Long IDC_ARROW 			= 32512 	//IDC_ARROW=MAKEINTRESOURCE(32512)
Constant Long IDC_IBEAM			= 32513 	//IDC_IBEAM=MAKEINTRESOURCE(32513)
Constant Long IDC_WAIT			= 32514	//IDC_WAIT=MAKEINTRESOURCE(32514) 
Constant Long IDC_CROSS			= 32515	//IDC_CROSS=MAKEINTRESOURCE(32515)
Constant Long IDC_UPARROW		= 32516	//IDC_UPARROW=MAKEINTRESOURCE(32516)
Constant Long IDC_SIZE				= 32640	//IDC_SIZE=MAKEINTRESOURCE(32640)
Constant Long IDC_ICON				= 32641	//IDC_ICON=MAKEINTRESOURCE(32641)
Constant Long IDC_SIZENWSE		= 32642	//IDC_SIZENWSE=MAKEINTRESOURCE(32642)
Constant Long IDC_SIZENESW		= 32643	//IDC_SIZENESW=MAKEINTRESOURCE(32643)
Constant Long IDC_SIZEWE			= 32644	//IDC_SIZEWE=MAKEINTRESOURCE(32644)
Constant Long IDC_SIZENS			= 32645	//IDC_SIZENS=MAKEINTRESOURCE(32645)
Constant Long IDC_SIZEALL			= 32646	//IDC_SIZEALL=MAKEINTRESOURCE(32646)
Constant Long IDC_NO 				= 32648	//IDC_NO=MAKEINTRESOURCE(32648)
Constant Long IDC_HAND			= 32649	//IDC_HAND=MAKEINTRESOURCE(32649)
Constant Long IDC_APPSTARTING	= 32650	//IDC_APPSTARTING=MAKEINTRESOURCE(32650)
Constant Long IDC_HELP				= 32651	//IDC_HELP=MAKEINTRESOURCE(32651) 
//GetWindowLong
Constant Long GWL_STYLE 		= -16 
Constant Long GWL_EXSTYLE	= -20 
//ScrollBar
Constant Long SIZEOF_SCROLLBARCREATEINFO 	= 28
Constant Long SIZEOF_SCROLLBARDRAWINFO 	= 104
Constant Long SB_HORZ 	= 0
Constant Long SB_VERT 	= 1
Constant Long SB_CTL 	= 2
Constant Long SB_BOTH 	= 3
//Draw ScrollBar
Constant Long DSF_ARROWUP		= 1
Constant Long DSF_ARROWLEFT	= 1
Constant Long DSF_ARROWDOWN	= 2
Constant Long DSF_ARROWRIGHT	= 2
Constant Long DSF_THUMB			= 4
Constant Long DSF_ALL				= 7 //DSF_ARROWUP | DSF_ARROWDOWN | DSF_THUMB
//Windows version
Constant Long WINELSE 		=	0
Constant Long WINNT 		= 	1
Constant Long WIN31 		=	2
Constant Long WIN95 		= 	3
Constant Long WIN98 		=	4
Constant Long WINME 		=	5
Constant Long WIN2000 		= 	100
Constant Long WINXP			=	101
Constant Long WINVISTA	=	200
Constant Long WIN7			= 	201
Constant Long WIN8			= 	202
Constant Long WIN8_1			= 	203
Constant Long WIN10			= 	204
Constant Long WINLATEST		= 	1000
end variables
forward prototypes
public function boolean iswinxp ()
public function boolean iswin2000 ()
public function boolean iswinxplater ()
public function boolean iswinvista ()
public function boolean iswin7 ()
public function boolean iswin8 ()
public function boolean iswinxpbefore ()
public function boolean getscreenrect (ref rect screct)
public function boolean setwindowpos (readonly unsignedlong hwnd, readonly integer x, readonly integer y, readonly integer width, readonly integer height)
public function boolean setredraw (readonly unsignedlong hwnd, readonly boolean bredraw)
public function boolean setwindowtopmost (unsignedlong hwnd, boolean topmost)
public function boolean isshowintaskbar (readonly unsignedlong hwnd)
public function boolean getscreenworkarea (ref rect screct)
public function boolean getscrollbardrawinfo (readonly unsignedlong hwnd, readonly long nbar, ref scrollbardrawinfo sbdi)
public function boolean updateparentbkgnd (readonly unsignedlong hwnd, readonly boolean bredraw)
public function string getcurrentmodulefilename ()
public function string getcurrentmoduledirectory ()
public subroutine clienttoscreen (readonly unsignedlong hwnd, ref rect rc)
public function boolean isparentwindow (unsignedlong hwnd, readonly unsignedlong hparent)
public function long getosversion ()
public function boolean iswin10 ()
end prototypes

public function boolean iswinxp ();return (GetOSVersion() = WINXP)
end function

public function boolean iswin2000 ();return (GetOSVersion() = WIN2000)
end function

public function boolean iswinxplater ();return (GetOSVersion() >= WINVISTA)
end function

public function boolean iswinvista ();return (GetOSVersion() = WINVISTA)
end function

public function boolean iswin7 ();return (GetOSVersion() = WIN7)
end function

public function boolean iswin8 ();long nVer

nVer = GetOSVersion()
return (nVer = WIN8 or nVer = WIN8_1)
end function

public function boolean iswinxpbefore ();long nVer

nVer = GetOSVersion()
return (nVer <> WINELSE and nVer < WINXP)
end function

public function boolean getscreenrect (ref rect screct);ulong hSCWnd

hSCWnd = GetDesktopWindow()

return GetWindowRect(hSCWnd,ref scRect)
end function

public function boolean setwindowpos (readonly unsignedlong hwnd, readonly integer x, readonly integer y, readonly integer width, readonly integer height);return SetWindowPos(hwnd,0,x,y,width,height,SWP_NOZORDER + SWP_NOACTIVATE)
end function

public function boolean setredraw (readonly unsignedlong hwnd, readonly boolean bredraw);if hWnd = 0 then return false

if bRedraw then
	Send(hWnd,WinMSG.WM_SETREDRAW,1,0)
	RedrawWindow(hWnd,0,0,RDW_INVALIDATE + RDW_ERASE + RDW_FRAME + RDW_ALLCHILDREN)
else
	Send(hWnd,WinMSG.WM_SETREDRAW,0,0)
end if

return true
end function

public function boolean setwindowtopmost (unsignedlong hwnd, boolean topmost);return SetWindowPos(hWnd,iif(topmost,HWND_TOPMOST,HWND_NOTOPMOST),0,0,0,0,SWP_NOSIZE + SWP_NOMOVE + SWP_NOACTIVATE)
end function

public function boolean isshowintaskbar (readonly unsignedlong hwnd);return (GetParent(hWnd) = 0 and GetWindow(hWnd,GW_OWNER) = 0)
end function

public function boolean getscreenworkarea (ref rect screct);Constant Uint SPI_GETWORKAREA = 48

return SystemParametersInfo(SPI_GETWORKAREA,0,ref scRect,0)
end function

public function boolean getscrollbardrawinfo (readonly unsignedlong hwnd, readonly long nbar, ref scrollbardrawinfo sbdi);return (SendMessageGetScrollBarDrawInfo(hWnd,WinMSG.WM_PUI_GETSCROLLBARDRAWINFO,nBar,ref sbdi) <> 0)
end function

public function boolean updateparentbkgnd (readonly unsignedlong hwnd, readonly boolean bredraw);if hWnd = 0 then return false

if bRedraw then
	Send(hWnd,WinMsg.WM_PUI_UPDATEPARENTBKGND,1,0)
else
	Send(hWnd,WinMsg.WM_PUI_UPDATEPARENTBKGND,0,0)
end if

return true
end function

public function string getcurrentmodulefilename ();string sFileName
ulong hMod

hMod = Handle(GetApplication())
if hMod = 0 then return ""

sFileName = Space(256)
if GetModuleFileName(hMod,ref sFileName,256) <= 0 then return ""

return sFileName
end function

public function string getcurrentmoduledirectory ();string sFileName

sFileName = GetCurrentModuleFileName()
if sFileName = "" then return GetCurrentDirectory()

return Left(sFileName,LastPos(sFileName,"\") - 1)
end function

public subroutine clienttoscreen (readonly unsignedlong hwnd, ref rect rc);POINT pt

pt.x = rc.left
pt.y = rc.top
ClientToScreen(hwnd,ref pt)
rc.left = pt.x
rc.top = pt.y

pt.x = rc.right
pt.y = rc.bottom
ClientToScreen(hwnd,ref pt)
rc.right = pt.x
rc.bottom = pt.y
end subroutine

public function boolean isparentwindow (unsignedlong hwnd, readonly unsignedlong hparent);if hWnd = 0 or hParent = 0 then return false

do while hWnd > 0
	hWnd = GetParent(hWnd)
	if hWnd = hParent then return true
loop

return false
end function

public function long getosversion ();long nVer
Environment env

GetEnvironment(env)

if env.OSType = WindowsNT! then
	choose case env.OSMajorRevision
		case 5
			choose case env.OSMinorRevision
				case 0
					nVer = WIN2000
				case 1
					nVer = WINXP
				case else
					nVer = WIN2000 + env.OSMinorRevision
			end choose
		case 6
			choose case env.OSMinorRevision
				case 0
					nVer = WINVISTA
				case 1
					nVer = WIN7
				case 2
					nVer = WIN8
				case 3
					nVer = WIN8_1
				case 4
					nVer = WIN10
				case else
					nVer = WINVISTA + env.OSMinorRevision
			end choose
		case 10
			nVer = WIN10
		case else
			nVer = WINLATEST + env.OSMajorRevision
	end choose
else
	choose case env.OSMinorRevision
		case 0,3
			nVer = WIN95
		case 1
			nVer = WIN31
		case 10
			nVer = WIN98
		case 90
			nVer = WINME
	end choose
end if

return nVer
end function

public function boolean iswin10 ();return (GetOSVersion() = WIN10)
end function

on win32.create
call super::create
TriggerEvent( this, "constructor" )
end on

on win32.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

