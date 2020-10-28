---
title: "Leetcode学习 数组中重复的数字"
date: 2020-10-27T14:43:45+08:00
draft: false
toc: false
images:
tags: 
  - leetcode
---

找出数组中重复的数字。


在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。

**示例**

```
输入：
[2, 3, 1, 0, 2, 5, 3]
输出：2 或 3 
```

**限制**

* ```2 <= n <= 100000```

**题解(javascript)**

```js
// hash记录法
var findRepeatNumber = function (nums) {
    var map = {};
    for(var i = 0 ; i< nums.length; i++){
      // 如果在hash中不存在则记录一次
      if(!map[nums[i]]){
        map[nums[i]] = i; 
      }else {
        return nums[i]
      }
    }
};
```