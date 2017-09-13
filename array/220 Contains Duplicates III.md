# Description

判断数组里是否有重复数字，返回true or false, 要求 if n[i] == n[j] 那么 j-i at most 是 k

Given an array of integers, find out whether there are two distinct indices i and j in the array such that the absolute difference between `nums[i]` and `nums[j]` is at most `t` and the absolute difference between `i` and `j` is at most `k`


# Ideas

1. HashMap, 用sliding window飞过去
2. 因为要求有k的这个限制，不能改变数组排序

# Code Solutions

## HashMap

第一次submit没过...因为corner case 处理有问题

```java
public boolean containsNearbyDuplicate(int[] nums, int k) {
    if(nums.length < 2){ // notice here, 这道不是3 sum啊大哥
        return false;
    }
    // construct a sliding window
    int left = 0;
    int right = 0;
    Map<Integer, Boolean> map = new HashMap<>();
    while(right < nums.length){
        // move window
        if(right-left > k){
            map.remove(nums[left]);
            left += 1;
        }
        if(map.containsKey(nums[right])){
            return true;
        }
        map.put(nums[right], true);
        right += 1;
    }
    return false;
}
```

