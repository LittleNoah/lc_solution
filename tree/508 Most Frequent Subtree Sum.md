# Description

 Given the root of a tree, you are asked to find the most frequent subtree sum. The subtree sum of a node is defined as the sum of all the node values formed by the subtree rooted at that node (including the node itself). So what is the most frequent subtree sum value? If there is a tie, return all the values with the highest frequency in any order. 

简而言之：找子树的sum的频率,如果子树的Sum的频率相同，那么一起输出好了（无序）

学到的知识：

1. 利用keySet遍历`HashMap`
2. 遇到要求求map中最大value不要慌，遍历一下就好了
3. `list.toArray(array)`只能用于Object Array不能用在primitive类型上

Tags:

- Tree
- 
- 

# Ideas

自己直接写代码解出来的（其实也不是）


# Solutions

## Solution 1


```java
public int[] findFrequentTreeSum(TreeNode root) {

    int[] maxCount = new int[1];
    maxCount[0] = 0;
    Map<Integer, Integer> sumToCount = new HashMap<>();
    postOrderCount(root, maxCount, sumToCount);
    List<Integer> resList = new ArrayList<>();
    for(int key : sumToCount.keySet()){
        if(sumToCount.get(key) == maxCount[0]){
            resList.add(key);
        }
    }
    // int[] resArray = resList.stream().toArray(int[]::new);
    int[] resArray = new int[resList.size()];
    int i = 0;
    for(int sum : resList){
        resArray[i] = sum;
        i++;
    }
    return resArray;
}

// maxCount[1] 
private int postOrderCount(TreeNode root, int[] maxCount, Map<Integer, Integer> sumToCount){
    if(root == null){
        return 0;
    }

    int left = postOrderCount(root.left, maxCount, sumToCount);
    int right = postOrderCount(root.right, maxCount, sumToCount);
    int sum = root.val + left + right;
    int count = sumToCount.getOrDefault(sum, 0) + 1;
    sumToCount.put(sum, count);
    // update maxCount
    maxCount[0] = count > maxCount[0] ? count : maxCount[0];

    return sum;
}
```


# Follow-up

