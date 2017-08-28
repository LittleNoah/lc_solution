# 141 Linked List Cycle

Tags:

- Medium
- Linked List
- Microsoft, Bloomberg, Uber

坑:

- ...

Todos
- [ ] 弄清楚这题怎么讲，[answer](https://leetcode.com/articles/linked-list-cycle/)


## Description

Given a linked list, determine if it has a cycle in it.

Follow up:
Can you solve it without using extra space?

## Ideas

第一想法是用栈或者HashMap...但是follow-up不太好弄

follow-up可以用跑圈反超计算...但是感觉效率不高啊

## Java Solutions

### Stack Solution



```java

```

### Follow-up Solutions

```java
public class Solution {
    public boolean hasCycle(ListNode head) {
        if(head == null){
            return false;
        }
        if(head.next == head){
            return true;
        }
        ListNode slow = head;
        ListNode fast = head;
        while(fast != null && fast.next != null){
            slow = slow.next;
            fast = fast.next.next;
            if(fast == slow){
                return true;
            }
        }
        return false;
    }
}
```