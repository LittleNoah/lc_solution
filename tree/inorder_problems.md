中序遍历相关题目

# 230 Kth Smallest Element in a BST

本题不算follow-up的话直接中序遍历结束

follow-up要求考虑频繁插入修改BST的情况

一刷解法:

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
class Solution {
    public int kthSmallest(TreeNode root, int k) {
        Deque<TreeNode> stack = new ArrayDeque<>();
        TreeNode cur = root;
        stack.push(cur);
        int counter = 0;
        while(!stack.isEmpty() || cur != null){
            while(cur!=null){
                stack.push(cur);
                cur = cur.left;
            }
            cur = stack.pop(); // current smallest node
            counter += 1;
            if(counter == k){
                return cur.val;
            }
            cur = cur.right;
        }
        return -1;
    }
}
```

follow-up是用二分法，二分法还是不太会...等做了几道题回头做这个再

...不好意思，上面那个蒻鸟已经被干掉了，看懂两个这个做法

```java
class Solution {
    public int kthSmallest(TreeNode root, int k) {
        if(root == null){
            return -1;
        }
        int leftNum = countNodeNum(root.left);
        if(leftNum == k-1){
            return root.val;
        }else if(leftNum < k){
            return kthSmallest(root.right, k-1-leftNum);
        }else{
            return kthSmallest(root.left, k);
        }
        
    }
    
    public int countNodeNum(TreeNode node){
        if(node == null){
            return 0;
        }
        
        return 1+countNodeNum(node.left)+countNodeNum(node.right);
    }
    
    
}
```

# 671. Second Minimum Node In a Binary Tree

DFS或者BFS

DFS多

注意到corner case, 根节点为1，可以一直创建子树值为1的...

## DFS Solution

```java
class Solution {
    public int findSecondMinimumValue(TreeNode root) {
        Set<Integer> set = new TreeSet<>();
        dfs(root,set);
        if(set.size() < 2){ // no second minimum node
            return -1;
        }else{
            int count = 0;
            for(int num : set){
                count += 1;
                if(count == 2){
                    return num;
                }
            }
            return -1;
        }
    }
    
    public void dfs(TreeNode node, Set<Integer> set){
        if(node == null){
            return ;
        }
        set.add(node.val);
        dfs(node.left, set);
        dfs(node.right, set);
    }
}
```

