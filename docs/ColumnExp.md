# 功能简介

1. 支持给普通列绑定表达式（取代在ItemChanged里做计算的传统做法）
2. 支持宏变量和宏函数调用
3. 支持控制列表达式的计算触发条件（由哪些列变更后触发，并且可以约束是否为手动输入，还可以控制递归）
4. 一个列可以绑定多个表达式（指定由什么列修改了数据则触发对应的表达式计算）
5. 支持引用其他DW的表达式参与混合计算 （跨DW表达式计算）
6. 支持输出表达式计算的调用栈
7. 支持运行时修改表达式

## 宏变量

### 1. 定义

定义普通类型变量：

```
of_AddVar('变量名',{内置数据类型的值})
```

定义表达式变量：

```
of_AddVarExp('变量名','{任意DW支持的表达式，同时也支持引用其他变量}')
```

### 2. 静态展开

静态展开是在表达式设置的时候将对应变量的值进行替换，后续变量的值改变不会影响对应表达式的值的改变

语法: `$变量名`

```
//定义变量："本月读数",值为DW表达式："5"
dw_1.ColumnExp.of_AddVarExp("本月读数","5")
//定义变量："上月读数",值为数值:0
dw_1.ColumnExp.of_AddVar("上月读数",0)
//此处静态展开本月读数和上月读数, 计算结果固定为5
dw_1.ColumnExp.of_AddvarExp("num1","$上月读数 + $本月读数")
//此处修改变量的值不会影响到num1的计算结果，始终为5
dw_1.ColumnExp.of_SetVar("上月读数", 1)
//重新计算第1行所有列的表达式
dw_1.ColumnExp.of_Calc(1)
```

### 3. 动态展开

动态展开是在表达式设置的时候以变量的形式进行计算，后续变量的值改变时会影响对应表达式的值的改变

语法: `$$变量名`

```
//定义变量："本月读数",值为DW表达式
dw_1.ColumnExp.of_AddVarExp("本月读数","5")
//定义变量："上月读数",值为数值0
dw_1.ColumnExp.of_AddVar("上月读数",0)
//此处静态展开上月读数和静态展开本月读书, 计算结果固定为5
dw_1.ColumnExp.of_AddvarExp("num1","$$上月读数 + $本月读数")
//此处修改变量的值会影响到num1的计算结果，结果将改变为6
dw_1.ColumnExp.of_SetVar("上月读数", 1)
//重新计算第1行所有列的表达式
dw_1.ColumnExp.of_Calc(1)
```

### 4. 动态展开 - 根据变量名动态获取对应的值

根据字符串所指定的变量名动态获取对应的值

语法: `$$('变量名字符串')`

```
dw_1.ColumnExp.of_AddVarExp("本月读数","5")
dw_1.ColumnExp.of_AddVar("上月读数",0)
dw_1.ColumnExp.of_AddVar("下月读数",10)
//此处静态展开上月读数和静态展开本月读书, 计算结果固定为5
dw_1.ColumnExp.of_AddvarExp("num1","$$上月读数 + $本月读数")
dw_1.ColumnExp.of_AddvarExp("num2","$$下月读数 + $本月读数")
//此处修改变量的值会影响到num1的计算结果，结果将改变为6
dw_1.ColumnExp.of_SetVar("上月读数", 1)
//n2 n3 为栏位
//当n2 > n3 时n1的对应num1表达式，否则为num2表达式
dw_1.ColumnExp.of_SetExp("n1","$$(if(n2 > n3 ,'num1','num2'))")
dw_1.ColumnExp.of_Calc(1)
```

- `n2` > `n3`, `n1`绑定`num1`

![图片](https://user-images.githubusercontent.com/38213294/152972931-9e589f98-2f0d-4c38-8f4b-4156bb2dc612.png)

- `n2` <= `n3`, `n1`绑定`num2`

![图片](https://user-images.githubusercontent.com/38213294/152973091-f683b0c9-6dad-4bb3-a3f0-e01191a658e6.png)

## 宏函数

可以将函数定义在数据窗口的OnClumnExpInvokeMethod中，然后在表达式中进行调用

### 1. 直接调用

语法: `$函数名({参数列表})`

- 设置表达式

```
dw_1.ColumnExp.of_SetVar("精度", 1)
//调用函数
dw_1.ColumnExp.of_SetExp("n1", "$FormatPrice(n2, $精度)")
```

- 实现`oncolumnexpinvokemethod`事件

```
//表达式服务请求执行函数
choose case name
    case "FormatPrice" //格式化金额
        return Round(Double(args[1]),Long(args[2]))
end choose
```

### 2. 动态调用函数

可将函数名作为一个参数进行调用

语法: `$$Invoke('函数名', {参数列表})`

- 设置表达式
```
dw_1.ColumnExp.of_SetVar("精度", 1)
dw_1.ColumnExp.of_SetVar("单价格式化", "FormatPrice")
//调用
dw_1.ColumnExp.of_SetExp("n1", "$$Invoke($单价格式化, n2, $精度)")
```

- 实现`oncolumnexpinvokemethod`事件
```
//表达式服务请求执行函数
choose case name
    case "FormatPrice" //格式化金额
        return Round(Double(args[1]),Long(args[2]))
end choose
```

## 基本用法一览

```
dw_1.ColumnExp.of_AddVar("aa", 5) //定义一个变量
dw_1.ColumnExp.of_AddVarExp("bb", "$$aa + 5") //定义一个表达式变量
dw_1.ColumnExp.of_SetVar("aa", 6) //修改变量
dw_1.ColumnExp.of_SetVarExp("bb", "$a + 5") //修改变量表达式
dw_1.ColumnExp.of_SetExp("n1", "$$bb + $aa") //将表达式绑定列
dw_1.ColumnExp.of_SetExp("n2", "n1 + n3") //普通DW表达式绑定列
dw_1.ColumnExp.of_SetRelativeColumn("n2", {"n1"}) //n1的值变化的时候触发表达式计算
dw_1.ColumnExp.of_SetRelativeInputColumn("n2", {"n1"}) //只有当用户输入n1的时候触发表达式计算
```

> 更多黑科技用法请自行探索
