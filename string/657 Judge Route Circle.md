# 657 Juedge Route Circle

Tag:

- Easy
- String



一句话简介

> 愚蠢的新题

就是判断下offset是否归零



## Java Solution

```java
public class Solution {
    public boolean judgeCircle(String moves) {
        // handling corner case
        if(0 == moves.length()){
            return true;
        }
        // initialize an array to represent the offset in horizantol and vertical U+1 D-1
        int []res = new int[2];
        int len = moves.length();
        for(int i = 0; i<len; i++){
            char dir = moves.charAt(i);
            switch(dir){
                case 'U':
                    res[0]+=1;
                    break;
                case 'D':
                    res[0]-=1;
                    break;
                case 'R':
                    res[1]+=1;
                    break;
                case 'L':
                    res[1]-=1;
                    break;
                default:
                    return false;
            }
        }
        // if all set to zero, then it is a circle
        if(0==res[0] && 0==res[1]){
            return true;
        }
        return false;
    }
}
```

