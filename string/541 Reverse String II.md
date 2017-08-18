# 541 Reverse String II

Tag:

- Easy
- String
- Google

Todos:

- ....concise 写法， 判断`int j = Math.min(i + k - 1, n - 1);` 每次`+=2k`
- ....

一句话简介

> 各种corner case的感觉

需要注意的是:

- 考虑怎么取最后剩下部分的起始index
- 注意题目要求翻转first k个字符，而不是2k个
- 注意判断是否有2k的时候, for循环的判断条件

## Java Solution

### JDK 8瞎用版本...

方法特点：...jdk8同款reverse

```java
class Solution {
    public String reverseStr(String s, int k) {
        int len = s.length();
        char[] chseq = s.toCharArray();
        // for each 2k
        int span2k = 2*k;
        for(int i=0; i+span2k <= len ; i+=span2k){
            reverseSeq(chseq, i, i+k-1);        // notice that the question requires us to reverse the first k chars not 2k
        }
        int remainLen = len%(2*k);
        int lastIdx = len-remainLen;
        if(remainLen!=0 && remainLen < k){
            reverseSeq(chseq, lastIdx, len-1);
        }else if(remainLen!=0 && remainLen >= k){   // reverse the first k
            reverseSeq(chseq, lastIdx, lastIdx+k-1 );
        }
        return new String(chseq);
    }
    
    public void reverseSeq(char[]seq, int start, int end){
        for(int i = (start+end)>>1; i>=start; i--){ // i>=start , if for the whole string, i>=0
            char chj = seq[i];
            char chk = seq[start+end-i];
            seq[i] = chk;
            seq[start+end-i] = chj;
        }
    }
    
}
```

### Concise 写法

...即使A不存在 那么也是 -1 == -1

```java

```

