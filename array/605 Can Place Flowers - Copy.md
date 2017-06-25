# 624 Maximum Distance in Arrays

Tag:

- Easy
- Array

Todo List:

- [ ] 邓老师的贪心讲解
- [ ] 处理特殊测试用例

Notice:

- 判断一个数能否间接性的被整除，两种想法，记录interval的下一个index，或者直接用`a % b`计算

## Problem Description

给一个01数组，判断是否能种花...

> Suppose you have a long flowerbed in which some of the plots are planted and some are not. However, flowers cannot be planted in adjacent plots - they would compete for water and both would die.
>
> Given a flowerbed (represented as an array containing 0 and 1, where 0 means empty and 1 means not empty), and a number **n**, return if **n** new flowers can be planted in it without violating the no-adjacent-flowers rule.

具体很蠢了...

## Ideas

贪心，每个都看能不能插入，能就插入

## Ruby Solutions

**坑**：注意一下ruby的upto方法



### Greedy Solution

`O(N) O(N)`了，注意一下用array.each的时候不能直接修改元素

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

