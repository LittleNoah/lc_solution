# @param {Integer} num
# @return {Integer[]}
def count_bits(num)
  return [0] if num.zero?
  dp = [0,1]
  # we know for sure that n>>1 and n&0x01 exists
  2.upto num do |n|
    # dp[n] = dp[n>>1] + dp[n&0x01]
    dp[n] = dp[n>>1] + (n&0x01) # 不需要去dp里面查，就是0或者1，这样减少一次操作
  end
  return dp
end