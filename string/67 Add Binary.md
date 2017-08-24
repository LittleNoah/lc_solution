# 67 Add Binary

Tags:

- String
- Facebook, Twitter

坑:

- ...理解乘法

## Description

本题是Add Strings, Multiply Strings的similiar question，解起来一气呵成(逃跑

**其实还是要注意这个最后有一个多余的carry到底怎么处理，因为之前是新建一个节点，而在这道题我们是用数组的**

## Ideas

...

## Java Solutions

### My Solution

```java
class Solution {
    public String addBinary(String a, String b) {
        int len1 = a.length();
        int len2 = b.length();
        int []res = new int[len1+len2+1];
        int ptr1 = len1-1;
        int ptr2 = len2-1;
        int curr = 0;
        // iterate
        int carry = 0;
        while(ptr1 >=0 || ptr2 >= 0){
            int bit1 = ptr1>=0 ? Character.getNumericValue(a.charAt(ptr1)) : 0;
            int bit2 = ptr2>=0 ? Character.getNumericValue(b.charAt(ptr2)) : 0;
            int sum = bit1 + bit2 + carry;
            carry = sum/2;
            res[curr] = sum%2;
            curr += 1;
            ptr1 -= 1;
            ptr2 -= 1;
        }
        if(carry > 0){
            res[curr] = 1;  // notice here
        }
        StringBuilder sb = new StringBuilder();
        for(int i = res.length-1; i>=0; i--){
            if(sb.length()==0 && res[i]==0){
                continue;
            }
            sb.append(res[i]);
        }
        if(sb.length()==0){ // the represents that all chars are 0
            sb.append("0");
        }
        return sb.toString();
    }
}
```

### Clear and Concise Solution

```java

```