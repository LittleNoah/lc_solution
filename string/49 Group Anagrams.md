# 49 Group Anagrams

Tag:

- Medium
- String, HashTable
- Amazon, Uber, Facebook...

Todos:

- ...用暴力HashMap试一下

一句话简介

> Hash

需要注意的是:

- ...记得run之前检查一下是否加了`;` 是否对`corner case`进行了全面的处理

## Ideas

首先要想，我们怎么判断两个字符串是异构呢？肯定要转化为某种形式来判断

第一种，我们可以对每个字符串内部排序，然后比较，把这个排序后的字符串当做HashKey

第二种，我们可以统计字符串内每个字符的出现次数，这个出现次数就相当于fingerprint，我们可以当做key (int[26]和char[128]其实没啥差别)

## Java Solution

### 存冗余

方法特点：...简单不易出错

```java
class Solution {
    public List<List<String>> groupAnagrams(String[] strs) {
        List<List<String>> list  = new ArrayList<>();
        Map<Integer, List<String>> map = new HashMap<>();   // basically if strs is empty, the following two loop will not deal with it
        for(String str : strs){
            int key = getHashKey(str);
            // initialize list
            if(!map.containsKey(key)){
                List<String> tmpList = new ArrayList<>();
                map.put(key, tmpList);
            }
            map.get(key).add(str);
        }
        // extract as list
        for(List<String> tmpList : map.values()){
            list.add(tmpList);
        }
        return list;
    }
    // get hash code for s 
    public int getHashKey(String s){
        int[] arr = new int[26];
        for(int i = 0; i<s.length(); i++){
            arr[s.charAt(i)-'a'] += 1;
        }
        return Arrays.hashCode(arr);
    }
}
```

### Prime 相乘写法

......

```java

```

### 暴力排序法

...

```java

```

