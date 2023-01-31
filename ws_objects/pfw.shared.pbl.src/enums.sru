$PBExportHeader$enums.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type enums from nonvisualobject
end type
end forward

global type enums from nonvisualobject
end type
global enums enums

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

/*--- PowerFramework enums ---*/
Public:

//Initialize flags (pfwInitialize:[flags])
Constant Long INIT_FLAG_ENABLE_UI			= 1
Constant Long INIT_FLAG_ENABLE_SCITER		= 2
Constant Long INIT_FLAG_ENABLE_BLINK		= 4
Constant Long INIT_FLAG_ENABLE_BLINKFAST	= 8
Constant Long INIT_FLAG_ENABLE_ORCA			= 256
Constant Long INIT_FLAG_ENABLE_SQLITE		= 512
Constant Long INIT_FLAG_ENABLE_DPIAWARE	= 1024
Constant Long INIT_FLAG_ENABLE_ALL			= INIT_FLAG_ENABLE_UI + INIT_FLAG_ENABLE_SCITER + INIT_FLAG_ENABLE_BLINK + INIT_FLAG_ENABLE_ORCA + INIT_FLAG_ENABLE_SQLITE + INIT_FLAG_ENABLE_DPIAWARE

/*--- UI ---*/

//Orientation
Constant Uint HORZ 	= 0		//Horizontal
Constant Uint VERT 	= 1		//Vertical
//Icon sizes
Constant Uint SMALL 		= 	16
Constant Uint MEDIUM 	= 	24
Constant Uint LARGE 		= 	32
Constant Uint XLARGE 	= 	48
//Positions
Constant Uint LEFT 		= 0
Constant Uint TOP 		= 1
Constant Uint RIGHT		= 2
Constant Uint BOTTOM 	= 3
//Background styles
Constant Uint SOLID				=	0
Constant Uint XP					=	1
Constant Uint VISTAEMBOSSED= 	2
Constant Uint VISTAORIGINAL 	= 	3
Constant Uint VISTAGLASS 		= 	4
Constant Uint TRANSPARENT	=	5
//Border styles
Constant Uint BS_NONE		=	0
Constant Uint BS_SOLID		=	1
Constant Uint BS_RAISED	=	2
Constant Uint BS_ROUND		=	3
//Line styles
Constant Uint LS_SOLID			=	0
Constant Uint LS_DASH			=	1
Constant Uint LS_DOT			=	2
Constant Uint LS_DASHDOT		=	3
Constant Uint LS_DASHDOTDOT=	4
//ToolTip styles
Constant Uint TTS_NONE			= 0
Constant Uint TTS_NORMAL		= 1
Constant Uint TTS_BALLOON	= 2
//Button styles
Constant Uint BTS_NORMAL		= 0
Constant Uint BTS_DROPDOWN	= 1
Constant Uint BTS_SPLIT			= 2
//Scroll flags
Constant Long SF_FORWARD 	= 0
Constant Long SF_BACKWARD 	= 1
//States
Constant Ulong STATE_NONE			= 0
Constant Ulong STATE_HOVER       	= 1
Constant Ulong STATE_PRESSED     	= 2
Constant Ulong STATE_FOCUS		   	= 4
Constant Ulong STATE_CURRENT     	= 8
Constant Ulong STATE_CHECKED     	= 16
Constant Ulong STATE_SELECTED     	= 16
Constant Ulong STATE_ACTIVE     	= 32
Constant Ulong STATE_DRAGGING    	= 64
Constant Ulong STATE_EXPANDED    	= 128
Constant Ulong STATE_COLLAPSED   	= 256
Constant Ulong STATE_DISABLED    	= 65536
Constant Ulong STATE_HIGHLIGHTED	= 131072
Constant Ulong STATE_FLASHING    	= 262144
Constant Ulong STATE_DEFAULT    	= 524288
Constant Ulong STATE_READONLY		= 1048576

/*--- I18N ---*/
//Source
Constant Long I18N_SRC_PFW			= 0
Constant Long I18N_SRC_CUSTOM	= 1
//Category
Constant Long I18N_CAT_WINDOW				= 0
Constant Long I18N_CAT_TABCONTROL			= 1
Constant Long I18N_CAT_RIBBONBAR			= 2
Constant Long I18N_CAT_SPLITCONTAINER	= 3
Constant Long I18N_CAT_DATAWINDOW		= 4
Constant Long I18N_CAT_CUSTOM				= 5

/*--- Sciter ---*/

//SCITER_RT_OPTIONS (u_sciter/n_sciter/w_sciter::SetOption/SciterSetOption:[option])
Constant Long SC_OPT_SMOOTH_SCROLL 					= 1    // value:TRUE - enable, value:FALSE - disable, enabled by default
Constant Long SC_OPT_CONNECTION_TIMEOUT 			= 2 	// value: milliseconds, connection timeout of http client
Constant Long SC_OPT_HTTPS_ERROR 						= 3    // value: 0 - drop connection, 1 - use builtin dialog, 2 - accept connection silently (SC_OPT_HTTPS_ERROR_VALUE)
Constant Long SC_OPT_FONT_SMOOTHING 				= 4    // value: 0 - system default, 1 - no smoothing, 2 - std smoothing, 3 - clear type (SC_OPT_FONT_SMOOTHING_VALUE)
Constant Long SC_OPT_TRANSPARENT_WINDOW 		= 6 	// Windows Aero support, value:
                                  													// 0 - normal drawing,
                                 													// 1 - window has transparent background after calls DwmExtendFrameIntoClientArea() or DwmEnableBlurBehindWindow().
Constant Long SC_OPT_SCRIPT_RUNTIME_FEATURES	= 8 	// value - combination of SC_OPT_SCRIPT_RUNTIME_FEATURES_VALUE flags.
Constant Long SC_OPT_GFX_LAYER 							= 9	// value - SC_OPT_GFX_LAYER_VALUE
Constant Long SC_OPT_DEBUG_MODE 						= 10  // value - TRUE/FALSE
Constant Long SC_OPT_UX_THEMING							= 11	// value - BOOL, TRUE - the engine will use "unisex" theme that is common for all platforms. 
																				// That UX theme is not using OS primitives for rendering input elements. Use it if you want exactly
																				// the same (modulo fonts) look-n-feel on all platforms.
Constant Long SC_OPT_ALPHA_WINDOW					= 12	//  hWnd, value - TRUE/FALSE - window uses per pixel alpha (e.g. WS_EX_LAYERED/UpdateLayeredWindow() window)
Constant Long SC_OPT_PX_AS_DIP					= 16	//  value 1 - 1px in CSS is treated as 1dip, value 0 - default behavior - 1px is a physical pixel

//SC_OPT_HTTPS_ERROR_VALUE
Constant Long SC_OPTV_HTTPS_ERROR_DROP		= 0
Constant Long SC_OPTV_HTTPS_ERROR_PROMPT	= 1
Constant Long SC_OPTV_HTTPS_ERROR_ACCEPT		= 2

//SC_OPT_FONT_SMOOTHING_VALUE
Constant Long SC_OPTV_FONT_DEFAULT 			= 0
Constant Long SC_OPTV_FONT_NO_SMOOTHING 	= 1
Constant Long SC_OPTV_FONT_SMOOTHING 		= 2
Constant Long SC_OPTV_FONT_CLEAR_TYPE		= 3

//SC_OPT_SCRIPT_RUNTIME_FEATURES_VALUE
Constant Long SC_OPTV_RT_ALLOW_FILE_IO 		= 1
Constant Long SC_OPTV_RT_ALLOW_SOCKET_IO = 2
Constant Long SC_OPTV_RT_ALLOW_EVAL 			= 4
Constant Long SC_OPTV_RT_ALLOW_SYSINFO 	= 8

//SC_OPT_GFX_LAYER_VALUE
Constant Long SC_OPTV_GFX_LAYER_GDI				= 1
Constant Long SC_OPTV_GFX_LAYER_WARP			= 2
Constant Long SC_OPTV_GFX_LAYER_D2D				= 3
Constant Long SC_OPTV_GFX_LAYER_SKIA			= 4
Constant Long SC_OPTV_GFX_LAYER_SKIA_OPENGL	= 5
Constant Long SC_OPTV_GFX_LAYER_AUTO			= 65535

//SCITER_CREATE_WINDOW_FLAGS (n_sciter::CreateWindow:[flags])
//注:
//	1. PowerFramework不允许创建SC_WS_CHILD风格的sciter窗口,如果要使用sciter子窗口请使用u_sciter
//	2. 在PowerFramework里关闭SC_SW_MAIN风格的窗口不会关闭进程!
//	3. 使用SC_SW_POPUP风格创建时最好指定[owner]参数
//	4. 使用SC_SW_MAIN风格创建时将忽略[owner]参数
//Constant Long SC_WS_CHILD      		= 1 		// child window only, if this flag is set all other flags ignored
Constant Long SC_WS_TITLEBAR   		= 2		// toplevel window, has titlebar
Constant Long SC_WS_RESIZEABLE 		= 4 		// has resizeable frame
Constant Long SC_WS_TOOL      			= 8 		// is tool window
Constant Long SC_WS_CONTROLS   		= 16 		// has minimize / maximize buttons
Constant Long SC_WS_GLASSY     		= 32 		// glassy window ( DwmExtendFrameIntoClientArea on windows )
Constant Long SC_WS_ALPHA      			= 64		// transparent window ( e.g. WS_EX_LAYERED on Windows )
Constant Long SC_WS_MAIN       			= 128		// main window of the app
Constant Long SC_WS_POPUP      			= 256		// the window is created as topmost window.
Constant Long SC_WS_ENABLE_DEBUG 	= 512 	// make this window inspector ready
//Constant Long SC_WS_OWNS_VM      	= 1024 	// it has its own script VM
Constant Long SC_WS_VISIBLE     		= 65536	// the window is visible

