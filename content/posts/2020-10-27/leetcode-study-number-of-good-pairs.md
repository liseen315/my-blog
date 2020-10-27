---
title: "Leetcode学习 好数对的数目"
date: 2020-10-27T09:53:11+08:00
draft: false
toc: false
images:
tags: 
  - leetcode
---

给你一个整数数组 nums 。

如果一组数字 (i,j) 满足 nums[i] == nums[j] 且 i < j ，就可以认为这是一组 好数对 。

返回好数对的数目。

**示例1**

```
输入：nums = [1,2,3,1,1,3]
输出：4
解释：有 4 组好数对，分别是 (0,3), (0,4), (3,4), (2,5) ，下标从 0 开始
```

**示例2**

```
输入：nums = [1,1,1,1]
输出：6
解释：数组中的每组数字都是好数对
```

**示例3**

```
输入：nums = [1,2,3]
输出：0
```

**提示**

* ```1 <= nums.length <= 100```
* ```1 <= nums[i] <= 100```

**题解(javascript)**

```js
// 暴力破解法
var numIdenticalPairs = function(nums) {
    let checkNum = 0
    // 两层循环根据条件增加检测到的对数
    for(let i = 0;i<nums.length;i++) {
        for (let j = i+1;j<nums.length;j++) {
            if (nums[i] == nums[j] && i < j) {
                checkNum++;
            }
        }
    }
    return checkNum;
};
```

***

```js
// hashmap记录法,map用于记录出现过的数字如果后续有相同的则+1
var numIdenticalPairs = function(nums) {
    let checkNum = 0
    let map = {}
    for(let i = 0;i<nums.length;i++) {
        let key  = nums[i];
        if (map[key] === undefined) {
            map[key] = 0
        }else {
            map[key] = map[key] + 1;
        }
        checkNum += map[key];
    }
    return checkNum;
};
```