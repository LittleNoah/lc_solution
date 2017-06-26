# 63 Unique Paths II

Tag:

- Medium
- Array, Dynamic Programming

Todo List:

- [ ] Problem Description
- [ ] 炒鸡节省空间的法子

## Problem Description

回顾一下Unique Path，小机器人走到右下角的所有路径可能性，现在又多加上了一些obstacle

> To do

## Ideas

idea很简单，初始化两条边的时候，遇到obstacle就初始化为0，计算的时候也是，不写ruby解了



## Java Solutions

**值得注意的是**： `i<=n-1`不是`i<n-1`

### 智慧迭代版本 Solution

代码如下

```java
public class Solution {
    public int uniquePathsWithObstacles(int[][] obstacleGrid) {
        int m = obstacleGrid.length;
        int n = obstacleGrid[0].length;
        int [][]dp = new int[m][n];
        for(int i = 0; i<=m-1; i++){
            // check if obstacles exist in this line
            if(1 == obstacleGrid[i][0]){
                break;
            }
            dp[i][0] = 1;
        }
        for(int j = 0; j<=n-1; j++){
            if(1 == obstacleGrid[0][j]){
                break;
            }
            dp[0][j] = 1;
        }
        for(int i = 1; i<=m-1;i++){
            for(int j = 1; j<=n-1;j++){
                if(1 == obstacleGrid[i][j]){
                    dp[i][j] = 0;
                }else{
                    dp[i][j] = dp[i-1][j] + dp[i][j-1];    
                }
            }
        }
        return dp[m-1][n-1];
    }

}
```

