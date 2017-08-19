# 155 Min Stack

Tag:

- Easy
- String
- 哪个公司都考...

Todos:

- ...

一句话简介

> 用两个栈模拟

需要注意的是:

- 两种做法，一种每个操作都判断
- 另一种每个操作都存冗余



## Java Solution

### 存冗余

方法特点：...简单不易出错

```java
class MinStack {
    
    private Stack<Integer> dataStack;
    private Stack<Integer> minStack;
    
    /** initialize your data structure here. */
    public MinStack() {
        dataStack = new Stack<>();
        minStack = new Stack<>();
    }
    /** if the stack is empty,  */
    public void push(int x) {
        if(dataStack.empty()){
            minStack.push(x);
        }else{
            int curMin = Math.min(x,minStack.peek());
            minStack.push(curMin);
        }
        dataStack.push(x);
    }
    
    public void pop() {
        dataStack.pop();
        minStack.pop();
    }
    
    public int top() {
        return dataStack.peek();
    }
    
    public int getMin() {
        return minStack.peek();
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack obj = new MinStack();
 * obj.push(x);
 * obj.pop();
 * int param_3 = obj.top();
 * int param_4 = obj.getMin();
 */
```

### 判断写法

......

```java

```

### LinkedList 自以为很快法

实际上更慢了...估计自己实现一个linkedlist会快一点()

```java
class MinStack {
    
    private LinkedList<Integer> dataStack;
    private LinkedList<Integer> minStack;
    
    /** initialize your data structure here. */
    public MinStack() {
        dataStack = new LinkedList<>();
        minStack = new LinkedList<>();
    }
    /** if the stack is empty,  */
    public void push(int x) {
        if(0==dataStack.size()){
            minStack.addFirst(x);
        }else{
            int curMin = Math.min(x,minStack.peekFirst());
            minStack.addFirst(curMin);
        }
        dataStack.addFirst(x);
    }
    
    public void pop() {
        dataStack.removeFirst();
        minStack.removeFirst();
    }
    
    public int top() {
        return dataStack.peekFirst();
    }
    
    public int getMin() {
        return minStack.peekFirst();
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack obj = new MinStack();
 * obj.push(x);
 * obj.pop();
 * int param_3 = obj.top();
 * int param_4 = obj.getMin();
 */
```

