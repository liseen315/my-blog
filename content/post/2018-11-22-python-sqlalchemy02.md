---
title: "Python Sqlalchemy(02)"
author: "Liseen"
cover: "https://res.cloudinary.com/dnakxpzhj/image/upload/v1550633142/blog/sql.jpg"
tags: ["Python", "sqlalchemy"]
date: 2018-11-22T16:26:01+08:00
draft: true
---

Python sqlalchemy orm SQL表达式语言学习-插入并简单查询

<!--more-->

# 下面进行插入数据并写SQL进行简单的查询操作

```mysql
# 链接引擎
conn = engine.connect()
# 插入数据
conn.execute(users.insert(),[
  {'name':'jack','fullname':'Jack Jones'},
  {'name': 'wendy', 'fullname':'Wendy Williams'}
])

conn.execute(addresses.insert(), [
  {'user_id': 1, 'email_address' : 'jack@yahoo.com'},
  {'user_id': 1, 'email_address' : 'jack@msn.com'},
  {'user_id': 2, 'email_address' : 'www@www.org'},
  {'user_id': 2, 'email_address' : 'wendy@aol.com'},
])

s = text(
  "SELECT * FROM users;"
)
result = conn.execute(s).fetchall()
for row in result:
  print(row[users.c.name],row[users.c.fullname])
```
