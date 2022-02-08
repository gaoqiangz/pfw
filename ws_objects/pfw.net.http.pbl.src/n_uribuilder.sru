$PBExportHeader$n_uribuilder.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_uribuilder from nonvisualobject
end type
type querydata from structure within n_uribuilder
end type
end forward

type QUERYDATA from structure
	string		name
	string		value
end type

global type n_uribuilder from nonvisualobject
end type
global n_uribuilder n_uribuilder

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

Private:
String _host
String _path[]
QUERYDATA _query[]
end variables

forward prototypes
public function n_uribuilder sethost (readonly string host)
public function n_uribuilder addpath (readonly string path)
public function n_uribuilder addquery (readonly string name, readonly string value)
public function n_uribuilder addquery (readonly string name, readonly long value)
public function n_uribuilder addquery (readonly string name, readonly double value)
public function n_uribuilder addquery (readonly string name, readonly date value)
public function n_uribuilder addquery (readonly string name, readonly datetime value)
public function n_uribuilder addquery (readonly string name, readonly longlong value)
public function string serialize ()
end prototypes

public function n_uribuilder sethost (readonly string host);_host = host
return this
end function

public function n_uribuilder addpath (readonly string path);if path = "" then return this
_path[UpperBound(_path) + 1] = path
return this
end function

public function n_uribuilder addquery (readonly string name, readonly string value);int nIndex
if name = "" or value = "" then return this
nIndex = UpperBound(_query) + 1
_query[nIndex].name = name
_query[nIndex].value = value
return this
end function

public function n_uribuilder addquery (readonly string name, readonly long value);return AddQuery(name,String(value))
end function

public function n_uribuilder addquery (readonly string name, readonly double value);return AddQuery(name,String(value))
end function

public function n_uribuilder addquery (readonly string name, readonly date value);return AddQuery(name,String(value,"YYYY-MM-DD"))
end function

public function n_uribuilder addquery (readonly string name, readonly datetime value);return AddQuery(name,String(value,"YYYY-MM-DD HH:MM:SS"))
end function

public function n_uribuilder addquery (readonly string name, readonly longlong value);return AddQuery(name,String(value))
end function

public function string serialize ();string ls_uri
int nIndex,nCount

ls_uri = Trim(_host)
if Right(ls_uri,1) <> "/" then ls_uri += "/"
	
nCount = UpperBound(_path)
for nIndex = 1 to nCount
	if nIndex > 1 then ls_uri += "/"
	ls_uri += _path[nIndex]
next
if ls_uri = "" then return ""
if Right(ls_uri,1) <> "?" then ls_uri += "?"

nCount = UpperBound(_query)
for nIndex = 1 to nCount
	if nIndex > 1 then ls_uri += "&"
	ls_uri += _query[nIndex].name + "=" + _query[nIndex].value
next

return ls_uri
end function

on n_uribuilder.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_uribuilder.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

