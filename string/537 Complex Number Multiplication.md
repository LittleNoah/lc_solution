# 537. Complex Number Multiplication 

Tag:

- Medium
- String

Todos:

- 用正则做一下试试
- ...

一句话简介

> 544那个逗比出的初中数学题...套用一下十字相乘法的公式

就是复数(第一次知道复数是complex number...), 测试用例和题目输入不太用心啊，没说到底是整数还是可以有小数

需要注意的是:

1. 是`String.substring`而不是`String.subString`, 而且第二个参数endIndex实际上是startIndex+strLength得来的，所以是一个开区间
 
> Integer.valueOf returns an Integer.  
> Integer.parseInt returns an int. (如果只要int的话，parseInt似乎...快一点)

## Java Solution

```java
public class Solution {
    public String complexNumberMultiply(String a, String b) {
        // corner case
        if("0".equals(a) || "0".equals(b)){
            return "0+0i";
        }
        int realNum1, imgNum1, realNum2,imgNum2;
        // match each part
        // find the index of the first "+" and "i"
        realNum1 = Integer.parseInt(a.substring(0, a.indexOf("+")));   // substring : startIndex, startIndex+strlength
        realNum2 = Integer.parseInt(b.substring(0, b.indexOf("+")));
        imgNum1 = Integer.parseInt( a.substring( a.indexOf("+")+1, a.length()-1) );    // before i, after +
        imgNum2 = Integer.parseInt( b.substring( b.indexOf("+")+1, b.length()-1) );    // before i, after +
        
        int realNum = realNum1*realNum2 - imgNum1*imgNum2;
        int imgNum = realNum1 * imgNum2 + realNum2 * imgNum1;
        
        String res = "" + realNum + "+" + imgNum + "i";
        return res;
    }
    
}
```

