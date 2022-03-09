$PBExportHeader$n_cst_dwsvc_contextmenu.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_dwsvc_contextmenu from n_cst_dwsvc
end type
type menuitemdata from structure within n_cst_dwsvc_contextmenu
end type
type theme from n_cst_popupmenu_theme within n_cst_dwsvc_contextmenu
end type
end forward

type menuitemdata from structure
	boolean		enabled
	string		text
	string		image
	string		tiptext
	unsignedlong		id
	n_cst_popupmenu		submenu
	boolean		split
	boolean		menuowner
end type

global type n_cst_dwsvc_contextmenu from n_cst_dwsvc
event onrbuttonup pbm_dwnrbuttonup
event onrbuttondown pbm_dwnrbuttondown
event onrbuttonclicked ( integer xpos,  integer ypos,  long row,  dwobject dwo )
event ondefproc ( long row,  dwobject dwo,  long mid )
event type long onprepare ( long row,  dwobject dwo )
theme theme
end type
global n_cst_dwsvc_contextmenu n_cst_dwsvc_contextmenu

type variables
/* 常量 */
public:
//菜单预定义ID
constant ulong MID_RESERVED 			= 10000	//保留的开始ID
constant ulong MID_COLAUTOWIDTH		= 10000	//自动列宽
constant ulong MID_COLAUTOWIDTH_ALL	= 10001	//自动列宽（所有列）
constant ulong MID_COLCHECK			= 10002	//勾选整列
constant ulong MID_COLUNCHECK			= 10003 	//清除勾选整列
constant ulong MID_COLREVERTCHECK	= 10004	//反勾选整列
constant ulong MID_COLCOPY				= 10005	//复制整列值
constant ulong MID_COLPASTE			= 10006	//拷贝粘帖板数据覆盖到整列
constant ulong MID_ITEMCOPY			= 10007	//复制单元格值

/* 属性 */
public:
boolean #ColAutoWidth= true	//自动列宽
boolean #ColCheck		= true	//勾选整列/清除勾选整列
boolean #ColCopy		= true	//复制整列值
boolean #ColPaste		= true	//拷贝粘帖板数据覆盖到整列
boolean #ItemCopy		= true	//复制单元格值

/* 实现 */
private:
MENUITEMDATA Items[]		//添加的自定义菜单项
long _nRowRButtonDown	//右键按下的行（用于产生RButtonClicked事件）

string _sColClicked
string _sClipText

constant real ARROW_BTN_WIDTH = 18
//Props
constant string PRP_POPUPMENUCREATOR = "{DWSVC_POPUPMENU_CREATOR}"
end variables

forward prototypes
private function boolean _of_isallowpopup (readonly long row, readonly dwobject dwo)
public function integer of_addmenu (readonly string text, readonly string image, readonly string tiptext, readonly boolean enabled, readonly unsignedlong id)
public function integer of_addmenu (readonly string text, readonly string image, readonly unsignedlong id)
public function integer of_addmenu (readonly string text, readonly string image, readonly boolean enabled, readonly unsignedlong id)
public function integer of_addseparator ()
public function integer of_addmenu (readonly string text, readonly string image, readonly string tiptext, readonly unsignedlong id)
public function integer of_getindex (readonly string text)
public function ulong of_getid (readonly integer index)
public function integer of_getindex (readonly unsignedlong id)
public function long of_remove (readonly unsignedlong id, readonly boolean byposition)
public function long of_setimage (readonly unsignedlong id, readonly boolean byposition, readonly string image)
public function long of_settext (readonly unsignedlong id, readonly boolean byposition, readonly string text)
public function long of_settiptext (readonly unsignedlong id, readonly boolean byposition, readonly string tiptext)
public function long of_removeall ()
public function integer of_getcount ()
public function long of_enable (readonly unsignedlong id, readonly boolean byposition, readonly boolean enable)
public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly string tiptext, readonly boolean enabled, readonly unsignedlong id)
public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly boolean enabled, readonly unsignedlong id)
public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly string tiptext, readonly unsignedlong id)
public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly unsignedlong id)
public function integer of_insertseparator (readonly unsignedlong idinsert, readonly boolean byposition)
private function long _of_copycolumn2clipboard (readonly string colname)
public function string of_gettext (readonly unsignedlong id, readonly boolean byposition)
public function string of_gettiptext (readonly unsignedlong id, readonly boolean byposition)
public function string of_getimage (readonly unsignedlong id, readonly boolean byposition)
public function boolean of_isenabled (readonly unsignedlong id, readonly boolean byposition)
private function long _of_copyitem2clipboard (readonly long row, readonly string colname)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id)
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu, readonly string clsname)
private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled, readonly unsignedlong id)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled, readonly unsignedlong id)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id)
public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id)
public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id)
public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean enabled, readonly boolean split, readonly unsignedlong id)
public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id)
public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id)
public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id)
public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly boolean enabled, readonly boolean split, readonly unsignedlong id)
public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id)
public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id)
public function long of_getsubmenu (readonly unsignedlong id, readonly boolean byposition, ref n_cst_popupmenu popupmenu)
private function long _of_checkcolumn (readonly string colname)
private function long _of_revertcheckcolumn (readonly string colname)
private function long _of_uncheckcolumn (readonly string colname)
private function long _of_paste2column (readonly string colname, readonly string data)
private function long _of_columnautowidth ()
private function long _of_columnautowidth (readonly string colname)
public function ulong of_getid (readonly string text)
end prototypes

event onrbuttonup;if row = _nRowRButtonDown then
	Event OnRButtonClicked(xpos,ypos,row,dwo)
end if
_nRowRButtonDown = 0

return 0
end event

event onrbuttondown;_nRowRButtonDown = row
return 0
end event

event onrbuttonclicked(integer xpos, integer ypos, long row, dwobject dwo);long rtCode
int nIndex,nCount
boolean bLastIsSeparator,bHasMenu
string sEmptyArr[]
n_cst_popupmenu pmMenu
RECT wndRect

if Not _of_IsAllowPopup(row,dwo) then return

