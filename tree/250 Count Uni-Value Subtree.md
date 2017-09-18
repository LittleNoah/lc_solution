# Description

这题要找出一棵树中，所有value都相同的子树的个数

学到的知识：

1. 大胆的用递归/DFS吧
2. 

Tags:

- Tree
- 
- 

# Ideas

第一个哥们写的解析有点混乱，简书上这个同学就不错 [简书](http://www.jianshu.com/p/dd4041854022)

# Solutions

## Solution 1

```java
class Solution {
    private int count = 0;
    public int countUnivalSubtrees(TreeNode root) {
        dfs(root);
        return count;
    }
    
    private boolean dfs(TreeNode root){
        if(root == null){
            return true;
        }
        boolean left = dfs(root.left);
        boolean right = dfs(root.right);
        if(left && right){
            if(root.left != null && root.val != root.left.val){ return false; }
            if(root.right != null && root.val != root.right.val){ return false; }
            count += 1;
            return true;
        }
        return false;
    }
}
```


# Follow-up

