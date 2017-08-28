# 234 Palindrome Linked List

Tags:

- Easy
- Linked List
- Amazon, Facebook

坑:

- ...

## Description

> Given a singly linked list, determine if it is a palindrome.

> Follow up:
> Could you do it in O(n) time and O(1) space?


## Ideas

可以用栈，然后跟前面比较即可，也可以用一半的栈...

Follow-up这个题的话，我们可以用
...

## Java Solutions

### Stack Solution

重点在于开头那部分找到中间节点的思想，这里用到的是O(N)的空间O(N)的时间

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
    public boolean isPalindrome(ListNode head) {
        if(head == null || head.next == null){
            return true;
        }
        // 1. get the head node of right half
        ListNode leftTail = head;
        ListNode fast = head;
        while(fast.next != null && (fast.next).next != null){
            leftTail = leftTail.next;
            fast = (fast.next).next;
        }
        // 2. the right head, en-stack
        ListNode rightHead = leftTail.next;
        Deque<ListNode> stack = new ArrayDeque<>();
        while(rightHead != null){
            stack.push(rightHead);
            rightHead = rightHead.next;
        }
        // 3. compare
        while(!stack.isEmpty()){
            if(head.val != stack.pop().val){
                return false;
            }
            head = head.next;
        }
        return true;
    }
}
```

### 空间是O(1) Solutions

```java
```