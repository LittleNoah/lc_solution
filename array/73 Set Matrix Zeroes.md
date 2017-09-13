# Description

如果数组里某个元素是0，将该元素所在行和所在列都置为0， 要求in-place

Follow up:

- Did you use extra space?
- A straight forward solution using O(mn) space is probably a bad idea.
- A simple improvement uses O(m + n) space, but still not the best solution.
- Could you devise a constant space solution?


# Ideas

这题主要就难在in-place，想不出来怎么做

看一下大家的解法

一种是用O(m+n)的space,也就是说记录下要清除的行号和列号，然后清除

题目要求constant space solution...我们可以用第0行记录某行是否需要清零，第0列记录某列是否需要清零

# Code Solutions

## O(m+n)

第一次submit没过...因为corner case 处理有问题

```java
class Solution {
    public void setZeroes(int[][] matrix) {
        Set<Integer> xSet = new HashSet<Integer>();
        Set<Integer> ySet = new HashSet<Integer>();
        int row = 0;
        int col = 0;
        for(int[] innerMatrix : matrix){
            col = 0;
            for(int element : innerMatrix){
                if(0 == element){
                    xSet.add(row);
                    ySet.add(col);
                }
                col+=1;
            }
            row+=1;
        }
        // clean elements 
        for(Integer x : xSet){
            for(int i = 0; i < matrix[0].length; i++){
                matrix[x][i] = 0;
            }
        }
        for(Integer y : ySet){
            for(int j = 0; j < matrix.length; j++){
                matrix[j][y] = 0;
            }
        }
    }
}
```

## Constant Extra Space

```java
class Solution {
    public void setZeroes(int[][] matrix) {
        
        boolean firstRowZero = false;
        boolean firstColZero = false;
        int m = matrix.length;
        int n = matrix[0].length;
        for(int j = 0; j < n; j++){
            if(matrix[0][j] == 0){
                firstRowZero = true;
                break;
            }
        }
        for(int i = 0; i < m; i++){
            if(matrix[i][0] == 0){
                firstColZero = true;
                break;
            }
        }
        for(int i = 0; i < m; i++){
            for(int j = 1; j < n; j++){
                if(matrix[i][j] == 0){
                    matrix[0][j] = 0;
                    matrix[i][0] = 0;
                }
            }
        }
        for(int i = 1; i<m; i++){
            if(matrix[i][0]==0){
                Arrays.fill(matrix[i], 0);
            }
        }
        for(int j = 1; j < n; j++){
            if(matrix[0][j] == 0){
                for(int k = 0; k<m; k++){
                    matrix[k][j] = 0;
                }
            }
        }
        if(firstRowZero){
            Arrays.fill(matrix[0], 0);
        }
        if(firstColZero){
            for(int k = 0; k < m; k++){
                matrix[k][0] = 0;
            }
        }
    }
}
```

后排膜拜大神三刷

[大神](http://www.cnblogs.com/yrbbest/p/4437115.html)