#  606. Construct String from Binary Tree

Tag:

- Easy
- String, Tree
- Hash
- Amazon<del>onCall公司???</del>

Todos:
- ....
- 看官方答案

一句话简介

> 我觉得出题人有病系列，说了空节点返回（），测试用例却要求空字符串

需要注意的是:

- 注意一下测试用例对空树的处理



## Java Solution

### 递归 先序遍历

方法特点：写的太长了有木有啊！！！Java写字符串想自爆啊有木有啊！！！！

```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
public class Solution {
    public String tree2str(TreeNode t) {
        // corner case
        if(null == t){
            return "";
        }
        StringBuilder sb = new StringBuilder();
        char leftP = '(';
        char rightP = ')';
        sb.append(t.val);   // root value
        if(null != t.left){
            sb.append(leftP);   // (
            sb.append(tree2str(t.left));   // left child
            sb.append(rightP);
        }else{
            if(null != t.right){    // if there is a right child(sbling), we must perserve the empty one
                sb.append("()");    
            }
        }

        if(null != t.right){
            sb.append(leftP);
            sb.append(tree2str(t.right));
            sb.append(rightP);
        }
        return sb.toString();
    }
}
```

### 迭代版本

to do...

