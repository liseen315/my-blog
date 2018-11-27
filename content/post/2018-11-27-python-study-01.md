---
title: "Python Study 创建虚拟环境"
author: "Liseen"
cover: "https://res.cloudinary.com/dnakxpzhj/image/upload/v1543297269/pythonlogo.jpg"
tags: ["Python"]
date: 2018-11-27T13:37:39+08:00
draft: true
---

人生苦短,我学Python...使用pipenv创建虚拟环境

<!--more-->

很久很久以前,使用virtualenvs安装虚拟环境,后来出Python3.4以后可以使用类似如下命令创建

```bash
python3 -m venv xxx
```

但是...今天读书发现火箭已经到了火星了,而我在井底..当前只需要用pip去安装一个叫pipenv的包就可以全家桶搞定,类似node的npm

```bash
pip3 install pipenv
pipenv --version
pipenv, version 2018.11.26
```

然后cd到我们的工作目录下直接运行如下命令

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
