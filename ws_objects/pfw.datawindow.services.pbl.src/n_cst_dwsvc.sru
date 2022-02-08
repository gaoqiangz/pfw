$PBExportHeader$n_cst_dwsvc.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_dwsvc from nonvisualobject
end type
end forward

global type n_cst_dwsvc from nonvisualobject
event oninit ( se_cst_dw dw )
event type long onenable ( boolean enabled )
end type
global n_cst_dwsvc n_cst_dwsvc

type variables
/* 常量 */
public:
//数据源的风格
constant long STYLE_DEFAULT	= 0 //Form, group, query, or tabular
constant long STYLE_GRID		= 1 //Grid
constant long STYLE_LABEL		= 2 //Label
constant long STYLE_GRAPH		= 3 //Graph
constant long STYLE_CROSSTAB	= 4 //Crosstab
constant long STYLE_COMPOSITE	= 5 //Composite
constant long STYLE_RICHTEXT	= 7 //RichText
//列类型
constant long COL_TYPE_UNKNOWN	= 0
constant long COL_TYPE_STRING 	= 1
constant long COL_TYPE_INTEGER 	= 2
constant long COL_TYPE_DECIMAL 	= 3
constant long COL_TYPE_DATETIME 	= 4
constant long COL_TYPE_DATE 		= 5
constant long COL_TYPE_TIME 		= 6

/* 属性 */
public:
privatewrite 	se_cst_dw		#DataWindow
privatewrite 	n_cst_eventful #Eventful
protectedwrite boolean 			#Enabled

end variables

forward prototypes
public function long of_setenabled (readonly boolean benabled)
protected function dwobject _of_getdwobject (readonly long colnum)
protected function dwobject _of_getdwobject (readonly string dwoname)
protected function long _of_getstyle ()
protected function string _of_getitemprop (readonly long row, readonly long colnum, readonly string prop)
protected function string _of_getitemprop (readonly long row, readonly string colname, readonly string prop)
protected function string _of_evaluate (readonly string exp, readonly long row)
protected function string _of_evaluate (readonly string exp)
protected function boolean _of_isitemprotected (readonly long row, readonly string colname)
protected function boolean _of_isitemprotected (readonly long row, readonly long colnum)
protected function boolean _of_isitemvisible (readonly long row, readonly string colname)
protected function boolean _of_isitemvisible (readonly long row, readonly long colnum)
protected function string _of_lookupdisplay (readonly long row, readonly string colname)
protected function string _of_lookupdisplay (readonly long row, readonly long colnum)
protected function boolean _of_iseditable ()
protected function string _of_getcolumnprop (readonly string colname, readonly string prop)
protected function string _of_getcolumnprop (readonly long colnum, readonly string prop)
protected function boolean _of_iscolumnvisible (readonly long colnum)
protected function boolean _of_iscolumnvisible (readonly string colname)
protected function boolean _of_iscolumnprotected (readonly string colname)
protected function boolean _of_iscolumnprotected (readonly long colnum)
protected function boolean _of_iscolumneditable (readonly long colnum)
protected function boolean _of_iscolumneditable (readonly string colname)
protected function boolean _of_isitemeditable (readonly long row, readonly string colname)
protected function boolean _of_isitemeditable (readonly long row, readonly long colnum)
protected function integer _of_splitstring (string src, readonly string delimiter, ref string dstarray[], readonly boolean ignoreempty)
private function integer _of_splitstring (readonly string src, readonly string delimiter, ref string dstarray[])
protected function boolean _of_hasdwobject (readonly string dwoname)
protected function long _of_convertcoltype (readonly string coltype)
protected function long _of_getcolumntype (readonly string name)
protected function long _of_getcolumntype (readonly long colnum)
protected function n_map _of_getcolumnvaluemap (readonly string colname)
protected function n_map _of_getcolumnvaluemap (readonly long colnum)
protected function integer _of_getobjectnames (ref string names[], readonly string stype, readonly string band)
protected function integer _of_getobjectnames (ref string names[], readonly string stype)
protected function integer _of_getobjectnames (ref string names[])
protected function string _of_getdwoprop (readonly string dwoname, readonly string prop)
protected function string _of_getdwotext (readonly string dwoname)
protected function string _of_getpropexp (readonly string prop)
protected function boolean _of_hasgroup ()
end prototypes

event oninit(se_cst_dw dw);#DataWindow = dw
#Eventful = dw.Eventful
end event

public function long of_setenabled (readonly boolean benabled);if #Enabled = bEnabled then return RetCode.OK
if Event OnEnable(bEnabled) = 1 then return RetCode.FAILED

