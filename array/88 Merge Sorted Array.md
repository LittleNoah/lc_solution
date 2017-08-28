# 88 Merge Sorted Array

Tags:

- Array
- Two Pointer
- Microsoft

主要idea是逆向开车，本题说数组一的容量足够大

坑:

- ...

Todos:

- Recursive 重做一遍

## Description



## Ideas

### Offical Solution

### My Idea

...

Stack: Deque

## Java Solutions

### 暴力合并...

太容易出错了。。。

主要要考虑到，如果nums1遍历完了，怎么处理剩下的nums2

```java
class Solution {
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        if(n == 0){
            return;
        }else if(m == 0){   // interview question: how about m equal to zero
            // copy nums2 to nums1
            System.arraycopy(nums2, 0, nums1, 0, n);
        }
        int idx1 = m - 1;
        int idx2 = n - 1;
        int cur = 0;
        for(int i = m+n-1; i >= 0; i--){
            cur = i;
            if(idx1 >= 0 && idx2 >= 0){ // notce here, the best way to check the right condition is to use real example
                if(nums1[idx1] > nums2[idx2]){
                    nums1[i] = nums1[idx1];
                    idx1 -= 1;
                }else{
                    nums1[i] = nums2[idx2];
                    idx2 -= 1;
                }
            }else{
                break;
            }
        }
        while(idx2 >= 0){
            nums1[cur] = nums2[idx2];
            cur -= 1;
            idx2 -= 1;
        }
    }
}
```

### ...

```java
...
```

