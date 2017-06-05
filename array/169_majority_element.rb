# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
    count_hash = Hash.new(0)
    half_len = (nums.length/2.0).floor
    target = 0
    nums.each_with_index do |num,index|
        count_hash[num] += 1
        return num if index>=half_len && count_hash[num]>half_len
    end
end