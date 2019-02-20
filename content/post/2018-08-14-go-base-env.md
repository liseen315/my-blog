---
title: "Go学习笔记 (02) Go基础环境搭建"
author: "liseen"
cover: "https://res.cloudinary.com/dnakxpzhj/image/upload/v1550632951/blog/golang.jpg"
tags: ["golang"]
date: 2018-08-14T22:02:12+08:00
draft: true
---

Go 基础环境安装,开发工具,插件配置,以及基础命令使用.

<!--more-->

#### Go 开发环境的安装以及配置

* 操作系统 macos
* 编辑器vim && vscode

##### mac下可以直接使用brew 安装 go

```bash
$ brew install go
$ go version
go version go1.10.3 darwin/amd64

```

##### vscode下载

*vscode*: https://code.visualstudio.com/

1. 插件选择安装go
2. 安装vpn或者使用shadowsocks开启http代理下载go插件内的各种依赖包

##### 配置环境变量GOPATH GOBIN

```bash
$ go env

vim ~/.zshrc

export GOPATH=/Users/xxxxx/golang-study
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

```

当环境变量配置完后我们就可以在指定的目录下创建工作目录了.当前我使用的golang-study作为工作空间,在此目录内go约定使用三个目标文件夹分别是

```bash
├── bin  #存放编译后的可执行文件
├── pkg  #存放包文件.a
└── src  #源代码

```

##### 基础命令使用

```bash

build       compile packages and dependencies
clean       remove object files and cached files
doc         show documentation for package or symbol
fmt         gofmt (reformat) package sources
get         download and install packages and dependencies
install     compile and install packages and dependencies
run         compile and run Go program
test        test packages
version     print Go version

```

其中常用的命令是go run ,go build ,go get ,go install ,go test.