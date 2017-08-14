# 343 Integer Break

Tag:

- Medium
- Array, Dynamic Programming, 找规律

Todo List:

- [x] ....


## Problem Description

动态规划系列第七道题，虽然是想动态规划解决，但是还是按照答案找规律最666

>  Given a positive integer *n*, break it into the sum of **at least** two positive integers and maximize the product of those integers. Return the maximum product you can get.
>
>  For example, given *n* = 2, return 1 (2 = 1 + 1); given *n* = 10, return 36 (10 = 3 + 3 + 4).
>
>  **Note**: You may assume that *n* is not less than 2 and not larger than 58.

## Ideas 

这是动态规划系列刷题的第七题，找规律



## Ruby Solutions

### GUILV Solution

暴力解法

```ruby
# @param {Integer} n
# @return {Integer}
def integer_break(n)
    return n-1 if n < 4
    mod = n%3
    return 3**(n/3) if mod.zero?
    return 4 * (3** ( (n-3)/3) ) if mod == 1
    return 2 * ( 3**(n/3) )
end
```

### 开源节流法

就是省略了memo的数组

```ruby
# @param {Integer} n
# @return {Integer}
def count_numbers_with_unique_digits(n)
    dp = [1,10,91]
    return dp[n] if n <= 2
    ans = 9
    last_ans = 91
    3.upto n do |num|
        ans = 9
        9.downto 11-num do |factor|
            ans *= factor
        end
        ans += last_ans
        last_ans = ans
    end
    ans
end
```



## Java Solutions

只写迭代版本的了，其他版本都一样

**值得注意的是**： Java Math.pow接受参数和返回值都是double,需要强转

### 迭代 + Memoization

Code:

```java
public class Solution {
    public int integerBreak(int n) {
        if(n<4){
            return (n-1);
        }
        int mod = n%3;
        if(0 == mod){
            return (int)(Math.pow(3, n/3.0));
        }else if(1 == mod){
            return (int)(Math.pow(3, (n-3)/3)) *4;
        }else{ // 2
            return (int)(Math.pow(3, n/3)) *2;
        }
    }
}
```

