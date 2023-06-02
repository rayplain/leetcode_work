#compress string by removing repeated characters and counting them with the number in front
def compression(string)
  compressed = ""
  count = 1
  string.each_char.with_index do |char, index|
    if string[index + 1] == char
      count += 1
    else
      compressed += count.to_s + char
      count = 1
    end
  end
  compressed.length < string.length ? compressed : string
end

test_cases = [
  "aabcccccaaa",
  "abc",
  "aabbcc",
  "aaabbbccc",
]

test_cases.each do |test_case|
  puts "Test case: #{test_case}"
  puts "Result:    #{compression(test_case)}"
end

