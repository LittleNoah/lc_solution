# 293 Flip Game

Tag:

- Medium
- String
- Google

Todos:
- 用Manacher算法解决回文串问题 
- 自己来一次灵巧递归实现

一句话简介

> 系列第一题


需要注意的是:

*题目要求是++序列改成--而不是任意翻转*

## Java Solution

### 暴力Char搜索法

方法特点：很慢

```java
public class Solution {
    public List<String> generatePossibleNextMoves(String s) {
        int len = s.length();
        List<String> resList = new ArrayList<String>();
        // loop and check each pair
        for(int i = 0; i<len-1; i++){
            char a = s.charAt(i);
            char b = s.charAt(i+1);
            if(a=='+' && a == b){
                StringBuilder sb = new StringBuilder();
                sb.append(s.substring(0,i));
                sb.append("--");
                sb.append(s.substring(i+2));    // if i+2 exceeds the length of str, it will return an empty string
                resList.add(sb.toString());
            }
        }
        return resList;
    }
}
```

### 改进版indexOf ++法（<del>自己取的名</del>）

取indexOf

未完成
