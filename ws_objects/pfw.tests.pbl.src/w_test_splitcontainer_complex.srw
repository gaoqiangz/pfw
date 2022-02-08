$PBExportHeader$w_test_splitcontainer_complex.srw
forward
global type w_test_splitcontainer_complex from window
end type
type uo_splitcontainer from u_cst_splitcontainer within w_test_splitcontainer_complex
end type
end forward

global type w_test_splitcontainer_complex from window
integer width = 2619
integer height = 1620
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
uo_splitcontainer uo_splitcontainer
end type
global w_test_splitcontainer_complex w_test_splitcontainer_complex

on w_test_splitcontainer_complex.create
this.uo_splitcontainer=create uo_splitcontainer
this.Control[]={this.uo_splitcontainer}
end on

on w_test_splitcontainer_complex.destroy
destroy(this.uo_splitcontainer)
end on

event resize;uo_splitcontainer.Move(0,0)
uo_splitcontainer.Resize(newWidth,newHeight)
end event

event open;int i
s_cst_statictext labels[13]
n_cst_splitcontainer subContainer1,subContainer2,subContainerH,subContainerV
constant real SIDEPANELSIZE = 80	//四周面板的初始大小(dip)

uo_splitcontainer.#LockUpdate = true

//水平方向拆分
uo_splitcontainer.of_SetOrientation(Enums.HORZ)
//第1个面板为顶部面板
uo_splitcontainer.Panel1.of_SetCollapsible(true)
uo_splitcontainer.Panel1.of_SetSize(SIDEPANELSIZE)
uo_splitcontainer.Panel1.of_BindObject(labels[1])
//将第2个面板按水平方向拆分为新的容器
subContainer1 = uo_splitcontainer.Panel2.of_BindSplitContainer(Enums.HORZ)
//第2个面板为底部面板
subContainer1.Panel2.of_SetCollapsible(true)
subContainer1.Panel2.of_SetSize(SIDEPANELSIZE)
subContainer1.Panel2.of_BindObject(labels[2])
//将第1个面板按垂直方向拆分为新的容器
subContainer2 = subContainer1.Panel1.of_BindSplitContainer(Enums.VERT)
//第1个面板为左侧面板
subContainer2.Panel1.of_SetCollapsible(true)
subContainer2.Panel1.of_SetSize(SIDEPANELSIZE)
subContainer2.Panel1.of_BindObject(labels[3])
//将第2个面板按垂直方向拆分为新的容器
subContainer1 = subContainer2.Panel2.of_BindSplitContainer(Enums.VERT)
//第2个面板为右侧面板
subContainer1.Panel2.of_SetCollapsible(true)
subContainer1.Panel2.of_SetSize(SIDEPANELSIZE)
subContainer1.Panel2.of_BindObject(labels[4])

//将第1个面板拆分为[九宫格]的布局
//先将容器分割为三行
subContainer2 = subContainer1.Panel1.of_BindSplitContainer(Enums.HORZ)

subContainer2.Panel1.of_SetSize(0.33)
subContainer2.Panel1.of_SetCollapsible(true)
subContainer2.Panel2.of_SetCollapsible(true)

subContainerH = subContainer2.Panel2.of_BindSplitContainer(Enums.HORZ)
subContainerH.Panel1.of_SetCollapsible(true)
subContainerH.Panel2.of_SetCollapsible(true)

//将第一行分割为三列
subContainerV = subContainer2.Panel1.of_BindSplitContainer(Enums.VERT)
subContainerV.Panel1.of_SetSize(0.33)
subContainerV.Panel1.of_SetCollapsible(true)
subContainerV.Panel2.of_SetCollapsible(true)

//绑定对象
subContainerV.Panel1.of_BindObject(labels[5])
//拖动拆分条时固定大小
subContainerV.Panel1.of_SetFixed(true)

subContainerV = subContainerV.Panel2.of_BindSplitContainer(Enums.VERT)
subContainerV.Panel1.of_SetCollapsible(true)
subContainerV.Panel2.of_SetCollapsible(true)

//绑定对象
subContainerV.Panel1.of_BindObject(labels[6])
subContainerV.Panel2.of_BindObject(labels[7])
//拖动拆分条时固定大小
subContainerV.Panel2.of_SetFixed(true)

//将第二行分割为三列
subContainerV = subContainerH.Panel1.of_BindSplitContainer(Enums.VERT)
subContainerV.Panel1.of_SetSize(0.33)
subContainerV.Panel1.of_SetCollapsible(true)
subContainerV.Panel2.of_SetCollapsible(true)

//绑定对象
subContainerV.Panel1.of_BindObject(labels[8])
//拖动拆分条时固定大小
subContainerV.Panel1.of_SetFixed(true)

subContainerV = subContainerV.Panel2.of_BindSplitContainer(Enums.VERT)
subContainerV.Panel1.of_SetCollapsible(true)
subContainerV.Panel2.of_SetCollapsible(true)

//绑定对象
subContainerV.Panel1.of_BindObject(labels[9])
subContainerV.Panel2.of_BindObject(labels[10])
//拖动拆分条时固定大小
subContainerV.Panel2.of_SetFixed(true)

//将第三行分割为三列
subContainerV = subContainerH.Panel2.of_BindSplitContainer(Enums.VERT)
subContainerV.Panel1.of_SetSize(0.33)
subContainerV.Panel1.of_SetCollapsible(true)
subContainerV.Panel2.of_SetCollapsible(true)

//绑定对象
subContainerV.Panel1.of_BindObject(labels[11])

subContainerV = subContainerV.Panel2.of_BindSplitContainer(Enums.VERT)
subContainerV.Panel1.of_SetCollapsible(true)
subContainerV.Panel2.of_SetCollapsible(true)

//绑定对象
subContainerV.Panel1.of_BindObject(labels[12])
//拖动拆分条时固定大小
subContainerV.Panel1.of_SetFixed(true)
subContainerV.Panel2.of_BindObject(labels[13])

uo_splitcontainer.#LockUpdate = false
uo_splitcontainer.of_UpdatePoints()

for i = 1 to UpperBound(labels)
	labels[i].text = String(i)
	labels[i].Alignment = Center!
next
end event

type uo_splitcontainer from u_cst_splitcontainer within w_test_splitcontainer_complex
integer width = 2565
integer height = 1512
integer taborder = 20
end type

on uo_splitcontainer.destroy
call u_cst_splitcontainer::destroy
end on

