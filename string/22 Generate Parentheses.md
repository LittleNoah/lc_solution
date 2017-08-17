# 22 Generate Parentheses

Tag:

- Medium
- String
- Google, Uber, Zenifits

Todos:

- ....
- 迭代法

一句话简介

> 理解不透的递归...

需要注意的是:

- ...

## Java Solution

### Recursive 递归 

这个递归有点巧妙了....一定要手上画一下才能理解的...

```java
public class Solution {
    public List<String> generateParenthesis(int n) {
        List<String> list = new ArrayList<>();
        if(0==n){
            return list;
        }else if(1==n){
            list.add("()");
            return list;
        }
        helper(0,0,"",n,list);
        return list;
    }
    
    public void helper(int left, int right, String str,int n, List<String> list){
        if(left == n && right == n){ // backtracking, end the recursive call
            list.add(str);
            return ; 
        }
        
        if(left < n){
            helper(left+1, right, str+"(", n, list);
        }
        if(right < left){
            helper(left, right+1, str+")", n, list);
        }
    }
}
```

### Iterative 迭代

Todo...