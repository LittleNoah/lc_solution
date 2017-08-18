# 408 Valid Word Abbreviation

Tag:

- Easy
- String
- Google

Todos:

- ..
- ....

一句话简介

> 啊，乖乖站好

需要注意的是:

- ...

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

