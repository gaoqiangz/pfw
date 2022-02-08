$PBExportHeader$n_cst_appconfig.sru
forward
global type n_cst_appconfig from nonvisualobject
end type
end forward

global type n_cst_appconfig from nonvisualobject
end type
global n_cst_appconfig n_cst_appconfig

type variables
public:
privatewrite string #FileName 			//配置文件名称
privatewrite string #AppName	= "APP"	//程序名称（根节点名称）

private:
n_xmldoc _xmlDoc
n_crypto _crypto

boolean _bUpdating //标志当前处于批量更新状态

//AES256加密秘钥
string _sSecKey = "Hqt7SemUbrTZEmpvEdPCkqYycHCYH8aZ"
end variables

forward prototypes
public function n_xmldoc of_getconfigdoc ()
public function long of_updateconfig (readonly string nodepath, readonly longlong value)
public function long of_updateconfig (readonly string nodepath, readonly double value)
public function long of_updateconfig (readonly string nodepath, readonly boolean value)
public function long of_saveconfig ()
public function boolean of_getconfigboolean (readonly string nodepath)
public function double of_getconfigdouble (readonly string nodepath)
public function long of_getconfiglong (readonly string nodepath)
public function longlong of_getconfiglonglong (readonly string nodepath)
public function string of_getconfigstring (readonly string nodepath)
public function double of_getconfigdouble (readonly string nodepath, readonly double default)
public function boolean of_getconfigboolean (readonly string nodepath, readonly boolean default)
public function long of_getconfiglong (readonly string nodepath, readonly long default)
public function longlong of_getconfiglonglong (readonly string nodepath, readonly longlong default)
public function string of_getconfigstring (readonly string nodepath, readonly string default)
public function long of_updateconfig (readonly string nodepath, readonly long value)
public function n_xmlnode of_createnodebypath (string nodepath)
public function string of_getconfigstringprotected (readonly string nodepath, readonly string default)
public function string of_getconfigstringprotected (readonly string nodepath)
public subroutine of_updateconfigbegin ()
public subroutine of_updateconfigend ()
public function long of_updateregistry (readonly string key, readonly string valuename, readonly string value)
public function long of_updateregistry (readonly string key, readonly string valuename, readonly unsignedlong value)
public function string of_getregistrystring (readonly string key, readonly string valuename, readonly string default)
public function unsignedlong of_getregistrylong (readonly string key, readonly string valuename, readonly unsignedlong default)
public function string of_getregistrystring (readonly string key, readonly string valuename)
public function unsignedlong of_getregistrylong (readonly string key, readonly string valuename)
public function string of_getrealregistrykey (string key)
public function string of_getregistrystringprotected (readonly string key, readonly string valuename, readonly string default)
public function string of_getregistrystringprotected (readonly string key, readonly string valuename)
public function long of_updateregistryprotected (readonly string key, readonly string valuename, string value)
public function long of_updateconfigprotected (readonly string nodepath, string value)
public function boolean of_isvalid ()
public function n_xmlnode of_getconfignode (string nodepath, readonly boolean createifempty)
public function n_xmlnode of_getconfignode (readonly string nodepath)
public function long of_updateconfig (readonly string nodepath, readonly string value, readonly boolean cdata)
public function long of_updateconfig (readonly string nodepath, readonly string value)
public function long of_closefile ()
private function long _of_updateconfig (readonly string nodepath, readonly string value, readonly boolean cdata)
private function long _of_updateconfig (readonly string nodepath, readonly any value)
private function long _of_split (string src, readonly string delimiter, ref string dstarray[])
private function string _of_getrealpath (string nodepath, readonly boolean query)
public function string of_queryconfigstring (readonly string xpath)
public function longlong of_queryconfiglonglong (readonly string xpath)
public function long of_queryconfiglong (readonly string xpath)
public function boolean of_queryconfigboolean (readonly string xpath)
public function double of_queryconfigdouble (readonly string xpath)
public function string of_queryconfigstringprotected (readonly string xpath)
public function long of_openfile (readonly string filename, readonly string appname, readonly string seckey)
public function long of_openfile (readonly string filename, readonly string appname)
public function long of_openfile (readonly string filename)
end prototypes

