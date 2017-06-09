# 229 Majority Element II

Tag:

-  Medium
-  Array
-  HashMap
-  Majority Vote
-  Bit manipulation

Todo List:

- [ ] 排序算法的复杂度 <- DSA课程
- [ ] Moore Voting Algorithm

## Problem Description

输入一个数组 nums, 找出其中的majority element，定义是occurrence超过size的三分之一的下界

要求空间复杂度`O(1)`

有点醉

## Ideas

直接从majority element过来的...第（唯一）一个想法是用Hash，这样的复杂度大概是O(n),但是题目要求，因为题目已经给定说majority元素一定存在，所以我们在遍历到一半的时候开始验证当前元素是否是majority元素即可，运气好就不需要遍历整个数组

然后这个题其实就只有一种解法了...就是Boyer Moore Voting Algorithm

需要在选majority candidate 的时候，选两个，并且让这两个互不干扰互相的选举即可

## Ruby Solutions



### HashMap Solution 

`O(N) O(N)`了

代码如下：

```ruby
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
    count_hash = Hash.new(0)
    third_len = (nums.length / 3.0).floor
    target = []
    nums.each_with_index do |num,index|
        count_hash[num] += 1
        target<<num if index>=third_len && count_hash[num]>third_len
    end
    target.uniq
end
```



### Boyer-Moore Majority Vote Algorithm

代码如下：

```ruby
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
    return [] if nums.size.zero?
    third_len = (nums.size / 3.0).floor
    # initialize target one two and two counters
    target_one, target_two, counter_one, counter_two = nums[0], nums[0], 0, 0
    nums.each do |num|
        if num==target_one then
            counter_one+=1
        elsif num==target_two then
            counter_two+=1
        elsif counter_one.zero? then
            target_one = num
            counter_one = 1
        elsif counter_two.zero? then
            target_two = num
            counter_two = 1
        else
            counter_one-=1
            counter_two-=1
        end
    end
    # verification
    c1 = 0
    c2 = 0
    nums.each do |num|
        if num==target_one then
            c1+=1
            next
        end
        if num==target_two then
            c2+=1
        end
    end
    result_arr = []
    result_arr << target_one if c1 > third_len
    result_arr << target_two if c2 > third_len
    return result_arr.uniq
end
```



### Bit Manipulation

Ruby可以告别带负数的Bit Manipulation题目了。。妈蛋

这道题不能用Bit Manipulation, 时间复杂度感觉不太对



## Java Solutions

**注意** 主要有几个坑要注意

- **类型转换** ：Java的Math.floor()返回值是一个double，最好用long接收然后还得强转，不然就报错
- HashMap的API是 HashMap.containsKey
- put的时候注意要put key, value

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

需要注意的有：**不要在一行里初始化多个变量，会报错，记得最后返回值。。。**

### Boyer-Moore Majority Vote Algorithm

代码如下

```java
public List<Integer> majorityElement(int[] nums) {
  if(nums.length == 0){
    return new ArrayList<Integer>();
  }
  long third_len = (long) Math.floor(nums.length / 3.0);
  int t1 = nums[0];
  int t2 = nums[0];   // target one, target two
  int count1 = 0;
  int count2 = 0; // counter for two targets
  for(Integer num:nums){
    if(num == t1){
      count1+=1;
    }else if(num == t2){
      count2+=1;
    }else if(count1==0){
      t1 = num;
      count1 = 1;
    }else if(count2==0){
      t2 = num;
      count2 = 1;
    }else{
      count1--;
      count2--;
    }
  }
  count1 = 0;
  count2 = 0;
  for(Integer num:nums){
    if(num == t1){
      count1+=1;
      continue;   // this can avoid adding same element
    }
    if(num == t2){
      count2+=1;
    }
  }
  List<Integer> majorityList = new ArrayList<Integer>();
  if(count1 > third_len){
    majorityList.add(t1);
  }
  if(count2 > third_len){
    majorityList.add(t2);
  }
  return majorityList;
}
```



## Bit Manipulation

Code:

```java

```



