---
title: "Laravel学习-服务容器(2)"
date: 2019-09-26T14:37:03+08:00
author: "liseen"
tags: ["laravel","php"]
categories: ['Code']
---

探秘的过程是非常有意思的,通过阅读代码我们可以更多的了解作者的思路为自己以及工作中总结经验,废话有点多.我们在之前的文章知道了看到了如下代码

<!--more-->

```php
if (static::$app) {
    return static::$resolvedInstance[$name] = static::$app[$name];
}
```

``static::$app[$name];``其实是用数组的方式访问对象,我们可以看到``Application``继承了``Container``而容器又实现了``ArrayAccess``接口,翻阅<a href="https://www.php.net/manual/zh/class.arrayaccess.php">php文档</a>后我们发现一个重要方法

```php
public function offsetGet($offset) {
    return isset($this->container[$offset]) ? $this->container[$offset] : null;
}
```

那么对应到容器内的方法实现如下

```php
public function offsetGet($key)
{
    // 这里的$key就是static::$app[$name];中的$name
    return $this->make($key);
}
```

那么我们可以进一步查看``make``方法的实现

```php
public function make($abstract, array $parameters = [])
{
    return $this->resolve($abstract, $parameters);
}

protected function resolve($abstract, $parameters = [], $raiseEvents = true)
{
    $abstract = $this->getAlias($abstract);

    $needsContextualBuild = ! empty($parameters) || ! is_null(
        $this->getContextualConcrete($abstract)
    );

    if (isset($this->instances[$abstract]) && ! $needsContextualBuild) {
        return $this->instances[$abstract];
    }

    $this->with[] = $parameters;
    // 这里通过抽象名字获取之前绑定的实现
    $concrete = $this->getConcrete($abstract);
    // 判断实现是否是闭包或者实现与抽象是否同名
    if ($this->isBuildable($concrete, $abstract)) {
        // 进行构建
        $object = $this->build($concrete);
    } else {
        $object = $this->make($concrete);
    }

    foreach ($this->getExtenders($abstract) as $extender) {
        $object = $extender($object, $this);
    }

    if ($this->isShared($abstract) && ! $needsContextualBuild) {
        $this->instances[$abstract] = $object;
    }

    if ($raiseEvents) {
        $this->fireResolvingCallbacks($abstract, $object);
    }

    $this->resolved[$abstract] = true;

    array_pop($this->with);

    return $object;
}

public function build($concrete)
{
    // 如果是闭包的话就调用闭包
    if ($concrete instanceof Closure) {
        return $concrete($this, $this->getLastParameterOverride());
    }
}
```

这里真相大明了.原来我们之前在``RoutingServiceProvider``内调用的``registerRouter``方法返回了确实是一个闭包,而且闭包内return了真正的的Router服务.

```php
protected function registerRouter()
{
    $this->app->singleton('router', function ($app) {
        // 终于找到了实际的Route了
        return new Router($app['events'], $app);
    });
}
```

好了,至此我们已经正式的找到了一个作为Facade后的Router是如何被创建起来的.但是问题来了,为什么我可以在web.php内直接调用这个Facade呢.之前说过实际上我们调用的是一个别名后的Facade,那么我接下里会讨论关于别名的内容.