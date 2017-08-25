# 203 Remove LinkedList Elements
Tags:

- Linked List
- ???不存在的


坑:

- ...返回的时候记得返回的是dummy head的next

## Description


## Ideas

大二就做过的题了...想要删除链表元素，一定要有前一个节点，这里我们用一个vhead表示即可

注意我们其实在while循环里更新了我们对curNode的引用，所以curNode最后不是指向vhead了，vhead还是vhead

## Java Solutions

### 大二 Solution


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
    public ListNode removeElements(ListNode head, int val) {
        
        // use a dummy head to do the job
        ListNode vhead = new ListNode(-1);
        vhead.next = head;
        ListNode curNode = vhead;
        while(curNode.next != null){
            ListNode tmpNode = curNode.next;
            if(val == tmpNode.val){ // delete next node by skipping it
                curNode.next = tmpNode.next;
            }else{
                curNode = curNode.next;   
            }
        }
        return vhead.next;
    }
}
```