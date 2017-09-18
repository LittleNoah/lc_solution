# Description

本题要求找出二叉树的叶子节点，并且输出为list，然后remove所有叶子节点，然后Repeat这个过程直到树为空

学到的知识：

1. 怎么求深度
2. 利用传递`boolean[]`来当做判定参数
3. 找出一堆深度的题

Tags:

- Amazon
- Post-Order Traverse
- 左程云: _判断二叉树是否为平衡二叉树_

# Ideas

递归求每个子树是否valid，一旦有一个不valid我们就返回，利用的是递归求深度的算法

# Solutions

## 递归后序


```java
public boolean isBalanced(TreeNode root) {
    boolean[] res = new boolean[1];
    res[0] = true;
    getHeight(root, 1, res);
    return res[0];
}

public int getHeight(TreeNode head, int level, boolean[] res){
    if(head == null){
        return level;
    }
    int leftHeight = getHeight(head.left, level+1, res);
    if(! res[0]){
        return level;
    }
    int rightHeight = getHeight(head.right, level + 1, res);
    if(! res[0]){
        return level;
    }
    if(Math.abs(leftHeight - rightHeight) > 1){
        res[0] = false;
    }
    return Math.max(leftHeight, rightHeight);
}
```


# Follow-up

这题和各种求height的有关系，接下来我们把求height的都做一遍

