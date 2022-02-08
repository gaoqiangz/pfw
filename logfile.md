## 3.0.1.2032(2022-02-08)

��3.0�汾��ʼSciter���潫����[Sciter.JS](https://github.com/c-smile/sciter-js-sdk)�汾���ټ���TIScript�汾

### ����

* [pfw.utility]
- `n_logger`����`SetHead`����(ÿ��������ӵ�ͷ����Ϣ)
> ��ǿHeader��ʽ�����ܣ�֧�֣�{L}����{Y}�꣬{M}�£�{D}�գ�{h}ʱ��{m}�֣�{s}�룬{ms}����
* [pfw.utility.parser]
- `n_json`����`FindItemString`/`FindItemLong`/`FindItemLongLong`/`FindItemDouble`/`FindItemBoolean`
* [pfw.net.websocket]
- `n_wsclient::Publish`֧�ַ���`blob`����
* [pfw.thread]
- task����`of_SetDelayFor`����������������ָ���ӳٺ��룩��ִ��
- `n_cst_threading::of_Stop`����exitcode������ָ���߳���ֹȡ�����˳�����
- `n_cst_thread`����`OnPrepareTask`�¼�
* [pfw.thread.ext]
- `sqlquery`����`#PageNative`���ԣ�ʹ��ԭ���﷨ʵ�ַ�ҳ(��MSSQL��`LIMIT`�﷨)
- `sqlquery`����`of_SetPagedUniqueIndexColumns`������֧��Ψһ�����з�ҳ�Ż�
- `sqlquery`/`sqlupdate`/`sqlcommand`����`of_GetParam`/`of_GetParamName`/`of_GetParamCount`����
> Ŀǰ������MSSQLʵ��
- `sqlquery`����`of_SetReceiver`����������ֱ�ӽ������ݵĶ��󣬼����ڴ濽���������
- `sqlcommand`֧�ְ󶨲���
- `sqlquery`���ӹ��ӻ��ƣ��̳�`n_cst_thread_task_sqlbase_hook`����Ĭ�ϲ�ѯ��ʽ
- `n_cst_thread_trans::of_GetTransData`֧�ַ��ش�����Ϣ
* [pfw.ui.controls]
- `n_cst_popupmenu`����`of_GetTag`/`of_SetTag`����
- `n_cst_ribbonbar_panel`/`n_cst_taskpanelbar_panel`����`of_FindCheckedRadio`����
* [pfw.ui.objects]
- `n_cst_splitcontainer_panel`����`of_Replace`����
- `n_cst_splitcontainer_panel`����`#Collapsed`���ԣ�֧��ͨ�������۵����
* [pfw.ui]
- `win32`����`IsWin10`����

### ����

* [pfw.utility.sqlite]
- `n_sqlite::IsOpenned` -> `IsOpened`
> *** ��������ʾ ***
* [pfw.thread.ext]
- `sqlupdate`û�и�������ʱ���سɹ�
- `sqlcommand::#AutoCommit`ʹ��ö�ٳ�������������������ύ
- `sqlquery::#ChunkSize`Ĭ��ֵ�޸�Ϊ`10000`
* [pfw.utility.parser]
- `n_json::GetValue`/`GetItemValue`/`FindItemValue`��JSON��Ч�����Ͳ�ƥ���Ԫ�ز����ڻ�ֵΪNULLʱͳһ����NULL
> *** ��������ʾ ***

### �Ż�

* [pfw.thread.ext]
- �Ż�`sqlquery`/`sqlupdate`/`sqlcommand`�������
- `sqlupdate`���ƶ����¶�`UpdateKeyInPlace`�Ĵ���
- `sqlupdate`֧��`NChar`�ַ������﷨
> ��ҪDBParm����DisableBind=1����NCharBind=1
- `sqlquery`/`sqlupdate`���Ӷ��󻺴棬����Ż���ѯ�����¹�������
- �������ñ����ڹ��������ڣ������߳�ͬ������
- `n_cst_thread_trans`�����Ѿ�����Ͽ�������ʹ��`DISCONNECT`���ⷢ������
* [pfw.ui.sciter.ext]
- `treeview`����֧�ִ洢NULLֵ��ת��Ϊ'(null)'
- `treeview`�Ϸ��Ż�
* [pfw.ui.controls]
- �����صĿؼ��Ƶ���Ļ�⣬��ֹ��������ʾ����
- `s_cst_datawindow`�򸸿ؼ�ת��������Ű�����Ϣ
- `toolbarstrip`�Ż���굥��
* [pfw.utility.parser]
- `n_sql::ModifyClause` `SCT_TABLE MS_APPEND`���ݱ����ӵ����

### �޸�

* [pfw.thread]
- `n_cst_threading`����`#IgnoreTaskCancel`���ԣ�Ĭ��Ϊ`true`��Ϊ`false`ʱ������ȡ�����̺߳ͺ��������񶼽���ȡ��
- �޸��¼��ַ��ݹ�ʱ��ֹ������״̬����ȷ�����⣨`of_Prevent`������`of_Trigger`��
* [pfw.thread.ext]
- `sqlupdate`�޸�`KeyColumns`û��ָ��������
- `sqlquery`�޸��������DW���ݴ���1��ʱʹ��`SetChanges`���ܻᶪʧ�е�����
- `sqlquery`���������ֶι���ʱ���ܳ���`SetFullState`��������
* [pfw.common]
- ����`ClassName`���ܳ��ֵ��쳣
* [pfw.ui.controls]
- `s_cst_statictext`�޸������ı�û��ˢ�»��Ʋ��ֵ�����
- `splitcontainer`���ƶ�`DeferWindowPos`�Ĵ�����ֹ�������仯
* [pfw.ui]
- �޸�Զ������ʱ������ʾ�����صĿؼ�
* [pfw.net.http]
- �޸�HTTPЭ��������ܴ�������HTTPS���õ��±��������
- �޸�`UploadFile`������ȡ��Ч������
* [pfw.utility.container]
- `n_map`�޸�`Add`�����ظ�KEYʱ�ڴ�й¶
* [pfw.utility.invoker]
- `n_objectinvoker`�޸�`Detach`û����ջ��������

### ����

* [pfw.ui.sciter]
- ����sciter�汾��4.4.8.26
* [pfw.ui.blink]
- ����blink�汾��200319

## 2.3.1.1982(2020-03-19)

### ����

* [pfw.utility]
- n_logger����OnLog�¼����ڲ����������־���ݣ���������ͬ���������洢λ�ã��������ݿ�
* [pfw.utility.barcode]
- n_barcode/n_qrcode����SaveClipboard��������������ͼƬ��ճ����

### �޸�

* [pfw.utility.barcode]
- �޸�n_barcode��ʾ�ı�ʱ�Ĵ�С���ܼ��㲻��ȷ
* [pfw.utility.barcode]
- �޸�n_barcode/n_qrcode��ĳЩ��ӡ����ӡ������������
* [pfw.net.http]
- �޸��������Ӧ״̬��Ϊ401��407ʱGetError��Ϊ0������

## 2.3.1.1982(2020-03-19)

### ����

* [pfw.ui.blink]
- ����VIP�汾��blink�ӿڣ�fastmb/miniblink��
- n_blinkfast/u_blinkfast/w_blinkfast
> ֧�����ء���ӡ��VIP���ƹ���
> ע��
> ʹ��INIT_FLAG_ENABLE_BLINKFAST��ʼ�������Ҳ�������ͨ�汾�ӿ�ͬʱʹ��
> VIP�汾�Ľ������첽�ģ���֧����ͨ�汾��JS���ɹ��ܣ�����ʾ������w_test_blinkfast��
* [pfw.ui.blink]
- n_blink/u_blink/w_blink����ShowDevTools��������ҳ����Դ���
> ShowDevTools([inspectorPath]),insepctorĬ��ֵΪ: blink\devtools\inspector.html
* [pfw.ui.controls]
- s_cst_datawindow����of_Reattach�����������޸���DataObject����ʱ���´��ڱ��ؽ��������ֶ���pfw�ӹܻ���
* [pfw.utility.invoker]
- n_cst_eventful::of_Prevent����[deep]������֧����ֹ�����ַ���������������ȣ�
* [pfw.thread]
- n_cst_threading/n_cst_threading_task����of_PreventEventȡ����ǰ���¼��ַ���
* [pfw]
- ������Դ֧�ִӴ�֤���EXE/DLL�м��أ�����LoadUri������
* [pfw.ui.sciter.ext]
- u_cst_sciter_treeview::of_Load֧��checked�������ýڵ�Ĺ�ѡ״̬��{..,checked:true,...}��

### �Ż�

* [pfw.datawindow.services]
- �Ż�n_cst_dwsvc_columnsort������ԣ���������

### �޸�

* [pfw.thread.ext]
- �ٴ��޸�n_cst_threading_task_sqlquery�޸�SQLʱ��SQL��"���ŵ���Modify SELECTʧ�ܵ�����
* [pfw.thread]
- n_cst_threading_pool::of_Release/of_ReleaseAllͬʱȡ���̵߳ĵ�ǰ���¼��ַ���
* [pfw.ui]
- �޸�XP�¿�������SVG��Ⱦʱ����������
* [pfw.net.http]
- �޸���Ӧ����Ϊѹ����ʽʱ���ܳ��ָ�ʽ���������
* [pfw.ui]
- �޸������ɫģʽ��SVGͼ����Ⱦ��ʾ���˵�����
* [pfw.ui.blink]
- �޸���Դ·���������Ŀ��ܼ���ʧ�ܵ�����
* [pfw.ui.controls]
- �޸��������ģʽ�޸���Ļ�ֱ��ʺ󴰿ڴ�С����ȷ�����⣨����WIN10��ƽ��ģʽ��ת��

### ����

* [pfw.ui.sciter]
- ����sciter�汾��4.4.1.4
* [pfw.ui.blink]
- ����blink�汾��200319

## 2.2.1.1923(2019-08-16)

### ����

* [pfw.ui.objects]
- n_cst_window_titlebar(s_cst_window::CaptionBar)����of_AddSplitButton/of_InsertSplitButton����
* [pfw.thread]
- ֧�ְ�ȫ�����߳����й��̲����ɾ�����񣨿����������Stop�¼���ɾ����������
* [pfw.thread]
- n_cst_threading����OnThreadCreate�¼��������Զ��崴���߳�
> ʹ�ø��¼�����ʵ�ֵ��߳�ģ����̻߳��ƣ�����ͬһ�״��룬�����Ų����⣬�����ڵ��߳�ģʽ��SQL����Ĳ�ѯ���ᷢ���ڴ濽���������Թ���ͬһ���������ӣ���Ҫ�Զ������ӳأ�
```
onThreadCreate(string clsname,ref n_cst_thread thread,ref string instancename):
	thread = Create Using clsName //ֱ��Create����ʹ��SharedObjectRegister
	return 1 //��ֹĬ����Ϊ
```
* [pfw.thread.ext]
- n_cst_threading_task_sqlquery����of_MoveData����ת��Dataʵ������������Ȩ�������ڴ濽��
* [pfw.thread.ext]
- SQL���񣨼̳���n_cst_thread_task_sqlbase������֧���̵߳�$SQL.TransPool.Class������֧���Զ������ӳأ��̳���n_cst_thread_trans_pool��
* [pfw.http]
- n_httpclient����AddHeader������֧�ֽ��պͷ�����ͬ���ƵĶ��Header ��RFC��https://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html#sec4.2��
* [pfw.utility]
- n_logger����GetTraceLevel/SetTraceLevel���������ڿ���ָ����־�����Ƿ�ͬʱ�������ջ��Ϣ������w_test_logger��
* [pfw.common]
- Sprintf֧��'{}'�Զ�������ţ�n_logger��ʽ�����ͬ��֧�֣�
```
	Sprintf("{}-{}-{}",123,"abcd",true) -> 123-abcd-true
```
* [pfw.common]
- Sprintf֧��ֱ����������n_json/n_xmldoc��n_logger��ʽ�����ͬ��֧�֣�
* [pfw.net.ftp]
- n_ftpclient����GetLastError/GetLastErrorInfo/List����
> List��ȡ�ļ��б�

### �Ż�

* [pfw.datawindow.services]
- �Ż�n_cst_dwsvc_contextmenu�Զ��п�������������ͷ
* [pfw.utility.invoker]
- �Ż�n_cst_eventful֧���¼��ַ��׶ζ����¼���ʵ�֣�of_On�������ڻ�������Ч
* [pfw.utility.invoker]
- �Ż�n_cst_eventful�Ĳ�������
* [pfw.http]
- n_httpclient::DownloadFileֻ���ڽ��յ�����ʱ�Ŵ����ļ�
* [pfw.http]
- �Զ�����ѡ��߰汾SSL��WIN7��װ����֮�����֧��TLS1.2��
* [pfw.ui.controls]
- n_cst_i18n_cht/n_cst_i18n_enʹ��XML�����ļ�

### ����

* [pfw.thread]
- pfwʹ�õĲ�����'$'��ͷ���������û�������������ʹ���̳߳�ʱof_Release�Ժ������
> *** ��������ʾ ***
> ���в����䶯��
> SQL.TransPool.TransClass -> $SQL.TransPool.TransClass
> SQL.TransPool.KeepAlive -> $SQL.TransPool.KeepAlive
> SQL.TransPool.KeepAliveExpireTime -> $SQL.TransPool.KeepAliveExpireTime

### �޸�

* [pfw.net.websocket]
- �޸�n_wsclientʹ��MQTTЭ��ʱ��[resubscribe]���ܿ���ʧЧ������
* [pfw.utility.sqlite]
- �޸�Exec/Query�󶨲���ΪNULLʱ����NULL������
* [pfw.utility.invoker]
- �޸�n_cst_eventful�¼��ַ������д�[Response]���ڣ��ٵ���of_On�������¼�ʱ����ջ���������
* [pfw.ui]
- �޸�n_timer���ܳ��ֵ��ڴ��쳣
* [pfw.demos]
- �޸�sciter��alipay/wxpay��SDKʹ�õ�Object.remove����������������
* [pfw.utility.devinfo]
- �޸�u_cameracapture::ShowSettingWindow��������������ڴ��쳣���⣨����ͷ���ã�
* [pfw.ui.controls]
- �޸�n_cst_popupmenu::OnMenuSelect�¼��е������ڿ��������ڴ��쳣������
* [pfw.ui.controls]
- �޸�u_cst_tabcontrol��������û�д���OnReposition�¼�������
* [pfw.ui.controls]
- �޸�s_cst_vprogressbar/s_cst_hprogressbar::OnPaint�¼���ΪMaxPosition=MinPosition��ɳ�0�쳣������
* [pfw.ui.blink]
- �޸�n_blinkelement::AddChild���뵽���ڵ������
* [pfw.thread.ext]
- �޸�n_cst_threading_task_sqlquery�޸�SQLʱ��SQL��"���ŵ���Modify SELECTʧ�ܵ�����
* [pfw.ui.controls]
- �޸�u_cst_ribbonbar���ݹ���λ��ˢ�¿��ܲ���ȷ������
* [pfw.ui.controls]
- �޸���������С�����޸ĵ�����

### ����

* [pfw.ui.sciter]
- ����sciter�汾��4.3.0.10
* [pfw.ui.blink]
- ����blink�汾��190812

## 2.1.7.1797(2019-06-20)

### ����

* [pfw.utility.sqlite]
- n_sqlite����AutoCommit��������ԭ��Commit(true)���÷���ʹ�������ȷ��[SQLCode=0]ʱ[COMMIT],����[ROLLBACK],[COMMIT]ʧ��ʱҲ�Զ�[ROLLBACK]��

### ����

* [pfw.utility.sqlite]
- n_sqlite::Commit[auto]������Ϊ[autorollback] ��[COMMIT]ʧ��ʱ�Զ�[ROLLBACK],Ĭ��Ϊtrue��
> �����غ�����2.1.6.1791����

## 2.1.6.1791(2019-06-19)

### ����

* [pfw.utility.sqlite]
- n_sqlite::Commit����[auto]���������ذ汾��[SQLCode=0]ʱ[COMMIT],����[ROLLBACK],[COMMIT]ʧ��ʱҲ�Զ�[ROLLBACK]��
* [pfw.ui.sciter]
- TIS����SQLite����ֲ��Sciter SDK SQLite���������DB����ΪSQLite���÷�����sciter-sdk\samples\sqlite��
```
var db = SQLite.open(":memory:"); //SQLite.open("c:/test.db"[,password]);
//open����ͬʱ֧��[password]����
```
* [pfw.net.websocket]
- n_wsmessage����IsRetained�����ж�MQTT��Ϣ�Ƿ�Ϊ[Retained]��Ϣ
* [pfw.ui.sciter]
- n_sciter�����˳�Popup״̬ʱ����view.closingPopup([reason])��self.closingPopup([reason])�ص�����
> reasonֵ����Ϊ��
> #by-code, ����n_sciter::ClosePopup��view.closePopup�����˳�
> #by-mouse, �����������������ʱ�˳�
> #by-key, ����VK_ESCAPE�����˳�
> #by-deactivation, �л����������̽���Ǽ���״̬
* [pfw.utility]
- ����PinyinFirstLetterLikeȫ�ֺ�����ƴ������ĸģ��ƥ�䣬֧�ֶ����֡�ģ����ƥ��
* [pfw.common]
- ����ClassNameExȫ�ֺ��������Ի�ð���ö���������ڵ��κα���������

### �Ż�

* [pfw.utility.sqlite]
- Exec����ֻ��ָ����Զ��������񣬱���[SELECT]���
* [pfw.utility.sqlite]
- Commit/Rollback������Ӱ��SQNRowsֵ
* [pfw.datawindow.services]
- �Ż�n_cst_dwsvc_dropdownsearchƴ����������
* [pfw.thread]
- �ع��߳��ͷŻ���

### ����

* [pfw.datawindow.services]
- �Ƴ�DDSPYFirstLetterLike��ʹ��pfw.utility::PinyinFirstLetterLike��

### �޸�

* [pfw.net.websocket]
- �޸�n_wsmessage::GetDataJSON/GetDataXML/GetDataȡ�������ݵ�����
* [pfw]
- �޸����̻߳�����ʹ��pfw�����Ӷ������߳����ٿ����������������
* [pfw.net.websocket]
- �޸�n_wsclientʹ��MQTTЭ��ʱ���ܶ�ĳЩbroker�����ݵ�����

### ����

* [pfw.ui.blink]
- ����blink�汾��190613
* [pfw.ui.sciter]
- ����sciter�汾��4.3.0.6

## 2.1.5.1728(2019-05-17)

### �޸�

* [pfw.utility.sqlite]
- �޸�Queryû���ṩ����ʱ����ʧ�ܵ����⣨��2.1.5.1724�汾���룩

## 2.1.5.1724(2019-05-17)

### ����

* [pfw.utility.sqlite]
- n_sqlite::Query֧���ṩDS/DW����SQL�ļ�����������db.Query(dw_1,""/*��ָ��sqlʱʹ��dw�ڲ���sql*/,arg1,arg2,...)

### �޸�

* [pfw.datawindow.services]
- n_cst_dwsvc_columnsort/n_cst_dwsvc_contextmenu֧�ָ��ֵ�λ��PBU/CM/INCH/PX��

## 2.1.4.1719(2019-05-16)

### ����

* [pfw.utility.sqlite]
- ����sqlite����pfw.pbl::w_test_sqlite��
* [pfw.thread.ext]
- n_cst_threading_task_sqlquery����SQLʵ�����Ȳ�����

### �޸�

* [pfw.ui.sciter.ext]
- �޸�u_cst_sciter_treeview˫���ӽڵ㱻����Ϊ��״̬������
* [pfw.ui.sciter.ext]
- �޸�u_cst_sciter_sidebar�������ٲ��Ż��۵���ʾЧ��

### ����

* [pfw.ui.sciter]
- ����sciter�汾��4.2.8.4
* [pfw.ui.blink]
- ����blink�汾��190515

## 2.1.3.1662(2019-05-05)

### ����

* [pfw.ui.sciter.ext]
- ����u_cst_sciter_sidebar��ߵ����˵�����pfw.demos.pbl::u_cst_tabpage_sciter_sidebar��
* [pfw.utility]
- n_logger����SetLevel����������������ļ����������ϣ���Enums.LOG_LEVEL_XXX��
- n_logger::Info/Warning/Error/Debug��������[level]�������ذ汾��ָ���������
* [pfw.utility]
- n_logger����Custom��������Զ���ͷ������

### ����

* [pfw.net.http]
- n_httpformdata::AddFile����filelength����

### ����

* [pfw.utility]
- n_logger�Ƴ�SetDebugMode������ʹ��SetLevel���������
* [pfw.thread]
- n_cst_threading_pool�Ƴ�OnIdle�¼�
> ������Ҫ�ֶ�����n_cst_threading::OnIdle�¼�

### ����

* [pfw.ui.sciter]
- ����sciter�汾��4.2.8.3

## 2.1.2.1602(2019-04-12)

### ����

* [pfw.net.http]
- ����n_httpformdata������form����������
* [pfw.ui.controls]
- n_cst_ribbonbar_theme����#TabPadding��������Tab�ڼ���С����ǩ�������������С��
* [pfw.utility.regexp]
- RegExpFindȫ�ֺ������ӷ���subs[]��������ذ汾
* [pfw.common]
- Enums����REGEXP_MATCH_GLOBAL��־�����ڿ���RegExp::Find��������subs[]����ʱ��ȫ�ֲ��ҹ���
* [pfw.thread]
- n_cst_thread/n_cst_thread_task/n_cst_threading/n_cst_threading_task����of_SetData/of_GetData/of_HasData/of_RemoveData������˽������
* [pfw.thread.ext]
- n_cst_threading_task_sqlcommand/n_cst_threading_task_sqlquery/n_cst_threading_task_sqlupdate�Ƴ�of_SetTransClass����
* [pfw.thread]
- ��ʹ��SQL���񣨼̳���n_cst_thread_task_sqlbase������ʱ���̴߳������֧������ȫ���¼����Ʋ�����
```
Threading.of_SetData("SQL.TransPool.TransClass","ne_cst_thread_trans") //�����������ӳ�ʹ�õ�����������Ҫ��̳���n_cst_thread_trans��
Threading.of_SetData("SQL.TransPool.KeepAlive",true) //�����������ӱ��ֻ��ƣ�û���������õ����񽫱������ӣ��Ա��̸߳���ʱ�µ�SQL������ֱ�Ӹ������ӣ�
Threading.of_SetData("SQL.TransPool.KeepAliveExpireTime",15) //���ӱ��ֵ��ʱ��(s)��Ĭ��30
ע��
�������ӱ��ֻ�����Ҫ���OnIdle�¼������򱣳ֳ�ʱ���ܶϿ�����
Threading.Event OnIdle()
��
ThreadPool.Event OnIdle()
```
* [pfw.thread]
- n_cst_threading/n_cst_threading_pool����OnIdle�¼������ڶ���֪ͨ�����߳�ִ��һЩά�����룬���������ᵽ���������ӱ��ֳ�ʱ������
* [pfw.thread]
- n_cst_threading_pool����of_Create����������ǿ�ƴ����̳߳��߳�

### �Ż�

* [pfw.datawindow.services]
- ����DDSPYFirstLetterLikeƥ���㷨���磺KKW LIKE KW = true

### �޸�

* [pfw.ui.controls]
- �޸�s_cst_hprogressbar/s_cst_vprogressbar�ھ��������ˢ����ʾ����
* [pfw.utility.container]
- �޸�n_vector/n_list::SortĬ������
* [pfw.utility.regexp]
- �޸�n_regexp::Find�ڴ��쳣������
* [pfw.ui.controls]
- �޸�u_cst_tabpage::OnOpened�¼���OnActivated֮�󴥷�������
* [pfw.ui.controls]
- u_cst_toolbarstrip�󶨿ؼ�ż��û��ͬ�����ص�����
* [pfw.ui.controls.ext]
- �޸�w_cst_msgbox����ʱ��ť�ı�������ʾ��ȫ������
* [pfw.thread.ext]
- �޸�n_cst_threading_task_sqlquery�������ѯ��������յ�����
* [pfw.ui.controls]
- n_cst_popupmenuʹ��Post�����¼�����������ڴ��쳣

### ����

* [pfw.ui.blink]
- ����blink�汾��190329

## 2.1.1.1530(2019-03-01)

### ����

* [pfw.demos]
- n_cst_sciter_traynotification::of_Notify����delay�ӳ�ʱ���������λ�룩

### �Ż�

* [pfw.utility]
- n_logger���������ȷ������

### �޸�

* [pfw.utility.regexp]
- �޸�RegExpFind���ܻ�ȡ���������
* [pfw.utility.parser]
- n_sql�޸�һЩBUG�����Ҽ���û��[FROM]�����
* [pfw.net.http]
- �޸����ܳ������ݽ�ѹʧ�ܵ�����

## 2.1.0.1491(2019-02-25)

### ����

* [pfw.common]
- ����GetCurrentScriptȫ�ֺ�������ȡ��ǰִ�еĴ���λ��
* [pfw.utility.parser]
- n_xmldoc/n_xmlnode����GetChildren/FindChildren����
* [pfw.ui.sciter.ext]
- u_cst_sciter_treeview/n_cst_sciter_treeview_option���Ӹ������Բ��ҽڵ�����غ���of_FindChild/of_FindChildren/of_FindOption/of_FindOptions
* [pfw.ui.sciter.ext]
- u_cst_sciter_treeview����of_Load���غ����������ڵ㹹��ʱ������ܣ���pfw.demos.pbl::u_cst_tabpage_sciter_treeview
* [pfw.utility]
- ����GetTimestampȫ�ֺ�����ȡ��ǰʱ���
- ����DateTimeToTimestamp/TimestampToDateTimeʵ��
* [pfw.utility]
- ����ParseDateTimeȫ�ֺ��������������ַ�����֧��RFC822/RFC850/ANSI C��ʽ��ͬʱ����PB��ʽ
```
Wed, 21 Oct 2015 07:28:00 GMT
Wed, 21 Oct 2015 15:28:00 UTC+0800
//���ص�����ʼ��Ϊ����ʱ��
```
* [pfw.thread]
- n_cst_thread����of_GetExecCount������ȡִ�д���
* [pfw.thread.ext]
- �����Զ����������n_cst_thread_trans
- n_cst_threading_task_sqlquery/n_cst_threading_task_sqlupdate/n_cst_threading_task_sqlcmd����ͨ��of_SetTransClass������ָ���Լ�������������ͣ���n_cst_thread_trans�̳У�

### ����

* [pfw.ui.controls]
- u_cst_tabcontrol::OnTabSelectionChanged�¼���Ϊͬ��������ԭ����Post������
> *** ��������ʾ ***
* [pfw.utility.regexp]
- �ع�n_regexp������Compile������ʹ�øö�����д�����������ʽƥ����������

### �Ż�

* [pfw.net.http]
- �Ż�n_httpresponse::GetDataJSON/GetDataXML����
* [pfw.net.websocket]
- �Ż�n_wsmessage::GetDataJSON/GetDataXML����
* [pfw.net.http]
- ����Ĭ��ͷ��Accept-Encoding: gzip, deflate

### ����

* [pfw.ui.blink]
- ����blink�汾��190225
* [pfw.ui.sciter]
- ����sciter�汾��4.2.6.10

## 2.0.9.1403(2019-01-23)

### ����

* [pfw.net.http]
- URLEncode����uppercase����
* [pfw.common]
- ����Assert���Բ���ȫ�ֺ�������pfw.pbl::w_test_assert��
* [pfw.common]
- ����StackTrace/StackTraceInfoȫ�ֺ�����ȡ��ǰ����ջ��Ϣ

### �Ż�

* [pfw.utility.invoker]
- n_cst_eventful�����쳣��׽

### ����

* [pfw.ui.blink]
- ����blink�汾��190123

### �޸�

* [pfw.net.websocket]
- �޸�n_wsclient::Subscribe�������ĵ�BUG
* [pfw.ui.sciter.ext]
- �޸�n_cst_sciter_treeview_option::of_InsertAfter/of_InsertBefore
* [pfw.datawindow.services]
- �޸�se_cst_dw::Filter/DeleteRow
* [pfw.ui.blink]
- �޸�n_blinkvalue::RemoveAll��Ч������
* [pfw.utility.parser]
- �޸�n_json��һ����������2.0.8���룩

## 2.0.8.1352(2019-01-04)

### ����

* [pfw.ui.sciter]
- ����SciterSetOptionȫ�ֺ�������������ȫ�ֵ�Sciter����ʱ����

### ����

* [pfw.utility.parser]
- n_json KEY�Ļز����ִ�Сд
* [pfw.ui.sciter]
- ����Skia�汾��sciter.dll ��XP�½�����Skia��Ⱦ��
* [pfw.datawindow.services]
- ʹ��n_cst_eventful�ع�

### ����

* [pfw.ui.sciter]
- ����sciter�汾��4.2.6.8

### �޸�

* [pfw.ui.sciter]
- ��4.2.6.3֮��汾��sciter������ֵļ���

## 2.0.7.1341(2019-01-03)

### ����

* [pfw.utility.parser]
- n_json����ʵ��Find������֧����������Ԫ��
```
�﷨��
    key/#index/key
    ·����'/'�ָ���'#'��ͷΪ�������±��1��ʼ��
    *ʹ��'\'ת���ַ�

�磺
{"key1":[{"subKey1":"abcd"},{"subKey2":"efgh"}],
"key2":[{"subKey1":"ijkl"},{"subKey2":"mnop"}]}

    json.Find("key2/#2/subKey2") ==> "efgh"
�ȼ�:
    json.Find("#2/#2/#2") ==> "efgh"
```
* [pfw.utility.parser]
- n_json����FromObject��PB����ת��ΪJSON��/ToObject��JSON��ֵ��PB���󣩺�������pfw.pbl::w_test_json
> �ṹת��ΪJSON,JSONת��Ϊ�ṹ
* [pfw]
- ����n_cst_appargs(�������������в�������)/n_cst_appconfig(����XML�����ļ�����)�����࣬��pfw.pbl::w_test_appargs/w_test_appconfig

### �Ż�

* [pfw.ui.sciter]
- ����TIS���ʶ���ö�����Ե�֧�֣��ĵ��Ѹ��£�
* [pfw.ui.blink]
- ����JS���ʶ���ö�����Ե�֧�֣��ĵ��Ѹ��£�

### ����

* [pfw.ui.blink]
- ����blink�汾��181228

### �޸�

* [pfw.utility.invoker]
- �޸�n_cst_eventful::of_On�ظ�ע�������û�к��Թ����¼�������
* [pfw.net.websocket]
- �޸�n_wsclient::Send������JSON/XML���ذ汾�����쳣������
* [pfw.ui.controls]
- �޸�s_cst_window�ر�ʱû��ֹͣ����timer�����NULL�����쳣������
* [pfw.utility]
- �޸�n_logger����̨����������������

## 2.0.6.1297(2018-12-11)

### ����

* [pfw.sciter]
- ����SciterSetMasterScript����������tisȫ�ֽű���

### �Ż�

* [pfw.ui.sciter.ext]
- �Ż���ӽڵ������

### ����

* [pfw.ui.blink]
- �ϳ�IsLoadFailed/IsLoadSucceeded/IsLoadComplete����

### ����

* [pfw.ui.sciter]
- ����sciter��4.2.6.6�汾��Ҫ��XP��ʹ�ñ�����pfw����dll������ʹ�ùٷ����������İ汾��
* [pfw.ui.blink]
- ����blink�汾��181205

### �޸�

* [pfw.ui.sciter.ext]
- �޸��ڵ����ƴ������ַ�������
* [pfw.utility]
- �޸�n_logger�������������������⣨���ڲ���UTF-8���룬���е���־�ļ��������UTF-8+BOM��ᱻ��գ�
* [pfw.datawindow.services]
- �޸�n_cst_dwsvc_dropdownsearch�ڼ������ݺ����ʧЧ������
* [pfw.ui.controls]
- �޸�s_cst_dropdownlist����[Backspace]��ʱ���ܵ��±���������

## 2.0.5.1233(2018-10-17)

### ����

* [pfw.utility.parser]
- n_json KEY���ִ�Сд

### �޸�

* [pfw]
- �޸�w_packager[Thread Extensions]��������ȱʧ������
* [pfw]
- �޸�w_packager[Camera Capture]��������ȱʧ������
* [pfw.utility.invoker]
- �޸�n_cst_eventful������������VM����������
* [pfw.ui.blink]
- �޸�LoadFile����zip��Դʱ������Դ���ܻ�ʧ�ܵ�����
* [pfw.ui.controls]
- �޸�����[MaxBox]Ϊfalseʱ���û�и���ȫ��������
* [pfw.ui.blink]
- �޸������޷����������

## 2.0.4.1198(2018-09-18)

### ����

* [pfw]
- �����Զ��������ߣ����Ը����Լ�����Ҫ�����⵽һ��PBL�У���pfw.pbl::w_packager��
* [pfw.net.websocket]
- n_wsclient���Ӹ���Publish��ֱ�ӷ���JSON/XML����/Subscribe/Unsubscribe����
* [pfw.net.websocket]
- MQTT���Ӳ�������[offlinePublish]��[offlineSize]��������pfw.pbl::w_test_websocket_mqtt��
* [pfw.thread]
- ֧��û���������ʱҲ�������̣߳�of_Run���������������߳�����ʱ��̬�������

### �޸�

* [pfw.net.websocket]
- �޸�MQTT�������¶������������ȡ�������������

## 2.0.3.1163(2018-09-10)

### ����

* [pfw.net.websocket]
- n_wsclient����MQTTЭ��֧�֣�mqtt://��mqtts:// for SSL������ҪBroker(MQTT����֧��WebSocket���ӣ���pfw.pbl::w_test_websocket_mqtt��
- n_wsclient�����Զ���������
- ����SetAutoReconnect���������Զ�����
- ����IsReconnecting�����жϵ�ǰ�Ƿ�����ִ���Զ�����
- OnOpen�¼�����[reconnect]���������ж��Ƿ�Ϊ��������
- OnOpen�¼�����[sessionPresent]��������MQTTЭ��
- n_wsmessage����GetTopic/GetQoS����������MQTTЭ�飩

### �Ż�

* [pfw.utility]
- n_logger�Ż������ʽ

### ����

* [pfw.ui.blink]
- Ĭ�Ͻ���Debug���(ʹ��SetDebugOutput(true)����)

### �޸�

* [pfw.ui.blink]
- �޸�n_blinkvalue��������ֵ��������
* [pfw.ui.blink]
- �޸�n_blinkvalue::GetItemCountʼ�շ���0������
* [pfw.ui.blink]
- �޸�n_blinkvalue::GetItemBooleanʼ�շ���false������
* [pfw.ui.blink]
- �޸����뷨���벿���ַ����ܵ��½��㱻�л�������
* [pfw.utility.zip]
- �޸�ZipCompress/ZipUncompress��ʽΪgzip/zlibʱʧ�ܵ�����
* [pfw.utility.parser]
- �޸�n_json����ѭ������ʱGC�ͷŶ��������
* [pfw.net.http]
- �޸��ص��¼��������ܻḳֵʧ�ܶ�����ն����쳣������
* [pfw.net.http]
- �޸�����x509 private key֮����ܳ����ͷ��ڴ��쳣������
* [pfw.thread.ext]
- n_cst_threading_task_sqlquery�޸���������ΪNULLʱ����ʧ�ܵ�����

## 2.0.2.1073(2018-07-31)

### ����

* [pfw.ui.blink]
- ֧��High DPI

### �޸�

* [pfw.ui.blink]
- �޸�����ģʽ�¿��ܳ��ֱ���������

## 2.0.1.1068(2018-07-30)

��2.0��ʼ�����ʼ�������ʹ��

### ����

* [pfw.ui.blink]
- ����blink��Ⱦ���棨MiniBlink�����ṩ��sciterһ�µĽ�����ʽ
* [pfw.utility.devinfo]
- ����u_cameracapture��USB����ͷ����ؼ���֧�ֶ�����ͷ����pfw.pbl::w_test_camera_capture��
* [pfw.net.ftp]
- ����n_ftpclient���󣨼�pfw.pbl::w_test_ftpclient��
* [pfw.net.ftp]
- ����FtpDownload/FtpUploadȫ�ָ������������������ж�����ذ汾����װ����n_ftpclient��
* [pfw.ui]
- ���ӽ������ؼ�������pfw.pbl::w_test_progressbar��
* [pfw.utility]
- ����GetPinyinFirstLetter��ȡ����ƴ������ĸȫ�ֺ�����GetPinyinFirstLetters֧�ֶ�������ϣ�
* [pfw.ui.sciter]
- n_sciterelement����GetTagName/SetName/SetID/HasAttribute����(GetTagName����ԭ����GetName���������ڵ�GetName��������"name"���Ե�ֵ)
* [pfw.ui.sciter]
- u_sciter/n_sciter����GetElementsByName/GetElementsByTagName/GetElementsByClassName����
* [pfw.ui.sciter]
- n_scitervalue����InvokeMethod����
* [pfw.net.http]
- ����HttpRequest/HttpGet/HttpPost/HttpDownload/HttpUploadȫ�ָ������������������ж�����ذ汾����װ����n_httpclient��

### ����

* [pfw.ui]
- win32/painter�����ع�Ϊȫ�ֶ����ɳ�ʼ��������ʼ����Enums.INIT_FLAG_ENABLE_UI��
> *** ��������ʾ ***
* [pfw.ui]
- ����OnThemeChanging�¼�
> *** ��������ʾ ***
* [pfw.ui]
- n_cst_base_theme����of_UpdateBegin/of_UpdateEnd����
> *** ��������ʾ ***
* [pfw]
- w_test_static_mapʹ�ðٶȵ�ͼAPI

### �޸�

* [pfw.utility.invoker]
- n_scriptinvoker::Init�󶨶�����ʱ����˽�к���
* [pfw.datawindow.services]
- �޸�n_cst_dwsvc_columnexp����dwo����ʧЧ������
* [pfw.thread.ext]
- n_cst_threading_task_sqlquery�޸����汨��SQL��ԭ������
* [pfw.thread.ext]
- n_cst_threading_task_sqlquery�޸���ѯ������������ʱ���ܻ��쳣������
* [pfw.datawindow.services]
- n_cst_dwsvc_columnsort�޸�������������м��'_t'������ʧЧ������
* [pfw.utility.invoker]
- �޸������ڴ�й¶������
* [pfw.datawindow.services]
- �޸�n_cst_dwsvc_columnexp��������������Сbug�����ӷָ���������
* [pfw.datawindow.services]
- �޸�u_dw GRID�����굥���л���ʧ��û�м�������Clicked�¼�������

## 1.2.4.822(2018-05-28)

### ����

* [pfw.utility.invoker]
- ����n_cst_eventful�����¼��ַ�������pfw.pbl::w_test_eventful��
* [pfw.utility.regexp]
- RegExpFindȫ�ֺ������ӷ���index���ذ汾
* [pfw.thread]
- �ع��߳��¼��ַ����ƣ�����n_cst_eventful��
- n_cst_threading/n_cst_threading_task����of_On/of_Off���������¼�����pfw.pbl::w_test_thread��
* [pfw.utility.invoker]
- n_scriptinvoker����SetArgs������ͨ�����鴫�ݲ����б�
* [pfw.net.http.ext]
- n_cst_alipay����#SignType����֧��ָ��ǩ���㷨�����ͣ������µ�֧����Ӧ�ÿ�ʼ����RSA2��
* [pfw.crypto]
- ����HexEncode/HexDecodeȫ�ֺ�������blob����16���Ʊ���룩
* [pfw.ui.objects]
- n_cst_splitcontainer/n_cst_splitcontainer_panel����of_GetWidth/of_GetHeight����
* [pfw.ui.objects]
- n_cst_splitcontainer_panel����#Fixed���Ժ�of_SetFixed����������panel���϶������ʱ�̶���С����pfw.pbl::w_test_splitcontainer_complex��
* [pfw.ui.sciter.ext]
- n_cst_sciter_treeview_option����of_IsPopulated����
* [pfw.ui.controls]
- s_cst_singlelineedit/s_cst_dropdownlist��д[Default Text]���ܣ�Ĭ����ʾ�ı���
* [pfw.datawindow.services]
- n_cst_dwsvc_dropdownsearch֧�ֶ����ּ���������DDSPYFirstLetterLikeȫ�ֺ���
* [pfw.ui.controls]
- u_cst_tabpage/s_cst_tabpagew����OnReposition�¼�

### ����

* [pfw.thread]
- n_cst_threading/n_cst_threading_task�Ƴ�#NotifyObject���Ժ�of_SetNotifyObject������ԭOnThreadNotify֪ͨ�¼��붩�ģ�"common-notify"
* [pfw.thread]
- n_cst_threading/n_cst_threading_task�Ƴ�OnStarted/onStopped�¼�
* [pfw.thread]
- n_cst_threading_task�Ƴ�OnPreNotify/OnNotified�¼�
* [pfw.thread]
- n_cst_threading_task��#Type���Ը�Ϊstring����
* [pfw.ui.controls]
- u_cst_splitcontainerɾ��OnSplitBarMoving�¼�
* [pfw.ui.controls]
- s_cst_singlelineedit/s_cst_dropdownlistɾ��of_GetText/of_IsDefaultText������������Ҫ��
* [pfw.ui.controls]
- s_cst_editmask/s_cst_multiline�Ƴ�[Default Text]���ܣ����������ַ��
* [pfw.datawindow.services]
- ɾ��DDSGetPYFirstLetterȫ�ֺ���

### �޸�

* [pfw.net.http]
- ����ʧ��ʱ���ܳ��ֻ��������������
* [pfw.net.http]
- �޸���SSL 2.0��֧�֣�������ʹ�ã���
* [pfw.thread.ext]
- �޸�n_cst_thread_task_sqlupdate�������е��ж�
* [pfw.utility.compiler]
- �޸�����������Evaluateִ�в�ͬ�Ľű�ʱû�и��»��������

## 1.2.3.659(2018-04-09)

### ����

* [pfw.ui.sciter]
- n_sciter::ClosePopup���������޲������ذ汾
* [pfw.ui.sciter]
- n_sciter���ص�ҳ��[view]��������closePopup([exitCode])�����������˳�Popupģʽ
* [pfw]
- ����w_test_sciter_dropdowncalendarʾ��

### �޸�

* [pfw.ui.sciter]
- �޸�n_sciter::GetMinWidth/GetMinHeightʼ�շ���0������

## 1.2.3.654(2018-04-08)

### �޸�

* [pfw.ui]
- �޸�IconFontЭ��ָ��[color]������Ч��BUG
* [pfw.utils.zip]
- �޸�n_unzip::UnzipFile/UnzipFolder����Ϊindexʱ��ѹ����ʧ�ܵ�����
* [pfw.ui.controls]
- �޸����������ڵײ�ʱ����������겻��ȷ�����⣨Win10��

## 1.2.3.650(2018-04-04)

### ����

* [pfw.datawindow.services]
- n_cst_dwsvc_columnexp����of_SetCacheable�������������ʾ�������������
* [pfw.thread.ext]
- n_cst_threading_task_sqlquery����#PageCounting���Ժ�of_SetPageCounting�����������÷�ҳ����Ŀ��أ�Ĭ�Ͽ�����ֻ�п���֮����ܻ�ȡof_GetPageCount/of_GetRecordCount��
* [pfw.net.http]
- n_httputility::UrlEncode/UrlDecode֧�ָ������
* [pfw.net.http]
- GetDataString/GetDataJSON/GetDataXML����encoding��������
* [pfw.thread]
- ����of_GetID������ȡ�����̵߳�ID��ԭof_GetID����Ϊof_GetSID��

### ����

* [pft.net.http]
- ����ת��URL�ַ������û�ת��

### �޸�

* [pfw]
- �޸���Դ����zip[path]��ʽ����������ʱ���ܻ�ʧ�ܵ�����
* [pfw.utility.zip]
- ZipCompress/ZipUncompress�ַ���ѹ����ͬƽ̨��������ʱ���Ŀ��ܳ�����������⣨֮ǰ�汾ѹ�����ַ�����������Ŀ��ܳ������룬��Ҫ����ѹ����
* [pfw]
- �޸���ĳЩ�ؼ���ʹ��������ʱ���ܻ�������ѭ�������⣨��ĳЩOLE�ؼ���
* [pfw.ui.sciter.ext]
- u_cst_sciter_treeviewѡ��optionʱ����������ͼ������
* [pfw.ui.controls]
- �޸�u_cst_tabcontrol�������ڵڶ�����ʾʱҳ���С���㲻��ȷ������
* [pfw.ui.controls]
- �޸����������ڵײ�ʱ����������겻��ȷ������

## 1.2.2.598(2018-03-14)

### ����

* [pfw]
- ֧��PB���·����Դ������EXE���أ�����PBԭ������Դʹ�÷�ʽ��
* [pfw.utility.barcode]
- ����EANX_CHK,UPCA_CHK,UPCE_CHK��������
* [pfw.datawindow.services]
- n_cst_dwsvc_columnsort��������ʱ��ʾ˳���
* [pfw.crypto]
- n_crypto����֧��blob���͵�key��iv����
* [pfw.utility]
- n_filescanner�����ļ���Ŀ¼����pfw.pbl::w_test_filescanner��
* [pfw.utility.devinfo]
- n_devinfo���ӻ�ȡ����IP��ַ�Ĺ��ܣ���pfw.pbl::w_test_devinfo��
* [pfw.net.http]
- n_httpclient::UploadFile����params���������MultiPart��ʽ����ʽΪjson:{"name":"name","filename":"filename"}��

### ����

- ������PBL

### ����

* [pfw.datawindow.services]
- n_cst_dwsvc_columnexp�Ľ��Զ������к�չ���������㷨

### �޸�

* [pfw.utility.barcode]
- �޸��������͵�������ת��ʾ����ȷ������
* [pfw.ui.controls]
- �޸�s_cst_datawindow Border=falseʱ����ʾ������������
* [pfw]
- �޸�sciter.dll�������⣨ûʹ��Sciter�ؼ�ʱ����Ҫ������dll��pbl��
* [pfw]
- �޸���EXE������Դʱ���ܻ�ʧ�ܵ����⣨pbrЭ�飩
* [pfw.utility]
- �޸�Sprintf����������Ž�����BUG
* [pfw.demos]
- �޸�n_cst_sciter_traynotification���з���ʾ������

## 1.2.1.455(2018-01-22)

### ����

* [pfwUI]
- ���Ӷ�֧��svg��icon-font��֧�֣���pfw.pbl::w_test_svg/w_test_iconfont��
> *** ��������ʾ ***
* [����,pfwBarcode]
- ����n_barcode����֧�ָ���һά�루��pfw.pbl::w_test_barcode��
* [����,pfwBarcode]
- ����n_qrcode����ר��ΪQR��ά���Ż�����pfw.pbl::w_test_qrcode��
* [���,pfwUIControls]
- n_cst_tabcontrol_theme����TBS_OFFICE2013���
* [����,pfwDemos]
- ����n_cst_sciter_traynotification������ʾʾ������pfwDemos.pbl::w_main��

### �޸�

* [pfwThread]
- �޸���1.2.0.1211�汾�������߳��������ʱ��ͬ���źŵ�BUG
* [pfwUtils]
- �޸�n_logger::ConnectToConsole���ܻ�ʧ�ܵ�����
* [pfwUtils]
- �޸�n_logger���ܻ�����쳣������
* [pfwUIControls]
- �޸�AnimatedImageֻ��һ֡ʱ���²��ּ�����������
* [pfwUIControls]
- �޸����ֿؼ�OnPreConstructor�¼�ִ�����ε�����

## 1.2.0.1214(2017-12-14)

### ����

* [�¼�,pfwUIControls]
- u_cst_tabpage/u_cst_tabpagew����OnGetFloatMinSize�¼����������ø������ڵ���С��С

### �޸�

* [pfwUIControls]
- �޸�u_cst_tabcontrol��ǩ��������ͣ����ȥ֮�󣬵���������С���ٻ�ԭʱ��ǩ����Ҳ��ʾ����������
* [pfwThread]
- �޸���1.2.0.1211�汾�������߳��ͷŵ�BUG

## 1.2.0.1211(2017-12-11)

### �Ż�

* [pfwDWServices]
- n_cst_dwsvc_columnsort���Ӷ�compute�е�֧�֣�ͬʱ�Ż��˼�ͷ����

### �޸�

* [pfw]
- �޸�XP���������⣨��GetThreadID�޷���λ��������
* [pfwHttp]
- �޸�httpclient����xml����ʱʹ����json��content-type���µĴ���
* [pfwDWServices]
- �޸�n_cst_dwsvc_columnsort������ȷ��BUG

## 1.2.0.1204(2017-12-04)

### ����

* [����,pfwSciter]
- PB��Sciter��ֵ����any���޷���tiscript����������Ҫ��ʹ��n_scitervalue��װPBֵ����PFW�Զ�ƥ����Ӧ��tisֵ��ͬʱ����n_scitervalue��ֵ��
> *** ��������ʾ ***
* [����,pfwHttp]
- n_httpclient�������ݴ���ص��¼�OnTransData������1ȡ�����䣩����Request/DownloadFile/UploadFile������[transcallback]����
* [�ؼ�,pfwUIControls]
- ���ӱ�׼�ؼ�s_cst_statictext
* [����,pfwSciter]
- ����n_scitervm�������ڼ���ִ��tis�ű�
* [����,pfwSciterExt]
- n_cst_sciter_treeview_option����of_FindChildByTag/of_GetChildren����
* [����,pfwParser]
- n_json����IsObject/IsArray/MakeObject/MakeArray/RemoveAll����
* [����,pfwSciter]
- n_scitervalue����IsObject/IsArray/MakeObject/MakeArray/RemoveAll����
* [����,pfwHttp]
- n_httpclient����DownloadFile/UploadFile����
* [����,pfwRegExp]
- n_regexp����Verify��������У��������ʾ��ͬʱ����RegExpVerifyȫ�ֺ���

### ����

* [����,pfwUIControls]
u_cst_tabcontrol.of_Dock�����������ٸ������ڣ�ֻ�б�ǩ���Ƴ�ʱ�����٣�����ĳЩ�ض���������ٸ�������������쳣

### �Ż�

* [�ؼ�,pfwUIControlsExt]
- MessageBoxEx�Ż����ڴ�С����

### �޸�

* [pfwZip]
- �޸���ѹ���ܵ�zip�ļ�ʱ����������
* [pfwDWServices]
- �޸�DDSGetPYFirstLetter��Ӣ���ȡֵ����ȷ��BUG
* [pfwUtils]
- ������PBVM��BUG���µ���n_logger��κ���ʱ���ܻ��쳣������
* [pfwInvoker]
- ������PBVM��BUG���µ���n_objectinvoker��κ���ʱ���ܻ��쳣������
* [pfwUIControls]
- s_cst_window popup/child���Ĵ�����С����ϵͳ�˵���ʾ����
* [pfw]
- �޸�GetSysColor����Ϊ��ʱ�����Ĵ���
* [pfwThreadExt]
- �޸�n_cst_threading_task_sqlquery���ܻᶪʧfilter���������ݵ�����
* [pfwUIControls]
- u_cst_splitcontainerΪ���Ӷ�λģʽ(#AttachMode=true)ʱ��λ��ˢ������

## 1.1.1.0911(2017-09-11)

### ����

* [����,pfwSciter]
- n_sciterelement����DetachObject���������ڽ��Ԫ����PB�ؼ��İ�
* [����,pfwSciter]
- TIS������U2PX/U2PY/P2DX/P2DY/D2UX/D2UY/U2DX/U2DYȫ�ֺ���

### �Ż�

* [pfwThread]
- �Ż��߳��ͷ�

### �޸�

* [pfwHttp]
- �޸�httpclient::SetValidateHost(false)ʧЧ
* [pfwDWServices]
- �޸�n_cst_dwsvc_contextmenu�����е�����ʱ������һ��Ϊ��ʱ����һ��
* [pfwDWServices]
- �޸�n_cst_dwsvc_contextmenu���Ƶ�Ԫ���Ҽ��˵������߼�����֧�ָ��Ƽ����е�����
* [pfwSciterExt]
- u_cst_sciter_treeview��DPIΪ125%����Ļ����ʾcheckbox������

## 1.1.0.0904(2017-09-04)

### ����

* [����,pfwUI]
- ֧�ָ߷���(High DPI),������汾��ʼ,pfw������UI��λ����px��Ϊdip
> *** ��������ʾ ***
> DIP:�豸�޹�����,��DPIΪ96����Ļ��1dip����1px,DPIΪ192����Ļ��1dip����2px
* [����,pfwUI]
- ������ԴЭ��data:[resType,]base64,��base64�ַ���������Դ,�������е���ԴЭ�鶼֧��zip[path]
* [����,pfwSciter]
- TIS����ֱ�Ӵ���Element����PB��n_sciterelement����
* [����,pfwUI]
- ���Ӷ�I18N(���ʻ�������)���ܵ�֧��
* [����,pfwDWServices]
- ����һЩDW����:�Ҽ��˵�����/��ѡ����/�������/������������/�б��ʾ����(��pfw.pbl::w_cst_dwsvc_xxx)
* [����,pfwUI]
- ������߷�����������ϵ�һЩ����:U2PX/U2PY/P2DX/P2DY/D2UX/D2UY/U2DX/U2DY/EnableDPIAware
* [����,pfwUIControls]
- s_cst_window����wf_ChangeMenu����
* [����,pfwUIObjects]
- n_cst_window_theme����#TitleBar���Ժ�of_SetTitleBar����,���ڿ��ƴ��ڱ�������ʾ/����
* [����,pfwThreadExt]
- n_cst_threading_task_sqlquery����of_AddParam����������Ӱ����ƵĲ���
* [����,pfwThreadExt]
- n_cst_threading_task_sqlquery����of_SetMaxRows�������������������(���ﵽ������ʱ�ᷢ��NCD_MAXROWS֪ͨ,����1���������ѯ,����ᱨOUT_OF_RANGE����)
* [����,pfwHttpExt]
- n_cst_alipay����of_Precreate/of_PrecreateAsync�ӿڣ�ͳһ�յ����½���Ԥ����
- n_cst_wxpay����of_UnifiedOrder/of_UnifiedOrderAsync�ӿڣ�ͳһ�µ�
- n_cst_wxpay����of_CloseOrder/of_CloseOrderAsync�ӿڣ��رն���

### ����

* [pfwHttpExt]
- ��pfwDemos.pbl�ڵ�n_cst_alipay/n_cst_wxpay����֧������������PBL��

### �޸�

* [pfwParser]
- �޸�n_xmldoc::RemoveChildrenֻ���Ƴ���һ���ӽڵ��BUG
* [pfwUIControlExt]
- �޸�һЩ��MessageBoxEx/MessageBoxTimout�йص�BUG
* [����,pfwThreadExt]
- n_cst_threading_task_sqlquery�޸�DW��ͬһ�������ദʹ�ñ��󶨲���ʧ�ܵĴ���
* [pfwHttpExt]
- n_cst_wxpay�޸������������
* [pfwControls]
- �޸������ϰ�ť��ݼ�ʧЧ������
* [pfw]
- �޸�����pfw.dll�ڴ���ʴ���
> *** ��������ʾ ***

## 1.0.2.0517(2017-05-17)

### ����

* [ʾ��]
- ����GOOGLE��̬��ͼDEMO(��:pfw.pbl::w_test_static_map)
* [����]
- �����ֻ��ˮƽ��������û�д�ֱ�������Ŀؼ��ϴ�ֱ����ʱ��ת��Ϊˮƽ������Ϣ(��֧��DataWindow��HSplit����) [ʵ��]

### �޸�

* [pfw]
- XP/2003����������

## 1.0.1.0509(2017-05-09)

pfw�����ĵ�һ���汾,�����������PowerUI�ĸı�

### ����

* [����,pfwSciter]
- ֧����TIS�ű���ֱ��ʹ��PB����ͺ�����,�޷콻��
* [����,pfwHttp]
- httpclient֧�ַ����ѹ������Ӧ����Content-Encoding:gzip/deflate
ʾ��:httpClient.SetHeader("Accept-Encoding","gzip")
* [����,pfwWebSocket]
- n_wsclient/n_wsmessage,WebSocket�ͻ��������,֧��WS/WSSЭ��,�ӿڿɲο�HttpClient
* [����,pfwRegExp]
- n_regexp,������ʾ��,֧��ƥ�䡢���Һ��滻
* [����,pfwZip]
- n_zip/n_unzip,Zipѹ���㷨��,����zip�ļ���
* [����,pfwDevInfo]
- �豸ָ�ƻ�ȡ��n_devinfo,֧�ֻ�ȡCPUID,Ӳ�����к�,MAC��ַ��
* [����,pfwInvoker]
- PB����̬���ÿ�n_objectinvokder/n_scriptinvoker,֧�ֶ�̬���ö��������¼�,��ȡ����ʵ������̬����(�������)��
* [����,pfwCompiler]
- PB��̬����PowerScript��,��������ʱ����ȫ�ֺ��������ȵ�
* [����,pfwThread]
- n_cst_thread/n_cst_thread_task/n_cst_threading/n_cst_threading_task/n_cst_threading_pool,PB���߳̿�(�����̳߳ض���)
* [����,pfwThreadExt]
- n_cst_threading_task_sqlcommand/n_cst_threading_task_sqlquery/n_cst_threading_sqlupdate,����pfw�߳̿�ʵ�ֵ����ݿ�ͨ�ò�ѯ�͸�������,֧�ַ�ҳ��ѯ,��̬�󶨲���,��̬SQL,�����µ�.
* [����,pfwSciter]
- w_cst_sciter,PB�������͵�Sciter
* [����,pfwUtils]
- n_logger��־��¼����,֧���ļ��Ϳ���̨���,���������ʽ���ַ���,����C#��Console.Write,֧�ֲ��������Ͷ���({index[,alignment][:format]})
* [����,pfwInvoker]
- HasGlobalFunction/InvokeGlobalFunction/HasGlobalVar/GetGlobalVar/SetGlobalVar����,���ڶ�̬����ȫ�ֺ���,��ȡȫ�ֱ�����
* [����,pfwCompiler]
- Evaluate��̬������ִ��PowerScript,֧�ֶ�������б�ʹ������������������
* [����,pfwRegExp]
- RegExpMatch/RegExpFind/RegExpReplace����(��װ����n_regexp)
* [����,pfwZip]
- ZipCompress/ZipUncompress����,�ַ���ѹ��,blobѹ��
* [����,pfwUtils]
- ����ת��ȫ�ֺ���,DecToHex/HexToDecʮ������ʮ�����ƻ�ת,DecToString/StringToDecʮ����������2~36���ƻ�ת
* [����,pfwUtils]
- LoadUri,��pfw��ԴЭ���������
* [����,pfwUIControls]
- u_cst_tabpage/s_cst_tabpagew���Ӻ���of_GetTabIndex/of_GetTabText/of_GetTabTag/of_GetTabData/of_IsTabSelected/of_IsTabFloated/of_SelectTab/of_ShowTabFloatWindow/of_CloseTab
* [����,pfwUIControls]
- s_cst_singlelineedit/s_cst_multilineedit/s_cst_editmask����of_GetText����
* [����,pfwContainer]
- n_map����Get(index)/GetKey(index)����
* [����,pfwParser]
- n_json����Find����(Find("key/key2/key3[/..]"))
* [����,pfwSciter]
- n_sciterelement����GetData/SetData�������ڰ�����PB����
* [����,pfwSciter]
- n_sciterelement����GetExpando�������ڻ�ȡElement��TIS��չ����
* [����,pfwSciter]
- n_scitervalue����GetValueObject/SetValue(powerboject)/GetItemObject/SetItem(powerobject)����,���Խ�PB������TIS
* [����,pfwSciter]
- u_sciter/n_sciter/w_cst_sciter����SetDebugOutput������OnDebugOutput�¼�,�������������Ϣ
* [����,pfwSciter]
- n_sciter����Popup/ClosePopup����,����ģ�ⵯ���˵��ķ�ʽ��ʾSciter����
* [����,pfwUIObjects]
- n_cst_sciter_treeview_option����of_GetData/of_SetData�������ڰ�����PB����
* [����,pfwCrypto]
- n_crypto::SymEncrypt/SymDecrypt�ṩ������ʼ��IV
* [����,pfwUtils]
- BitTest����(����BitAND(num,bits)=bits),BitClear����(����BitAND(num,BitNOT(bits)))
* [����,pfwUtils]
- Sprintf����,���������ʽ���ַ���,����C#��Console.Write,֧�ֲ��������Ͷ���({index[,alignment][:format]})
* [����,pfwUtils]
- DateTimeToTimestamp/TimestampToDateTime����PB���ں�ʱ���֮��ת��(����Ϊ��),֧��UTC�ͱ���ʱ��(Ĭ��ΪUTC)
* [����,pfwCrypto]
- Base64Encode/Base64Decode/GUID/MD5/RandomString/SHA1/SHA256����(��װ����n_crypto)
* [����,pfwHttp]
- SetCA/GetCA���÷����֤���ǩ��֤��,������֤�����֤��
* [����,pfwHttp]
- SetValidateHost/IsValidateHost���÷����֤��������֤����(ValidateServer����ʱ��Ч)
* [����,pfwHttp]
- n_httpclient����SetAcceptException/IsAcceptException�������ڿ�������HTTP�쳣״̬��Ϣ�Ĺ���(Ĭ��ֻ����HTTP OK����Ϣ)
* [����,pfwHttp]
- CancelAllȡ�����е��첽����
* [����,pfwHttp]
- URLEncode/URLDecode/StringToUTF8/StringToUTF16/StringToGBK/StringToBig5/StringToANSI/UTF8ToString/UTF16ToString/GBKToString/Big5ToString/ANSIToString����(��װ����n_httputility)
* [����,pfwHttp]
- n_httpclient/n_httpresponse����ֱ�ӷ���XML����Ľӿ�,Ĭ��Content-TypeΪtext/xml;utf-8
* [����,pfwParser]
- ParseJSON/ParseXML
* [����,pfwUIObjects]
- n_cst_splitcontainer_panel����of_AttachObject����,u_cst_splitcontainer����of_TemplateAttach����,���ڰ�ʹ����Զ�λ�Ķ���,��of_BindObject���������ڸú����󶨵Ķ��󲻻�ı������ĸ��ӹ�ϵ
* [����,pfwUIObjects]
- u_cst_shortcutbar_theme����CLR_SPLITBARBORDER
* �벻������..

### ����

* [pfwHttp]
- n_httpclient��֤�����Կ���ú��������޸�,ɾ����SetCertType/GetCertType����
* [pfwCrypto]
- n_crypto�ԳƼ�����HMAC�������㷨(������֮ǰ�İ汾),Ϊ������(��)�ԳƼ���ͨѶ�ṩ����(ע:SymEncrypt/SymDecrypt��֧��PKCS5 PADDING)
> *** ��������ʾ ***
* [pfwUIControlsExt]
- pfwUIControlsExt.pbl����Ŀؼ����ٸ��ݲ���ϵͳ�汾����΢���ź�����,Ĭ�϶�ΪArial
* [pfwUI]
- �����������ɫȡֵ�Ļ���,�漰����OnGetColor/OnGetItemColor�¼�
> *** ��������ʾ ***

### �Ż�

* [pfwUIControls]
- �Ż�MDI���ڲ˵���ݼ�

### �޸�

* [pfwUIControls]
- PB9ʹ��SplitContainerʱ�����R0025�쳣
* [pfwUIControls]
- s_cst_singlelineedit/s_cst_multilineedit/s_cst_editmask/s_cst_dropdownlist�ؼ���ص�BUG