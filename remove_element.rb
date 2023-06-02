#@param {Integer[]} nums
#@param {Integer} val
#@return {Integer}
def remove_element(nums, val)
  nums.delete(val)
  nums.length
end


test_cases = [
  [[3, 2, 2, 3], 3],
  [[0, 1, 2, 2, 3, 0, 4, 2], 2]
]


test_cases.each do |test_case|
  puts remove_element(test_case[0], test_case[1])
end
