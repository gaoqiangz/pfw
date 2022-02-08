***********************************************************************************************
pfw为Sciter导出了PB接口对象,使JS脚本可以无缝与PB交互,在使用之前请仔细阅读以下内容说明
***********************************************************************************************
//调用说明
*******************
属性访问(名称与PB端相同):
obj.prop	//获取
obj.prop = val	//设置
函数调用(名称与PB端相同，但必须使用$前缀或后缀):
obj.$func(arg...)	//调用func函数
obj.func$(sign,arg...)	//调用指定sign签名的func函数(解决重载函数调用)
事件调用(名称与PB端相同，但必须使用$前缀或后缀):
obj.$$evt(arg...)	//调用evt函数
obj.evt$$(sign,arg...)	//调用指定sign签名的evt事件(严格匹配)
全局变量访问(名称与PB端相同):
pb.global.var		//获取
pb.global.var = val	//设置
全局函数访问(名称与PB端相同，但必须使用$前缀或后缀):
pb.global.$func(args...)	//调用func函数
pb.global.func$(sign,arg...)	//调用指定sign签名的func函数(解决重载函数调用)
pb对象访问(名称区分大小写):
pb.version		//获取pfw版本
pb.pbVersion		//获取PB版本
pb.Create(className)	//创建对象
pb.Open(className)	//创建窗口
...
*******************

//------------- 导出的全局对象 -------------//
pb		//PB入口对象
pb.global	//PB全局变量和全局函数访问对象
pb.host		//PB端的Sciter宿主对象

//------------- pb全局对象的成员(名称区分大小写) -------------//
//-属性
property version	//pfw版本
property pbVersion	//PB版本

//-函数(!!不需要加$前缀或后缀!!)

//获取指定枚举类型对应的名称
function EnumName(cls,val)
//获取指定枚举类型对应的值
function EnumValue(cls,name)
//创建指定类名的对象(返回值为创建的对象)
function Create(cls)
//销毁指定对象
function Destroy(object)
//判断是否为有效的PB对象
function IsValid(object)
//打开指定类名的窗口(返回值为打开的窗口对象)
function Open(cls[,parent])
//打开指定类名的窗口并传递参数(返回值为打开的窗口对象)
function OpenWithParm(cls,parm[,parent])
//打开指定类名的MDI子窗口(返回值为打开的窗口对象)
function OpenSheet(cls,parent[,position[,arrange]])
//打开指定类名的MDI子窗口并传递参数(返回值为打开的窗口对象)
function OpenSheetWithParm(cls,parent,parm[,position[,arrange]])
//关闭指定窗口对象
function Close(wnd)
//关闭指定窗口并返回一个值给调用处(通常是关闭响应窗口)
function CloseWithReturn(wnd,parm)
//消息窗
function MsgBox(title,text,[icon[,button[,default]]])
//PBU转换为Pixel
function U2PX(pbu)
function U2PY(pbu)
//Pixel转换为PBU
function P2UX(px)
function P2UY(px)
//DIP转换为Pixel
function D2PX(dip)
function D2PY(dip)
//Pixel转换为DIP
function P2DX(px)
function P2DY(px)
//DIP转换为PBU
function D2UX(dip)
function D2UY(dip)
//PBU转换为DIP
function U2DX(pbu)
function U2DY(pbu)

//------------- 不支持的特性 -------------//
1.不能访问枚举类型的全局变量和共享变量(Shared Variables)
2.不支持多维数组(JS中只有一维数组)
3.不支持直接调用带引用参数的函数或事件
4.不支持DWObject(这不是标准对象)
5.OLEObject(同DWObject)
6.其它待发现
//------------- 注意事项 -------------//
1.JS是大小写敏感的
2.Create函数创建的对象建议用Destroy销毁

//------------- 关于host对象 -------------//
pfw为每个Sciter窗口(控件)定义了一个pb.host对象属性,该对象为当前Sciter宿主PB对象的引用,如:u_sciter,n_sciter,w_sciter
