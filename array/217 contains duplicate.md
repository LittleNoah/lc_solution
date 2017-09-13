# Description

判断数组里是否有重复数字，返回true or false

# Ideas

1. HashMap, 额外空间O(n), 时间复杂度O(N)
2. 排序之后，两两比较...这..仔细一想的话 O(nlgn)，讲道理是比HashMap慢一点的(数据够多的话)
3. 逆天小数组法，其实还是额外空间O(n)的，只不数组过取数值可能快一点吧，思想值得学习的

# Code Solutions

## HashMap

```java
class Solution {
    public boolean containsDuplicate(int[] nums) {
        if(nums.length < 2){ // [] or [digit,]
            return false;
        }
        Map<Integer, Boolean> map = new HashMap<>();
        for(int num :nums){
            if(map.containsKey(num)){
                return true;
            }
            map.put(num,true);
        }
        return false;
    }
}
```


## Sorting

```java
class Solution {
    public boolean containsDuplicate(int[] nums) {
        if(nums.length < 2){ // [] or [digit,]
            return false;
        }
        Arrays.sort(nums);
        for(int i = 0; i<nums.length-1; i++){
            if(nums[i] == nums[i+1]){
                return true;
            }
        }
        return false;
    }
}
```