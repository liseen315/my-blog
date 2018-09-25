---
title: "2018 09 25 Linuxstudy Everyday"
author: "liseen"
cover: "https://res.cloudinary.com/dnakxpzhj/image/upload/v1537856707/linux.jpg"
tags: ["linux"]
date: 2018-09-25T14:20:38+08:00
draft: true
---

oh-my-zsh提高shell的逼格

<!--more-->

#### 以mac 为例,我们看下系统内置了几种shell

```bash
cat /etc/shells

# List of acceptable shells for chpass(1).
# Ftpd will not allow users to connect who are not using
# one of these shells.

/bin/bash
/bin/csh
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh

```

#### 安装zsh

如果是linux 系统,首先你需要安装 zsh

```bash
sudo yum install zsh
或者
sudo apt-get install zsh
```

mac下不用安装zsh


#### 安装oh-my-zsh

```bash
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

#### 配置

```bash
vim ~/.zshrc

//插件配置我选择了
zsh-autosuggestions
// 主题使用的是
ZSH_THEME="ys"

```


