# 136 Single Number

Tags:

- Easy
- Array, Hash Table, Bit Manipulation
- ???

坑:

- ...

Todos
- [ ] 弄清楚这题怎么讲
- [ ] Hash Table Solution


## Description

Given an array of integers, every element appears twice except for one. Find that single one.

Note:
- Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
Note:



## Ideas

1. HashTable Store
2. XOR [异或的性质](http://blog.csdn.net/mrbcy/article/details/62883489)

## Java Solutions

### HashTable Solution



```java

```

### XOR Solutions

```java

```

# 137 Single Number II

## Description

数组里，除了其中一个二货，都出现过三次，这个二货就他自己(one time)

## Ideas

这题有意思了...不知道咋做了又

### Sort

_注意到这道题没有说不允许排序_，所以可以sort以后更新一个状态来找，关键点在于:

- 最后要加一个guard condition判断一下是否最后一个元素是the one(其实按照题目描述可以说是当然啦)
- 要注意返回的那个货是不是我们想要的

本思路参考了这位[大大](http://blog.csdn.net/kenden23/article/details/13625297)的博客

### Bit Sum

之前比较困没想明白，今天没吃饭想清楚了思路是这样的：

#### Psedo Idea

1. 首先对每一位求和
  a. 对求和的结果`sum%3`
2. 把update后的各位sum拼起来

#### Why?

因为转化为二进制0/1的角度来看，比如说我们有110 110 110三个数
```
110
110
110
----------------
330      // % 3
---------------
000

```
这样这个出现三次的数就被清除掉了呢 __(: 3 

### Bit Mask

这个比较诡异...以后脑袋清醒再看

## Coding Solutions

### Sort

Java Code:

```java
public int singleNumber(int[] nums) {
    if(nums.length == 1){
        return nums[0];
    }else if(nums.length == 0){
        return -1;
    }
    
    Arrays.sort(nums);
    int cnt = 1;
    for(int i = 0; i<nums.length-1; i++){
        if(nums[i+1] == nums[i]){
            cnt += 1;
        }else{
            if(cnt < 3){
                return nums[i];
            }
            cnt = 1; // re-init
        }
    }
    // notice here, need a guard condition
    if(cnt < 3){
        return nums[nums.length-1] ;
    }
    return -1;
}
```

### Bit % 3

Java Code:

**注意几点**

1. Java不能像C++那样去用位运算结果当if condition
2. 最好是降位之后求成1/0来计算

```java
public int singleNumber(int[] nums) {
    if(nums.length == 1){
        return nums[0];
    }else if(nums.length == 0){
        return -1;
    }

    int count = 0;
    int res = 0;
    for(int i = 31; i >= 0; i--){
        int mask = 1 >> i; // mask bit used to get the 
        for(int num : nums){// 这里我们没有直接extract出这位的数值，而是利用他和掩码的计算结果判断
            count += (num>>i)&1;
            // count = (num & mask)!=0 ? count+1 : count;  // this doesn't work in Java
        }
        count = count%3;
        res |= (count << i);
        count = 0;
    }
    return res;
}
```


# 260 Single Number III

## Description

数组里，除了其中两个二货，都出现过两次，这俩货就他俩自己是单身狗(one time)

## Ideas

这题有意思了...

反正用HashMap最简单...

### Bit Idea

用Single Number I的解法，可以求得最终结果的异或值，然后利用这个异或值求出这俩货

__*几个skills: 获得最后1位1*__

```java
// get the last 1 bit of x1xorx2, e.g. 1010 ==> 0010
int last1Bit = x1xorx2 - (x1xorx2 & (x1xorx2 - 1));
```

#### Why it works?

我们这里讲一下为什么这个分组好用蛤，网上的博客都在直接说成对所以work，但是没有详细解释

我们来这么看，数组里所有的number(包括这俩target number)，在这一位上(异或结果)，不是0，就是1。

而如果是0，那么一定有跟它配对的另一个是0，因为他们都成对出现，是1同理

所以我们按照这一位来分组的话，最后只能怪第结果就是两个target数字啦

### Sort


## Coding Solutions

### Hash Table

用HashMap主要是注意一下这个遍历Map的方法

```java
public int[] singleNumber(int[] nums) {
    int[] res = new int[2];
    int idx = 0;
    Map<Integer, Integer> map = new HashMap<>();
    for(int num : nums){
        int count = 0;
        if(map.containsKey(num)){
            count = map.get(num) + 1;
        }else{
            count = 1;
        }
        map.put(num, count);
    }
    for(Map.Entry<Integer,Integer> entry: map.entrySet()){
        if(entry.getValue() == 1){
            res[idx] = entry.getKey();
            idx += 1;
        }
    }
    return res;
}
```

### Bit Solution

Java Code:

__Notice:__

- 位运算一定要加括号...

```java
public int[] singleNumber(int[] nums) {
    // get the xor result of a1, a2
    int xorRes = 0;
    for(int num : nums){
        xorRes ^= num;
    }
    // get one bit with the value of 1
    int groupMask = xorRes - (xorRes & ( xorRes-1 ));   // notice here, the parenthesis is necessary
    int res1 = 0;
    int res2 = 0;
    for(int num : nums){
        if( (num & groupMask) == 0 ){
            res1 ^= num;
        }else{
            res2 ^= num;
        }
    }

    int[] resArray = {res1, res2};
    return resArray;
}
```


# Summary

...