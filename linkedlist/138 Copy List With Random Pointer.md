# Description

要求Deep Copy一个链表，这个链表的不同之处在于每个节点有一个额外的random pointer，可能指向链表中某个节点也可能是`null`

# Ideas

思路如下：

思路一

1. 先挨个copy，不管next和random
2. 用一个map记录original和copy node
3. 然后再遍历一遍把next和Random赋值

思路二：

每一个复制节点都放在原节点后面，然后再遍历一遍把next和random矫正, split两个链表


# Solutions

## HashMap

```java
/**
 * Definition for singly-linked list with a random pointer.
 * class RandomListNode {
 *     int label;
 *     RandomListNode next, random;
 *     RandomListNode(int x) { this.label = x; }
 * };
 */
public class Solution {
    public RandomListNode copyRandomList(RandomListNode head) {
        if(head == null){
            return head;
        }
        // origial -> copied/duplicate
        Map<RandomListNode, RandomListNode> copyMap = new HashMap<>();
        // copy the value one by one
        RandomListNode ptr = head;
        while(ptr != null){
            RandomListNode dupNode = new RandomListNode(ptr.label);
            copyMap.put(ptr, dupNode);
            ptr = ptr.next;
        }
        ptr = head;
        while(ptr != null){
            RandomListNode copyNode = copyMap.get(ptr);
            copyNode.next = copyMap.get(ptr.next);
            if(ptr.random != null){
                copyNode.random = copyMap.get(ptr.random);    
            }
            ptr = ptr.next;
        }
        return copyMap.get(head);
    }
}
```

### 代码解析

。。。就是思路


## Split

```java
/**
 * Definition for singly-linked list with a random pointer.
 * class RandomListNode {
 *     int label;
 *     RandomListNode next, random;
 *     RandomListNode(int x) { this.label = x; }
 * };
 */
public class Solution {
    // o(n) O(n)
    public RandomListNode copyRandomList(RandomListNode head) {
        if(head == null){
            return head;
        }
        RandomListNode cur = head;
        // put copied node right behind the original one
        while(cur != null){
            RandomListNode dupNode = new RandomListNode(cur.label);
            dupNode.next = cur.next;
            cur.next = dupNode;
            cur = dupNode.next;
        }
        cur = head;
        while(cur != null){
            if(cur.random != null){
                (cur.next).random = (cur.random).next;
            }
            cur = cur.next.next;
        }
        RandomListNode res = head.next;
        cur = head;
        // split the list
        while(cur != null){
            RandomListNode next = cur.next.next;
            RandomListNode curCopy = cur.next;
            cur.next = next;
            curCopy.next = next != null ? next.next : null;
            cur = next;
        }
        return res;
    }
}
```

### 代码解析

注意最后Split的方法，多联系