# 139 Word Break I

## Description

给了一个字典给了一个词，问这个词能不能用字典里的词拼出来

相似题目：leetcode Palindrome Partitioning II

## Ideas

这题乍一看和*word ladder*挺像的，所以我们也考虑一下BFS的做法：

1. 在dict中找到可行的打头词（单纯的用forloop判断即可）
2. 对这个词进行搜索下一个词
3. 直到找到终点或者找不到

但是这种做法开销似乎有点大，我们找找有没有其他做法

大家的解法都是用DP,其实还是有点不爽的，因为不管怎么样我们都得反复的调用substring至少n次...


## Solutions

### DP

说一下思路：

用Dp[i]代表，从ith位置开始到末位的substring是否能够通过dict组成，我们按照如下的方式构建solution

1. 首先从尾巴遍历 [i..end]类型的substring, 把可行的存到dp数组里
2. 然后我们还是从Tail考虑，如果dp[i]不可行，我们就检查下是否存在某种组合，使得某个k属于[i...end]，能够让 [i..k-1] . [k..end]俩substring拼到一起

> 主要参考这个[博客](http://www.cnblogs.com/higerzhang/p/4159775.html)

但是要注意这个博客用的是C++，substr用法和我们的substring不太一样，我们只想要取(i,j-1)之间的和dp[j]的结果，我们可以直接将j初始化为i+1的

```java
class Solution {
    public boolean wordBreak(String s, List<String> wordDict) {
        // corner case
        if(s == null || s.length()==0 || wordDict == null || wordDict.size()<1){
            return false;
        }
        int len = s.length();
        // represeting whether substring i..end has been included in the word dict
        boolean[] dp = new boolean[len];
        for(int i = 0; i < s.length(); i++){
            if(wordDict.contains(s.substring(i))){
                dp[i] = true;
            }
        }
        // for(boolean bl : dp){
        //     System.out.println(bl);    
        // }
        for(int i = len -1; i >= 0; i--){
            // check if there is a path allowed to pass
            if(dp[i] == false){
                for(int j = i+1; j < len; j++){ //notice here
                    if(wordDict.contains(s.substring(i, j)) && dp[j]){
                        dp[i] = true;
                        // no need to continue the loop since ith has been marked as true
                        break;
                    }
                }
            }
        }
        return dp[0];
    }
}
```

