# 657 Juedge Route Circle

Tag:

- Medium
- String

Todos:
- 用Manacher算法解决回文串问题 
- 自己来一次灵巧递归实现

一句话简介

> 回文串问题, 找到种子，优化用Manacher

> 学习LinkedList的用法, `pollLast, addFirst, addLast, peekFirst, peekLast`

需要注意的是:

如果你没有指定`LinkedList<int[]>` 那么leetcode的编译器不会自动推导，在取出元素的时候会类型转换错.

可以这样考虑，为了构成回文串，每个回文串一定有一个中心，通过这个中心去拓展我们就可以一点点的枚举每一个回文串，复杂度n^2

另外的一种方法，叫做`Mancacher's Algorithm`，暂时未学

## Java Solution

### 回文串中心Seed法（<del>自己取的名</del>）

方法特点：很慢

```java
public class Solution {
    public int countSubstrings(String s) {
        int ans = 0;
        // limit
        int len = s.length();
        int left = 0;
        int right = len-1;
        
        LinkedList<int[]> queue = new LinkedList();
        // initialize single point seeds
        for(int i=0; i<len; i++){
            insertPair(queue,i,i);
        }
        // initialize two points seeds
        for(int i=0; i<len-1; i++){
            char a = s.charAt(i);
            char b = s.charAt(i+1);
            if(a == b){
                insertPair(queue,i,i+1);
            }
        }
        // iterate each seed, expand one index and enqueue the expanded one if valid
        while(queue.size() > 0){
            int[] idxPair = queue.pollLast();
            ans += 1;   // each pair represent a valid palindromic string
            int l = idxPair[0]-1;
            int r = idxPair[1]+1;
            // the boundary
            if(l>=left && r<=right){    // expand and check valid
                if(s.charAt(l) == s.charAt(r)){
                    insertPair(queue,l,r);
                }
            }
        }
        return ans;
    }
    /** insert an array to queue**/
    public void insertPair(LinkedList queue, int l, int r){
        int[] tmpPair = {l, r};
        queue.addLast(tmpPair);
    }
}
```

### 改进版回文串中心Seed法（<del>自己取的名</del>）

改动：每次出队列后一顿++ --，直到不满足条件为止

特点：比上一个快40ms

```java
public class Solution {
    public int countSubstrings(String s) {
        int ans = 0;
        // limit
        int len = s.length();
        int left = 0;
        int right = len-1;
        
        LinkedList<int[]> queue = new LinkedList();
        // initialize single point seeds
        for(int i=0; i<len; i++){
            insertPair(queue,i,i);
        }
        // initialize two points seeds
        for(int i=0; i<len-1; i++){
            char a = s.charAt(i);
            char b = s.charAt(i+1);
            if(a == b){
                insertPair(queue,i,i+1);
            }
        }
        // iterate each seed, expand one index and enqueue the expanded one if valid
        while(queue.size() > 0){
            int[] idxPair = queue.pollLast();
            ans += 1;   // each pair represent a valid palindromic string
            int l = idxPair[0]-1;
            int r = idxPair[1]+1;
            // the boundary
            while(l>=left && r<=right){    // expand and check valid
                if(s.charAt(l) == s.charAt(r)){
                    ans += 1;
                    l-=1;
                    r+=1;
                }else{
                    break;
                }
            }
        }
        return ans;
    }
    /** insert an array to queue**/
    public void insertPair(LinkedList queue, int l, int r){
        int[] tmpPair = {l, r};
        queue.addLast(tmpPair);
    }
}
```

### 写的比较灵巧的递归

```java
public class Solution {
    int count = 0;
    
    public int countSubstrings(String s) {
        if (s == null || s.length() == 0) return 0;
        
        for (int i = 0; i < s.length(); i++) { // i is the mid point
            extendPalindrome(s, i, i); // odd length;
            extendPalindrome(s, i, i + 1); // even length
        }
        
        return count;
    }
    
    private void extendPalindrome(String s, int left, int right) {
        while (left >=0 && right < s.length() && s.charAt(left) == s.charAt(right)) {
            count++; left--; right++;
        }
    }
}
```