# Bit Manipulation

---

## Intro

这回咱们讲一下位运算

## Big Ideas

位运算能解决的问题：

167 Majority Element Problem，用来算每一位的majority然后组合成这个majority element



## Ruby Solution

**位运算的题就放弃Ruby吧...**

Operation Table

|  &   | 与运算         |
| :--: | ----------- |
|  \|  | 或运算         |
|  ^   | 异或 XOR      |
|  ~   | 取反运算        |
|  <<  | 左移运算 `a<<2` |
|  >>  | 右移运算 `b>>2` |

```ruby
# all samples
# String.ord Return the Integer ordinal of a one-character string. 其实就是返回ASCII码
"a".ord #=> 97

# bitwise AND 
0b1 & 0b1 # => 1
0b0 & 0b1 # => 0

# 从0开始循环置某一位为1
# times will start from 0
32.times do |time| 
  1 << time
  # 只取某一位
  if ((num & (1 << i)) != 0) then
  end
end
```





```ruby
# bit swap sample code
a = 5
b = 7
a.to_s(2) # => "101"
b.to_s(2) # => "111"

```



## Java Solution

f