//EVENT_GROUPS (event filter)
Constant Long SC_HANDLE_MOUSE 				= 1		// mouse events 
Constant Long SC_HANDLE_KEY 					= 2		// key events 
Constant Long SC_HANDLE_FOCUS 				= 4		// focus events, if this flag is set it also means that element it attached to is focusable 
Constant Long SC_HANDLE_SCROLL 				= 8		// scroll events 
Constant Long SC_HANDLE_TIMER 				= 16		// timer event 
Constant Long SC_HANDLE_SIZE 					= 32		// size changed event 
Constant Long SC_HANDLE_EVENT  				= 256		// logical, synthetic events: BUTTON_CLICK, HYPERLINK_CLICK, etc.,a.k.a. notifications from intrinsic behaviors
Constant Long SC_HANDLE_INVOKE_METHOD	= 1024 + 512 	// behavior specific methods 
Constant Long SC_HANDLE_ALL                   	= 65536 	// all of them 

//PHASE_MASK (combine with [eventflag])
// see: http://www.w3.org/TR/xml-events/Overview.html#s_intro
Constant Long SC_PHASE_BUBBLING 	= 0		// bubbling (emersion) phase
Constant Long SC_PHASE_SINKING  	= 32768	// capture (immersion) phase, this flag is or'ed with EVENTS codes below
Constant Long SC_PHASE_HANDLED  	= 65536

//MOUSE_BUTTONS (u_sciter/n_sciter/w_sciter/n_scitereventhandler::OnMouse:[mousebuttons])
Constant Long SC_MOUSE_LEFT 		= 1 //aka left button
Constant Long SC_MOUSE_RIGHT 		= 2 //aka right button
Constant Long SC_MOUSE_MIDDLE	= 4

//MOUSE_EVENTS (EVENT_GROUPS::SC_HANDLE_MOUSE, u_sciter/n_sciter/w_sciter/n_scitereventhandler::OnMouse:[eventflag])
Constant Long SC_MOUSE_ENTER 				= 0
Constant Long SC_MOUSE_LEAVE 					= 1
Constant Long SC_MOUSE_MOVE 					= 2
Constant Long SC_MOUSE_UP						= 3
Constant Long SC_MOUSE_DOWN 				= 4
Constant Long SC_MOUSE_DCLICK 				= 5
Constant Long SC_MOUSE_WHEEL 				= 6
Constant Long SC_MOUSE_TICK 					= 7 	// mouse pressed ticks
Constant Long SC_MOUSE_IDLE 					= 8 	// mouse stay idle for some time

//KEYBOARD_STATES (OnMouse/OnKey:[keyboardstates])
Constant Long SC_KEY_CONTROL 	= 1
Constant Long SC_KEY_SHIFT 		= 2
Constant Long SC_KEY_ALT 		= 4

//KEY_EVENTS (EVENT_GROUPS::SC_HANDLE_KEY, u_sciter/n_sciter/w_sciter/n_scitereventhandler::OnKey:[eventflag])
Constant Long SC_KEY_DOWN 	= 0
Constant Long SC_KEY_UP 		= 1
Constant Long SC_KEY_CHAR 	= 2

//FOCUS_EVENTS (EVENT_GROUPS::SC_HANDLE_FOCUS, u_sciter/n_sciter/w_sciter/n_scitereventhandler::OnFocus:[eventflag])
Constant Long SC_FOCUS_LOST	= 0 // non-bubbling event, target is new focus element
Constant Long SC_FOCUS_GOT	= 1 // non-bubbling event, target is old focus element
Constant Long SC_FOCUS_IN		= 2 // bubbling event/notification, target is an element that got focus
Constant Long SC_FOCUS_OUT	= 3 // bubbling event/notification, target is an element that lost focus

//BEHAVIOR_EVENTS (EVENT_GROUPS::SC_HANDLE_EVENT, u_sciter/n_sciter/w_sciter/n_scitereventhandler::OnEvent:[eventflag])
Constant Long SC_EVT_BUTTON_CLICK 								= 0        // click on button
Constant Long SC_EVT_BUTTON_PRESS 							= 1        	// mouse down or key down in button
Constant Long SC_EVT_BUTTON_STATE_CHANGED 				= 2     	// checkbox/radio/slider changed its state/value
Constant Long SC_EVT_EDIT_VALUE_CHANGING 					= 3      	// before text change
Constant Long SC_EVT_EDIT_VALUE_CHANGED 					= 4       	// after text change
Constant Long SC_EVT_SELECT_SELECTION_CHANGED 			= 5 		// selection in <select> changed
Constant Long SC_EVT_SELECT_STATE_CHANGED 				= 6    	// node in select expanded/collapsedheTarget is the node
Constant Long SC_EVT_POPUP_REQUEST   							= 7        	// request to show popup just received,
																							//     here DOM of popup element can be modifed.
Constant Long SC_EVT_POPUP_READY     							= 8		// popup element has been measured and ready to be shown on screen,
																							//     here you can use functions like ScrollToView.
Constant Long SC_EVT_POPUP_DISMISSED 						= 9		// popup element is closed,
																							//     here DOM of popup element can be modifed again - e.g. some items can be removed
																							//     to free memory.
Constant Long SC_EVT_MENU_ITEM_ACTIVE 						= 10		// menu item activated by mouse hover or by keyboard,
Constant Long SC_EVT_MENU_ITEM_CLICK 							= 11		// menu item click,
																							//   BEHAVIOR_EVENT_PARAMS structure layout
																							//   BEHAVIOR_EVENT_PARAMS.cmd - MENU_ITEM_CLICK/MENU_ITEM_ACTIVE
																							//   BEHAVIOR_EVENT_PARAMS.heTarget - owner(anchor) of the menu
																							//   BEHAVIOR_EVENT_PARAMS.he - the menu item, presumably <li> element
																							//   BEHAVIOR_EVENT_PARAMS.reason - BY_MOUSE_CLICK | BY_KEY_CLICK
Constant Long SC_EVT_CONTEXT_MENU_REQUEST 				= 16		// "right-click"BEHAVIOR_EVENT_PARAMS::he is current popup menu HELEMENT being processed or NULL.
																							// application can provide its own HELEMENT here (if it is NULL) or modify current menu element.
Constant Long SC_EVT_VISIUAL_STATUS_CHANGED 				= 17		// broadcast notification, sent to all elements of some container being shown or hidden
Constant Long SC_EVT_DISABLED_STATUS_CHANGED 			= 18		// broadcast notification, sent to all elements of some container that got new value of :disabled state
Constant Long SC_EVT_POPUP_DISMISSING 						= 19		// popup is about to be closed
Constant Long SC_EVT_CONTENT_CHANGED 						= 21		// content has been changed, is posted to the element that gets content changed reason is combination of CONTENT_CHANGE_BITS.
																							// target == NULL means the window got new document and this event is dispatched only to the window.
Constant Long SC_EVT_CLICK 											= 22		// generic click
Constant Long SC_EVT_CHANGE 										= 23		// generic change
Constant Long SC_EVT_HYPERLINK_CLICK 							= 128		// hyperlink click
Constant Long SC_EVT_ELEMENT_COLLAPSED 						= 144     // element was collapsed, so far only behavior:tabs is sending these two to the panels
Constant Long SC_EVT_ELEMENT_EXPANDED 						= 145     // element was expanded
Constant Long SC_EVT_ACTIVATE_CHILD  							= 146     // activate (select) child,
																							// used for example by accesskeys behaviors to send activation request, e.g. tab on behavior:tabs.
Constant Long SC_EVT_INIT_DATA_VIEW   							= 147     // request to virtual grid to initialize its view
Constant Long SC_EVT_ROWS_DATA_REQUEST   				= 148     // request from virtual grid to data source behavior to fill data in the table
                                     															// parameters passed throug DATA_ROWS_PARAMS structure.
Constant Long SC_EVT_UI_STATE_CHANGED  						= 149     // ui state changed, observers shall update their visual states.
                                     															// is sent for example by behavior:richtext when caret position/selection has changed.
Constant Long SC_EVT_FORM_SUBMIT  								= 150     // behavior:form detected submission event. BEHAVIOR_EVENT_PARAMS::data field contains data to be posted.
																							// BEHAVIOR_EVENT_PARAMS::data is of type T_MAP in this case key/value pairs of data that is about 
																							// to be submitted. You can modify the data or discard submission by returning true from the handler.
Constant Long SC_EVT_FORM_RESET   								= 151		// behavior:form detected reset event (from button type=reset). BEHAVIOR_EVENT_PARAMS::data field contains data to be reset.
																							// BEHAVIOR_EVENT_PARAMS::data is of type T_MAP in this case key/value pairs of data that is about 
																							// to be rest. You can modify the data or discard reset by returning true from the handler.
