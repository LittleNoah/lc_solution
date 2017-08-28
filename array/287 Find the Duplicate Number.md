# 287 Find the Duplicate Number

Tags:

- Medium
- Array
- ???

坑:

- ...

Todos
- [ ] 弄清楚这题怎么讲


## Description

Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.

Note:

1. You must not modify the array (assume the array is read only).
2. You must use only constant, O(1) extra space.
3. Your runtime complexity should be less than O(n2).
4. There is only one duplicate number in the array, but it could be repeated more than once.

## Ideas

1. 鸽巢原理
2. 快慢指针搜索环，也就是[linked list cycle](https://leetcode.com/problems/linked-list-cycle-ii/description/)那道题

## Java Solutions

### 鸽巢原理 Solution



```java

```

### Cycle Solutions

```java
class Solution {
    public int findDuplicate(int[] nums) {
        // if(nums.length < 2){
        //     return 0;
        // }
        // find the cycle
        int slow = 0, fast = 0;
        while(true){
            slow = nums[slow];
            fast = nums[nums[fast]];
            if(slow == fast) {break;}
        }
        int t = 0;
        while(slow != t){
            slow = nums[slow];
            t = nums[t];
        }
        return t;
    }
}
```