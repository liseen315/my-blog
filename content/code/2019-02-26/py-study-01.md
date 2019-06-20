---
title: "Pipenv:新一代Python项目环境与依赖管理工具"
date: 2019-02-26T15:49:58+08:00
author: "liseen"
tags: ["python"]
categories: ["Code"]
---

Pipenv 是 Kenneth Reitz 在 2017 年 1 月发布的 Python 依赖管理工具，现在由 PyPA 维护。你可以把它看做是 pip 和 virtualenv 的组合体，而它基于的 Pipfile 则用来替代旧的依赖记录方式（requirements.txt）

<!--more-->

很久很久以前,使用 virtualenvs 安装虚拟环境,后来出 Python3.4 以后可以使用类似如下命令创建

```bash
python3 -m venv xxx
```

但是...今天读书发现火箭已经到了火星了,而我在井底..当前只需要用 pip 去安装一个叫 pipenv 的包就可以全家桶搞定,类似 node 的 npm

```bash
pip3 install pipenv
pipenv --version
pipenv, version 2018.11.26
```

然后 cd 到我们的工作目录下直接运行如下命令

```bash
pipenv install
Creating a virtualenv for this project…
Pipfile: /Users/admin/liseen/python-study/helloflask/Pipfile
Using /usr/local/opt/python/bin/python3.7 (3.7.0) to create virtualenv…
⠇ Creating virtual environment...Already using interpreter /usr/local/opt/python/bin/python3.7
Using base prefix '/usr/local/Cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7'
New python executable in /Users/admin/.local/share/virtualenvs/helloflask-7D2RnkZA/bin/python3.7
Also creating executable in /Users/admin/.local/share/virtualenvs/helloflask-7D2RnkZA/bin/python
Installing setuptools, pip, wheel...
done.

✔ Successfully created virtual environment!
Virtualenv location: /Users/admin/.local/share/virtualenvs/helloflask-7D2RnkZA
Creating a Pipfile for this project…
Pipfile.lock not found, creating…
Locking [dev-packages] dependencies…
Locking [packages] dependencies…
Updated Pipfile.lock (a65489)!
Installing dependencies from Pipfile.lock (a65489)…
  🐍   ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 0/0 — 00:00:00
To activate this project's virtualenv, run pipenv shell.
Alternatively, run a command inside the virtualenv with pipenv run.
```

狂拽酷炫吊炸天的创建好了虚拟环境.使用如下命令激活与退出

```bash
pipenv shell # 激活虚拟环境
exit  # 退出虚拟环境
```

更帅的是可以不用激活的情况下直接以虚拟环境俩运行代码

```bash
pipenv run python hello.py
```

环境安装好后,就可以安装依赖了

```bash
pipenv install flask
Installing flask…
Adding flask to Pipfile's [packages]…
✔ Installation Succeeded
Pipfile.lock (662286) out of date, updating to (a65489)…
Locking [dev-packages] dependencies…
Locking [packages] dependencies…
✔ Success!
Updated Pipfile.lock (662286)!
Installing dependencies from Pipfile.lock (662286)…
  🐍   ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 6/6 — 00:00:01
(helloflask)
```

安装 pack 特别慢
进到项目内查看 Pipfile 更改镜像

```bash
url = "https://mirrors.aliyun.com/pypi/simple"
```

lock 特别慢可以先使用参数跳过 lock --skip-lock

自定义虚拟环境文件夹路径

默认情况下，Pipenv 会自动为你选择虚拟环境的存储位置，在 Windows 下通常为 C:\Users\Administrator\.virtualenvs\，而 Linux 或 macOS 则为~/.local/share/virtualenvs/。如果你想将虚拟环境文件夹在项目目录内创建，可以设置环境变量 PIPENV_VENV_IN_PROJECT，这时名为.venv 的虚拟环境文件夹将在项目根目录被创建。另外你也可以通过 WORKON_HOME 环境变量来自定义存储路径。

官方文档地址

[https://pipenv.readthedocs.io/en/latest/](https://pipenv.readthedocs.io/en/latest/)
