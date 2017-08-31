# Introduction

Todos:

- 后序遍历
- 中序遍历相关题
- 先序遍历相关题
- 层序遍历
- 后序遍历相关题

二叉树的遍历包括前序、中序、后序、层序，注意这里前面三个指的都是遍历根的时机

前序是先根遍历，后序是后根遍历，以此类推



# Common Traversal

参考自[左程云的书](https://book.douban.com/subject/26638586/)

## Recursive 

递归可以说非常非常直观了...大二上水平...

### Pre-Order 

[leetcode 144](https://leetcode.com/problems/binary-tree-preorder-traversal/description/)

先处理node，再处理子节点

```java
public void preOrderRecursive(TreeNode node){
    if(null == node){
        return;
    }
    res.add(node.val); // do some opertation
    preOrderRecursive(node.left);
    preOrderRecursive(node.right);
}
```

### In-Order

```java
public void inOrderRecursive(TreeNode node, List<Integer> list){
    if(node == null){
        return;
    }
    inOrderRecursive(node.left, list);
    list.add(node.val);
    inOrderRecursive(node.right, list);
}
```

### Post-Order

```java
public void postOrderRecursive(TreeNode node, List<Integer> list){
    if(node == null){
        return;
    }
    postOrderRecursive(node.left, list);
    postOrderRecursive(node.right, list);
    list.add(node.val);
}
```

## Iteritive

### Pre-Order

思路：用栈来模拟递归堆栈的情况，注意这里要判断根是否为空

```java
public void preOrderIter(TreeNode root){
    Deque<TreeNode> stack = new ArrayDeque<>();
    // enter-stack the root
    stack.push(root);
    TreeNode cur  = null;
    while(stack.size() != 0){
        cur = stack.pop();
        res.add(cur.val);
        if(cur.right != null){
            stack.push(cur.right);
        }
        if(cur.left != null){
            stack.push(cur.left);
        }
    }
}
```

### In-Order

**值得学习**: 记住这个while的写法

```java
public void inOrderIterative(TreeNode root, List<Integer> list){
    // construct stack
    if(root == null){
        return;
    }
    Deque<TreeNode> stack = new ArrayDeque<>();
    TreeNode cur = root;
    while(stack.size() != 0 || cur != null){
        // push all left-most nodes into stack
        if(cur != null){
            stack.push(cur);
            cur = cur.left;
        }else{  // now cur is the leftmost child, deal with it and en-stack its right child
            cur = stack.pop();
            list.add(cur.val);
            cur = cur.right;
        }
    }

}
```

循环里也可以这么写:

```java
    while(stack.size() != 0 || cur != null){
        // push all left-most nodes into stack
        while(cur != null){
            stack.push(cur);
            cur = cur.left;
        }
        // now cur is the leftmost child, deal with it and en-stack its right child
        cur = stack.pop();
        list.add(cur.val);
        cur = cur.right;

    }
```

### Post-Order

Post-Order相对前两种来说比较复杂，我们要保证对每一个子树遍历完左右节点之后再处理根节点，一般来说有两种做法，采用双栈或单栈

#### Two Stacks Post-Order Traversal

双栈的思想在于：按照反向的顺序压入第二个栈

```java
private void postOrderIter(TreeNode root, List<Integer> list){
    if(root == null){
        return;
    }
    Deque<TreeNode> stack1 = new ArrayDeque<>(20);
    Deque<TreeNode> stack2 = new ArrayDeque<>(20);
    // en-stack root
    TreeNode head = root;
    stack1.push(root);
    // put all elements in a post-order in second stack
    while(!stack1.isEmpty()){
        head = stack1.pop();
        stack2.push(head);
        if(head.left != null){
            stack1.push(head.left);
        }
        if(head.right != null){
            stack1.push(head.right);
        }
    }
    // pop all nodes in stack 2, which follows the post order
    while(!stack2.isEmpty()){
        list.add(stack2.pop().val);
    }
}
```

#### Single Stack Post-Order Traversal


## Other Methods

### Morris Traversal for InOrder Traversal

123123231

# Level-order Traversal


# Reference

![Page1](images/tree_traversal_1.png "Page1")
![Page2](images/tree_traversal_2.png "Page2")
![Page3](images/tree_traversal_3.png "Page3")
![Page4](images/tree_traversal_4.png "Page4")