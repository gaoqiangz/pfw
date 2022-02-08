$PBExportHeader$u_cst_tabpage_control_splitcontainer.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_control_splitcontainer from ue_cst_tabpage
end type
type rb_3 from se_cst_radiobox within u_cst_tabpage_control_splitcontainer
end type
type dw_9 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
end type
type dw_8 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
end type
type rb_2 from se_cst_radiobox within u_cst_tabpage_control_splitcontainer
end type
type rb_1 from se_cst_radiobox within u_cst_tabpage_control_splitcontainer
end type
type sle_layoutinfo from se_cst_singlelineedit within u_cst_tabpage_control_splitcontainer
end type
type cb_3 from se_cst_button within u_cst_tabpage_control_splitcontainer
end type
type cb_2 from se_cst_button within u_cst_tabpage_control_splitcontainer
end type
type dw_1 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
end type
type dw_2 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
end type
type dw_3 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
end type
type dw_4 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
end type
type cb_1 from se_cst_button within u_cst_tabpage_control_splitcontainer
end type
type dw_5 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
end type
type dw_6 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
end type
type dw_7 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
end type
type uo_splitcontainer from ue_cst_splitcontainer within u_cst_tabpage_control_splitcontainer
end type
end forward

global type u_cst_tabpage_control_splitcontainer from ue_cst_tabpage
integer width = 3927
integer height = 1684
rb_3 rb_3
dw_9 dw_9
dw_8 dw_8
rb_2 rb_2
rb_1 rb_1
sle_layoutinfo sle_layoutinfo
cb_3 cb_3
cb_2 cb_2
dw_1 dw_1
dw_2 dw_2
dw_3 dw_3
dw_4 dw_4
cb_1 cb_1
dw_5 dw_5
dw_6 dw_6
dw_7 dw_7
uo_splitcontainer uo_splitcontainer
end type
global u_cst_tabpage_control_splitcontainer u_cst_tabpage_control_splitcontainer

type variables

end variables

forward prototypes
public subroutine of_defaultlayout ()
public subroutine of_ninegridslayout ()
public subroutine of_templatelayout ()
end prototypes

public subroutine of_defaultlayout ();/*
	每一个分割容器(SplitContainer)有两个面板(Panel1,Panel2)，容器的分割有垂直(面板左右排列)和水平(面板上下排列)
	每个面板可以与一个可视控件绑定(of_BindObject)或嵌入一个新的分割容器(of_BindSplitContainer)
	面板的大小可以是(-1：自动，0~1面板所在分割容器的比例，1~MAX：固定大小)
	面板可以设置最小大小(of_SetMinSize)和最大大小(of_SetMaxSize)，可以设置是否可以折叠(of_SetCollapsible)
	面板可以带标题栏(of_SetTitleBar/of_SetTitle)
	面板可以设置外间距(of_SetMargin)还可以设置内间距(of_SetPadding)
	当一个面板被折叠之后另一个面板将获得整个容器的大小（填充）并显示一个带折叠按钮的分割条(SplitBar)
	当一个面板被隐藏后另一个面板也将获得整个容器的大小（填充）但不显示分割条(SplitBar)
	分割条的大小由splitcontainer.of_SetSplitBarSize设置
	u_cst_splitcontainer是对n_cst_splitcontainer对象的封装，以避免在创建多个分割容器(SplitContainer)的时候创建可视对象，提高性能和减小内存占用
*/
n_cst_splitcontainer splitContainer,splitContainer2,splitContainer3

SetRedraw(false)

uo_splitcontainer.#LockUpdate = true

//释放当前布局
uo_splitcontainer.of_Reset()

uo_splitcontainer.of_SetOrientation(Enums.VERT)
uo_splitcontainer.Panel1.of_SetSize(0.3)
uo_splitcontainer.Panel2.of_SetSize(0.7)

uo_splitcontainer.Panel1.of_SetMinSize(200)
//uo_splitcontainer.Panel1.of_SetMaxSize(500)