Constant Long SC_EVT_DOCUMENT_COMPLETE    				= 152     // document in behavior:frame or root document is complete.
Constant Long SC_EVT_HISTORY_PUSH     							= 153     // requests to behavior:history (commands)
Constant Long SC_EVT_HISTORY_DROP    							= 154               
Constant Long SC_EVT_HISTORY_PRIOR 							= 155
Constant Long SC_EVT_HISTORY_NEXT 								= 156
Constant Long SC_EVT_HISTORY_STATE_CHANGED 				= 157     // behavior:history notification - history stack has changed
Constant Long SC_EVT_CLOSE_POPUP   								= 158     // close popup request
Constant Long SC_EVT_REQUEST_TOOLTIP 						= 159     // request tooltipevt.source <- is the tooltip element.
Constant Long SC_EVT_ANIMATION         							= 160     // animation started (reason=1) or ended(reason=0) on the element.
Constant Long SC_EVT_DOCUMENT_CREATED  					= 192     // document created, script namespace initialized. target -> the document
Constant Long SC_EVT_DOCUMENT_CLOSE_REQUEST 			= 193		// document is about to be closed, to cancel closing do: evt.data = sciter::value("cancel");
Constant Long SC_EVT_DOCUMENT_CLOSE    						= 194     // last notification before document removal from the DOM
Constant Long SC_EVT_DOCUMENT_READY    						= 195     // document has got DOM structure, styles and behaviors of DOM elements. Script loading run is complete at this moment. 
Constant Long SC_EVT_DOCUMENT_PARSED   						= 196		// document just finished parsing - has got DOM structure. This event is generated before DOCUMENT_READY
Constant Long SC_EVT_VIDEO_INITIALIZED 						= 209     // <video> "ready" notification   
Constant Long SC_EVT_VIDEO_STARTED     						= 210     // <video> playback started notification   
Constant Long SC_EVT_VIDEO_STOPPED     						= 211     // <video> playback stoped/paused notification   
Constant Long SC_EVT_VIDEO_BIND_RQ     						= 212     // <video> request for frame source binding,
																							//   If you want to provide your own video frames source for the given target <video> element do the following:
																							//   1. Handle and consume this VIDEO_BIND_RQ request 
																							//   2. You will receive second VIDEO_BIND_RQ request/event for the same <video> element
																							//      but this time with the 'reason' field set to an instance of sciter::video_destination interface.
																							//   3. add_ref() it and store it for example in worker thread producing video frames.
																							//   4. call sciter::video_destination::start_streaming(...) providing needed parameters
																							//      call sciter::video_destination::render_frame(...) as soon as they are available
																							//      call sciter::video_destination::stop_streaming() to stop the rendering (a.k.a. end of movie reached)
Constant Long SC_EVT_PAGINATION_STARTS  					= 224   	// behavior:pager starts pagination
Constant Long SC_EVT_PAGINATION_PAGE    						= 225		// behavior:pager paginated page no, reason -> page no
Constant Long SC_EVT_PAGINATION_ENDS    						= 226		// behavior:pager end pagination, reason -> total pages
Constant Long SC_EVT_CUSTOM_NAME									= 240	// event with custom name
Constant Long SC_EVT_FIRST_APPLICATION_EVENT_CODE		= 256		// all custom event codes shall be greater
																							// than this number. All codes below this will be used
																							// solely by application - Sciter will not intrepret it
																							// and will do just dispatching.
																							// To send event notifications with  these codes use
																							// SciterSend/PostEvent API.
Constant Long SC_EVT_CUSTOM										= 4096

//CONTENT_CHANGE_BITS (for SC_EVT_CONTENT_CHANGED reason, u_sciter/n_sciter/n_scitereventhandler::OnEvent:[reason])
Constant Long SC_EVR_CONTENT_ADDED 		= 1
Constant Long SC_EVR_CONTENT_REMOVED 	= 2

//CLICK_REASON (u_sciter/n_sciter/w_sciter/n_scitereventhandler::OnEvent:[reason])
Constant Long SC_EVR_BY_MOUSE_CLICK 	= 0
Constant Long SC_EVR_BY_KEY_CLICK 		= 1
Constant Long SC_EVR_SYNTHESIZED 		= 2 	// synthesized, programmatically generated.
Constant Long SC_EVR_BY_MOUSE_ON_ICON 	= 3

//EDIT_CHANGED_REASON (u_sciter/n_sciter/w_sciter/n_scitereventhandler::OnEvent:[reason])
Constant Long SC_EVR_BY_INS_CHAR 		= 0  	// single char insertion
Constant Long SC_EVR_BY_INS_CHARS 		= 1 	// character range insertion, clipboard
Constant Long SC_EVR_BY_DEL_CHAR 		= 2  	// single char deletion
Constant Long SC_EVR_BY_DEL_CHARS 		= 3 	// character range deletion (selection)
Constant Long SC_EVR_BY_UNDO_REDO 	= 4 	// undo/redo

//VALUE_TYPE (n_scitervalue::GetType/GetItemType)
Constant Long SC_TYPE_UNDEFINED	= 0
Constant Long SC_TYPE_NULL 			= 1
Constant Long SC_TYPE_BOOLEAN 	= 2
Constant Long SC_TYPE_NUMBER 		= 3
Constant Long SC_TYPE_STRING 		= 4
Constant Long SC_TYPE_DATETIME  	= 5
Constant Long SC_TYPE_CLASS 		= 6
Constant Long SC_TYPE_OBJECT 		= 7
Constant Long SC_TYPE_ARRAY 		= 8
Constant Long SC_TYPE_BYTES 		= 9
Constant Long SC_TYPE_BLOB	 		= 10
Constant Long SC_TYPE_ELEMENT 	= 11
Constant Long SC_TYPE_FUNCTION 	= 12
Constant Long SC_TYPE_FUNCTOR 	= 13
Constant Long SC_TYPE_UNNAMED 	= 14

//VALUE_UNIT_TYPE (n_scitervalue::GetUnitType/GetItemUnitType)
Constant Long SC_TYPE_UNIT_EM 		= 1	// height of the element's font. 
Constant Long SC_TYPE_UNIT_EX 		= 2	// height of letter 'x' 
Constant Long SC_TYPE_UNIT_PR 		= 3	// %
Constant Long SC_TYPE_UNIT_SP 		= 4	// %% "springs", a.k.a. flex units
Constant Long SC_TYPE_UNIT_PX 		= 7	// pixels
Constant Long SC_TYPE_UNIT_IN 			= 8	// inches (1 inch = 2.54 centimeters). 
Constant Long SC_TYPE_UNIT_CM 		= 9	// centimeters. 
Constant Long SC_TYPE_UNIT_MM 		= 10	// millimeters. 
Constant Long SC_TYPE_UNIT_PT 		= 11	// points (1 point = 1/72 inches). 
Constant Long SC_TYPE_UNIT_PC 		= 12	// picas (1 pica = 12 points). 
Constant Long SC_TYPE_UNIT_DIP 		= 13
Constant Long SC_TYPE_UNIT_COLOR	= 15	// color in int
Constant Long SC_TYPE_UNIT_URL   		= 16	// url in string

//SET_ELEMENT_HTML (n_sciterelement::SetHtml:[nwhere])
Constant Long SC_SIH_REPLACE_CONTENT		= 0
Constant Long SC_SIH_INSERT_AT_START		= 1
Constant Long SC_SIH_APPEND_AFTER_LAST	= 2
Constant Long SC_SOH_REPLACE             		= 3
Constant Long SC_SOH_INSERT_BEFORE       	= 4
Constant Long SC_SOH_INSERT_AFTER        	= 5

//ELEMENT_STATE_BITS (n_sciterelement::GetState/SetState)
Constant Ulong SC_STATE_LINK				= 1
Constant Ulong SC_STATE_HOVER			= 2
Constant Ulong SC_STATE_ACTIVE			= 4
Constant Ulong SC_STATE_FOCUS			= 8
Constant Ulong SC_STATE_VISITED			= 16
Constant Ulong SC_STATE_CURRENT			= 32  				// current (hot) item
Constant Ulong SC_STATE_CHECKED			= 64  				// element is checked (or selected)
Constant Ulong SC_STATE_DISABLED			= 128  			// element is disabled
Constant Ulong SC_STATE_READONLY		= 256  			// readonly input element
Constant Ulong SC_STATE_EXPANDED		= 512  			// expanded state - nodes in tree view
Constant Ulong SC_STATE_COLLAPSED		= 1024  			// collapsed state - nodes in tree view - mutually exclusive with
Constant Ulong SC_STATE_INCOMPLETE		= 2048  			// one of fore/back images requested but not delivered
Constant Ulong SC_STATE_ANIMATING		= 4096  			// is animating currently
Constant Ulong SC_STATE_FOCUSABLE		= 8192  			// will accept focus
Constant Ulong SC_STATE_ANCHOR			= 16384  		// anchor in selection (used with current in selects)
Constant Ulong SC_STATE_SYNTHETIC		= 32768  		// this is a synthetic element - don't emit it's head/tail
Constant Ulong SC_STATE_OWNS_POPUP	= 65536  		// this is a synthetic element - don't emit it's head/tail
Constant Ulong SC_STATE_TABFOCUS		= 131072  		// focus gained by tab traversal
Constant Ulong SC_STATE_EMPTY            	= 262144  		// empty - element is empty (text.size() == 0 && subs.size() == 0)
                                         										//  if element has behavior attached then the behavior is responsible for the value of this flag.
