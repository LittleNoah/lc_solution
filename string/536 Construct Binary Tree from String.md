# 536 Construct Binary Tree from String

Tag:

- Medium
- String, Tree
- Amazon...

Todos:

- 看看discussion的解法
- 实现迭代解法

一句话简介

> Hash

需要注意的是:

- **...每一个调用index取值的地方，一定要注意是否越界**
- 负数也要考虑啊混蛋！！！ 
  - 其实也可以考虑用Integer.parseInt(String.substring)来取value值，这样不用标正负

## Ideas

自己想法就是暴力递归

Discussion:

有个哥们的[思路](http://www.cnblogs.com/grandyang/p/6793904.html)

![construct_tree_idea](image\construct_tree_idea.png)

## Java Solution

### Naïve递归 

方法特点：...直观？第一印象

痛点：改起来到处是坑啊

主要以下几点：

1. 数组越界（尽管输入数据都是valid的，但是要在访问数据之前判断index是否越界
2. 负数的处理
   1. accepted `-` 符号
   2. 使用标志位标记最后逆转



```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    private static final char leftP = '(';
    private static final char rightP = ')';
    private static final char minus = '-';
    public TreeNode str2tree(String s) {
        if(0==s.length()){
            return null;
        }
        return buildTree(s,0);
    }
    
    public TreeNode buildTree(String s, int start){
        // read val
        int val = 0;
        int ptr = start;
        boolean isNegtive = false;
        while(ptr < s.length() && ( Character.isDigit(s.charAt(ptr)) || minus==s.charAt(ptr) ) ){
            if(minus == s.charAt(ptr)){
                isNegtive = true;
                val = 0;
            }else{
                val = val*10 + Character.getNumericValue(s.charAt(ptr));    
            }
            ptr += 1;
        }   // now ptr points at a "(" or ")"
        val = isNegtive ? -1*val : val;
        TreeNode node = new TreeNode(val);
        if(ptr >= s.length()){ // notice here
            return node;
        }
        int leftNum = 0;
        // read left tree
        if(leftP == s.charAt(ptr)){
            leftNum += 1;
            node.left = buildTree(s, ptr+1);
            ptr += 1;
        }
        // read right tree
        while(leftNum != 0){  // skip left parathesises
            char ch = s.charAt(ptr);
            if(rightP == ch){
                leftNum-=1;
            }else if(leftP == ch){
                leftNum+=1;
            }
            ptr+=1;
        }   // now ptr points to the character just on the right of the left subtree
        // two cases now: ')' or right subtree which starts with '('
        if(ptr < s.length() && leftP == s.charAt(ptr)){
            node.right = buildTree(s, ptr+1);
            ptr += 1;
        }
        return node;
    }
}
```

### 迭代解法

......

```java

```

### ...

...

```java

```

