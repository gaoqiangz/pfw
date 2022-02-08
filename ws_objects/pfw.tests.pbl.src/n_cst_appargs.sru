$PBExportHeader$n_cst_appargs.sru
forward
global type n_cst_appargs from nonvisualobject
end type
end forward

global type n_cst_appargs from nonvisualobject
end type
global n_cst_appargs n_cst_appargs

type variables
private:
n_json _jsArgs
end variables

forward prototypes
public function long of_parse (readonly string cmdline)
public function string of_getvaluestring (readonly string arg, readonly string default)
public function string of_getvaluestring (readonly string arg)
public function long of_getvaluelong (readonly string arg, readonly long default)
public function long of_getvaluelong (readonly string arg)
public function integer of_getvalues (readonly string arg, ref string values[])
public function boolean of_getvalueboolean (readonly string arg, readonly boolean default)
public function boolean of_getvalueboolean (readonly string arg)
public function integer of_getcount ()
public function string of_getname (readonly integer index)
public function boolean of_exists (readonly string arg)
public function string of_serialize ()
public function long of_add (readonly string arg)
public function long of_add (readonly string arg, readonly string value)
public function long of_add (readonly string arg, readonly boolean value)
public function long of_add (readonly string arg, readonly long value)
public function long of_set (readonly string arg, readonly string value)
public function long of_set (readonly string arg, readonly boolean value)
public function long of_set (readonly string arg, readonly long value)
public function long of_remove (readonly string arg)
public function long of_removeall ()
public function long of_parsewithverify (readonly string cmdline, readonly string validargs[])
end prototypes

public function long of_parse (readonly string cmdline);//====================================================================
// Function: of_parse()
//--------------------------------------------------------------------
// Description: 解析命令行参数
//		参数以'/'或'-'开始
//			/ARG1 /ARG2 /ARG3 val /ARG4 "val val" /ARG5 val1 /ARG5 val2
//		解析到JSON:
//				{"ARG1":"","ARG2":"","ARG3":"val","ARG4":"val val","ARG5":["val1","val2"]}
//		*参数名区分大小写
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	cmdline	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-10-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long nPos,nLen,nArgBegin,nArgValBegin
string sCmdLine,sArg,sArgVal
boolean bQuote,bPreSpace
n_json jsArgVal

sCmdLine = Trim(cmdLine)
if sCmdLine = "" then return RetCode.E_INVALID_ARGUMENT

_jsArgs.Reset()

//添加trailer
sCmdLine += " /"

nLen = Len(sCmdLine)
for nPos = 1 to nLen
	choose case Mid(sCmdLine,nPos,1)
		case "~""
			bQuote = Not bQuote
			if bQuote and nArgBegin > 0 then return RetCode.E_INVALID_ARGUMENT
			if nArgValBegin = 0 then
				nArgValBegin = nPos + 1
			end if
			bPreSpace = (Not bQuote)
		case "/","-"
			if bQuote then continue
			if nArgBegin > 0 then continue
			if nArgValBegin > 0 then
				if Not bPreSpace then continue
				if sArg = "" then return RetCode.E_INVALID_ARGUMENT
				sArgVal = Trim(Mid(sCmdLine,nArgValBegin,nPos - nArgValBegin))
				if Left(sArgVal,1) = "~"" then sArgVal = LeftTrim(Mid(sArgVal,2))
				if Right(sArgVal,1) = "~"" then sArgVal = RightTrim(Left(sArgVal,Len(sArgVal) - 1))
				if sArgVal <> "" then
					//设置参数值
					if jsArgVal.GetType() = Enums.JSON_TYPE_STRING then
						if jsArgVal.GetValueString() = "" then
							jsArgVal.SetValue(sArgVal)
						else
							jsArgVal.AddItem(jsArgVal.GetValueString())
							jsArgVal.AddItem(sArgVal)
						end if
					else
						jsArgVal.AddItem(sArgVal)
					end if
				end if
				nArgValBegin = 0
				sArg = ""
			end if
			nArgBegin = nPos + 1
		case " ","~t","~n"
			if bQuote then continue
			if nArgBegin > 0 then
				sArg = Mid(sCmdLine,nArgBegin,nPos - nArgBegin)
				if sArg = "" then
					return RetCode.E_INVALID_ARGUMENT
				end if
				jsArgVal = _jsArgs.GetItem(sArg)
				if jsArgVal.IsEmpty() then
					//添加参数
					jsArgVal = Create n_json
					jsArgVal.SetValue("")
					_jsArgs.AddItem(sArg,jsArgVal)
				end if
				nArgBegin = 0
			end if
			if nArgValBegin = 0 then
				nArgValBegin = nPos + 1
			end if
			bPreSpace = true
		case else
			bPreSpace = false
	end choose
