# 136 Single Number

Tags:

- Easy
- Array, Hash Table, Bit Manipulation
- ???

坑:

- ...

Todos
- [ ] 弄清楚这题怎么讲
- [ ] Hash Table Solution


## Description

Given an array of integers, every element appears twice except for one. Find that single one.

Note:
- Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
Note:



## Ideas

1. HashTable Store
2. XOR [异或的性质](http://blog.csdn.net/mrbcy/article/details/62883489)

## Java Solutions

### HashTable Solution



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

# Single Number II

## Description

数组里，除了其中一个二货，都出现过三次，这个二货就他自己(one time)

## Ideas

这题有意思了...不知道咋做了又

# Single Number III