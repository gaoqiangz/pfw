$PBExportHeader$n_cst_dwsvc_rowselect.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_dwsvc_rowselect from n_cst_dwsvc
end type
end forward

global type n_cst_dwsvc_rowselect from n_cst_dwsvc
event onlbuttonclk pbm_dwnlbuttonclk
event onrowfocuschanged pbm_dwnrowchange
event onfiltered ( )
event onlbuttondblclk pbm_dwnlbuttondblclk
end type
global n_cst_dwsvc_rowselect n_cst_dwsvc_rowselect

type variables
/* Constants */
public:
//Row select style (支持组合)
constant long RS_SINGLE				= 1 //单选
constant long RS_MULTIPLE			= 2 //多选

/* Properties */
public:
privatewrite long #Style = RS_SINGLE //选择风格

/* Implementation */
private:
boolean _inChangeRowFocus	//正在改变当前行
boolean _bHasMultiSelected	//当前是否有多行选择
end variables

forward prototypes
private function boolean _of_setcurrentrow (readonly long row)
public function boolean of_hasmultiselected ()
public function long of_setstyle (readonly long style)
private function long _of_checkselectedrows (readonly long row, readonly dwobject dwo)
end prototypes

event onlbuttonclk;long nFocusRow

if row <= 0 then return 0

//开启多行选择服务时，提供范围勾选的功能
if #Style <> RS_SINGLE and Not KeyDown(KeyShift!) and Not KeyDown(KeyControl!) then
	if _of_CheckSelectedRows(row,dwo) = 1 then return 1
end if

if #Style = RS_SINGLE or (Not KeyDown(KeyShift!) and Not KeyDown(KeyControl!)) or (KeyDown(KeyShift!) and KeyDown(KeyControl!)) then
	if Not _of_SetCurrentRow(row) then return 1
	#DataWindow.SelectRow(0,false)
	if #Style <> RS_MULTIPLE then
		#DataWindow.SelectRow(row,true)
	end if
	_bHasMultiSelected = false
	return 0
end if

nFocusRow = #DataWindow.GetRow()

if KeyDown(KeyShift!) then	//范围选
	#DataWindow.SetRedraw(false)
	#DataWindow.SelectRow(0,false)
	if row > nFocusRow then
		do while(row >= nFocusRow)
			#DataWindow.SelectRow(row,true)
			row --
		loop
	else
		do while(row <= nFocusRow)
			#DataWindow.SelectRow(row,true)
			row ++
		loop
	end if
	#DataWindow.SetRedraw(true)
elseif KeyDown(KeyControl!) then	//单选
	if Not _bHasMultiSelected and nFocusRow <> row then
		#DataWindow.SelectRow(nFocusRow,true)
	end if
	#DataWindow.SelectRow(row,Not #DataWindow.IsSelected(row))
end if

_bHasMultiSelected = true

return 1
end event

event onrowfocuschanged;if _inChangeRowFocus then return 0

#DataWindow.SelectRow(0,false)

if currentRow > 0 and #Style <> RS_MULTIPLE then
	#DataWindow.SelectRow(currentRow,true)
end if

_bHasMultiSelected = false

return 0
end event

event onfiltered();long nRow

#DataWindow.SelectRow(0,false)

nRow = #DataWindow.GetRow()
if nRow > 0 and #Style <> RS_MULTIPLE then
	#DataWindow.SelectRow(nRow,true)
end if

_bHasMultiSelected = false
end event

event onlbuttondblclk;return Event OnLButtonClk(xpos,ypos,row,dwo)
end event

private function boolean _of_setcurrentrow (readonly long row);boolean rt

if row <= 0 then return false

