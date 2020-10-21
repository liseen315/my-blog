---
title: "Leetcode学习 两数之和"
date: 2020-10-21T09:26:24+08:00
draft: false
toc: false
images:
tags: 
  - leetcode
---

给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

**示例:**

```
给定 nums = [2, 7, 11, 15], target = 9

因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]
```

**题解(javascript)**

***

```js
// 暴力破解法
const twoSum = (nums, target) => {
    for(let i = 0;i< nums.length;i++) {
        for(let j = i+1;j<nums.length;j++) {
          // 依次循环数组内的每个元素如果前一个+后面的等于目标则返回索引
            if(nums[i] + nums[j] == target) {
                return [i,j];
            }
        }
    }
};
```
***

```javascript
// Hash法
const twoSum = (nums, target) => {
  const prevNums = {}; // map存储出现过的数字,以数字为键索引为值           

  for(let i = 0;i<nums.length; i++) {
      const indexNum = nums[i]; // 循环数组元素
      const targetNum = target - indexNum; // 目标数值减去循环的元素即为两数中的另外一个目标数
      const targetIndex = prevNums[targetNum]; // 从hashmap中读取是否存在对应的键
      if (targetIndex != undefined) {
          // 如果存在对应的键则返回两数所在的索引
          return [targetIndex,i]
      }else {
          // 如果在map中不存在则记录数组索引与值到hash中
          prevNums[indexNum] = i;
      }
  }
}
```