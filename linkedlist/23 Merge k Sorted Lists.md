# 23 Merge k Sorted Lists

Tags:

- LinkedList
- Sort
- `nlogn`
- 一坨...

好吧，为了这个题特意看了算_(:зゝ∠)_导

坑:

- Time Limit Exceeded
  - 忘记update p1和p2了...
- 初始化PriorityQueue要指定元素类型

Todos:

- 用二路MERGE的思想重做一遍
- 看一下别人的思路

## Description



## Ideas

### Heap Sort

可以用堆来实现排序...

这样先把每个head入堆，poll出来的肯定是最小值，然后poll那个的next再入堆

时间复杂度如下:

Build: to-do

Insert(add): `O(lg n)`

Poll: `O(lg n)`


### Binary Merge

就是merge,和堆的复杂度实际上相同

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
    public ListNode mergeKLists(ListNode[] lists) {
        return kMerge(lists, 0, lists.length - 1);
    }
    
    public ListNode kMerge(ListNode[] lists, int start, int end) {
        if (start > end)
            return null;
        if (start == end)
            return lists[start];
        int mid = start + (end - start) / 2;
        ListNode head1 = kMerge(lists, start, mid);
        ListNode head2 = kMerge(lists, mid + 1, end);
        ListNode dummy = new ListNode(0);
        ListNode cur = dummy;
        while (head1 != null && head2 != null) {
            if (head1.val <= head2.val) {
                cur.next = head1;
                cur = cur.next;
                head1 = head1.next;
            }
            else {
                cur.next = head2;
                cur = cur.next;
                head2 = head2.next;
            }
        }
        cur.next = head1 == null ? head2 : head1;
        //while (head1 != null) {
        //    cur.next = head1;
        //    cur = cur.next;
        //    head1 = head1.next;
        ///}
        //while (head2 != null) {
        //    cur.next = head2;
        //    cur = cur.next;
        //    head2 = head2.next;
        //}
        return dummy.next;
    }
}
```

或者参考：
```java
public static ListNode mergeKLists(ListNode[] lists){
    return partion(lists,0,lists.length-1);
}

public static ListNode partion(ListNode[] lists,int s,int e){
    if(s==e)  return lists[s];
    if(s<e){
        int q=(s+e)/2;
        ListNode l1=partion(lists,s,q);
        ListNode l2=partion(lists,q+1,e);
        return merge(l1,l2);
    }else
        return null;
}

//This function is from Merge Two Sorted Lists.
public static ListNode merge(ListNode l1,ListNode l2){
    if(l1==null) return l2;
    if(l2==null) return l1;
    if(l1.val<l2.val){
        l1.next=merge(l1.next,l2);
        return l1;
    }else{
        l2.next=merge(l1,l2.next);
        return l2;
    }
}
```


### PriorityQueue(Heap)

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
    public static Comparator<ListNode> valComparator = new Comparator<ListNode>(){
        @Override
        public int compare(ListNode n1, ListNode n2){
            return (int) (n1.val - n2.val);
        }
    };
    public ListNode mergeKLists(ListNode[] lists) {
        // heap to store val in from head to tail for each lists
        PriorityQueue<ListNode> heap = new PriorityQueue<ListNode>(20, valComparator);  // must declare the type of ListNode
        for(ListNode head : lists){ //add k list heads to the heap
            if(head != null){
                heap.add(head);
            }
        }
        ListNode vhead = new ListNode(0);
        ListNode cur = vhead;
        while(!heap.isEmpty()){
            cur.next = heap.poll(); // if heap is empty return `null`
            cur = cur.next;
            if(null != cur.next){
                heap.add(cur.next);
            }
        }
        return vhead.next;
    }
    


}
```

