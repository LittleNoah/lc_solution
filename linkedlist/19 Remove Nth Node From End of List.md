# 19 Remove Nth Node From End of List
Tags:

- Linked List
- ???不存在的


坑:

- ...`curNode = head` 的时候别忘了`k+=1`

## Description

删除倒数第n个node

## Ideas

大二就做过的题了..用到的是数学trick

要求我们删除倒数第nth，我们可以从头数到尾，更新这个n，让它变成一个负值，表示还需要走多长到这个地方

其实解答看了左程云的书，第二章第二题就是

注意如果链表为空或者`n < 1`，都不合法直接返回就行

如果得到的更新后的n等于0，说明head就是这个元素,`return head.next;`如果大于0说明不合法

## Java Solutions

### Two-Pass Solution

就是Idea里面介绍的

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
    public ListNode removeNthFromEnd(ListNode head, int n) {
        // invalid case
        if(head == null || n < 1 ){
            return null;
        }
        int k = n; // used to calculate the position
        // loop until the end
        ListNode curNode = head;
        while(curNode != null){
            curNode = curNode.next;
            k -= 1;
        }
        // now k represents the number K-N because we decrese K by N elements
        // corner case
        // k == 0 means the head is the one
        if(k == 0){
            return head.next;
        }else if(k > 0){
            return null;
        }
        curNode = head;
        k += 1;     // notice here
        // now loop again until found the pre-node of the Nth Node
        while(k != 0){
            curNode = curNode.next;
            k += 1;
        }
        // now current node is pointing at the pre-node
        curNode.next = (curNode.next).next;
        return head;
    }
}
```

### One Pass Solution

发现LeetCode居然还有one-pass...赶紧观摩下

> 我觉得我自己是个智障，这个就是大二习题的解

思路就是，第一个指针往后面走n个结点，然后后面的结点从head一起走...直到末位（游标卡尺

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
    public ListNode removeNthFromEnd(ListNode head, int n) {
        // invalid case
        if(head == null || n < 1 ){
            return null;
        }
        int k = n; // used to calculate the position
        // loop until the end
        ListNode preNode = head;
        ListNode curNode = head;
        // loop curNode until the last node
        while(curNode != null && k!= 0){
            curNode = curNode.next;
            k -= 1;
        }
        if(k > 0){
            return null;
        }else if(curNode == null){
            return head.next;
        }
        // move preNode and curNode together
        while(curNode.next != null){
            curNode = curNode.next;
            preNode = preNode.next;
        }
        preNode.next = (preNode.next).next;
        return head;
    }
}
```