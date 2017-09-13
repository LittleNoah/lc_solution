
# Ideas

Three Sum问题可以看做Two Sum进阶版

我们可以通过转化3 Sum为Two Sum

Todos:
- Three Sum Smaller Binary Search 版本

## Three Sum

```java
class Solution {
    public List<List<Integer>> threeSum(int[] nums) {

        // corner case
        List<List<Integer>> list = new ArrayList<>();
        if(nums.length < 3){
            //throw new IllegalArgumentException("Error: nums array is too small");
            return list;
        }
        // sort
        Arrays.sort(nums);
        // loop through the first element
        for(int i = 0; i < nums.length-2; i++){
            if(i==0 || nums[i]!=nums[i-1]){ // skip duplicate first element
                findTwoSum(nums, i, i+1, nums.length-1, -1*nums[i], list);
            }
        }
        return list;
    }

    public void findTwoSum(int[] arr, int first, int left, int right, int target, List<List<Integer>> resList){
        while(left < right){
            int sum = arr[left] + arr[right];
            if(sum < target){
                left+=1;
            }else if(sum > target){
                right-=1;
            }else{ // equal
                if(left == first+1 || arr[left]!=arr[left-1]){
                    List<Integer> tmpList = new ArrayList<>();
                    Collections.addAll(tmpList, arr[first], arr[left], arr[right]);
                    resList.add(tmpList);
                }
                left+=1;
                right-=1;
            }

        }
    }
}
```

*快速跳过duplicate可以参考* [blog](http://bangbingsyb.blogspot.com/2014/11/leetcode-3sum.html)

## Three Sum Smaller

第一种解法思想来自于[blog](https://dyang2016.wordpress.com/2016/10/10/259-3sum-smaller/)，`right-left`就是需要的个数

__坑：主要在于不需要去重__

```java
public int threeSumSmaller(int[] nums, int target) {
    if(nums.length < 3){
        return 0;
    }
    Arrays.sort(nums);
    int counter = 0;
    for(int i = 0; i<nums.length-2; i++){
        int left = i+1;
        int right = nums.length-1;
        while(left < right){
            int sum = nums[left] + nums[right] + nums[i];
            if(sum < target){
                counter += (right-left);
                left += 1;
            }else{
                right-=1;
            }
        }
    }
    return counter;
}
```

## Three Sum Closest



未优化版本

```java
public int threeSumClosest(int[] nums, int target) {
    if(nums.length < 3){ // corner case
        return 0;
    }
    Arrays.sort(nums);
    int minDistance = Integer.MAX_VALUE;
    int minSum = Integer.MAX_VALUE;
    for(int k = 0; k < nums.length-2; k++){
        int left = k+1;
        int right = nums.length -1;
        while(left < right){
            int tmp = nums[k] + nums[left] + nums[right];
            if(tmp < target){
                int tmpDist = Math.abs(tmp-target);
                if(tmpDist < minDistance){
                    minDistance = tmpDist;
                    minSum = tmp;
                }
                left += 1;
            }else if(tmp > target){
                int tmpDist = Math.abs(tmp-target);
                if(tmpDist < minDistance){
                    minDistance = tmpDist;
                    minSum = tmp;
                }
                right -= 1;
            }else{
                return target; 
            }
        }
    }
    return minSum;
}
```