Constant Ulong SC_STATE_BUSY				= 524288  		// busy; loading
Constant Ulong SC_STATE_DRAG_OVER		= 1048576  		// drag over the block that can accept it (so is current drop target). Flag is set for the drop target block
Constant Ulong SC_STATE_DROP_TARGET	= 2097152  		// active drop target.
Constant Ulong SC_STATE_MOVING			= 4194304  		// dragging/moving - the flag is set for the moving block.
Constant Ulong SC_STATE_COPYING			= 8388608  		// dragging/copying - the flag is set for the copying block.
Constant Ulong SC_STATE_DRAG_SOURCE	= 16777216  	// element that is a drag source.
Constant Ulong SC_STATE_DROP_MARKER	= 33554432  	// element is drop marker
Constant Ulong SC_STATE_PRESSED          = 67108864		// pressed - close to active but has wider life span - e.g. in MOUSE_UP it
                                        										 	//   is still on; so behavior can check it in MOUSE_UP to discover CLICK condition.
Constant Ulong SC_STATE_POPUP            	= 134217728	// this element is out of flow - popup
Constant Ulong SC_STATE_IS_LTR           	= 268435456	// the element or one of its containers has dir=ltr declared
Constant Ulong SC_STATE_IS_RTL           	= 536870912	// the element or one of its containers has dir=rtl declared


//ELEMENT_AREAS (n_sciterelement::GetLocation:[area])
Constant Ulong SC_AREA_ROOT_RELATIVE 		= 1	// - or this flag if you want to get Sciter window relative coordinates,
                              												//   otherwise it will use nearest windowed container e.g. popup window.
Constant Ulong SC_AREA_SELF_RELATIVE 			= 2	// - "or" this flag if you want to get coordinates relative to the origin
																		//   of element iself.
Constant Ulong SC_AREA_CONTAINER_RELATIVE	= 3	// - position inside immediate container.
Constant Ulong SC_AREA_VIEW_RELATIVE 			= 4	// - position relative to view - Sciter window
Constant Ulong SC_AREA_CONTENT_BOX			= 0	// content (inner)  box
Constant Ulong SC_AREA_PADDING_BOX				= 16	// content + paddings
Constant Ulong SC_AREA_BORDER_BOX				= 32	// content + paddings + border
Constant Ulong SC_AREA_MARGIN_BOX				= 48	// content + paddings + border + margins
Constant Ulong SC_AREA_BACK_IMAGE_AREA		= 64	// relative to content origin - location of background image (if it set no-repeat)
Constant Ulong SC_AREA_FORE_IMAGE_AREA		= 80	// relative to content origin - location of foreground image (if it set no-repeat)
Constant Ulong SC_AREA_SCROLLABLE_AREA		= 96	// scroll_area - scrollable area in content box


//CTL_TYPE (n_sciterelement::GetType)
/** Control types.
 *  Control here is any dom element having appropriate behavior applied
 **/
Constant Ulong SC_CTL_NO 						= 0	//< This dom element has no behavior at all.
Constant Ulong SC_CTL_UNKNOWN 				= 1	//< This dom element has behavior but its type is unknown.
Constant Ulong SC_CTL_EDIT 						= 2	//< Single line edit box.
Constant Ulong SC_CTL_NUMERIC 				= 3	//< Numeric input with optional spin buttons.
Constant Ulong SC_CTL_CLICKABLE 				= 4	//< toolbar button, behavior:clickable.
Constant Ulong SC_CTL_BUTTON 					= 5	//< Command button.
Constant Ulong SC_CTL_CHECKBOX 				= 6	//< CheckBox (button).
Constant Ulong SC_CTL_RADIO 					= 7	//< OptionBox (button).
Constant Ulong SC_CTL_SELECT_SINGLE 		= 8	//< Single select = ListBox or TreeView.
Constant Ulong SC_CTL_SELECT_MULTIPLE		= 9	//< Multiselectable select, ListBox or TreeView.
Constant Ulong SC_CTL_DD_SELECT 				= 10	//< Dropdown single select.
Constant Ulong SC_CTL_TEXTAREA 				= 11	//< Multiline TextBox.
Constant Ulong SC_CTL_HTMLAREA 				= 12	//< WYSIWYG HTML editor.
Constant Ulong SC_CTL_PASSWORD 				= 13	//< Password input element.
Constant Ulong SC_CTL_PROGRESS 				= 14	//< Progress element.
Constant Ulong SC_CTL_SLIDER 					= 15	//< Slider input element.
Constant Ulong SC_CTL_DECIMAL 					= 16	//< Decimal number input element.
Constant Ulong SC_CTL_CURRENCY 				= 17	//< Currency input element.
Constant Ulong SC_CTL_SCROLLBAR 				= 18
Constant Ulong SC_CTL_HYPERLINK 				= 19
Constant Ulong SC_CTL_MENUBAR 				= 20
Constant Ulong SC_CTL_MENU 						= 21
Constant Ulong SC_CTL_MENUBUTTON 			= 22
Constant Ulong SC_CTL_CALENDAR 				= 23
Constant Ulong SC_CTL_DATE 						= 24
Constant Ulong SC_CTL_TIME 						= 25
Constant Ulong SC_CTL_FRAME 					= 26
Constant Ulong SC_CTL_FRAMESET 				= 27
Constant Ulong SC_CTL_GRAPHICS 				= 28
Constant Ulong SC_CTL_SPRITE 					= 29
Constant Ulong SC_CTL_LIST 						= 30
Constant Ulong SC_CTL_RICHTEXT 				= 31
Constant Ulong SC_CTL_TOOLTIP 					= 32
Constant Ulong SC_CTL_HIDDEN 					= 33
Constant Ulong SC_CTL_URL 						= 34	//< URL input element.
Constant Ulong SC_CTL_TOOLBAR 				= 35
Constant Ulong SC_CTL_FORM 					= 36
Constant Ulong SC_CTL_FILE 						= 37	//< file input element.
Constant Ulong SC_CTL_PATH 						= 38	//< path input element.
Constant Ulong SC_CTL_WINDOW 				= 39	//< has HWND attached to it
Constant Ulong SC_CTL_LABEL 					= 40           
Constant Ulong SC_CTL_IMAGE 					= 41	//< image/object.  

//OUTPUT_SUBSYTEMS (u_sciter/n_sciter/w_sciter::OnDebugOutput:[subsystem])
Constant Ulong SC_OT_DOM 	= 0 //html parser & runtime
Constant Ulong SC_OT_CSSS 	= 1 //csss! parser & runtime
Constant Ulong SC_OT_CSS 	= 2 //css parser
Constant Ulong SC_OT_TIS		= 3 //TIS parser & runtime

//OUTPUT_SEVERITY (u_sciter/n_sciter/w_sciter::OnDebugOutput:[severity])
Constant Ulong SC_OS_INFO 		= 0
Constant Ulong SC_OS_WARNING 	= 1
Constant Ulong SC_OS_ERROR 	= 2

/*--- End Sciter ---*/

/*--- Blink ---*/

//options (u_blink/n_blink::SetOption:[option])
Constant Long BLINK_OPT_COOKIE_FILE			= 1    // value:string - file path, 'cookie.dat' by default
Constant Long BLINK_OPT_STORAGE_DIR			= 2    // value:string - local storage directory, 'LocalStorage' by default
Constant Long BLINK_OPT_PLUGIN_DIR			= 3    // value:string - plugin directory, 'Plugin' by default
Constant Long BLINK_OPT_COOKIE_ENABLED		= 4    // value:boolean - enable, value:FALSE - disable, enabled by default
Constant Long BLINK_OPT_PLUGIN_ENABLED		= 5    // value:boolean - enable, value:FALSE - disable, disabled by default
Constant Long BLINK_OPT_CSP_CHECK_ENABLED	= 6    // value:boolean - enable, value:FALSE - disable, disabled by default
Constant Long BLINK_OPT_HEADLESS_ENABLED	= 7    // value:boolean - enable, value:FALSE - disable, disabled by default
Constant Long BLINK_OPT_ALPHA_WINDOW		= 8	 // value:boolean - window uses per pixel alpha (e.g. WS_EX_LAYERED/UpdateLayeredWindow() window)
Constant Long BLINK_OPT_GET_FAVICON			= 9    // value:boolean - get [favicon], onGetFavicon:data

//create window flags (n_blink::CreateWindow:[flags])
//注:
//	1. 使用SC_SW_POPUP风格创建时最好指定[owner]参数
//	2. 使用SC_SW_MAIN风格创建时将忽略[owner]参数
Constant Long BLINK_WS_TITLEBAR   		= 1		// toplevel window, has titlebar
Constant Long BLINK_WS_RESIZEABLE 		= 2 		// has resizeable frame
Constant Long BLINK_WS_TOOL      		= 4 		// is tool window
Constant Long BLINK_WS_CONTROLS   		= 8 		// has minimize / maximize buttons
Constant Long BLINK_WS_ALPHA      		= 16		// transparent window ( e.g. WS_EX_LAYERED on Windows )
Constant Long BLINK_WS_MAIN       		= 32		// main window of the app
Constant Long BLINK_WS_POPUP      		= 64		// the window is created as topmost window.
Constant Long BLINK_WS_VISIBLE     		= 65536	// the window is visible

