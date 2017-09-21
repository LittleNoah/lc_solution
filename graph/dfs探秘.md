# Introduction

啊，学会了图（滑稽，秀一手技术（只会最简单的DFS

# Base

# 100 Same Tree

## Ideas

递归，判断，一气呵成，对子树的判断隐喻在下一层递归调用中

## Solutions

### 递归DFS

```java
class Solution {
    public boolean isSameTree(TreeNode p, TreeNode q) {
        return checkSameTree(p, q);
    }
    
    public boolean checkSameTree(TreeNode n1, TreeNode n2){
        if(n1 == null && n2 == null){ // both is null
            return true; 
        }else if(n1 == null || n2 == null){ // either one is null
            return false;
        }else if( n1.val != n2.val){ // value 
            return false;
        }else{
            boolean succ = (checkSameTree(n1.left, n2.left) && checkSameTree(n1.right, n2.right));
            return succ;
        }
    }
}
```

# 339. Nested List Weight Sum 

## Description

## Ideas

就是递归，和二叉树高度几乎一样，只不过要利用他给的API来判断下

学习到了如何用`Java Lambda`表达式来求sum

```java
  list.stream()
      .mapToInt(node -> somefucn(n))
      .sum();
```

## Solutions

### Recusive Approach

```java
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * public interface NestedInteger {
 *
 *     // @return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public boolean isInteger();
 *
 *     // @return the single integer that this NestedInteger holds, if it holds a single integer
 *     // Return null if this NestedInteger holds a nested list
 *     public Integer getInteger();
 *
 *     // @return the nested list that this NestedInteger holds, if it holds a nested list
 *     // Return null if this NestedInteger holds a single integer
 *     public List<NestedInteger> getList();
 * }
 */
public class Solution {
    public int depthSum(List<NestedInteger> nestedList) {
        // 使用lambda需谨慎，leetcode对java 8 lambda判定十分之慢
        int res = nestedList.parallelStream()
                            .mapToInt(node -> calcSum(node, 1))
                            .sum();
        return res;
    }
    
    private int calcSum(NestedInteger node, int height){
        if(node == null){
            return 0;
        }
        int sum = 0;
        if(node.isInteger()){
            sum += node.getInteger() * height;
        }else{
            List<NestedInteger> list = node.getList();
            for(NestedInteger element : list){
                sum += calcSum(element, height+1);
            }
        }
        return sum;
    }
}
```


# 364. Nested List Weight Sum II

## Description

这题是上一题的变性啦，区别如下：

>  now the weight is defined from bottom up. i.e., the leaf level integers have weight 1, and the root level integers have the largest weight.

也就是说

## Ideas

有好几个Idea吧大概

1. two-round DFS求出深度
2. one-round BFS？（不知道怎么搞
3. 反复横跳大法，缓存需要层层累加的值，反复累加到最后一层

## Solutions

### 秘技·反复横跳

```java
public int depthSumInverse(List<NestedInteger> nestedList) {
    int sum = 0;
    int prevSum = 0;
    List<NestedInteger> curLevel = nestedList;
    while(! curLevel.isEmpty()){
        List<NestedInteger> nextLevel = new ArrayList<NestedInteger>(15);
        for(NestedInteger node : curLevel){
            if(node.isInteger()){
                prevSum += node.getInteger();
            }else{
                nextLevel.addAll(node.getList());
            }
        }
        sum += prevSum;
        curLevel = nextLevel;
    }
    return sum;
}
```

#  565. Array Nesting

## Description

给出一个Array，要求找出这样的Set的最长长度，Set里面的元素都可以作为下标访问到另一个同set的元素

## Ideas

就是DFS啦

```ruby
int maxlen
for unvisited node in Set(InputArray)
  explore
```

因为这题太简单，所以就不写explore方法了，省的传参麻烦

主要注意一下这个边界条件的判定，感觉可能因为数组越界出点篓子

## Solutions

### DFS

39ms

```java
public int arrayNesting(int[] nums) {
    if(nums.length == 0){
        return 0;
    }
    int maxLen = 0;
    boolean[] visited = new boolean[nums.length];
    // dfs
    for(int i = 0; i < nums.length; i++){
        if(!visited[i]){
            int tmpLen = 1;
            visited[i] = true;
            int start = nums[i];
            while(start >=0 && start <nums.length && !visited[start]){ // valid case and not visited
                visited[start] = true;
                tmpLen += 1;
                start = nums[start];
            }
            // update maxLen
            maxLen = tmpLen > maxLen ? tmpLen : maxLen;
        }
    }
    return maxLen;
}
```

# 108 Convert Sorted Array to Binary Search Tree (CK)

https://www.tianmaying.com/tutorial/LC108


自愧不如，做的巨烂无比

```java
public TreeNode sortedArrayToBST(int[] nums) {
    if(nums.length == 0){
        return null;
    }else if(nums.length == 1){
        return new TreeNode(nums[0]);
    }
    // construct
    TreeNode root = constructBST(nums, 0, nums.length-1);
    return root;
}

private TreeNode constructBST(int[] nums, int start, int end){
    int n = end - start + 1;
    if(n <= 0){
        return null;
    }

    int mid = n/2;
    TreeNode root = new TreeNode(nums[start + mid]);
    root.left = constructBST(nums, start, start + mid -1);
    root.right = constructBST(nums, start + mid + 1, end);

    return root;
}
```


# 124 Binary Tree Maxmium Path Sum

Difficulty:Hard

## Descirption

给出一个二叉树，每个节点都有一个值，然后让我们找出一条path，使得这个path通过的节点val和最大

## Ideas

那么，我最开始的想法呢，是非常naive的，我想通过层序遍历二叉树来构造一个图，再利用DFS求connectivity的方法求出来最大的sum(某个connected componentd的sum)

可以预想到，这个方法开销是非常大的

然后通过[blog](http://www.jianshu.com/p/c3e81355831d),了解到了正确的打开方式,这道题说实在的这个idea挺难想的，但是代码不难写

这个方法就是，我们求三个单路（只能往下走左或者右），对左右子树分别求，然后最后我们有三种选择，选左子树的结果或者右子树，或者加上root

具体代码参考了另外一个[大佬](http://www.cnblogs.com/yrbbest/p/4438479.html)


## Solutions 

```java
class Solution {
    private int maxSum;
    public int maxPathSum(TreeNode root) {
        maxSum = Integer.MIN_VALUE;
        helper(root);
        return maxSum;
    }
    
    private int helper(TreeNode root){
        if(root == null){
            return 0;
        }
        int left = Math.max(helper(root.left), 0);
        int right = Math.max(helper(root.right), 0);
        maxSum = Math.max(maxSum, root.val + left + right);
        return root.val + Math.max(left, right);
    }
}
```


# Next DFS

到此为止。。。太长了这个文件