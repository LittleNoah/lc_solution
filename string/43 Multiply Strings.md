# 43 Multiply Strings

Tags:

- String
- Facebook, Twitter

坑:

- ...理解乘法
- 计算index的时候，乘法乘积的低位存储在低位，例如79*8, 8在index0, 9在index1, 3-1-0-2 = 0, 而7和8则比这个最低位前了一位，因为3-0-0-1

## Description


## Ideas

计算乘法的时候，我们可以先两两相乘，index通过观察得出，然后再处理进位即可

## Java Solutions

### Perfect Solution

值得反复学习的一个答案... [from blog](https://simpleandstupid.com/2014/10/24/multiply-strings-leetcode-解题笔记/)

```java
public class Solution {
    public String multiply(String num1, String num2) {
         
        int size = num1.length() + num2.length();
        int[] sum = new int[size];
         
        //每位相乘，注意index的规律，可以通过简单的几个例子总结出来。
        for(int i = 0; i < num1.length(); i++){
            for(int j = 0; j < num2.length(); j++){
                sum[sum.length-2-i-j] += (num1.charAt(i) - '0') * (num2.charAt(j) - '0');
            }
        }
         
        //处理进位
        for(int i = 0; i < sum.length-1; i++){
            int carry = sum[i] / 10;
            sum[i] = sum[i] % 10;
            sum[i+1] += carry;
        }
         
        //处理前导0的问题
        int i = sum.length-1;
        while(sum[i] == 0 && i > 0) i--; 
        StringBuilder str = new StringBuilder();
        for(int q = i; q >=0; q--){
            str.append(sum[q]);
        }
        return str.toString();
    }
}
```

### Clear and Concise Solution

```java
class Solution {
    public String multiply(String num1, String num2) {
        int len1 = num1.length();
        int len2 = num2.length();
        int sumLen = len1 + len2;
        int []product = new int[len1+len2];    // store intermedia result
        for(int i = len1-1; i>=0; i--){
            for(int j = len2-1; j>=0; j--){
                int index = sumLen - i - j -2;
                product[index] += (num1.charAt(i)-'0') * (num2.charAt(j) - '0');
                product[index+1] += product[index]/10;
                product[index] %= 10;
            }
        }
        StringBuilder sb = new StringBuilder();
        for(int i = product.length - 1; i>0; i--){
            if(sb.length() == 0 && product[i] == 0){
                continue;
            }
            sb.append(product[i]);
        }
        sb.append(product[0]);
        return sb.toString();
    }
}
```