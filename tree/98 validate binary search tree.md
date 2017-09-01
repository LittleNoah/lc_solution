# Description

__[LeetCode 98](https://leetcode.com/problems/validate-binary-search-tree/description/)__

Title: **Validate Binary Search Tree**

# Ideas

中序遍历判定...

# Solutions

## 递归中序遍历

总觉得这个用实例变量的感觉怪怪的...等下看下别人怎么写的

```java
class Solution {
    
    private TreeNode pre;
    private boolean valid;
    
    public boolean isValidBST(TreeNode root) {
        pre = null;
        valid = true;
        checkValidBST(root);
        return valid;
    }
    
    private void checkValidBST(TreeNode node){
        if(node == null){
            return;
        }
        checkValidBST(node.left);
        if(pre!=null && node.val <= pre.val){
            valid = false;
            return;
        }
        pre = node;
        checkValidBST(node.right);
    }
}
```

## 迭代中序遍历

还是要注意里面那个while循环

```java
public boolean isValidBST(TreeNode root) {

    if(root != null){
        Deque<TreeNode> stack = new ArrayDeque<TreeNode>();
        TreeNode pre = null;
        TreeNode cur = root;
        while(!stack.isEmpty() || cur != null){
            while(cur != null){
                stack.push(cur);
                cur = cur.left;
            }
            cur = stack.pop();
            if(pre != null && cur.val<=pre.val){
                return false;
            }
            pre = cur;
            cur = cur.right;
        }
        return true;
    }else{ // special case
        return true;
    }
}
```