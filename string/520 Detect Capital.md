#  520 Detect Capital          

Tag:

- Medium
- String
- Hash
- 滑动窗口 Sliding Window
- Google <del>啥时候有offer</del>

Todos:

- ....用字符串相减重写一遍

一句话简介

> 微型状态机...

需要注意的是:

- ...没啥

## Java Solution

### if else大法

方法特点：写的太长了有木有啊！！！Java写字符串想自爆啊有木有啊！！！！

```java
public class Solution {
    public boolean detectCapitalUse(String word) {
        int len = word.length();
        if(len <= 1){
            return true;
        }
        // go through the state machine...
        char head = word.charAt(0);
        // two ways: capital or not
        if(Character.isUpperCase(head)){  // all captials or all followings are lowercase
            char second = word.charAt(1);
            if(Character.isUpperCase(second)){
                for(int i=2; i<len;i++){
                    char ch = word.charAt(i);
                    if(Character.isLowerCase(ch)){
                        return false;
                    }
                }
            }else{
                for(int i=2; i<len;i++){
                    char ch = word.charAt(i);
                    if(Character.isUpperCase(ch)){
                        return false;
                    }
                }
            }
        }else{  // start is not capital, then all the following charaters should not be capital
            for(int i=1; i<len;i++){
                char ch = word.charAt(i);
                if(Character.isUpperCase(ch)){
                    return false;
                }
            }
        }
        return true;
    }
}
```

