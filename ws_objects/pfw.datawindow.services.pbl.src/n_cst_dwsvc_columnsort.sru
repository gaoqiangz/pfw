$PBExportHeader$n_cst_dwsvc_columnsort.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_dwsvc_columnsort from n_cst_dwsvc
end type
type sortdata from structure within n_cst_dwsvc_columnsort
end type
end forward

type sortdata from structure
	string		colname
	long		sorttype
end type

global type n_cst_dwsvc_columnsort from n_cst_dwsvc
event onlbuttonclk pbm_dwnlbuttonclk
event onlbuttonup pbm_dwnlbuttonup
event type long onlbuttonclicked ( integer xpos,  integer ypos,  long row,  dwobject dwo )
event onlbuttondblclk pbm_dwnlbuttondblclk
end type
global n_cst_dwsvc_columnsort n_cst_dwsvc_columnsort

type variables
public:
//Suffix
constant string ARROWSUFFIX = "_arw"

private:
SORTDATA SortDatas[]

string _sSort
string _sOrgSort

POINT _mouseDownPt

//Sort type
constant long SORT_NONE	= 0
constant long SORT_ASC	= 1
constant long SORT_DESC	= 2

end variables

forward prototypes
private subroutine _of_sort ()
public function long of_reset ()
public function long of_update (readonly string sort)
public function long of_update ()
private function string _of_getclause (readonly string colname, readonly long sorttype)
private subroutine _of_setarrow (readonly string colname, readonly long sorttype, readonly integer index)
private function long _of_sort (readonly string sort)
end prototypes

event onlbuttonclk;_mouseDownPt.x = xpos //UnitsToPixels(xpos,XUnitsToPixels!)
_mouseDownPt.y = ypos //UnitsToPixels(ypos,YUnitsToPixels!)

return 0
end event

event onlbuttonup;long nXPos,nYPos

if _of_GetStyle() <> STYLE_GRID then return 0
//*有分组的DW不支持排序
if _of_HasGroup() then return

nXPos = _mouseDownPt.x
nYPos = _mouseDownPt.y
_mouseDownPt.x = 0
_mouseDownPt.y = 0

