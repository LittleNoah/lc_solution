# 127 Word Ladder

## Description

这题看126那道直接看不懂...127容易点，就是说给了start word和end word还有个word list, 说可以从start word开始，每次只能变一个字母变成word list里的一个，最短的变换路径到End word是多少

## Ideas

做BFS来层序遍历，每次弹出一个都把里面的都弹出来(一口气弹出一层)

遍历找到可行的next word值得学习...头一回见用`char ch` 来做`forloop`的

## Solutions

```java
class Solution {
    public int ladderLength(String beginWord, String endWord, List<String> wordList) {
        if(beginWord == null || endWord == null){
            return 0;
        }
        if(beginWord.equals(endWord)){
            return 1;
        }
        assert(beginWord.length() == endWord.length());
        if(wordList == null || wordList.size() == 0){
            return 0;
        }
        // if endWord not included in dict
        if(!wordList.contains(endWord)){
            return 0;
        }
        int ladderLen = 1;
        Set<String> dict = new HashSet<>(wordList);
        dict.add(endWord);
        Queue<String> q = new ArrayDeque<String>(10);
        Set<String> visitSet = new HashSet<String>();
        q.offer(beginWord);
        visitSet.add(beginWord);
        while(!q.isEmpty()){
            ladderLen += 1;
            int qLen = q.size();
            
            for(int i = 0; i<qLen; i++){
                String tmpStr = q.poll();
                
                for(String nextStr : getNextWords(tmpStr,dict)){
                    if(nextStr.equals(endWord)){ return ladderLen;}
                    // skip visited nodes
                    if(visitSet.contains(nextStr)){ continue; }
                    q.offer(nextStr);
                    visitSet.add(nextStr);
                    
                }
            }
        }
        // corner case if end word is not in dict
        return 0;
    }
    
    private Set<String> getNextWords(String curStr, Set<String> dict){
        Set<String> wordSet= new HashSet<String>();
        for(int i = 0; i < curStr.length(); i++){
            char[] chars = curStr.toCharArray();
            for(char ch = 'a'; ch <= 'z'; ch++){
                chars[i] = ch;
                String tmp = new String(chars);
                if(dict.contains(tmp)){
                    wordSet.add(tmp);
                }
            }
        }
        return wordSet;
    }
    
}
```


# 126 Word Ladder II

## Description

大体上和上一题相差不多，只是这一题要求给出全部的路径

>  find all shortest transformation sequence(s) from beginWord to endWord

## Ideas

