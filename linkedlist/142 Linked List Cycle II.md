# 142 Linked List Cycle II

Tags:

- Medium
- Linked List
- ???

坑:

- ...

Todos
- [ ] 弄清楚这题怎么讲，[answer](https://leetcode.com/articles/linked-list-cycle-ii/)


## Description

Given a linked list, return the node where the cycle begins. If there is no cycle, return null.

Note: Do not modify the linked list.

Follow up:
Can you solve it without using extra space?

## Ideas

这题有个大神的(博客)[http://wuchong.me/blog/2014/03/25/interview-link-questions/]总结了...

第一想法是用HashMap,非常容易找到

follow-up可以用跑圈反超计算...然后思路是从头和从汇合点走的话，再次回合的地方肯定是入圈点..

## Java Solutions

### Stack Solution



```java

```

### Follow-up Solutions

```java
public ListNode detectCycle(ListNode head) {
    if(head == null || head.next == head){ // null or head is pointing to itself
        return head;
    }
    
    ListNode slow = head;
    ListNode fast = head;
    boolean hasCycle = false;
    while(fast != null && fast.next != null){
        slow = slow.next;
        fast = fast.next.next;
        if(fast == slow){   // hasCycle
            hasCycle = true;
            break;
        }
    }
    if(hasCycle){
        slow = head;
        while(slow != fast){
            slow = slow.next;
            fast = fast.next;
        }
        return slow;   
    }
    return null;
}
```