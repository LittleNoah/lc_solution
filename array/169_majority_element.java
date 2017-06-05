// Hashmap version
public class Solution {
    public int majorityElement(int[] nums) {
        long halfLength = (long) Math.floor(nums.length/2.0);
        Map<Integer, Integer> hash = new HashMap<Integer, Integer>();
        int target = -999;
        for(int i = 0; i < nums.length; i++){
            if(! hash.containsKey(nums[i])){
                hash.put(nums[i],1);
            }else{
                hash.put(nums[i],hash.get(nums[i])+1);
            }
            if(i >= halfLength) {
                if(hash.get(nums[i]) > halfLength){
                    return nums[i];
                }
            }
        }
        return -1;
    }
}