next

//messagebox("",_jsArgs.Serialize())

return RetCode.OK
end function

public function string of_getvaluestring (readonly string arg, readonly string default);//====================================================================
// Function: of_getvaluestring()
//--------------------------------------------------------------------
// Description: 获取参数的字符串值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	arg	
// 	readonly	string	default	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-10-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sVal
n_json jsVal

jsVal = _jsArgs.GetItem(arg)
choose case jsVal.GetType()
	case Enums.JSON_TYPE_STRING
		sVal = jsVal.GetValueString()
	case Enums.JSON_TYPE_ARRAY
		//数组返回最后一个值
		sVal = jsVal.GetItemString(jsVal.GetItemCount())
end choose
if sVal = "" then return default

return sVal
end function

public function string of_getvaluestring (readonly string arg);return of_GetValueString(arg,"")
end function

public function long of_getvaluelong (readonly string arg, readonly long default);//====================================================================
// Function: of_getvaluelong()
//--------------------------------------------------------------------
// Description: 设置参数的整数值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	arg	
// 	readonly	long	default	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-10-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long nVal

nVal = Long(of_GetValueString(arg,""))
if nVal = 0 then return default

return nVal
end function

public function long of_getvaluelong (readonly string arg);return of_GetValueLong(arg,0)
end function

public function integer of_getvalues (readonly string arg, ref string values[]);//====================================================================
// Function: of_getvalues()
//--------------------------------------------------------------------
// Description: 获取参数的所有字符串值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	arg	
// 	ref	string	values[]	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-10-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int nIndex,nCount
string sEmpty[]
n_json jsVals

values = sEmpty

jsVals = _jsArgs.GetItem(arg)
choose case jsVals.GetType()
	case Enums.JSON_TYPE_STRING
		nCount = 1
		values[1] = jsVals.GetValueString()
	case Enums.JSON_TYPE_ARRAY
		nCount = jsVals.GetItemCount()
		for nIndex = 1 to nCount
			values[nIndex] = jsVals.GetItemString(nIndex)
		next
end choose

return nCount
end function

public function boolean of_getvalueboolean (readonly string arg, readonly boolean default);//====================================================================
// Function: of_getvalueboolean()
//--------------------------------------------------------------------
// Description: 设置参数的BOOL值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	arg	
// 	readonly	boolean	default	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-10-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sVal

sVal = of_GetValueString(arg,"")
choose case Upper(sVal)
	case "TRUE","1","Y"
		return true
	case "FALSE","0","N"
		return false
	case else
		return default
end choose
end function

public function boolean of_getvalueboolean (readonly string arg);return of_GetValueBoolean(arg,false)
end function

public function integer of_getcount ();//====================================================================
// Function: of_getcount()
//--------------------------------------------------------------------
// Description: 获取参数数量
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-10-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _jsArgs.GetItemCount()
end function

public function string of_getname (readonly integer index);//====================================================================
// Function: of_getname()
//--------------------------------------------------------------------
// Description: 获取参数名称
//--------------------------------------------------------------------
// Arguments:
// 	readonly	integer	index	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-10-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _jsArgs.GetItemName(index)
end function

public function boolean of_exists (readonly string arg);//====================================================================
// Function: of_exists()
//--------------------------------------------------------------------
// Description: 判断是否设置了指定参数
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	arg	
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2017-10-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _jsArgs.HasItem(arg)
end function

public function string of_serialize ();//====================================================================
// Function: of_serialize()
//--------------------------------------------------------------------
// Description: 序列化参数列表
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-07-09
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
int nIndex,nCount,nArrIdx,nArrCnt
string sCmdLine,sVal
n_json jsItem

