def caesar_cypher(string: "", count: 3)
  new_string = ""
  string.each_char do |char|
    new_string += (char.ord + count).chr
  end
  new_string
end

test_cases = [
  {string: "abc", count: 3},
  {string: "xyz", count: 3},
  {string: "abc", count: 5},
  {string: "xyz", count: 5},
  {string: "abc", count: 7},
]

test_cases.each do |test_case|
  puts "Test case: #{test_case}"
  puts "Result:    #{caesar_cypher(string: test_case[:string], count: test_case[:count])}"
end
