# Descirption

求图中有多少island,这题和之前那个求有多少battleship是一个套路，也就是刘汝佳入门里的题

# Ideas

既然是图的题，那么肯定是从几个角度来考虑了：
1. BFS/DFS
2. Union Find (Connectivity 连通度)


我曹，写完这题我脱胎换骨啊！

# Solutions

## DFS

记住这个四连块的套路，记住这个dfs的套路，分为explore和dfs两部分

```java
class Solution {
    private int[] dx = {1, 0, -1, 0};
    private int[] dy = {0, 1, 0 ,-1};
    public int numIslands(char[][] grid) {
        if(grid == null || grid.length == 0){
            return 0;
        }
        boolean [][]visited = new boolean[grid.length][grid[0].length]; // notice: check declare and implementation type
        // DFS
        int idx = 0; // connected component id
        for(int i = 0; i < grid.length; i++){
            for(int j = 0; j < grid[0].length; j++){
                if(!visited[i][j] && grid[i][j] == '1'){
                    explore(i, j, grid, visited);
                    idx += 1;
                } 
            }
        }
        return idx;
    }

    // judge if this cell is a island or water before invoking this method
    public void explore(int row, int col, char[][] grid, boolean[][] visited){
        // mark visited 
        visited[row][col] = true;
        // CCnum(v) <- cc
        for(int k = 0; k < 4; k++){
            if(isValid(row + dx[k], col + dy[k], grid) && !visited[row + dx[k]][col + dy[k]]){
                explore(row + dx[k], col + dy[k], grid, visited);
            }            
        }
    }
    
    public boolean isValid(int row, int col, char[][] grid){
        // recursive base
        if(row < 0 || row >= grid.length || col < 0 || col >= grid[0].length){
            return false;
        }else{
            return ('1' == grid[row][col]);
        }
    }
}
```