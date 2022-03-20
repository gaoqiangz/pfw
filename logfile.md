
## 3.0.6.2053(2022-03-21)

### 修复

* [pfw.ui.sciter.ext]
  - 修复禁用PX_AS_DIP后`treeview`在高分屏下拖拽失效的问题

## 3.0.5.2052(2022-03-19)

### 新增

* [pfw.ui]
  - 内置资源使用svg
  - 窗口支持ITS_WIN10风格
  - 主题增加CLR_ICON颜色类型，可指定svg/iconfont图标颜色

## 3.0.4.2044(2022-03-09)

### 新增

* [pfw.ui.sciter]
  - 支持`packfolder`打包的资源文件，后缀为`.arch`，访问方式与zip文件相同

### 修复

* [pfw.ui.sciter.ext]
  - `treeview`编辑文本时字体大小不统一的问题

## 3.0.3.2042(2022-03-09)

### 新增

* [pfw.ui.sciter]
  - `n_sciter`增加`OnCreate`事件，在`CreateWindow`后触发
* [pfw.ui.blink]
  - `n_blink`/`n_blinkfast`增加`OnCreate`事件，在`CreateWindow`后触发

### 修复

* [pfw.ui.sciter]
  - 修复重复加载初始化异常问题

## 3.0.2.2039(2022-03-07)

### 修复

* [pfw.ui.sciter]
  - 修复SQLite::Recordset迭代器死循环的问题
  - `pb`对象属性可读写
  - `n_sciter`关闭`Popup`显示时给`document`发送`closingPopup`事件
* [pfw.ui]
  - 窗口在多屏环境最大化显示问题

## 3.0.1.2034(2022-02-11)

### 修复

- 支持2021

## 3.0.1.2032(2022-02-08)

