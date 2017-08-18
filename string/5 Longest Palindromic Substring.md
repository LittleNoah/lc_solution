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

### 原始暴力while法（TLE）

方法特点：...超时了

```java
public class Solution {
    public String longestPalindrome(String s) {
        if(s.length() <= 1){
            return s;
        }
        String target = "";
        int maxlen = 0;
        // add the seed
        LinkedList<Integer[]> list = new LinkedList<>();
        for(int i = 0; i<s.length()-1;i++){
            Integer[] singlePair = {i,i};
            list.addLast(singlePair);
            if(s.charAt(i)==s.charAt(i+1)){
                Integer[] realPair = {i,i+1};
                list.addLast(realPair);
            }
        }
        Integer []lastPair = {s.length()-1, s.length()-1};
        list.addLast(lastPair);
        // iterate seeds to check every...
        while(list.size()!=0){
            Integer[] pair = list.pollFirst();  // get the head element
            // calculate the length until invalid
            int len = pair[0]==pair[1] ? 1 : pair[1]-pair[0]+1;
            pair[0] -= 1;
            pair[1] += 1;
            while(pair[0]>=0 && pair[1]<s.length()){              
                if(s.charAt(pair[0]) == s.charAt(pair[1])){
                    len+=2;
                    pair[0] -= 1;
                    pair[1] += 1;
                }else{
                    if(len > maxlen){
                        System.out.println("inner " + len + "   " + maxlen);
                        maxlen = len;
                        target = s.substring(pair[0]+1, pair[1]);
                    }
                    break;
                }
            }
            // handle due to the bodundary limit 
            if(len > maxlen){
                System.out.println("out " + len + "   " + maxlen);
                maxlen = len;
                target = s.substring(pair[0]+1, pair[1]);
            }
        }
        return target;
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

