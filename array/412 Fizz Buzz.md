# 412 Fizz Buzz

Tag:

- Easy
- Array

Todo List:



Notice:

- 判断一个数能否间接性的被整除，两种想法，记录interval的下一个index，或者直接用`a % b`计算

## Problem Description

输入一个整数N,从1到N输出一个数组

> Write a program that outputs the string representation of numbers from 1 to *n*.
>
> But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.

具体很蠢了...

## Ideas

第一个想法就是取余数了..感觉没啥多余思路

## Ruby Solutions

**坑**：注意一下ruby的upto方法



### 取余 Solution 

`O(N) O(N)`了

代码如下：

```ruby
# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
    res_list = []
    1.upto(n) do |time|
        if time%15 ==0 then
            res_list << "FizzBuzz"
        elsif time%3==0 then
            res_list << "Fizz"
        elsif time%5==0 then
            res_list << "Buzz"
        else
            res_list << time.to_s
        end
    end
    res_list
end
```

### Interval法

可以说同样愚蠢了...但是居然Beat了97.53%的同胞。。。

```ruby
# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
    res_list = []
    fizz_num, buzz_num = 3, 5
    1.upto(n) do |time|
        if time==fizz_num && time==buzz_num then
            res_list << "FizzBuzz"
            fizz_num+=3
            buzz_num+=5
        elsif time==fizz_num then
            res_list << "Fizz"
            fizz_num+=3
        elsif time==buzz_num then
            res_list << "Buzz"
            buzz_num+=5
        else
            res_list << time.to_s
        end
    end
    res_list
        
end
```





## Java Solutions

**注意** 主要问题就是注意下从int转成String, 需要用String.valueOf(int)或者Integer.toString(int)

### Interval Solution

代码如下

```java
public class Solution {
    public List<String> fizzBuzz(int n) {
        List<String> result = new ArrayList<String>();
        int fizz, buzz;
        fizz = 3;
        buzz = 5;
        String str_fizzbuzz = "FizzBuzz";
        String str_fizz = "Fizz";
        String str_buzz = "Buzz";
        for(int i=1; i<=n; i++){
            if( i == fizz && i == buzz){
                result.add(str_fizzbuzz);
                fizz+=3;
                buzz+=5;
            }else if( i == fizz){
                result.add(str_fizz);
                fizz += 3;
            }else if(i == buzz){
                result.add(str_buzz);
                buzz += 5;
            }else{
                result.add(String.valueOf(i));
            }
        }
        return result;
    }
}
```

