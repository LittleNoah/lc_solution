# Description

本题是做完**110 Banlanced Binary Tree**的后序题，用来做一些height的题

本题要求:

Given a binary tree, find its maximum depth.

The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

学到的知识：

1. 
2. 

Tags:

- Amazon
- Post-Order Traverse
- 左程云

# Ideas

递归求每个子树是否valid，一旦有一个不valid我们就返回，利用的是递归求深度的算法

感觉完全和110的代码一样，只是不需要判断

**还有一点不同**： 初始化的时候不能像110那题初始化为1，最后的结果是不对的，其实应该初始化为0

# Solutions

## 递归后序


```java
class Solution {
    public int maxDepth(TreeNode root) {
        if(root == null){
            return 0;
        }
        int res = getHeight(root, 0);
        return res;
    }
    
    private int getHeight(TreeNode root, int level){
        // recursive base
        if(root == null){
            return level;
        }
        int leftHeight = getHeight(root.left, level+1);
        int rightHeight = getHeight(root.right, level+1);
        return Math.max(leftHeight, rightHeight);
    }
}
```


# Follow-up

这题和各种求height的有关系，接下来我们把求height的都做一遍

