# 544 Output Contest Matches

Tag:

- Medium
- String



一句话简介

> 很巧妙的用Array

这题讲NBA加时赛，同时没有限制奇偶数的队伍...主要idea是要把每一个pair当做是individual team继续pair, discussion上学到的解法很有意思，还有一个国人用LinkedList但是不知道时间复杂度怎么样 

需要注意的是:

取队尾元素需要注意下index

## Java Solution

```java
   public class Solution {
    public String findContestMatch(int n) {
        // list to store different teams/pair
        List<String> matches = new ArrayList<String>();
        // initialize as single team
        for(int i = 1; i<=n; i++ ){
            matches.add(String.valueOf(i));
        }
        while(matches.size()>1){
            List<String> matchRound = new ArrayList<String>();
            int matchNum = matches.size();
            for(int i = 0; i<matches.size()/2; i++){
                matchRound.add("(" + matches.get(i) + "," + matches.get(matchNum-i-1) + ")");
            }
            matches = matchRound;
        }
        return matches.get(0);
    }
}
```

