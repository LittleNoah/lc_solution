# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    # because each input would have exactly one solution, so we do
    # no check the only-one-element situation
    table = Hash.new
    table[nums[0]] = 0
    nums.each_with_index do |num, index|
        unless table[target - num].nil? then
            unless index == table[target-num]
                low_index = [index, table[target-num]].min
                high_index = [index, table[target-num]].max
                return [low_index, high_index]
            end
        end
        table[num] = index # problem, same value will have hash confilct
    end
end