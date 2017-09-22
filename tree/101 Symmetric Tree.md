# Description

给出一颗Binary Tree,要求check是否他是自己的mirror

# Ideas

直观的递归，递归检查是否`tree1.left`和`tree2.right`，还有另外一对见代码

# Solutions

```java
public boolean isSymmetric(TreeNode root) {
    if(root == null){
        return true;
    }else{
        return isMirrorTree(root.left, root.right);
    }
}

public boolean isMirrorTree(TreeNode n1, TreeNode n2){
    if(n1 == null && n2 == null){
        return true;
    }else if(n1 == null || n2 == null || n1.val != n2.val){
        return false;
    }else{
        boolean left = isMirrorTree(n1.left, n2.right);
        boolean right = isMirrorTree(n1.right, n2.left);
        return (left&&right);
    }
}
```