nCount = _jsArgs.GetItemCount()
for nIndex = 1 to nCount
	if sCmdLine <> "" then sCmdLine += " "
	jsItem = _jsArgs.GetItem(nIndex)
	if jsItem.IsArray() then
		nArrCnt = jsItem.GetItemCount()
		for nArrIdx = 1 to nArrCnt
			if nArrIdx > 1 then sCmdLine += " "
			sCmdLine += "/" + jsItem.GetName() + " ~"" + jsItem.GetItemString(nArrIdx) + "~""
		next
	else
		sVal = jsItem.GetValueString()
		if sVal <> "" then sVal = " ~"" + sVal + "~""
		sCmdLine += "/" + jsItem.GetName() + sVal
	end if
next

return sCmdLine
end function

public function long of_add (readonly string arg);//====================================================================
// Function: of_add()
//--------------------------------------------------------------------
// Description: 添加指定参数
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	arg	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-07-09
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if arg = "" then return RetCode.E_INVALID_ARGUMENT

if Not _jsArgs.HasItem(arg) then
	_jsArgs.AddItem(arg,"")
end if

return RetCode.OK
end function

public function long of_add (readonly string arg, readonly string value);//====================================================================
// Function: of_add()
//--------------------------------------------------------------------
// Description: 添加指定参数
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	arg	
// 	readonly	string	value	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-07-09
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_json jsItem

if arg = "" or value = "" then return RetCode.E_INVALID_ARGUMENT

jsItem = _jsArgs.GetItem(arg)
if jsItem.IsEmpty() then
	_jsArgs.AddItem(arg,value)
elseif jsItem.IsArray() then
	jsItem.AddItem(value)
else
	if jsItem.GetValueString() = "" then
		jsItem.SetValue(value)
	else
		jsItem.AddItem(jsItem.GetValueString())
		jsItem.AddItem(value)
	end if
end if

return RetCode.OK
end function

public function long of_add (readonly string arg, readonly boolean value);if value then
	return of_Add(arg,"Y")
else
	return of_Add(arg,"N")
end if
end function

public function long of_add (readonly string arg, readonly long value);return of_Add(arg,String(value))
end function

public function long of_set (readonly string arg, readonly string value);//====================================================================
// Function: of_set()
//--------------------------------------------------------------------
// Description: 设置指定参数
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	arg	
// 	readonly	string	value	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-07-09
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if arg = "" then return RetCode.E_INVALID_ARGUMENT

_jsArgs.SetItem(arg,value)

return RetCode.OK
end function

public function long of_set (readonly string arg, readonly boolean value);if value then
	return of_Set(arg,"Y")
else
	return of_Set(arg,"N")
end if
end function

public function long of_set (readonly string arg, readonly long value);return of_Set(arg,String(value))
end function

public function long of_remove (readonly string arg);//====================================================================
// Function: of_remove()
//--------------------------------------------------------------------
// Description: 移除指定参数
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	arg	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-07-09
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if arg = "" then return RetCode.E_INVALID_ARGUMENT

_jsArgs.RemoveItem(arg)

return RetCode.OK
end function

public function long of_removeall ();//====================================================================
// Function: of_removeall()
//--------------------------------------------------------------------
// Description: 移除所有参数
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	arg	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-07-09
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
_jsArgs.RemoveAll()
return RetCode.OK
end function

public function long of_parsewithverify (readonly string cmdline, readonly string validargs[]);//====================================================================
// Function: of_parsewithverify()
//--------------------------------------------------------------------
// Description: 解析命令行参数并校验参数列表
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	cmdline    	
// 	readonly	string	validargs[]	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2018-07-19
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long rtCode
int nIndex,nCount,nArgIdx,nArgCnt
string sArgName

rtCode = of_Parse(cmdLine)
if rtCode <> RetCode.OK then return rtCode

nArgCnt = UpperBound(validArgs)

nCount = of_GetCount()
for nIndex = 1 to nCount
	sArgName = of_GetName(nIndex)
	//*"_"开头的参数为隐藏参数
	if Left(sArgName,1) = "_" then continue
	for nArgIdx = 1 to nArgCnt
		if validArgs[nArgIdx] = sArgName then exit
	next
	if nArgIdx > nArgCnt then return nIndex
next

return RetCode.OK
end function

on n_cst_appargs.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_appargs.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;_jsArgs = Create n_json
end event

event destructor;Destroy _jsArgs
end event

