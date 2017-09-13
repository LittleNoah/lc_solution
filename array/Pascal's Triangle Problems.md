#  118. Pascal's Triangle 

## Description

输出Pascal's Triangle，观察节奏

## Ideas

找规律，强行输出

找规律， tricky输出


## Solutions

### 愚蠢法 

```java
public List<List<Integer>> generate(int numRows) {
    List<List<Integer>> resList = new ArrayList<>();
    if(numRows < 0){
        return null;
    }
    if(numRows == 0){
        return resList;
    }
    // construct first row
    List<Integer> firstRow = new ArrayList<>();
    firstRow.add(1);
    resList.add(firstRow);
    if(numRows >= 2){
        List<Integer> secondRow = new ArrayList<>();
        secondRow.add(1);
        secondRow.add(1);
        resList.add(secondRow);
    }
    if(numRows >= 3){
        for(int i = 3; i <= numRows; i++){
            List<Integer> tmpList = new ArrayList<>();
            List<Integer> prevList = resList.get(i-2);
            tmpList.add(1);
            for(int j = 2; j <= i-1; j++){ // iterate all elements of previous row
                tmpList.add(prevList.get(j-2) + prevList.get(j-1));
            }
            tmpList.add(1);
            
            resList.add(tmpList);
        }
    }
    return resList;
}
```


```java
public List<List<Integer>> generate(int numRows)
{
	List<List<Integer>> allrows = new ArrayList<List<Integer>>();
	ArrayList<Integer> row = new ArrayList<Integer>();
	for(int i=0;i<numRows;i++)
	{
		row.add(0, 1);
		for(int j=1;j<row.size()-1;j++)
			row.set(j, row.get(j)+row.get(j+1));
		allrows.add(new ArrayList<Integer>(row));
	}
	return allrows;
	
}
```

# Pascal's Triangle II

## Description

输出`kth`行的pascal's trangle

**主要问题在于，这个题行数是从零开始的...**

## Solutions

```java
class Solution {
    public List<Integer> getRow(int rowIndex) {
        ArrayList<Integer> row = new ArrayList<Integer>();
        for(int i = 0; i <= rowIndex; i++){
            row.add(0, 1);
            for(int j = 1; j < row.size()-1; j++){
                row.set(j, row.get(j) + row.get(j+1));   // we update the current j using next one
            }
        }
        return row;
    }

}
```