try
	if Event OnPrepare(row,dwo) = 1 then return
	if #DataWindow.Event OnInitContextMenu(row,dwo) = 1 then return
	
	nCount = UpperBound(Items)
	if nCount = 0 then return
	
	pmMenu = Create n_cst_popupmenu
	pmMenu.of_SetToolTip(true)
	pmMenu.theme.of_SetTheme(theme)
	
	for nIndex = 1 to nCount
		if Not #ColCheck then
			if Items[nIndex].id = MID_COLCHECK or Items[nIndex].id = MID_COLUNCHECK then continue
		end if
		if Not #ColCopy then
			if Items[nIndex].id = MID_COLCOPY then continue
		end if
		if Not #ColPaste then
			if Items[nIndex].id = MID_COLPASTE then continue
		end if
		if Not #ItemCopy then
			if Items[nIndex].id = MID_ITEMCOPY then continue
		end if
		if Items[nIndex].Text = "-" then
			bLastIsSeparator = true
			continue
		end if
		if bLastIsSeparator then
			bLastIsSeparator = false
			if bHasMenu then
				pmMenu.of_AddSeparator()
			end if
		end if
		if IsValidObject(Items[nIndex].subMenu) then
			pmMenu.of_AddSubMenu(Items[nIndex].subMenu,Items[nIndex].Text, Items[nIndex].Image,Items[nIndex].TipText,Items[nIndex].split,Items[nIndex].Enabled,Items[nIndex].ID)
		else
			pmMenu.of_AddMenu(Items[nIndex].Text, Items[nIndex].Image,Items[nIndex].TipText,Items[nIndex].Enabled,Items[nIndex].ID)
		end if
		bHasMenu = true
	next
	
	Win32.GetWindowRect(#DataWindow.#Handle,ref wndRect)
	
	rtCode = pmMenu.of_Popup(P2DX(wndRect.left + xpos),P2DY(wndRect.top + ypos))
	
	Destroy pmMenu
	
	if rtCode = 0 then return
	if #DataWindow.Event OnContextMenu(row,dwo,rtCode) = 1 then return
	
	Event OnDefProc(row,dwo,rtCode)
finally
	_sColClicked = ""
	_sClipText = ""
	of_RemoveAll()
end try
end event

event ondefproc(long row, dwobject dwo, long mid);choose case mid
	case MID_COLAUTOWIDTH
		_of_ColumnAutoWidth(_sColClicked)
	case MID_COLAUTOWIDTH_ALL
		_of_ColumnAutoWidth()
	case MID_COLCHECK
		_of_CheckColumn(_sColClicked)
	case MID_COLUNCHECK
		_of_UncheckColumn(_sColClicked)
	case MID_COLREVERTCHECK
		_of_RevertCheckColumn(_sColClicked)
	case MID_COLPASTE
		_of_Paste2Column(_sColClicked,_sClipText)
	case MID_COLCOPY
		_of_CopyColumn2Clipboard(_sColClicked)
	case MID_ITEMCOPY
		_of_CopyItem2Clipboard(row,String(dwo.name))
end choose
end event

event type long onprepare(long row, dwobject dwo);string sBand,sText
long nStyle,nIndex,nCount,nPos
boolean bHeaderClicked,bColClicked,bColEditable
boolean bShowColset
datawindowchild dwc
n_cst_popupmenu pmSub

nStyle = _of_GetStyle()

sBand = #DataWindow.GetBandAtPointer()
sBand = Left(sBand,Pos(sBand,"~t") - 1)
if sBand = "background" or sBand = "foreground" then
	if #DataWindow.PointerY() < Long(#DataWindow.Describe("DataWindow.Header.Height")) then
		sBand = "header"
	end if
end if

if #ItemCopy then
	if row > 0 and (dwo.Type = "column" or dwo.Type = "compute") then
		of_AddMenu(I18N(ne_cst_i18n.CAT_DWSVC,"复制单元格"),"Copy!",I18N(ne_cst_i18n.CAT_DWSVC,"复制单元格值"),MID_ITEMCOPY)
		return 0
	elseif dwo.Type = "compute" then
		if sBand <> "header" and sBand <> "foreground" and sBand <> "background" then
			of_AddMenu(I18N(ne_cst_i18n.CAT_DWSVC,"复制"),"Copy!",I18N(ne_cst_i18n.CAT_DWSVC,"复制值"),MID_ITEMCOPY)
			return 0
		end if
	end if
end if

bHeaderClicked = (sBand = "header")
if bHeaderClicked then
	//按标题取列名
	if Right(String(dwo.name),2) = "_t" then
		_sColClicked = Left(dwo.name,Len(String(dwo.name)) - 2)
		choose case #DataWindow.Describe(_sColClicked + ".Type")
			case "column","compute"
				bColClicked = true
				bColEditable = (_of_IsEditable() and _of_IsColumnEditable(_sColClicked))
			case else
				_sColClicked = ""
		end choose
	end if
end if

if #ColAutoWidth then
	if nStyle = STYLE_GRID then
		of_AddSeparator()
		if bColClicked then
			of_AddSubMenu("n_cst_popupmenu",I18N(ne_cst_i18n.CAT_DWSVC,"自动列宽"),"SizeHorizontal!",I18N(ne_cst_i18n.CAT_DWSVC,"自动调整列宽度"),true,MID_COLAUTOWIDTH)
			of_GetSubMenu(MID_COLAUTOWIDTH,false,ref pmSub)
			pmSub.of_AddMenu(I18N(ne_cst_i18n.CAT_DWSVC,"所有列"),"",I18N(ne_cst_i18n.CAT_DWSVC,"自动调整所有列宽度"),MID_COLAUTOWIDTH_ALL)
		elseif bHeaderClicked then
			of_AddMenu(I18N(ne_cst_i18n.CAT_DWSVC,"自动列宽"),"SizeHorizontal!",I18N(ne_cst_i18n.CAT_DWSVC,"自动调整所有列宽度"),MID_COLAUTOWIDTH_ALL)
		end if
	end if
end if

if /*nStyle = STYLE_GRID and */bColClicked then
	of_AddSeparator()
	if #ColCheck then
		if bColEditable and #DataWindow.RowCount() > 0 then
			choose case #DataWindow.Describe(_sColClicked + ".edit.style")
				case "checkbox"
					of_AddMenu(I18N(ne_cst_i18n.CAT_DWSVC,"勾选列"),"",I18N(ne_cst_i18n.CAT_DWSVC,"勾选整列"),MID_COLCHECK)
					of_AddMenu(I18N(ne_cst_i18n.CAT_DWSVC,"清除勾选列"),"",I18N(ne_cst_i18n.CAT_DWSVC,"清除勾选整列"),MID_COLUNCHECK)
					of_AddMenu(I18N(ne_cst_i18n.CAT_DWSVC,"反向勾选列"),"",I18N(ne_cst_i18n.CAT_DWSVC,"反向勾选整列"),MID_COLREVERTCHECK)
			end choose
		end if
	end if
	of_AddSeparator()
	if #ColCopy then
		of_AddMenu(I18N(ne_cst_i18n.CAT_DWSVC,"复制列"),"Copy!",I18N(ne_cst_i18n.CAT_DWSVC,"复制整列的数据"),MID_COLCOPY)
	end if
	if #ColPaste then
		if bColEditable /*and #DataWindow.RowCount() > 0*/ then
			_sClipText = Clipboard()
			if _sClipText <> "" then
				of_AddMenu(I18N(ne_cst_i18n.CAT_DWSVC,"粘贴列"),"Paste!",I18N(ne_cst_i18n.CAT_DWSVC,"拷贝粘帖板数据覆盖到整列"),MID_COLPASTE)
			end if
		end if
	end if
end if

return 0
end event

private function boolean _of_isallowpopup (readonly long row, readonly dwobject dwo);string sName,sType,sEditStyle,sProp

if row <= 0 then return true
if Not IsValidObject(dwo) then return false

sName = dwo.Name

sType = #DataWindow.Describe(sName+".type")
//if sType = "datawindow" then return false
if sType <> "column" then return true
if #DataWindow.GetRow() <> row then return true
if #DataWindow.GetColumnName() <> sName then return true
if Not _of_IsEditable() then return true
sProp = #DataWindow.Describe(sName + ".TabSequence")
if sProp = "0" or sProp = "32766" then return true
if _of_IsColumnProtected(sName) then return true

sEditStyle = #DataWindow.Describe(sName+".edit.style")
choose case sEditStyle
	case "edit","editmask"
		return false
	case "dddw"
		sProp = #DataWindow.Describe(sName+".dddw.allowedit")
		return (sProp <> "yes")
	case "ddlb"
		sProp = #DataWindow.Describe(sName+".ddlb.allowedit")
		return (sProp <> "yes")
end choose

return true
end function

public function integer of_addmenu (readonly string text, readonly string image, readonly string tiptext, readonly boolean enabled, readonly unsignedlong id);return of_InsertMenu(UpperBound(Items) + 1,true,text,image,tipText,enabled,id)
end function

public function integer of_addmenu (readonly string text, readonly string image, readonly unsignedlong id);return of_AddMenu(text,image,"",true,id)
end function

public function integer of_addmenu (readonly string text, readonly string image, readonly boolean enabled, readonly unsignedlong id);return of_AddMenu(text,image,"",enabled,id)
end function

public function integer of_addseparator ();return of_InsertSeparator(UpperBound(Items) + 1,true)
end function

public function integer of_addmenu (readonly string text, readonly string image, readonly string tiptext, readonly unsignedlong id);return of_AddMenu(text,image,tipText,true,id)
end function

public function integer of_getindex (readonly string text);int nIndex

for nIndex = UpperBound(Items) to 1 step -1
	if Items[nIndex].text = text then return nIndex
next

return 0
end function

public function ulong of_getid (readonly integer index);int nIndex

if index < 1 or index > UpperBound(Items) then return 0

return Items[nIndex].id
end function

public function integer of_getindex (readonly unsignedlong id);int nIndex

for nIndex = UpperBound(Items) to 1 step -1
	if Items[nIndex].id = id then return nIndex
next

return 0
end function

public function long of_remove (readonly unsignedlong id, readonly boolean byposition);int nIndex,nCount
MENUITEMDATA newItems[]

nCount = UpperBound(Items)
for nIndex = 1 to nCount
	if (byPosition and nIndex = id) or &
		(Not byPosition and Items[nIndex].id = id)then
		if Items[nIndex].menuOwner then
			Destroy Items[nIndex].subMenu
		end if
		continue
	else
		newItems[UpperBound(newItems) + 1] = Items[nIndex]
	end if
next

Items = newItems

return RetCode.OK
end function

public function long of_setimage (readonly unsignedlong id, readonly boolean byposition, readonly string image);int nIndex

if byPosition then
	nIndex = id
else
	nIndex = of_GetIndex(id)
end if
if nIndex < 1 or nIndex > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[nIndex].image = image

return RetCode.OK
end function

public function long of_settext (readonly unsignedlong id, readonly boolean byposition, readonly string text);int nIndex

if byPosition then
	nIndex = id
else
	nIndex = of_GetIndex(id)
end if
if nIndex < 1 or nIndex > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[nIndex].text = text

return RetCode.OK
end function

public function long of_settiptext (readonly unsignedlong id, readonly boolean byposition, readonly string tiptext);int nIndex

if byPosition then
	nIndex = id
else
	nIndex = of_GetIndex(id)
end if
if nIndex < 1 or nIndex > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[nIndex].tipText = tipText

return RetCode.OK
end function

public function long of_removeall ();int nIndex,nCount
MENUITEMDATA emptyItems[]

nCount = UpperBound(Items)
for nIndex = 1 to nCount
	if Items[nIndex].menuOwner then
		Destroy Items[nIndex].subMenu
	end if
next

Items = emptyItems

return RetCode.OK
end function

public function integer of_getcount ();return UpperBound(Items)
end function

public function long of_enable (readonly unsignedlong id, readonly boolean byposition, readonly boolean enable);int nIndex

if byPosition then
	nIndex = id
else
	nIndex = of_GetIndex(id)
end if
if nIndex < 1 or nIndex > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

Items[nIndex].enabled = enable

return RetCode.OK
end function

public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly string tiptext, readonly boolean enabled, readonly unsignedlong id);int nIndex,i
MENUITEMDATA newItem

