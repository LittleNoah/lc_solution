# 5 Longest Palindromic Substring

Tag:

- Medium
- String
- 微软
- 回文

Todos:

- ....重做一遍

一句话简介

> 各种坑...考虑多余空格

需要注意的是:

*.....*

## Java Solution

### 正则去多余空格

方法特点：...土

```java
public class Solution {
    public String reverseWords(String s) {
        if(null == s || 0==s.length()){
            return s;
        }
        String[] words = s.trim().split("\\s+");

        StringBuilder sb = new StringBuilder();
        for(int i = words.length-1; i>=0; i--){
            sb.append(words[i]);
            sb.append(" ");
        }
        return sb.toString().trim();
    }
}
```

### ...

...

