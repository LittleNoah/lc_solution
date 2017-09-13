# Description

要求生成格雷码

# Ideas

以下摘抄自 [blog](http://bangbingsyb.blogspot.com/2014/11/leetcode-gray-code.html)

思路：

例举grey code序列，并找规律 :
```
n = 0: 0
n = 1: 0, 1
n = 2: 00, 01, 11, 10  (0, 1, 3, 2)
n = 3: 000, 001, 011, 010, 110, 111, 101, 100 (0, 1, 3, 2, 6, 7, 5, 4)
以n = 3为例，grey code中前4个包括了n = 2的所有gray code。后4个则是前4个逆序后加上2^2。
``` 

**推广：n = i的grey code的前一半包括了n = i-1的所有grey code，而后一半则为前一半逆序后家上2^(i-1)。**


# Solutions

## 找规律法 

解答树有 `2^n`节点，跟子集数量相同

第一次submit没过...因为自己<del>傻逼呵呵</del>加了个冗余的空集，还有递归函数里面的A[pos]更新应该用循环变量

```java
class Solution {
    public List<Integer> grayCode(int n) {
        List<Integer> res = new ArrayList<>();
        if(n < 0){
            return res;
        }
        res.add(0);
        int inc = 1;
        for(int i = 1; i<=n; i++){ // notice here 因为0已经弄过了，所以要从1开始
            for(int j = res.size()-1; j>=0; j--){
                res.add(res.get(j)+inc);
            }
            inc <<= 1;
        }
        return res;
    }
}
```

