# 581 Shortest Unsorted Continous Subarray

Tag:

- Easy
- Array
- ?

Todo List:

- [ ] 看懂答案
- [ ] 写完Stack解法

Notice:

- ​

## Problem Description

输入一个整数N,从1到N输出一个数组

> Given an integer array, you need to find one **continuous subarray** that if you only sort this subarray in ascending order, then the whole array will be sorted in ascending order, too. 
>
> You need to find the **shortest** such subarray and output its length.

[Link to Shortest Unsorted Continous Subarray](https://leetcode.com/problems/shortest-unsorted-continuous-subarray/#/description)

具体说比如说我有一个数组 [1,2,3,7,6,8] 我要在里面找到一个subarray，排序之后使得整个数组也有序

## Ideas

通过DSA绪论里计算模型讲的2-subset问题，我们可以明显的知道，遍历全部组合（子集）是一个2^n复杂度的算法，相如果没有其他信息就当于求解NP-complete，但是这道题有其他解法啦

放弃暴力求解

## Ruby Solutions



### Sort Solution

`O(N) O(N)`了

代码如下：

```ruby
# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
def can_place_flowers(flowerbed, n)
  return true if n==0
  return 0 if flowerbed.size.zero?
  len = flowerbed.size
  result = 0
  flowerbed.each_with_index do |plot, index|
      next if plot==1 # skip planted plot
      next if index>0 && flowerbed[index-1]==1
      next if index<len-1 && flowerbed[index+1]==1
      flowerbed[index] = 1
      result+=1
  end
  return result>=n # if possible is more than n
end
```



## Java Solutions

**注意** 

1. 最后返回判断的时候注意下
2. start应该初始化为数组长度，end初始化为0，这样才能起到判断的作用，也就是说Math.min能修改该修改的

### Sort Solution

代码如下

```java
public class Solution {
    public int findUnsortedSubarray(int[] nums) {
        int []clone_nums = nums.clone();
        Arrays.sort(clone_nums);
        int start=nums.length;
        int end = 0;
        for(int i=0; i<nums.length; i++){
            if(nums[i] != clone_nums[i]){
                start = Math.min(start, i);
                end = Math.max(end, i);
            }
        }
        return (end-start>=0 )? end-start+1 : 0;
    }
}
```

