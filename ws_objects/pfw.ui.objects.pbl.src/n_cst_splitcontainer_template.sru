$PBExportHeader$n_cst_splitcontainer_template.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_cst_splitcontainer_template from nonvisualobject
end type
type celldata from structure within n_cst_splitcontainer_template
end type
type rowdata from structure within n_cst_splitcontainer_template
end type
type objectdata from structure within n_cst_splitcontainer_template
end type
end forward

type celldata from structure
	string		name
	n_cst_splitcontainer_panel		panel
	long		conttype
	long		flag
	long		length
	long		blockindex
	long		tlblockindexes[]
	boolean		blockallocated
	boolean		ignore
end type

type rowdata from structure
	celldata		cols[]
end type

type objectdata from structure
	string		name
	windowobject		object
	boolean		visible
	double		width
	double		height
end type

global type n_cst_splitcontainer_template from nonvisualobject
event oninit ( u_cst_splitcontainer parentsplitcontainer )
end type
global n_cst_splitcontainer_template n_cst_splitcontainer_template

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

/*--- Properties ---*/
Public:
PrivateWrite u_cst_splitcontainer	#ParentSplitContainer

Private:
ROWDATA 		_tbl[]
OBJECTDATA 	_objects[]

//Reserved names
Constant String RESERVED_NAME_HORZ = "-"
Constant String RESERVED_NAME_VERT = "|"
//Continue types
Constant Long CONTINUE_NONE 	= 0
Constant Long CONTINUE_HORZ 	= 1
Constant Long CONTINUE_VERT 	= 2
//Continue flags
Constant Long CONTINUE_BEGIN 	= 1
Constant Long CONTINUE_END		= 2
end variables

forward prototypes
public function long of_begin (readonly string template)
public function long of_end ()
private function integer _of_getobjectindex (readonly string name)
private function integer _of_splitstring (string src, readonly string delimiter, ref string dstarray[])
public function long of_bind (readonly windowobject obj, readonly string name)
private subroutine _of_setpanelsize (n_cst_splitcontainer_panel panel, double width, double height)
public function long of_bind (readonly windowobject obj, readonly string name, readonly boolean visible, readonly double width, readonly double height)
public function long of_bind (readonly windowobject obj, readonly string name, readonly boolean visible)
public function long of_bind (readonly windowobject obj, readonly string name, readonly double width, readonly double height)
end prototypes

event oninit(u_cst_splitcontainer parentsplitcontainer);#ParentSplitContainer = parentSplitContainer
end event

public function long of_begin (readonly string template);int nIndex,nItemCnt
long nPos,nNLPos
long nRow,nCol,nRowCnt,nColCnt,nTLRow,nTLCol,nTRCol,nTmp,i,n
long nRowBlock,nColBlock
string sRow,sRowItems[]
CELLDATA cell,emptyCell
ROWDATA row,emptyRow
Constant String DELIMITER_COL 	= " "
Constant String DELIMITER_ROW 	= "~n"

if template = "" then return RetCode.E_INVALID_ARGUMENT