uo_splitcontainer.Panel1.of_SetCollapsible(true)
uo_splitcontainer.Panel2.of_SetCollapsible(true)

splitContainer = uo_splitcontainer.Panel1.of_BindSplitContainer(Enums.HORZ)

splitContainer.Panel1.of_SetSize(0.3)
splitContainer.Panel2.of_SetSize(0.7)

splitContainer.Panel1.of_SetCollapsible(true)
splitContainer.Panel2.of_SetCollapsible(true)
splitContainer.Panel1.of_SetTitleBar(true)
splitContainer.Panel2.of_SetTitlebar(true)

//splitContainer.Panel1.of_SetMargin(20,20,20,20)
//splitContainer.Panel2.of_SetMargin(20,20,20,20)

splitContainer.Panel1.of_SetPadding(0,-1,0,0)
splitContainer.Panel1.of_SetTitle("测试标题1")
splitContainer.Panel1.of_SetImage("Open!")
splitContainer.Panel2.of_SetPadding(0,-1,0,0)
splitContainer.Panel2.of_SetTitle("测试标题2")
splitContainer.Panel2.of_SetImage("Save!")

splitContainer.Panel1.of_BindObject(dw_1)
splitContainer.Panel2.of_BindObject(dw_2)

splitContainer = uo_splitcontainer.Panel2.of_BindSplitContainer(Enums.VERT)

splitContainer.Panel1.of_SetCollapsible(true)
splitContainer.Panel2.of_SetCollapsible(true)

splitContainer2 = splitContainer.Panel1.of_BindSplitContainer(Enums.HORZ)

splitContainer2.Panel1.of_SetCollapsible(true)
splitContainer2.Panel2.of_SetCollapsible(true)
splitContainer2.Panel2.of_SetTitlebar(true)

splitContainer2.Panel2.of_SetPadding(8,4,8,0)
splitContainer2.Panel2.of_SetMultiLine(true)
splitContainer2.Panel2.of_SetTitle("测试标题~n这是一个容器的标题")
splitContainer2.Panel2.of_SetImage("se_cst_datawindow!")

splitContainer3 = splitContainer2.Panel1.of_BindSplitContainer(Enums.HORZ)

splitContainer3.Panel1.of_SetCollapsible(true)
splitContainer3.Panel2.of_SetCollapsible(true)
splitContainer3.Panel1.of_SetTitleBar(true)
splitContainer3.Panel2.of_SetTitlebar(true)

splitContainer3.Panel1.of_SetPadding(0,-1,0,0)
splitContainer3.Panel1.of_SetTitle("测试标题")
splitContainer3.Panel1.of_SetImage("Open!")
splitContainer3.Panel2.of_SetPadding(0,-1,0,0)
splitContainer3.Panel2.of_SetTitle("测试标题")
splitContainer3.Panel2.of_SetImage("Save!")

splitContainer3.Panel1.of_BindObject(dw_3)
splitContainer3.Panel2.of_BindObject(dw_4)

splitContainer2 = splitContainer2.Panel2.of_BindSplitContainer(Enums.VERT)

splitContainer2.Panel1.of_SetSize(0.3)
splitContainer2.Panel2.of_SetSize(0.7)

//splitContainer4.Panel1.of_SetMargin(0,4,0,0)
//splitContainer4.Panel2.of_SetMargin(0,4,0,0)

splitContainer2.Panel1.of_SetCollapsible(true)
splitContainer2.Panel2.of_SetCollapsible(true)
splitContainer2.Panel1.of_SetTitleBar(true)
splitContainer2.Panel1.of_SetTitleBarFixedSize(true)

splitContainer2.Panel1.of_SetPadding(0,-1,0,0)
splitContainer2.Panel1.of_SetTitle("测试标题")
splitContainer2.Panel1.of_SetImage("Open!")
splitContainer2.Panel1.#Tag = "CUSTOM_COLOR"
splitContainer2.Panel1.#Data = ARGB(255,58,153,217)