//OUTPUT_SEVERITY (u_blink/n_blink/w_blink::OnDebugOutput:[severity])
Constant Ulong BLINK_OS_LOG 		= 1
Constant Ulong BLINK_OS_WARNING 	= 2
Constant Ulong BLINK_OS_ERROR 	= 3
Constant Ulong BLINK_OS_DEBUG 	= 4
Constant Ulong BLINK_OS_INFO 		= 5
Constant Ulong BLINK_OS_REVOKED 	= 6

//VALUE_TYPE (n_blinkvalue::GetType/GetItemType)
Constant Long BLINK_TYPE_NUMBER 		= 0
Constant Long BLINK_TYPE_STRING 		= 1
Constant Long BLINK_TYPE_BOOLEAN 	= 2
Constant Long BLINK_TYPE_OBJECT 		= 3
Constant Long BLINK_TYPE_FUNCTION 	= 4
Constant Long BLINK_TYPE_UNDEFINED	= 5
Constant Long BLINK_TYPE_ARRAY 		= 6
Constant Long BLINK_TYPE_NULL 		= 7

//loading result (u_blink/n_blink/w_blink::OnLoadingFinish:[result])
Constant Long BLINK_LOADING_SUCCEEDED	= 0
Constant Long BLINK_LOADING_FAILED		= 1
Constant Long BLINK_LOADING_CANCELED	= 2

//NavigationType (u_blink/n_blink/w_blink::OnNavigation:[navtype])
Constant Long BLINK_NAV_TYPE_LINKCLICK			= 0
Constant Long BLINK_NAV_TYPE_FORMSUBMITTE		= 1
Constant Long BLINK_NAV_TYPE_BACKFORWARD		= 2
Constant Long BLINK_NAV_TYPE_RELOAD				= 3
Constant Long BLINK_NAV_TYPE_FORMRESUBMITT	= 4
Constant Long BLINK_NAV_TYPE_OTHER				= 5

/*--- End Blink ---*/

/*--- Thread ---*/

//Thread notify reasons
Constant Long TNR_START	= 1
Constant Long TNR_STOP	= 2	//wparam:exit code
Constant Long TNR_ERROR	= 3	//wparam:error code,sparam:error info
Constant Long TNR_NOTIFY	= 4

/*--- End Thread ---*/

/*--- XML Parser ---*/

//Node types (n_xmlnode::GetType)
Constant Long XML_NODE_NULL 				= 0	// Empty (null) node handle
Constant Long XML_NODE_DOCUMENT 		= 1	// A document tree's absolute root
Constant Long XML_NODE_ELEMENT 			= 2	// Element tag, i.e. '<node/>'
Constant Long XML_NODE_PCDATA 			= 3	// Plain character data, i.e. 'text'
Constant Long XML_NODE_CDATA 			= 4	// Character data, i.e. '<![CDATA[text]]>'
Constant Long XML_NODE_COMMENT 		= 5	// Comment tag, i.e. '<!-- text -->'
Constant Long XML_NODE_PI 					= 6	// Processing instruction, i.e. '<?name?>'
Constant Long XML_NODE_DECLARATION 	= 7	// Document declaration, i.e. '<?xml version="1.0"?>'
Constant Long XML_NODE_DOCTYPE 			= 8	// Document type declaration, i.e. '<!DOCTYPE doc>'

//XPath query return types (n_xmlqueryresult::GetValueType)
Constant Long XML_XPATH_TYPE_NONE 		= 0	// Unknown type (query failed to compile)
Constant Long XML_XPATH_TYPE_NODE_SET 	= 1 	// Node set (xpath_node_set)
Constant Long XML_XPATH_TYPE_NUMBER 		= 2	// Number
Constant Long XML_XPATH_TYPE_STRING 		= 3	// String
Constant Long XML_XPATH_TYPE_BOOLEAN 	= 4	// Boolean

//Node set sort types (n_xmlqueryresult::GetValueNodes:[sorttype])
Constant Long XML_SORT_TYPE_UNSORTED 			= 0	// Not ordered
Constant Long XML_SORT_TYPE_SORTED 				= 1	// Sorted by document order (ascending)
Constant Long XML_SORT_TYPE_SORTED_REVERSE 	= 2	// Sorted by document order (descending)

//Parsing options (n_xmldoc::Parse/LoadFile:[opt])

// Minimal parsing mode (equivalent to turning all other flags off).
// Only elements and PCDATA sections are added to the DOM tree, no text conversions are performed.
Constant Ulong XML_PARSE_MINIMAL = 0
// This flag determines if processing instructions (node_pi) are added to the DOM tree. This flag is off by default.
Constant Ulong XML_PARSE_PI = 1
// This flag determines if comments (node_comment) are added to the DOM tree. This flag is off by default.
Constant Ulong XML_PARSE_COMMENTS = 2
// This flag determines if CDATA sections (node_cdata) are added to the DOM tree. This flag is on by default.
Constant Ulong XML_PARSE_CDATA = 4
// This flag determines if plain character data (node_pcdata) that consist only of whitespace are added to the DOM tree.
// This flag is off by default; turning it on usually results in slower parsing and more memory consumption.
Constant Ulong XML_PARSE_WS_PCDATA = 8
// This flag determines if character and entity references are expanded during parsing. This flag is on by default.
Constant Ulong XML_PARSE_ESCAPES = 16
// This flag determines if EOL characters are normalized (converted to #xA) during parsing. This flag is on by default.
Constant Ulong XML_PARSE_EOL = 32
// This flag determines if attribute values are normalized using CDATA normalization rules during parsing. This flag is on by default.
Constant Ulong XML_PARSE_WCONV_ATTRIBUTE = 64
// This flag determines if attribute values are normalized using NMTOKENS normalization rules during parsing. This flag is off by default.
Constant Ulong XML_PARSE_WNORM_ATTRIBUTE = 128
// This flag determines if document declaration (node_declaration) is added to the DOM tree. This flag is off by default.
Constant Ulong XML_PARSE_DECLARATION = 256
// This flag determines if document type declaration (node_doctype) is added to the DOM tree. This flag is off by default.
Constant Ulong XML_PARSE_DOCTYPE = 512
// This flag determines if plain character data (node_pcdata) that is the only child of the parent node and that consists only
// of whitespace is added to the DOM tree.
// This flag is off by default; turning it on may result in slower parsing and more memory consumption.
Constant Ulong XML_PARSE_WS_PCDATA_SINGLE = 1024
// This flag determines if leading and trailing whitespace is to be removed from plain character data. This flag is off by default.
Constant Ulong XML_PARSE_TRIM_PCDATA = 2048
// This flag determines if plain character data that does not have a parent node is added to the DOM tree, and if an empty document
// is a valid document. This flag is off by default.
Constant Ulong XML_PARSE_FRAGMENT = 4096
// This flag determines if plain character data is be stored in the parent element's value. This significantly changes the structure of
// the document; this flag is only recommended for parsing documents with many PCDATA nodes in memory-constrained environments.
// This flag is off by default.
Constant Ulong XML_PARSE_EMBED_PCDATA = 8192
// The default parsing mode.
// Elements, PCDATA and CDATA sections are added to the DOM tree, character/reference entities are expanded,
// End-of-Line characters are normalized, attribute values are normalized using CDATA normalization rules.
Constant Ulong XML_PARSE_DEFAULT = XML_PARSE_CDATA + XML_PARSE_ESCAPES + XML_PARSE_WCONV_ATTRIBUTE + XML_PARSE_EOL
// The full parsing mode.
// Nodes of all types are added to the DOM tree, character/reference entities are expanded,
// End-of-Line characters are normalized, attribute values are normalized using CDATA normalization rules.
Constant Ulong XML_PARSE_FULL = XML_PARSE_DEFAULT + XML_PARSE_PI + XML_PARSE_COMMENTS + XML_PARSE_DECLARATION + XML_PARSE_DOCTYPE

// Formatting flags  (n_xmldoc::Serialize/SaveFile:[format])

// Indent the nodes that are written to output stream with as many indentation strings as deep the node is in DOM tree. This flag is on by default.
Constant Ulong XML_FORMAT_INDENT = 1
// Write encoding-specific BOM to the output stream. This flag is off by default.
Constant Ulong XML_FORMAT_WRITE_BOM = 2
// Use raw output mode (no indentation and no line breaks are written). This flag is off by default.
Constant Ulong XML_FORMAT_RAW = 4
// Omit default XML declaration even if there is no declaration in the document. This flag is off by default.
Constant Ulong XML_FORMAT_NO_DECLARATION = 8
// Don't escape attribute values and PCDATA contents. This flag is off by default.
Constant Ulong XML_FORMAT_NO_ESCAPES = 16
// Open file using text mode in xml_document::save_file. This enables special character (i.e. new-line) conversions on some systems. This flag is off by default.
Constant Ulong XML_FORMAT_SAVE_FILE_TEXT = 32
// Write every attribute on a new line with appropriate indentation. This flag is off by default.
Constant Ulong XML_FORMAT_INDENT_ATTRIBUTES = 64
// Don't output empty element tags, instead writing an explicit start and end tag even if there are no children. This flag is off by default.
Constant Ulong XML_FORMAT_NO_EMPTY_ELEMENT_TAGS = 128
// The default set of formatting flags.
// Nodes are indented depending on their depth in DOM tree, a default declaration is output if document has none.
Constant Ulong XML_FORMAT_DEFAULT = XML_FORMAT_INDENT

