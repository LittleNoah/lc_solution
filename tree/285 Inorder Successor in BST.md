# Description

__[LeetCode 285](https://leetcode.com/problems/inorder-successor-in-bst/description/)__

Title: **Inorder Successor in BST**

# Ideas

看了半天BST的性质，都需要知道每个节点的parent啊...看下大神们的博客怎么写的吧



# Solutions

## Discussion Solution

其实就是用BST性质做的，从root开始比较，判断successor在哪头啊

```
举个栗子：root大说明在左子树啊，root是可能后继中最后一个
于是我们就往左边跑一位，比较当前节点啊，左右移动

```

```java
public TreeNode inorderSuccessor(TreeNode root, TreeNode p) {
    if(root == null || p == null){
        return null;
    }
    
    TreeNode successor = null;
    TreeNode cur = root;
    // find the right successor
    while(cur != null){
        if(cur.val > p.val){
            successor = cur;
            cur = cur.left;
        }else{
            cur = cur.right;
        }
    }
    return successor;
}
```