do
	sRow = ""
	nPos = Pos(template,DELIMITER_ROW,nNLPos + 1)
	if nPos > 0 then
		sRow = Mid(template,nNLPos + 1,nPos - nNLPos - 1)
		nNLPos = nPos
	elseif nNLPos > 0 then
		sRow = Mid(template,nNLPos + 1)
		nNLPos = 0
	elseif nNLPos = 0 then
		sRow = template
	end if
	nItemCnt = _of_SplitString(sRow,DELIMITER_COL,ref sRowItems)
	if nItemCnt = 0 then exit
	nRow = UpperBound(_tbl) + 1
	row = emptyRow
	for nIndex = 1 to nItemCnt
		nCol = UpperBound(row.cols) + 1
		if nColCnt > 0 and nCol > nColCnt then return RetCode.E_INVALID_ARGUMENT
		cell = emptyCell
		cell.name = sRowItems[nIndex]
		if nCol > 1 then
			if cell.name = row.cols[nCol - 1].name then
				if row.cols[nCol - 1].ignore then
					cell.ignore = true
				else
					if row.cols[nCol - 1].contType = CONTINUE_NONE then
						row.cols[nCol - 1].contType = CONTINUE_HORZ
						row.cols[nCol - 1].flag = CONTINUE_BEGIN
						row.cols[nCol - 1].length = 1
						cell.blockIndex = MakeLong(nRow,nCol - 1)
					else
						cell.blockIndex = row.cols[nCol - 1].blockIndex
					end if
					cell.contType = CONTINUE_HORZ
					row.cols[HiWord(cell.blockIndex)].length ++
				end if
			elseif row.cols[nCol - 1].contType = CONTINUE_HORZ then
				row.cols[nCol - 1].flag = CONTINUE_END
			end if
		end if
		if nRow > 1 and Not cell.ignore then
			if cell.name = _tbl[nRow - 1].cols[nCol].name then
				if _tbl[nRow - 1].cols[nCol].contType = CONTINUE_HORZ or _tbl[nRow - 1].cols[nCol].ignore then
					cell.ignore = true
				else
					if _tbl[nRow - 1].cols[nCol].contType = CONTINUE_NONE then
						_tbl[nRow - 1].cols[nCol].contType = CONTINUE_VERT
						_tbl[nRow - 1].cols[nCol].flag = CONTINUE_BEGIN
						_tbl[nRow - 1].cols[nCol].length = 1
						cell.blockIndex = MakeLong(nRow - 1,nCol)
					else
						cell.blockIndex = _tbl[nRow - 1].cols[nCol].blockIndex
					end if
					cell.contType = CONTINUE_VERT
					_tbl[LoWord(cell.blockIndex)].cols[nCol].length ++
				end if
			elseif _tbl[nRow - 1].cols[nCol].contType = CONTINUE_VERT then
				_tbl[nRow - 1].cols[nCol].flag = CONTINUE_END
			end if
		end if
		row.cols[nCol] = cell
	next
	if nColCnt = 0 then
		nColCnt = UpperBound(row.cols)
	elseif nColCnt <> UpperBound(row.cols) then
		return RetCode.E_INVALID_ARGUMENT
	end if
	//修正水平结束标志
	if row.cols[nColCnt].contType = CONTINUE_HORZ then
		row.cols[nColCnt].flag = CONTINUE_END
	end if
	_tbl[nRow] = row
loop until(nNLPos <= 0)

nRowCnt = UpperBound(_tbl)
if nRowCnt = 0 then return RetCode.E_INVALID_ARGUMENT

for nRow = 1 to nRowCnt
	for nCol = 1 to nColCnt
		//修正垂直结束标志
		if nRow = nRowCnt then
			if _tbl[nRow].cols[nCol].contType = CONTINUE_VERT then
				_tbl[nRow].cols[nCol].flag = CONTINUE_END
			end if
		end if
		if _tbl[nRow].cols[nCol].contType = CONTINUE_HORZ then
			//寻找水平连续区域的最大管理区域
			if _tbl[nRow].cols[nCol].flag = CONTINUE_BEGIN then
				nTLRow = 0
				nTLCol = nCol
				nTRCol = nCol + _tbl[nRow].cols[nCol].length
				for i = nRow - 1 to 1 step -1
					//top-left
					if _tbl[i].cols[nTLCol].contType = CONTINUE_HORZ then
						if _tbl[i].cols[nTLCol].flag = CONTINUE_BEGIN then
							if nTLCol + _tbl[i].cols[nTLCol].length < nTRCol then
								nTLRow = i
							else
								exit
							end if
						else
							nTmp = HiWord(_tbl[i].cols[nTLCol].blockIndex)
							if nTmp + _tbl[i].cols[nTmp].length >= nTRCol then
								exit
							end if
							for n = nTmp to nCol - 1
								if (_tbl[nRow].cols[n].contType <> CONTINUE_NONE and _tbl[nRow].cols[n].flag <> CONTINUE_BEGIN) or _tbl[nRow].cols[n].ignore then
									nTmp = 0
									exit
								end if
							next
							if nTmp > 0 then
								nTLRow = i
								nTLCol = nTmp
							else
								exit
							end if
						end if
					elseif Not _tbl[i].cols[nTLCol].ignore then
						nTLRow = i
					end if
					//top-right
					if nTRCol <= nColCnt then
						if _tbl[i].cols[nTRCol].contType = CONTINUE_HORZ then
							if _tbl[i].cols[nTRCol].flag <> CONTINUE_BEGIN then
								nColBlock = HiWord(_tbl[i].cols[nTRCol].blockIndex)
								nTRCol = nColBlock + _tbl[i].cols[nColBlock].length
							end if
						end if
					end if
				next
				if nTLRow > 0 then
					_tbl[nTLRow].cols[nTLCol].TLBlockIndexes[UpperBound(_tbl[nTLRow].cols[nTLCol].TLBlockIndexes) + 1] = MakeLong(nRow,nTRCol)
					for i = nTLCol + 1 to nTRCol - 1
						_tbl[nRow].cols[i].blockAllocated = true
					next
				end if
			end if
		else
			//检测不合法的连续区域
			if Not _tbl[nRow].cols[nCol].ignore then
				if nCol > 1 and nRow > 1 then
					if _tbl[nRow].cols[nCol - 1].name = _tbl[nRow - 1].cols[nCol].name then return RetCode.E_INVALID_ARGUMENT
				end if
				if nCol < nColCnt and nRow > 1 then
					if _tbl[nRow].cols[nCol + 1].name = _tbl[nRow - 1].cols[nCol].name then return RetCode.E_INVALID_ARGUMENT
				end if
				if nCol > 1 and nRow < nRowCnt then
					if _tbl[nRow].cols[nCol - 1].name = _tbl[nRow + 1].cols[nCol].name then return RetCode.E_INVALID_ARGUMENT
				end if
				if nCol < nColCnt and nRow < nRowCnt then
					if _tbl[nRow].cols[nCol + 1].name = _tbl[nRow + 1].cols[nCol].name then return RetCode.E_INVALID_ARGUMENT
				end if
			end if
		end if
	next