if text = "" then return 0
if byPosition then
	nIndex = idInsert
else
	nIndex = of_GetIndex(idInsert)
end if
if nIndex < 1 or nIndex > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

newItem.enabled = enabled
newItem.text = text
newItem.image = image
newItem.tipText = tipText
newItem.id = id

for i = UpperBound(Items) + 1 to nIndex + 1 step -1
	Items[i] = Items[i - 1]
next
Items[nIndex] = newItem

return nIndex
end function

public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly boolean enabled, readonly unsignedlong id);return of_InsertMenu(idInsert,byPosition,text,image,"",enabled,id)
end function

public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly string tiptext, readonly unsignedlong id);return of_InsertMenu(idInsert,byPosition,text,image,tipText,true,id)
end function

public function integer of_insertmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string text, readonly string image, readonly unsignedlong id);return of_InsertMenu(idInsert,byPosition,text,image,"",true,id)
end function

public function integer of_insertseparator (readonly unsignedlong idinsert, readonly boolean byposition);return of_InsertMenu(idInsert,byPosition,"-","",true,0)
end function

private function long _of_copycolumn2clipboard (readonly string colname);long nRow,nRowCnt
string sValString,sVal,sValOn,sValOff
boolean bCheckbox,bCompute

if colName = "" then return RetCode.E_INVALID_ARGUMENT
if #DataWindow.AcceptText() = -1 then return RetCode.FAILED

if #DataWindow.Describe(colName+".edit.style") = "checkbox" then
	bCheckbox = true
	sValOn = #DataWindow.Describe(colName+".checkbox.on")
	sValOff = #DataWindow.Describe(colName+".checkbox.off")
