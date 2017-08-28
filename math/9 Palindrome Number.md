# 9 Palindrome Number

Tags:

- Math
- ???

坑:

- ....

## Description

要求判断一个数是否是回文数，要求without extra space

## Ideas

要记录carry的状态，如果此时我们用一个变量表示carry而不是用一个标志表示，就会减少很多工作量

如果我们单纯的每次都用同样的状态去计算加法，会减少很多不必要的工作量

## Java Solutions

### Perfect Solution

值得反复学习的一个答案...
每次取个位...

```java
class Solution {
    public boolean isPalindrome(int x) {
        // invalid case
        if(x < 0 || (x!=0 && x%10==0)){
            return false;
        }
        int shadow = 0;
        while(x > shadow){
            shadow = shadow * 10 + x%10;
            x = x/10;
        }
        if(x == shadow || x==shadow/10){
            return true;
        }
        return false;
    }
}

```