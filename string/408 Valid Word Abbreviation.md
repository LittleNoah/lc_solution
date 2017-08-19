# 408 Valid Word Abbreviation

Tag:

- Easy
- String
- Google

Todos:

- ..重新想一下workflow吧
- ....没写完

一句话简介

> 啊，乖乖站好

需要注意的是:

- ...`Integer.valueOf(char)`有坑，应该用`Character.getNumericValue`
- ....如果abbr给出的skip长度超过原字符串长度，也要返回`false`
- 如果abbr里面出现11，可能是1和1...???????黑人问号



## Java Solution

### JDK 8瞎用版本...

方法特点：...jdk8同款reverse

```java
class Solution {
    public boolean validWordAbbreviation(String word, String abbr) {
        // empty abbr string case
        if(0==abbr.length()){   // since word is non-empty
            return false;
        }
        // two pointers
        int idx1 = 0;
        int idx2 = 0;
        // loop for each char in these two strings
        while(idx1<word.length() && idx2<abbr.length()){
            char ch1 = word.charAt(idx1);
            char ch2 = abbr.charAt(idx2);
            
            if(Character.isDigit(ch2)){ // start count the number
                int abbrNum = Character.getNumericValue(ch2); //getNumericValue
                for(int i = idx2+1; i<abbr.length(); i++){
                    if(Character.isDigit(abbr.charAt(i))){
                        abbrNum = abbrNum*10 + Character.getNumericValue(abbr.charAt(i));
                    }else{
                        idx2 = i;
                        break;
                    }
                }
                // skip range for index1
                if(idx1+abbrNum > word.length()){
                    return false;
                }else{
                    idx1 += abbrNum;    
                }
                
            }else{  // just skip
                if(ch1 != ch2){ 
                    return false; 
                }
                idx1 += 1;
                idx2 += 1;
            }
        }
        int len1 = word.length()-1;
        int len2 = abbr.length()-1;
        if(idx1 != len1+1 || idx2 != len2 ){  // notice here, should be same as while condition
            // System.out.println("word len: " + len1);
            // System.out.println("abbr len: " + len2);
            // System.out.println("idx1: " + idx1);
            // System.out.println("idx2: " + idx2);
            return false;
        }else{
            return true;
        }
    }
}
```

### Concise 写法

...即使A不存在 那么也是 -1 == -1

```java

```

