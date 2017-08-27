# 206 Reverse LinkedList
Tags:

- LinkedList
- 一坨...

这题有MLE...感觉不让用栈了就

坑:

- Memory Limited Execeed
- ..

Todos:

- other solutions

## Description



## Ideas

### Offical Solution


### My Idea

...

Stack: Deque

## Java Solutions

### Stack Solution (MLE)

```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
    public ListNode reverseList(ListNode head) {
        if(null == head){
            return null;
        }
        ListNode headNode = reverseListByStack(head);
        return headNode;
    }
    /**return the new head*/
    private ListNode reverseListByStack(ListNode head){
        Deque<ListNode> stack = new ArrayDeque<>();     // the implementation is addFirst and removeFirst
        ListNode curNode = head;
        while(curNode.next != null){
            stack.push(curNode);
            curNode = curNode.next; // SB, remember to update
        }
        // System.out.println("GGZH");
        ListNode headNode = curNode;
        // now curNode points the last node
        while(!stack.isEmpty()){
            curNode.next = stack.pop();
            curNode = curNode.next;
            // System.out.println("GGZH3");
        }
        // System.out.println("GGZH2");
        return headNode;
    }
}
```

### In-place replacement

重点在于我们要有对pre, cur, next的引用

最后当cur变成null的时候,pre就是最后一个节点
```java
private ListNode reverseListOne(ListNode head){
    ListNode pre = null;    // used to help to locate, start as an virtual node/null head
    ListNode next = null;
    while(head != null){
        next = head.next;
        head.next = pre;
        pre = head; // move to next window
        head = next;
    }
    return pre; // notice we need to return pre, because head has been assigned to null
}
```

### Recurisive

递归主要要求我们理解：置自己的next节点的next为本身，然后返回本身

```java
/** recurisive */
private ListNode reverseListTwo(ListNode head){
    if(head == null || head.next == null){
        return head;
    }
    ListNode p = reverseListTwo(head.next);
    head.next.next = head;
    head.next = null;
    return p;
}
```