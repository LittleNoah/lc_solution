# 283 Move Zeros
Tags:

- Array, Two Pointer
- Facebook

重看一遍这个题的第二种解法，想一下怎么能讲清楚这个思路

坑:

- ...思路很诡异

## Description

> Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
>
> For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].

*Note:*
* You must do this in-place without making a copy of the array.
* Minimize the total number of operations.


## Ideas

### Offical Solution
[官方答案](https://leetcode.com/articles/move-zeroes/)

>This question comes under a broad category of "Array Transformation". This category is the meat of tech interviews. Mostly because arrays are such a simple and easy to use data structure. Traversal or representation doesn't require any boilerplate code and most of your code will look like the Pseudocode itself.


### My Idea

这题和前面那个swap啊，two pointer迁移啊差不多，但是主要的难点我觉得在于怎么保证order，要保证order就不能Swap，但是不swap又要多加几句话用来把后面的元素置0

### 迁移思路



## Java Solutions

### 大二 Solution

```java
class Solution {
    public void moveZeroes(int[] nums) {
        int start = 0;
        for(int i = 0; i < nums.length; i++){
            if(0 != nums[i]){
                nums[start] = nums[i];
                start += 1;
            }
        }
        // now start is the length of non-zero, which represented as the next index of the last non-zero
        for(int i = start; i< nums.length; i++){
            nums[i] = 0;
        }
    }
}
```

### Swap Solution

```java
class Solution {
    public void moveZeroes(int[] nums) {
        int lastNonZeroFound = 0;
        int cur = 0;
        
        for(; cur < nums.length; cur++){
            if(nums[cur] != 0){ // swap
                if(cur != lastNonZeroFound){
                    nums[lastNonZeroFound] = nums[cur];
                    nums[cur] = 0;
                }
                lastNonZeroFound += 1;
            }
        }
        
    }
}
```
其中 cur 用来找到非0节点

- 如果遇到值为0的节点，cur会继续走到下一个，而因为前一个节点是非0，所以lastZero这个货其实走到了0上，那么cur找到的下一个non-zero直接换给lastZero就可以了
- 然后lastZero走到下一个，而由于cur会把当前这个货置0，所以没问题
- 相当于这俩pointer中间都是0