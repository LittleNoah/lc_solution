# 20 Valid Parentheses

Tag:

- Easy
- Stack
- HashMap

Todo List:

- [ ] Process Analysis
- [ ] Java的char

Notice:

- Java 的char的元类型是Character
- String需要用`String.charAt(index)`来取出char

## Problem Description

输入一串由三种括号组成的字符串

> Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
>
> The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not

什么意思呢，就是说括号要成对出现

## Ideas

用数组模拟Stack，一开始以为是队列，发现是Stack，直接POP更方便了。根据测试用例来看，他要求下一个出现的右括号的左边直接就有能匹配的，然后pop出这一对继续匹配

## Ruby Solutions

**坑**：坑主要在几个点，第一个是要判断是否是空串；第二是是否是偶数，如果是奇数那就没法match；最后还要看是否全部匹配到了，如果没有匹配全也是invalid的.

这里用到一个小技巧计算奇偶数: ` num & 1 == 0` 利用位运算，如果最后一位不是1，那么就是偶数了

### Array Solution 

`O(N) O(N)`了

代码如下：

```ruby
# @param {String} s
# @return {Boolean}
def is_valid(s)
    return true if s.size.zero?
    len = s.size
    # bit manipulation to judge odd or even
    return false if len & 1 != 0
    left_list = ['(', '[', '{']
    char_map = {}
    char_map[')'] = '('
    char_map[']'] = '['
    char_map['}'] = '{'
    valid_queue = []
    len.times do |index|
        if left_list.include?(s[index])
            valid_queue.push s[index] 
        else
            match_target = valid_queue.pop
            return false if match_target != char_map[s[index]]
        end
    end
    # all matched?
    return false if !valid_queue.size.zero?
    return true
end
```





## Java Solutions

**注意** 主要有几个坑要注意

这个题太无聊了。。。

全是坑,主要是从String里取字符

### Array Solution

代码如下

```java
public class Solution {
    public boolean isValid(String s) {
        int len = s.length();
        if( 0 == len || (len&1) != 0){  // == has high priority than bit &
            return false;
        }
        Stack<Character>matchStack = new Stack<Character>();
        for(int i = 0; i < len; i++){
            char ch = s.charAt(i);
            if( ch == ')'){
                if( matchStack.size()==0 || matchStack.pop() != '('){
                    return false;
                }
            }else if( ch == ']'){
                if( matchStack.size()==0 || matchStack.pop() != '['){
                    return false;
                }
            }else if( ch == '}' ){
                if(matchStack.size()==0 ||  matchStack.pop() != '{'){
                    return false;
                }
            }else{
                matchStack.push(ch);
            }
        }
        if(matchStack.size()!=0){
            return false;
        }
        return true;
    }
}
```