//Encoding flags (n_xmldoc::SaveFile/LoadFile:[encoding])
Constant Ulong XML_ENCODING_AUTO 		= 0	// Auto-detect input encoding using BOM or < / <? detection; use UTF8 if BOM is not found
Constant Ulong XML_ENCODING_UTF8 		= 1	// UTF8 encoding
Constant Ulong XML_ENCODING_UTF16_LE 	= 2	// Little-endian UTF16
Constant Ulong XML_ENCODING_UTF16_BE 	= 3	// Big-endian UTF16
Constant Ulong XML_ENCODING_UTF16 		= 4	// UTF16 with native endianness
Constant Ulong XML_ENCODING_UTF32_LE 	= 5	// Little-endian UTF32
Constant Ulong XML_ENCODING_UTF32_BE 	= 6	// Big-endian UTF32
Constant Ulong XML_ENCODING_UTF32 		= 7	// UTF32 with native endianness
Constant Ulong XML_ENCODING_WCHAR 	= 8	// The same encoding wchar_t has (either UTF16 or UTF32)
Constant Ulong XML_ENCODING_LATIN1 		= 9

/*--- End XML Parser ---*/

/*--- JSON Parser ---*/

//Types (n_json::GetType)
Constant Long JSON_TYPE_NONE 		= 0
Constant Long JSON_TYPE_BOOLEAN = 1
Constant Long JSON_TYPE_NUMBER	= 2
Constant Long JSON_TYPE_STRING	= 3
Constant Long JSON_TYPE_OBJECT	= 4
Constant Long JSON_TYPE_ARRAY		= 5
Constant Long JSON_TYPE_NULL		= 6

//Formatting flags (n_json::Serialize:[format])
Constant Long JSON_FORMAT_NONE 		= 0
Constant Long JSON_FORMAT_INDENT 	= 1
Constant Long JSON_FORMAT_DEFAULT = JSON_FORMAT_NONE

/*--- End JSON Parser ---*/

/*--- SQL Parser ---*/

//Modify styles
Constant Long SQL_MS_REPLACE 	= 1
Constant Long SQL_MS_APPEND 	= 2
Constant Long SQL_MS_PREPEND 	= 3

/*--- End SQL Parser ---*/

/*--- Http ---*/

//Methods (n_httpclient::Request:[method])
Constant String HTTP_METHOD_GET 		= "GET"
Constant String HTTP_METHOD_POST 	= "POST"
Constant String HTTP_METHOD_PUT 		= "PUT"
Constant String HTTP_METHOD_DELETE = "DELETE"
Constant String HTTP_METHOD_HEAD 	= "HEAD"

//Proxy modes (n_httpclient::SetProxyMode/GetProxyMode)
Constant Long HTTP_PROXY_NONE 		= 0 //default
Constant Long HTTP_PROXY_DEFAULT 	= 1
Constant Long HTTP_PROXY_AUTO 		= 2
Constant Long HTTP_PROXY_PROVIDED	= 3

//Cert types (n_httpclient::SetCert/SetCA:[ntype])
Constant Long HTTP_CERT_FILE	  			= 1	//.pem/crt/cer - X509/PKCS7 (PEM)
Constant Long HTTP_CERT_FILE_DER	  		= 2	//.crt/cer/der - X509/PKCS7
Constant Long HTTP_CERT_FILE_PKCS12	= 3	//.pfx/p12
Constant Long HTTP_CERT_PEM	  			= 4

//Cert key types (n_httpclient::SetKey:[ntype])
Constant Long HTTP_CERT_KEY_FILE			  	= 1 	//.pem - Private key (PKCS8)
Constant Long HTTP_CERT_KEY_FILE_RSA	  	= 2	//.pem - RSA private key
Constant Long HTTP_CERT_KEY_PEM				= 3 	//Private key (PKCS8)
Constant Long HTTP_CERT_KEY_PEM_RSA	  	= 4	//RSA private key

//Encoding (n_httputility::StringToBlob/BlobToString/UrlEncode/UrlDecode:[encoding])
//UrlEncode/UrlDecode - default:HTTP_ENCODING_UTF8   support:HTTP_ENCODING_UTF8/HTTP_ENCODING_GB2312/HTTP_ENCODING_GBK
Constant Long HTTP_ENCODING_UNKNOWN		= 0
Constant Long HTTP_ENCODING_UTF8       		= 1
Constant Long HTTP_ENCODING_UTF16			= 2
Constant Long HTTP_ENCODING_UTF16LE   	= 2
Constant Long HTTP_ENCODING_UTF16BE   	= 3
Constant Long HTTP_ENCODING_ANSI       		= 4
Constant Long HTTP_ENCODING_GB2312			= 5
Constant Long HTTP_ENCODING_GBK				= 5
Constant Long HTTP_ENCODING_GB18030		= 6
Constant Long HTTP_ENCODING_BIG5       		= 7
Constant Long HTTP_ENCODING_ISO88591		= 8
Constant Long HTTP_ENCODING_LATIN1			= 8
Constant Long HTTP_ENCODING_ISO88592		= 9
Constant Long HTTP_ENCODING_LATIN2			= 9
Constant Long HTTP_ENCODING_ISO88593 		= 10
Constant Long HTTP_ENCODING_LATIN3			= 10
Constant Long HTTP_ENCODING_ISO2022JP		= 11
Constant Long HTTP_ENCODING_ISO2022KR	= 12

//Http status (n_httpresponse::GetHttpStatus)
Constant Long HTTP_STATUS_CONTINUE					= 100
Constant Long HTTP_STATUS_SWITCH_PROTOCOLS		= 101
Constant Long HTTP_STATUS_OK								= 200
Constant Long HTTP_STATUS_CREATED						= 201
Constant Long HTTP_STATUS_ACCEPTED					= 202
Constant Long HTTP_STATUS_PARTIAL						= 203
Constant Long HTTP_STATUS_NO_CONTENT				= 204
Constant Long HTTP_STATUS_RESET_CONTENT			= 205
Constant Long HTTP_STATUS_PARTIAL_CONTENT		= 206
Constant Long HTTP_STATUS_WEBDAV_MULTI_STATUS= 207
Constant Long HTTP_STATUS_AMBIGUOUS					= 300
Constant Long HTTP_STATUS_MOVED						= 301
Constant Long HTTP_STATUS_REDIRECT					= 302
Constant Long HTTP_STATUS_REDIRECT_METHOD		= 303
Constant Long HTTP_STATUS_NOT_MODIFIED				= 304
Constant Long HTTP_STATUS_USE_PROXY					= 305
Constant Long HTTP_STATUS_REDIRECT_KEEP_VERB	= 307
Constant Long HTTP_STATUS_BAD_REQUEST				= 400
Constant Long HTTP_STATUS_DENIED						= 401
Constant Long HTTP_STATUS_PAYMENT_REQ				= 402
Constant Long HTTP_STATUS_FORBIDDEN					= 403
Constant Long HTTP_STATUS_NOT_FOUND					= 404
Constant Long HTTP_STATUS_BAD_METHOD				= 405
Constant Long HTTP_STATUS_NONE_ACCEPTABLE		= 406
Constant Long HTTP_STATUS_PROXY_AUTH_REQ			= 407
Constant Long HTTP_STATUS_REQUEST_TIMEOUT		= 408
Constant Long HTTP_STATUS_CONFLICT					= 409
Constant Long HTTP_STATUS_GONE							= 410
Constant Long HTTP_STATUS_LENGTH_REQUIRED		= 411
Constant Long HTTP_STATUS_PRECOND_FAILED			= 412
Constant Long HTTP_STATUS_REQUEST_TOO_LARGE	= 413
Constant Long HTTP_STATUS_URI_TOO_LONG				= 414
Constant Long HTTP_STATUS_UNSUPPORTED_MEDIA	= 415
Constant Long HTTP_STATUS_RETRY_WITH				= 449
Constant Long HTTP_STATUS_SERVER_ERROR			= 500
Constant Long HTTP_STATUS_NOT_SUPPORTED			= 501
Constant Long HTTP_STATUS_BAD_GATEWAY				= 502
Constant Long HTTP_STATUS_SERVICE_UNAVAIL			= 503
Constant Long HTTP_STATUS_GATEWAY_TIMEOUT		= 504
Constant Long HTTP_STATUS_VERSION_NOT_SUP		= 505

//Transfer types (n_httpclient::OnTransData:[transtype])
Constant Long HTTP_TRANS_WRITE	= 0
Constant Long HTTP_TRANS_READ		= 1

//Upload types (n_httpclient::UploadFile:[ultype])
Constant Long HTTP_UPLOAD_CHUNK		= 0
Constant Long HTTP_UPLOAD_MULTIPART	= 1

/*--- End Http ---*/

/*--- WebSocket ---*/

//States (n_wsclient::GetState)
Constant Long WS_STATE_CONNECTING	= 0
Constant Long WS_STATE_OPEN				= 1
Constant Long WS_STATE_CLOSING 			= 2
Constant Long WS_STATE_CLOSED 			= 3

