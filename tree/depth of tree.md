# Introduction

从LC  110. Balanced Binary Tree 到  104. Maximum Depth of Binary Tree，都有利用depth或者height的方法，这里把code snippet写下来

# 二叉树高度（结点数量）

这里说的height，指的是104里面提到的

> The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

也就是说，跟路径经过的结点数量有关，root根节点的高度/depth为1

递归代码如下：

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

注意这里我们初始化为0才能满足104题的要求...不然root的深度会被计算为2


# 二叉树高度（树干长度）