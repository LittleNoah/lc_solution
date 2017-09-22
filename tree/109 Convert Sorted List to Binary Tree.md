# Description

本题是108那个排序数组的兄弟题，已经排序好的一个链表，让构造BST

## 三个代表重要思想

学到的：
- 使用快慢指针来找链表中点，并应用在二叉树上

# Ideas

最开始的naiveF想法是先构造一个list,再用108解法copy/paste一下就好了，但是超时了

所以找了一下[大神们的答案](https://siddontang.gitbooks.io/leetcode-solution/content/tree/convert_sorted_listarray_to_binary_search_tree.html)

就是用快慢指针，然后用 == 判断末尾，虽然很不爽，但是其实这个题的思路自己也是知道的

# Solutions

## 转化为Array/List 超时 TLE

转化成List的话就和convert sorted array to binary tree一毛一样了

```java
public TreeNode sortedListToBST(ListNode head) {
    if(head == null){
        return null;
    }
    List<ListNode> list = new ArrayList<>(20);
    initNodeList(list, head);
    return buildBST(list, 0, list.size() - 1);  // notice here,一定要把end的值写对了，不是length是length-1
}

private void initNodeList(List<ListNode> list, ListNode head){
    ListNode ptr = head;
    while(ptr != null){
        list.add(ptr);
        ptr = ptr.next;
    }
}

private TreeNode buildBST(List<ListNode> list, int start, int end){
    if(start > end){
        return null;
    }
    int mid = (start + end)/2;
    System.out.println(mid);
    TreeNode node = new TreeNode(list.get(mid).val);
    node.left = buildBST(list, start, mid - 1);
    node.right = buildBST(list, mid + 1, end);
    return node;
}
```

## Two Pointers

```java
public TreeNode sortedListToBST(ListNode head) {
    if(head == null){
        return null;
    }
    return buildBST(head, null);  // notice here,一定要把end的值写对了，不是length是length-1
}


private TreeNode buildBST(ListNode start, ListNode end){
    if(start == end){
        return null;
    }

    ListNode fast = start;
    ListNode slow = start;

    while(fast != end && fast.next != end){
        slow = slow.next;
        fast = fast.next.next;
    }
    // now slow is the middle one
    TreeNode node = new TreeNode(slow.val);
    node.left = buildBST(start, slow);
    node.right = buildBST(slow.next, end);

    return node;
}
```