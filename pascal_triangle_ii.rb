require 'debug'
# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
  return [1] if row_index == 0
  return [1,1] if row_index == 1

  prev_row = [1,1]
  (row_index - 1).times do |i|
    current_row = [1]
    (prev_row.length - 1).times do |j|
      current_row << prev_row[j] + prev_row[j+1]
    end
    current_row << 1
    prev_row = current_row
  end
  prev_row
    
end


test_cases = [
    [3, [1,3,3,1]],
    [0, [1]],
    [1, [1,1]],
    [2, [1,2,1]],
    [4, [1,4,6,4,1]],
    [5, [1,5,10,10,5,1]],
]


test_cases.each do |test_case|
    puts "test_case: #{test_case}"
    output = get_row(test_case[0])
    puts "output: #{output}"
    puts "test success?: #{output == test_case[1]}"
end

