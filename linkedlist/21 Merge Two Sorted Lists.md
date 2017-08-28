# 21 Merge Two Sorted Lists

Tags:

- LinkedList
- Sort
- `nlogn`
- 一坨...

这题有MLE...感觉不让用栈了就

坑:

- Time Limit Exceeded
  - 忘记update p1和p2了...
- ..

Todos:

- [x] Recursive 重做一遍

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
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        if(l1 == null){
            return l2;
        }else if(l2 == null){
            return l1;
        }
        ListNode vhead = new ListNode(0); // dummy head;
        ListNode curNode = vhead;
        ListNode p1 = l1;
        ListNode p2 = l2;
        while(p1 != null && p2 != null){
            if(p1.val < p2.val){
                curNode.next = p1;
                p1 = p1.next;
            }else{
                curNode.next = p2;
                p2 = p2.next;
            }
            curNode = curNode.next;
        }
        curNode.next = p1!=null ? p1 : p2;  // connect remaining nodes
        return vhead.next;
    }
}
```

### Pure Recursive

```java
public ListNode mergeTwoLists(ListNode l1, ListNode l2){
		if(l1 == null) return l2;
		if(l2 == null) return l1;
		if(l1.val < l2.val){
			l1.next = mergeTwoLists(l1.next, l2);
			return l1;
		} else{
			l2.next = mergeTwoLists(l1, l2.next);
			return l2;
		}
}
```

