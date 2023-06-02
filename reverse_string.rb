def reverse_string(chars)
  left = 0
  right = chars.length - 1
  while left < right
    chars[left], chars[right] = chars[right], chars[left]
    left += 1
    right -= 1
  end
  return chars.join
end

test_cases = [
  ["hello", "olleh"],
  ["Hannah", "hannaH"],
  ["", ""],
  ["a", "a"],
  ["ab", "ba"],
  ["abc", "cba"],
  ["abcd", "dcba"],
  ["abcde", "edcba"],
  ["abcdef", "fedcba"],
  ["abcdefg", "gfedcba"],
  ["abcdefgh", "hgfedcba"],
  ["abcdefghi", "ihgfedcba"],
  ["abcdefghij", "jihgfedcba"],
  ["abcdefghijk", "kjihgfedcba"],
  ["abcdefghijkl", "lkjihgfedcba"],
]


test_cases.each do |test_case|
  input, expected = test_case
  actual = reverse_string(input.chars)
  if actual == expected
    puts "PASS"
  else
    puts "FAIL: input: #{input}, expected: #{expected}, actual: #{actual}"
  end
end
