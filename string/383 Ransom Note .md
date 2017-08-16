#  383. Ransom Note 

Tag:

- Easy
- String
- Apple <del>Microsoft Fans公司???</del>

Todos:

- ....
- 总结下用char当数组
- 看官方答案

一句话简介

> HashMap的应用

需要注意的是:

- 注意一下测试用例对空树的处理

## Java Solution

### 其实就是Hash

开了个小数组，用char当index

方法特点：写的太长了有木有啊！！！Java写字符串想自爆啊有木有啊！！！！

```java
public class Solution {
    public boolean canConstruct(String ransomNote, String magazine) {
        int[] words = new int[128]; // store characters
        for(char ch : magazine.toCharArray()){
            words[ch] += 1; // make magazine words avaliable
        }
        for(char ch : ransomNote.toCharArray()){
            words[ch] -= 1;
            if(words[ch] < 0){
                return false;
            }
        }
        return true;
    }
}
```

