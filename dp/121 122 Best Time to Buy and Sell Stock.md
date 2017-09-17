# 121 Best Time to Buy and Sell Stock I

## Description

本题给了一个序列，是按时序排列的，每个element代表了当前这个index下股票的价值

## Ideas

最开始想过是要排序一下然后取首尾节点，但是其实是不对的，因为我们必须要按照先买后卖的顺序来

然后发现其实只要注意更新两个东西即可，minPrice和maxProfit

## Solutions

```java
class Solution {
    public int maxProfit(int[] prices) {
        if(prices.length <= 1){
            return 0;
        }
        int minPrice = Integer.MAX_VALUE;
        int maxProfit = 0;
        for(int price : prices){
            if(price < minPrice){
                minPrice = price;
            }else if(price - minPrice > maxProfit){
                maxProfit = price - minPrice;
            }
        }
        return maxProfit;
    }
}
```


# 121 Best Time to Buy and Sell Stock I

## Description

本题给了一个序列，是按时序排列的，每个element代表了当前这个index下股票的价值

## Ideas

最开始想过是要排序一下然后取首尾节点，但是其实是不对的，因为我们必须要按照先买后卖的顺序来

