# 165 Compare Version

Tag:

- Medium
- String
- Microsoft, Apple

Todos:

- ....看懂这个0ms的

一句话简介

> 各种坑 1.0 = 1

需要注意的是:

*小心数组越界,记得更新指针,最好不要在移动指针的时候取值*

## Java Solution

### 瞎判断法

方法特点：...土

```java
public class Solution {
    public int compareVersion(String version1, String version2) {
        String[] info1 = version1.split("\\."); // notice split takes a regex and we need escape period
        String[] info2 = version2.split("\\.");
        int len1 = info1.length;
        int len2 = info2.length;
        
        int sharedLen = Math.max(len1, len2);
        for(int i = 0; i<sharedLen; i++){ // compare the
            int v1 = i<=len1-1 ? Integer.parseInt(info1[i]) : 0;
            int v2 = i<=len2-1 ? Integer.parseInt(info2[i]) : 0;
            if(v1 > v2){
                return 1;
            }else if(v1 < v2){
                return -1;
            }
        }
        return 0;
    }
}
```

### 累加（<del>自己取的名</del>）

未完成

```java
// leetcode sample
public class Solution {
    public int compareVersion(String version1, String version2) {
        
        int len1 = version1.length();
        int len2 = version2.length();
        int i=0, j=0;
        while (i<len1 || j<len2)
        {
            int n1 = 0, n2=0;
            while (i<len1 && version1.charAt(i)!='.')
            {
                n1 = n1*10 + version1.charAt(i++) - '0';
            }
            while (j<len2 && version2.charAt(j)!='.')
            {
                n2 = n2*10 + version2.charAt(j++) - '0';
            }
            if (n1>n2)
                return 1;
            if (n2>n1)
                return -1;
            else{
                i++;j++;
            }
        }
        
        return 0;

    }
}

```