if Abs(xpos - nXPos) <= 2 and Abs(ypos - nYPos) <= 2 then
	if Not IsValidObject(#DataWindow.Object) then return 0
	Post Event OnLButtonClicked(xpos,ypos,row,dwo)
end if

return 0
end event

event type long onlbuttonclicked(integer xpos, integer ypos, long row, dwobject dwo);int nIndex,nCount,nCurrentIndex
string sName,sColName,sProp

//if _of_GetStyle() <> STYLE_GRID then return 0
	
sName = dwo.Name
sProp = #DataWindow.Describe(sName + ".Band")
if sProp <> "header" then return 0
/*
sProp = #DataWindow.Describe("DataWindow.Grid.Lines")
if sProp = "0" or sProp = "2" then
	//允许拖动列大小的情况下防止被排序
	if xpos - UnitsToPixels(Long(#DataWindow.Describe(sName + ".x")),XUnitsToPixels!) < 8 then return 0
end if
*/
//取得列名
if Right(sName,2) = "_t" then
	sColName = Left(sName,Len(sName) - 2)
/*elseif Right(sName,Len(ARROWSUFFIX)) = ARROWSUFFIX then
	sColName = Left(sName,Pos(sName,ARROWSUFFIX) - 1)
elseif Right(sName,Len(n_cst_dwsvc_contextmenu.FILTERSUFFIX)) = n_cst_dwsvc_contextmenu.FILTERSUFFIX then
	sColName = Left(sName,Pos(sName,n_cst_dwsvc_contextmenu.FILTERSUFFIX) - 1)*/
else
	return 0
end if

sProp = #DataWindow.Describe(sColName + ".Band")
if sProp <> "detail" then return 0

choose case #DataWindow.Describe(sColName + ".edit.style")
	case "checkbox","radiobutton"
		return 0
end choose

nCount = UpperBound(SortDatas)
for nIndex = 1 to nCount
	if SortDatas[nIndex].colName = sColName then
		nCurrentIndex = nIndex
		exit
	end if
next
if nCurrentIndex = 0 then
	SortDatas[nCount + 1].colName = sColName
	SortDatas[nCount + 1].sortType = SORT_NONE
	nCurrentIndex = nCount + 1
end if

choose case SortDatas[nCurrentIndex].sortType
	case SORT_NONE
		SortDatas[nCurrentIndex].sortType = SORT_ASC
	case SORT_ASC
		SortDatas[nCurrentIndex].sortType = SORT_DESC
	case SORT_DESC
		SortDatas[nCurrentIndex].sortType = SORT_NONE
end choose

if KeyDown(KeyControl!) then
	_of_Sort()
	if SortDatas[nCurrentIndex].sortType = SORT_NONE then
		SORTDATA newDatas[]
		nCount = UpperBound(SortDatas)
		for nIndex = 1 to nCount
			if nIndex <> nCurrentIndex then
				newDatas[UpperBound(newDatas) + 1] = SortDatas[nIndex]
			end if
		next
		SortDatas = newDatas
	end if
else
	nCount = UpperBound(SortDatas)
	for nIndex = 1 to nCount
		if nIndex <> nCurrentIndex then
			SortDatas[nIndex].sortType = SORT_NONE
		end if
	next
	_of_Sort()
	if SortDatas[nCurrentIndex].sortType = SORT_NONE then
		SORTDATA emptyDatas[]
		SortDatas = emptyDatas
	elseif nCount > 1 then
		SORTDATA newData[1]
		newData[1] = SortDatas[nCurrentIndex]
		SortDatas = newData
	end if
end if

return 0

end event

event onlbuttondblclk;return Event OnLButtonClk(xpos,ypos,row,dwo)
end event

private subroutine _of_sort ();int nIndex,nCount,nSortIdex,nSortCnt
string sSort,sClause

_sSort = ""

if _sOrgSort = "" then
	_sOrgSort = #DataWindow.Describe("DataWindow.Table.Sort")
end if

nCount = UpperBound(SortDatas)
for nIndex = 1 to nCount
	if SortDatas[nIndex].sortType <> SORT_NONE then
		nSortCnt ++
	end if
next

for nIndex = 1 to nCount
	if nSortCnt > 1 then
		if SortDatas[nIndex].sortType <> SORT_NONE then
			nSortIdex ++
		end if
	end if
	_of_SetArrow(SortDatas[nIndex].colName,SortDatas[nIndex].sortType,nSortIdex)
	sClause = _of_GetClause(SortDatas[nIndex].colName,SortDatas[nIndex].sortType)
	if sClause <> "" then
		if _sSort <> "" then _sSort += ","
		_sSort += sClause
	end if
next

if _sSort = "" then
	if _sOrgSort <> "?" then
		sSort = _sOrgSort
	end if
else
	sSort = _sSort
end if

SetPointer(HourGlass!)

_of_Sort(sSort)

SetPointer(Arrow!)
end subroutine

public function long of_reset ();//====================================================================
// Function: of_reset()
//--------------------------------------------------------------------
// Description: 重置排序
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-07-10
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int nIndex,nCount
SORTDATA emptyDatas[]

nCount = UpperBound(SortDatas)
if nCount = 0 then return RetCode.FAILED

for nIndex = 1 to nCount
	SortDatas[nIndex].sortType = SORT_NONE
next

_of_Sort()

SortDatas = emptyDatas

return RetCode.OK
end function

public function long of_update (readonly string sort);//====================================================================
// Function: of_update()
//--------------------------------------------------------------------
// Description: 更新原始排序条件
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	sort	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-10-15
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sSort

if Not IsNull(sort) then
	_sOrgSort = sort
else
	_sOrgSort = #DataWindow.Describe("DataWindow.Table.Sort")
	if sSort = "?" or _sOrgSort = "!" then _sOrgSort = ""
end if
if _sOrgSort = "" then _sOrgSort = "?"

if _sSort <> "" then return RetCode.OK

if _sOrgSort <> "?" then
	sSort = _sOrgSort
end if

return _of_Sort(sSort)
end function

public function long of_update ();string nvl
SetNull(nvl)
return of_Update(nvl)
end function

private function string _of_getclause (readonly string colname, readonly long sorttype);string sClause,sProp

if sortType = SORT_NONE then return ""

if #DataWindow.Describe(colName + ".Type") = "compute" then
	sClause = colName
else
	sProp = #DataWindow.Describe(colName + ".Edit.Style")
	if sProp = "dddw" or sProp = "ddlb" then
		if sProp = "dddw" then
			if #DataWindow.Describe(colName + ".DDDW.DisplayColumn") <> #DataWindow.Describe(colName + ".DDDW.DataColumn") then
				sClause = "LookUpDisplay(" + colName + ")"
			end if
		else
			sClause = "LookUpDisplay(" + colName + ")"
		end if
	else
		sProp = #DataWindow.Describe(colName + ".Edit.CodeTable")
		if sProp = "yes" then
			sClause = "LookUpDisplay(" + colName + ")"
		end if
	end if
end if
if sClause = "" then
	if #DataWindow.Describe(colName + ".Edit.NilIsNull") = "yes" or #DataWindow.Describe(colName + ".DDDW.NilIsNull") = "yes" or #DataWindow.Describe(colName + ".DDLB.NilIsNull") = "yes" then
		choose case _of_GetColumnType(colName)
			case COL_TYPE_INTEGER,COL_TYPE_DECIMAL
				sClause = "if(IsNull(" + colName + "),-999999," + colName + ")"
			case COL_TYPE_DATETIME
				sClause = "if(IsNull(" + colName + "),DateTime('1900-01-01')," + colName + ")"
			case COL_TYPE_DATE
				sClause = "if(IsNull(" + colName + "),Date('1900-01-01')," + colName + ")"
			case COL_TYPE_TIME
				sClause = "if(IsNull(" + colName + "),Time('00:00:00')," + colName + ")"
			case else
				sClause = "if(IsNull(" + colName + "),''," + colName + ")"
		end choose
	end if
end if
if sClause = "" then sClause = colName

choose case sortType
	case SORT_ASC
		sClause += " A"
	case SORT_DESC
		sClause += " D"
end choose

return sClause
end function

private subroutine _of_setarrow (readonly string colname, readonly long sorttype, readonly integer index);real fLeaderHeight
string sObjName,sIdxObjName,sXPos,sYPos,sWidth,sText
string sSyntax
constant string ARROWCOLOR		= "33554432"	//COLOR_WINDOWTEXT
constant string INDEXCOLOR		= String(RGB(150,150,150))
constant string TRANSPARENT	= "536870912"

sObjName = colName + ARROWSUFFIX
sIdxObjName = colName + "_idx_" + ARROWSUFFIX

#DataWindow.Modify("Destroy " + sObjName)
#DataWindow.Modify("Destroy " + sIdxObjName)
if sortType = SORT_NONE then return

choose case #DataWindow.Describe("DataWindow.Units")
	case "1" //PIXELS
		fLeaderHeight = U2PY(10)
	case "2" //1/1000 INCHS
		fLeaderHeight = Win32.PX2MMY(U2PY(10)) / 25.4 * 1000
	case "3" //1/1000 CM
		fLeaderHeight = Win32.PX2MMY(U2PY(10)) * 100
	case else //PBU
		fLeaderHeight = 10
end choose

sXPos  = #DataWindow.Describe(colName + "_t.x")
sWidth = String(Long(#DataWindow.Describe(colName + "_t.width")) / 2)
sYPos = String(Long(#DataWindow.Describe(colName + "_t.y")) - fLeaderHeight * 2) //偏移font leader空间

choose case sortType
	case SORT_ASC
		sText = "t"
	case SORT_DESC
		sText = "u"
end choose

sSyntax  = 'create text(band=header alignment="2" text="' + sText + '" border="0" '
sSyntax += 'color="' + ARROWCOLOR + '" x="' + sXPos + '" y="' + sYPos + '" height="0" Height.AutoSize=yes width="' + sWidth + '" '
sSyntax += 'html.valueishtml="0" name=' + sObjName + ' visible="1" enabled="0" font.face="Marlett" '
sSyntax += 'font.height="-10" font.weight="400" font.family="0" font.pitch="2" '
sSyntax += 'font.charset="2" background.mode="1" background.color="' + TRANSPARENT + '")~n'

if index > 0 then
	sText = "      " + String(index)
	sYPos = String(Long(#DataWindow.Describe(colName + "_t.y")) - fLeaderHeight) //偏移font leader空间
	sSyntax += 'create text(band=header alignment="2" text="' + sText + '" border="0" '
	sSyntax += 'color="' + INDEXCOLOR + '" x="' + sXPos + '" y="' + sYPos + '" height="0" Height.AutoSize=yes width="' + sWidth + '" '
	sSyntax += 'html.valueishtml="0" name=' + sIdxObjName + ' visible="1" enabled="0" font.face="Arial" '
	sSyntax += 'font.height="-5" font.weight="400" font.family="0" font.pitch="2" '
	sSyntax += 'font.charset="0" background.mode="1" background.color="' + TRANSPARENT + '")'
end if

#DataWindow.Modify(sSyntax)

end subroutine

private function long _of_sort (readonly string sort);int nIndex,nCount
long nCurrentRowID
string sCurrSort
boolean bEnableEvt

sCurrSort = #DataWindow.Describe("DataWindow.Table.Sort")
if sCurrSort = "?" or sCurrSort = "!" then sCurrSort = ""
if sCurrSort = sort then return RetCode.OK

#DataWindow.SetRedraw(false)

nCurrentRowID = #DataWindow.GetRowIDFromRow(#DataWindow.GetRow())
if Not #DataWindow.of_IsEventDisabled(#DataWindow.EID_ROWFOCUSCHANGE) then
	bEnableEvt = true
	#DataWindow.of_DisableEvent(#DataWindow.EID_ROWFOCUSCHANGE)
end if

#DataWindow.SetSort(sort)
#DataWindow.Sort()

if _of_HasGroup() then
	#DataWindow.GroupCalc()
end if

if nCurrentRowID > 0 then
	#DataWindow.SetRow(#DataWindow.GetRowFromRowID(nCurrentRowID))
end if
if bEnableEvt then
	#DataWindow.of_EnableEvent(#DataWindow.EID_ROWFOCUSCHANGE)
end if

#DataWindow.SetRedraw(true)

return RetCode.OK
end function

on n_cst_dwsvc_columnsort.create
call super::create
end on

on n_cst_dwsvc_columnsort.destroy
call super::destroy
end on

event onenable;call super::onenable;if enabled then
	#DataWindow.of_On(#DataWindow.EVT_CLICKED,this,"onLButtonClk")
	#DataWindow.of_On(#DataWindow.EVT_DOUBLECLICKED,this,"onLButtonDblClk")
	#DataWindow.of_On(#DataWindow.EVT_LBUTTONUP,this,"onLButtonUp")
else
	#DataWindow.of_Off(this)
end if
return 0
end event

