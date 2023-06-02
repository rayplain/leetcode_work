#@param {Integer} n
#@return {String[]}
def generate_parenthesis(n)
  return [''] if n == 0
  return ['()'] if n == 1
  result = []
  (0...n).each do |i|
    generate_parenthesis(i).each do |left|
      generate_parenthesis(n - i - 1).each do |right|
        result << "(#{left})#{right}"
      end
    end
  end
  result
end

test_cases = [
  0,
  1,
  2,
  3,
  4
] 

test_cases.each do |test_case|
  puts p generate_parenthesis(test_case)
  puts "----------------"
end
