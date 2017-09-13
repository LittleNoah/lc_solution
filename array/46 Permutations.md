# Permutation I

## Description

生成int数组的全部permutation，本题所有元素distinct

## Ideas

以下摘抄自 [blog](http://bangbingsyb.blogspot.com/2014/11/leetcode-gray-code.html)

思路：

刘汝佳7.2 枚举排列，184页


## Solutions

### 递归 

```java
public List<List<Integer>> permute(int[] nums) {
    List<List<Integer>> resList = new ArrayList<>();
    int[] indexCache = new int[nums.length+1]; // cache selected index
    constructPermutation(nums, indexCache, resList,0);
    return resList;
}

public void constructPermutation(int[] nums, int[] cache, List<List<Integer>> res, int cur){
    if(cur == nums.length){
        List<Integer> permutation = new ArrayList<>();
        for(int i = 0; i < cur; i++){
            permutation.add(nums[cache[i]]);
        }
        res.add(permutation);
    }else{
        for(int i = 0; i < nums.length; i++){
            boolean ok = true;
            for(int j = 0; j < cur; j++){
                if(cache[j] == i){
                    ok = false;
                }
            }
            // no one select the current element
            if(ok){
                cache[cur] = i;
                constructPermutation(nums, cache, res, cur+1);
            }
        }
    }
}
```

# Permutation II

## Description

还是生成全排列，但是这次给出的数组可以有数字重复

参看刘汝佳 page 186

坑很多，记得排序

## Solutions

```java 
class Solution {

    public List<List<Integer>> permuteUnique(int[] nums) {
        List<List<Integer>> resList = new ArrayList<>();
        int[] cache = new int[nums.length+1]; // cache selected index
        // sort the array
        Arrays.sort(nums);
        constructPermutation(nums, cache, resList,0);
        return resList;
    }

    public void constructPermutation(int[] nums, int[] cache, List<List<Integer>> res, int cur){
        if(cur == nums.length){
            List<Integer> permutation = new ArrayList<>();
            for(int i = 0; i < cur; i++){
                permutation.add(cache[i]);
            }
            res.add(permutation);
        }else{
            for(int i = 0; i < nums.length; i++){
                if(i == 0 || nums[i]!=nums[i-1]){ // skip duplicate element
                    int c1 = 0;
                    int c2 = 0;
                    for(int j = 0; j < cur; j++){
                        if(cache[j] == nums[i]){
                            c1+=1; 
                        }
                    }
                    for(int j = 0; j < nums.length; j++){
                        if(nums[i] == nums[j]){
                            c2+=1;
                        }
                    }
                    // valid
                    if(c1 < c2){
                        cache[cur] = nums[i];
                        constructPermutation(nums, cache, res, cur+1);
                    }
                }

            }
        }
    }
}
```

# 31 Next Permutation

## Idea

参考的是STL的算法

从后向前查找这个相邻的n1, n2，并且 n1 < n2

重新从后向前，查到到第一个大于 n1 的值， 交换这个货和n1，然后把n2以及后面全部元素逆转顺序

## Solutions

### 自己写的

```java
class Solution {
    public void nextPermutation(int[] nums) {
        if(nums.length < 2){
            return;
        }
        int n1 = nums.length -1;
        int n2 = nums.length;
        boolean succ = false;
        // find the first pair
        for(int i = nums.length-1; i >= 1; i--){
            if(nums[i-1] < nums[i]){
                n1 = i-1;
                n2 = i;
                succ = true;
                break;
            }
        }
        if(succ){
            boolean isFound = false;
            // find the first element that is larger than the n1
            for(int i = nums.length-1; i>=0; i--){
                if(nums[i] > nums[n1]){
                    // swap
                    int tmp = nums[i];
                    nums[i] = nums[n1];
                    nums[n1] = tmp;
                    isFound = true;
                    break;
                }
            }
            if(!isFound){
                Arrays.sort(nums);
            }else{ // reverse all elements after n2
               for(int i = ((n2 + nums.length-1)>>1); i >= n2; i-- ) {
                   int k = nums.length - 1 - i + n2;
                   int val1 = nums[i];
                   int val2 = nums[k];
                   nums[k] = val1;
                   nums[i] = val2;
               }
            }
        }else{
            Arrays.sort(nums);
        }
    }
}
```

### leetcode的

[solution](https://leetcode.com/articles/next-permutation/)

```java
public class Solution {
    public void nextPermutation(int[] nums) {
        int i = nums.length - 2;
        while (i >= 0 && nums[i + 1] <= nums[i]) {
            i--;
        }
        if (i >= 0) {
            int j = nums.length - 1;
            while (j >= 0 && nums[j] <= nums[i]) {
                j--;
            }
            swap(nums, i, j);
        }
        reverse(nums, i + 1);
    }

    private void reverse(int[] nums, int start) {
        int i = start, j = nums.length - 1;
        while (i < j) {
            swap(nums, i, j);
            i++;
            j--;
        }
    }

    private void swap(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
}
```