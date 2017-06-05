# @param {Integer[][]} nums
# @param {Integer} r
# @param {Integer} c
# @return {Integer[][]}
def matrix_reshape(nums, r, c)
  # determine whether the array is 2-dimension or not
  is_2d = nums[0].kind_of?(Array)
  size = is_2d ? nums.size * nums[0].size : nums.size
  return nums if r*c != size
  cur_row, cur_col = 0, 0
  resharp_nums = []
  resharp_nums[cur_row] = []
  # handle the situation that the array is 1D array
  if is_2d then
    nums.each do |row|
      row.each do |num|
        next if num.nil?
        if cur_col == c then
          cur_col = 0
          cur_row += 1
          resharp_nums[cur_row] = []
        end
        resharp_nums[cur_row] << num
        cur_col += 1
      end
    end
  else
    nums.each do |num|
      next if num.nil?
      if cur_col == c then
        cur_col = 0
        cur_row += 1
        resharp_nums[cur_row] = []
      end
      resharp_nums[cur_row] << num
      cur_col += 1
    end
  end
  return resharp_nums
end