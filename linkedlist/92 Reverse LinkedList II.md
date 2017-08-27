# 92 Reverse LinkedList II
Tags:

- LinkedList
- 一坨...

> 为毛__Reverse LinkedList I__是206题...

坑:

- 因为有个cnt，所以不需要约束cur.next != null
- ..

Todos:

- other solutions

## Description

<程序员代码面试指南>里链表部分

## Ideas

### Offical Solution


### My Idea

...

Stack: Deque

## Java Solutions


### In-place replacement

重点在于我们要有对pre, cur, next的引用

最后当cnt变成count的时候,pre就是最后一个节点
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
    public ListNode reverseBetween(ListNode head, int m, int n) {
        // handle corner case, but in leetcode it doesn't matter
        if( m<1 || n<1 || m > n){
            return null;
        }else if(m == n){
            return head;
        }
        ListNode pre = null;
        ListNode post = null;
        int cnt = 0;    // used to locate the node, valid index started from 1
        ListNode cur = head;
        while(cur != null ){    // notice here, we do not need cur.next!=null because we will break the loop when counter achieves
            cnt += 1; // now, current node is cnt th node in the list
            // System.out.println("cnt: " + cnt);
            // System.out.println("curNode: " + cur.val);
            if(cnt == m-1){ pre = cur;}
            if(cnt == n+1){ post = cur; break;}
            cur = cur.next; // notice: remember to do update!
        }
        // System.out.println("Post Node: " + post.val);
        ListNode pieceTail = pre!=null ? pre.next : head;
        // System.out.println("Piece Tail: " + pieceTail.val);
        ListNode pieceHead = reverseList(pieceTail, n-m+1);
        // System.out.println("Piece Head: " + pieceHead.val);
        pieceTail.next = post;
        if(pre != null){
            pre.next = pieceHead;
            return head;
        }else{
            return pieceHead;
        }
    }
    
    /** reverse list started from head and count nodes*/
    private ListNode reverseList(ListNode head, int count){
        int cnt = 0;    // count: number of nodes including the head
        ListNode pre = null;
        ListNode cur = head;
        ListNode post = null;
        while(cnt != count && cur != null){// notice here, we do not need cur.next!=null because we will break the loop when counter achieves
            cnt += 1;
            post = cur.next;
            cur.next = pre; // skip next node, let cur node points to the one next to post node
            pre = cur;
            cur = post;
        }
        return pre; 
    }
}
```

### Recurisive

递归主要要求我们理解：置自己的next节点的next为本身，然后返回本身

```java

```