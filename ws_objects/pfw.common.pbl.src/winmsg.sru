$PBExportHeader$winmsg.sru
$PBExportComments$PowerBuilder Extension~r~nBy gaoqiangz@msn.com
forward
global type winmsg from nonvisualobject
end type
end forward

global type winmsg from nonvisualobject
end type
global winmsg winmsg

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

Public:
/*--- Windows messages ---*/
Constant Long WM_NULL                         				= 0 //0x0000
Constant Long WM_CREATE                       			= 1 //0x0001
Constant Long WM_DESTROY                      			= 2 //0x0002
Constant Long WM_MOVE                         				= 3 //0x0003
Constant Long WM_SIZE                         				= 5 //0x0005
Constant Long WM_ACTIVATE                     			= 6 //0x0006
Constant Long WM_SETFOCUS                     			= 7 //0x0007
Constant Long WM_KILLFOCUS                    			= 8 //0x0008
Constant Long WM_ENABLE                       				= 10 //0x000A
Constant Long WM_SETREDRAW                    			= 11 //0x000B
Constant Long WM_SETTEXT                      			= 12 //0x000C
Constant Long WM_GETTEXT                     	 		= 13 //0x000D
Constant Long WM_GETTEXTLENGTH                		= 14 //0x000E
Constant Long WM_PAINT                        				= 15 //0x000F
Constant Long WM_CLOSE                        				= 16 //0x0010
Constant Long WM_QUERYENDSESSION              		= 17 //0x0011
Constant Long WM_QUERYOPEN                    			= 19 //0x0013
Constant Long WM_ENDSESSION                  			= 22 //0x0016
Constant Long WM_QUIT                         				= 18 //0x0012
Constant Long WM_ERASEBKGND                   			= 20 //0x0014
Constant Long WM_SYSCOLORCHANGE               		= 21 //0x0015
Constant Long WM_SHOWWINDOW                   		= 24 //0x0018
Constant Long WM_WININICHANGE                 			= 26 //0x001A
Constant Long WM_SETTINGCHANGE                		= WM_WININICHANGE
Constant Long WM_DEVMODECHANGE                		= 27 //0x001B
Constant Long WM_ACTIVATEAPP                  			= 28 //0x001C
Constant Long WM_FONTCHANGE                   			= 29 //0x001D
Constant Long WM_TIMECHANGE                   			= 30 //0x001E
Constant Long WM_CANCELMODE                   			= 31 //0x001F
Constant Long WM_SETCURSOR                   	 		= 32 //0x0020
Constant Long WM_MOUSEACTIVATE                		= 33 //0x0021
Constant Long WM_CHILDACTIVATE                		= 34 //0x0022
Constant Long WM_QUEUESYNC                    			= 35 //0x0023
Constant Long WM_GETMINMAXINFO                		= 36 //0x0024
Constant Long WM_PAINTICON                    			= 38 //0x0026
Constant Long WM_ICONERASEBKGND               		= 39 //0x0027
Constant Long WM_NEXTDLGCTL                   			= 40 //0x0028
Constant Long WM_SPOOLERSTATUS                		= 42 //0x002A
Constant Long WM_DRAWITEM                     			= 43 //0x002B
Constant Long WM_MEASUREITEM                 	 		= 44 //0x002C
Constant Long WM_DELETEITEM                   			= 45 //0x002D
Constant Long WM_VKEYTOITEM                   			= 46 //0x002E
Constant Long WM_CHARTOITEM                   			= 47 //0x002F
Constant Long WM_SETFONT                      			= 48 //0x0030
Constant Long WM_GETFONT                      			= 49 //0x0031
Constant Long WM_SETHOTKEY                    			= 50 //0x0032
Constant Long WM_GETHOTKEY                    			= 51 //0x0033
Constant Long WM_QUERYDRAGICON                		= 55 //0x0037
Constant Long WM_COMPAREITEM                  		= 57 //0x0039
Constant Long WM_GETOBJECT                    			= 61 //0x003D
Constant Long WM_COMPACTING                   			= 65 //0x0041
Constant Long WM_COMMNOTIFY                   		= 68 //0x0044  /* no longer suported */
Constant Long WM_WINDOWPOSCHANGING            	= 70 //0x0046
Constant Long WM_WINDOWPOSCHANGED             	= 71 //0x0047
Constant Long WM_POWER                        			= 72 //0x0048
Constant Long WM_COPYDATA                     			= 74 //0x004A
Constant Long WM_CANCELJOURNAL                		= 75 //0x004B
Constant Long WM_NOTIFY                       				= 78 //0x004E
Constant Long WM_INPUTLANGCHANGEREQUEST      = 80 //0x0050
Constant Long WM_INPUTLANGCHANGE              		= 81 //0x0051
Constant Long WM_TCARD                        				= 82 //0x0052
Constant Long WM_HELP                         				= 83 //0x0053
Constant Long WM_USERCHANGED                  		= 84 //0x0054
Constant Long WM_NOTIFYFORMAT                 		= 85 //0x0055
Constant Long WM_CONTEXTMENU                  		= 123 //0x007B
Constant Long WM_STYLECHANGING                		= 124 //0x007C
Constant Long WM_STYLECHANGED                 		= 125 //0x007D
Constant Long WM_DISPLAYCHANGE                		= 126 //0x007E
Constant Long WM_GETICON                      			= 127 //0x007F
Constant Long WM_SETICON                      			= 128 //0x0080
Constant Long WM_NCCREATE                     			= 129 //0x0081
Constant Long WM_NCDESTROY                    			= 130 //0x0082
Constant Long WM_NCCALCSIZE                  	 		= 131 //0x0083
Constant Long WM_NCHITTEST                    			= 132 //0x0084
Constant Long WM_NCPAINT                      			= 133 //0x0085
Constant Long WM_NCACTIVATE                   			= 134 //0x0086
Constant Long WM_GETDLGCODE                   			= 135 //0x0087
Constant Long WM_SYNCPAINT                    			= 136 //0x0088
Constant Long WM_NCMOUSEMOVE                  		= 160 //0x00A0
Constant Long WM_NCLBUTTONDOWN                		= 161 //0x00A1
Constant Long WM_NCLBUTTONUP                  		= 162 //0x00A2
Constant Long WM_NCLBUTTONDBLCLK              		= 163 //0x00A3
Constant Long WM_NCRBUTTONDOWN                		= 164 //0x00A4
Constant Long WM_NCRBUTTONUP                  		= 165 //0x00A5
Constant Long WM_NCRBUTTONDBLCLK              		= 166 //0x00A6
Constant Long WM_NCMBUTTONDOWN                	= 167 //0x00A7
Constant Long WM_NCMBUTTONUP                  		= 168 //0x00A8
Constant Long WM_NCMBUTTONDBLCLK              		= 169 //0x00A9
Constant Long WM_NCXBUTTONDOWN                		= 171 //0x00AB
Constant Long WM_NCXBUTTONUP                  		= 172 //0x00AC
Constant Long WM_NCXBUTTONDBLCLK              		= 173 //0x00AD
Constant Long WM_NCUAHDRAWCAPTION 				= 174 //0x00AE
Constant Long WM_NCUAHDRAWFRAME 				= 175 //0x00AF
Constant Long WM_INPUT                        				= 255 //0x00FF
Constant Long WM_KEYFIRST                     			= 256 //0x0100
Constant Long WM_KEYDOWN                      			= 256 //0x0100
Constant Long WM_KEYUP                        				= 257 //0x0101
Constant Long WM_CHAR                         				= 258 //0x0102
Constant Long WM_DEADCHAR                     			= 259 //0x0103
Constant Long WM_SYSKEYDOWN                   		= 260 //0x0104
Constant Long WM_SYSKEYUP                     			= 261 //0x0105
Constant Long WM_SYSCHAR                      			= 262 //0x0106
Constant Long WM_SYSDEADCHAR                  		= 263 //0x0107
Constant Long WM_UNICHAR                      			= 265 //0x0109
Constant Long WM_KEYLAST                      			= 265 //0x0109
Constant Long UNICODE_NOCHAR                  			= 65535 //0xFFFF
//CONSTANT long WM_KEYLAST                      		= 264//0x0108
Constant Long WM_IME_STARTCOMPOSITION         	= 269 //0x010D
Constant Long WM_IME_ENDCOMPOSITION           	= 270 //0x010E
Constant Long WM_IME_COMPOSITION              		= 271 //0x010F
Constant Long WM_IME_KEYLAST                  			= 271 //0x010F
Constant Long WM_INITDIALOG                   			= 272 //0x0110
Constant Long WM_COMMAND                      			= 273 //0x0111
Constant Long WM_SYSCOMMAND                   		= 274 //0x0112
Constant Long WM_TIMER                        				= 275 //0x0113
Constant Long WM_HSCROLL                      			= 276 //0x0114
Constant Long WM_VSCROLL                      			= 277 //0x0115
Constant Long WM_INITMENU                     			= 278 //0x0116
Constant Long WM_INITMENUPOPUP                		= 279 //0x0117
Constant Long WM_MENUSELECT                   			= 287 //0x011F
Constant Long WM_MENUCHAR                     			= 288 //0x0120
Constant Long WM_ENTERIDLE                    			= 289 //0x0121
Constant Long WM_MENURBUTTONUP                		= 290 //0x0122
Constant Long WM_MENUDRAG                     			= 291 //0x0123
Constant Long WM_MENUGETOBJECT                		= 292 //0x0124
Constant Long WM_UNINITMENUPOPUP              		= 293 //0x0125
Constant Long WM_MENUCOMMAND                  		= 294 //0x0126
Constant Long WM_CHANGEUISTATE                		= 295 //0x0127
Constant Long WM_UPDATEUISTATE                		= 296 //0x0128
Constant Long WM_QUERYUISTATE                 		= 297 //0x0129
Constant Long WM_CTLCOLORMSGBOX               		= 306 //0x0132
Constant Long WM_CTLCOLOREDIT                 		= 307 //0x0133
Constant Long WM_CTLCOLORLISTBOX              		= 308 //0x0134
Constant Long WM_CTLCOLORBTN                  		= 309 //0x0135
Constant Long WM_CTLCOLORDLG                  		= 310 //0x0136
Constant Long WM_CTLCOLORSCROLLBAR            	= 311 //0x0137
Constant Long WM_CTLCOLORSTATIC               		= 312 //0x0138
Constant Long MN_GETHMENU                     			= 481 //0x01E1
Constant Long WM_MOUSEFIRST                   			= 512 //0x0200
Constant Long WM_MOUSEMOVE                    		= 512 //0x0200
Constant Long WM_LBUTTONDOWN                  		= 513 //0x0201
Constant Long WM_LBUTTONUP                    			= 514 //0x0202
Constant Long WM_LBUTTONDBLCLK                		= 515 //0x0203
Constant Long WM_RBUTTONDOWN                  		= 516 //0x0204
Constant Long WM_RBUTTONUP                    			= 517 //0x0205
Constant Long WM_RBUTTONDBLCLK                		= 518 //0x0206
Constant Long WM_MBUTTONDOWN                  		= 519 //0x0207
Constant Long WM_MBUTTONUP                    			= 520 //0x0208
Constant Long WM_MBUTTONDBLCLK                		= 521 //0x0209
Constant Long WM_MOUSEWHEEL                   		= 522 //0x020A
Constant Long WM_MOUSEHWHEEL                   		= 526 //0x020E
Constant Long WM_XBUTTONDOWN                  		= 523 //0x020B
Constant Long WM_XBUTTONUP                    			= 524 //0x020C
Constant Long WM_XBUTTONDBLCLK                		= 525 //0x020D
Constant Long WM_MOUSELAST                    			= 522 //0x020A
Constant Long WM_PARENTNOTIFY                 		= 528 //0x0210
Constant Long WM_ENTERMENULOOP                		= 529 //0x0211
Constant Long WM_EXITMENULOOP                 		= 530 //0x0212
Constant Long WM_NEXTMENU                     			= 531 //0x0213
Constant Long WM_SIZING                       				= 532 //0x0214
Constant Long WM_CAPTURECHANGED               		= 533 //0x0215
Constant Long WM_MOVING                       			= 534 //0x0216
Constant Long WM_POWERBROADCAST               	= 536 //0x0218
Constant Long WM_DEVICECHANGE                 		= 537 //0x0219
Constant Long WM_MDICREATE                    			= 544 //0x0220
Constant Long WM_MDIDESTROY                  	 		= 545 //0x0221
Constant Long WM_MDIACTIVATE                  			= 546 //0x0222
Constant Long WM_MDIRESTORE                   			= 547 //0x0223
Constant Long WM_MDINEXT                      			= 548 //0x0224
Constant Long WM_MDIMAXIMIZE                  			= 549 //0x0225
Constant Long WM_MDITILE                      				= 550 //0x0226
Constant Long WM_MDICASCADE                   			= 551 //0x0227
Constant Long WM_MDIICONARRANGE              	 	= 552 //0x0228
Constant Long WM_MDIGETACTIVE                 		= 553 //0x0229
Constant Long WM_MDISETMENU                   			= 560 //0x0230
Constant Long WM_ENTERSIZEMOVE                		= 561 //0x0231
Constant Long WM_EXITSIZEMOVE                 			= 562 //0x0232
Constant Long WM_DROPFILES                    			= 563 //0x0233
Constant Long WM_MDIREFRESHMENU               		= 564 //0x0234
Constant Long WM_IME_SETCONTEXT               		= 641 //0x0281
Constant Long WM_IME_NOTIFY                   			= 642 //0x0282
Constant Long WM_IME_CONTROL                  		= 643 //0x0283
Constant Long WM_IME_COMPOSITIONFULL          	= 644 //0x0284
Constant Long WM_IME_SELECT                   			= 645 //0x0285
Constant Long WM_IME_CHAR                     			= 646 //0x0286
Constant Long WM_IME_REQUEST                  			= 648 //0x0288
Constant Long WM_IME_KEYDOWN                  		= 656 //0x0290
Constant Long WM_IME_KEYUP                    			= 657 //0x0291
Constant Long WM_MOUSEHOVER                   		= 673 //0x02A1
Constant Long WM_MOUSELEAVE                   			= 675 //0x02A3
Constant Long WM_NCMOUSEHOVER                 		= 672 //0x02A0
Constant Long WM_NCMOUSELEAVE                 		= 674 //0x02A2
Constant Long WM_WTSSESSION_CHANGE            	= 689 //0x02B1
Constant Long WM_TABLET_FIRST                 			= 704 //0x02c0
Constant Long WM_TABLET_LAST                  			= 735 //0x02df
Constant Long WM_CUT                          				= 768 //0x0300
Constant Long WM_COPY                         				= 769 //0x0301
Constant Long WM_PASTE                        				= 770 //0x0302
Constant Long WM_CLEAR                        				= 771 //0x0303
Constant Long WM_UNDO                         				= 772 //0x0304
Constant Long WM_RENDERFORMAT                 		= 773 //0x0305
Constant Long WM_RENDERALLFORMATS             	= 774 //0x0306
Constant Long WM_DESTROYCLIPBOARD             		= 775 //0x0307
Constant Long WM_DRAWCLIPBOARD                		= 776 //0x0308
Constant Long WM_PAINTCLIPBOARD               		= 777 //0x0309
Constant Long WM_VSCROLLCLIPBOARD             		= 778 //0x030A
Constant Long WM_SIZECLIPBOARD                			= 779 //0x030B
Constant Long WM_ASKCBFORMATNAME              	= 780 //0x030C
Constant Long WM_CHANGECBCHAIN                		= 781 //0x030D
Constant Long WM_HSCROLLCLIPBOARD             		= 782 //0x030E
Constant Long WM_QUERYNEWPALETTE              		= 783 //0x030F
Constant Long WM_PALETTEISCHANGING            		= 784 //0x0310
Constant Long WM_PALETTECHANGED               		= 785 //0x0311
Constant Long WM_HOTKEY                       			= 786 //0x0312
Constant Long WM_PRINT                        				= 791 //0x0317
Constant Long WM_PRINTCLIENT                 			= 792 //0x0318
Constant Long WM_APPCOMMAND                   		= 793 //0x0319
Constant Long WM_THEMECHANGED                 		= 794 //0x031A
Constant Long WM_HANDHELDFIRST                		= 856 //0x0358
Constant Long WM_HANDHELDLAST                 		= 863 //0x035F
Constant Long WM_AFXFIRST                    	 		= 864 //0x0360
Constant Long WM_AFXLAST                      			= 895 //0x037F
Constant Long WM_PENWINFIRST                  			= 896 //0x0380
Constant Long WM_PENWINLAST                 			= 911 //0x038F
Constant Long WM_APP                         				= 32768 //0x8000
Constant Long WM_USER									= 1024	//0x0400
/*--- Windows message params ---*/
//Key flags
Constant Long MK_LBUTTON=1
Constant Long MK_RBUTTON=2
Constant Long MK_SHIFT=4
Constant Long MK_CONTROL=8
Constant Long MK_MBUTTON=16
Constant Long MK_XBUTTON1=32
Constant Long MK_XBUTTON2=64
//HitTest Constatnt
Constant Long HTERROR = -2
Constant Long HTTRANSPARENT = -1
Constant Long HTNOWHERE = 0
Constant Long HTCLIENT = 1
Constant Long HTCAPTION = 2
Constant Long HTSYSMENU = 3
Constant Long HTGROWBOX = 4
Constant Long HTSIZE = HTGROWBOX
Constant Long HTMENU = 5
Constant Long HTHSCROLL = 6
Constant Long HTVSCROLL = 7
Constant Long HTMINBUTTON = 8
Constant Long HTMAXBUTTON = 9
Constant Long HTLEFT = 10
Constant Long HTRIGHT = 11
Constant Long HTTOP = 12
Constant Long HTTOPLEFT = 13
Constant Long HTTOPRIGHT = 14
Constant Long HTBOTTOM = 15
Constant Long HTBOTTOMLEFT = 16
Constant Long HTBOTTOMRIGHT = 17
Constant Long HTBORDER = 18
Constant Long HTREDUCE = HTMINBUTTON
Constant Long HTZOOM = HTMAXBUTTON
Constant Long HTSIZEFIRST = HTLEFT
Constant Long HTSIZELAST = HTBOTTOMRIGHT
Constant Long HTOBJECT = 19
Constant Long HTCLOSE = 20
Constant Long HTHELP = 21
//WM_SIZE size types
Constant Long SIZE_RESTORED = 0
Constant Long SIZE_MINIMIZED = 1
Constant Long SIZE_MAXIMIZED = 2
Constant Long SIZE_MAXSHOW = 3
Constant Long SIZE_MAXHIDE = 4
//WM_SYSCOMMAND
Constant Long SC_SIZE=61440
Constant Long SC_MOVE=61456
Constant Long SC_MINIMIZE=61472
Constant Long SC_MAXIMIZE=61488
Constant Long SC_NEXTWINDOW=61504
Constant Long SC_PREVWINDOW=61520
Constant Long SC_CLOSE=61536
Constant Long SC_VSCROLL=61552
Constant Long SC_HSCROLL=61568
Constant Long SC_MOUSEMENU=61584
Constant Long SC_KEYMENU=61696
Constant Long SC_RESTORE=61728
Constant Long SC_TASKLIST=61744
Constant Long SC_HOTKEY=61776
Constant Long SC_DEFAULT=61792
Constant Long SC_MONITORPOWER=61808
Constant Long SC_CONTEXTHELP=61824
Constant Long SC_SEPARATOR=61455
Constant Long SC_ICON=SC_MINIMIZE
Constant Long SC_ZOOM=SC_MAXIMIZE
//WM_HSCROLL/WM_VSCROLL
Constant Long SB_LINEUP=0 
Constant Long SB_LINELEFT=0
Constant Long SB_LINEDOWN=1
Constant Long SB_LINERIGHT=1
Constant Long SB_PAGEUP=2
Constant Long SB_PAGELEFT=2
Constant Long SB_PAGEDOWN=3
Constant Long SB_PAGERIGHT=3
Constant Long SB_THUMBPOSITION=4
Constant Long SB_THUMBTRACK=5
Constant Long SB_TOP=6 
Constant Long SB_LEFT=6
Constant Long SB_BOTTOM=7
Constant Long SB_RIGHT=7
Constant Long SB_ENDSCROLL=8
//WM_MOUSEWHEEL/WM_MOUSEHWHEEL
Constant Long WHEEL_DELTA=120
/*--- PowerFramework messages ---*/
Constant Long WM_PUI_UPDATEFRAME 					= WM_USER + 20000		//wparam:没使用;lparam:没使用
Constant Long WM_PUI_UPDATEPARENTBKGND 		= WM_USER + 20001		//wparam:1立即刷新,0不刷新;lparam:没使用
Constant Long WM_PUI_GETSCROLLBARDRAWINFO	= WM_USER + 20002		//wparam:nBar;lparam:lpsbdi
Constant Long WM_PUI_UPDATESCROLLBARSIZE	= WM_USER + 20003		//wparam:nBar;lparam:没使用
Constant Long WM_PUI_CREATED 						= WM_USER + 21100		//wparam:没使用;lparam:没使用
Constant Long WM_PUI_PAGECLOSE 						= WM_USER + 74			//wparam:没使用;lparam:没使用
end variables

on winmsg.create
call super::create
TriggerEvent( this, "constructor" )
end on

on winmsg.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

