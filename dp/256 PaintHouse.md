# 256 Paint House

Tag:

- Easy
- Array, Dynamic Programming

Todo List:

- [x] ....


## Problem Description

可能是独立解决的第一道DP，多亏了入学前听过，大一在学府书店看过买过，大二想学过，master快毕业才草略看的[刘汝佳 算法竞赛入门经典](https://book.douban.com/subject/4138920/). 之前看过邓老师的xuetangx上的课，一直想从递归转迭代的方法走，总想直接通过分而治之和减而治之去找出解法。但是实际上可能按邓老师的高徒刘汝佳的方法更佳。书里面提出了把一类动态规划问题想成连通图DAG问题，而这道题就可以当做是用

>  There are a row of *n* houses, each house can be painted with one of the three colors: red, blue or green. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.
>
>  The cost of painting each house with a certain color is represented by a `n x 3` cost matrix. For example, `costs[0][0]` is the cost of painting house 0 with color red; `costs[1][2]` is the cost of painting house 1 with color green, and so on... Find the minimum cost to paint all houses.
>
>  **Note:**
>  All costs are positive integers.

## Ideas 

这是动态规划系列刷题的第五题，目前进度是读了刘汝佳的书的一小节，读了一些知乎答案，大概能感受到什么是状态和状态转移了(尤其是映射到 图上面)

这题要求粉刷房子，有红蓝绿三种颜色，要求临近的房子不能同一种颜色，同时要求求出最低的粉刷费用。

我们开始构建一下状态啊
$$
令 d(i, color) 表示，第i个房子刷color颜色的最小花销 （当然是加上前面所有房子的花销）
$$
这样我们的目标就是算出`d(n,color)`中最小的那个，那么d(i)一般怎么计算呢，我们先考虑下平凡情况
$$
d(0, color) = costs(0,color)
$$
d(1,color)需要计算d(0,other color)和costs(1,color)的和。这样我们就可以用动态规划得到解了，同时我们通过观察也可以发现，其实后面的阶段只依赖于前一阶段，所以我们可以用几个临时变量只缓存前一阶段，这样空间就是O(1)了

## Ruby Solutions

### Memoization Solution

每次计算最后一个bit，代码如下:

```ruby
# @param {Integer[][]} costs
# @return {Integer}
def min_cost(costs)
    # corner case
    len = costs.size
    return 0 if len.zero?
    dp = Array.new(len){Array.new 3}
    # initialize the first house
    0.upto 2 do |color|
        dp[0][color] = costs[0][color]
    end
    # iterate calculating the result
    1.upto len-1 do |house|
        0.upto 2 do |color|
            tmp_list = []
            tmp_list << dp[house-1][(color+1)%3]
            tmp_list << dp[house-1][(color+2)%3]
            # minimum previous one plus current one
            dp[house][color] = tmp_list.min + costs[house][color]
        end
    end
    dp[len-1].min
end
```



## Java Solutions

只写迭代版本的了，其他版本都一样

**值得注意的是**： Java int数组初始值为0

### 迭代 + Memoization

Code:

```java
public class Solution {
    public int minCost(int[][] costs) {
        int len = costs.length;
        if(len < 1){
            return 0;
        }
        int [][]dp = new int[len][3];
        for(int i = 0; i<3; i++){
            dp[0][i] = costs[0][i];
        }
        for(int i = 1; i< len; i++){
            for(int j = 0; j<3; j++){
                int c1 = dp[i-1][(j+1)%3];
                int c2 = dp[i-1][(j+2)%3];
                dp[i][j] = Math.min(c1,c2) + costs[i][j];
            }
        }
        int res = Math.min( Math.min(dp[len-1][0],dp[len-1][1]), dp[len-1][2] );
        return res;
    }
}
```

### 滚动数组

代码如下:

```java
public class Solution {
    public int minCost(int[][] costs) {
        int len = costs.length;
        if(len < 1){
            return 0;
        }

        int last_red = costs[0][0];
        int last_blue = costs[0][1];
        int last_green = costs[0][2];
        for(int i = 1; i< len; i++){
            int cur_r = Math.min(last_blue, last_green) + costs[i][0];
            int cur_b = Math.min(last_red, last_green) + costs[i][1];
            int cur_g = Math.min(last_blue, last_red) + costs[i][2];
            last_blue = cur_b;
            last_red = cur_r;
            last_green = cur_g;
        }
        int res = Math.min(last_blue, Math.min(last_red, last_green) );
        return res;
    }
}
```

### 