public function n_xmldoc of_getconfigdoc ();//====================================================================
// Function: of_getconfigdoc()
//--------------------------------------------------------------------
// Description: 获取文档对象
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  n_xmldoc
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return _xmlDoc
end function

public function long of_updateconfig (readonly string nodepath, readonly longlong value);return _of_UpdateConfig(nodePath,value)
end function

public function long of_updateconfig (readonly string nodepath, readonly double value);return _of_UpdateConfig(nodePath,value)
end function

public function long of_updateconfig (readonly string nodepath, readonly boolean value);return _of_UpdateConfig(nodePath,value)
end function

public function long of_saveconfig ();//====================================================================
// Function: of_saveconfig()
//--------------------------------------------------------------------
// Description: 保存配置文件
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if _bUpdating then return RetCode.FAILED
if _xmlDoc.SaveFile(#FileName) <> RetCode.XML_OK then return RetCode.FAILED

return RetCode.OK
end function

public function boolean of_getconfigboolean (readonly string nodepath);return of_GetConfigBoolean(nodepath,false)
end function

public function double of_getconfigdouble (readonly string nodepath);return of_GetConfigDouble(nodepath,0)
end function

public function long of_getconfiglong (readonly string nodepath);return of_GetConfigLong(nodepath,0)
end function

public function longlong of_getconfiglonglong (readonly string nodepath);return of_GetConfigLongLong(nodepath,0)
end function

public function string of_getconfigstring (readonly string nodepath);return of_GetConfigString(nodepath,"")
end function

public function double of_getconfigdouble (readonly string nodepath, readonly double default);//====================================================================
// Function: of_getconfigstring()
//--------------------------------------------------------------------
// Description: 获取指定节点的指定文本浮点值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	nodepath 	
// 	readonly	double	default  	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_xmlnode node

node = of_GetConfigNode(nodePath)

return node.GetTextDouble(default)
end function

public function boolean of_getconfigboolean (readonly string nodepath, readonly boolean default);//====================================================================
// Function: of_getconfigstring()
//--------------------------------------------------------------------
// Description: 获取指定节点的指定文本布尔值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	nodepath 	
// 	readonly	bool	default  	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_xmlnode node

node = of_GetConfigNode(nodePath)

return node.GetTextBoolean(default)
end function

public function long of_getconfiglong (readonly string nodepath, readonly long default);//====================================================================
// Function: of_getconfigstring()
//--------------------------------------------------------------------
// Description: 获取指定节点的指定文本整型值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	nodepath 	
// 	readonly	long	default  	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_xmlnode node

node = of_GetConfigNode(nodePath)

return node.GetTextLong(default)
end function

public function longlong of_getconfiglonglong (readonly string nodepath, readonly longlong default);//====================================================================
// Function: of_getconfigstring()
//--------------------------------------------------------------------
// Description: 获取指定节点的指定文本扩展整型值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	nodepath 	
// 	readonly	longlong	default  	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_xmlnode node

node = of_GetConfigNode(nodePath)

return node.GetTextLongLong(default)
end function

public function string of_getconfigstring (readonly string nodepath, readonly string default);//====================================================================
// Function: of_getconfigstring()
//--------------------------------------------------------------------
// Description: 获取指定节点的指定文本字符串值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	nodepath 	
// 	readonly	string	default  	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_xmlnode node

node = of_GetConfigNode(nodePath)

return Trim(node.GetTextString(default))
end function

public function long of_updateconfig (readonly string nodepath, readonly long value);return _of_UpdateConfig(nodePath,value)
end function

public function n_xmlnode of_createnodebypath (string nodepath);//====================================================================
// Function: of_createnodebypath()
//--------------------------------------------------------------------
// Description: 根据指定路径创建节点（路径语法：Node1/Node2/Node3）
//--------------------------------------------------------------------
// Arguments:
// 	value	string	nodepath	
//--------------------------------------------------------------------
// Returns:  n_xmlnode
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sNodes[]
int index,nCount
n_xmlnode node,parentNode

if nodepath = "" then return node

nCount = _of_Split(_of_GetRealPath(nodepath,false),"/",ref sNodes)

parentNode = _xmlDoc

for index = 1 to nCount
	node = parentNode.GetChild(sNodes[index])
	if node.IsEmpty() then
		node = parentNode.AddChild(sNodes[index])
	end if
	parentNode = node
next

return node
end function

public function string of_getconfigstringprotected (readonly string nodepath, readonly string default);//====================================================================
// Function: of_getconfigstringprotected()
//--------------------------------------------------------------------
// Description: 获取指定节点的指定文本字符串值（密文并解密）
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	nodepath 	
// 	readonly	string	default  	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sVal
n_xmlnode node

node = of_GetConfigNode(nodePath)
sVal = Trim(node.GetTextString())
if sVal = "" then return default

//解密
sVal = _crypto.SymDecrypt(sVal,_sSecKey,Enums.CRYPTO_SYMCRYPT_TYPE_AES256)
if Len(sVal) <= 0 then return default

return sVal
end function

public function string of_getconfigstringprotected (readonly string nodepath);return of_GetConfigStringProtected(nodepath,"")
end function

public subroutine of_updateconfigbegin ();//====================================================================
// Function: of_updateconfigbegin()
//--------------------------------------------------------------------
// Description: 开始批量更新配置文件
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-22
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
_bUpdating = true
end subroutine

public subroutine of_updateconfigend ();//====================================================================
// Function: of_updateconfigend()
//--------------------------------------------------------------------
// Description: 结束批量更新并保存文件
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-22
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if _bUpdating then
	_bUpdating = false
	of_SaveConfig()
end if
end subroutine

public function long of_updateregistry (readonly string key, readonly string valuename, readonly string value);//====================================================================
// Function: of_updateregistry()
//--------------------------------------------------------------------
// Description: 更新注册表项的字符串值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	key      	
// 	readonly	string	valuename	
// 	readonly	string	value    	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if RegistrySet(of_GetRealRegistryKey(key),valuename,RegString!,Trim(value)) = 1 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_updateregistry (readonly string key, readonly string valuename, readonly unsignedlong value);//====================================================================
// Function: of_updateregistry()
//--------------------------------------------------------------------
// Description: 更新注册表项的整型值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	key      	
// 	readonly	string	valuename	
// 	readonly	ulong 	value    	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if RegistrySet(of_GetRealRegistryKey(key),valuename,RegULong!,value) = 1 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function string of_getregistrystring (readonly string key, readonly string valuename, readonly string default);//====================================================================
// Function: of_getregistrystring()
//--------------------------------------------------------------------
// Description: 获取注册表项的字符串值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	key      	
// 	readonly	string	valuename	
// 	readonly	string	default  	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sVal

RegistryGet(of_GetRealRegistryKey(key),valuename,RegString!,ref sVal)
sVal = Trim(sVal)
if sVal = "" then sVal = default

return sVal
end function

public function unsignedlong of_getregistrylong (readonly string key, readonly string valuename, readonly unsignedlong default);//====================================================================
// Function: of_getregistrylong()
//--------------------------------------------------------------------
// Description: 获取注册表项的整型值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	key      	
// 	readonly	string	valuename	
// 	readonly	ulong 	default  	
//--------------------------------------------------------------------
// Returns:  unsignedlong
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
ulong nVal

RegistryGet(of_GetRealRegistryKey(key),valuename,RegULong!,ref nVal)
if nVal = 0 then nVal = default

return nVal
end function

public function string of_getregistrystring (readonly string key, readonly string valuename);return of_GetRegistryString(key,valuename,"")
end function

public function unsignedlong of_getregistrylong (readonly string key, readonly string valuename);return of_GetRegistryLong(key,valuename,0)
end function

public function string of_getrealregistrykey (string key);//====================================================================
// Function: of_getrealregistrykey()
//--------------------------------------------------------------------
// Description: 获取注册表项的真实路径
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	key	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
key = Trim(key)

if key = "" then return key
if Left(key,5) = "HKEY_" then return key
if Left(key,1) <> "\" then key = "\" + key

return ("HKEY_CURRENT_USER\Software\" + #AppName + key)
end function

public function string of_getregistrystringprotected (readonly string key, readonly string valuename, readonly string default);//====================================================================
// Function: of_getregistrystringprotected()
//--------------------------------------------------------------------
// Description: 获取注册表项的字符串值（密文解密）
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	key      	
// 	readonly	string	valuename	
// 	readonly	string	default  	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sVal

RegistryGet(of_GetRealRegistryKey(key),valuename,RegString!,ref sVal)
sVal = Trim(sVal)
if sVal = "" then return default

//解密
sVal = _crypto.SymDecrypt(sVal,_sSecKey,Enums.CRYPTO_SYMCRYPT_TYPE_AES256)
if Len(sVal) <= 0 then return default

return sVal
end function

public function string of_getregistrystringprotected (readonly string key, readonly string valuename);return of_GetRegistryStringProtected(key,valuename,"")
end function

public function long of_updateregistryprotected (readonly string key, readonly string valuename, string value);//====================================================================
// Function: of_updateregistryprotected()
//--------------------------------------------------------------------
// Description: 更新注册表项的字符串值（文明加密）
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	key      	
// 	readonly	string	valuename	
// 	readonly	string	value    	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
value = Trim(value)
//文明加密
if value <> "" then
	value = _crypto.SymEncrypt(value,_sSecKey,Enums.CRYPTO_SYMCRYPT_TYPE_AES256)
	if Len(value) <= 0 then return RetCode.FAILED
end if

if RegistrySet(of_GetRealRegistryKey(key),valuename,RegString!,value) = 1 then
	return RetCode.OK
else
	return RetCode.FAILED
end if
end function

public function long of_updateconfigprotected (readonly string nodepath, string value);//====================================================================
// Function: of_updateconfigprotected()
//--------------------------------------------------------------------
// Description: 更新指定节点的字符串值（明文加密）
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	nodepath	
// 	readonly	string	value   	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-25
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
value = Trim(value)
//文明加密
if value <> "" then
	value = _crypto.SymEncrypt(value,_sSecKey,Enums.CRYPTO_SYMCRYPT_TYPE_AES256)
	if Len(value) <= 0 then return RetCode.FAILED
end if

return _of_UpdateConfig(nodePath,value,false)
end function

public function boolean of_isvalid ();//====================================================================
// Function: of_isvalid()
//--------------------------------------------------------------------
// Description: 检查配置文件是否有效
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-22
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if #FileName = "" then return false
if _xmlDoc.IsEmpty() then return false
if _xmlDoc.Find(#AppName).IsEmpty() then return false

return true
end function

public function n_xmlnode of_getconfignode (string nodepath, readonly boolean createifempty);//====================================================================
// Function: of_getconfignode()
//--------------------------------------------------------------------
// Description: 获取指定节点对象
//--------------------------------------------------------------------
// Arguments:
// 	value   	string 	nodepath     	
// 	readonly	boolean	createifempty	
//--------------------------------------------------------------------
// Returns:  n_xmlnode
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2016-10-08
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_xmlnode node

nodePath = _of_GetRealPath(nodePath,false)
node = _xmlDoc.Find(nodePath)
if createIfEmpty then
	if node.IsEmpty() then
		node = of_CreateNodeByPath(nodePath)
	end if
end if

return node
end function

public function n_xmlnode of_getconfignode (readonly string nodepath);return of_GetConfigNode(nodePath,false)
end function

public function long of_updateconfig (readonly string nodepath, readonly string value, readonly boolean cdata);return _of_UpdateConfig(nodePath,Trim(value),cData)
end function

public function long of_updateconfig (readonly string nodepath, readonly string value);return _of_UpdateConfig(nodePath,Trim(value),false)
end function

public function long of_closefile ();//====================================================================
// Function: of_closefile()
//--------------------------------------------------------------------
// Description: 卸载配置文件
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if Not _xmlDoc.IsValid() then return RetCode.FAILED
of_SaveConfig()
_xmlDoc.Parse("")
return RetCode.OK
end function

private function long _of_updateconfig (readonly string nodepath, readonly string value, readonly boolean cdata);//====================================================================
// Function: _of_updateconfig()
//--------------------------------------------------------------------
// Description: 更新指定的节点文本并保存配置文件(如果没有该节点则创建)
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	nodepath	
// 	readonly	string	value   	
//	readonly boolean cdata
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_xmlnode node

node = of_GetConfigNode(nodePath,true)
if node.IsEmpty() then return RetCode.FAILED

if cData then
	node.RemoveChildren()
	node.AddChild(Enums.XML_NODE_CDATA).SetValue(value)
else
	node.SetText(value)
end if

return of_SaveConfig()
end function

private function long _of_updateconfig (readonly string nodepath, readonly any value);//====================================================================
// Function: _of_updateconfig()
//--------------------------------------------------------------------
// Description: 更新指定的节点文本并保存配置文件(如果没有该节点则创建)
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	nodepath	
// 	readonly	any	value   	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_xmlnode node

node = of_GetConfigNode(nodePath,true)
if node.IsEmpty() then return RetCode.FAILED

choose case ClassName(value)
	case "string"
		string sVal
		sVal = value
		node.SetText(sVal)
	case "long"
		long lVal
		lVal = value
		node.SetText(lVal)
	case "longlong"
		longlong llVal
		llVal = value
		node.SetText(llVal)
	case "double"
		double fVal
		fVal = value
		node.SetText(fVal)
	case "boolean"
		boolean bVal
		bVal = value
		node.SetText(bVal)
	case else
		return RetCode.E_INVALID_ARGUMENT
end choose

return of_SaveConfig()
end function

private function long _of_split (string src, readonly string delimiter, ref string dstarray[]);long nPos,nLenDelimiter
string str
string emptyArray[]

dstArray = emptyArray

if IsNull(src) then return 0

nLenDelimiter =  Len(delimiter)
if nLenDelimiter = 0 then return 0

nPos = Pos(src,delimiter)
do while (nPos > 0)
	str = Left(src,nPos - 1)
	if str <> "" then
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

private function string _of_getrealpath (string nodepath, readonly boolean query);//====================================================================
// Function: _of_getrealpath()
//--------------------------------------------------------------------
// Description: 获取节点路径的真实路径
//--------------------------------------------------------------------
// Arguments:
// 	value	string	nodepath	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
nodePath = Trim(nodePath)

if nodepath = "" then return nodePath
if Left(nodePath,Len(#AppName)) = #AppName then return nodePath
if Left(nodePath,1) <> "/" then nodePath = "/" + nodePath

if Not query then
	//将节点名称的特殊字符统一替换为'_'
	nodePath = RegExpReplace(nodePath,"[\@\#\$\%\^\&\~~\!\:\;\'\~"\.\(\)\[\]]","_")
end if

return #AppName + nodePath
end function

public function string of_queryconfigstring (readonly string xpath);//====================================================================
// Function: of_queryconfigstring()
//--------------------------------------------------------------------
// Description: 查询(XPATH)指定节点的指定文本字符串值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	xpath 	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sVal
n_xmlqueryresult result

result = _xmlDoc.Query(_of_GetRealPath(xpath,true))
choose case result.GetValueType()
	case Enums.XML_XPATH_TYPE_NODE_SET
		sVal = Trim(result.GetValueNode().GetTextString())
	case Enums.XML_XPATH_TYPE_STRING
		sVal = result.GetValueString()
	case Enums.XML_XPATH_TYPE_NUMBER
		sVal = String(result.GetValueNumber())
	case Enums.XML_XPATH_TYPE_BOOLEAN
		sVal = String(result.GetValueBoolean())
end choose

return sVal
end function

public function longlong of_queryconfiglonglong (readonly string xpath);//====================================================================
// Function: of_queryconfiglonglong()
//--------------------------------------------------------------------
// Description: 查询(XPATH)指定节点的指定文本扩展整型值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	xpath 	
//--------------------------------------------------------------------
// Returns:  long long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return LongLong(of_QueryConfigString(xpath))
end function

public function long of_queryconfiglong (readonly string xpath);//====================================================================
// Function: of_queryconfiglonglong()
//--------------------------------------------------------------------
// Description: 查询(XPATH)指定节点的指定文本整型值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	xpath 	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return Long(of_QueryConfigString(xpath))
end function

public function boolean of_queryconfigboolean (readonly string xpath);//====================================================================
// Function: of_queryconfigboolean()
//--------------------------------------------------------------------
// Description: 查询(XPATH)指定节点的指定文本布尔值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	xpath 	
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sVal

sVal = Upper(of_QueryConfigString(xpath))

return (sVal = "Y" or sVal = "TRUE" or sVal = "1")
end function

public function double of_queryconfigdouble (readonly string xpath);//====================================================================
// Function: of_queryconfigdouble()
//--------------------------------------------------------------------
// Description: 查询(XPATH)指定节点的指定文本浮点值
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	xpath 	
//--------------------------------------------------------------------
// Returns:  double
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return Double(of_QueryConfigString(xpath))
end function

public function string of_queryconfigstringprotected (readonly string xpath);//====================================================================
// Function: of_queryconfigstringprotected()
//--------------------------------------------------------------------
// Description: 查询(XPATH)指定节点的指定文本字符串值(解密)
//--------------------------------------------------------------------
// Arguments:
// 	readonly	string	xpath 	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string sVal

sVal = of_QueryConfigString(xpath)
if sVal = "" then return ""

//解密
sVal = _crypto.SymDecrypt(sVal,_sSecKey,Enums.CRYPTO_SYMCRYPT_TYPE_AES256)
if Len(sVal) <= 0 then return ""

return sVal
end function

public function long of_openfile (readonly string filename, readonly string appname, readonly string seckey);//====================================================================
// Function: of_openfile()
//--------------------------------------------------------------------
// Description: 加载配置文件
//--------------------------------------------------------------------
// Arguments:
// 	readonly   string 	filename     	
// 	readonly   string 	appname     	
// 	readonly   string 	seckey     	AES256加密秘钥
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gaoqiangz@msn.com		Date: 2015-09-21
//--------------------------------------------------------------------
//	Copyright (c) 金千枝（深圳）软件技术有限公司, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long hFile
n_xmlparseresult rs

if fileName = "" then return RetCode.E_INVALID_ARGUMENT

#FileName = fileName

if appName <> "" then
	#AppName = appName
end if
if secKey <> "" then
	_sSecKey = secKey
end if

if #AppName = "" then return RetCode.FAILED

if Not FileExists(fileName) then
	//配置文件不存在时则创建
	hFile = FileOpen(fileName,LineMode!,Write!,LockReadWrite!,Replace!,EncodingUTF8!)
	if hFile = -1 then
		//Logger.Error("创建配置文件失败")
		return RetCode.E_IO_ERROR
	end if
	FileWrite(hFile,'<?xml version="1.0" encoding="utf-8"?>')
	FileWrite(hFile,Sprintf('<{1}>',#AppName))
	FileWrite(hFile,Sprintf('</{1}>',#AppName))
	FileClose(hFile)
end if

rs = _xmlDoc.LoadFile(fileName,Enums.XML_PARSE_DEFAULT + Enums.XML_PARSE_DECLARATION + Enums.XML_PARSE_COMMENTS)
if rs.GetStatus() <> RetCode.XML_OK then
	//Logger.Error("配置文件解析失败~nError:{1}~nOffset:{2}",rs.GetDescription(),rs.GetOffset())
	return RetCode.FAILED
end if
if _xmlDoc.IsEmpty() then return RetCode.FAILED

return RetCode.OK
end function

public function long of_openfile (readonly string filename, readonly string appname);return of_OpenFile(fileName,appName,"")
end function

public function long of_openfile (readonly string filename);return of_OpenFile(fileName,"","")
end function

on n_cst_appconfig.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_appconfig.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;_xmlDoc = Create n_xmldoc
_crypto = Create n_crypto
end event

event destructor;Destroy _xmlDoc
Destroy _crypto
end event

