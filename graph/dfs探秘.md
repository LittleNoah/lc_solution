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

# next interesting problem