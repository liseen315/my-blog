---
title: "Laravel学习-服务容器(1)"
date: 2019-09-26T09:54:50+08:00
author: "liseen"
tags: ["laravel","php"]
categories: ['Code']
---

之前的文章说到了``Route::get()``其实是一个别名后的``Facade``然后最终通过魔术方法调用了``get()``之类的方法.但是在追踪到如下代码的时候就断层了.我们只看到了实例化了路由对象但是没看到具体的路由实现在哪.那么我们下面就来尝试揭秘

<!--more-->

```php
if (static::$app) {
    return static::$resolvedInstance[$name] = static::$app[$name];
}
```

Laravel的Application实际上是一个IOC容器,关于IOC容器的解释可以<a href="https://www.insp.top/learn-laravel-container">看这篇文章</a>引用这篇文章内的一段话

> 一个类要被容器所能够提取,必须要先注册至这个容器.既然 laravel 称这个容器叫做服务容器,那么我们需要某个服务,就得先注册、绑定这个服务到容器,那么提供服务并绑定服务至容器的东西,就是 服务提供者（ServiceProvider）。

那可以理解我们的``$app[$name]``实际是一个服务的提取过程,所以我们还是回归到容器内吧
``Illuminate/Foundation/Application.php``查看构造函数

```php
public function __construct($basePath = null)
{
    if ($basePath) {
        $this->setBasePath($basePath);
    }

    $this->registerBaseBindings();
    // 在这里注册了基础的服务提供者
    $this->registerBaseServiceProviders();
    $this->registerCoreContainerAliases();
}

protected function registerBaseServiceProviders()
{
    $this->register(new EventServiceProvider($this));
    $this->register(new LogServiceProvider($this));
    // 注册路由服务提供者
    $this->register(new RoutingServiceProvider($this));
}
```

然后我们去看下一下``RoutingServiceProvider``的源码,发现了``register``函数

```php
public function register()
{
    // 这里注册了路由的实际Provider
    $this->registerRouter();
    $this->registerUrlGenerator();
    $this->registerRedirector();
    $this->registerPsrRequest();
    $this->registerPsrResponse();
    $this->registerResponseFactory();
    $this->registerControllerDispatcher();
}
```

那这个``register``函数又是何时被调用的?实际如果我们查看刚才的``$this->register(new RoutingServiceProvider($this));``的``register``方法就可以看到实际是在容器内注册的

```php
public function register($provider, $force = false)
{
    if (($registered = $this->getProvider($provider)) && ! $force) {
        return $registered;
    }
    if (is_string($provider)) {
        $provider = $this->resolveProvider($provider);
    }
    // 这里注册
    $provider->register();

    if (property_exists($provider, 'bindings')) {
        foreach ($provider->bindings as $key => $value) {
            $this->bind($key, $value);
        }
    }

    if (property_exists($provider, 'singletons')) {
        foreach ($provider->singletons as $key => $value) {
            $this->singleton($key, $value);
        }
    }

    $this->markAsRegistered($provider);

    if ($this->isBooted()) {
        $this->bootProvider($provider);
    }

    return $provider;
}
```

现在我们回头去看具体被注册的``provider``吧.

```php
protected function registerRouter()
{
    $this->app->singleton('router', function ($app) {
        // 终于找到了实际的Route了
        return new Router($app['events'], $app);
    });
}
```

然后我们去看``Illuminate/Routing/Router.php``就会发现``get``方法就定义在这里了.

```php
public function get($uri, $action = null)
{
    return $this->addRoute(['GET', 'HEAD'], $uri, $action);
}
```

好,至此我们找到了真正的路由实现在哪里,可是``static::$app[$name];``又是怎么根据前一篇文章提到的``router``将Facade与具体的服务关联起来的?下片文章我们在继续探索.