_inChangeRowFocus = true
if #DataWindow.GetRow() <> row then
	#DataWindow.SetRow(row)
	rt = (#DataWindow.GetRow() = row)
else
	rt = true
end if
_inChangeRowFocus = false

return rt
end function

public function boolean of_hasmultiselected ();//====================================================================
// Function: of_hasmultiselected()
//--------------------------------------------------------------------
// Description: 判断当前是否有多行选择
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-04-03
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _bHasMultiSelected
end function

public function long of_setstyle (readonly long style);//====================================================================
// Function: of_setstyle()
//--------------------------------------------------------------------
// Description: 设置选择风格
//--------------------------------------------------------------------
// Arguments:
// 	readonly	long	style	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-04-03
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if #Style = style then return RetCode.OK
if style = 0 then return RetCode.E_INVALID_ARGUMENT

#Style = style

if #Enabled then
	#DataWindow.SelectRow(0,false)
	if #Style <> RS_MULTIPLE then
		#DataWindow.SelectRow(#DataWindow.GetRow(),true)
	end if
	_bHasMultiSelected = false
end if

return RetCode.OK
end function

private function long _of_checkselectedrows (readonly long row, readonly dwobject dwo);long nRow,nRowCnt,nColType
string sColName,sOn,sOff,sVal
boolean bRedraw

sColName = dwo.Name

do
	if Not _of_IsEditable() then exit
	if Not _of_IsColumnEditable(sColName) then exit
	if Not #DataWindow.IsSelected(row) then exit
	if Not of_HasMultiSelected() then exit
	if #DataWindow.Describe(sColName + ".edit.style") <> "checkbox" then exit
	sOn = #DataWindow.Describe(sColName + ".checkbox.on")
	if sOn = "!" or sOn = "?" then exit
	sOff = #DataWindow.Describe(sColName + ".checkbox.off")
	if sOff = "!" or sOff = "?" then exit
	//忽略被保护的单元格
	if _of_IsItemProtected(row,sColName) then exit
	nColType = _of_GetColumnType(sColName)
	choose case nColType
		case COL_TYPE_DECIMAL
			if String(#DataWindow.GetItemDecimal(row,sColName)) = sOn then
				sVal = sOff
			else
				sVal = sOn
			end if
		case COL_TYPE_INTEGER
			if String(#DataWindow.GetItemNumber(row,sColName)) = sOn then
				sVal = sOff
			else
				sVal = sOn
			end if
		case else
			if #DataWindow.GetItemString(row,sColName) = sOn then
				sVal = sOff
			else
				sVal = sOn
			end if
	end choose
	do
		nRow = #DataWindow.GetSelectedRow(nRow)
		if nRow <= 0 then exit
		//忽略不可见的单元格
		if Not _of_IsItemVisible(nRow,sColName) then continue
		//忽略被保护的单元格
		if _of_IsItemProtected(nRow,sColName) then continue
		choose case nColType
			case COL_TYPE_DECIMAL
				if String(#DataWindow.GetItemDecimal(nRow,sColName)) = sVal then continue
			case COL_TYPE_INTEGER
				if String(#DataWindow.GetItemNumber(nRow,sColName)) = sVal then continue
			case else
				if #DataWindow.GetItemString(nRow,sColName) = sVal then continue
		end choose
		if #DataWindow.Event OnDoItemChange(nRow,dwo,sVal) <> 0 then
			MessageBoxEx(Sprintf(I18N(ne_cst_i18n.CAT_DWSVC,"第{}行"),nRow) + "~n" + I18N(ne_cst_i18n.CAT_DWSVC,"修改数据被拒绝") + "!",StopSign!)
			exit
		end if
		if Not bRedraw then
			bRedraw = true
			#DataWindow.SetRedraw(false)
		end if
		choose case nColType
			case COL_TYPE_DECIMAL
				#DataWindow.SetItem(nRow,sColName,Dec(sVal))
			case COL_TYPE_INTEGER
				#DataWindow.SetItem(nRow,sColName,Long(sVal))
			case else
				#DataWindow.SetItem(nRow,sColName,sVal)
		end choose
		#DataWindow.Event OnDoItemChanged(nRow,dwo)
	loop while true
	if bRedraw then
		#DataWindow.SetRedraw(true)
	end if
	return 1
loop while false

return 0
end function

on n_cst_dwsvc_rowselect.create
call super::create
end on

on n_cst_dwsvc_rowselect.destroy
call super::destroy
end on

event onenable;call super::onenable;if enabled then
	#DataWindow.of_On(#DataWindow.EVT_CLICKED,this,"onLButtonClk")
	#DataWindow.of_On(#DataWindow.EVT_DOUBLECLICKED,this,"onLButtonDblClk")
	#DataWindow.of_On(#DataWindow.EVT_ROWFOCUSCHANGED,this,"onRowFocusChanged")
	if #Style <> RS_MULTIPLE then
		#DataWindow.SelectRow(#DataWindow.GetRow(),true)
	end if
else
	#DataWindow.of_Off(this)
	#DataWindow.SelectRow(0,false)
	_bHasMultiSelected = false
end if

return 0
end event

