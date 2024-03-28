# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  return 0 if s.nil? || s.empty?
  return 1 if s.length == 1
  max_length = 0
  start_index = 0
  end_index = 0
  cache = {}
  while end_index < s.length
    if cache[s[end_index]]
      start_index = [start_index, cache[s[end_index]] + 1].max
    end
    cache[s[end_index]] = end_index
    max_length = [max_length, end_index - start_index + 1].max
    end_index += 1
  end
  max_length
end


# Test cases
puts length_of_longest_substring("abcabcbb") # 3
puts length_of_longest_substring("bbbbb") # 1