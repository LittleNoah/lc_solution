# Descirption

假设你人站在一个Binary Tree的右侧，问你能看到的节点。。。

# Ideas

就是遍历一下，递归后序，只不过我们先遍历右节点而已


# Solutions

## Post-Order Recursive

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
    public List<Integer> rightSideView(TreeNode root) {
        List<Integer> resList = new ArrayList<>();
        rightView(root, resList, 0);
        return resList;
    }
    
    public void rightView(TreeNode node, List<Integer> resList, int curLevel){
        if(node == null){
            return;
        }
        if(curLevel == resList.size()){
            resList.add(node.val);
        }
        // right children first
        rightView(node.right, resList, curLevel+1);
        rightView(node.left, resList, curLevel+1);
    }
}
```