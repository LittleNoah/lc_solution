# 328 Odd Even Linked List

Tags:

- LinkedList, Two Pointer
- Facebook

这题就是...没啥

坑:

- ...最好画下图，不然容易错

## Description

Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.

You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.

__Example:__

Given `1->2->3->4->5->NULL,`

return `1->3->5->2->4->NULL.`

__Note:__

+ The relative order inside both the even and odd groups should remain as it was in the input. 
+ The first node is considered odd, the second node even and so on ...


## Ideas

### Offical Solution
[官方答案](https://leetcode.com/articles/odd-even-linked-list/)

>


### My Idea

...

## Java Solutions

### 大二 Level Solution

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
    public ListNode oddEvenList(ListNode head) {
        if(null == head){
            return head;
        }
        ListNode curOdd = head;
        ListNode headEven = head.next;
        ListNode curEven = headEven;
        while(curEven != null && curEven.next != null){
            curOdd.next = curEven.next;
            curOdd = curOdd.next;
            curEven.next = curOdd.next;
            curEven = curEven.next;
        }
        curOdd.next = headEven;
        return head;
    }
}
```

