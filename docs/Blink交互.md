# ˵��

pfwΪBlink������PB�ӿڶ���,ʹJS�ű������޷���PB����,��ʹ��֮ǰ����ϸ�Ķ���������˵��

## ������ȫ�ֶ���(����`window`)

- `pb`: PB��ڶ���
- `pb.global`: PBȫ�ֱ�����ȫ�ֺ������ʶ���
- `pb.host`: PB�˵�Blink��������

> pfwΪÿ��Blink����(�ؼ�)������һ��`pb.host`��������,�ö���Ϊ��ǰBlink����PB���������,��:`u_blink`,`n_blink`,`w_blink`

## �ӿڽ���

- ���Է���(������PB����ͬ)

```
obj.prop	//��ȡ
obj.prop = val	//����
```

- ��������(������PB����ͬ��������ʹ��$ǰ׺���׺)

```
obj.$func(arg...)	//����func����
obj.func$(sign,arg...)	//����ָ��signǩ����func����(������غ�������)
```

- �¼�����(������PB����ͬ��������ʹ��$ǰ׺���׺)

```
obj.$$evt(arg...)	//����evt����
obj.evt$$(sign,arg...)	//����ָ��signǩ����evt�¼�(�ϸ�ƥ��)
```

- ȫ�ֱ�������(������PB����ͬ)

```
pb.global.var		//��ȡ
pb.global.var = val	//����
```

- ȫ�ֺ�������(������PB����ͬ��������ʹ��$ǰ׺���׺)

```
pb.global.$func(args...)	//����func����
pb.global.func$(sign,arg...)	//����ָ��signǩ����func����(������غ�������)
```

## pbȫ�ֶ���

```
pb.version		//��ȡpfw�汾
pb.pbVersion		//��ȡPB�汾
pb.Create(className)	//��������
pb.Open(className)	//��������
```

### ��Ա(�������ִ�Сд)

```
//-����
property version	//pfw�汾
property pbVersion	//PB�汾

//-����(!!����Ҫ��$ǰ׺���׺!!)

//��ȡָ��ö�����Ͷ�Ӧ������
function EnumName(cls,val)
//��ȡָ��ö�����Ͷ�Ӧ��ֵ
function EnumValue(cls,name)
//����ָ�������Ķ���(����ֵΪ�����Ķ���)
function Create(cls)
//����ָ������
function Destroy(object)
//�ж��Ƿ�Ϊ��Ч��PB����
function IsValid(object)
//��ָ�������Ĵ���(����ֵΪ�򿪵Ĵ��ڶ���)
function Open(cls[,parent])
//��ָ�������Ĵ��ڲ����ݲ���(����ֵΪ�򿪵Ĵ��ڶ���)
function OpenWithParm(cls,parm[,parent])
//��ָ��������MDI�Ӵ���(����ֵΪ�򿪵Ĵ��ڶ���)
function OpenSheet(cls,parent[,position[,arrange]])
//��ָ��������MDI�Ӵ��ڲ����ݲ���(����ֵΪ�򿪵Ĵ��ڶ���)
function OpenSheetWithParm(cls,parent,parm[,position[,arrange]])
//�ر�ָ�����ڶ���
function Close(wnd)
//�ر�ָ�����ڲ�����һ��ֵ�����ô�(ͨ���ǹر���Ӧ����)
function CloseWithReturn(wnd,parm)
//��Ϣ��
function MsgBox(title,text,[icon[,button[,default]]])
//PBUת��ΪPixel
function U2PX(pbu)
function U2PY(pbu)
//Pixelת��ΪPBU
function P2UX(px)
function P2UY(px)
//DIPת��ΪPixel
function D2PX(dip)
function D2PY(dip)
//Pixelת��ΪDIP
function P2DX(px)
function P2DY(px)
//DIPת��ΪPBU
function D2UX(dip)
function D2UY(dip)
//PBUת��ΪDIP
function U2DX(pbu)
function U2DY(pbu)

```

## ��֧�ֵ����� :warning:

1. ���ܷ���ö�����͵�ȫ�ֱ����͹������(Shared Variables)
2. ��֧�ֶ�ά����(JS��ֻ��һά����)
3. ��֧��ֱ�ӵ��ô����ò����ĺ������¼�
4. ��֧��DWObject(�ⲻ�Ǳ�׼����)
5. OLEObject(ͬDWObject)
6. ����������

## ע������

1. JS�Ǵ�Сд���е�
2. `Create`���������Ķ�������`Destroy`����
