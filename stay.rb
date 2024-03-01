# @param {Integer} steps
# @param {Integer} arr_len
# @return {Integer}
def num_ways(steps, arr_len)
  @max = arr_len - 1
  @dp = Array.new(arr_len) { {} }
  ways(0, steps) % (10**9 + 7)
end

def ways(current, remaining)
  return (current == 0 ? 1 : 0) if remaining == 0
  return @dp[current][remaining] if @dp[current][remaining]
  total = ways(current, remaining - 1)
  total += ways(current - 1, remaining - 1) unless current == 0
  total += ways(current + 1, remaining - 1) unless current == @max
  @dp[current][remaining] = total
  total
end


test_cases = [
    [4, [3,2]],
    [2, [2,4]],
    [3, [4,2]],
    [4, [3,2]],
]

test_cases.each do |test_case|
    puts "test_case: #{test_case}"
    output = num_ways(test_case[1][0], test_case[1][1])
    puts "output: #{output}"
    puts "test success?: #{output == test_case[0]}"
end
