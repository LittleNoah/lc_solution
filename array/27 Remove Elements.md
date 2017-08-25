# 27 Remove Elements
Tags:

- Linked List, Two Pointer
- ???不存在的


坑:

- ...返回的时候记得返回的是dummy head的next

## Description

Given an array and a value, remove all instances of that value in place and return the new length.

Do not allocate extra space for another array, you must do this in place with constant memory.

The order of elements can be changed. It doesn't matter what you leave beyond the new length.

Example:
Given input array `nums = [3,2,2,3], val = 3`

Your function should return `length = 2`, with the first two elements of nums being 2.


## Ideas

### 迁移思路

也是大二就做过的题了...

思路是从头开始把所有不是这个要删除的数的元素迁移一下，具体看代码吧...

说是Two Pointer的思路是因为，本身的begin作为一个pointer, 而for-loop的index也算是一个

### Swap 思路

下面我们谈一下swap的思路，也就是把遇到的这个玩意和末位元素互换，可以有效的避免不必要的cost

用两个ptr一个在头一个在尾，如果遇到目标，就swap

## Java Solutions

### 大二 Solution

```java
class Solution {
    public int removeElement(int[] nums, int val) {
        int start = 0;
        for(int i = 0; i < nums.length; i++){
            if(val != nums[i]){
                nums[start] = nums[i];
                start += 1;
            }
        }
        return start;
    }
}
```

### Swap Solution

```java
class Solution {
    public int removeElement(int[] nums, int val) {
        int start = 0;
        int end = nums.length;
        while(start < end){
            if(nums[start] == val){
                nums[start] = nums[end-1];
                end -= 1;
            }else{
                start += 1;
            }
        }
        return end;
    }
}
```