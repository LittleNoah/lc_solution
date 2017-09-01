# Introduction

二叉树序列化、反序列化问题

Todos:

- ....

二叉树的遍历包括前序、中序、后序、层序，注意这里前面三个指的都是遍历根的时机

前序是先根遍历，后序是后根遍历，以此类推



# Common Methods

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


# Reference

![Page1](images/tree_serial_1.png "Page1")
![Page2](images/tree_serial_2.png "Page2")
![Page3](images/tree_serial_3.png "Page3")
![Page4](images/tree_serial_4.png "Page4")