//splitContainer2.Panel1.of_SetMargin(20,20,20,20)
splitContainer2.Panel1.of_BindObject(dw_5)

splitContainer3 = splitContainer2.Panel2.of_BindSplitContainer(Enums.VERT)

splitContainer3.Panel1.of_SetCollapsible(true)
splitContainer3.Panel2.of_SetCollapsible(true)
splitContainer3.Panel1.of_SetTitleBar(true)
splitContainer3.Panel1.of_SetTitleBarFixedSize(true)
splitContainer3.Panel2.of_SetTitlebar(true)
splitContainer3.Panel2.of_SetTitleBarFixedSize(true)

splitContainer3.Panel1.of_SetPadding(0,-1,0,0)
splitContainer3.Panel1.of_SetTitle("测试标题")
splitContainer3.Panel1.of_SetImage("Open!")
splitContainer3.Panel1.of_SetTitleAlign(Center!)
splitContainer3.Panel1.#Tag = "CUSTOM_COLOR"
splitContainer3.Panel1.#Data = ARGB(255,228,124,46)
splitContainer3.Panel2.of_SetPadding(0,-1,0,0)
splitContainer3.Panel2.of_SetTitle("测试标题")
splitContainer3.Panel2.of_SetImage("Save!")
splitContainer3.Panel2.of_SetTitleAlign(Right!)
splitContainer3.Panel2.#Tag = "CUSTOM_COLOR"
splitContainer3.Panel2.#Data = ARGB(255,57,204,116)

//splitContainer3.Panel1.of_SetMargin(20,20,20,20)
//splitContainer3.Panel2.of_SetMargin(20,20,20,20)
splitContainer3.Panel1.of_BindObject(dw_6)
splitContainer3.Panel2.of_BindObject(dw_7)

splitContainer2 = splitContainer.Panel2.of_BindSplitContainer(Enums.HORZ)

splitContainer2.Panel1.of_SetSize(0.3)
splitContainer2.Panel2.of_SetSize(0.7)

splitContainer2.Panel1.of_SetCollapsible(true)
splitContainer2.Panel2.of_SetCollapsible(true)
splitContainer2.Panel1.of_SetTitleBar(true)
splitContainer2.Panel2.of_SetTitlebar(true)

//splitContainer2.Panel1.of_SetMargin(20,20,20,20)
//splitContainer2.Panel2.of_SetMargin(20,20,20,20)

splitContainer2.Panel1.of_SetPadding(0,-1,0,0)
splitContainer2.Panel1.of_SetTitle("测试标题1")
splitContainer2.Panel1.of_SetImage("Open!")
splitContainer2.Panel2.of_SetPadding(0,-1,0,0)
splitContainer2.Panel2.of_SetTitle("测试标题2")
splitContainer2.Panel2.of_SetImage("Save!")

splitContainer2.Panel1.of_BindObject(dw_8)
splitContainer2.Panel2.of_BindObject(dw_9)

uo_splitcontainer.#LockUpdate = false
uo_splitcontainer.of_UpdatePoints()

SetRedraw(true)
end subroutine

public subroutine of_ninegridslayout ();//说明：
//*默认情况下Panel的大小都是自动适应的,各占所在容器SplitContainer一半的大小
//*Panel的of_SetSize函数设置Panel的初始大小
//*    为什么是初始大小,因为Panel的实际大小可以被用户调整SplitBar而改变,并且与#MinSize和#MaxSize以及容器的大小相关,可以将它看作是一个建议的大小
//*    其参数含义为(-1:自适应,0~1:相对所在容器的比例,1~MAX:一个固定的值)
//九宫格的实现思想：
//设容器最大大小为100%,每一个Panel大约占比33%
//将第一个Panel大小设置为0.33(33%)之后第二个Panel自适应为剩余的大小0.67(67%)
//最后第二个Panel内子容器的各Panel将自适应为大约0.33(33%，相对于主容器)
n_cst_splitcontainer subSplitContainerH,subSplitContainerV

SetRedraw(false)

