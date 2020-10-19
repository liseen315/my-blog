---
title: "Laravel学习-Facade"
date: 2019-09-25T16:11:23+08:00
author: "liseen"
tags: ["laravel","php"]
categories: ['Code']
---

在web服务框架学习首要面对的一个问题是路由,Laravel的路由是怎么实现的呢?先总结一下,Laravel暴露给我们的路由其实是一个别名后的Facade,那我们就先看看什么是Facade吧

<!--more-->

在``public/index.php``中是Laravel的启动目录所以我们先看一下index.php文件内容

```php
<?php

// 引入引导
require __DIR__.'/../vendor/autoload.php';

// 应用程序核心
$app = require_once __DIR__.'/../bootstrap/app.php';

```

我们的web路由在routes/web.php内定义的

```php
<?php
// get请求路由
Route::get(
    '/',
    function () {
        return 'Index';
    }
);
```

我们如果安装了ide_help后会发现这个Route实际是一个``Facade``.路径为``\Illuminate\Support\Facades\Route``然后我们看一下它的源码

```php
class Route extends Facade
{
    protected static function getFacadeAccessor()
    {
        return 'router';
    }
}
```

可以看到这是一个继承自``Facade``的子类,其中也只有一个``getFacadeAccessor``方法返回了一个字符串``router``那么``Route::get()``是怎么来的呢？我们继续看下Facade发现也没有所谓的``get()``方法,但是我们却在类的最下面发现了一个php的魔术方法``__callStatic``

```php

public static function __callStatic($method, $args)
{
    $instance = static::getFacadeRoot();

    if (! $instance) {
        throw new RuntimeException('A facade root has not been set.');
    }

    return $instance->$method(...$args);
}
```

查阅资料后发现这个魔术方法是指当调用类的不存在静态方法时会触发这个方法的调用,好那我个人理解就是``get()``这个方法实际上在这里被调用了.然后我们继续看下``getFacadeRoot``方法

```php
public static function getFacadeRoot()
{
    return static::resolveFacadeInstance(static::getFacadeAccessor());
}
```

这个方法又调用了``resolveFacadeInstance``这个方法内接收了``getFacadeAccessor``函数的返回.回忆一下``getFacadeAccessor``是不是在刚才``Route``子类内覆盖过并返回一个字符串``route``,好那么继续看``resolveFacadeInstance``实现

```php
protected static function resolveFacadeInstance($name)
{
    if (is_object($name)) {
        return $name;
    }
    // 这里做了一层缓存方便快速调用
    if (isset(static::$resolvedInstance[$name])) {
        return static::$resolvedInstance[$name];
    }
    // 直接拿字符串去$app上实例化了
    if (static::$app) {
        return static::$resolvedInstance[$name] = static::$app[$name];
    }
}
```

看到这里可能会有些懵逼.为啥``$app[$name]``就返回了实例了.``$app``又是啥.实际上``$app``来自于``Facade``类的静态方法``setFacadeApplication``

```php
public static function setFacadeApplication($app)
{
    static::$app = $app;
}
```

<a id="registerFacades">那么这个方法什么时候被调用的？我们查找引用发现是在``Illuminate/Foundation/Bootstrap/RegisterFacades.php``内被调用的</A>

```php
class RegisterFacades
{
    public function bootstrap(Application $app)
    {
        Facade::clearResolvedInstances();
        // 看这里...
        Facade::setFacadeApplication($app);
        AliasLoader::getInstance(array_merge(
            $app->make('config')->get('app.aliases', []),
            $app->make(PackageManifest::class)->aliases()
        ))->register();
    }
}
```

好像越来越复杂了.这个bootstrap又是啥时候被调用的.好吧坚持住.我本人也尝试用查找引用去查发现没找到.然后我又回过头去看初始化的代码发现在``bootstrap/app.php``代码内除了实例化``Application``实际还创建了几个注册,其中重要的是``App\Http\Kernel``

```php
$app = new Illuminate\Foundation\Application(
    $_ENV['APP_BASE_PATH'] ?? dirname(__DIR__)
);

// 注册Kernel到Container
$app->singleton(
    Illuminate\Contracts\Http\Kernel::class,
    App\Http\Kernel::class
);
```

然后我们看下``Kernel``的实现,发现里面定义了一堆中间件数组,我们先不管这些,继续看它的父类``HttpKernel``,wow..代码真是多..其实当前有用的就是``handle``方法,我们先看下实现然后在去看是在哪调用的``handle``

```php
public function handle($request)
{
    try {
        $request->enableHttpMethodParameterOverride();
        // 主要看这个方法接收了$request参数
        $response = $this->sendRequestThroughRouter($request);
    } catch (Exception $e) {
        $this->reportException($e);

        $response = $this->renderException($request, $e);
    } catch (Throwable $e) {
        $this->reportException($e = new FatalThrowableError($e));

        $response = $this->renderException($request, $e);
    }

    $this->app['events']->dispatch(
        new Events\RequestHandled($request, $response)
    );

    return $response;
}

protected function sendRequestThroughRouter($request)
{
    $this->app->instance('request', $request);

    Facade::clearResolvedInstance('request');
    // 看这个引导方法
    $this->bootstrap();

    return (new Pipeline($this->app))
                ->send($request)
                ->through($this->app->shouldSkipMiddleware() ? [] : $this->middleware)
                ->then($this->dispatchToRouter());
}

public function bootstrap()
{
    // 就是这里..先调用了bootstrappers
    if (! $this->app->hasBeenBootstrapped()) {
        $this->app->bootstrapWith($this->bootstrappers());
    }
}
// 这个方法都返回了些啥？
protected function bootstrappers()
{
    return $this->bootstrappers;
}
// 发现什么了么?RegisterFacades对。就是它
protected $bootstrappers = [
    \Illuminate\Foundation\Bootstrap\LoadEnvironmentVariables::class,
    \Illuminate\Foundation\Bootstrap\LoadConfiguration::class,
    \Illuminate\Foundation\Bootstrap\HandleExceptions::class,
    \Illuminate\Foundation\Bootstrap\RegisterFacades::class,
    \Illuminate\Foundation\Bootstrap\RegisterProviders::class,
    \Illuminate\Foundation\Bootstrap\BootProviders::class,
];
```

看了三个方法终于找到了``RegisterFacades``在哪出现了.然后实际上这个引导数组又作为参数传到了``Illuminate/Foundation/Application.php``内的``bootstrapWith``方法内,还是看源码吧.

```php
public function bootstrapWith(array $bootstrappers)
{
    $this->hasBeenBootstrapped = true;

    foreach ($bootstrappers as $bootstrapper) {
        $this['events']->dispatch('bootstrapping: '.$bootstrapper, [$this]);
        // 循环刚才的bootstrap类数组调用了make方法然后调用了bootstrap()
        $this->make($bootstrapper)->bootstrap($this);

        $this['events']->dispatch('bootstrapped: '.$bootstrapper, [$this]);
    }
}
```

实际上``make``方法内处理也相对复杂,不过针对当前来说就是调用了php的反射``ReflectionClass``来实例化了类,紧接这调用了``RegisterFacades``内的``bootstrap``方法.我们可以回头去看下<a href="#registerFacades"><u>这个类的实现</u></a>.好吧,我们终于知道了``$app``是怎么到``Facade``内的了。刚才说的``handler``方法实际是在``public/index.php``内就被调用了,可以看下代码

```php
$kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);
// 看这里...
$response = $kernel->handle(
    $request = Illuminate\Http\Request::capture()
);
```

但是这一切貌似都断层了,说了一大堆``Route::get()``呢?emmm..看下一篇笔记吧.
