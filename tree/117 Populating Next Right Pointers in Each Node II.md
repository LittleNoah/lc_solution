# Description

这一题和上一次差不多，只不过告诉我们二叉树可以是任一形状的了

# Ideas

因为是任意形状的二叉树，我们就无法对其进行估计了

但是我们还是采用上一题的思路，达到只用O(Constant)的extra space完成

思路如下

- 使用一个虚拟头指针vhead，用来指向每一层这个`next->`链表的起始结点
- 使用一个指针pre作为遍历的主力，一开始pre会被初始化到vhead的位置
- 让root负责表示上一层正在使用的结点（有点拗口），就是说我们正在下一层链接这个链表，使用的上一层的root.left来源
- 算法开始的时候root就是树的root
- 然后让pre.next指向下一个该指向的node,可能是root.left，也可能是root.right我们只需要按序写就好
- 然后上一层的当前节点就算遍历完了，让上一层的当前节点指向下一层，重复这个操作
- 当上一层的全部遍历完毕之后
- 我们把pre置回vhead, 此时vhead.next指向的是当前层的第一个节点
- 令root指向vhead.next
- vhead.next清空
- 利用root开始下一层


# Solutions

## 虚拟头指针按层法

```java
public void connect(TreeLinkNode root) {
    TreeLinkNode vhead = new TreeLinkNode(0);
    TreeLinkNode pre = vhead;
    // root 指向每层结点的开始结点，然后不断调用next, next是在上一层中我们用pre构造好的，vhead用来标记上一层的起始点
    while(root != null){
        if(root.left != null){
            pre.next = root.left;
            pre = pre.next;
        }
        if(root.right != null){
            pre.next = root.right;
            pre = pre.next;
        }
        root = root.next;
        //当前层的最后一个节点，就链接下一层的第一个结点
        if(root == null){
            pre = vhead;
            root = vhead.next;
            vhead.next = null;
        }
    }
}
```