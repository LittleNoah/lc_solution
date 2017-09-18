# Description

本题是做完**110 Banlanced Binary Tree**的后序题，用来做一些height的题

本题要求:

Given a binary tree, find its maximum depth.

The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

学到的知识：

1. 如何检查拓扑结构
2. 

Tags:

- Amazon
- Level-Order Traverse
- 左程云: Tree 拓扑结构

# Ideas

第一感觉是用递归，BFS搜索出与根节点相同的，然后挨个check是否拓扑结构相同...但是这题其实比左程云的书里那个第一题容易，因为要求是exactly相同比较好判断


# Solutions

## 递归层序


```java

public boolean isSubtree(TreeNode s, TreeNode t) {
    if(s == null && t == null){
        return true;
    }else if(s == null){
        return true;
    }else if(t == null){
        return false;
    }
    Queue<TreeNode> q = new ArrayDeque<>(15);
    q.offer(s);
    //BFS level-order
    while(!q.isEmpty()){
        TreeNode cur = q.poll();
        
        if(checkTopStructure(cur, t)){
            return true;
        }
        if(cur.left != null){
            q.offer(cur.left);
        }
        if(cur.right != null){
            q.offer(cur.right);
        }
    }
    return false;
}

private boolean checkTopStructure(TreeNode r1, TreeNode r2){
    if(r1 == null && r2 == null){
        return true;
    }else if(r1 == null || r2 == null || r1.val != r2.val){
        return false;
    }else{
        boolean leftCheck = checkTopStructure(r1.left, r2.left);
        boolean rightCheck = checkTopStructure(r1.right, r2.right);
        return (leftCheck && rightCheck);
    }
}
```


# Follow-up