uo_splitcontainer.#LockUpdate = true

//释放当前布局
uo_splitcontainer.of_Reset()

//先将容器分割为三行
uo_splitcontainer.of_SetOrientation(Enums.HORZ)

uo_splitcontainer.Panel1.of_SetSize(0.33)
uo_splitcontainer.Panel1.of_SetCollapsible(true)
uo_splitcontainer.Panel2.of_SetCollapsible(true)

subSplitContainerH = uo_splitcontainer.Panel2.of_BindSplitContainer(Enums.HORZ)
subSplitContainerH.Panel1.of_SetCollapsible(true)
subSplitContainerH.Panel2.of_SetCollapsible(true)

//将第一行分割为三列
subSplitContainerV = uo_splitcontainer.Panel1.of_BindSplitContainer(Enums.VERT)
subSplitContainerV.Panel1.of_SetSize(0.33)
subSplitContainerV.Panel1.of_SetCollapsible(true)
subSplitContainerV.Panel2.of_SetCollapsible(true)

//绑定对象
subSplitContainerV.Panel1.of_BindObject(dw_1)

subSplitContainerV = subSplitContainerV.Panel2.of_BindSplitContainer(Enums.VERT)
subSplitContainerV.Panel1.of_SetCollapsible(true)
subSplitContainerV.Panel2.of_SetCollapsible(true)

//绑定对象
subSplitContainerV.Panel1.of_BindObject(dw_2)
subSplitContainerV.Panel2.of_BindObject(dw_3)

//将第二行分割为三列
subSplitContainerV = subSplitContainerH.Panel1.of_BindSplitContainer(Enums.VERT)
subSplitContainerV.Panel1.of_SetSize(0.33)
subSplitContainerV.Panel1.of_SetCollapsible(true)
subSplitContainerV.Panel2.of_SetCollapsible(true)

//绑定对象
subSplitContainerV.Panel1.of_BindObject(dw_4)

subSplitContainerV = subSplitContainerV.Panel2.of_BindSplitContainer(Enums.VERT)
subSplitContainerV.Panel1.of_SetCollapsible(true)
subSplitContainerV.Panel2.of_SetCollapsible(true)

//绑定对象
subSplitContainerV.Panel1.of_BindObject(dw_5)
subSplitContainerV.Panel2.of_BindObject(dw_6)

//将第三行分割为三列
subSplitContainerV = subSplitContainerH.Panel2.of_BindSplitContainer(Enums.VERT)
subSplitContainerV.Panel1.of_SetSize(0.33)
subSplitContainerV.Panel1.of_SetCollapsible(true)
subSplitContainerV.Panel2.of_SetCollapsible(true)

//绑定对象
subSplitContainerV.Panel1.of_BindObject(dw_7)

subSplitContainerV = subSplitContainerV.Panel2.of_BindSplitContainer(Enums.VERT)
subSplitContainerV.Panel1.of_SetCollapsible(true)
subSplitContainerV.Panel2.of_SetCollapsible(true)

//绑定对象
subSplitContainerV.Panel1.of_BindObject(dw_8)
subSplitContainerV.Panel2.of_BindObject(dw_9)

uo_splitcontainer.#LockUpdate = false
uo_splitcontainer.of_UpdatePoints()

SetRedraw(true)
end subroutine

