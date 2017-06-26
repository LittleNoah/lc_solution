# 62 Unique Paths

Tag:

- Medium
- Array, Dynamic Programming

Todo List:

- [ ] 一行数组做法

## Problem Description

输入一个非负整数，对于0到num区间内的数，给出每个的二进制表示中bit 1的个数

> Given a non negative integer number **num**. For every numbers **i** in the range **0 â¤ i â¤ num** calculate the number of 1's in their binary representation and return them as an array.

## Ideas

这是动态规划系列刷题的第一题

第一个要解决的问题就是如何计算一个数字中bit 1的个数，其实这是一个Hamming Weight问题，具体来说我们可以移位`&1`计算是否是1，也可以等效为除以二看余数；第二种做法是用`n&(n-1)`去掉rightmost的一个bit 1，具体为什么Google一下就知道（或者看小黑本本笔记），这样的复杂度是O(log n)，log2 n是每个num的位数，最后就是nlogn

**动态规划求解**： 好难，想不粗递归式

## Ruby Solutions

### 暴力递归 Solution

把走到边上当做一种只剩下一种走法，能右能下说明有两种走法

```ruby
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
    return 1 if m==1 && n==1
    return rc_unique_paths(0,0,m-1,n-1)
end

def rc_unique_paths(a, b, m, n)
    if a==m && b==n then
        return 0
    elsif a<m && b<n # now we have two choices
        return rc_unique_paths(a+1,b,m,n) + rc_unique_paths(a,b+1,m,n)
    elsif a<m
        return 1 # rc_unique_paths(a+1,b,m,n)
    else
        return 1 # rc_unique_paths(a,b+1,m,n)
    end
end
```

果不其然的触底反弹，TLE了

考虑到，只输入（1,1）这种坐标，其实也算是一种走法，可以和走到边缘上合并

```ruby
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
    return rc_unique_paths(1,1,m,n)
end

def rc_unique_paths(a, b, m, n)
    if a<m && b<n # now we have two choices
        return rc_unique_paths(a+1,b,m,n) + rc_unique_paths(a,b+1,m,n)
    else
        return 1
    end
end
```



### 递归 + Memoization

加上个memo,用Hash写的，不知道怎么定义二维数组

代码如下:

```ruby
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
    memo = {}
    return rc_unique_paths(memo,1,1,m,n)
end

def rc_unique_paths(memo, a, b, m, n)
    if memo[[a,b]].nil? then
        if a<m && b<n then # now we have two choices
            memo[[a,b]] = rc_unique_paths(memo,a+1,b,m,n) + rc_unique_paths(memo,a,b+1,m,n)
        else
            memo[[a,b]] = 1
        end
    end
    return memo[[a,b]]
end
```

学会了怎么定义初始值为0 的数组,（微笑）记得访问数组要用`a[x][y]`不是尼玛的a[x,y]

```ruby
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
    # memo = {}
    memo = Array.new(m) {Array.new(n,0)}
    return rc_unique_paths(memo,0,0,m-1,n-1)
end

def rc_unique_paths(memo, a, b, m, n)
    if memo[a][b].zero? then
        if a<m && b<n then # now we have two choices
            memo[a][b] = rc_unique_paths(memo,a+1,b,m,n) + rc_unique_paths(memo,a,b+1,m,n)
        else
            memo[a][b] = 1
        end
    end
    return memo[a][b]
end
```

调了半天，发现比Hash还慢...没sie了。。。。

### 智慧迭代动态规划

。。。其实就是递归的逆向迭代，优雅的不写递归，但是还是有memoization, 我们按照path[x,y] = path[x+1,y] + path[x,y+1]计算，那么逆过来就是path[x, y] = path[x-1,y] + path[x,y-1]

```ruby
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
    # memo = {}
    memo = Array.new(m) {Array.new(n,0)}
    0.upto m-1 do |index|
        memo[index][0] = 1
    end
    0.upto n-1 do |index|
        memo[0][index] =1
    end
    1.upto m-1 do |i|
        1.upto n-1 do |j|
            memo[i][j] = memo[i-1][j] + memo[i][j-1]
        end
    end
    memo[m-1][n-1]
end

```

这样...就beats了70%多的人了。。。这题也就这么做了

## Java Solutions

只写迭代版本的了，其他版本都一样

**值得注意的是**： `i<=n-1`不是`i<n-1`

### 智慧迭代版本 Solution

代码如下

```java
public class Solution {
    public int uniquePaths(int m, int n) {
        int [][]dp = new int[m][n];
        for(int i = 0; i<=m-1; i++){
            dp[i][0] = 1;
        }
        for(int j = 0; j<=n-1; j++){
            dp[0][j] = 1;
        }
        for(int i = 1; i<=m-1;i++){
            for(int j = 1; j<=n-1;j++){
                dp[i][j] = dp[i-1][j] + dp[i][j-1];
            }
        }
        return dp[m-1][n-1];
    }
}
```

