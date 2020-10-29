---
title: "Leetcode学习 有多少小于当前数字的数字"
date: 2020-10-29T13:53:16+08:00
draft: false
toc: false
images:
tags: 
  - leetcode
---

给你一个数组 nums，对于其中每个元素 nums[i]，请你统计数组中比它小的所有数字的数目。

换而言之，对于每个 nums[i] 你必须计算出有效的 j 的数量，其中 j 满足 j != i 且 nums[j] < nums[i] 。

以数组形式返回答案。

**示例1**

```
输入：nums = [8,1,2,2,3]
输出：[4,0,1,1,3]
解释： 
对于 nums[0]=8 存在四个比它小的数字：（1，2，2 和 3）。 
对于 nums[1]=1 不存在比它小的数字。
对于 nums[2]=2 存在一个比它小的数字：（1）。 
对于 nums[3]=2 存在一个比它小的数字：（1）。 
对于 nums[4]=3 存在三个比它小的数字：（1，2 和 2）。
```

**示例2**

```
输入：nums = [6,5,4,8]
输出：[2,1,0,3]
```

**示例3**

```
输入：nums = [7,7,7,7]
输出：[0,0,0,0]
```

**提示**

* ```2 <= nums.length <= 500```
* ```0 <= nums[i] <= 100```

**题解(javascript)**

```js
// 暴力解法
var smallerNumbersThanCurrent = function(nums) {
    let minList = [];
    let i = 0;
    // 循环第一层
    while (i<nums.length) {
        // 记录小的次数
        let minNum = 0
        // 依次循环数组内每个值并做比较
        for(let j = 0; j< nums.length; j++) {
            if (nums[i] > nums[j] && nums[i] != nums[j]) {
                minNum++
            }
        }
        minList.push(minNum);
        i++
    }
    return minList;
};
```

*** 

```js
/*
  排序+寻找
  1.首先将数组按小到大依次排序
  2.用原数组元素依次查找在排序后的索引.小于找到的索引的个数即为目标数目
*/
var smallerNumbersThanCurrent = function(nums) {
    let sortList = nums.slice().sort((a,b) => a-b);
    let minList = []
    for (let i = 0; i< nums.length; i++) {
        let index = sortList.indexOf(nums[i])
        minList.push(index)
    }
    return minList
};
```

