# 268 Missing Number

Tags:

- Easy
- Math, Array
- ???

坑:

- ...

Todos
- [ ] 求和公式怎么用英语表达


## Description

Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.

For example,

Given nums = [0, 1, 3] return 2.

**Note:**

Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?

## Ideas

1. 求和公式
2. XOR大法

## Java Solutions

### 求和公式

```java
public int missingNumber(int[] nums) {
    int n = nums.length;
    int sum = n*(n+1)/2; // 求和公式: n*(a_0 + a_n) / 2
    for(int num : nums){
        sum -= num;
    }
    return sum;
}
```

### XOR大法

和Single Number一样的思路，只不过这次我们先从头求一遍再重新来一遍...

```java
public int missingNumber(int[] nums) {
    int n = nums.length;
    int xor = 0;
    for(int i = 0; i <= n; i++){
        xor ^= i;
    }

    for(int num : nums){
        xor ^= num;
    }
    return xor;
}
```