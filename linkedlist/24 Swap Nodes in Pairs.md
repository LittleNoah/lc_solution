# 24 Swap Nodes in Pairs

Tags:

- Medium
- Linked List
- Microsoft, Bloomberg, Uber

坑:

- ...

## Description

 Given a linked list, swap every two adjacent nodes and return its head.

For example,
Given 1->2->3->4, you should return the list as 2->1->4->3.

Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.


## Ideas

呃呃呃，就是简单的互换一下，有pre有post画个示例图就可以了

## Java Solutions

### Easy Solution

_注意边界条件_

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
    public ListNode swapPairs(ListNode head) {
        if(head == null || head.next == null){
            return head;
        }
        ListNode vhead = new ListNode(0);
        vhead.next = head;
        ListNode pre = vhead;   // dummy head
        ListNode cur = head;
        ListNode post = null;
        while(cur != null && cur.next!=null){
            post = cur.next;
            cur.next = post.next;
            post.next = cur;
            pre.next = post;
            pre = cur;      // pre is the second element in this pair
            cur = cur.next; // move to next first element in next pair
        }
        return vhead.next;
    }
}
```

### 0.0 Solutions

```java
...
```