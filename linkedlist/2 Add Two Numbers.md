# 2 Add Two Numbers

Tags:

- Linked List
- Amazon, Airbnb, Microsoft

坑:

- 计算carry的时候要用sum
- 最后要判断是否有多余的进位

## Description


## Ideas

要记录carry的状态，如果此时我们用一个变量表示carry而不是用一个标志表示，就会减少很多工作量

如果我们单纯的每次都用同样的状态去计算加法，会减少很多不必要的工作量

## Java Solutions

### Perfect Solution

值得反复学习的一个答案...

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
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode ptr1 = l1;
        ListNode ptr2 = l2;
        ListNode head = new ListNode(0);
        ListNode curr = head;
        int carry = 0;
        while(ptr1 != null || ptr2 != null){
            int n1 = ptr1 != null ? ptr1.val : 0;
            int n2 = ptr2 != null ? ptr2.val : 0;
            int sum = n1 + n2 + carry;
            carry = sum/10;   //注意这里应该是sum不是n1+n2，不然会遇到进位判断出错
            curr.next = new ListNode(sum%10);
            curr = curr.next;
            if(ptr1 != null){ ptr1 = ptr1.next; }
            if(ptr2 != null){ ptr2 = ptr2.next; }
        }
        if(carry > 0){    // notice here
            curr.next = new ListNode(1);
        }
        return head.next;
    }
}
```