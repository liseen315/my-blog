---
title: "Leetcode学习 解压缩编码列表"
date: 2020-11-01T23:49:43+08:00
draft: false
toc: false
images:
tags: 
  - leetcode
---

给你一个以行程长度编码压缩的整数列表 nums 。

考虑每对相邻的两个元素 [freq, val] = [nums[2*i], nums[2*i+1]] （其中 i >= 0 ），每一对都表示解压后子列表中有 freq 个值为 val 的元素，你需要从左到右连接所有子列表以生成解压后的列表。

请你返回解压后的列表。

**示例1**

```
输入：nums = [1,2,3,4]
输出：[2,4,4,4]
解释：第一对 [1,2] 代表着 2 的出现频次为 1，所以生成数组 [2]。
第二对 [3,4] 代表着 4 的出现频次为 3，所以生成数组 [4,4,4]。
最后将它们串联到一起 [2] + [4,4,4] = [2,4,4,4]。
```

**示例2**

```
输入：nums = [1,1,2,3]
输出：[1,3,3]
```

**提示**

* ```2 <= nums.length <= 100```
* ```nums.length % 2 == 0```
* ```1 <= nums[i] <= 100```

**题解(javascript)**

```js
/*
  1. 按照%2拆分数组
  2. 按照拆后的初始化一个长度为targetLen的新数组并fill进去target
  3. 展开数组并压缩到bcList返回
*/
var decompressRLElist = function(nums) {
    let bcList = []
    for (let i = 0;i<nums.length;i++) {
        if((i+1)%2 == 0) {
            let target = nums[i]
            let targetLen = nums[i-1]
            bcList.push(...new Array(targetLen).fill(target));
        }
    }
    return bcList;
};
```
