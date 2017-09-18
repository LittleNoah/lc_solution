# Description

本题要求找出二叉树的叶子节点，并且输出为list，然后remove所有叶子节点，然后Repeat这个过程直到树为空

学到的知识：

1. 半线性结构的数据结构，一般来说我们通过转化为线性结构来解决，而这种转化的方法就是遍历(traverse)
2. `Collections.emptyList()` 是个好方法， 具体源码需要看
3. `Arrays.asList()`只需要传普通数值就可以使用，不一定必须要数组的，例如: `Arrays.asList(2)`

# Ideas

第一个要解决的就如何找到leaves, 用递归就解决了，后序遍历递归

# Solutions

## 递归后序



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
    public List<List<Integer>> findLeaves(TreeNode root) {
        if(root == null){
            return Collections.emptyList();
        }
        List<List<Integer>> resList = new ArrayList<>();
        while(!isLeaf(root)){
            resList.add(getLeaves(root));
        }
        // do not forget root
        
        resList.add(Arrays.asList(root.val));
        
        return resList;
    }
    
    private List<Integer> getLeaves(TreeNode root){
        if(root == null){
            return Collections.emptyList();
        }
        List<Integer> list = new ArrayList<>();
        if(isLeaf(root.left)){
            list.add(root.left.val);
            //delete
            root.left = null;
        }else{
            List<Integer> leftLeaves = getLeaves(root.left);
            list.addAll(leftLeaves);
        }
        if(isLeaf(root.right)){
            list.add(root.right.val);
            root.right = null;
        }else{
            List<Integer> rightLeaves = getLeaves(root.right);
            list.addAll(rightLeaves);
        }
        return list;
    }
    
    private boolean isLeaf(TreeNode node){
        return (node!=null && node.left==null && node.right==null);
    }
}
```



# Follow-up

下面这个有一个奇怪的index解法，不太喜欢

https://segmentfault.com/a/1190000005938045

https://discuss.leetcode.com/topic/49194/10-lines-simple-java-solution-using-recursion-with-explanation