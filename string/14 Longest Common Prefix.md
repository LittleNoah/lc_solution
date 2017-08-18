# 14 Longest Common Prefix

Tag:

- Easy
- String
- Yelp
- ???

Todos:

- ....看看discussion的奇思妙想
- Binary Search Tree
- Dived-and-Conquer
- Trie

一句话简介

> ...

需要注意的是:

*.....*

## Ideas

1. 暴力算到尾
2. 排序数组:然后比较头尾元素即可,时间复杂度 `O(k*log n)` , `k`是数组长度
3. 还有Binary Search Tree....以后做到了类似题回来做这个



## Java Solution

### 原始暴力法

方法特点：...一...一言一眼？

思路：用前两个元素的前缀和后面的每一个比较，最后得出的就是最长公共前缀

```java
class Solution {
    public String longestCommonPrefix(String[] strs) {
        int len = strs.length;
        if(0 == len){
            return "";
        }else if(1 == len){
            return strs[0];
        }
        
        String[] prefixs = new String[len+1]; // store prefix between two elements
        
        prefixs[1] = getPrefix(strs[0], strs[1]);
        // iterate calculate prefix
        for(int i = 2; i<=len-1; i++){  // in total, len-1 prefixes
            prefixs[i] = getPrefix(prefixs[i-1], strs[i]);
        }
        return prefixs[len-1];
    }
    // get prefix
    public String getPrefix(String s1, String s2){
        int minlen = Math.min(s1.length(), s2.length());
        for(int i = 0; i<minlen; i++){
            if(s1.charAt(i) != s2.charAt(i)){
                return s1.substring(0,i);
            }
        }
        // else s1 == s2
        return s1.substring(0,minlen);
    }
}
```

### DP 动态规划（差点就超时了）

...

```java
public class Solution {
    public String longestPalindrome(String s) {
        if(s.length() <= 1){
            return s;
        }
        
        int start = 0;
        int maxlen = 1;
        int len = s.length();
        boolean[][] valid = new boolean[len][len];  // dp
        // add the seed
        for(int i = 0; i<s.length()-1;i++){
            valid[i][i] = true;
            if(s.charAt(i)==s.charAt(i+1)){
                valid[i][i+1] = true;
                if(maxlen < 2){
                    maxlen = 2;
                    start = i;
                }
            }
        }
        valid[len-1][len-1] = true; // last single pair
        
        for(int i = 3; i<=len; i++){  // dp calclate valid palindromic string 
            for(int j = 0; j<=len-i; j++){
                //System.out.println("inner valid " + valid[j+1][j+i-2] );
                if(valid[j+1][j+i-2] && s.charAt(j)==s.charAt(j+i-1) ){
                    // System.out.println("true");
                    valid[j][j+i-1] = true;
                    if(i>maxlen){
                        maxlen = i;
                        start = j;
                    } 
                }
            }
        }
        String target = s.substring(start, start+maxlen);
        return target;
    }
}
```

