# 125 Valid Palindrome

Tag:

- Easy
- String
- Two Pointer
- Microsoft, Uber, Facebook, Zenefits

Todos:
- ....

一句话简介

> 前后指针扫描，然后注意下Character的API就好了...细心啊这题得


需要注意的是:

*小心数组越界,记得更新指针,最好不要在移动指针的时候取值*

## Java Solution

### Tow Pointer

方法特点：很慢

```java
public class Solution {
    public boolean isPalindrome(String s) {
        if(0 == s.length()){
           return true; 
        }
        int start = 0;
        int end = s.length()-1;
        while(start < end){
            // get current valid head char
            while(start<s.length() && !Character.isLetterOrDigit(s.charAt(start)) ){
                start += 1;
            }
            if(start>=end){
                return true;
            }
            // get current valid tail char
            char ch1 = s.charAt(start);
            char ch2 = s.charAt(end);
            while(end>=0 && !Character.isLetterOrDigit(ch2)){
                end -= 1;
                ch2 = s.charAt(end);
            }
            // compare equal or not
            if(Character.toLowerCase(ch1) != Character.toLowerCase(ch2)){
                return false;
            }else{
                start+=1;
                end-=1;
            }
        }
        return true;
    }
    
    
}
```

### 改进版indexOf ++法（<del>自己取的名</del>）

取indexOf

未完成
