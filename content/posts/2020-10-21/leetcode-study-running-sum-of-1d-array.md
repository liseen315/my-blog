---
title: "Leetcode学习 一维数组的动态和"
date: 2020-10-21T09:57:10+08:00
draft: false
toc: false
images:
tags: 
  - leetcode
---

给你一个数组 nums 。数组「动态和」的计算公式为：runningSum[i] = sum(nums[0]…nums[i]) 。

请返回 nums 的动态和。

**示例1**

```
输入：nums = [1,2,3,4]
输出：[1,3,6,10]
解释：动态和计算过程为 [1, 1+2, 1+2+3, 1+2+3+4] 。
```

**示例2**

```
输入：nums = [1,1,1,1,1]
输出：[1,2,3,4,5]
解释：动态和计算过程为 [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1] 。
```

**示例3**

```
输入：nums = [3,1,2,10,1]
输出：[3,4,6,16,17]
```

**提示**

* ```1 <= nums.length <= 1000```
* ```-10^6 <= nums[i] <= 10^6```

**题解(javascript)**

***

```js
// 循环累加记录法
var runningSum = function(nums) {
    const bcList = [];
    let preNum = 0;
    for(let i=0;i<nums.length;i++){
        // 循环累加
        let currentValue = preNum+nums[i];
        bcList.push(currentValue);
        // 记录之前累加过的数值
        preNum = currentValue;
    }
    return bcList;
};
```
***

```js
/*
  Array高级函数reduce()
  函数接收如下四个参数
  Accumulator (acc) (累计器)
  Current Value (cur) (当前值)
  Current Index (idx) (当前索引可选)
  Source Array (src) (源数组可选)
*/
var runningSum = function(nums) {
    // 高阶函数直接累加并覆盖nums返回
    nums.reduce((prev, curr, index) => {
        nums[index] = prev + curr
        return nums[index]
    })
    return nums
};
```