
## Description

要求找出两个String Array中相同的entity并且index sum和最小，如果有相同index sum的就一起输出

emmm...这题吧，好像和昨天做过的一道题有点像，都是用HashMap存一下某个sum值，只不过这题更加简单，用了两个forloop就过了

## Ideas

自己的想法就是暴力了...
- 两个for loop搜索

卧槽，这次答案写的比较精巧

## Solutions


### 一刷 HashMap

```java
class Solution {
    public String[] findRestaurant(String[] list1, String[] list2) {
        if(list1 == null || list2 == null || list1.length == 0 || list2.length == 0){
            return new String[0];
        }
        Map<Integer, List<String>> sumToList = new HashMap<>();
        int minSum = Integer.MAX_VALUE;
        for(int i = 0; i < list1.length; i++){
            for(int j = 0; j < list2.length; j++){
                if(list1[i].equals(list2[j])){
                    int tmpIdxSum = i + j;
                    if(tmpIdxSum <= minSum){
                        minSum = tmpIdxSum;
                        sumToList.putIfAbsent(minSum, new ArrayList<>(10));
                        List<String> tmpList = sumToList.get(minSum);
                        tmpList.add(list1[i]);
                        break;
                    }
                }
            }
        }
        if(sumToList.size() > 0){
            List<String> resList = sumToList.get(minSum);
            return resList.toArray(new String[resList.size()]);
        }else{
            return new String[0];
        }
        
    }
}
```


### 二刷 以String为key法

好吧其实就是刚才做的...不是二刷

```java
class Solution {
    public String[] findRestaurant(String[] list1, String[] list2) {
        if(list1 == null || list2 == null || list1.length == 0 || list2.length == 0){
            return new String[0];
        }
        Map<String, Integer> nameToIdx = new HashMap<>();
        for(int i = 0; i < list1.length; i++){
            nameToIdx.put(list1[i], i);
        }
        int minSum = Integer.MAX_VALUE;
        List<String> resList = new ArrayList<>(15);
        // iterate through list2
        for(int i = 0; i < list2.length; i++){
            if(nameToIdx.containsKey(list2[i])){
                int tmpSum = nameToIdx.get(list2[i]) + i;
                if(tmpSum < minSum){
                    minSum = tmpSum;
                    resList.clear();
                    resList.add(list2[i]);
                }else if(tmpSum == minSum){
                    resList.add(list2[i]);
                }
            }
        }
        
        return resList.toArray(new String[resList.size()]);
    }
}
```

### 三刷 遍历Sum法

这个idea很有意思，如果是本科的时候应该会用这个

sum的范围在于0~m+n-1, 我们遍历第一个list，然后按照sum的范围遍历第二个即可