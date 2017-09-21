# Info and Notes

Title: 112 Path Sum

Tags:

- Tree
- BFS

# Problem Description

二叉树，从root到leaf的路径，有没有sum是某个Target的

# Ideas

简单的递归，用的是DFS的Explore算法部分

# Solutions

## DFS-Explore

```java
class Solution {
    public boolean hasPathSum(TreeNode root, int sum) {
        if(root == null){
            return false;
        }
        boolean[] succ = new boolean[1];
        explore(root, sum, 0, succ);
        return succ[0];
    }
    //本题如果限定全是正数的话，我们就可以剪枝，但是实际上负数节点也可能存在所以我们鸟悄的不减了
    private void explore(TreeNode node, int target, int prevSum, boolean[] succ){
        if(node == null || succ[0]){ // base
            return;
        }
        int tmpSum = prevSum + node.val;
        if(tmpSum == target && node.left == null && node.right == null){
            succ[0] = true;
            return;
        }else{
            explore(node.left, target, tmpSum, succ);
            explore(node.right, target, tmpSum, succ);
        }
    }
    
}
```