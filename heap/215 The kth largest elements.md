# 215 The kth largest elements 

**Todos:**

- 学会快排后重做一遍
- 排序法求index

## Ideas

题目说的不清楚啊

不是说要找去除重复数字之后的kth largest element

1. 排序后直接按index取
2. heap
3. （最优）selection algorithm

## Solutions

### Heap Solution

```java
class Solution {
    public int findKthLargest(int[] nums, int k) {
        // Map<Integer, Boolean> occurMap = new HashMap<>();
        // for(int num : nums){
        //     occurMap.putIfAbsent(num, true);
        // }
        // construct heap
        PriorityQueue<Integer> heap = new PriorityQueue<>( (a1,a2) -> Integer.compare(a1,a2) );
        // iterate hash map
        // for(Map.Entry<Integer, Boolean> entry : occurMap.entrySet()){
        for(int num : nums){
            heap.offer(num);
            if(heap.size() > k){
                heap.poll();
            }
        }
        // get the kth largest element
        return heap.poll();
    }
}
``