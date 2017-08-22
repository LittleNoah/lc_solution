# 255 Implement Stacks using Queues

Tag:

- Easy
- Stack
- Bloomberg

Todos:

- ...

一句话简介

> 用两个栈模拟,一个进一个出
>
> 马丹的看错题了啊！

需要注意的是:

- 这种题都要你在构造函数初始化一下...别弄错地方
- top和



## Java Solution

### 存冗余

方法特点：...简单不易出错

```java
class MyStack {
    private LinkedList<Integer> queue;
    /** Initialize your data structure here. */
    public MyStack() {
        queue = new LinkedList<>();
    }
    
    /** Push element x onto stack. */
    public void push(int x) {
        queue.addFirst(x);
    }
    // two condistions must be satisfied
    /** Removes the element on top of the stack and returns that element. */
    public int pop() {
        return queue.pollFirst();
    }
    
    /** Get the top element. */
    public int top() {
        return queue.peekFirst();
    }
    
    
    /** Returns whether the stack is empty. */
    public boolean empty() {
        if(0 == queue.size()){
            return true;
        }
        return false;
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * MyStack obj = new MyStack();
 * obj.push(x);
 * int param_2 = obj.pop();
 * int param_3 = obj.top();
 * boolean param_4 = obj.empty();
 */
```
