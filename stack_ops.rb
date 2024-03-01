# @param {Integer[]} target
# @param {Integer} n
# @return {String[]}
def build_array(target, n)
  result = []
  i = 1
  target.each do |num|
    while i <= num
      result << "Push"
      if i != num
        result << "Pop"
      end
      i += 1
    end
  end
  result
end

test_cases = [
  { target: [1, 3], n: 3, expected_result: ["Push", "Push", "Pop", "Push"] },
  { target: [1, 2, 3], n: 3, expected_result: ["Push", "Push", "Push"] },
  { target: [1, 2], n: 4, expected_result: ["Push", "Push"] }
]

test_cases.each do |test_case|
  target = test_case[:target]
  n = test_case[:n]
  expected_result = test_case[:expected_result]
  actual_result = build_array(target, n)
  puts "target: #{target}, n: #{n}, expected_result: #{expected_result}, actual_result: #{actual_result}"
end
