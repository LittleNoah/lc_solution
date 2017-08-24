# 445 Add Two Numbers II

Tags:

- Linked List
- Bloomberg, Microsoft

坑:

- ...

## Description

本题是Add Binary, Add Strings, Multiply Strings的similiar question，解起来一气呵成(逃

__注意下输入都是空的corner case__

```java
if(num1.length() == 0 && num2.length() == 0){
    return "";
}
```

## Ideas

一般来说，要考虑以下几种corner case

- 输入都是空，或者其中一个为空
- 看一下是否carry > 0，处理最终进位

...

## Java Solutions

### My Solution

用两个栈把Node放进去...然后返回两个尾节点，倒着insertnode

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
        if(l1 == null && l2 == null){
            return null;
        }else if(l1 == null){
            return l2;
        }else if(l2 == null){
            return l1;
        }
        // use stack to get previous node
        LinkedList<ListNode> stack1 = new LinkedList<>();
        LinkedList<ListNode> stack2 = new LinkedList<>();
        // fulfill the stacks
        ListNode ptr1 = fillStack(stack1, l1);
        ListNode ptr2 = fillStack(stack2, l2);

        ListNode head = new ListNode(0);    // a dummy head
        ListNode curr = head;   // curr pointer to the calculated node
        int carry = 0;
        while(ptr1 != null || ptr2 != null){
            int val1 = (ptr1 != null) ? ptr1.val : 0;
            int val2 = (ptr2 != null) ? ptr2.val : 0;
            int tmpSum = val1 + val2 + carry;
            carry = tmpSum/10;
            // insert tmp node into middle of the list
            ListNode tmpNode = new ListNode(tmpSum%10);  // SB, 应该用su,而不是carry
            tmpNode.next = curr.next;
            curr.next = tmpNode;    // update current
            // pop stack
            if(ptr1 != null){ ptr1 = stack1.pollFirst(); }  // remember to update ptr1 and ptr2...
            if(ptr2 != null){ ptr2 = stack2.pollFirst(); }
        }
        //SB, 又忘了处理进位了吧
        if(carry > 0){
            ListNode tmpNode = new ListNode(1);
            tmpNode.next = curr.next;
            curr.next = tmpNode;
        }
        return curr.next;       // SB, curr 和 head在这题里都一样
    }
    /** fulfill the stack and get the last */
    private ListNode fillStack(LinkedList<ListNode> stack, ListNode root){
        if(root == null){   // corner case, if one of the inputs is empty, we can just return zero or return anther one inmmediately
            return new ListNode(0);
        }
        ListNode cur = root;
        while(null != cur.next){
            stack.addFirst(cur);
            cur = cur.next;
        }
        return cur;
    }
}
```

### Other Solutions

Not done yet