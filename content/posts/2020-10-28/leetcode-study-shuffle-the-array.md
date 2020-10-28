---
title: "Leetcode学习 重新排列数组"
date: 2020-10-28T10:13:24+08:00
draft: false
toc: false
images:
tags: 
  - leetcode
---

给你一个数组 nums ，数组中有 2n 个元素，按 [x1,x2,...,xn,y1,y2,...,yn] 的格式排列。

请你将数组按 [x1,y1,x2,y2,...,xn,yn] 格式重新排列，返回重排后的数组。

**示例1**

```
输入：nums = [2,5,1,3,4,7], n = 3
输出：[2,3,5,4,1,7] 
解释：由于 x1=2, x2=5, x3=1, y1=3, y2=4, y3=7 ，所以答案为 [2,3,5,4,1,7]
```

**示例2**

```
输入：nums = [1,2,3,4,4,3,2,1], n = 4
输出：[1,4,2,3,3,2,4,1]
```

**示例3**

```
输入：nums = [1,1,2,2], n = 2
输出：[1,2,1,2]
```

**提示**

* ```1 <= n <= 500```
* ```nums.length == 2n```
* ```1 <= nums[i] <= 10^3```

**题解(javascript)**

```js
/*
  边删边添法
  1. 找到截断的数组后半部分循环
  2. 将循环到的数字依次添到前半部分数组的对应位置(隔一个添)
*/

var shuffle = function(nums, n) {
    let numsLen = nums.length;
    // 记录要添加到数组内的索引
    let index = 1
    while(n < numsLen-1) {
        // 删除的数字
        let delNum = nums[n]
        nums.splice(n,1)
        // 把删除的回填回去
        nums.splice(index,0,delNum)
        index = index + 2
        n++
    }
    return nums
};

```
***

```js
/*
  切割数组法
  1.从n起始截取数组,这时原数组与截取后的数组长度相同
  2.新建一个临时数组,以截取后的数组长度循环依次push两个数组内的值
*/
var shuffle = function(nums, n) {
    let arr1 = nums.splice(n);
    let newArr = [];
    for(let i = 0 ; i < nums.length ; i ++ ){
        newArr.push(nums[i]);
        newArr.push(arr1[i]);
    }
    return newArr;
};
```