#Enabled = bEnabled

return RetCode.OK
end function

protected function dwobject _of_getdwobject (readonly long colnum);return _of_GetDWObject("#" + String(colNum))
end function

protected function dwobject _of_getdwobject (readonly string dwoname);//====================================================================
// Function: _of_getdwobject()
//--------------------------------------------------------------------
// Description: 获取指定列名的DWO对象
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	dwoname	
//--------------------------------------------------------------------
// Returns:  dwobject
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-11-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
dwobject dwo

if Not IsValidObject(#DataWindow.Object) then return dwo

//*当前对象不存在时会异常
dwo = #DataWindow.Object.__Get_Attribute(dwoName,false)

return dwo
end function

protected function long _of_getstyle ();//====================================================================
// Function: _of_getstyle()
//--------------------------------------------------------------------
// Description: 获取数据源的风格
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-11-30
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
choose case #DataWindow.Describe("DataWindow.Processing")
	case "1"
		return STYLE_GRID
	case "2"
		return STYLE_LABEL
	case "3"
		return STYLE_GRAPH
	case "4"
		return STYLE_CROSSTAB
	case "5"
		return STYLE_COMPOSITE
	case "7"
		return STYLE_RICHTEXT
	case else
		return STYLE_DEFAULT
end choose
end function

protected function string _of_getitemprop (readonly long row, readonly long colnum, readonly string prop);return _of_GetItemProp(row,"#"+String(ColNum),prop)
end function

protected function string _of_getitemprop (readonly long row, readonly string colname, readonly string prop);//====================================================================
// Function: _of_getitemprop()
//--------------------------------------------------------------------
// Description: 获取单元格的属性值(如果含表达示则计算表达示)
//--------------------------------------------------------------------
// Arguments:
// 	readonly	long  	row   	
// 	readonly	string  	colname	
// 	readonly	string	prop  	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-11-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long nPos
string sExp

if colName = "" or prop = "" then return ""

sExp = #DataWindow.Describe(colName+"."+prop)
nPos = Pos(sExp,"~t")

if nPos = 0 then
	return sExp
else
	sExp = "~""+Mid(sExp,nPos + 1)
	return #DataWindow.Describe("Evaluate("+sExp+","+String(row) + ")")
end if
end function

protected function string _of_evaluate (readonly string exp, readonly long row);//====================================================================
// Function: _of_evaluate()
//--------------------------------------------------------------------
// Description: 计算表达示的值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	exp	
// 	readonly	long  	row	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-03-08
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return #DataWindow.Describe("Evaluate(~""+exp+"~","+String(row) + ")")
end function

protected function string _of_evaluate (readonly string exp);return _of_Evaluate(exp,0)
end function

protected function boolean _of_isitemprotected (readonly long row, readonly string colname);//====================================================================
// Function: _of_isitemprotected()
//--------------------------------------------------------------------
// Description: 判断指定单元格是否为受保存的
//--------------------------------------------------------------------
// Arguments:
// 	readonly	long	row   	
// 	readonly	string	colname	
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-11-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return (_of_GetItemProp(row,colName,"protect") = "1")
end function

protected function boolean _of_isitemprotected (readonly long row, readonly long colnum);return _of_IsItemProtected(row,"#" + String(colNum))
end function

protected function boolean _of_isitemvisible (readonly long row, readonly string colname);//====================================================================
// Function: _of_isitemvisible()
//--------------------------------------------------------------------
// Description: 判断指定单元格是否可见
//--------------------------------------------------------------------
// Arguments:
// 	readonly	long	row   	
// 	readonly	string	colname	
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-11-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return (_of_GetItemProp(row,colName,"visible") = "1")
end function

protected function boolean _of_isitemvisible (readonly long row, readonly long colnum);return _of_IsItemVisible(row,"#" + String(colNum))
end function

protected function string _of_lookupdisplay (readonly long row, readonly string colname);//====================================================================
// Function: _of_lookupdisplay()
//--------------------------------------------------------------------
// Description: 获取指定单元格显示的值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	long	row   	
// 	readonly	long	colnum	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-11-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return #DataWindow.Describe("Evaluate('LookUpDisplay("+colName+")',"+string(row)+")")
end function

protected function string _of_lookupdisplay (readonly long row, readonly long colnum);return _of_LookupDisplay(row,"#" + String(colNum))
end function

protected function boolean _of_iseditable ();//====================================================================
// Function: _of_iseditable()
//--------------------------------------------------------------------
// Description: 判断当前是否可编辑
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-10-11
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return (#DataWindow.Describe("DataWindow.ReadOnly") = "no")
end function

protected function string _of_getcolumnprop (readonly string colname, readonly string prop);//====================================================================
// Function: _of_getcolumnprop()
//--------------------------------------------------------------------
// Description: 获取列的属性值(如果含表达示则计算表达示)
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string  	colname	
// 	readonly	string	prop  	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-11-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long nPos
string sExp

if colName = "" or prop = "" then return ""

sExp = #DataWindow.Describe(colName+"."+prop)
nPos = Pos(sExp,"~t")

if nPos = 0 then
	return sExp
else
	sExp = "~""+Mid(sExp,nPos + 1)
	return #DataWindow.Describe("Evaluate("+sExp+",0)")
end if
end function

protected function string _of_getcolumnprop (readonly long colnum, readonly string prop);return _of_GetColumnProp("#"+String(ColNum),prop)
end function

protected function boolean _of_iscolumnvisible (readonly long colnum);return _of_IsColumnVisible("#" + String(colNum))
end function

protected function boolean _of_iscolumnvisible (readonly string colname);//====================================================================
// Function: _of_isvisible()
//--------------------------------------------------------------------
// Description: 判断指定列是否可见
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	colname	
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-11-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return (_of_GetColumnProp(colName,"visible") = "1")
end function

protected function boolean _of_iscolumnprotected (readonly string colname);//====================================================================
// Function: _of_isitemprotected()
//--------------------------------------------------------------------
// Description: 判断指定列是否为受保存的
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	colname	
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-11-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return (_of_GetColumnProp(colName,"protect") = "1")
end function

protected function boolean _of_iscolumnprotected (readonly long colnum);return _of_IsColumnProtected("#" + String(colNum))
end function

protected function boolean _of_iscolumneditable (readonly long colnum);return _of_IsColumnEditable("#" + String(colNum))
end function

protected function boolean _of_iscolumneditable (readonly string colname);//====================================================================
// Function: _of_iscolumneditable()
//--------------------------------------------------------------------
// Description: 判断指定列是否为编辑的
//--------------------------------------------------------------------
// Arguments:
// 	readonly	long	colnum	
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-11-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sProp

if Not _of_IsEditable() then return false
sProp = #DataWindow.Describe(colName + ".TabSequence")
if sProp = "0" or sProp = "32766" then return false
sProp = #DataWindow.Describe(colName+".Edit.DisplayOnly")
if sProp = "yes" then return false
if _of_IsColumnProtected(colName) then return false

return true
end function

protected function boolean _of_isitemeditable (readonly long row, readonly string colname);//====================================================================
// Function: _of_isitemeditable()
//--------------------------------------------------------------------
// Description: 判断指定单元格是否为编辑的
//--------------------------------------------------------------------
// Arguments:
// 	readonly	long	row   	
// 	readonly	long	colnum	
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-11-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if Not _of_IsColumnEditable(colName) then return false
if _of_IsItemProtected(row,colName) then return false
return true
end function

protected function boolean _of_isitemeditable (readonly long row, readonly long colnum);return _of_IsItemEditable(row,"#" + String(colNum))
end function

protected function integer _of_splitstring (string src, readonly string delimiter, ref string dstarray[], readonly boolean ignoreempty);long nPos,nLenDelimiter
string str
string emptyArray[]

nLenDelimiter =  Len(delimiter)
if nLenDelimiter = 0 then return 0

dstArray = emptyArray

nPos = Pos(src,delimiter)
do while (nPos > 0)
	str = Left(src,nPos - 1)
	if str <> "" or Not ignoreEmpty then
		dstArray[UpperBound(dstArray) + 1] = str
	end if
	src = Mid(src,nPos + nLenDelimiter)
	nPos = Pos(src,delimiter)
loop
if src <> "" then
	dstArray[UpperBound(dstArray) + 1] = src
end if

return UpperBound(dstArray)
end function

private function integer _of_splitstring (readonly string src, readonly string delimiter, ref string dstarray[]);return _of_SplitString(src,delimiter,ref dstArray,true)
end function

protected function boolean _of_hasdwobject (readonly string dwoname);return (Lower(#DataWindow.Describe(dwoname + ".Name")) = Lower(dwoname))
end function

protected function long _of_convertcoltype (readonly string coltype);//====================================================================
// Function: _of_convertcoltype()
//--------------------------------------------------------------------
// Description: 转换列类型为常量值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	coltype	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-11-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
choose case Left(colType,5)
	case "char","char("
		return COL_TYPE_STRING
	case "numbe","long","ulong"
		return COL_TYPE_INTEGER
	case "decim","real"
		return COL_TYPE_DECIMAL
	case "datet"
		return COL_TYPE_DATETIME
	case "date"
		return COL_TYPE_DATE
	case "time"
		return COL_TYPE_TIME
	case else
		return COL_TYPE_UNKNOWN
end choose
end function

protected function long _of_getcolumntype (readonly string name);//====================================================================
// Function: _of_getcolumntype()
//--------------------------------------------------------------------
// Description: 获取列类型
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	name	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-01-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _of_ConvertColType(#DataWindow.Describe(name+".ColType"))
end function

protected function long _of_getcolumntype (readonly long colnum);//====================================================================
// Function: _of_getcolumntype()
//--------------------------------------------------------------------
// Description: 获取列类型
//--------------------------------------------------------------------
// Arguments:
// 	readonly	long	colnum	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-01-28
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _of_ConvertColType(#DataWindow.Describe("#"+String(colNum)+".ColType"))
end function

protected function n_map _of_getcolumnvaluemap (readonly string colname);//====================================================================
// Function: of_getcolumnvaluemap()
//--------------------------------------------------------------------
// Description: 列号获取指定列的值映射表
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	colname	
//--------------------------------------------------------------------
// Returns:  n_map
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-10-26
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long nRow,nRowCnt,nIndex,nPos
string sProp,sDispCol,sDataCol,sDispColType,sDataColType
string sDispVal,sVal
any aVal
datawindowchild dwc
n_map map

map = Create n_map

if colName = "" or colName = "!" or colName = "?" then return map

sProp = #DataWindow.Describe(colName+".dddw.name")
if sProp <> "!" and sProp <> "?" then			//DDDW
	//if IsFailed(of_AutoRetrieveDDDW(colName)) then return map
	#DataWindow.GetChild(colName,ref dwc)
	if IsValidObject(dwc) then
		sDispCol = #DataWindow.Describe(colName+".dddw.displaycolumn")
		sDataCol = #DataWindow.Describe(colName+".dddw.datacolumn")
		sDispColType = dwc.Describe(sDispCol+".coltype")
		sDataColType = dwc.Describe(sDataCol+".coltype")
		if sDispColType = "" or sDispColType = "?" or sDispColType = "!" then return map
		if sDataColType = "" or sDataColType = "?" or sDataColType = "!" then return map
		nRowCnt = dwc.RowCount()
		for nRow = 1 to nRowCnt
			//Get display name
			choose case _of_ConvertColType(sDispColType)
				case COL_TYPE_STRING
					sDispVal = dwc.GetItemString(nRow,sDispCol)
				case COL_TYPE_DECIMAL
					sDispVal = String(dwc.GetItemDecimal(nRow,sDispCol))
				case COL_TYPE_INTEGER
					sDispVal = String(dwc.GetItemNumber(nRow,sDispCol))
				case COL_TYPE_DATETIME
					sDispVal = String(dwc.GetItemDateTime(nRow,sDispCol))
				case COL_TYPE_DATE
					sDispVal = String(dwc.GetItemDate(nRow,sDispCol))
				case COL_TYPE_TIME
					sDispVal = String(dwc.GetItemTime(nRow,sDispCol))
			end choose
			if IsNull(sDispVal) then continue
			//Get data
			choose case _of_ConvertColType(sDataColType)
				case COL_TYPE_STRING
					aVal = dwc.GetItemString(nRow,sDataCol)
				case COL_TYPE_DECIMAL
					aVal = String(dwc.GetItemDecimal(nRow,sDataCol))
				case COL_TYPE_INTEGER
					aVal = String(dwc.GetItemNumber(nRow,sDataCol))
				case COL_TYPE_DATETIME
					aVal = String(dwc.GetItemDateTime(nRow,sDataCol))
				case COL_TYPE_DATE
					aVal = String(dwc.GetItemDate(nRow,sDataCol))
				case COL_TYPE_TIME
					aVal = String(dwc.GetItemTime(nRow,sDataCol))
			end choose
			if IsNull(aVal) then continue
			map.Set(sDispVal,aVal)
		next
	end if
else
	sProp = #DataWindow.Describe(colName+".edit.style")
	if sProp = "checkbox" then
		//on
		sVal = #DataWindow.Describe(colName+".checkbox.on")
		map.Set("是",sVal)
		map.Set("Y",sVal)
		map.Set("√",sVal)
		//off
		sVal = #DataWindow.Describe(colName+".checkbox.off")
		map.Set("否",sVal)
		map.Set("N",sVal)
	else
		nIndex = 1
		sVal = #DataWindow.GetValue(colName,nIndex)
		do while(sVal <> "")
			nPos = Pos(sVal,"~t")
			if nPos > 0 then
				map.Set(Left(sVal,nPos - 1),Mid(sVal,nPos + 1))
			end if
			nIndex ++
			sVal = #DataWindow.GetValue(colName ,nIndex)
		loop
	end if
end if

return map
end function

protected function n_map _of_getcolumnvaluemap (readonly long colnum);return _of_GetColumnValueMap(#DataWindow.Describe("#" + String(colNum) + ".Name"))
end function

protected function integer _of_getobjectnames (ref string names[], readonly string stype, readonly string band);//====================================================================
// Function: of_getobjectnames()
//--------------------------------------------------------------------
// Description: 获取所有的对象名
//--------------------------------------------------------------------
// Arguments:
// 	reference	string	names[]	
// 	readonly		string	stype		指定类型
// 	readonly		string	band		指定区域
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-03-01
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sObjString
long nPos
string sName,sProp,emptyArray[]
boolean bMatched

sObjString = #DataWindow.Describe("DataWindow.Objects")

names = emptyArray

nPos = Pos(sObjString,"~t")
do while (nPos > 0)
	sName = Left(sObjString,nPos - 1)
	sProp = #DataWindow.Describe(sName + ".Band")
	if sProp = "!" or sProp = "?" then
		bMatched = false
	else
		bMatched = true
	end if
	if bMatched and sType <> "" then
		if #DataWindow.Describe(sName + ".Type") <> sType then
			bMatched = false
		end if
	end if
	if bMatched and band <> "" then
		if #DataWindow.Describe(sName + ".Band") <> band then
			bMatched = false
		end if
	end if
	if bMatched then
		names[UpperBound(names) + 1] = sName
	end if
	sObjString = Mid(sObjString,nPos + 1)
	nPos = Pos(sObjString,"~t")
loop
if sObjString <> "" then
	sProp = #DataWindow.Describe(sObjString + ".Band")
	if sProp = "!" or sProp = "?" then
		bMatched = false
	else
		bMatched = true
	end if
	if bMatched and sType <> "" then
		if #DataWindow.Describe(sObjString + ".Type") <> sType then
			bMatched = false
		end if
	end if
	if bMatched and band <> "" then
		if #DataWindow.Describe(sObjString + ".Band") <> band then
			bMatched = false
		end if
	end if
	if bMatched then
		names[UpperBound(names) + 1] = sObjString
	end if
end if

return UpperBound(names)
end function

protected function integer _of_getobjectnames (ref string names[], readonly string stype);return _of_GetObjectNames(ref names,sType,"")
end function

protected function integer _of_getobjectnames (ref string names[]);return _of_GetObjectNames(ref names,"","")
end function

protected function string _of_getdwoprop (readonly string dwoname, readonly string prop);//====================================================================
// Function: _of_getdwoprop()
//--------------------------------------------------------------------
// Description: 获取指定DWO对象的属性
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	dwoname	
// 	readonly	string	prop   	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-10-18
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long nPos
string sExp

sExp = #DataWindow.Describe(dwoName + "." + prop)
if sExp = "!" or sExp = "?" then return ""

nPos = Pos(sExp,"~t")
if nPos = 0 then
	return sExp
else
	sExp = "~""+Mid(sExp,nPos + 1)
	return #DataWindow.Describe("Evaluate("+sExp+",0)")
end if
end function

protected function string _of_getdwotext (readonly string dwoname);//====================================================================
// Function: _of_getdwotext()
//--------------------------------------------------------------------
// Description: 获取指定DWO对象的文本
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	dwoname	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-12-13
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _of_GetDWOProp(dwoName,"text")
end function

protected function string _of_getpropexp (readonly string prop);//====================================================================
// Function: _of_getpropexp()
//--------------------------------------------------------------------
// Description: 获取DW属性中的表达式
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	prop	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-04-27
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long nPos

nPos = Pos(prop,"~t")
if nPos > 0 then
	//取表达式（排除尾部'"'）
	return Mid(prop,nPos + 1,Len(prop) - nPos - 1)
else
	return prop
end if
end function

protected function boolean _of_hasgroup ();//====================================================================
// Function: of_hasgroup()
//--------------------------------------------------------------------
// Description: 是否存在分组统计
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-10-17
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if #DataWindow.Describe("DataWindow.Header.1.Height") <> "!" then return true
if #DataWindow.Describe("DataWindow.Trailer.1.Height") <> "!" then return true
return false
end function

on n_cst_dwsvc.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsvc.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