next

return RetCode.OK
end function

public function long of_end ();int nObjIndex
long nRow,nCol,nRowCnt,nColCnt,i
long nRowBlock,nColBlock,nLength
boolean bLockUpdate
n_cst_splitcontainer subContainer
n_cst_splitcontainer_panel ctxPanel
Constant String TAG_USED = "{TEMPLATE_USED}"

nRowCnt = UpperBound(_tbl)
if nRowCnt = 0 then return RetCode.FAILED

bLockUpdate = #ParentSplitContainer.#LockUpdate
#ParentSplitContainer.#LockUpdate = true

_tbl[1].cols[1].panel = #ParentSplitContainer.Panel1

for nRow = 1 to nRowCnt
	if nColCnt = 0 then nColCnt = UpperBound(_tbl[nRow].cols)
	for nCol = 1 to nColCnt
		if _tbl[nRow].cols[nCol].ignore then continue
		if _tbl[nRow].cols[nCol].contType <> CONTINUE_NONE and _tbl[nRow].cols[nCol].flag = 0 then continue
		
		if _tbl[nRow].cols[nCol].contType <> CONTINUE_NONE and _tbl[nRow].cols[nCol].flag <> CONTINUE_BEGIN and _tbl[nRow].cols[nCol].blockIndex > 0 then
			//取得连续块的context panel
			nRowBlock = LoWord(_tbl[nRow].cols[nCol].blockIndex)
			nColBlock = HiWord(_tbl[nRow].cols[nCol].blockIndex)
			ctxPanel = _tbl[nRowBlock].cols[nColBlock].panel
		else
			ctxPanel = _tbl[nRow].cols[nCol].panel
		end if
		//拆分水平最大管理区域
		if _tbl[nRow].cols[nCol].contType = CONTINUE_NONE or _tbl[nRow].cols[nCol].flag = CONTINUE_BEGIN then
			for i = UpperBound(_tbl[nRow].cols[nCol].TLBlockIndexes) to 1 step -1
				nRowBlock = LoWord(_tbl[nRow].cols[nCol].TLBlockIndexes[i])
				nColBlock = HiWord(_tbl[nRow].cols[nCol].TLBlockIndexes[i])
				if nColBlock <= nColCnt then
					if (_tbl[nRow].cols[nColBlock].contType = CONTINUE_NONE or _tbl[nRow].cols[nColBlock].flag = CONTINUE_BEGIN) and Not _tbl[nRow].cols[nColBlock].ignore and Not IsValidObject(_tbl[nRow].cols[nColBlock].panel) then
						if ctxPanel = ctxPanel.#ParentSplitContainer.Panel1 and ctxPanel.#ParentSplitContainer.Panel2.#Tag <> TAG_USED then
							ctxPanel.#ParentSplitContainer.of_SetOrientation(Enums.VERT)
							_tbl[nRow].cols[nColBlock].panel = ctxPanel.#ParentSplitContainer.Panel2
						else
							subContainer = ctxPanel.of_BindSplitContainer(Enums.VERT)
							_tbl[nRow].cols[nCol].panel = subContainer.Panel1
							ctxPanel = subContainer.Panel1
							_tbl[nRow].cols[nColBlock].panel = subContainer.Panel2
						end if
						_tbl[nRow].cols[nColBlock].panel.#Tag = TAG_USED
					end if
				end if
				if ctxPanel = ctxPanel.#ParentSplitContainer.Panel1 and ctxPanel.#ParentSplitContainer.Panel2.#Tag <> TAG_USED then
					ctxPanel.#ParentSplitContainer.of_SetOrientation(Enums.HORZ)
					_tbl[nRowBlock].cols[nCol].panel = ctxPanel.#ParentSplitContainer.Panel2
				else
					subContainer = ctxPanel.of_BindSplitContainer(Enums.HORZ)
					_tbl[nRow].cols[nCol].panel = subContainer.Panel1
					ctxPanel = subContainer.Panel1
					_tbl[nRowBlock].cols[nCol].panel = subContainer.Panel2
				end if
				_tbl[nRowBlock].cols[nCol].panel.#Tag = TAG_USED
			next
		end if
		choose case _tbl[nRow].cols[nCol].contType
			case CONTINUE_NONE
				if nCol < nColCnt then
					if (_tbl[nRow].cols[nCol + 1].contType = CONTINUE_NONE or _tbl[nRow].cols[nCol + 1].flag = CONTINUE_BEGIN) and Not _tbl[nRow].cols[nCol + 1].ignore and Not IsValidObject(_tbl[nRow].cols[nCol + 1].panel) then
						if ctxPanel = ctxPanel.#ParentSplitContainer.Panel1 and ctxPanel.#ParentSplitContainer.Panel2.#Tag <> TAG_USED then
							ctxPanel.#ParentSplitContainer.of_SetOrientation(Enums.VERT)
							_tbl[nRow].cols[nCol + 1].panel = ctxPanel.#ParentSplitContainer.Panel2
						else
							subContainer = ctxPanel.of_BindSplitContainer(Enums.VERT)
							_tbl[nRow].cols[nCol].panel = subContainer.Panel1
							ctxPanel = subContainer.Panel1
							_tbl[nRow].cols[nCol + 1].panel = subContainer.Panel2
						end if
						_tbl[nRow].cols[nCol + 1].panel.#Tag = TAG_USED
					end if
				end if
				if nRow < nRowCnt then
					if (_tbl[nRow + 1].cols[nCol].contType = CONTINUE_NONE or _tbl[nRow + 1].cols[nCol].flag = CONTINUE_BEGIN) and Not _tbl[nRow + 1].cols[nCol].blockAllocated and Not _tbl[nRow + 1].cols[nCol].ignore and Not IsValidObject(_tbl[nRow + 1].cols[nCol].panel) then
						if ctxPanel = ctxPanel.#ParentSplitContainer.Panel1 and ctxPanel.#ParentSplitContainer.Panel2.#Tag <> TAG_USED then
							ctxPanel.#ParentSplitContainer.of_SetOrientation(Enums.HORZ)
							_tbl[nRow + 1].cols[nCol].panel = ctxPanel.#ParentSplitContainer.Panel2
						else
							subContainer = ctxPanel.of_BindSplitContainer(Enums.HORZ)
							_tbl[nRow].cols[nCol].panel = subContainer.Panel1
							ctxPanel = subContainer.Panel1
							_tbl[nRow + 1].cols[nCol].panel = subContainer.Panel2
						end if
						_tbl[nRow + 1].cols[nCol].panel.#Tag = TAG_USED
					end if
				end if
			case CONTINUE_HORZ
				if _tbl[nRow].cols[nCol].flag = CONTINUE_BEGIN then
					nLength = _tbl[nRow].cols[nCol].length
					if nCol + nLength <= nColCnt then
						if (_tbl[nRow].cols[nCol + nLength].contType = CONTINUE_NONE or _tbl[nRow].cols[nCol + nLength].flag = CONTINUE_BEGIN) and Not _tbl[nRow].cols[nCol + nLength].ignore and Not IsValidObject(_tbl[nRow].cols[nCol + nLength].panel) then
							if ctxPanel = ctxPanel.#ParentSplitContainer.Panel1 and ctxPanel.#ParentSplitContainer.Panel2.#Tag <> TAG_USED then
								ctxPanel.#ParentSplitContainer.of_SetOrientation(Enums.VERT)
								_tbl[nRow].cols[nCol + nLength].panel = ctxPanel.#ParentSplitContainer.Panel2
							else
								subContainer = ctxPanel.of_BindSplitContainer(Enums.VERT)
								_tbl[nRow].cols[nCol].panel = subContainer.Panel1
								ctxPanel = subContainer.Panel1
								_tbl[nRow].cols[nCol + nLength].panel = subContainer.Panel2
							end if
							_tbl[nRow].cols[nCol + nLength].panel.#Tag = TAG_USED
						end if
					end if
					if nRow < nRowCnt then
						for i = nRow + 1 to nRowCnt
							if _tbl[i].cols[nCol].ignore then continue
							if (_tbl[i].cols[nCol].contType = CONTINUE_NONE or _tbl[i].cols[nCol].flag = CONTINUE_BEGIN) and Not _tbl[i].cols[nCol].blockAllocated and Not IsValidObject(_tbl[i].cols[nCol].panel)  then
								if ctxPanel = ctxPanel.#ParentSplitContainer.Panel1 and ctxPanel.#ParentSplitContainer.Panel2.#Tag <> TAG_USED then
									ctxPanel.#ParentSplitContainer.of_SetOrientation(Enums.HORZ)
									_tbl[i].cols[nCol].panel = ctxPanel.#ParentSplitContainer.Panel2
								else
									subContainer = ctxPanel.of_BindSplitContainer(Enums.HORZ)
									_tbl[nRow].cols[nCol].panel = subContainer.Panel1
									ctxPanel = subContainer.Panel1
									_tbl[i].cols[nCol].panel = subContainer.Panel2
								end if
								_tbl[i].cols[nCol].panel.#Tag = TAG_USED
							end if
							exit
						next
					end if
				end if
			case CONTINUE_VERT
				if _tbl[nRow].cols[nCol].flag = CONTINUE_BEGIN then
					if nCol < nColCnt then
						if (_tbl[nRow].cols[nCol + 1].contType = CONTINUE_NONE or _tbl[nRow].cols[nCol + 1].flag = CONTINUE_BEGIN) and Not _tbl[nRow].cols[nCol + 1].ignore and Not IsValidObject(_tbl[nRow].cols[nCol + 1].panel)  then
							if ctxPanel = ctxPanel.#ParentSplitContainer.Panel1 and ctxPanel.#ParentSplitContainer.Panel2.#Tag <> TAG_USED then
								ctxPanel.#ParentSplitContainer.of_SetOrientation(Enums.VERT)
								_tbl[nRow].cols[nCol + 1].panel = ctxPanel.#ParentSplitContainer.Panel2
							else
								subContainer = ctxPanel.of_BindSplitContainer(Enums.VERT)
								_tbl[nRow].cols[nCol].panel = subContainer.Panel1
								ctxPanel = subContainer.Panel1
								_tbl[nRow].cols[nCol + 1].panel = subContainer.Panel2
							end if
							_tbl[nRow].cols[nCol + 1].panel.#Tag = TAG_USED
						end if
					end if
					nLength = _tbl[nRow].cols[nCol].length
					if nRow + nLength <= nRowCnt then
						if (_tbl[nRow + nLength].cols[nCol].contType = CONTINUE_NONE or _tbl[nRow + nLength].cols[nCol].flag = CONTINUE_BEGIN) and Not _tbl[nRow + nLength].cols[nCol].blockAllocated and Not _tbl[nRow + nLength].cols[nCol].ignore and Not IsValidObject(_tbl[nRow + nLength].cols[nCol].panel) then
							if ctxPanel = ctxPanel.#ParentSplitContainer.Panel1 and ctxPanel.#ParentSplitContainer.Panel2.#Tag <> TAG_USED then
								ctxPanel.#ParentSplitContainer.of_SetOrientation(Enums.HORZ)
								_tbl[nRow + nLength].cols[nCol].panel = ctxPanel.#ParentSplitContainer.Panel2
							else
								subContainer = ctxPanel.of_BindSplitContainer(Enums.HORZ)
								_tbl[nRow].cols[nCol].panel = subContainer.Panel1
								ctxPanel = subContainer.Panel1
								_tbl[nRow + nLength].cols[nCol].panel = subContainer.Panel2
							end if
							_tbl[nRow + nLength].cols[nCol].panel.#Tag = TAG_USED
						end if
					end if
				end if
		end choose
		if _tbl[nRow].cols[nCol].contType = CONTINUE_NONE or _tbl[nRow].cols[nCol].flag = CONTINUE_END then
			if _tbl[nRow].cols[nCol].name = RESERVED_NAME_HORZ or _tbl[nRow].cols[nCol].name = RESERVED_NAME_VERT then
				ctxPanel.of_SetVisible(false)
			else
				nObjIndex = _of_GetObjectIndex(_tbl[nRow].cols[nCol].name)
				if nObjIndex > 0 then
					if _objects[nObjIndex].width > 0 or _objects[nObjIndex].height > 0 then
						_of_SetPanelSize(ctxPanel,_objects[nObjIndex].width,_objects[nObjIndex].height)
					end if
					if Not _objects[nObjIndex].visible then
						ctxPanel.of_SetVisible(false)
					end if
					ctxPanel.of_BindObject(_objects[nObjIndex].object)
				end if
			end if
		end if
	next
