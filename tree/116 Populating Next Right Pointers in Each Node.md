# Take-away

学到的知识
- 如何找到二叉树当前节点的右兄弟

# Description

给定一棵二叉树，有一个next指针，将它们的每一层链接起来。只能使用常量额外空间，树是一棵完美二叉树。 

# Ideas

第一想法是没提莫的读懂题目...

# Solutions




## 理解题意大法...

参考自：[blog](http://blog.csdn.net/DERRANTCM/article/details/47438089)

```java
/**
 * Definition for binary tree with next pointer.
 * public class TreeLinkNode {
 *     int val;
 *     TreeLinkNode left, right, next;
 *     TreeLinkNode(int x) { val = x; }
 * }
 */
public class Solution {
    public void connect(TreeLinkNode root) {
        TreeLinkNode node = null;
        // start from first layer
        while(root != null && root.left != null){
            node = root;
            while(node != null){
                node.left.next = node.right;
                // if node is not the last node in current layer
                if(node.next != null){
                    node.right.next = node.next.left;
                }
                
                node = node.next;
            }
            // move on to next layer
            root = root.left;    
        }
    }
}
```