end if
bCompute = (#DataWindow.Describe(colName+".type") = "compute")

nRowCnt = #DataWindow.RowCount()
for nRow = 1 to nRowCnt
	if Not _of_IsItemVisible(nRow,colName) then
		sVal = ""
	else
		if bCheckbox then
			sVal = #DataWindow.Describe("Evaluate('"+colName+"',"+String(nRow)+")")
			if sVal = sValOn then
				sVal = "Y"
			elseif sVal = sValOff then
				sVal = "N"
			end if
		elseif bCompute then
			sVal = #DataWindow.Describe("Evaluate('"+colName+"',"+String(nRow)+")")
		else
			sVal = #DataWindow.Describe("Evaluate('LookUpDisplay("+colName+")',"+string(nRow)+")")
		end if
	end if
	sValString += sVal + "~r~n"
next

Clipboard(sValString)

return RetCode.OK
end function

public function string of_gettext (readonly unsignedlong id, readonly boolean byposition);int nIndex

if byPosition then
	nIndex = id
else
	nIndex = of_GetIndex(id)
end if
if nIndex < 1 or nIndex > UpperBound(Items) then return ""

return Items[nIndex].text
end function

public function string of_gettiptext (readonly unsignedlong id, readonly boolean byposition);int nIndex

if byPosition then
	nIndex = id
else
	nIndex = of_GetIndex(id)
end if
if nIndex < 1 or nIndex > UpperBound(Items) then return ""

return Items[nIndex].tipText
end function

public function string of_getimage (readonly unsignedlong id, readonly boolean byposition);int nIndex

if byPosition then
	nIndex = id
else
	nIndex = of_GetIndex(id)
end if
if nIndex < 1 or nIndex > UpperBound(Items) then return ""

return Items[nIndex].image
end function

public function boolean of_isenabled (readonly unsignedlong id, readonly boolean byposition);int nIndex

if byPosition then
	nIndex = id
else
	nIndex = of_GetIndex(id)
end if
if nIndex < 1 or nIndex > UpperBound(Items) then return false

return Items[nIndex].enabled
end function

private function long _of_copyitem2clipboard (readonly long row, readonly string colname);string sVal,sValOn,sValOff
boolean bCheckbox,bCompute

if row <= 0 then return RetCode.E_INVALID_ARGUMENT
if colName = "" then return RetCode.E_INVALID_ARGUMENT
if #DataWindow.AcceptText() = -1 then return RetCode.FAILED

if #DataWindow.Describe(colName+".edit.style") = "checkbox" then
	bCheckbox = true
	sValOn = #DataWindow.Describe(colName+".checkbox.on")
	sValOff = #DataWindow.Describe(colName+".checkbox.off")
end if
bCompute = (#DataWindow.Describe(colName+".type") = "compute")

if bCheckbox then
	sVal = #DataWindow.Describe("Evaluate('"+colName+"',"+String(row)+")")
	if sVal = sValOn then
		sVal = "Y"
	elseif sVal = sValOff then
		sVal = "N"
	end if
elseif bCompute then
	sVal = #DataWindow.Describe("Evaluate('"+colName+"',"+String(row)+")")
else
	sVal = #DataWindow.Describe("Evaluate('LookUpDisplay("+colName+")',"+string(row)+")")
end if

Clipboard(sVal)

return RetCode.OK
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id);int nIndex,i
MENUITEMDATA newItem

if text = "" then return 0
if byPosition then
	nIndex = idInsert
else
	nIndex = of_GetIndex(idInsert)
end if
if nIndex < 1 or nIndex > UpperBound(Items) + 1 then return RetCode.E_OUT_OF_RANGE

if Not IsValidObject(popupmenu) then
	if Not _of_CreatePopupMenu(ref popupmenu) then return RetCode.E_INVALID_OBJECT
	newItem.menuOwner = true
	PopupMenu.#Tag = ""
elseif PopupMenu.#Tag = PRP_POPUPMENUCREATOR then
	newItem.menuOwner = true
	PopupMenu.#Tag = ""
end if

newItem.enabled = enabled
newItem.text = text
newItem.image = image
newItem.tipText = tipText
newItem.id = id
newItem.subMenu = PopupMenu
newItem.split = split

for i = UpperBound(Items) + 1 to nIndex + 1 step -1
	Items[i] = Items[i - 1]
next
Items[nIndex] = newItem

return nIndex
end function

private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu, readonly string clsname);n_cst_popupmenu pm

try
	if clsName = "" then
		pm = Create n_cst_popupmenu
	else
		pm = Create Using clsName
	end if
	popupmenu = pm
	popupmenu.#Tag = PRP_POPUPMENUCREATOR
	popupmenu.of_SetToolTip(true)
	return true
catch(Throwable ex)
	if IsValidObject(pm) then
		Destroy pm
	end if
	return false
end try
end function

private function boolean _of_createpopupmenu (ref n_cst_popupmenu popupmenu);return _of_CreatePopupMenu(ref popupmenu,"")
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled, readonly unsignedlong id);return of_InsertSubMenu(idInsert,byPosition,ref popupmenu,text,image,"",split,enabled,id)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id);return of_InsertSubMenu(idInsert,byPosition,ref popupmenu,text,image,tipText,split,true,id)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id);return of_InsertSubMenu(idInsert,byPosition,ref popupmenu,text,image,"",split,true,id)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id);long rtCode
n_cst_popupmenu popupMenu

if Not _of_CreatePopupMenu(ref popupMenu,clsName) then return RetCode.E_INVALID_TYPE

rtCode = of_InsertSubMenu(idInsert,byPosition,ref popupMenu,text,image,tipText,split,enabled,ID)

if rtCode <= 0 then
	Destroy popupMenu
end if

return rtCode
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly boolean enabled, readonly unsignedlong id);return of_InsertSubMenu(idInsert,byPosition,clsName,text,image,"",split,enabled,id)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id);return of_InsertSubMenu(idInsert,byPosition,clsName,text,image,"",split,true,id)
end function

public function integer of_insertsubmenu (readonly unsignedlong idinsert, readonly boolean byposition, readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id);return of_InsertSubMenu(idInsert,byPosition,clsName,text,image,tipText,split,true,id)
end function

public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id);return of_InsertSubMenu(UpperBound(Items) + 1,true,ref popupmenu,text,image,tipText,split,enabled,id)
end function

public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean enabled, readonly boolean split, readonly unsignedlong id);return of_AddSubMenu(ref popupmenu,text,image,"",split,enabled,id)
end function

public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id);return of_AddSubMenu(ref popupmenu,text,image,tipText,split,true,id)
end function

public function integer of_addsubmenu (ref n_cst_popupmenu popupmenu, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id);return of_AddSubMenu(ref popupmenu,text,image,"",split,true,id)
end function

public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly boolean enabled, readonly unsignedlong id);return of_InsertSubMenu(UpperBound(Items) + 1,true,clsName,text,image,tipText,split,enabled,id)
end function

public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly boolean enabled, readonly boolean split, readonly unsignedlong id);return of_AddSubMenu(clsName,text,image,"",split,enabled,id)
end function

public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly boolean split, readonly unsignedlong id);return of_AddSubMenu(clsName,text,image,"",split,true,id)
end function

public function integer of_addsubmenu (readonly string clsname, readonly string text, readonly string image, readonly string tiptext, readonly boolean split, readonly unsignedlong id);return of_AddSubMenu(clsName,text,image,tipText,split,true,id)
end function

public function long of_getsubmenu (readonly unsignedlong id, readonly boolean byposition, ref n_cst_popupmenu popupmenu);int nIndex

if byPosition then
	nIndex = id
else
	nIndex = of_GetIndex(id)
end if
if nIndex < 1 or nIndex > UpperBound(Items) then return RetCode.E_OUT_OF_BOUND

try
	popupMenu = Items[nIndex].subMenu
catch(Throwable ex)
	return RetCode.E_INVALID_ARGUMENT
end try

return iif(IsValidObject(popupMenu),RetCode.OK,RetCode.E_INVALID_OBJECT)
end function

private function long _of_checkcolumn (readonly string colname);long nRow,nRowCnt
long nColType
string sVal
boolean bRedraw
dwobject dwo

if colName = "" then return RetCode.E_INVALID_ARGUMENT

sVal = #DataWindow.Describe(colName+".checkbox.on")
if sVal = "!" or sVal = "?" then return RetCode.FAILED

dwo = _of_GetDWObject(colName)
nColType = _of_GetColumnType(colName)