public subroutine of_templatelayout ();/*
	1.模板定义的语法:
	
			元素名1+空格+元素名2[+换行符]
		
		-元素名可以是任何字符串
		-元素名是大小写敏感的
		-空格必须是半角,连续的空格会被合并
		-如果有多行,最后一行可以不加换行符
		-每一行的列数必须相同!
		*特殊的元素名:"-","|",该元素名不允许绑定任何控件并且所在区域将会隐藏!
		
	2.拆分算法的优先级: 列 > 行
	
	3.同一行中连续的相同名称的元素会形成一块连续的区域,如:
			A B C D
			E F F F
			G H I J
		其中[F]为一块连续的区域,这个区域的上侧和下侧的元素都会被拆分到这个区域内,如[B],[C],[D]和[H],[I],[J],而[A],[E],[G]则被折分到左侧的区域内
		
	4.连续区域的放大特性,如:
			A B B C C D
			E F G G H I
			J K L M N O
		上面的模板定义了3个连续的区域:[B],[C],[G],其中[G]连接了[B],[C],这时会使[G]的区域边界会被放大到[B]的左侧和[C]的右侧,此时[G]所形成的区域实际为:
			B B C C
			F G G H
		这种放大特性还会被体现在隔行的情况下:
			A B B C C D
			J K L M N O
			E F G G H I
		[G]所形成的区域实际为:
			B B C C
			K L M N
			F G G H
		嵌套放大:
			A A B C C D
			J L L M M O
			E F G G H I
		[G]所形成的区域实际为:
			A A B C C
			J L L M M
			E F G G H
		
	5.连续区域放大的终止条件:
		1) 遇到第一行
		2) 遇到比放大区域更大或者相同的区域(此时放大区域属于该区域的子区域)
		3) 放大区域的左侧在新的水平区域范围内有不可拆分的元素
		
		例:
			A A B B
			C D E F
			C G G H
		[G]所形成的区域实际为:
			D E
			G G
		例:
			A A A B
			C D E F
			G H H I
		[H]所形成的区域实际为:
			D E
			H H
		例:
			A B C D E
			F F G G I
			J K L L M
		[F]所形成的区域实际为:
			A B
			F F
			J K
		[G]所形成的区域实际为:
			C D
			G G
			L L
		[L]所形成的区域实际为:
			L L
			
	注:
		SplitContainer的模板功能只负责拆分面板(panel),不保证与定义描述的外观完全相同,这是由SplitContainer的布局模型决定的,所以你可能需要做一些微调才能与定义的外观相同.
	注2:
		对于一些语义不清的模板定义,SplitContainer的模板功能可能会拆分出与预期完全不同的布局,这个时候你需要代码微调一下或者手动去拆分布局,如:
			A A B B
			C D E F
			C G G I
		区域[G]连接了[A],[B]两个区域,而[G]又没有被放大,这里就发生了管理权的冲突,这是由SplitContainer的布局模型决定的!
		*要产生上面定义的那种模板外观可以用模板特殊的元素名使模板引擎强制拆分区域达到此效果:
			A A B B
			-  -  - -
			C D E F
			C G G I
		区域[-]会被隐藏
		
	注3:
		有一些布局定义是SplitContainer无法拆分的,如:
			A B B B
			A C D E
			A F G E
			H H H E
		区域[E]将拆分不出来,这是由SplitContainer的布局模型决定的!
*/
int nIndex
n_cst_splitcontainer_panel panel
SetRedraw(false)

uo_splitcontainer.#LockUpdate = true

//释放当前布局
uo_splitcontainer.of_Reset()

//初始化模板布局
uo_splitcontainer.of_TemplateBegin(	"dw_1 dw_1 dw_2 dw_2 dw_3~n" + &
												"dw_4 dw_5 dw_5 dw_6 dw_3~n" + &
												"dw_4 dw_7 dw_8 dw_6 dw_9")
//将所有DW添加到模板布局中,并绑定类名
for nIndex = UpperBound(Control) to 1 step -1
	if Control[nIndex].TypeOf() <> DataWindow! then continue
	uo_splitcontainer.of_TemplateBind(Control[nIndex],ClassName(Control[nIndex]))
next
//应用模板布局
uo_splitcontainer.of_TemplateEnd()

//设置上侧的面板高度(使布局与模板定义的外观相同),并且可以折叠
if IsSucceeded(uo_splitcontainer.of_FindPanelByObject(dw_1,ref panel)) then
	panel.#ParentSplitContainer.#ParentPanel.of_SetSize(0.3)
	panel.#ParentSplitContainer.#ParentPanel.of_SetCollapsible(true)
