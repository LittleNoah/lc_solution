# 66 Plus One

Tag:

- Easy
- Array, Dynamic Programming

Todo List:

- [x] Java Solution


## Problem Description

输入一个非负整数，对于0到num区间内的数，给出每个的二进制表示中bit 1的个数

> Given a non negative integer number **num**. For every numbers **i** in the range **0 â¤ i â¤ num** calculate the number of 1's in their binary representation and return them as an array.

## Ideas 

这是动态规划系列刷题的第一题

第一个要解决的问题就是如何计算一个数字中bit 1的个数，其实这是一个Hamming Weight问题，具体来说我们可以移位`&1`计算是否是1，也可以等效为除以二看余数；第二种做法是用`n&(n-1)`去掉rightmost的一个bit 1，具体为什么Google一下就知道（或者看小黑本本笔记），这样的复杂度是O(log n)，log2 n是每个num的位数，最后就是nlogn

**动态规划求解**： 好难，想不粗递归式

## Ruby Solutions

### 暴力递归 Solution

每次计算最后一个bit，代码如下:

### 递归 + Memoization

不知道为什么，执行效率和递归基本相同，卧槽，忘记存入dp了,存入dp数组之后beat了79%

代码如下:

```ruby
# @param {Integer} num
# @return {Integer[]}
def count_bits(num)
    dp = Array.new
    dp[0] = 0
    dp[1] = 1
    result = []
    0.upto num do |n|
        result << count_one_bit(dp,n)
    end
    return result
end

# recusively calculate
def count_one_bit(dp, num)
    if dp[num].nil? then
        dp[num] = (count_one_bit(dp, num & 0x01) + count_one_bit(dp, num>>1) )
    else
        return dp[num]
    end
end
```

### 智慧迭代动态规划

。。。其实就是递归的逆向迭代，优雅的不写递归，但是还是有memoization, （参考于[博客](https://www.hrwhisper.me/leetcode-counting-bits/)）看下代码：

```ruby
# @param {Integer} num
# @return {Integer[]}
def count_bits(num)
  return [0] if num.zero?
  dp = [0,1]
  # we know for sure that n>>1 and n&0x01 exists
  2.upto num do |n|
    # dp[n] = dp[n>>1] + dp[n&0x01]
    dp[n] = dp[n>>1] + (n&0x01) # 不需要去dp里面查，就是0或者1，这样减少一次操作
  end
  return dp
end
```

这样...就beats了90%多的人了。。。这题也就这么做了

### 暴力 Solution

注意： 是`upto`不是`up_to`

代码如下：

```ruby
# @param {Integer} num
# @return {Integer[]}
def count_bits(num)
    result = []
    0.upto num do |n|
        result << count_one_bit(n)
    end
    return result
end

def count_one_bit(num)
    counter = 0
    until num.zero?
        num &= (num-1)
        counter += 1
    end
    return counter
end
```



## Java Solutions

只写迭代版本的了，其他版本都一样

**值得注意的是**： Java int数组初始值为0

### 智慧迭代版本 Solution

代码如下

```java
public class Solution {
    public int[] countBits(int num) {
        int [] memo = new int[num+1]; // Java int array default value is 0
        for(int i = 1; i <= num; i++){
            memo[i] = memo[i>>1] + (i&0x01) ;
        }
        return memo;
    }
}
```

