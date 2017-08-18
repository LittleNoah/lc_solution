# 551 Student Attendance Record I

Tag:

- Easy
- String
- Google

Todos:

- ....重看一遍
- ....

一句话简介

> 其实很简单，但是不好想，题目国人写的有点不好理解

需要注意的是:

*.....*

## Java Solution

### 乖宝宝版本

方法特点：...很有道理，并且很像好学生

解说：题目说的比较模糊，但是实际上判断的是LLL这种就不可以了而不是LL LL LL这种

```java
class Solution {
    public boolean checkRecord(String s) {
        int absent = 0;
        int late = 0;	//连续 L的数目
        char charA = 'A';
        char charL = 'L';
        for(int i = 0; i<s.length(); i++){
            char ch = s.charAt(i);
            if( ch == charA){
                absent += 1;
                late = 0;
            }else if( ch == charL){
                late += 1;
            }else{
                late = 0;
            }
            // check point
            if(absent>1 || late >2){
                return false;
            }
            
        }
        return true;
    }
}
```

### 巧妙利用Java API

...即使A不存在 那么也是 -1 == -1

```java

```

