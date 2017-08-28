# 20 Valid Parentheses

Tag:

- Easy
- Array
- LinkedIn, Microsoft, etc...

Todo List:

- derivitives

Notice:

- Java 的char的元类型是Character
- String需要用`String.charAt(index)`来取出char

## Problem Description

Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:
> Given `nums = [2, 7, 11, 15], target = 9`,

> Because `nums[0] + nums[1] = 2 + 7 = 9`,
> `return [0, 1]`.

## Ideas

Using HashMap to store each number's index, and check whether it existed. During loop, using curNum and check if we got the index of pairNum (`pairNum = target - curNum`)

## Solutions

### One-Pass HashMap Solution 

`O(N) O(N)`了

代码如下：

```java
class Solution {
    public int[] twoSum(int[] nums, int target) {
        if(nums.length < 2){
            int[] res = {0,0};
            return res;
        }
        Map<Integer, Integer> numMap = new HashMap<>(); // store the indice and number
        int[] indices = new int[2];
        for(int i = 0; i < nums.length; i++){
            int curNum = nums[i];
            int pairNum = target - curNum;
            if(numMap.get(pairNum) != null){	// numMap.containsKey(pairNum)
                indices[0] = numMap.get(pairNum);
                indices[1] = i;
                break;
            }
            numMap.put(curNum, i);
        }
        
        return indices;
    }
}
```
