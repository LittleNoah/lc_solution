# 581 Shortest Unsorted Continous Subarray

Tag:

- Easy
- Array
- ?

Todo List:

- [ ] 看懂答案

Notice:

- ​

## Problem Description

输入一个整数N,从1到N输出一个数组

> Write a program that outputs the string representation of numbers from 1 to *n*.
>
> But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.

具体很蠢了...

## Ideas

贪心，每个都看能不能插入，能就插入

## Ruby Solutions

**坑**：注意一下ruby的upto方法



### Greedy Solution

`O(N) O(N)`了

代码如下：

```ruby
# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
def can_place_flowers(flowerbed, n)
  return true if n==0
  return 0 if flowerbed.size.zero?
  len = flowerbed.size
  result = 0
  flowerbed.each_with_index do |plot, index|
      next if plot==1 # skip planted plot
      next if index>0 && flowerbed[index-1]==1
      next if index<len-1 && flowerbed[index+1]==1
      flowerbed[index] = 1
      result+=1
  end
  return result>=n # if possible is more than n
end
```



## Java Solutions

**注意** 没啥注意的..

### Greedy Solution

代码如下

```java
public class Solution {
    public boolean canPlaceFlowers(int[] flowerbed, int n) {
    	if(n==0){return true;}
        int len = flowerbed.length;
        int result = 0;
        for(int i=0; i < len; i++){
            if(flowerbed[i] == 1) {
                continue;
            }else if(i>0 && flowerbed[i-1]==1  ) {
                continue;
            }else if(i<len-1 && flowerbed[i+1]==1){
                continue;
            }else{
                flowerbed[i] = 1;
                result+=1;
            }
        }
        if(result >= n){
            return true;
        }else{
            return false;
        }
    }
}
```