//Cert types (n_wsclient::SetCert/SetCA:[ntype])
Constant Long WS_CERT_FILE	  			= HTTP_CERT_FILE				//.pem/crt/cer - X509/PKCS7 (PEM)
Constant Long WS_CERT_FILE_DER	  	= HTTP_CERT_FILE_DER			//.crt/cer/der - X509/PKCS7
Constant Long WS_CERT_FILE_PKCS12	= HTTP_CERT_FILE_PKCS12	//.pfx/p12
Constant Long WS_CERT_PEM	  			= HTTP_CERT_PEM

//Cert key types (n_wsclient::SetKey:[ntype])
Constant Long WS_CERT_KEY_FILE			= HTTP_CERT_KEY_FILE				//.pem - Private key (PKCS8)
Constant Long WS_CERT_KEY_FILE_RSA	  	= HTTP_CERT_KEY_FILE_RSA		//.pem - RSA private key
Constant Long WS_CERT_KEY_PEM			= HTTP_CERT_KEY_PEM				//Private key (PKCS8)
Constant Long WS_CERT_KEY_PEM_RSA	  	= HTTP_CERT_KEY_PEM_RSA		//RSA private key

//Close status (n_wsclient::OnClose:[code])
Constant Long WS_CLOSE_NORMAL 								= 1000
Constant Long WS_CLOSE_GOING_AWAY 						= 1001
Constant Long WS_CLOSE_PROTOCOL_ERROR 				= 1002
Constant Long WS_CLOSE_UNSUPPORTED_DATA 				= 1003
Constant Long WS_CLOSE_NO_STATUS 							= 1005
Constant Long WS_CLOSE_ABNORMAL_CLOSE					= 1006
Constant Long WS_CLOSE_INVALID_PAYLOAD					= 1007
Constant Long WS_CLOSE_POLICY_VIOLATION					= 1008
Constant Long WS_CLOSE_MESSAGE_TOO_BIG				= 1009
Constant Long WS_CLOSE_EXTENSION_REQUIRED			= 1010
Constant Long WS_CLOSE_INTERNAL_ENDPOINT_ERROR	= 1011
Constant Long WS_CLOSE_TLS_HANDSHAKE					= 1015
Constant Long WS_CLOSE_SUBPROTOCOL_ERROR			= 3000
Constant Long WS_CLOSE_INVALID_SUBPROTOCOL_DATA	= 3001
Constant Long WS_CLOSE_MQTT_CONN_TIMEOUT  		= 4001
Constant Long WS_CLOSE_MQTT_PING_TIMEOUT  		= 4002
Constant Long WS_CLOSE_MQTT_CONN_DENIED  			= 4003
Constant Long WS_CLOSE_MQTT_CONN_AUTH_FAILED  	= 4004

//Error codes (n_wsclient::OnError:[code])
Constant Long WS_E_GENERAL  							= 1
Constant Long WS_E_SEND_QUEUE_FULL				= 2
Constant Long WS_E_PAYLOAD_VIOLATION  			= 3
Constant Long WS_E_ENDPOINT_NOT_SECURE  		= 4
Constant Long WS_E_ENDPOINT_UNAVAILABLE  		= 5
Constant Long WS_E_INVALID_URI			  			= 6
Constant Long WS_E_NO_OUTGOING_BUFFERS 		= 7
Constant Long WS_E_NO_INCOMING_BUFFERS  		= 8
Constant Long WS_E_INVALID_STATE  					= 9
Constant Long WS_E_BAD_CLOSE_CODE  				= 10
Constant Long WS_E_RESERVED_CLOSE_CODE  		= 11
Constant Long WS_E_INVALID_CLOSE_CODE  			= 12
Constant Long WS_E_INVALID_UTF8  					= 13
Constant Long WS_E_INVALID_SUBPROTOCOL  		= 14
Constant Long WS_E_BAD_CONNECTION  				= 15
Constant Long WS_E_OPEN_HANDSHAKE_TIMEOUT  	= 22
Constant Long WS_E_CLOSE_HANDSHAKE_TIMEOUT = 23
Constant Long WS_E_INVALID_PORT  					= 23
Constant Long WS_E_OPERATION_CANCELED  			= 26
Constant Long WS_E_REJECTED  							= 27
Constant Long WS_E_EXTENSION_NEG_FAILED  		= 32
Constant Long WS_E_MQTT_CONN_DENIED  		= 401
Constant Long WS_E_MQTT_CONN_AUTH_FAILED  		= 402
Constant Long WS_E_MQTT_CONN_TIMEOUT  		= 403
Constant Long WS_E_MQTT_PUB_TIMEOUT  		= 404
Constant Long WS_E_MQTT_SUB_TIMEOUT  		= 405
Constant Long WS_E_MQTT_PUB_FAILED  		= 406
Constant Long WS_E_MQTT_SUB_FAILED  		= 407

//MQTT over WebSocket
Constant Long WS_MQTT_QOS0 = 0
Constant Long WS_MQTT_QOS1 = 1
Constant Long WS_MQTT_QOS2 = 2
Constant Long WS_MQTT_QOS_AT_MOST_ONCE = WS_MQTT_QOS0
Constant Long WS_MQTT_QOS_AT_LEAST_ONCE = WS_MQTT_QOS1
Constant Long WS_MQTT_QOS_AT_EXACTLY_ONCE = WS_MQTT_QOS2

/*--- End WebSocket ---*/

/*--- Ftp ---*/

//Ftp mode (n_ftpclient::SetMode:[mode])
Constant Long FTP_MODE_ACTIVE		= 0
Constant Long FTP_MODE_PASSIVE	= 1

//File list flags (n_ftpclient::List:[flags])
Constant Long FTP_LIST_FILE	= 1
Constant Long FTP_LIST_DIR		= 2
Constant Long FTP_LIST_ALL		= 3

//File compare flags (n_ftpclient::CompareFile:[flags])
Constant Long FTP_CMP_FLAG_LAST_WRITE_TIME	= 1
Constant Long FTP_CMP_FLAG_SIZE					= 2

/*--- End Ftp ---*/

/*--- Crypto ---*/

//Encoding (n_crypto::StringToBlob/BlobToString:[encoding])
Constant Long CRYPTO_ENCODING_BASE64	= 0
Constant Long CRYPTO_ENCODING_HEX		= 1

//Hash types (n_crypto::Hash/RSASign/VerifyRSASign:[ntype])
Constant Long CRYPTO_HASH_MD5 		= 0
Constant Long CRYPTO_HASH_SHA1 		= 1
Constant Long CRYPTO_HASH_SHA256 	= 2
Constant Long CRYPTO_HASH_SHA384 	= 3
Constant Long CRYPTO_HASH_SHA512 	= 4
Constant Long CRYPTO_HASH_CRC32 	= 5

//SymCrypt types  (n_crypto::SymEncrypt/SymDecrypt:[ntype])
Constant Long CRYPTO_SYMCRYPT_TYPE_DES 		= 0
Constant Long CRYPTO_SYMCRYPT_TYPE_3DES		= 1
Constant Long CRYPTO_SYMCRYPT_TYPE_AES128 	= 2
Constant Long CRYPTO_SYMCRYPT_TYPE_AES192 	= 3
Constant Long CRYPTO_SYMCRYPT_TYPE_AES256 	= 4

//SymCrypt modes (n_crypto::SymEncrypt/SymDecrypt:[mode])
Constant Long CRYPTO_SYMCRYPT_MODE_ECB		= 0
Constant Long CRYPTO_SYMCRYPT_MODE_CBC		= 1 
Constant Long CRYPTO_SYMCRYPT_MODE_CFB		= 2
Constant Long CRYPTO_SYMCRYPT_MODE_DEFAULT	= CRYPTO_SYMCRYPT_MODE_ECB

//RSA padding modes (n_crypto::RSAEncrypto/RSADecrypt:[padding])
Constant Long CRYPTO_RSA_PADDING_PKCS1		= 0 //RSA_PKCS1_PADDING
Constant Long CRYPTO_RSA_PADDING_OAEP 		= 1 //RSA_PKCS1_OAEP_PADDING 
Constant Long CRYPTO_RSA_PADDING_DEFAULT	= CRYPTO_RSA_PADDING_PKCS1

//Random string flags (n_crypto::GenRandomString:[flags])
Constant Ulong CRYPTO_RNDSTRING_NUMBER		= 1
Constant Ulong CRYPTO_RNDSTRING_ALPHABET	= 2
Constant Ulong CRYPTO_RNDSTRING_SYMBOL		= 4
Constant Ulong CRYPTO_RNDSTRING_DEFAULT	= CRYPTO_RNDSTRING_NUMBER + CRYPTO_RNDSTRING_ALPHABET

//Guid flags (n_crypto::GenGuid:[flags])
Constant Ulong CRYPTO_GUID_INCLUDE_BRACKET		= 1
Constant Ulong CRYPTO_GUID_INCLUDE_SEPARATOR	= 2
Constant Ulong CRYPTO_GUID_DEFAULT						= CRYPTO_GUID_INCLUDE_BRACKET	+ CRYPTO_GUID_INCLUDE_SEPARATOR

//RSA predefine bits (n_crypto::GenRSAKey:[bits])
Constant Uint CRYPTO_RSA_BITS_1024 = 1024
Constant Uint CRYPTO_RSA_BITS_2048 = 2048
Constant Uint CRYPTO_RSA_BITS_4096 = 4096

/*--- End Crypto ---*/

/*--- Regular Expression ---*/

//Match flags (n_regexp::Match/FindFirst/FindLast/Find/Replace:[flags])

