# Description

要求设计一个directory，同时提供两个方法`buildDict`和`search`

第一个方法，要求使用提供的无重复Words构建一个dictionary

第二个方法会输入一个词作为参数，需要判断是否 modify exactly one character into another character能够使得这个词是我们构建的dict中的词

# Ideas

第一个想法，就是和Word Ladder I做法一样，做一下DFS Search, 每次都用24个字母替换

buildDict很简单就直接用个List或者Map/Set存一下就行

# Solutions

一刷Idea

用#来替换每个dict中的词，把替换后的string作为key存入一个map, 对应的value是一个list，用来保存替换前的char,然后search就是利用这个玩意搜索

主要的缺点在于需要进行比较严谨的判断，避免返回错误结果


## 替换字符 Set法

```java
class MagicDictionary {
    
    private Map<String,List<Character>> dictMap;
    
    /** Initialize your data structure here. */
    public MagicDictionary() {
        dictMap = new HashMap<String, List<Character>>();  // permutation -> the char hidden
    }
    
    /** Build a dictionary through a list of words */
    public void buildDict(String[] words) {
        // put each string's all permutation into dict
        for(String str : words){
            char[] strArr = str.toCharArray();
            for(int i = 0; i < strArr.length; i++){
                char ch = strArr[i];
                strArr[i] = '#'; // replace with identifier
                String strKey = new String(strArr);
                dictMap.putIfAbsent(strKey, new ArrayList<Character>());
                List<Character> chList = dictMap.get(strKey);
                chList.add(ch);
                strArr[i] = ch;
            }
        }
    }
    
    /** Returns if there is any word in the trie that equals to the given word after modifying exactly one character */
    public boolean search(String word) {
        if(dictMap.isEmpty() || word == null ){
            return false;
        }else{
            char[] strArr = word.toCharArray();
            for(int i = 0; i < strArr.length; i++){
                char ch = strArr[i];
                strArr[i] = '#'; // replace with identifier
                String key = new String(strArr);
                if(dictMap.containsKey(key)){
                    // if has other string could tranformed to
                    List<Character> list = dictMap.get(key);
                    if(list.size() > 1){
                        return true;
                    }else{ //注意返回false的退出条件啊小子
                        for(char tmpCh : list){
                            if(tmpCh != ch){
                                return true;
                            }
                        }
                    }
                }
                strArr[i] = ch;             
            }
            return false;
        }
    }
}

/**
 * Your MagicDictionary object will be instantiated and called as such:
 * MagicDictionary obj = new MagicDictionary();
 * obj.buildDict(dict);
 * boolean param_2 = obj.search(word);
 */
```
