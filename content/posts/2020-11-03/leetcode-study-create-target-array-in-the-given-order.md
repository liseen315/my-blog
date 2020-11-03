---
title: "Leetcode学习 按既定顺序创建目标数组"
date: 2020-11-03T14:17:17+08:00
draft: false
toc: false
images:
tags: 
  - leetcode
---

给你两个整数数组 nums 和 index。你需要按照以下规则创建目标数组：

* 目标数组 target 最初为空。
* 按从左到右的顺序依次读取 nums[i] 和 index[i]，在 target 数组中的下标 index[i] 处插入值 nums[i] 。
* 重复上一步，直到在 nums 和 index 中都没有要读取的元素。

请你返回目标数组。

题目保证数字插入位置总是存在。

**示例1**

```
给你两个整数数组 nums 和 index。你需要按照以下规则创建目标数组：

目标数组 target 最初为空。
按从左到右的顺序依次读取 nums[i] 和 index[i]，在 target 数组中的下标 index[i] 处插入值 nums[i] 。
重复上一步，直到在 nums 和 index 中都没有要读取的元素。
请你返回目标数组。

题目保证数字插入位置总是存在。
```

**示例2**

```
输入：nums = [1,2,3,4,0], index = [0,1,2,3,0]
输出：[0,1,2,3,4]
解释：
nums       index     target
1            0        [1]
2            1        [1,2]
3            2        [1,2,3]
4            3        [1,2,3,4]
0            0        [0,1,2,3,4]
```

**示例3**

```
输入：nums = [1], index = [0]
输出：[1]
```

**提示**

* ```1 <= nums.length, index.length <= 100```
* ```nums.length == index.length```
* ```0 <= nums[i] <= 100```
* ```0 <= index[i] <= i```

**题解(javascript)**

```js
/*
  1.按照题目规则循环index数组
  2.使用splice进行插入即可
*/
var createTargetArray = function(nums, index) {
    let target = []
    for (let i =0;i<index.length;i++) {
        target.splice(index[i],0,nums[i])
    }
    return target
};
```