---
title: "Leetcode学习 长按键入"
date: 2020-10-21T15:05:11+08:00
draft: false
toc: false
images:
tags: 
  - leetcode
---

你的朋友正在使用键盘输入他的名字 name。偶尔，在键入字符 c 时，按键可能会被长按，而字符可能被输入 1 次或多次。

你将会检查键盘输入的字符 typed。如果它对应的可能是你的朋友的名字（其中一些字符可能被长按），那么就返回 True。

**示例1**

```
输入：name = "alex", typed = "aaleex"
输出：true
解释：'alex' 中的 'a' 和 'e' 被长按。
```

**示例2**

```
输入：name = "saeed", typed = "ssaaedd"
输出：false
解释：'e' 一定需要被键入两次，但在 typed 的输出中不是这样。
```

**示例3**

```
输入：name = "leelee", typed = "lleeelee"
输出：true
```

**示例4**

```
输入：name = "laiden", typed = "laiden"
输出：true
解释：长按名字中的字符并不是必要的。
```

**提示**

* ```name.length <= 1000```
* ```typed.length <= 1000```
* ```name 和 typed 的字符都是小写字母。```

**题解(javascript)**

```js
/**
  使用i,j两个指针追踪name跟typed
  1. 当name[i]===typed[j]说明存在一对匹配字符，这个时候i,j都+1
  2. 否则当typed[j]===typed[j-1]说明存在一次长按，此时j++
  3. 最后当i===name.length说明name已经匹配完毕
*/

var isLongPressedName = function(name, typed) {
    const nLen = name.length;
    const tLen = typed.length;
    // 定义两个指针分别指向name,typed
    let i = 0, j = 0;
    while (j < tLen) {
        if (i < nLen && name[i] === typed[j]) {
            // 当i指针没循环完毕并且当前两指针所指字符相同指针进位
            i++;
            j++;
        } else if (j > 0 && typed[j] === typed[j - 1]) {
            // 当j指针运行一位并且j指针指向字符与前一位相同则j指针进位
            j++;
        } else {
            return false;
        }
    }
    // name查找完毕
    return i === nLen;
};

```