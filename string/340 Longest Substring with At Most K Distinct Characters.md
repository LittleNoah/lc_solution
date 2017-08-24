# 340 Longest Substring with At Most K Distinct Characters

Tag:

- Hard
- String
- Google

Todos:

- ...
- 尝试用个更快的方法试一下，自己保存一些数据

一句话简介

> ...
>
> 滑动窗口,和限制2 distinct的那道题一样的做法...

### 需要注意的是:

*对于字母类问题，一个trick是采用[0,25]作index, 然后判断offset的时候，(ch1+26-ch2) %26*

## Ideas

....

## Java Solution

### 滑动窗口 sliding window

方法特点：跑的挺快的....也比较直观

```java
class Solution {
    public int lengthOfLongestSubstringKDistinct(String s, int k) {
        int left = 0;
        int right = 0;
        int len = s.length();
        int maxlen = 0;
        Map<Character, Integer> indexMap = new HashMap<>();
        // start sliding window
        while(right < len){
            if(indexMap.size() <= k){   // only two distinct char
                indexMap.put(s.charAt(right), right);
                right += 1;
            }
            // check valid substring
            if(indexMap.size() > k){
                int leftMost = s.length();
                for(int i : indexMap.values()){
                    leftMost = Math.min(i, leftMost);
                }
                char ch = s.charAt(leftMost);
                // remove the ch from the map
                indexMap.remove(ch);
                // update window
                left = leftMost + 1;
            }
            maxlen = Math.max(maxlen, right-left);
        }
        return maxlen;
    }
}
```

### 方法二：自我实现法...

未完成

```java

```

