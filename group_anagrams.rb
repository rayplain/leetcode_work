# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  cache = {}
  strs.each do |word|
    key = word.chars.sort.join
    if cache.key?(key)
      cache[key] << word
    else
      cache[key] = [word]
    end
  end
  cache.values
end

def group_anagrams_2(strs)
  strs.group_by do |word|
    word.bytes.sort
  end.values
end


test_cases = [
  ["eat", "tea", "tan", "ate", "nat", "bat"],
  ["a"],
  [""]
]

test_cases.each do |test_case|
  puts group_anagrams(test_case).to_s
end
