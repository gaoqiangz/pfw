# 初始化

pfw从2.0开始必须初始化后才能使用（为了提高开发时的稳定性，同时可以更好的实现模块化加载，与其它框架更好的协同工作）

初始化方式有以下两种：

-1.全局初始化函数
```
pfwInitialize([flags]) //初始化环境，flags可选（见Enums.INIT_FLAG_XXX，支持组合）
pfwFinalize //反初始化环境
pfwInitialize一般情况下分别放在Application Open事件最开头
pfwFinalize放在Application Close事件的最后
```

-2.继承初始化对象实现自动初始化
```
继承pfwCommon.pbl::n_initializer对象，开启[AutoInstantiate]属性，将对象实例放在全局变量里，这样就可以实现自动初始化环境
n_initializer有一些属性开关，与Enums.INIT_FLAG_XXX枚举值是等价的，根据需要开启对应的功能模块
使用自动实例化的好处是可以在开发模式下直接右键运行对象来调试，但这种方式可能会有不稳定的情况出现，因为PB对全局自动实例化对象的生命期管理不受我们的用户代码控制，它的释放时机可能会引起访问冲突（这种情况可能会出现）
```

## 文档

- [Blink交互](docs/Blink交互.md)
- [Sciter交互](docs/Sciter交互.md)
- [PB多线程绕坑提示](docs/PB多线程绕坑提示.md)
