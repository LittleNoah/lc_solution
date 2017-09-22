# Info and Notes

Title: 113 Path Sum II

主要要学习的是这个回溯的过程对复用的这个货list的处理

Tags:

- Tree
- DFS

# Problem Description

二叉树，从root到leaf的路径，有没有sum是某个Target的，要求返回所有满足条件的路径

# Ideas

递归+回溯：当遇到完美条件或者不符合条件之后，我们pop当前访问的节点，返回上一层

参考这两个

http://www.cnblogs.com/yrbbest/p/4437329.html

http://www.cnblogs.com/grandyang/p/4042156.html

一个更简洁的[代码写法](http://blog.csdn.net/happyaaaaaaaaaaa/article/details/51636652)


# Solutions

## DFS-Explore Backtracking

```java
class Solution {
    public List<List<Integer>> pathSum(TreeNode root, int sum) {
        List<List<Integer>> resList = new ArrayList<>();
        List<Integer> path = new ArrayList<>(15);
        explore(root, sum, path, resList);
        return resList;
    }
    // list is current path containing all nodes in this path
    private void explore(TreeNode root, int curTarget, List<Integer> curPath, List<List<Integer>> resList){
        if(root == null){
            return;
        }
        curPath.add(root.val);
        if(root.left == null && root.right == null && root.val == curTarget){
            resList.add(new ArrayList<>(curPath));
            // backtracking to upper level in this tree, so we remove current node and try to explore another
            curPath.remove(curPath.size() - 1);  
            return;
        }else{
            explore(root.left, curTarget - root.val, curPath, resList);
            explore(root.right, curTarget - root.val, curPath, resList);
            // if current node(parameter root) is not the right one, we need to delete it and go upper
            curPath.remove(curPath.size() - 1);
        }
    }
}
```

## 抄袭的简洁写法 二刷参考

```java
public class Solution {  
    public List<List<Integer>> pathSum(TreeNode root, int sum) {  
        List<List<Integer>> res = new ArrayList<List<Integer>>();  
        if(root == null) return res;  
        List<Integer> temp = new ArrayList<Integer>();  
        dfs(root, res, temp, sum);  
        return res;  
    }  
    private void dfs(TreeNode root, List<List<Integer>> res, List<Integer> temp, int sum) {  
        temp.add(root.val);  
        sum -= root.val;  
        if(root.left == null && root.right == null && sum == 0){ //递归结束条件  
            res.add(new ArrayList<>(temp));  //满足路径和等于 sum，添加到结果集中去            
        }
        if(root.left != null) dfs(root.left, res, temp, sum);  
        if(root.right != null) dfs(root.right, res, temp, sum);  
        temp.remove(temp.size()-1);  //回溯  
    }  
}  
```