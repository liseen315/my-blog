---
title: "Leetcode Study 左旋转字符串"
date: 2020-10-26T15:17:16+08:00
draft: false
toc: false
images:
tags: 
  - leetcode
---

字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。

**示例1**

```
输入: s = "abcdefg", k = 2
输出: "cdefgab"
```

**示例2**

```
输入: s = "lrloseumgh", k = 6
输出: "umghlrlose"
```

**限制**

* ```1 <= k < s.length <= 10000```

**题解(javascript)**

```js
// 数组切割
var reverseLeftWords = function(s, n) {
  let sList = Array.from(s);
  sList = sList.concat(sList.splice(0,n));
  return sList.join('');
};
// 字符串直接切割
var reverseLeftWords = function(s, n) {
  return s.substring(n) + s.substring(0,n)
};  
```