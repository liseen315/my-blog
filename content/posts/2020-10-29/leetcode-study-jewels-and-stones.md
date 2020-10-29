---
title: "Leetcode学习 宝石与石头"
date: 2020-10-29T15:30:42+08:00
draft: false
toc: false
images:
tags: 
  - leetcode
---

给定字符串J 代表石头中宝石的类型，和字符串 S代表你拥有的石头。 S 中每个字符代表了一种你拥有的石头的类型，你想知道你拥有的石头中有多少是宝石。

J 中的字母不重复，J 和 S中的所有字符都是字母。字母区分大小写，因此"a"和"A"是不同类型的石头。

**示例1**

```
输入: J = "aA", S = "aAAbbbb"
输出: 3
```

**示例2**

```
输入: J = "z", S = "ZZ"
输出: 0
```

**提示**

* ```S 和 J 最多含有50个字母。```
* ```J 中的字符不重复。```

**题解(javascript)**

```js
// 暴力循环挨个去找没啥好说的..
var numJewelsInStones = function(J, S) {
    let num = 0;
    for (let i = 0; i < J.length; i ++) {
        for (let j = 0; j< S.length;j++) {
            if (J[i] === S[j]) {
                num++
            }
        }
    }
    return num;
};
```

***

```js
/*
  1.将手中的石头(S)转成数组
  2.利用API来过滤当前石头(S item)是否在宝石列表(J)中
  3.返回过滤后数组的长度
*/
var numJewelsInStones = function(J, S) {
    let sList = Array.from(S);
    let numList = sList.filter(value => J.includes(value));
    return numList.length;
};
```