从3.0版本开始Sciter引擎将采用[Sciter.JS](https://github.com/c-smile/sciter-js-sdk)版本不再兼容TIScript版本

:warning: 从此版本开始不再支持XP

### 新增

* [pfw.utility]
  - `n_logger`增加`SetHead`函数(每次输出附加的头部信息)
  > 增强Header格式化功能，支持：{L}级别，{Y}年，{M}月，{D}日，{h}时，{m}分，{s}秒，{ms}毫秒
* [pfw.utility.parser]
  - `n_json`增加`FindItemString`/`FindItemLong`/`FindItemLongLong`/`FindItemDouble`/`FindItemBoolean`
* [pfw.net.websocket]
  - `n_wsclient::Publish`支持发送`blob`数据
* [pfw.thread]
  - task增加`of_SetDelayFor`函数，设置任务在指定延迟后（秒）才执行
  - `n_cst_threading::of_Stop`增加exitcode参数，指定线程中止取消的退出代码
  - `n_cst_thread`增加`OnPrepareTask`事件
* [pfw.thread.ext]
  - `sqlquery`增加`#PageNative`属性，使用原生语法实现分页(如MSSQL的`LIMIT`语法)
  - `sqlquery`增加`of_SetPagedUniqueIndexColumns`函数，支持唯一索引列分页优化
  - `sqlquery`/`sqlupdate`/`sqlcommand`增加`of_GetParam`/`of_GetParamName`/`of_GetParamCount`函数
  > 目前仅包含MSSQL实现
  - `sqlquery`增加`of_SetReceiver`函数，设置直接接收数据的对象，减少内存拷贝提高性能
  - `sqlcommand`支持绑定参数
  - `sqlquery`增加钩子机制，继承`n_cst_thread_task_sqlbase_hook`拦截默认查询方式
  - `n_cst_thread_trans::of_GetTransData`支持返回错误信息
* [pfw.ui.controls]
  - `n_cst_popupmenu`增加`of_GetTag`/`of_SetTag`函数
  - `n_cst_ribbonbar_panel`/`n_cst_taskpanelbar_panel`增加`of_FindCheckedRadio`函数
* [pfw.ui.objects]
  - `n_cst_splitcontainer_panel`增加`of_Replace`函数
  - `n_cst_splitcontainer_panel`增加`#Collapsed`属性，支持通过代码折叠面板
* [pfw.ui]
  - `win32`增加`IsWin10`函数

### 调整

* [pfw.utility.sqlite]
  - :warning: `n_sqlite::IsOpenned` -> `IsOpened`
* [pfw.thread.ext]
  - `sqlupdate`没有更新数据时返回成功
  - `sqlcommand::#AutoCommit`使用枚举常量区分事务和无事务提交
  - `sqlquery::#ChunkSize`默认值修改为`10000`
* [pfw.utility.parser]
  - :warning: `n_json::GetValue`/`GetItemValue`/`FindItemValue`当JSON无效或类型不匹配或元素不存在或值为NULL时统一返回NULL

### 优化

* [pfw.thread.ext]
  - 优化`sqlquery`/`sqlupdate`/`sqlcommand`事务管理
  - `sqlupdate`完善多表更新对`UpdateKeyInPlace`的处理
  - `sqlupdate`支持`NChar`字符串绑定语法
  > 需要DBParm开启DisableBind=1并且NCharBind=1
  - `sqlquery`/`sqlupdate`增加对象缓存，大幅优化查询、更新构建性能
  - 属性设置保存在工作任务内，减少线程同步开销
  - `n_cst_thread_trans`连接已经意外断开，不能使用`DISCONNECT`避免发生崩溃
* [pfw.ui.sciter.ext]
  - `treeview`属性支持存储NULL值，转义为'(null)'
  - `treeview`拖放优化
* [pfw.ui.controls]
  - 将隐藏的控件移到屏幕外，防止被意外显示出来
  - `s_cst_datawindow`向父控件转发特殊符号按键消息
  - `toolbarstrip`优化鼠标单击
* [pfw.utility.parser]
  - `n_sql::ModifyClause` `SCT_TABLE MS_APPEND`兼容表连接的语句

### 修复

* [pfw.thread]
  - `n_cst_threading`增加`#IgnoreTaskCancel`属性，默认为`true`，为`false`时当任务被取消后线程和后续的任务都将被取消
  - 修复事件分发递归时阻止调用链状态不正确的问题（`of_Prevent`后立即`of_Trigger`）
* [pfw.thread.ext]
  - `sqlupdate`修复`KeyColumns`没有指定的问题
  - `sqlquery`修复带排序的DW数据大于1块时使用`SetChanges`可能会丢失行的问题
  - `sqlquery`解决交叉表字段过多时可能出现`SetFullState`崩溃问题
* [pfw.common]
  - 捕获`ClassName`可能出现的异常
* [pfw.ui.controls]
  - `s_cst_statictext`修复设置文本没有刷新绘制布局的问题
  - `splitcontainer`完善对`DeferWindowPos`的处理，防止句柄意外变化
* [pfw.ui]
  - 修复远程桌面时可能显示被隐藏的控件
* [pfw.net.http]
  - 修复HTTP协议请求可能错误设置HTTPS配置导致报错的问题
  - 修复`UploadFile`参数提取无效的问题
* [pfw.utility.container]
  - `n_map`修复`Add`函数重复KEY时内存泄露
* [pfw.utility.invoker]
  - `n_objectinvoker`修复`Detach`没有清空缓存的问题

### 其它

* [pfw.ui.sciter]
  - 更新sciter版本到4.4.8.26

## 2.3.1.1982(2020-03-19)

### 新增

* [pfw.utility]
  - n_logger增加OnLog事件用于捕获输出的日志内容，可以用来同步到其他存储位置，比如数据库
* [pfw.utility.barcode]
  - n_barcode/n_qrcode增加SaveClipboard函数，保存条码图片到粘贴板

### 修复

* [pfw.utility.barcode]
  - 修复n_barcode显示文本时的大小可能计算不正确
* [pfw.utility.barcode]
  - 修复n_barcode/n_qrcode在某些打印机打印不出来的问题
* [pfw.net.http]
  - 修复服务端响应状态码为401或407时GetError不为0的问题

## 2.3.1.1982(2020-03-19)

### 新增

* [pfw.ui.blink]
  - 集成VIP版本的blink接口（fastmb/miniblink）
  - n_blinkfast/u_blinkfast/w_blinkfast
  > 支持下载、打印等VIP定制功能   
  > 注：   
  > 使用INIT_FLAG_ENABLE_BLINKFAST初始化，并且不能与普通版本接口同时使用   
  > VIP版本的交互是异步的，不支持普通版本的JS集成功能（交互示例见：w_test_blinkfast）   
* [pfw.ui.blink]
  - n_blink/u_blink/w_blink增加ShowDevTools函数调出页面调试窗口
  > ShowDevTools([inspectorPath]),insepctor默认值为: blink\devtools\inspector.html   
* [pfw.ui.controls]
  - s_cst_datawindow增加of_Reattach函数，用于修改如DataObject属性时导致窗口被重建，立即手动让pfw接管绘制
* [pfw.utility.invoker]
  - n_cst_eventful::of_Prevent增加[deep]参数，支持阻止整个分发链（整个调用深度）
* [pfw.thread]
  - n_cst_threading/n_cst_threading_task增加of_PreventEvent取消当前的事件分发链
* [pfw]
  - 加载资源支持从带证书的EXE/DLL中加载（包括LoadUri函数）
* [pfw.ui.sciter.ext]
  - u_cst_sciter_treeview::of_Load支持checked参数设置节点的勾选状态（{..,checked:true,...}）

### 优化

* [pfw.datawindow.services]
  - 优化n_cst_dwsvc_columnsort排序策略，提升性能

### 修复

* [pfw.thread.ext]
  - 再次修复n_cst_threading_task_sqlquery修改SQL时因SQL带"引号导致Modify SELECT失败的问题
* [pfw.thread]
  - n_cst_threading_pool::of_Release/of_ReleaseAll同时取消线程的当前的事件分发链
* [pfw.ui]
  - 修复XP下可能遇到SVG渲染时崩溃的问题
* [pfw.net.http]
  - 修复响应数据为压缩格式时可能出现格式错误的问题
* [pfw.ui]
  - 修复非真彩色模式下SVG图标渲染显示不了的问题
* [pfw.ui.blink]
  - 修复资源路径包含中文可能加载失败的问题
* [pfw.ui.controls]
  - 修复窗口最大化模式修改屏幕分辨率后窗口大小不正确的问题（适配WIN10的平板模式翻转）

### 其它

* [pfw.ui.sciter]
  - 更新sciter版本到4.4.1.4
* [pfw.ui.blink]
  - 更新blink版本到200319

## 2.2.1.1923(2019-08-16)

### 新增

* [pfw.ui.objects]
  - n_cst_window_titlebar(s_cst_window::CaptionBar)增加of_AddSplitButton/of_InsertSplitButton函数
* [pfw.thread]
  - 支持安全的在线程运行过程插入和删除任务（可以在任务的Stop事件中删除任务自身）
* [pfw.thread]
  - n_cst_threading增加OnThreadCreate事件，允许自定义创建线程
  > 使用该事件可以实现单线程模拟多线程机制，共享同一套代码，方便排查问题，并且在单线程模式下SQL任务的查询不会发生内存拷贝，还可以共享同一个事务连接（需要自定义连接池）
  ```
  onThreadCreate(string clsname,ref n_cst_thread thread,ref string instancename):
  	thread = Create Using clsName //直接Create，不使用SharedObjectRegister
  	return 1 //阻止默认行为
  ```
* [pfw.thread.ext]
  - n_cst_threading_task_sqlquery增加of_MoveData函数转移Data实例变量的所有权，避免内存拷贝
* [pfw.thread.ext]
  - SQL任务（继承自n_cst_thread_task_sqlbase的任务）支持线程的$SQL.TransPool.Class参数，支持自定义连接池（继承自n_cst_thread_trans_pool）
* [pfw.http]
  - n_httpclient增加AddHeader函数，支持接收和发送相同名称的多个Header （RFC：https://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html#sec4.2）
* [pfw.utility]
  - n_logger增加GetTraceLevel/SetTraceLevel函数，用于控制指定日志级别是否同时输出调用栈信息（见：w_test_logger）
* [pfw.common]
  - Sprintf支持'{}'自动索引编号（n_logger格式化输出同样支持）
  ```
  	Sprintf("{}-{}-{}",123,"abcd",true) -> 123-abcd-true
  ```
* [pfw.common]
  - Sprintf支持直接输出数组和n_json/n_xmldoc（n_logger格式化输出同样支持）
* [pfw.net.ftp]
  - n_ftpclient增加GetLastError/GetLastErrorInfo/List函数
  > List获取文件列表

### 优化

* [pfw.datawindow.services]
  - 优化n_cst_dwsvc_contextmenu自动列宽计算包含下拉箭头
* [pfw.utility.invoker]
  - 优化n_cst_eventful支持事件分发阶段订阅事件的实现（of_On），现在会立即生效
* [pfw.utility.invoker]
  - 优化n_cst_eventful的查找性能
* [pfw.http]
  - n_httpclient::DownloadFile只有在接收到数据时才创建文件
* [pfw.http]
  - 自动尽量选择高版本SSL（WIN7安装补丁之后可以支持TLS1.2）
* [pfw.ui.controls]
  - n_cst_i18n_cht/n_cst_i18n_en使用XML翻译文件

### 调整

* [pfw.thread]
  - :warning: pfw使用的参数以'$'开头，避免与用户参数混淆（在使用线程池时of_Release以后被清除）
  > 现有参数变动：   
  > SQL.TransPool.TransClass -> $SQL.TransPool.TransClass   
  > SQL.TransPool.KeepAlive -> $SQL.TransPool.KeepAlive   
  > SQL.TransPool.KeepAliveExpireTime -> $SQL.TransPool.KeepAliveExpireTime   

### 修复

* [pfw.net.websocket]
  - 修复n_wsclient使用MQTT协议时的[resubscribe]功能可能失效的问题
* [pfw.utility.sqlite]
  - 修复Exec/Query绑定参数为NULL时返回NULL的问题
* [pfw.utility.invoker]
  - 修复n_cst_eventful事件分发过程中打开[Response]窗口，再调用of_On订阅新事件时导致栈溢出的问题
* [pfw.ui]
  - 修复n_timer可能出现的内存异常
* [pfw.demos]
  - 修复sciter的alipay/wxpay的SDK使用的Object.remove函数被废弃的问题
* [pfw.utility.devinfo]
  - 修复u_cameracapture::ShowSettingWindow函数可能引起的内存异常问题（摄像头设置）
* [pfw.ui.controls]
  - 修复n_cst_popupmenu::OnMenuSelect事件中弹出窗口可能引起内存异常的问题
* [pfw.ui.controls]
  - 修复u_cst_tabcontrol浮动窗口没有触发OnReposition事件的问题
* [pfw.ui.controls]
  - 修复s_cst_vprogressbar/s_cst_hprogressbar::OnPaint事件因为MaxPosition=MinPosition造成除0异常的问题
* [pfw.ui.blink]
  - 修复n_blinkelement::AddChild插入到父节点的问题
* [pfw.thread.ext]
  - 修复n_cst_threading_task_sqlquery修改SQL时因SQL带"引号导致Modify SELECT失败的问题
* [pfw.ui.controls]
  - 修复u_cst_ribbonbar内容滚动位置刷新可能不正确的问题
* [pfw.ui.controls]
  - 修复滚动条大小不能修改的问题

### 其它

* [pfw.ui.sciter]
  - 更新sciter版本到4.3.0.10
* [pfw.ui.blink]
  - 更新blink版本到190812

## 2.1.7.1797(2019-06-20)

### 新增

* [pfw.utility.sqlite]
  - n_sqlite增加AutoCommit函数代替原来Commit(true)的用法，使语义更明确（[SQLCode=0]时[COMMIT],否则[ROLLBACK],[COMMIT]失败时也自动[ROLLBACK]）

### 调整

* [pfw.utility.sqlite]
  - n_sqlite::Commit[auto]参数改为[autorollback] （[COMMIT]失败时自动[ROLLBACK],默认为true）
  > 该重载函数由2.1.6.1791引入

## 2.1.6.1791(2019-06-19)

### 新增

* [pfw.utility.sqlite]
  - n_sqlite::Commit增加[auto]参数的重载版本（[SQLCode=0]时[COMMIT],否则[ROLLBACK],[COMMIT]失败时也自动[ROLLBACK]）
* [pfw.ui.sciter]
  - TIS集成SQLite，移植自Sciter SDK SQLite插件，并将DB更名为SQLite（用法见：sciter-sdk\samples\sqlite）
  ```
  var db = SQLite.open(":memory:"); //SQLite.open("c:/test.db"[,password]);
  //open函数同时支持[password]参数
  ```
* [pfw.net.websocket]
  - n_wsmessage增加IsRetained函数判断MQTT消息是否为[Retained]消息
* [pfw.ui.sciter]
  - n_sciter增加退出Popup状态时触发view.closingPopup([reason])或self.closingPopup([reason])回调函数
  > reason值可能为：   
  > #by-code, 调用n_sciter::ClosePopup或view.closePopup函数退出   
  > #by-mouse, 鼠标点击其他窗口区域时退出   
  > #by-key, 按下VK_ESCAPE按键退出   
  > #by-deactivation, 切换到其他进程进入非激活状态   
* [pfw.utility]
  - 增加PinyinFirstLetterLike全局函数，拼音首字母模糊匹配，支持多音字、模糊音匹配
* [pfw.common]
  - 增加ClassNameEx全局函数，可以获得包括枚举类型在内的任何变量的类型

### 优化

* [pfw.utility.sqlite]
  - Exec对于只读指令，不自动开启事务，比如[SELECT]语句
* [pfw.utility.sqlite]
  - Commit/Rollback函数不影响SQNRows值
* [pfw.datawindow.services]
  - 优化n_cst_dwsvc_dropdownsearch拼音检索性能
* [pfw.thread]
  - 重构线程释放机制

### 调整

* [pfw.datawindow.services]
  - 移除DDSPYFirstLetterLike（使用pfw.utility::PinyinFirstLetterLike）

### 修复

* [pfw.net.websocket]
  - 修复n_wsmessage::GetDataJSON/GetDataXML/GetData取不到数据的问题
* [pfw]
  - 修复多线程环境下使用pfw不可视对象在线程销毁可能引起崩溃的问题
* [pfw.net.websocket]
  - 修复n_wsclient使用MQTT协议时可能对某些broker不兼容的问题

### 其它

* [pfw.ui.blink]
  - 更新blink版本到190613
* [pfw.ui.sciter]
  - 更新sciter版本到4.3.0.6

## 2.1.5.1728(2019-05-17)

### 修复

* [pfw.utility.sqlite]
  - 修复Query没有提供参数时检索失败的问题（由2.1.5.1724版本引入）

## 2.1.5.1724(2019-05-17)

### 新增

* [pfw.utility.sqlite]
  - n_sqlite::Query支持提供DS/DW内置SQL的检索参数，如db.Query(dw_1,""/*不指定sql时使用dw内部的sql*/,arg1,arg2,...)

### 修复

* [pfw.datawindow.services]
  - n_cst_dwsvc_columnsort/n_cst_dwsvc_contextmenu支持各种单位（PBU/CM/INCH/PX）

## 2.1.4.1719(2019-05-16)

### 新增

* [pfw.utility.sqlite]
  - 集成sqlite（见pfw.pbl::w_test_sqlite）
* [pfw.thread.ext]
  - n_cst_threading_task_sqlquery允许SQL实参数比参数多

### 修复

* [pfw.ui.sciter.ext]
  - 修复u_cst_sciter_treeview双击子节点被更改为组状态的问题
* [pfw.ui.sciter.ext]
  - 修复u_cst_sciter_sidebar动画卡顿并优化折叠显示效果

### 其它

* [pfw.ui.sciter]
  - 更新sciter版本到4.2.8.4
* [pfw.ui.blink]
  - 更新blink版本到190515

## 2.1.3.1662(2019-05-05)

### 新增

* [pfw.ui.sciter.ext]
  - 增加u_cst_sciter_sidebar侧边导航菜单（见pfw.demos.pbl::u_cst_tabpage_sciter_sidebar）
* [pfw.utility]
  - n_logger增加SetLevel函数设置允许输出的级别的掩码组合（见Enums.LOG_LEVEL_XXX）
  - n_logger::Info/Warning/Error/Debug函数增加[level]参数重载版本，指定输出级别
* [pfw.utility]
  - n_logger增加Custom函数输出自定义头部内容

### 完善

* [pfw.net.http]
  - n_httpformdata::AddFile包含filelength参数

### 调整

* [pfw.utility]
  - n_logger移除SetDebugMode函数（使用SetLevel函数替代）
* [pfw.thread]
  - n_cst_threading_pool移除OnIdle事件
  > 不再需要手动调用n_cst_threading::OnIdle事件   

### 其它

* [pfw.ui.sciter]
  - 更新sciter版本到4.2.8.3

## 2.1.2.1602(2019-04-12)

### 新增

* [pfw.net.http]
  - 增加n_httpformdata，用于form表单数据请求
* [pfw.ui.controls]
  - n_cst_ribbonbar_theme增加#TabPadding参数设置Tab内间距大小（标签左右两侧的填充大小）
* [pfw.utility.regexp]
  - RegExpFind全局函数增加返回subs[]数组的重载版本
* [pfw.common]
  - Enums增加REGEXP_MATCH_GLOBAL标志，用于开启RegExp::Find函数返回subs[]数组时的全局查找功能
* [pfw.thread]
  - n_cst_thread/n_cst_thread_task/n_cst_threading/n_cst_threading_task增加of_SetData/of_GetData/of_HasData/of_RemoveData函数绑定私有数据
* [pfw.thread.ext]
  - n_cst_threading_task_sqlcommand/n_cst_threading_task_sqlquery/n_cst_threading_task_sqlupdate移除of_SetTransClass函数
* [pfw.thread]
  - 当使用SQL任务（继承自n_cst_thread_task_sqlbase的任务）时，线程代理对象支持设置全局事件控制参数：
  ```
  Threading.of_SetData("SQL.TransPool.TransClass","ne_cst_thread_trans") //设置事务连接池使用的事务类名（要求继承自n_cst_thread_trans）
  Threading.of_SetData("SQL.TransPool.KeepAlive",true) //开启事务连接保持机制（没有任务引用的事务将保持连接，以便线程复用时新的SQL任务能直接复用连接）
  Threading.of_SetData("SQL.TransPool.KeepAliveExpireTime",15) //连接保持的最长时间(s)，默认30
  注：
  事务连接保持机制需要配合OnIdle事件，否则保持超时后不能断开连接
  Threading.Event OnIdle()
  或
  ThreadPool.Event OnIdle()
  ```
* [pfw.thread]
  - n_cst_threading/n_cst_threading_pool增加OnIdle事件，用于定期通知空闲线程执行一些维护代码，比如上面提到的事务连接保持超时的清理
* [pfw.thread]
  - n_cst_threading_pool增加of_Create函数，用于强制创建线程池线程

### 优化

* [pfw.datawindow.services]
  - 完善DDSPYFirstLetterLike匹配算法，如：KKW LIKE KW = true

### 修复

* [pfw.ui.controls]
  - 修复s_cst_hprogressbar/s_cst_vprogressbar在经典主题的刷新显示问题
* [pfw.utility.container]
  - 修复n_vector/n_list::Sort默认排序
* [pfw.utility.regexp]
  - 修复n_regexp::Find内存异常的问题
* [pfw.ui.controls]
  - 修复u_cst_tabpage::OnOpened事件在OnActivated之后触发的问题
* [pfw.ui.controls]
  - u_cst_toolbarstrip绑定控件偶尔没有同步隐藏的问题
* [pfw.ui.controls.ext]
  - 修复w_cst_msgbox倒计时按钮文本可能显示不全的问题
* [pfw.thread.ext]
  - 修复n_cst_threading_task_sqlquery检索后查询条件被清空的问题
* [pfw.ui.controls]
  - n_cst_popupmenu使用Post调用事件可能引起的内存异常

### 其它

* [pfw.ui.blink]
  - 更新blink版本到190329

## 2.1.1.1530(2019-03-01)

### 新增

* [pfw.demos]
  - n_cst_sciter_traynotification::of_Notify增加delay延迟时间参数（单位秒）

### 优化

* [pfw.utility]
  - n_logger日期输出精确到毫秒

### 修复

* [pfw.utility.regexp]
  - 修复RegExpFind不能获取分组的问题
* [pfw.utility.parser]
  - n_sql修复一些BUG，并且兼容没有[FROM]的语句
* [pfw.net.http]
  - 修复可能出现数据解压失败的问题

## 2.1.0.1491(2019-02-25)

### 新增

* [pfw.common]
  - 增加GetCurrentScript全局函数，获取当前执行的代码位置
* [pfw.utility.parser]
  - n_xmldoc/n_xmlnode增加GetChildren/FindChildren函数
* [pfw.ui.sciter.ext]
  - u_cst_sciter_treeview/n_cst_sciter_treeview_option增加根据属性查找节点的重载函数of_FindChild/of_FindChildren/of_FindOption/of_FindOptions
* [pfw.ui.sciter.ext]
  - u_cst_sciter_treeview增加of_Load加载函数，大量节点构建时提高性能，见pfw.demos.pbl::u_cst_tabpage_sciter_treeview
* [pfw.utility]
  - 增加GetTimestamp全局函数获取当前时间戳
  - 完善DateTimeToTimestamp/TimestampToDateTime实现
* [pfw.utility]
  - 增加ParseDateTime全局函数，解析日期字符串，支持RFC822/RFC850/ANSI C格式，同时兼容PB格式
  ```
  Wed, 21 Oct 2015 07:28:00 GMT
  Wed, 21 Oct 2015 15:28:00 UTC+0800
  //返回的日期始终为本地时区
  ```
* [pfw.thread]
  - n_cst_thread增加of_GetExecCount函数获取执行次数
* [pfw.thread.ext]
  - 增加自定义事务对象n_cst_thread_trans
  - n_cst_threading_task_sqlquery/n_cst_threading_task_sqlupdate/n_cst_threading_task_sqlcmd可以通过of_SetTransClass函数来指定自己的事务对象类型（从n_cst_thread_trans继承）

### 调整

* [pfw.ui.controls]
  - :warning: u_cst_tabcontrol::OnTabSelectionChanged事件改为同步触发（原来是Post触发）
* [pfw.utility.regexp]
  - 重构n_regexp，增加Compile函数，使用该对象进行大量的正则表达式匹配可提高性能

### 优化

* [pfw.net.http]
  - 优化n_httpresponse::GetDataJSON/GetDataXML性能
* [pfw.net.websocket]
  - 优化n_wsmessage::GetDataJSON/GetDataXML性能
* [pfw.net.http]
  - 增加默认头：Accept-Encoding: gzip, deflate

### 其它

* [pfw.ui.blink]
  - 更新blink版本到190225
* [pfw.ui.sciter]
  - 更新sciter版本到4.2.6.10

## 2.0.9.1403(2019-01-23)

### 新增

* [pfw.net.http]
  - URLEncode增加uppercase参数
* [pfw.common]
  - 增加Assert断言测试全局函数（见pfw.pbl::w_test_assert）
* [pfw.common]
  - 增加StackTrace/StackTraceInfo全局函数获取当前调用栈信息

### 优化

* [pfw.utility.invoker]
  - n_cst_eventful完善异常捕捉

### 其它

* [pfw.ui.blink]
  - 更新blink版本到190123

### 修复

* [pfw.net.websocket]
  - 修复n_wsclient::Subscribe批量订阅的BUG
* [pfw.ui.sciter.ext]
  - 修复n_cst_sciter_treeview_option::of_InsertAfter/of_InsertBefore
* [pfw.datawindow.services]
  - 修复se_cst_dw::Filter/DeleteRow
* [pfw.ui.blink]
  - 修复n_blinkvalue::RemoveAll无效的问题
* [pfw.utility.parser]
  - 修复n_json的一处崩溃（由2.0.8引入）

## 2.0.8.1352(2019-01-04)

### 新增

* [pfw.ui.sciter]
  - 增加SciterSetOption全局函数，用于设置全局的Sciter运行时参数

### 调整

* [pfw.utility.parser]
  - n_json KEY改回不区分大小写
* [pfw.ui.sciter]
  - 附带Skia版本的sciter.dll （XP下将采用Skia渲染）
* [pfw.datawindow.services]
  - 使用n_cst_eventful重构

### 其它

* [pfw.ui.sciter]
  - 更新sciter版本到4.2.6.8

### 修复

* [pfw.ui.sciter]
  - 与4.2.6.3之后版本的sciter做个奇怪的兼容

## 2.0.7.1341(2019-01-03)

### 新增

* [pfw.utility.parser]
  - n_json完整实现Find函数，支持索引查找元素
  ```
  语法：
      key/#index/key
      路径由'/'分隔，'#'开头为索引（下标从1开始）
      *使用'\'转义字符
  
  如：
  {"key1":[{"subKey1":"abcd"},{"subKey2":"efgh"}],
  "key2":[{"subKey1":"ijkl"},{"subKey2":"mnop"}]}
  
      json.Find("key2/#2/subKey2") ==> "efgh"
  等价:
      json.Find("#2/#2/#2") ==> "efgh"
  ```
* [pfw.utility.parser]
  - n_json增加FromObject（PB对象转换为JSON）/ToObject（JSON赋值给PB对象）函数，见pfw.pbl::w_test_json
  > 结构转换为JSON,JSON转换为结构
* [pfw]
  - 增加n_cst_appargs(程序启动命令行参数解析)/n_cst_appconfig(程序XML配置文件解析)工具类，见pfw.pbl::w_test_appargs/w_test_appconfig

### 优化

* [pfw.ui.sciter]
  - 完善TIS访问对象枚举属性的支持（文档已更新）
* [pfw.ui.blink]
  - 完善JS访问对象枚举属性的支持（文档已更新）

### 其它

* [pfw.ui.blink]
  - 更新blink版本到181228

### 修复

* [pfw.utility.invoker]
  - 修复n_cst_eventful::of_On重复注册检查代码没有忽略过期事件的问题
* [pfw.net.websocket]
  - 修复n_wsclient::Send函数的JSON/XML重载版本调用异常的问题
* [pfw.ui.controls]
  - 修复s_cst_window关闭时没有停止所有timer而造成NULL引用异常的问题
* [pfw.utility]
  - 修复n_logger控制台输出中文乱码的问题

## 2.0.6.1297(2018-12-11)

### 新增

* [pfw.sciter]
  - 增加SciterSetMasterScript函数（设置tis全局脚本）

### 优化

* [pfw.ui.sciter.ext]
  - 优化添加节点的性能

### 调整

* [pfw.ui.blink]
  - 废除IsLoadFailed/IsLoadSucceeded/IsLoadComplete函数

### 其它

* [pfw.ui.sciter]
  - 升级sciter到4.2.6.6版本（要在XP下使用必须用pfw带的dll，不能使用官方公开发布的版本）
* [pfw.ui.blink]
  - 更新blink版本到181205

### 修复

* [pfw.ui.sciter.ext]
  - 修复节点名称带特殊字符的问题
* [pfw.utility]
  - 修复n_logger输出特殊文字乱码的问题（现在采用UTF-8编码，现有的日志文件如果不是UTF-8+BOM则会被清空）
* [pfw.datawindow.services]
  - 修复n_cst_dwsvc_dropdownsearch在检索数据后可能失效的问题
* [pfw.ui.controls]
  - 修复s_cst_dropdownlist输入[Backspace]键时可能导致崩溃的问题

## 2.0.5.1233(2018-10-17)

### 调整

* [pfw.utility.parser]
  - n_json KEY区分大小写

### 修复

* [pfw]
  - 修复w_packager[Thread Extensions]依赖对象缺失的问题
* [pfw]
  - 修复w_packager[Camera Capture]依赖对象缺失的问题
* [pfw.utility.invoker]
  - 修复n_cst_eventful缓存可能引起的VM崩溃的问题
* [pfw.ui.blink]
  - 修复LoadFile加载zip资源时引用资源可能会失败的问题
* [pfw.ui.controls]
  - 修复窗口[MaxBox]为false时最大化没有覆盖全屏的问题
* [pfw.ui.blink]
  - 修复中文无法输入的问题

## 2.0.4.1198(2018-09-18)

### 新增

* [pfw]
  - 增加自定义打包工具，可以根据自己的需要打包类库到一个PBL中（见pfw.pbl::w_packager）
* [pfw.net.websocket]
  - n_wsclient增加更多Publish（直接发送JSON/XML对象）/Subscribe/Unsubscribe重载
* [pfw.net.websocket]
  - MQTT连接参数增加[offlinePublish]和[offlineSize]参数（见pfw.pbl::w_test_websocket_mqtt）
* [pfw.thread]
  - 支持没有任务队列时也能运行线程（of_Run），并且允许在线程运行时动态添加任务

### 修复

* [pfw.net.websocket]
  - 修复MQTT重连重新订阅主题包含已取消的主题的问题

## 2.0.3.1163(2018-09-10)

### 新增

* [pfw.net.websocket]
  - n_wsclient增加MQTT协议支持（mqtt://，mqtts:// for SSL），需要Broker(MQTT服务）支持WebSocket连接（见pfw.pbl::w_test_websocket_mqtt）
  - n_wsclient增加自动重连机制
  - 增加SetAutoReconnect函数开启自动重连
  - 增加IsReconnecting函数判断当前是否正在执行自动重连
  - OnOpen事件增加[reconnect]参数用于判断是否为重新连接
  - OnOpen事件增加[sessionPresent]参数用于MQTT协议
  - n_wsmessage增加GetTopic/GetQoS函数（用于MQTT协议）

### 优化

* [pfw.utility]
  - n_logger优化输出格式

### 调整

* [pfw.ui.blink]
  - 默认禁用Debug输出(使用SetDebugOutput(true)开启)

### 修复

* [pfw.ui.blink]
  - 修复n_blinkvalue函数返回值声明错误
* [pfw.ui.blink]
  - 修复n_blinkvalue::GetItemCount始终返回0的问题
* [pfw.ui.blink]
  - 修复n_blinkvalue::GetItemBoolean始终返回false的问题
* [pfw.ui.blink]
  - 修复输入法输入部份字符可能导致焦点被切换的问题
* [pfw.utility.zip]
  - 修复ZipCompress/ZipUncompress格式为gzip/zlib时失败的问题
* [pfw.utility.parser]
  - 修复n_json变量循环引用时GC释放对象的问题
* [pfw.net.http]
  - 修复回调事件参数可能会赋值失败而引起空对象异常的问题
* [pfw.net.http]
  - 修复设置x509 private key之后可能出现释放内存异常的问题
* [pfw.thread.ext]
  - n_cst_threading_task_sqlquery修复检索参数为NULL时可能失败的问题

## 2.0.2.1073(2018-07-31)

### 新增

* [pfw.ui.blink]
  - 支持High DPI

### 修复

* [pfw.ui.blink]
  - 修复开发模式下可能出现崩溃的问题

## 2.0.1.1068(2018-07-30)

从2.0开始必须初始化后才能使用

### 新增

* [pfw.ui.blink]
  - 集成blink渲染引擎（MiniBlink），提供与sciter一致的交互方式
* [pfw.utility.devinfo]
  - 增加u_cameracapture（USB摄像头捕获控件，支持多摄像头，见pfw.pbl::w_test_camera_capture）
* [pfw.net.ftp]
  - 增加n_ftpclient对象（见pfw.pbl::w_test_ftpclient）
* [pfw.net.ftp]
  - 增加FtpDownload/FtpUpload全局辅助函数，函数可能有多个重载版本（封装调用n_ftpclient）
* [pfw.ui]
  - 增加进度条控件（见：pfw.pbl::w_test_progressbar）
* [pfw.utility]
  - 增加GetPinyinFirstLetter获取汉字拼音首字母全局函数（GetPinyinFirstLetters支持多音字组合）
* [pfw.ui.sciter]
  - n_sciterelement增加GetTagName/SetName/SetID/HasAttribute函数(GetTagName等于原来的GetName函数，现在的GetName函数返回"name"属性的值)
* [pfw.ui.sciter]
  - u_sciter/n_sciter增加GetElementsByName/GetElementsByTagName/GetElementsByClassName函数
* [pfw.ui.sciter]
  - n_scitervalue增加InvokeMethod函数
* [pfw.net.http]
  - 增加HttpRequest/HttpGet/HttpPost/HttpDownload/HttpUpload全局辅助函数，函数可能有多个重载版本（封装调用n_httpclient）

### 调整

* [pfw.ui]
  - :warning: win32/painter对象重构为全局对象，由初始化函数初始化（Enums.INIT_FLAG_ENABLE_UI）
* [pfw.ui]
  - :warning: 废弃OnThemeChanging事件
* [pfw.ui]
  - :warning: n_cst_base_theme废弃of_UpdateBegin/of_UpdateEnd函数
* [pfw]
  - w_test_static_map使用百度地图API

### 修复

* [pfw.utility.invoker]
  - n_scriptinvoker::Init绑定对象函数时包含私有函数
* [pfw.datawindow.services]
  - 修复n_cst_dwsvc_columnexp缓存dwo可能失效的问题
* [pfw.thread.ext]
  - n_cst_threading_task_sqlquery修复交叉报表SQL还原的问题
* [pfw.thread.ext]
  - n_cst_threading_task_sqlquery修复查询参数包含数组时可能会异常的问题
* [pfw.datawindow.services]
  - n_cst_dwsvc_columnsort修复标题对象名称中间带'_t'排序功能失效的问题
* [pfw.utility.invoker]
  - 修复几处内存泄露的问题
* [pfw.datawindow.services]
  - 修复n_cst_dwsvc_columnexp宏变量捕获解析的小bug（增加分隔符数量）
* [pfw.datawindow.services]
  - 修复u_dw GRID风格鼠标单击切换行失败没有继续传递Clicked事件的问题

## 1.2.4.822(2018-05-28)

### 新增

* [pfw.utility.invoker]
  - 增加n_cst_eventful对象（事件分发器，见pfw.pbl::w_test_eventful）
* [pfw.utility.regexp]
  - RegExpFind全局函数增加分组index重载版本
* [pfw.thread]
  - 重构线程事件分发机制（采用n_cst_eventful）
  - n_cst_threading/n_cst_threading_task增加of_On/of_Off函数订阅事件（见pfw.pbl::w_test_thread）
* [pfw.utility.invoker]
  - n_scriptinvoker增加SetArgs函数（通过数组传递参数列表）
* [pfw.net.http.ext]
  - n_cst_alipay增加#SignType属性支持指定签名算法的类型（现在新的支付宝应用开始采用RSA2）
* [pfw.crypto]
  - 增加HexEncode/HexDecode全局函数（对blob进行16进制编解码）
* [pfw.ui.objects]
  - n_cst_splitcontainer/n_cst_splitcontainer_panel增加of_GetWidth/of_GetHeight函数
* [pfw.ui.objects]
  - n_cst_splitcontainer_panel增加#Fixed属性和of_SetFixed函数，设置panel在拖动拆分条时固定大小（见pfw.pbl::w_test_splitcontainer_complex）
* [pfw.ui.sciter.ext]
  - n_cst_sciter_treeview_option增加of_IsPopulated函数
* [pfw.ui.controls]
  - s_cst_singlelineedit/s_cst_dropdownlist重写[Default Text]功能（默认提示文本）
* [pfw.datawindow.services]
  - n_cst_dwsvc_dropdownsearch支持多音字检索，增加DDSPYFirstLetterLike全局函数
* [pfw.ui.controls]
  - u_cst_tabpage/s_cst_tabpagew增加OnReposition事件

### 调整

* [pfw.thread]
  - n_cst_threading/n_cst_threading_task移除#NotifyObject属性和of_SetNotifyObject函数，原OnThreadNotify通知事件请订阅："common-notify"
* [pfw.thread]
  - n_cst_threading/n_cst_threading_task移除OnStarted/onStopped事件
* [pfw.thread]
  - n_cst_threading_task移除OnPreNotify/OnNotified事件
* [pfw.thread]
  - n_cst_threading_task的#Type属性改为string类型
* [pfw.ui.controls]
  - u_cst_splitcontainer删除OnSplitBarMoving事件
* [pfw.ui.controls]
  - s_cst_singlelineedit/s_cst_dropdownlist删除of_GetText/of_IsDefaultText函数（不再需要）
* [pfw.ui.controls]
  - s_cst_editmask/s_cst_multiline移除[Default Text]功能（不兼容这种风格）
* [pfw.datawindow.services]
  - 删除DDSGetPYFirstLetter全局函数

### 修复

* [pfw.net.http]
  - 请求失败时可能出现缓冲区溢出的问题
* [pfw.net.http]
  - 修复对SSL 2.0的支持（不建议使用！）
* [pfw.thread.ext]
  - 修复n_cst_thread_task_sqlupdate对自增列的判断
* [pfw.utility.compiler]
  - 修复在连续调用Evaluate执行不同的脚本时没有更新缓存的问题

## 1.2.3.659(2018-04-09)

### 新增

* [pfw.ui.sciter]
  - n_sciter::ClosePopup函数增加无参数重载版本
* [pfw.ui.sciter]
  - n_sciter加载的页面[view]对象增加closePopup([exitCode])函数，用于退出Popup模式
* [pfw]
  - 增加w_test_sciter_dropdowncalendar示例

### 修复

* [pfw.ui.sciter]
  - 修复n_sciter::GetMinWidth/GetMinHeight始终返回0的问题

## 1.2.3.654(2018-04-08)

### 修复

* [pfw.ui]
  - 修复IconFont协议指定[color]参数无效的BUG
* [pfw.utils.zip]
  - 修复n_unzip::UnzipFile/UnzipFolder参数为index时解压可能失败的问题
* [pfw.ui.controls]
  - 修复任务栏不在底部时窗口最大化座标不正确的问题（Win10）

## 1.2.3.650(2018-04-04)

### 新增

* [pfw.datawindow.services]
  - n_cst_dwsvc_columnexp增加of_SetCacheable函数，开启表达示缓存以提高性能
* [pfw.thread.ext]
  - n_cst_threading_task_sqlquery增加#PageCounting属性和of_SetPageCounting函数用于设置分页计算的开关（默认开启，只有开启之后才能获取of_GetPageCount/of_GetRecordCount）
* [pfw.net.http]
  - n_httputility::UrlEncode/UrlDecode支持更多编码
* [pfw.net.http]
  - GetDataString/GetDataJSON/GetDataXML增加encoding参数重载
* [pfw.thread]
  - 增加of_GetID函数获取工作线程的ID（原of_GetID更名为of_GetSID）

### 调整

* [pft.net.http]
  - 不再转义URL字符，由用户转义

### 修复

* [pfw]
  - 修复资源加载zip[path]方式带中文名称时可能会失败的问题
* [pfw.utility.zip]
  - ZipCompress/ZipUncompress字符串压缩不同平台交换数据时中文可能出现乱码的问题（之前版本压缩的字符串如果带中文可能出现乱码，需要重新压缩）
* [pfw]
  - 修复在某些控件上使用鼠标滚动时可能会陷入死循环的问题（如某些OLE控件）
* [pfw.ui.sciter.ext]
  - u_cst_sciter_treeview选择option时不滚动到视图的问题
* [pfw.ui.controls]
  - 修复u_cst_tabcontrol浮动窗口第二次显示时页面大小计算不正确的问题
* [pfw.ui.controls]
  - 修复任务栏不在底部时窗口最大化座标不正确的问题

## 1.2.2.598(2018-03-14)

### 新增

* [pfw]
  - 支持PB相对路径资源编译后从EXE加载（兼容PB原来的资源使用方式）
* [pfw.utility.barcode]
  - 增加EANX_CHK,UPCA_CHK,UPCE_CHK条码类型
* [pfw.datawindow.services]
  - n_cst_dwsvc_columnsort多列排序时显示顺序号
* [pfw.crypto]
  - n_crypto增加支持blob类型的key和iv参数
* [pfw.utility]
  - n_filescanner遍历文件和目录（见pfw.pbl::w_test_filescanner）
* [pfw.utility.devinfo]
  - n_devinfo增加获取本机IP地址的功能（见pfw.pbl::w_test_devinfo）
* [pfw.net.http]
  - n_httpclient::UploadFile增加params参数（针对MultiPart方式，格式为json:{"name":"name","filename":"filename"}）

### 调整

  - 重命名PBL

### 完善

* [pfw.datawindow.services]
  - n_cst_dwsvc_columnexp改进自动关联列和展开变量的算法

### 修复

* [pfw.utility.barcode]
  - 修复部分类型的条码旋转显示不正确的问题
* [pfw.ui.controls]
  - 修复s_cst_datawindow Border=false时不显示标题栏的问题
* [pfw]
  - 修复sciter.dll依赖问题（没使用Sciter控件时不需要附带该dll和pbl）
* [pfw]
  - 修复从EXE加载资源时可能会失败的问题（pbr协议）
* [pfw.utility]
  - 修复Sprintf参数对齐符号解析的BUG
* [pfw.demos]
  - 修复n_cst_sciter_traynotification换行符显示的问题

## 1.2.1.455(2018-01-22)

### 新增

* [pfwUI]
  - :warning: 增加对支持svg和icon-font的支持（见pfw.pbl::w_test_svg/w_test_iconfont）
* [对象,pfwBarcode]
  - 增加n_barcode对象，支持各种一维码（见pfw.pbl::w_test_barcode）
* [对象,pfwBarcode]
  - 增加n_qrcode对象，专门为QR二维码优化（见pfw.pbl::w_test_qrcode）
* [风格,pfwUIControls]
  - n_cst_tabcontrol_theme增加TBS_OFFICE2013风格
* [对象,pfwDemos]
  - 增加n_cst_sciter_traynotification托盘提示示例（见pfwDemos.pbl::w_main）

### 修复

* [pfwThread]
  - 修复由1.2.0.1211版本带来的线程任务结束时的同步信号的BUG
* [pfwUtils]
  - 修复n_logger::ConnectToConsole可能会失败的问题
* [pfwUtils]
  - 修复n_logger可能会造成异常的问题
* [pfwUIControls]
  - 修复AnimatedImage只有一帧时导致布局计算错误的问题
* [pfwUIControls]
  - 修复部分控件OnPreConstructor事件执行两次的问题

## 1.2.0.1214(2017-12-14)

### 新增

* [事件,pfwUIControls]
  - u_cst_tabpage/u_cst_tabpagew增加OnGetFloatMinSize事件，用于设置浮动窗口的最小大小

### 修复

* [pfwUIControls]
  - 修复u_cst_tabcontrol标签浮动后再停靠回去之后，当主窗口最小化再还原时标签窗口也显示出来的问题
* [pfwThread]
  - 修复由1.2.0.1211版本带来的线程释放的BUG

## 1.2.0.1211(2017-12-11)

### 优化

* [pfwDWServices]
  - n_cst_dwsvc_columnsort增加对compute列的支持，同时优化了箭头符号

### 修复

* [pfw]
  - 修复XP兼容性问题（报GetThreadID无法定位到函数）
* [pfwHttp]
  - 修复httpclient发送xml对象时使用了json的content-type导致的错误
* [pfwDWServices]
  - 修复n_cst_dwsvc_columnsort排序不正确的BUG

## 1.2.0.1204(2017-12-04)

### 新增

* [特性,pfwSciter]
  - :warning: PB与Sciter传值采用any，无缝与tiscript交互（不再要求使用n_scitervalue封装PB值，由PFW自动匹配相应的tis值，同时兼容n_scitervalue传值）
* [特性,pfwHttp]
  - n_httpclient增加数据传输回调事件OnTransData（返回1取消传输），由Request/DownloadFile/UploadFile函数的[transcallback]开启
* [控件,pfwUIControls]
  - 增加标准控件s_cst_statictext
* [对象,pfwSciter]
  - 增加n_scitervm对象，用于加载执行tis脚本
* [函数,pfwSciterExt]
  - n_cst_sciter_treeview_option增加of_FindChildByTag/of_GetChildren函数
* [函数,pfwParser]
  - n_json增加IsObject/IsArray/MakeObject/MakeArray/RemoveAll函数
* [函数,pfwSciter]
  - n_scitervalue增加IsObject/IsArray/MakeObject/MakeArray/RemoveAll函数
* [函数,pfwHttp]
  - n_httpclient增加DownloadFile/UploadFile函数
* [函数,pfwRegExp]
  - n_regexp增加Verify函数用于校验正则表达示，同时增加RegExpVerify全局函数

### 调整

* [特性,pfwUIControls]
u_cst_tabcontrol.of_Dock函数不再销毁浮动窗口，只有标签被移除时才销毁，避免某些特定情况下销毁浮动窗口引起的异常

### 优化

* [控件,pfwUIControlsExt]
  - MessageBoxEx优化窗口大小限制

### 修复

* [pfwZip]
  - 修复解压加密的zip文件时卡死的问题
* [pfwDWServices]
  - 修复DDSGetPYFirstLetter中英混合取值不正确的BUG
* [pfwUtils]
  - 改善由PBVM的BUG导致调用n_logger变参函数时可能会异常的问题
* [pfwInvoker]
  - 改善由PBVM的BUG导致调用n_objectinvoker变参函数时可能会异常的问题
* [pfwUIControls]
  - s_cst_window popup/child风格的窗口最小化后系统菜单显示问题
* [pfw]
  - 修复GetSysColor参数为负时崩溃的错误
* [pfwThreadExt]
  - 修复n_cst_threading_task_sqlquery可能会丢失filter缓冲区数据的问题
* [pfwUIControls]
  - u_cst_splitcontainer为附加定位模式(#AttachMode=true)时的位置刷新问题

## 1.1.1.0911(2017-09-11)

### 新增

* [函数,pfwSciter]
  - n_sciterelement增加DetachObject函数，用于解除元素与PB控件的绑定
* [函数,pfwSciter]
  - TIS中增加U2PX/U2PY/P2DX/P2DY/D2UX/D2UY/U2DX/U2DY全局函数

### 优化

* [pfwThread]
  - 优化线程释放

### 修复

* [pfwHttp]
  - 修复httpclient::SetValidateHost(false)失效
* [pfwDWServices]
  - 修复n_cst_dwsvc_contextmenu复制列的数据时如果最后一行为空时会少一行
* [pfwDWServices]
  - 修复n_cst_dwsvc_contextmenu复制单元格右键菜单检测的逻辑并且支持复制计算列的内容
* [pfwSciterExt]
  - u_cst_sciter_treeview在DPI为125%的屏幕上显示checkbox不正常

## 1.1.0.0904(2017-09-04)

### 新增

* [特性,pfwUI]
  - :warning: 支持高分屏(High DPI),从这个版本开始,pfw的所有UI单位都由px改为dip
> DIP:设备无关像素,在DPI为96的屏幕上1dip等于1px,DPI为192的屏幕上1dip等于2px
* [特性,pfwUI]
  - 增加资源协议data:[resType,]base64,从base64字符串加载资源,并且所有的资源协议都支持zip[path]
* [特性,pfwSciter]
  - TIS可以直接传递Element对象到PB的n_sciterelement对象
* [特性,pfwUI]
  - 增加对I18N(国际化多语言)功能的支持
* [对象,pfwDWServices]
  - 增加一些DW服务:右键菜单服务/行选服务/排序服务/下拉检索服务/列表达示服务(见pfw.pbl::w_cst_dwsvc_xxx)
* [函数,pfwUI]
  - 增加与高分屏特性相配合的一些函数:U2PX/U2PY/P2DX/P2DY/D2UX/D2UY/U2DX/U2DY/EnableDPIAware
* [函数,pfwUIControls]
  - s_cst_window增加wf_ChangeMenu函数
* [函数,pfwUIObjects]
  - n_cst_window_theme增加#TitleBar属性和of_SetTitleBar函数,用于控制窗口标题栏显示/隐藏
* [函数,pfwThreadExt]
  - n_cst_threading_task_sqlquery增加of_AddParam函数用于添加绑定名称的参数
* [函数,pfwThreadExt]
  - n_cst_threading_task_sqlquery增加of_SetMaxRows函数用于设置最大行数(当达到该行数时会发起NCD_MAXROWS通知,返回1允许继续查询,否则会报OUT_OF_RANGE错误)
* [函数,pfwHttpExt]
  - n_cst_alipay增加of_Precreate/of_PrecreateAsync接口：统一收单线下交易预创建
  - n_cst_wxpay增加of_UnifiedOrder/of_UnifiedOrderAsync接口：统一下单
  - n_cst_wxpay增加of_CloseOrder/of_CloseOrderAsync接口：关闭订单

### 调整

* [pfwHttpExt]
  - 该pfwDemos.pbl内的n_cst_alipay/n_cst_wxpay两个支付对象移至此PBL中

### 修复

* [pfwParser]
  - 修复n_xmldoc::RemoveChildren只能移除第一个子节点的BUG
* [pfwUIControlExt]
  - 修复一些与MessageBoxEx/MessageBoxTimout有关的BUG
* [功能,pfwThreadExt]
  - n_cst_threading_task_sqlquery修复DW中同一个参数多处使用报绑定参数失败的错误
* [pfwHttpExt]
  - n_cst_wxpay修复金额错误的问题
* [pfwControls]
  - 修复窗口上按钮快捷键失效的问题
* [pfw]
  - :warning: 修复几处pfw.dll内存访问错误

## 1.0.2.0517(2017-05-17)

### 新增

* [示例]
  - 增加GOOGLE静态地图DEMO(见:pfw.pbl::w_test_static_map)
* [特性]
  - 鼠标在只有水平滚动条而没有垂直滚动条的控件上垂直滚动时会转换为水平滚动消息(不支持DataWindow的HSplit属性) [实验]

### 修复

* [pfw]
  - XP/2003崩溃的问题

## 1.0.1.0509(2017-05-09)

pfw发布的第一个版本,以下是相对于PowerUI的改变

### 新增

* [特性,pfwSciter]
  - 支持在TIS脚本里直接使用PB对象和函数等,无缝交互
* [特性,pfwHttp]
  - httpclient支持服务端压缩的响应数据Content-Encoding:gzip/deflate
示例:httpClient.SetHeader("Accept-Encoding","gzip")
* [对象,pfwWebSocket]
  - n_wsclient/n_wsmessage,WebSocket客户端网络库,支持WS/WSS协议,接口可参考HttpClient
* [对象,pfwRegExp]
  - n_regexp,正则表达示库,支持匹配、查找和替换
* [对象,pfwZip]
  - n_zip/n_unzip,Zip压缩算法库,操作zip文件等
* [对象,pfwDevInfo]
  - 设备指纹获取库n_devinfo,支持获取CPUID,硬盘序列号,MAC地址等
* [对象,pfwInvoker]
  - PB对象动态调用库n_objectinvokder/n_scriptinvoker,支持动态调用对象函数、事件,获取对象实例、静态变量(共享变量)等
* [对象,pfwCompiler]
  - PB动态编译PowerScript库,可以运行时导入全局函数或对象等等
* [对象,pfwThread]
  - n_cst_thread/n_cst_thread_task/n_cst_threading/n_cst_threading_task/n_cst_threading_pool,PB多线程库(包括线程池对象)
* [对象,pfwThreadExt]
  - n_cst_threading_task_sqlcommand/n_cst_threading_task_sqlquery/n_cst_threading_sqlupdate,基于pfw线程库实现的数据库通用查询和更新任务,支持分页查询,动态绑定参数,动态SQL,多表更新等.
* [对象,pfwSciter]
  - w_cst_sciter,PB窗口类型的Sciter
* [对象,pfwUtils]
  - n_logger日志记录对象,支持文件和控制台输出,可以输出格式化字符串,类似C#的Console.Write,支持参数索引和对齐({index[,alignment][:format]})
* [函数,pfwInvoker]
  - HasGlobalFunction/InvokeGlobalFunction/HasGlobalVar/GetGlobalVar/SetGlobalVar函数,用于动态调用全局函数,获取全局变量等
* [函数,pfwCompiler]
  - Evaluate动态解析并执行PowerScript,支持定义参数列表和传入任意参数到函数体
* [函数,pfwRegExp]
  - RegExpMatch/RegExpFind/RegExpReplace函数(封装调用n_regexp)
* [函数,pfwZip]
  - ZipCompress/ZipUncompress函数,字符串压缩,blob压缩
* [函数,pfwUtils]
  - 进制转换全局函数,DecToHex/HexToDec十进制与十六进制互转,DecToString/StringToDec十进制与任意2~36进制互转
* [函数,pfwUtils]
  - LoadUri,从pfw资源协议加载数据
* [函数,pfwUIControls]
  - u_cst_tabpage/s_cst_tabpagew增加函数of_GetTabIndex/of_GetTabText/of_GetTabTag/of_GetTabData/of_IsTabSelected/of_IsTabFloated/of_SelectTab/of_ShowTabFloatWindow/of_CloseTab
* [函数,pfwUIControls]
  - s_cst_singlelineedit/s_cst_multilineedit/s_cst_editmask增加of_GetText函数
* [函数,pfwContainer]
  - n_map增加Get(index)/GetKey(index)函数
* [函数,pfwParser]
  - n_json增加Find函数(Find("key/key2/key3[/..]"))
* [函数,pfwSciter]
  - n_sciterelement增加GetData/SetData函数用于绑定任意PB变量
* [函数,pfwSciter]
  - n_sciterelement增加GetExpando函数用于获取Element的TIS扩展对象
* [函数,pfwSciter]
  - n_scitervalue增加GetValueObject/SetValue(powerboject)/GetItemObject/SetItem(powerobject)函数,可以将PB对象传入TIS
* [函数,pfwSciter]
  - u_sciter/n_sciter/w_cst_sciter增加SetDebugOutput函数和OnDebugOutput事件,用于输出调试信息
* [函数,pfwSciter]
  - n_sciter增加Popup/ClosePopup函数,用于模拟弹出菜单的方式显示Sciter窗口
* [函数,pfwUIObjects]
  - n_cst_sciter_treeview_option增加of_GetData/of_SetData函数用于绑定任意PB变量
* [函数,pfwCrypto]
  - n_crypto::SymEncrypt/SymDecrypt提供参数初始化IV
* [函数,pfwUtils]
  - BitTest函数(等于BitAND(num,bits)=bits),BitClear函数(等于BitAND(num,BitNOT(bits)))
* [函数,pfwUtils]
  - Sprintf函数,用于输出格式化字符串,类似C#的Console.Write,支持参数索引和对齐({index[,alignment][:format]})
* [函数,pfwUtils]
  - DateTimeToTimestamp/TimestampToDateTime用于PB日期和时间戳之间转换(精度为秒),支持UTC和本地时间(默认为UTC)
* [函数,pfwCrypto]
  - Base64Encode/Base64Decode/GUID/MD5/RandomString/SHA1/SHA256函数(封装调用n_crypto)
* [函数,pfwHttp]
  - SetCA/GetCA设置服务端证书的签发证书,用于验证服务端证书
* [函数,pfwHttp]
  - SetValidateHost/IsValidateHost设置服务端证书域名验证开关(ValidateServer开启时有效)
* [函数,pfwHttp]
  - n_httpclient增加SetAcceptException/IsAcceptException函数用于开启接收HTTP异常状态信息的功能(默认只接收HTTP OK的信息)
* [函数,pfwHttp]
  - CancelAll取消所有的异步请求
* [函数,pfwHttp]
  - URLEncode/URLDecode/StringToUTF8/StringToUTF16/StringToGBK/StringToBig5/StringToANSI/UTF8ToString/UTF16ToString/GBKToString/Big5ToString/ANSIToString函数(封装调用n_httputility)
* [函数,pfwHttp]
  - n_httpclient/n_httpresponse增加直接发送XML对象的接口,默认Content-Type为text/xml;utf-8
* [函数,pfwParser]
  - ParseJSON/ParseXML
* [函数,pfwUIObjects]
  - n_cst_splitcontainer_panel增加of_AttachObject函数,u_cst_splitcontainer增加of_TemplateAttach函数,用于绑定使用相对定位的对象,与of_BindObject的区别在于该函数绑定的对象不会改变容器的父子关系
* [常量,pfwUIObjects]
  - u_cst_shortcutbar_theme增加CLR_SPLITBARBORDER
* 想不起来了..

### 调整

* [pfwHttp]
  - n_httpclient的证书和密钥设置函数做了修改,删除了SetCertType/GetCertType函数
* [pfwCrypto]
  - :warning: n_crypto对称加密与HMAC调整了算法(不兼容之前的版本),为跨语言(库)对称加密通讯提供可能(注:SymEncrypt/SymDecrypt仅支持PKCS5 PADDING)
* [pfwUIControlsExt]
  - pfwUIControlsExt.pbl包里的控件不再根据操作系统版本设置微软雅黑字体,默认都为Arial
* [pfwUI]
  - :warning: 重新设计了颜色取值的机制,涉及所有OnGetColor/OnGetItemColor事件

### 优化

* [pfwUIControls]
  - 优化MDI窗口菜单快捷键

### 修复

* [pfwUIControls]
  - PB9使用SplitContainer时编译后报R0025异常
* [pfwUIControls]
  - s_cst_singlelineedit/s_cst_multilineedit/s_cst_editmask/s_cst_dropdownlist控件相关的BUG

