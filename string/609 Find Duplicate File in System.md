#  609. Find Duplicate File in System

Tag:

- Medium
- String
- Hash
- 滑动窗口 Sliding Window
- Dropbox <del>倒闭公司???</del>

Todos:
- ....

一句话简介

> HashMap缓存下文件content

需要注意的是:

- 注意一下那个input，一个item可能有多个files



## Java Solution

### HashMap存Content

方法特点：写的太长了有木有啊！！！Java写字符串想自爆啊有木有啊！！！！

```java
public class Solution {
    public List<List<String>> findDuplicate(String[] paths) {
        // map content with the indexes
        HashMap<String, ArrayList<String>> contentIdxMap = new HashMap<>();
        for(int i=0; i<paths.length; i++){
            String path = paths[i];
            String[] pathInfo = path.split(" ");
            for(int j = 1; j<pathInfo.length; j++){  // iterate all files inside the same path
                String fileInfo = pathInfo[j];
                String content = fileInfo.substring(fileInfo.indexOf("(")+1,fileInfo.lastIndexOf(")")); // pathInfo[i] = name(content)
                if(!contentIdxMap.containsKey(content)){
                    ArrayList<String> tmpIdxList = new ArrayList<>();
                    tmpIdxList.add(pathInfo[0] + "/" + fileInfo.substring(0, fileInfo.indexOf("(")) );
                    contentIdxMap.put(content, tmpIdxList);
                }else{  // check 
                    List list = contentIdxMap.get(content);
                    list.add(pathInfo[0] + "/" + fileInfo.substring(0, fileInfo.indexOf("(")));
                    // dupContentSet.add(content);
                }
            }

        }
        // output
        List<List<String>> resList = new ArrayList<>();
        for(ArrayList<String> list : contentIdxMap.values()){
            if(list.size() > 1){
                resList.add(list);
            }
        }
        

        return resList;
    }
}
```
