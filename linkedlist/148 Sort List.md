# 148 Sort List
Tags:

- LinkedList
- Sort
- `nlogn`
- 一坨...

这题有MLE...感觉不让用栈了就

坑:

- Memory Limited Execeed
- ..

Todos:

- [x] Quick Sort?

## Description



## Ideas

### Offical Solution


### My Idea

...

Stack: Deque

## Java Solutions

### Merge Sort (Recursive)

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
    public ListNode sortList(ListNode head) {
        if(head == null || head.next == null){
            return head;
        }
        ListNode preSlow = null; // used to get the tail of first half list
        ListNode slowPtr = head;
        ListNode fastPtr = head;
        //1. split linked list 
        while(fastPtr != null && fastPtr.next != null){
            preSlow = slowPtr;
            slowPtr = slowPtr.next;
            fastPtr = (fastPtr.next).next;
        }
        //2. mergeSort
        preSlow.next = null; //断绝联系！
        ListNode l1 = sortList(head);
        ListNode l2 = sortList(slowPtr);
        
        ListNode resList = mergeSort(l1, l2);
        return resList;
    }
    
    ListNode mergeSort(ListNode l1, ListNode l2){
        ListNode headNode = new ListNode(0); // dummy head for locate
        ListNode curNode = headNode;
        while(l1 != null && l2 != null){
            if(l1.val < l2.val){
                curNode.next = l1;
                l1 = l1.next;
            }else{
                curNode.next = l2;
                l2 = l2.next;
            }
            curNode = curNode.next;
        }
        if(l1 != null){
            curNode.next = l1;
        }else if(l2 != null){
            curNode.next = l2;
        }
        return headNode.next;
    }
}
```

### Quick Sort 

```java
...
```

