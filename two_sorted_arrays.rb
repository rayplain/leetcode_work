def find_median_sorted_arrays(nums1, nums2)
  nums = nums1 + nums2
  nums.sort!
  length = nums.length
  if length.odd?
    nums[length / 2]
  else
    (nums[length / 2] + nums[length / 2 - 1]) / 2.0
  end
end

test_cases = [
  [[1, 3], [2]],
  [[1, 2], [3, 4]],
  [[0, 0], [0, 0]],
  [[], [1]]
]


test_cases.each do |test_case|
  puts find_median_sorted_arrays(test_case[0], test_case[1])
end
