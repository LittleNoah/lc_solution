#  3. Longest Substring Without Repeating Characters

Tag:

- Medium
- String
- 滑动窗口 Sliding Window
- Amazon, Adobe, Bloomberg, Yelp

Todos:
- 用Manacher算法解决回文串问题 
- 自己来一次灵巧递归实现

一句话简介

> 系列第一题, 注意maxLen的更新时机


需要注意的是:

none

巧妙Idea:

> 用128bit数组存储每个字符的位置，避免hashmap开销

## Java Solution

### 发现重复更新起点法

方法特点：略慢

```java
public class Solution {
    public int lengthOfLongestSubstring(String s) {
        // map to store the latest index of each char
        HashMap<Character,Integer> chIdxMap = new HashMap<Character, Integer>();
        int len = s.length();
        int maxLen = 0;    // length for current longest substring
        int curLen = 0;
        int start = 0;
        for(int i = 0; i<=len-1;i++){
            Character ch = s.charAt(i);
            if(!chIdxMap.containsKey(ch)){
                chIdxMap.put(ch,i);
                curLen+=1;
            }else{
                maxLen = Math.max(maxLen, curLen);
                int prevCharIdx = chIdxMap.get(ch);
                start = prevCharIdx>=start ? prevCharIdx+1 : start;    // update the current start point of longest substring
                curLen = i-start+1; // skip the previous duplicate char
                chIdxMap.put(ch,i);
            }
        }

        maxLen = curLen>maxLen? curLen:maxLen;  // if the last curLen is longer than maxLen
        return maxLen;
    }
}
```

### 逆天数组存储法

128bit Array

未完成
