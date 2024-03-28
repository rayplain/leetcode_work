def convert(s, num_rows)
  return s if num_rows == 1 || s.length <= num_rows
  chars = s.chars
  result = ""
  count = 2 * (num_rows - 1)
  (0..num_rows - 1).each do |row|
    i = row
    while i < s.length
      result += chars[i]
      j = i + count - 2 * row
      result += chars[j] if row > 0 && row < num_rows - 1 && j < s.length
      i += count
    end
  end
  result
end

test_cases = [
    ["PAYPALISHIRING", 3, "PAHNAPLSIIGYIR"],
    ["PAYPALISHIRING", 4, "PINALSIGYAHRPI"],
    ["A", 1, "A"]
]

test_cases.each do |test_case|
    s, num_rows, expected = test_case
    puts "s = #{s}, num_rows = #{num_rows}"
    puts "Expected: #{expected}"
    puts "Actual: #{convert(s, num_rows)}"
    puts "Passed? #{convert(s, num_rows) == expected}"
end
