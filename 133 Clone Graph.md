# Description

复制一个图


# Ideas

要求把neighbors填满，第一想法就是BFS啦

这题和138 copy list with random pointer思路一模一样，主要注意的是最后遍历的时候，添加neighbors的目标不要搞错了

# Solutions

## BFS

```java
/**
 * Definition for undirected graph.
 * class UndirectedGraphNode {
 *     int label;
 *     List<UndirectedGraphNode> neighbors;
 *     UndirectedGraphNode(int x) { label = x; neighbors = new ArrayList<UndirectedGraphNode>(); }
 * };
 */
public class Solution {
    public UndirectedGraphNode cloneGraph(UndirectedGraphNode node) {
        if(node == null){
            return null;
        }
        Queue<UndirectedGraphNode> q = new ArrayDeque<>(15);
        q.offer(node);
        UndirectedGraphNode cur = node;
        Map<UndirectedGraphNode,UndirectedGraphNode> visitMap = new HashMap<>();
        HashSet<UndirectedGraphNode> visitSet = new HashSet<>();
        while(!q.isEmpty()){
            cur = q.poll();
            if(visitSet.contains(cur)){ continue; }
            UndirectedGraphNode copiedNode = new UndirectedGraphNode(cur.label);
            visitMap.put(cur, copiedNode);
            visitSet.add(cur);
            // adding next level
            for(UndirectedGraphNode nb : cur.neighbors){
                q.offer(nb);
            }
        }
        visitSet.clear();
        // dealing with neighbors
        cur = node;
        q.offer(node);
        while(!q.isEmpty()){
            cur = q.poll();
            if(visitSet.contains(cur)){ continue; }
            UndirectedGraphNode copiedNode = visitMap.get(cur);
            visitSet.add(cur);
            //copy neighbors
            for(UndirectedGraphNode nb : cur.neighbors){
                q.offer(nb);
                copiedNode.neighbors.add(visitMap.get(nb)); // notice here
            }
        }
        return visitMap.get(node);
    }
}
```