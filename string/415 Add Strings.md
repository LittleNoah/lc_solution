# 415 Add Strings

Tags:

- String
- Facebook, Twitter

坑:

- ...理解乘法

## Description

本题是Add Binary, Add Strings, Multiply Strings的similiar question，解起来一气呵成(逃

__注意下输入都是空的corner case__

```java
if(num1.length() == 0 && num2.length() == 0){
    return "";
}
```

## Ideas

...

## Java Solutions

### My Solution

```java
class Solution {
    public String addStrings(String num1, String num2) {
        if(num1.length() == 0 && num2.length() == 0){
            return "";
        }
        int len1 = num1.length();
        int len2 = num2.length();
        int maxlen = Math.max(len1,len2) + 1;
        int []res = new int[maxlen];
        
        int ptr1 = len1-1;
        int ptr2 = len2-1;
        int carry = 0;
        int curr = 0;
        while(ptr1 >= 0 || ptr2 >= 0){
            int val1 = ptr1>=0 ? Character.getNumericValue(num1.charAt(ptr1)) : 0;
            int val2 = ptr2>=0 ? Character.getNumericValue(num2.charAt(ptr2)) : 0;
            int sum = val1+val2+carry;
            carry = sum/10;
            res[curr] = sum%10;
            curr += 1;
            ptr1 -= 1;
            ptr2 -= 1;
        }
        if(carry > 0){
            res[curr] = 1;
        }
        // build the result
        StringBuilder sb = new StringBuilder();
        for(int i = maxlen - 1; i >= 0; i--){
            if(sb.length() == 0 && res[i] == 0){
                continue;
            }
            sb.append(res[i]);
        }
        if(sb.length() == 0){   // special corner case, all chars are zero
            sb.append("0");
        }
        return sb.toString();
    }
}
```

### Clear and Concise Solution

```java

```