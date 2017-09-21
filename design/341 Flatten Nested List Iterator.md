# Description

# Ideas

这题和那个之前的嵌套list一样，主要考察递归


_可能是我错了_，大婶们说这题主要考察迭代。。。。二刷的时候重做吧（至少DFS阶段先不管。。。。

http://www.cnblogs.com/grandyang/p/5358793.html

https://zhengyang2015.gitbooks.io/lintcode/flatten_nested_list_iterator_528.html

http://rainykat.blogspot.com/2017/02/leetcodegf-341-flatten-nested-list.html


# Solutions

不太喜欢，没有lazy-evaluation的感觉

## 初始化完全构造法

```java
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * public interface NestedInteger {
 *
 *     // @return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public boolean isInteger();
 *
 *     // @return the single integer that this NestedInteger holds, if it holds a single integer
 *     // Return null if this NestedInteger holds a nested list
 *     public Integer getInteger();
 *
 *     // @return the nested list that this NestedInteger holds, if it holds a nested list
 *     // Return null if this NestedInteger holds a single integer
 *     public List<NestedInteger> getList();
 * }
 */
public class NestedIterator implements Iterator<Integer> {
    
    private Deque<NestedInteger> cacheQueue;
    private List<NestedInteger> nestedList;
    
    public NestedIterator(List<NestedInteger> nestedList) {
        cacheQueue = new LinkedList<NestedInteger>();
        this.nestedList = nestedList;
        extractListToQueue(cacheQueue, nestedList);
        //System.out.println(nestedList.size());
    }
    
    private void extractListToQueue(Deque<NestedInteger> queue, List<NestedInteger> nestedList){
        for(NestedInteger node : nestedList){
            if(node.isInteger()){
                queue.offerFirst(node); //其实这里的queue可以用Integer的元素类型，不需要存额外信息的
            }else{
                extractListToQueue(queue, node.getList());
            }
            
        }
    }
    
    @Override
    public Integer next() {
        return cacheQueue.pollLast().getInteger();
        // // putting next into queue
        // if(cacheQueue.isEmpty()){
        //     NestedInteger node = nestedList.get(0);
        //     nestedList.remove(0); // remove the first node
        //     if(node.isInteger()){
        //         return node.getInteger();
        //     }else{
        //         extractListToQueue(cacheQueue, node.getList());
        //         return cacheQueue.pollFirst().getInteger();
        //     }
        // }else{
        //     return cacheQueue.pollFirst().getInteger();
        // }
    }

    @Override
    public boolean hasNext() {
        if(cacheQueue.isEmpty()){
            return false;
        }else{
            return true;
        }
    }
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * NestedIterator i = new NestedIterator(nestedList);
 * while (i.hasNext()) v[f()] = i.next();
 */
```