end if
//设置左下侧的面板宽度(使布局与模板定义的外观相同),并且可以折叠
if IsSucceeded(uo_splitcontainer.of_FindPanelByObject(dw_4,ref panel)) then
	panel.of_SetSize(0.3)
	panel.of_SetCollapsible(true)
end if
//设置右下侧的面板高度使布局与模板定义的外观相同),并且可以折叠
if IsSucceeded(uo_splitcontainer.of_FindPanelByObject(dw_9,ref panel)) then
	panel.of_SetSize(0.35)
	panel.of_SetCollapsible(true)
	//设置右侧宽度
	panel.#ParentSplitContainer.#ParentPanel.of_SetSize(0.3)
end if

//将所有Panel的标题显示为DW类名
for nIndex = UpperBound(Control) to 1 step -1
	if Control[nIndex].TypeOf() <> DataWindow! then continue
	if IsSucceeded(uo_splitcontainer.of_FindPanelByObject(Control[nIndex],ref panel)) then
		panel.of_SetTitleBar(true)
		panel.of_SetTitle(ClassName(Control[nIndex]))
		panel.of_SetPadding(0,-1,0,0)
	end if
next

uo_splitcontainer.#LockUpdate = false
uo_splitcontainer.of_UpdatePoints()

SetRedraw(true)
end subroutine

on u_cst_tabpage_control_splitcontainer.create
int iCurrent
call super::create
this.rb_3=create rb_3
this.dw_9=create dw_9
this.dw_8=create dw_8
this.rb_2=create rb_2
this.rb_1=create rb_1
this.sle_layoutinfo=create sle_layoutinfo
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_1=create dw_1
this.dw_2=create dw_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.cb_1=create cb_1
this.dw_5=create dw_5
this.dw_6=create dw_6
this.dw_7=create dw_7
this.uo_splitcontainer=create uo_splitcontainer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_3
this.Control[iCurrent+2]=this.dw_9
this.Control[iCurrent+3]=this.dw_8
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.sle_layoutinfo
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.dw_1
this.Control[iCurrent+10]=this.dw_2
this.Control[iCurrent+11]=this.dw_3
this.Control[iCurrent+12]=this.dw_4
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.dw_5
this.Control[iCurrent+15]=this.dw_6
this.Control[iCurrent+16]=this.dw_7
this.Control[iCurrent+17]=this.uo_splitcontainer
end on

on u_cst_tabpage_control_splitcontainer.destroy
call super::destroy
destroy(this.rb_3)
destroy(this.dw_9)
destroy(this.dw_8)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.sle_layoutinfo)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.cb_1)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.uo_splitcontainer)
end on

event resize;call super::resize;//uo_splitcontainer.Move(0,0)
uo_splitcontainer.Resize(newWidth,newHeight - uo_splitcontainer.y)
end event

event onopen;call super::onopen;of_DefaultLayout()
end event

type rb_3 from se_cst_radiobox within u_cst_tabpage_control_splitcontainer
integer x = 905
integer y = 28
integer width = 421
string text = "模板布局"
end type

event clicked;call super::clicked;of_TemplateLayout()
end event

type dw_9 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
integer x = 2702
integer y = 928
integer height = 696
integer taborder = 40
string dataobject = "dw_test"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type dw_8 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
integer x = 2697
integer y = 204
integer height = 664
integer taborder = 40
string dataobject = "dw_test"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type rb_2 from se_cst_radiobox within u_cst_tabpage_control_splitcontainer
integer x = 421
integer y = 28
integer width = 462
string text = "九宫格布局"
end type

event clicked;call super::clicked;of_NineGridsLayout()
end event

type rb_1 from se_cst_radiobox within u_cst_tabpage_control_splitcontainer
integer x = 9
integer y = 28
integer width = 389
string text = "默认布局"
boolean checked = true
end type

event clicked;call super::clicked;of_DefaultLayout()
end event

type sle_layoutinfo from se_cst_singlelineedit within u_cst_tabpage_control_splitcontainer
integer x = 2779
integer y = 4
integer width = 1088
integer taborder = 40
end type

