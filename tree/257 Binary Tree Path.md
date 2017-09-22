# Description

<del>看来我已经对二叉树中DFS回溯举重若轻了</del>（滑稽

# Ideas

就是递归+回溯

# Solutions

## Backtracking

```java
class Solution {
    public List<String> binaryTreePaths(TreeNode root) {
        List<String> path = new ArrayList<>();
        Set<String> set = new HashSet<>();
        buildPaths(root, path, set);
        List<String> list = new ArrayList<>(set);
        return list;
    }
    
    private void buildPaths(TreeNode node, List<String> path, Set<String> resSet){
        // recursive base
        if(node == null){
            return;
        }
        path.add(""+node.val);
        if(node.left == null && node.right == null){ // the final path
            // two versions joiner
            String curPath = path.stream()
                                 .collect(Collectors.joining("->"));
            resSet.add(curPath);
        }else{
            buildPaths(node.left, path, resSet);
            buildPaths(node.right, path, resSet);
        }
        path.remove(path.size() - 1);
        
    }
}
```

## 抄来的，下次试下

```java
public List<String> binaryTreePaths(TreeNode root) {
    List<String> answer = new ArrayList<String>();
    if (root != null) searchBT(root, "", answer);
    return answer;
}
private void searchBT(TreeNode root, String path, List<String> answer) {
    if (root.left == null && root.right == null) answer.add(path + root.val);
    if (root.left != null) searchBT(root.left, path + root.val + "->", answer);
    if (root.right != null) searchBT(root.right, path + root.val + "->", answer);
}
```

# 碎碎念

DFS + 回溯

学到：
1. StringJoiner的用法
2. stream join的用法
3. 对数字->字符串 一定要慎重考虑是否有超过个位数/负数

值得思索的是是否存在冗余重复项导致list不对

痛点：
1. 每棵树的val值，不一定是个位数字，所以我们就不能TMD直接回溯一位
2. 还有个SB的“->”导致回溯困难