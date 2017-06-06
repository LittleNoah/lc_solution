# 167 Majority Element Problem



## Problem Description

输入一个数组 nums, 找出其中的majority element

majority的定义是，这个元素的occurrence超过nums数组size的一半 

举个栗子，`[1,2,1,3,1]` 里 1 就是 majority element

## Ideas 

第一个想法是用Hash，这样的复杂度大概是O(n)，因为题目已经给定说majority元素一定存在，所以我们在遍历到一半的时候开始验证当前元素是否是majority元素即可，运气好就不需要遍历整个数组

剩下的想法全是从Discussion里看来的...

* 如果数组是有序的话，那么中间那个元素肯定是majority element，因为majority比一半还多
  * 时间/空间复杂度取决于排序算法
  * 先sort，然后取中间值
* 用Boyer-Moore majority vote algorithm
  * linear time and constant space
  * 只存一个majority数，然后从头开始遍历，一般取第一个元素作初始的majority

```ruby
Intialize majority, counter = 0
loop the array nums with index{
  if counter == 0
  	majority = nums[index]
  if nums[index] == majority
  	counter += 1
  else
  	counter -= 1
}
#写完跟Ruby几乎一毛一样，自爆吧你
```



## Ruby Solutions



### HashMap Solution

代码如下：

```ruby
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
    count_hash = Hash.new(0)
    half_len = (nums.length/2.0).floor
    target = 0
    nums.each_with_index do |num,index|
        count_hash[num] += 1
        return num if index>=half_len && count_hash[num]>half_len
    end
end
```



### Boyer-Moore Majority Vote Algorithm

代码如下：

```ruby
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
    target = nums[0]
    counter = 0
    nums.each do |num|
        if 0==counter then
            target = num
            counter = 1
        else
            target==num ? counter+=1 : counter-=1
        end
    end
    target
end
```





## Java Solutions

**注意** 主要有几个坑要注意

+ **类型转换** ：Java的Math.floor()返回值是一个double，最好用long接收然后还得强转，不然就报错
+ HashMap的API是 HashMap.containsKey
+ put的时候注意要put key, value

### Hash Solution

代码如下

```java
public class Solution {
    public int majorityElement(int[] nums) {
        long halfLength = (long) Math.floor(nums.length/2.0);
      	//当HashMap构建了一半的时候再开始check是否存在majority
        Map<Integer, Integer> hash = new HashMap<Integer, Integer>();
        int target = -999;
        for(int i = 0; i < nums.length; i++){
            if(! hash.containsKey(nums[i])){
                hash.put(nums[i],1);
            }else{
                hash.put(nums[i],hash.get(nums[i])+1);
            }
            if(i >= halfLength) {
                if(hash.get(nums[i]) > halfLength){
                    return nums[i];
                }
            }
        }
        return -1;
    }
}
```

需要注意的有：TODO

### Boyer-Moore Majority Vote Algorithm

代码如下

```java
dfff
  d
```





