---
title: "Leetcode学习 移动零"
date: 2020-10-23T14:22:56+08:00
draft: false
toc: false
images:
tags: 
  - leetcode
---

给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

**示例**

```
输入: [0,1,0,3,12]
输出: [1,3,12,0,0]
```

**说明**

1. 必须在原数组上操作，不能拷贝额外的数组。
2. 尽量减少操作次数。

**题解(javascript)**

```js
// 双指针法
var moveZeroes = function(nums) {
    // zeroIndex始终追踪遇到的第一个0的索引
    let zeroIndex = 0;
    for (let i = 0; i< nums.length;i++) {
        // 当遇到!0的位置时候将0与此位置数字进行互换并且0索引++
        if (nums[i] !== 0) {
            [nums[i],nums[zeroIndex]] = [nums[zeroIndex],nums[i]];
            zeroIndex++;
        }
    }
};
```
