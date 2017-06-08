# 167 Majority Element Problem

Tag:

-  Easy
- Array
- HashMap
- Majority Vote
- Bit manipulation

Todo List:

- [ ] 排序算法的复杂度 <- DSA课程
- [x] Bit manipulation 解法

## Problem Description

输入一个数组 nums, 找出其中的majority element

majority的定义是，这个元素的occurrence超过nums数组size的一半 

举个栗子，`[1,2,1,3,1]` 里 1 就是 majority element

## Ideas 

第一个想法是用Hash，这样的复杂度大概是O(n)，因为题目已经给定说majority元素一定存在，所以我们在遍历到一半的时候开始验证当前元素是否是majority元素即可，运气好就不需要遍历整个数组

剩下的想法全是从Discussion里看来的...

* 如果数组是有序的话，那么中间那个元素肯定是majority element，因为majority比一半还多
  * 时间/空间复杂度取决于排序算法
  * 先sort，然后取中间值 （可能是`O(nlog n)`）
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

* 位操作法的思路是，用32bit的integer，从末位开始查所有数的1和0的数量，1多代表众数这位是1,0多就是众数这位是0，然后一位一位的组合起来...

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
# @return {Integer
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



### Bit Manipulation

Ruby可以告别带负数的Bit Manipulation题目了。。妈蛋

```ruby
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
    majority = 0
    # iter 32 rounds of counting bits
    32.times do |iter_round| 
        filter_bit = 1 << iter_round
        count_one = 0
        count_zero = 0
        # counting bits
        nums.each do |num|
            num & filter_bit != 0 ? count_one+=1 : count_zero+=1  # &notice: here, we need to use not equal to zero
        end
        # if this bit is one, then append it by or operator
        majority |= filter_bit if count_one > count_zero
    end
    majority
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
public class Solution {
    public int majorityElement(int[] nums) {
        int target = nums[0];
        int counter = 0;
        for( Integer num:nums){
            if(0 == counter){
                target = num;
                counter = 1;
            }else if(target == num){
                counter+=1;
            }else{
                counter-=1;
            }
        }
        return target;
    }
}
```



## Bit Manipulation

Code:

```java
public class Solution {
public int majorityElement(int[] nums) {
    int result = 0;
    long half_len = (long) Math.floor(nums.length/2.0);
    for (int i = 0; i < 32; i++) {
        int counter_one = 0;
        int filter_mask = 1<<i;
        for (int j = 0; j < nums.length; j++) {
            if ((nums[j] & filter_mask) != 0) {
                counter_one += 1;
            }
        }

        if (counter_one > half_len){
            result |= filter_mask;
        }
    }
    
    return result;
}
}
```



