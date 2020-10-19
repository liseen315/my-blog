---
title: "python 函数参数"
date: 2019-02-27T11:44:18+08:00
author: "liseen"
tags: ["python"]
categories: ['Code']
---

Python中函数的参数有五种：位置参数(必选参数)、默认参数、可变参数、关键字参数、命名关键字参数。

<!--more-->

#### 位置参数

```
def sayHello(name):
    print('hello',name)

sayHello('liseen')

# output: hello liseen
```
#### 默认参数

```
def sayHello(name='liseen'):
    print('hello',name)
sayHello()
sayHello('fangshu')

#output: 
#hello liseen
#hello fangshu
```
#### 可变参数
可变参数的函数允许传入任意个参数，这些可变参数在函数调用的时候会自动组装成一个tuple。
```
def sayWhat(*something):
    for temp in something:
        print(temp)

sayWhat('hello','world','liseen')
names = ['liseen','fanghsu','bubu']
ages = (20,30,40)
sayWhat(*names)
sayWhat(*ages)

#output:
#hello
#world
#liseen
#liseen
#fanghsu
#bubu
#20
#30
#40
```
#### 关键字参数
可变参数允许你传入0个或任意个参数，这些可变参数在函数调用时自动组装为一个tuple。而关键字参数允许你传入0个或任意个含参数名的参数，这些关键字参数在函数内部自动组装为一个dict

```
def sayWhat(**something):
    for key,value in something.items():
        print(key,value)

sayWhat(name='liseen',wift='fangshu')

#output:
#name liseen
#wift fangshu
```
#### 命名关键字参数
对于关键字参数，函数的调用者可以传入任意不受限制的关键字参数。至于到底传入了哪些，就需要在函数内部通过kw检查

```
def person(name, age, **kw):
    if 'city' in kw:
        # 有city参数
        pass
    if 'job' in kw:
        # 有job参数
        pass
    print('name:', name, 'age:', age, 'other:', kw)
```
但是调用者仍可以传入不受限制的关键字参数：
```
>>> person('Jack', 24, city='Beijing', addr='Chaoyang', zipcode=123456)
```
如果要限制关键字参数的名字，就可以用命名关键字参数，例如，只接收city和job作为关键字参数。这种方式定义的函数如下：
```
def person(name, age, *, city, job):
    print(name, age, city, job)
```
和关键字参数**kw不同，命名关键字参数需要一个特殊分隔符*，*后面的参数被视为命名关键字参数。

调用方式如下：
```
>>> person('Jack', 24, city='Beijing', job='Engineer')
Jack 24 Beijing Engineer
```
命名关键字参数必须传入参数名，这和位置参数不同。如果没有传入参数名，调用将报错：
```
>>> person('Jack', 24, 'Beijing', 'Engineer')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: person() takes 2 positional arguments but 4 were given
```
由于调用时缺少参数名city和job，Python解释器把这4个参数均视为位置参数，但person()函数仅接受2个位置参数。

命名关键字参数可以有缺省值，从而简化调用：
```
def person(name, age, *, city='Beijing', job):
    print(name, age, city, job)
```
由于命名关键字参数city具有默认值，调用时，可不传入city参数：
```
>>> person('Jack', 24, job='Engineer')
Jack 24 Beijing Engineer
```
使用命名关键字参数时，要特别注意，如果没有可变参数，就必须加一个*作为特殊分隔符。如果缺少*，Python解释器将无法识别位置参数和命名关键字参数：

def person(name, age, city, job): # 缺少 *，city和job被视为位置参数 pass
```
def person(name, age, city, job):
    # 缺少 *，city和job被视为位置参数
    pass
```
命名关键字参数有两种形式
```
def person(name,age,*,city,job)
```
或者
```
def person(name,age,*city)
```

参考地址:
[https://blog.csdn.net/devin_hugh/article/details/79309884](https://blog.csdn.net/devin_hugh/article/details/79309884)