# 413 Arithmetic Slices

Tag:

- Medium
- Array, Dynamic Programming

Todo List:

- [x] ....


## Problem Description

给一个数组，要求找出里面所有Arithmetic Slices的数量，很有DP味道的一道题，好像是百度的面试题。。。题目太长了，arithmetic slice就是一段连续的子序列，要求是等差数列

>  未完待续

## Ideas 

这是动态规划系列刷题的第三题

第一个要解决的问题是，怎么判断是否是等差数列，注意可能有多个等差数列

这里学到的知识有，如果你发现了一个较长的等差数列，那么它所包含的等差数列总数为
$$
1 + 2 + 3 + 4 + ... + length
$$
也就是`(n-1) * (n-2) /2` . 这样我们找到一个较长的就可以直接套公式算。

第二个是我们也可以用迭代来加出来，cur = 1, nextcur = 1 + cur,。。。然后result 直接加cur累加

## Ruby Solutions

### 公式 Solution

每次计算最后一个bit，代码如下:

```ruby
# @param {Integer[]} a
# @return {Integer}
def number_of_arithmetic_slices(a)
    return 0 if a.size < 3
    # a = (n-1)*(n-2)/2
    result = 0
    cur_len = 2
    2.upto a.size-1 do |i|
        if a[i] - a[i-1] == a[i-1] - a[i-2] then
            cur_len += 1
        else
            result += (cur_len-1)*(cur_len-2) / 2
            cur_len = 2
        end
    end
    # handle the last one
    result += (cur_len-1)*(cur_len-2) / 2
end
```



### 迭代 + Memoization

代码如下:

```ruby
# @param {Integer[]} a
# @return {Integer}
def number_of_arithmetic_slices(a)
    return 0 if a.size < 3
    # a = (n-1)*(n-2)/2
    result = 0
    dp = Array.new(a.size, 0)
    2.upto a.size-1 do |i|
        if a[i] - a[i-1] == a[i-1] - a[i-2] then
            dp[i] = dp[i-1]+1
        end
        # update for every cell
        result += dp[i]
    end
    # handle the last one
    return result
end
```

### 智慧迭代动态规划

。。。其实就是递归的逆向迭代，优雅的不写递归，但是还是有memoization, （参考于[博客](https://www.hrwhisper.me/leetcode-counting-bits/)）看下代码：

```ruby
# @param {Integer[]} a
# @return {Integer}
def number_of_arithmetic_slices(a)
    return 0 if a.size < 3
    # a = (n-1)*(n-2)/2
    result = 0
    prev = 0
    2.upto a.size-1 do |i|
        if a[i] - a[i-1] == a[i-1] - a[i-2] then
            prev += 1
            result += prev
        else
            prev = 0
        end
    end
    # handle the last one
    return result
end
```

。。。这题也就这么做了



## Java Solutions

只写迭代版本的了，其他版本都一样

**值得注意的是**： Java int数组初始值为0

### 公式 Solution

代码如下

```java
public class Solution {
    public int numberOfArithmeticSlices(int[] A) {
        // check the corner case: A is shorter than 3
        if(A.length < 3){
            return 0;
        }
        int result = 0;
        int curSliceLen = 2;
        for(int i = 2; i <= A.length-1; i++){
            if( A[i] - A[i-1] == A[i-1] - A[i-2]){
                curSliceLen += 1;
            }else{
                result += (curSliceLen-1)*(curSliceLen-2)/2;// use the math
                curSliceLen = 2;
            }
        }
        // check if there is one left
        if(curSliceLen > 2){
            result += (curSliceLen-1)*(curSliceLen-2)/2;// use the math
        }
        return result;
    }
}
```

### 迭代 + Memoization

Code:

```java
public class Solution {
    public int numberOfArithmeticSlices(int[] A) {
        // check the corner case: A is shorter than 3
        if(A.length < 3){
            return 0;
        }
        int result = 0;
        int []dp = new int[A.length];
        for(int i = 2; i <= A.length-1; i++){
            if( A[i] - A[i-1] == A[i-1] - A[i-2]){
                dp[i] = dp[i-1] + 1;
            }
            result += dp[i];
        }
        return result;
    }
}
```

### 单变量迭代

Code:

```java
public class Solution {
    public int numberOfArithmeticSlices(int[] A) {
        // check the corner case: A is shorter than 3
        if(A.length < 3){
            return 0;
        }
        int result = 0;
        int prev = 0;
        for(int i = 2; i <= A.length-1; i++){
            if( A[i] - A[i-1] == A[i-1] - A[i-2]){
                prev += 1;
                result += prev;
            }else{
                prev = 0;
            }
            
        }
        return result;
    }
}
```