//Default matching behavior.**.
Constant Ulong REGEXP_MATCH_DEFAULT 			= 0
//The first character is not considered a beginning of line ("^" does not match).
Constant Ulong REGEXP_MATCH_NOT_BOL 			= 1
//The last character is not considered an end of line ("$" does not match).
Constant Ulong REGEXP_MATCH_NOT_EOL 			= 2
//The escape sequence "\b" does not match as a beginning-of-word.
Constant Ulong REGEXP_MATCH_NOT_BOW 		= 4
//The escape sequence "\b" does not match as an end-of-word.
Constant Ulong REGEXP_MATCH_NOT_EOW 		= 8
//Any match is acceptable if more than one match is possible.
Constant Ulong REGEXP_MATCH_ANY 				= 16
//Empty sequences do not match.
Constant Ulong REGEXP_MATCH_NOT_NULL 		= 32
//The expression must match a sub-sequence that begins at the first character.
//Sub-sequences must begin at the first character to match.
Constant Ulong REGEXP_MATCH_CONTINUOUS 	= 64
//One or more characters exist before the first one. (match_not_bol and match_not_bow are ignored)
Constant Ulong REGEXP_MATCH_PREV_AVAIL 		= 256
//Only replace the first match in std::regex_replace
Constant Ulong REGEXP_FORMAT_FIRST_ONLY 	= 4096
//Global match (Find only)
Constant Ulong REGEXP_MATCH_GLOBAL	 		= 65536

/*--- End Crypto ---*/

/*--- Zip ---*/

//Formats (ZipCompress/ZipUncompress:[format])
Constant Long ZIP_FORMAT_PFW 			= 0
Constant Long ZIP_FORMAT_GZIP 			= 1
Constant Long ZIP_FORMAT_ZLIB 			= 2
Constant Long ZIP_FORMAT_DEFAULT 	= ZIP_FORMAT_PFW

/*--- End Zip ---*/

/*--- Device Info ---*/

//Device types (n_devinfo::GetDevice/GetDevices/MatchDevice:[ntype])
Constant Long DEV_TYPE_HDD				= 0
Constant Long DEV_TYPE_MAC				= 1
Constant Long DEV_TYPE_CPUID			= 2
Constant Long DEV_TYPE_MAINBOARD		= 3
Constant Long DEV_TYPE_BIOS			= 4
Constant Long DEV_TYPE_IPV4			= 5
Constant Long DEV_TYPE_IPV6			= 6

/*--- End Device Info ---*/

/*--- Logger ---*/

//Log levels (n_logger::SetLevel[level])
Constant Ulong LOG_LEVEL_NONE			= 0
Constant Ulong LOG_LEVEL_ERROR		= 1
Constant Ulong LOG_LEVEL_WARNING		= 2
Constant Ulong LOG_LEVEL_INFO			= 4
Constant Ulong LOG_LEVEL_DEBUG		= 8
Constant Ulong LOG_LEVEL_CUSTOM		= 16
Constant Ulong LOG_LEVEL_ALL			= 4294967295
Constant Ulong LOG_LEVEL_DEFAULT		= LOG_LEVEL_ERROR + LOG_LEVEL_WARNING + LOG_LEVEL_INFO

//Clear flags (n_logger::Clear:[flags])
Constant Ulong LOG_CLEAR_FILE			= 1
Constant Ulong LOG_CLEAR_CONSOLE	= 2
Constant Ulong LOG_CLEAR_DEFAULT	= LOG_CLEAR_FILE + LOG_CLEAR_CONSOLE

/*--- End Logger ---*/

/*--- Compiler ---*/

//Compile types (n_compiler::Import:[ntype])
Constant Long CMP_TYPE_DATAWINDOW	= 1
Constant Long CMP_TYPE_FUNCTION			= 2
Constant Long CMP_TYPE_MENU				= 3
Constant Long CMP_TYPE_QUERY				= 4
Constant Long CMP_TYPE_STRUCTURE		= 5
Constant Long CMP_TYPE_USEROBJECT		= 6
Constant Long CMP_TYPE_WINDOW			= 7
Constant Long CMP_TYPE_PIPELINE			= 8
Constant Long CMP_TYPE_PROJECT			= 9
Constant Long CMP_TYPE_PROXYOBJECT	= 10

/*--- End Compiler ---*/

/*--- Barcode ---*/

//Options (n_barcode::GetOption/SetOption:[option])
Constant Long BARCODE_OPT_OUTPUT 	= 0 //output options
Constant Long BARCODE_OPT_ROWS		= 1 //number of rows (Codablock-F)
Constant Long BARCODE_OPT_COLUMNS	= 2 //the number of data columns in symbol
Constant Long BARCODE_OPT_VERSION	= 2 //symbol version (QR Code/Han Xin)
Constant Long BARCODE_OPT_SECURE		= 1 //error correction level
Constant Long BARCODE_OPT_MODE		= 1 //encoding mode (Maxicode/Composite)

//Option Values (n_barcode::SetOption:[val])
//output options (BARCODE_OPT_OUTPUT)
Constant Long BARCODE_OPTV_OUTPUT_READER_INIT	= 16 //create reader initialisation/programming symbol
Constant Long BARCODE_OPTV_OUTPUT_SMALL_TEXT		= 32 //use half-size text
Constant Long BARCODE_OPTV_OUTPUT_BOLD_TEXT 		= 64 //use bold text

//Unit types (n_barcode::GetUnit/SetUnit:[unit])
Constant Long BARCODE_UNIT_PIXEL		= 0
Constant Long BARCODE_UNIT_DIP		= 1
Constant Long BARCODE_UNIT_DEFAULT	= BARCODE_UNIT_PIXEL

//Generate SVG types (n_barcode::GenSvgString:[ntype])
Constant Long BARCODE_SVG_FULL		= 0
Constant Long BARCODE_SVG_INLINE		= 1
Constant Long BARCODE_SVG_DEFAULT	= BARCODE_SVG_FULL

//Generate Data types (n_barcode::GenDataString:[ntype])
Constant Long BARCODE_DATA_PNG		= 0 	//image/png
Constant Long BARCODE_DATA_JPEG		= 1	//image/jpeg
Constant Long BARCODE_DATA_GIF		= 2	//image/gif
Constant Long BARCODE_DATA_BMP		= 3	//image/bmp
Constant Long BARCODE_DATA_SVG		= 4	//image/svg+xml
Constant Long BARCODE_DATA_DEFAULT	= BARCODE_DATA_PNG

/*--- End Barcode ---*/

/*--- QR Code ---*/

//Ecc levels (n_qrcode::GetEcc/SetEcc:[ecl])
Constant Long QRCODE_ECC_AUTO 		= 0
Constant Long QRCODE_ECC_LOW 			= 1
Constant Long QRCODE_ECC_MEDIUM 		= 2
Constant Long QRCODE_ECC_QUARTILE 	= 3
Constant Long QRCODE_ECC_HIGH 		= 4
Constant Long QRCODE_ECC_DEFAULT 	= QRCODE_ECC_AUTO

//Unit types (n_qrcode::GetUnit/SetUnit:[unit])
Constant Long QRCODE_UNIT_PIXEL		= 0
Constant Long QRCODE_UNIT_DIP			= 1
Constant Long QRCODE_UNIT_DEFAULT	= QRCODE_UNIT_PIXEL

//Generate SVG types (n_qrcode::GenSvgString:[ntype])
Constant Long QRCODE_SVG_FULL		= 0
Constant Long QRCODE_SVG_INLINE	= 1
Constant Long QRCODE_SVG_PATH		= 2
Constant Long QRCODE_SVG_DEFAULT	= QRCODE_SVG_FULL

//Generate Data types (n_qrcode::GenDataString:[ntype])
Constant Long QRCODE_DATA_PNG			= 0 	//image/png
Constant Long QRCODE_DATA_JPEG		= 1	//image/jpeg
Constant Long QRCODE_DATA_GIF			= 2	//image/gif
Constant Long QRCODE_DATA_BMP			= 3	//image/bmp
Constant Long QRCODE_DATA_SVG			= 4	//image/svg+xml
Constant Long QRCODE_DATA_DEFAULT	= QRCODE_DATA_PNG

/*--- End QR Code ---*/

/*--- File Scanner ---*/

//Scan flags
Constant Ulong FILE_SCANNER_SORT_ASC	= 65536
Constant Ulong FILE_SCANNER_SORT_DESC	= 131072

/*--- End File Scanner ---*/

/*--- Camera Capture ---*/

//Image file format
Constant Long IMAGE_FILE_FORMAT_JPEG= 0
Constant Long IMAGE_FILE_FORMAT_PNG	= 1
Constant Long IMAGE_FILE_FORMAT_GIF	= 2
Constant Long IMAGE_FILE_FORMAT_BMP	= 3

/*--- End Camera Capture ---*/

/*--- Pinyin ---*/

//PinyinFirstLetterLike:[flags]
constant long PY_LIKE_IGNORE_CASE	= 1	//忽略大小写
constant long PY_LIKE_IGNORE_WIDTH	= 2	//忽略全角半角
constant long PY_LIKE_FUZZY_SOUND	= 4	//匹配模糊发音（l=n，f=h，r=l）

/*--- End Pinyin ---*/
end variables

on enums.create
call super::create
TriggerEvent( this, "constructor" )
end on

on enums.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