next

#ParentSplitContainer.#LockUpdate = bLockUpdate
#ParentSplitContainer.of_UpdatePoints()

return RetCode.OK
end function

private function integer _of_getobjectindex (readonly string name);int nIndex

for nIndex = UpperBound(_objects) to 1 step -1
	if _objects[nIndex].name = name then return nIndex
next

return 0
end function

private function integer _of_splitstring (string src, readonly string delimiter, ref string dstarray[]);long nPos,nLenDelimiter
string str
string emptyArray[]

nLenDelimiter =  Len(delimiter)
if nLenDelimiter = 0 then return 0

dstArray = emptyArray

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

public function long of_bind (readonly windowobject obj, readonly string name);return of_Bind(obj,name,true,0,0)
end function

private subroutine _of_setpanelsize (n_cst_splitcontainer_panel panel, double width, double height);n_cst_splitcontainer container

container = panel.#ParentSplitContainer
do while IsValid(container)
	if width > 0 then
		if container.#Orientation = Enums.VERT then
			panel.of_SetSize(width)
			width = 0
		end if
	end if
	if height > 0 then
		if container.#Orientation = Enums.HORZ then
			panel.of_SetSize(height)
			height = 0
		end if
	end if
	if width = 0 and height = 0 then exit
	panel = container.#ParentPanel
	if Not IsValidObject(panel) then exit
	container = panel.#ParentSplitContainer
loop
end subroutine

public function long of_bind (readonly windowobject obj, readonly string name, readonly boolean visible, readonly double width, readonly double height);OBJECTDATA objData

if UpperBound(_tbl) = 0 then return RetCode.FAILED
if Not IsValidObject(obj) then return RetCode.E_INVALID_OBJECT
if name = "" or name = RESERVED_NAME_HORZ or name = RESERVED_NAME_VERT then return RetCode.E_INVALID_ARGUMENT

objData.object = obj
objData.name = name
objData.visible = visible
objData.width = width
objData.height = height
_objects[UpperBound(_objects) + 1] = objData

return RetCode.OK
end function

public function long of_bind (readonly windowobject obj, readonly string name, readonly boolean visible);return of_Bind(obj,name,visible,0,0)
end function

public function long of_bind (readonly windowobject obj, readonly string name, readonly double width, readonly double height);return of_Bind(obj,name,true,width,height)
end function

on n_cst_splitcontainer_template.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_splitcontainer_template.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