type cb_3 from se_cst_button within u_cst_tabpage_control_splitcontainer
integer x = 2304
integer y = 8
integer width = 457
integer height = 132
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "加载布局"
end type

event clicked;//默认加载分割条位置与Panel折叠的状态数据
//加载的数据内容必须与保存的状态数据内容一致
//LAY_SPLITBAR | LAY_PANELCOLLAPSED
uo_splitcontainer.of_LoadLayout(sle_layoutinfo.Text)
end event

type cb_2 from se_cst_button within u_cst_tabpage_control_splitcontainer
integer x = 1829
integer y = 8
integer width = 457
integer height = 132
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "保存布局"
end type

event clicked;//默认保存分割条位置与Panel折叠的状态数据
//LAY_SPLITBAR | LAY_PANELCOLLAPSED
sle_layoutinfo.Text = uo_splitcontainer.of_SaveLayout()
end event

type dw_1 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
integer x = 46
integer y = 208
integer width = 914
integer height = 640
integer taborder = 30
string dataobject = "dw_test"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event rowfocuschanged;call super::rowfocuschanged;SelectRow(0,false)
SelectRow(currentRow,true)
end event

event constructor;call super::constructor;Event RowFocusChanged(1)
end event

type dw_2 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
integer x = 41
integer y = 868
integer width = 914
integer height = 764
integer taborder = 30
string dataobject = "dw_test"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type dw_3 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
integer x = 1088
integer y = 204
integer width = 1582
integer height = 404
integer taborder = 20
string dataobject = "dw_test"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event rowfocuschanged;call super::rowfocuschanged;SelectRow(0,false)
SelectRow(currentRow,true)
end event

type dw_4 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
integer x = 1102
integer y = 656
integer width = 1559
integer height = 300
integer taborder = 20
string dataobject = "dw_test"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type cb_1 from se_cst_button within u_cst_tabpage_control_splitcontainer
integer x = 1353
integer y = 8
integer width = 457
integer height = 132
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "重置布局"
end type

event clicked;uo_splitcontainer.#LockUpdate = true
uo_splitcontainer.of_ResetLayout()
uo_splitcontainer.#LockUpdate = false
uo_splitcontainer.of_UpdatePoints()
end event

type dw_5 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
integer x = 1102
integer y = 1012
integer width = 498
integer height = 624
integer taborder = 10
string dataobject = "dw_test"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event rowfocuschanged;call super::rowfocuschanged;SelectRow(0,false)
SelectRow(currentRow,true)
end event

type dw_6 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
integer x = 1650
integer y = 1012
integer width = 539
integer height = 612
integer taborder = 10
string dataobject = "dw_test"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
end type

event rowfocuschanged;call super::rowfocuschanged;SelectRow(0,false)
SelectRow(currentRow,true)
end event

type dw_7 from se_cst_datawindow within u_cst_tabpage_control_splitcontainer
integer x = 2226
integer y = 1020
integer width = 439
integer height = 608
integer taborder = 10
string dataobject = "dw_test"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
end type

type uo_splitcontainer from ue_cst_splitcontainer within u_cst_tabpage_control_splitcontainer
integer y = 148
integer width = 3429
integer height = 1524
integer taborder = 30
end type

on uo_splitcontainer.destroy
call ue_cst_splitcontainer::destroy
end on

event ongetpanelcolor;call super::ongetpanelcolor;choose case colorFlag
	case theme.CLR_TITLEBARBKGND
		if Panel.#Tag = "CUSTOM_COLOR" then
			color = Panel.#Data
		end if
	case theme.CLR_TITLEBARBORDER
		if Panel.#Tag = "CUSTOM_COLOR" then
			color = ARGBDarken(Panel.#Data,0.2)
		end if
	case theme.CLR_TEXT
		if Panel.#Tag = "CUSTOM_COLOR" then
			color = ARGBDarken(Panel.#Data,0.4)
		end if
end choose
end event

