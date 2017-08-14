# 557. Reverse Words in a String III 

Tag:

- Easy
- String

Todos:

- 整理做法
- ...

一句话简介

> ...有个新人传的题

...有个新人传的题，主要就split一下然后调用StringBuilder就可以了

需要注意的是:

1. StringBuilder可以用string初始化...不需要append (误：但是好像不用append直接初始化会慢)
 


## Java Solution

```java
public class Solution {
    public String reverseWords(String s) {
        if(s.length() <= 1 ){
            return s;
        }
        // construct the string
        StringBuilder sb = new StringBuilder();
        
        String []words = s.split(" ");
        int wordNum = words.length;
        // iterate each word and reverse it using StringBuilder
        for(String word : words){
            StringBuilder rWord = new StringBuilder(word);
            rWord.reverse();
            sb.append(rWord.toString());
            sb.append(" ");
        }
        
        return sb.toString().trim();
    }
}
```
