---
title: "Leetcode学习 数组异或操作"
date: 2020-11-01T23:06:21+08:00
draft: false
toc: false
images:
tags: 
  - leetcode
---

给你两个整数，n 和 start 。

数组 nums 定义为：nums[i] = start + 2*i（下标从 0 开始）且 n == nums.length 。

请返回 nums 中所有元素按位异或（XOR）后得到的结果。

**示例1**

```
输入：n = 5, start = 0
输出：8
解释：数组 nums 为 [0, 2, 4, 6, 8]，其中 (0 ^ 2 ^ 4 ^ 6 ^ 8) = 8 。
     "^" 为按位异或 XOR 运算符。
```

**示例2**

```
输入：n = 4, start = 3
输出：8
解释：数组 nums 为 [3, 5, 7, 9]，其中 (3 ^ 5 ^ 7 ^ 9) = 8.
```

**示例3**

```
输入：n = 1, start = 7
输出：7
```

**示例4**

```
输入：n = 10, start = 5
输出：2
```

**提示**

* ```1 <= n <= 1000```
* ```0 <= start <= 1000```
* ```n == nums.length```

**题解(javascript)**

```js
/*
  暴力解法
  1. 按照题目规则生成对应的数组
  2. 使用原生API计算异或结果
*/

var xorOperation = function(n, start) {
    let i = 0;
    let nums = [];
    while(i<n) {
        nums[i] = start + 2*i
        i++
    }
    return nums.reduce((acc,cur) => acc^cur)
};
```