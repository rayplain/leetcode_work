# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  h = {}
  nums.each_with_index do |num, index|
    return [h[num], index] if h.key?(num)
    h[target-num] = index
  end
  raise ArgumentError.new("No two sum solution")
end

test_cases = [
  [[2, 7, 11, 15], 9],
  [[3, 2, 4], 6],
  [[3, 3], 6]
]

test_cases.each do |test_case|
  nums, target = test_case
  puts two_sum(nums, target).to_s
end