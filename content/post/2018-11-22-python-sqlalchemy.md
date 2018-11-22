---
title: "Python Sqlalchemy(01)"
author: "Liseen"
cover: "https://res.cloudinary.com/dnakxpzhj/image/upload/v1542793950/sql.jpg"
tags: ["Python", "sqlalchemy"]
date: 2018-11-22T14:52:53+08:00
draft: true
---

Python sqlalchemy orm SQL表达式语言学习-链接并创建表

<!--more-->

# SQL Expression Language Tutorial

## 首先确认python的版本

```python
# 使用python3自带的命令创建虚拟环境(ormvenv) 为虚拟目录名字并激活虚拟环境
python3 -m venv ormvenv
souce ormvenv/bin/active
```

## 我们链接的是mysql 前提主机上安装了mysql

```python
# 安装如下包
pip instal SQLAlchemy
pip mysqlclient

from sqlalchemy import *
engine = create_engine('mysql+mysqldb://username:password@host/xx')
metadata = MetaData()
users = Table('users',metadata,
  Column('id',Integer,primary_key = True),
  Column('name',String(64)),
  Column('fullname',String(120))
)
addresses = Table('addresses',metadata,
  Column('id', Integer, primary_key=True),
  Column('user_id', None, ForeignKey('users.id')),
  Column('email_address', String(120), nullable=False)
)

metadata.create_all(engine)

```

## 执行

```mysql
show tables;
+----------------------+
| Tables_in_linktodapp |
+----------------------+
| addresses            |
| users                |
+----------------------+
2 rows in set
Time: 0.016s
```

发现当前创建的两个表被创建了.
