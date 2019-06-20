---
title: "golang 的fmt"
date: 2019-06-20T13:39:47+08:00
author: "liseen"
tags: ["golang"]
categories: ['Code']
---

golang 的fmt 包实现了格式化I/O函数，类似于C的 printf 和 scanf。

<!--more-->

```bash
# 定义示例类型和变量
type Human struct {
    Name string
}

var people = Human{Name:"zhangsan"}
```

普通占位符

| 占位符 | 说明 | 举例 | 输出 |
| ------ | ------ | ------ | ------ |
| %v |  相应值的默认格式。 | Printf("%v", people) | {zhangsan} |
| %+v | 打印结构体时，会添加字段名 | Printf("%+v", people) | {Name:zhangsan} |
| %#v | 相应值的Go语法表示 | Printf("#v", people) | main.Human{Name:"zhangsan"} |
| %T | 相应值的类型的Go语法表示 | Printf("%T", people) | main.Human |
| %% | 字面上的百分号，并非值的占位符 | Printf("%%") | % |

布尔占位符

| 占位符 | 说明 | 举例 | 输出 |
| ------ | ------ | ------ | ------ |
| %t  |  true 或 false | Printf("%t", true) | true |

整数占位符

| 占位符 | 说明 | 举例 | 输出 |
| ------ | ------ | ------ | ------ |
| %b | 二进制表示 | Printf("%b", 5) | 101 |
| %c | 相应Unicode码点所表示的字符 | Printf("%c", 0x4E2D) | 中 |
| %d | 十进制表示 | Printf("%d", 0x12) | 18 |
| %o | 八进制表示 | Printf("%d", 10 | 12 |
| %q | 单引号围绕的字符字面值，由Go语法安全地转义 | Printf("%q", 0x4E2D) | '中' |
| %x | 十六进制表示，字母形式为小写 a-f | Printf("%x", 13) | d |
| %X | 十六进制表示，字母形式为大写 A-F | Printf("%x", 13) | D |
| %U | Unicode格式：U+1234，等同于 "U+%04X" | Printf("%U", 0x4E2D) | U+4E2D |


转载地址:
[golang官方fmt说明](https://golang.org/pkg/fmt/)