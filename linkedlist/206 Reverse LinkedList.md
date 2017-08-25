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

### Recurisive