try
	nRowCnt = #DataWindow.RowCount()
	for nRow = 1 to nRowCnt
		if Not _of_IsItemVisible(nRow,colName) then continue
		if _of_IsItemProtected(nRow,colName) then continue
		choose case nColType
			case COL_TYPE_DECIMAL
				if String(#DataWindow.GetItemDecimal(nRow,colName)) = sVal then continue
			case COL_TYPE_INTEGER
				if String(#DataWindow.GetItemNumber(nRow,colName)) = sVal then continue
			case else
				if #DataWindow.GetItemString(nRow,colName) = sVal then continue
		end choose
		if #DataWindow.Event OnDoItemChange(nRow,dwo,sVal) <> 0 then
			MessageBoxEx(Sprintf(I18N(ne_cst_i18n.CAT_DWSVC,"第{}行"),nRow) + "~n" + I18N(ne_cst_i18n.CAT_DWSVC,"修改数据被拒绝") + "!",StopSign!)
			return RetCode.FAILED
		end if
		if Not bRedraw then
			bRedraw = true
			#DataWindow.SetRedraw(false)
		end if
		choose case nColType
			case COL_TYPE_DECIMAL
				#DataWindow.SetItem(nRow,colName,Dec(sVal))
			case COL_TYPE_INTEGER
				#DataWindow.SetItem(nRow,colName,Long(sVal))
			case else
				#DataWindow.SetItem(nRow,colName,sVal)
		end choose
		#DataWindow.Event OnDoItemChanged(nRow,dwo)
	next
finally
	if bRedraw then
		#DataWindow.SetRedraw(true)
	end if
end try

return RetCode.OK
end function

private function long _of_revertcheckcolumn (readonly string colname);long nRow,nRowCnt
long nColType
string sVal,sOn,sOff
boolean bRedraw
dwobject dwo

if colName = "" then return RetCode.E_INVALID_ARGUMENT

sOn = #DataWindow.Describe(colName+".checkbox.on")
if sOn = "!" or sOn = "?" then return RetCode.FAILED
sOff = #DataWindow.Describe(colName+".checkbox.off")
if sOff = "!" or sOff = "?" then return RetCode.FAILED

dwo = _of_GetDWObject(colName)
nColType = _of_GetColumnType(colName)

try
	nRowCnt = #DataWindow.RowCount()
	for nRow = 1 to nRowCnt
		if Not _of_IsItemVisible(nRow,colName) then continue
		if _of_IsItemProtected(nRow,colName) then continue
		choose case nColType
			case COL_TYPE_DECIMAL
				if String(#DataWindow.GetItemDecimal(nRow,colName)) = sOn then
					sVal = sOff
				else
					sVal = sOn
				end if
			case COL_TYPE_INTEGER
				if String(#DataWindow.GetItemNumber(nRow,colName)) = sOn then
					sVal = sOff
				else
					sVal = sOn
				end if
			case else
				if #DataWindow.GetItemString(nRow,colName) = sOn then
					sVal = sOff
				else
					sVal = sOn
				end if
		end choose
		if #DataWindow.Event OnDoItemChange(nRow,dwo,sVal) <> 0 then
			MessageBoxEx(Sprintf(I18N(ne_cst_i18n.CAT_DWSVC,"第{}行"),nRow) + "~n" + I18N(ne_cst_i18n.CAT_DWSVC,"修改数据被拒绝") + "!",StopSign!)
			return RetCode.FAILED
		end if
		if Not bRedraw then
			bRedraw = true
			#DataWindow.SetRedraw(false)
		end if
		choose case nColType
			case COL_TYPE_DECIMAL
				#DataWindow.SetItem(nRow,colName,Dec(sVal))
			case COL_TYPE_INTEGER
				#DataWindow.SetItem(nRow,colName,Long(sVal))
			case else
				#DataWindow.SetItem(nRow,colName,sVal)
		end choose
		#DataWindow.Event OnDoItemChanged(nRow,dwo)
	next
finally
	if bRedraw then
		#DataWindow.SetRedraw(true)
	end if
end try

return RetCode.OK
end function

private function long _of_uncheckcolumn (readonly string colname);long nRow,nRowCnt
string sVal,sColType
boolean bRedraw
dwobject dwo

if colName = "" then return RetCode.E_INVALID_ARGUMENT

sVal = #DataWindow.Describe(colName+".checkbox.off")
if sVal = "!" or sVal = "?" then return RetCode.FAILED

dwo = _of_GetDWObject(colName)
sColType = Left(#DataWindow.Describe(colName+".ColType"),5)

try
	nRowCnt = #DataWindow.RowCount()
	for nRow = 1 to nRowCnt
		if Not _of_IsItemVisible(nRow,colName) then continue
		if _of_IsItemProtected(nRow,colName) then continue
		choose case sColType
			case "decim","real"
				if String(#DataWindow.GetItemDecimal(nRow,colName)) = sVal then continue
			case "numbe","long","ulong"
				if String(#DataWindow.GetItemNumber(nRow,colName)) = sVal then continue
			case else
				if #DataWindow.GetItemString(nRow,colName) = sVal then continue
		end choose
		if #DataWindow.Event OnDoItemChange(nRow,dwo,sVal) <> 0 then
			MessageBoxEx(Sprintf(I18N(ne_cst_i18n.CAT_DWSVC,"第{}行"),nRow) + "~n" + I18N(ne_cst_i18n.CAT_DWSVC,"修改数据被拒绝") + "!",StopSign!)
			return RetCode.FAILED
		end if
		if Not bRedraw then
			bRedraw = true
			#DataWindow.SetRedraw(false)
		end if
		choose case sColType
			case "decim","real"
				#DataWindow.SetItem(nRow,colName,Dec(sVal))
			case "numbe","long","ulong"
				#DataWindow.SetItem(nRow,colName,Long(sVal))
			case else
				#DataWindow.SetItem(nRow,colName,sVal)
		end choose
		#DataWindow.Event OnDoItemChanged(nRow,dwo)
	next
finally
	if bRedraw then
		#DataWindow.SetRedraw(true)
	end if
end try

return RetCode.OK
end function

private function long _of_paste2column (readonly string colname, readonly string data);long nRow,nRowCnt,nCount,nColType
string sVal,sVals[],sProp
boolean bEmptyStringIsNull,bTranslation,bEnumValue
datetime dttEmpty
boolean bRedraw
dwobject dwo
n_map mapValue

if colName = "" or data = "" then return RetCode.E_INVALID_ARGUMENT

nCount = _of_SplitString(data,"~r~n",ref sVals,false)
if nCount = 0 then return RetCode.E_INVALID_ARGUMENT

dwo = _of_GetDWObject(colName)
nColType = _of_GetColumnType(colName)
if nColType = COL_TYPE_UNKNOWN then return RetCode.FAILED

if #DataWindow.Describe(colName+".edit.NilIsNull") = "yes" then
	bEmptyStringIsNull =  true
elseif #DataWindow.Describe(colName+".dddw.NilIsNull") = "yes" then
	bEmptyStringIsNull =  true
elseif #DataWindow.Describe(colName+".ddlb.NilIsNull") = "yes" then
	bEmptyStringIsNull =  true
end if

sProp = #DataWindow.Describe(colName+".dddw.name")
if sProp <> "!" and sProp <> "?" then			//DDDW
	bTranslation = (#DataWindow.Describe(colName+".dddw.displaycolumn") <> #DataWindow.Describe(colName+".dddw.datacolumn"))
	sProp = #DataWindow.Describe(colName+".dddw.allowedit")
	bEnumValue = (sProp = "no")
else
	sProp = #DataWindow.Describe(colName+".ddlb.case")
	if sProp <> "!" and sProp <> "?" then		//DDLB
		bTranslation = true
		sProp = #DataWindow.Describe(colName+".ddlb.allowedit")
		bEnumValue = (sProp = "no")
	else
		sProp = #DataWindow.Describe(colName+".edit.style")
		if sProp = "radiobuttons" or sProp = "checkbox" then		//RadiosButtons/CheckBox
			bTranslation = true
			bEnumValue = true
		end if
	end if
end if
if bTranslation or bEnumValue then
	mapValue = _of_GetColumnValueMap(colName)
end if

nRowCnt = #DataWindow.RowCount()

try
	for nRow = 1 to nCount
		if nRow > nRowCnt then
			if Not bRedraw then
				bRedraw = true
				#DataWindow.SetRedraw(false)
			end if
			if #DataWindow.InsertRow(0) <= 0 then return RetCode.FAILED
			nRowCnt ++
		end if
		if Not _of_IsItemVisible(nRow,colName) then continue
		if _of_IsItemProtected(nRow,colName) then continue
		sVal = sVals[nRow]
		if bTranslation or bEnumValue then
			if mapValue.Exists(sVal) then
				sVal = String(mapValue.Get(sVal))
			elseif bEnumValue then
				MessageBoxEx(Sprintf(I18N(ne_cst_i18n.CAT_DWSVC,"第{}行"),nRow) + "~n" + I18N(ne_cst_i18n.CAT_DWSVC,"无效的值") + "!~n" + sVal,StopSign!)
				return RetCode.E_INVALID_ARGUMENT
			end if
		end if
		choose case nColType
			case COL_TYPE_STRING
				if #DataWindow.GetItemString(nRow,colName) = sVal then continue
			case COL_TYPE_INTEGER
				if sVal <> "" and Not IsNumber(sVal) then
					MessageBoxEx(Sprintf(I18N(ne_cst_i18n.CAT_DWSVC,"第{}行"),nRow) + "~n" + I18N(ne_cst_i18n.CAT_DWSVC,"数据类型不匹配") + "!~n" + sVal,StopSign!)
					return RetCode.E_INVALID_ARGUMENT
				end if
				if #DataWindow.GetItemNumber(nRow,colName) = Long(sVal) then continue
			case COL_TYPE_DECIMAL
				if Right(sVal,1) = "%" then
					sVal = String(Dec(Left(sVal,Len(sVal) - 1)) / 100)
				end if
				if sVal <> "" and Not IsNumber(sVal) then
					MessageBoxEx(Sprintf(I18N(ne_cst_i18n.CAT_DWSVC,"第{}行"),nRow) + "~n" + I18N(ne_cst_i18n.CAT_DWSVC,"数据类型不匹配") + "!~n" + sVal,StopSign!)
					return RetCode.E_INVALID_ARGUMENT
				end if
				if #DataWindow.GetItemDecimal(nRow,colName) = Dec(sVal) then continue
			case COL_TYPE_DATETIME
				if sVal <> "" and DateTime(sVal) = dttEmpty then
					MessageBoxEx(Sprintf(I18N(ne_cst_i18n.CAT_DWSVC,"第{}行"),nRow) + "~n" + I18N(ne_cst_i18n.CAT_DWSVC,"数据类型不匹配") + "!~n" + sVal,StopSign!)
					return RetCode.E_INVALID_ARGUMENT
				end if
				if #DataWindow.GetItemDateTime(nRow,colName) = DateTime(sVal) then continue
			case COL_TYPE_DATE
				if sVal <> "" and Not IsDate(sVal) then
					MessageBoxEx(Sprintf(I18N(ne_cst_i18n.CAT_DWSVC,"第{}行"),nRow) + "~n" + I18N(ne_cst_i18n.CAT_DWSVC,"数据类型不匹配") + "!~n" + sVal,StopSign!)
					return RetCode.E_INVALID_ARGUMENT
				end if
				if #DataWindow.GetItemDate(nRow,colName) = Date(sVal) then continue
			case COL_TYPE_TIME
				if sVal <> "" and Not IsTime(sVal) then
					MessageBoxEx(Sprintf(I18N(ne_cst_i18n.CAT_DWSVC,"第{}行"),nRow) + "~n" + I18N(ne_cst_i18n.CAT_DWSVC,"数据类型不匹配") + "!~n" + sVal,StopSign!)
					return RetCode.E_INVALID_ARGUMENT
				end if
				if #DataWindow.GetItemTime(nRow,colName) = Time(sVal) then continue
		end choose
		if sVal = "" and bEmptyStringIsNull then SetNull(sVal)
		if #DataWindow.Event OnDoItemChange(nRow,dwo,sVal) <> 0 then
			MessageBoxEx(Sprintf(I18N(ne_cst_i18n.CAT_DWSVC,"第{}行"),nRow) + "~n" + I18N(ne_cst_i18n.CAT_DWSVC,"修改数据被拒绝") + "!",StopSign!)
			return RetCode.FAILED
		end if
		if Not bRedraw then
			bRedraw = true
			#DataWindow.SetRedraw(false)
		end if
		choose case nColType
			case COL_TYPE_STRING
				#DataWindow.SetItem(nRow,colName,sVal)
			case COL_TYPE_INTEGER
				#DataWindow.SetItem(nRow,colName,Long(sVal))
			case COL_TYPE_DECIMAL
				#DataWindow.SetItem(nRow,colName,Dec(sVal))
			case COL_TYPE_DATETIME
				#DataWindow.SetItem(nRow,colName,DateTime(sVal))
			case COL_TYPE_DATE
				#DataWindow.SetItem(nRow,colName,Date(sVal))
			case COL_TYPE_TIME
				#DataWindow.SetItem(nRow,colName,Time(sVal))
		end choose
		#DataWindow.Event OnDoItemChanged(nRow,dwo)
	next
finally
	if IsValidObject(mapValue) then Destroy mapValue
	if bRedraw then
		#DataWindow.SetRedraw(true)
	end if
end try

return RetCode.OK
end function

private function long _of_columnautowidth ();long nRow,nRowCnt
long nFontSize,nColXPos,nColWidth,nXPos,nAsc2Cnt,nChsCnt
real fMaxTextWidth
int nIndex,nCount,nCpIdx
string sColName,sProp,sBand,sObjNames[],sSyntax
string sText,sFontName,sFormat,sFormatVal,sFind
boolean bIsCompute,bAutoHeight,bFmtIsExp
n_cst_font font
SIZEF szText
RECTF rcText

SetPointer(HourGlass!)

font = Create n_cst_font

nCount = _of_GetObjectNames(ref sObjNames)
for nIndex = 1 to nCount
	sColName = sObjNames[nIndex]
	if #DataWindow.Describe(sColName + ".Band") <> "detail" then continue
	if #DataWindow.Describe(sColName + ".Visible") = "0" then continue
	sProp = #DataWindow.Describe(sColName + ".Type")
	if sProp <> "column" and sProp <> "compute" then continue
	choose case #DataWindow.Describe(sColName + ".edit.style")
		case "checkbox","radiobuttons"
			continue
	end choose
	
	bIsCompute = (sProp = "compute")
	bAutoHeight = (#DataWindow.Describe(sColName + ".Height.AutoSize") = "yes")
	
	fMaxTextWidth = 0
	
	nColXPos = Long(#DataWindow.Describe(sColName + ".X"))
	nColWidth = Long(#DataWindow.Describe(sColName + ".Width"))
	for nCpIdx = 1 to nCount
		sBand = #DataWindow.Describe(sObjNames[nCpIdx] + ".Band")
		if sBand <> "summary" and sBand <> "footer" and Left(sBand,6) <> "header" and Left(sBand,7) <> "trailer" then continue
		if #DataWindow.Describe(sObjNames[nCpIdx] + ".Visible") = "0" then continue
		nXPos = Long(#DataWindow.Describe(sObjNames[nCpIdx] + ".X"))
		if nXPos < nColXPos - 8 or nXPos > nColXPos + nColWidth then continue
		nFontSize = Long(#DataWindow.Describe(sObjNames[nCpIdx] + ".Font.Height"))
		sFontName = #DataWindow.Describe(sObjNames[nCpIdx] + ".Font.Face")
		font.of_SetFont(sFontName, -nFontSize, #DataWindow.Describe(sObjNames[nCpIdx] + ".Font.Weight") = "700", false,false,false, 0)
		choose case #DataWindow.Describe(sObjNames[nCpIdx] + ".Type")
			case "compute"
				sText = _of_Evaluate(sObjNames[nCpIdx])
			case "column"
				nAsc2Cnt = Long(_of_Evaluate("Max(Len(LookUpDisplay(" + sObjNames[nCpIdx] + ")))"))
				nChsCnt = Abs(Long(_of_Evaluate("Max(LenA(LookUpDisplay(" + sObjNames[nCpIdx] + ")))")) - nAsc2Cnt)
				nAsc2Cnt -= nChsCnt
				sText = Fill("A",nAsc2Cnt) + Fill("国",nChsCnt)
			case "text"
				sText = _of_GetDWOText(sObjNames[nCpIdx])
			case else
				sText = ""
		end choose
		if sText <> "" and sText <> "!" then
			sFormat = _of_GetDWOProp(sObjNames[nCpIdx],"Format")
			if sFormat = "!" or sFormat = "?" or Lower(sFormat) = "[general]" then sFormat = ""
			if sFormat <> "" then
				if IsNumber(sText) then
					sText = String(Dec(sText),sFormat)
				else
					sText = String(sText,sFormat)
				end if
			end if
			if sBand = "header" then
				rcText.right = 1024
				Painter.CalcFontTextSize(font.#Handle, sText, Painter.DT_WORDBREAK, ref rcText)
				if rcText.right > fMaxTextWidth then
					fMaxTextWidth = rcText.right
				end if
			else
				Painter.GetFontTextSize(font.#Handle, sText, ref szText)
				if szText.cx > fMaxTextWidth then
					fMaxTextWidth = szText.cx
				end if
			end if
		end if
	next
	
	if bIsCompute then
		sFormat = #DataWindow.Describe(sColName + ".Format")
		if sFormat = "!" or sFormat = "?" or Lower(sFormat) = "[general]" then sFormat = ""
		bFmtIsExp = (Pos(sFormat,"~t") > 0)
		if bFmtIsExp then
			sFormat = _of_GetPropExp(sFormat)
		else
			sFormatVal = sFormat
		end if
	end if
	nFontSize = Long(#DataWindow.Describe(sColName + ".Font.Height"))
	sFontName = #DataWindow.Describe(sColName + ".Font.Face")
	font.of_SetFont(sFontName, -nFontSize, #DataWindow.Describe(sColName + ".Font.Weight") = "700", false,false,false, 0)
	
	nRowCnt = #DataWindow.RowCount()
	if nRowCnt > 0 then
		if bIsCompute then
			sFind = Sprintf("String({1}) <> if(GetRow() < RowCount(),Describe(~"Evaluate('{1}',~" + String(GetRow() + 1) + ~")~"),'')",sColName)
		else
			if _of_GetColumnType(sColName) = COL_TYPE_STRING then
				sFind = Sprintf("if(IsNull({1}),'',{1}) <> if(IsNull({1}[1]),'',{1}[1])",sColName)
			else
				sFind = Sprintf("({1} <> {1}[1]) or (if(IsNull({1}),1,0) <> if(IsNull({1}[1]),1,0))",sColName)
			end if
		end if
		nRow = #DataWindow.Find(sFind,1,nRowCnt)
		do while(nRow > 0)
			if bIsCompute then
				sText = _of_Evaluate(sColName,nRow)
				if sText = "!" then sText = ""
				if sText <> "" and sFormat <> "" then
					if bFmtIsExp then sFormatVal = _of_Evaluate(sFormat,nRow)
					if IsNumber(sText) then
						sText = String(Dec(sText),sFormatVal)
					else
						sText = String(sText,sFormatVal)
					end if
				end if
			else
				sText = _of_LookupDisplay(nRow,sColName)
			end if
			if sText <> "" then
				if bAutoHeight then
					rcText.right = 1024
					Painter.CalcFontTextSize(font.#Handle, sText, Painter.DT_EDITCONTROL + Painter.DT_EXPANDTABS + Painter.DT_EXTERNALLEADING, ref rcText)
					if rcText.right > fMaxTextWidth then
						fMaxTextWidth = rcText.right
					end if
				else
					Painter.GetFontTextSize(font.#Handle, sText, ref szText)
					if szText.cx > fMaxTextWidth then
						fMaxTextWidth = szText.cx
					end if
				end if
			end if
			if nRow = nRowCnt then exit
			nRow = #DataWindow.Find(sFind,nRow + 1,nRowCnt)
		loop
	end if
	
	choose case #DataWindow.Describe(sColName + ".Edit.Style")
		case "dddw","ddlb"
			if _of_IsColumnEditable(sColName) then
				fMaxTextWidth += ARROW_BTN_WIDTH
			elseif #DataWindow.Describe(sColName + ".DDDW.UseAsBorder") = "yes" then
				fMaxTextWidth += ARROW_BTN_WIDTH
			elseif #DataWindow.Describe(sColName + ".DDLB.UseAsBorder") = "yes" then
				fMaxTextWidth += ARROW_BTN_WIDTH
			end if
	end choose
	
	choose case #DataWindow.Describe("DataWindow.Units")
		case "1" //PIXELS
			fMaxTextWidth = D2PX(fMaxTextWidth + 4)
		case "2" //1/1000 INCHS
			fMaxTextWidth = Win32.PX2MMX(D2PX(fMaxTextWidth + 4)) / 25.4 * 1000
		case "3" //1/1000 CM
			fMaxTextWidth = Win32.PX2MMX(D2PX(fMaxTextWidth + 4)) * 100
		case else //PBU
			fMaxTextWidth = D2UX(fMaxTextWidth + 4)
	end choose

	sSyntax += sColName + ".Width = '" + String(fMaxTextWidth) + "'~t"
next

Destroy font

#DataWindow.Modify(sSyntax)

SetPointer(Arrow!)

return RetCode.OK
end function

private function long _of_columnautowidth (readonly string colname);long nRow,nRowCnt
long nFontSize,nColXPos,nColWidth,nXPos,nAsc2Cnt,nChsCnt
real fMaxTextWidth
int nIndex,nCount
string sObjNames[],sProp,sBand,sText,sFontName,sFormat,sFormatVal,sFind
boolean bIsCompute,bAutoHeight,bFmtIsExp
n_cst_font font
SIZEF szText
RECTF rcText

if colName = "" then return RetCode.E_INVALID_ARGUMENT

choose case #DataWindow.Describe(colName + ".edit.style")
	case "checkbox","radiobuttons"
		return RetCode.FAILED
end choose

font = Create n_cst_font

bIsCompute = (#DataWindow.Describe(colName + ".Type") = "compute")
bAutoHeight = (#DataWindow.Describe(colName + ".Height.AutoSize") = "yes")

nColXPos = Long(#DataWindow.Describe(colName + ".X"))
nColWidth = Long(#DataWindow.Describe(colName + ".Width"))
nCount = _of_GetObjectNames(ref sObjNames)
for nIndex = 1 to nCount
	sBand = #DataWindow.Describe(sObjNames[nIndex] + ".Band")
	if sBand <> "summary" and sBand <> "footer" and Left(sBand,6) <> "header" and Left(sBand,7) <> "trailer" then continue
	if #DataWindow.Describe(sObjNames[nIndex] + ".Visible") = "0" then continue
	nXPos = Long(#DataWindow.Describe(sObjNames[nIndex] + ".X"))
	if nXPos < nColXPos - 8 or nXPos > nColXPos + nColWidth then continue
	nFontSize = Long(#DataWindow.Describe(sObjNames[nIndex] + ".Font.Height"))
	sFontName = #DataWindow.Describe(sObjNames[nIndex] + ".Font.Face")
	font.of_SetFont(sFontName, -nFontSize, #DataWindow.Describe(sObjNames[nIndex] + ".Font.Weight") = "700", false,false,false, 0)
	choose case #DataWindow.Describe(sObjNames[nIndex] + ".Type")
		case "compute"
			sText = _of_Evaluate(sObjNames[nIndex])
		case "column"
			nAsc2Cnt = Long(_of_Evaluate("Max(Len(LookUpDisplay(" + sObjNames[nIndex] + ")))"))
			nChsCnt = Abs(Long(_of_Evaluate("Max(LenA(LookUpDisplay(" + sObjNames[nIndex] + ")))")) - nAsc2Cnt)
			nAsc2Cnt -= nChsCnt
			sText = Fill("A",nAsc2Cnt) + Fill("国",nChsCnt)
		case "text"
			sText = _of_GetDWOText(sObjNames[nIndex])
		case else
			sText = ""
	end choose
	if sText <> "" and sText <> "!" then
		sFormat = _of_GetDWOProp(sObjNames[nIndex],"Format")
		if sFormat = "!" or sFormat = "?" or Lower(sFormat) = "[general]" then sFormat = ""
		if sFormat <> "" then
			if IsNumber(sText) then
				sText = String(Dec(sText),sFormat)
			else
				sText = String(sText,sFormat)
			end if
		end if
		if sBand = "header" then
			rcText.right = 1024
			Painter.CalcFontTextSize(font.#Handle, sText, Painter.DT_WORDBREAK, ref rcText)
			if rcText.right > fMaxTextWidth then
				fMaxTextWidth = rcText.right
			end if
		else
			Painter.GetFontTextSize(font.#Handle, sText, ref szText)
			if szText.cx > fMaxTextWidth then
				fMaxTextWidth = szText.cx
			end if
		end if
	end if
next

if bIsCompute then
	sFormat = #DataWindow.Describe(colName + ".Format")
	if sFormat = "!" or sFormat = "?" or Lower(sFormat) = "[general]" then sFormat = ""
	bFmtIsExp = (Pos(sFormat,"~t") > 0)
	if bFmtIsExp then
		sFormat = _of_GetPropExp(sFormat)
	else
		sFormatVal = sFormat
	end if
end if
nFontSize = Long(#DataWindow.Describe(colName + ".Font.Height"))
sFontName = #DataWindow.Describe(colName + ".Font.Face")
font.of_SetFont(sFontName, -nFontSize, #DataWindow.Describe(colName + ".Font.Weight") = "700", false,false,false, 0)

nRowCnt = #DataWindow.RowCount()
if nRowCnt > 0 then
	if bIsCompute then
		sFind = Sprintf("String({1}) <> if(GetRow() < RowCount(),Describe(~"Evaluate('{1}',~" + String(GetRow() + 1) + ~")~"),'')",colName)
	else
		if _of_GetColumnType(colName) = COL_TYPE_STRING then
			sFind = Sprintf("if(IsNull({1}),'',{1}) <> if(IsNull({1}[1]),'',{1}[1])",colName)
		else
			sFind = Sprintf("({1} <> {1}[1]) or (if(IsNull({1}),1,0) <> if(IsNull({1}[1]),1,0))",colName)
		end if
	end if
	nRow = #DataWindow.Find(sFind,1,nRowCnt)
	do while(nRow > 0)
		if bIsCompute then
			sText = _of_Evaluate(colName,nRow)
			if sText = "!" then sText = ""
			if sText <> "" and sFormat <> "" then
				if bFmtIsExp then sFormatVal = _of_Evaluate(sFormat,nRow)
				if IsNumber(sText) then
					sText = String(Dec(sText),sFormatVal)
				else
					sText = String(sText,sFormatVal)
				end if
			end if
		else
			sText = _of_LookupDisplay(nRow,colName)
		end if
		if sText <> "" then
			if bAutoHeight then
				rcText.right = 1024
				Painter.CalcFontTextSize(font.#Handle, sText, Painter.DT_EDITCONTROL + Painter.DT_EXPANDTABS + Painter.DT_EXTERNALLEADING, ref rcText)
				if rcText.right > fMaxTextWidth then
					fMaxTextWidth = rcText.right
				end if
			else
				Painter.GetFontTextSize(font.#Handle, sText, ref szText)
				if szText.cx > fMaxTextWidth then
					fMaxTextWidth = szText.cx
				end if
			end if
		end if
		if nRow = nRowCnt then exit
		nRow = #DataWindow.Find(sFind,nRow + 1,nRowCnt)
	loop
end if

Destroy font

choose case #DataWindow.Describe(colName + ".Edit.Style")
	case "dddw","ddlb"
		if _of_IsColumnEditable(colName) then
			fMaxTextWidth += ARROW_BTN_WIDTH
		elseif #DataWindow.Describe(colName + ".DDDW.UseAsBorder") = "yes" then
			fMaxTextWidth += ARROW_BTN_WIDTH
		elseif #DataWindow.Describe(colName + ".DDLB.UseAsBorder") = "yes" then
			fMaxTextWidth += ARROW_BTN_WIDTH
		end if
end choose

choose case #DataWindow.Describe("DataWindow.Units")
	case "1" //PIXELS
		fMaxTextWidth = D2PX(fMaxTextWidth + 4)
	case "2" //1/1000 INCHS
		fMaxTextWidth = Win32.PX2MMX(D2PX(fMaxTextWidth + 4)) / 25.4 * 1000
	case "3" //1/1000 CM
		fMaxTextWidth = Win32.PX2MMX(D2PX(fMaxTextWidth + 4)) * 100
	case else //PBU
		fMaxTextWidth = D2UX(fMaxTextWidth + 4)
end choose

#DataWindow.Modify(colName + ".Width = '" + String(fMaxTextWidth) + "'")

return RetCode.OK
end function

public function ulong of_getid (readonly string text);int nIndex

for nIndex = UpperBound(Items) to 1 step -1
	if Items[nIndex].text = text then return Items[nIndex].id
next

return 0
end function

on n_cst_dwsvc_contextmenu.create
call super::create
this.theme=create theme
end on

on n_cst_dwsvc_contextmenu.destroy
call super::destroy
destroy(this.theme)
end on

event onenable;call super::onenable;if enabled then
	#DataWindow.of_On(#DataWindow.EVT_RBUTTONDOWN,this,"onRButtonDown")
	#DataWindow.of_On(#DataWindow.EVT_RBUTTONUP,this,"onRButtonUp")
else
	#DataWindow.of_Off(this)
end if
return 0
end event

type theme from n_cst_popupmenu_theme within n_cst_dwsvc_contextmenu descriptor "pb_nvo" = "true" 
end type

on theme.create
call super::create
end on

on theme.destroy
call super::destroy
end on

