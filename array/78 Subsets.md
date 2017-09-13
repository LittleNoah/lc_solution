# Description

Given a set of distinct integers, nums, return all possible subsets.

Note: The solution set must not contain duplicate subsets

# Ideas

差不多有点懂了刘汝佳的这个递归方法...

我们先排序，其实好像不排序也能做...因为我们用的是下标，只要保证下标有序（废话

# Solutions

## 增量构造法 

解答树有 `2^n`节点，跟子集数量相同

第一次submit没过...因为自己<del>傻逼呵呵</del>加了个冗余的空集，还有递归函数里面的A[pos]更新应该用循环变量

```java
class Solution {
    public List<List<Integer>> subsets(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();
        if(nums.length == 0){
            return res;
        }
        Arrays.sort(nums);
        int[] A= new int[nums.length+1]; // store the selected index
        constructSubset(nums, A, res, 0);
        return res;
    }
    
    // nums should be sorted
    public void constructSubset(int[] nums, int[] A, List<List<Integer>> res, int pos){
        // add every node of the solution tree
        List<Integer> subSetList = new ArrayList<>();
        for(int i = 0; i < pos; i++){
            subSetList.add(nums[A[i]]);
        }
        res.add(subSetList);
        
        // select next possible position
        int s = (pos != 0 ? A[pos-1]+1 : 0);
        // recursively invoke
        for(int j = s; j < nums.length; j++){
            A[pos] = j; // update the lowerest value
            constructSubset(nums, A, res, pos+1);
        }
    }
}
```

## 位向量法

用一个数组来记录要不要加某位，直到递归到最后一位截止 解答树大概 `2^11` 

```java
class Solution {
    public List<List<Integer>> subsets(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();
        if(nums.length == 0){
            return res;
        }
        //Arrays.sort(nums);
        boolean[] A= new boolean[nums.length+1]; // store the selected index
        constructSubset(nums, A, res, 0);
        return res;
    }
    
    // nums should be sorted
    public void constructSubset(int[] nums, boolean[] B, List<List<Integer>> res, int pos){
        // the solution has been constructed
        if(pos == nums.length){
            List<Integer> subSetList = new ArrayList<>();
            for(int i = 0; i < pos; i++){
                if(B[i]){
                    subSetList.add(nums[i]);    
                }
            }
            res.add(subSetList);
            //return
        }else{
            // select currect element
            B[pos] = true;
            // recursively invoke
            constructSubset(nums, B, res, pos+1);
            B[pos] = false; // unselect current position element
            constructSubset(nums, B, res, pos+1);
        }
    
    }
}
```