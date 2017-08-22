# 232 Implement Queue using Stacks

Tag:

- Easy
- Stack
- Microsoft, Bloomberg

Todos:

- ...
- https://leetcode.com/articles/implement-queue-using-stacks/

一句话简介

> 用两个栈模拟,一个进一个出
>
> 马丹的看错题了啊！

需要注意的是:

- 这种题都要你在构造函数初始化一下...别弄错地方
- top和pop都需要判断下

## Java Solution

### 两个栈

方法特点：...简单不易出错

```java
class MyQueue {
    private Stack<Integer> pushStack;
    private Stack<Integer> popStack;
    /** Initialize your data structure here. */
    public MyQueue() {
        pushStack = new Stack<>();
        popStack = new Stack<>();
    }
    private void migrateData(){
        if(popStack.empty()){
            while(!pushStack.empty()){
                popStack.push(pushStack.pop());
            }
        }
    }
    /** Push element x to the back of queue. */
    public void push(int x) {
        pushStack.push(x);
    }
    
    /** Removes the element from in front of queue and returns that element. */
    public int pop() {
        // pop all elements in pushStack to popStack
        migrateData();
        return popStack.pop();
    }
    
    /** Get the front element. */
    public int peek() {
        migrateData();
        return popStack.peek();
    }
    
    /** Returns whether the queue is empty. */
    public boolean empty() {
        if(pushStack.empty() && popStack.empty()){
            return true;
        }
        return false;
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * MyQueue obj = new MyQueue();
 * obj.push(x);
 * int param_2 = obj.pop();
 * int param_3 = obj.peek();
 * boolean param_4 = obj.empty();
 */
```

### ...

......

```java

```

