# @param {String} s
# @return {String}
def longest_palindrome(s)
  return s if s.length < 2
  end_index = 0
  start = 0
  s.chars.each_with_index do |char, index|
    odd_length = get_expansion_lengths(s, index, index)
    even_length = get_expansion_lengths(s, index, index + 1)
    length = [odd_length, even_length].max
    if length > end_index - start
      start = index - (length - 1) / 2
      end_index = index + (length / 2)
    end
  end
  s[start, end_index - start + 1]
end


def get_expansion_lengths(s, left, right)
  while left >= 0 && right < s.length && s[left] == s[right]
    left -= 1
    right += 1
  end
  # (right - left - 2) / 2
  right - left - 1
end


# @param {String} s
# @return {String}
def longest_palindrome_dp(s)
  return s if s.length < 2
  n = s.length
  dp = Array.new(n) { Array.new(n, false) }
  start = 0
  max_length = 1

  n.times { |i| dp[i][i] = true }

  (n - 1).times do |i|
    if s[i] == s[i + 1]
      dp[i][i + 1] = true
      start = i
      max_length = 2
    end
  end

  (3..n).each do |len|
    (0..n - len).each do |i|
      j = i + len - 1
      if s[i] == s[j] && dp[i + 1][j - 1]
        dp[i][j] = true
        start = i
        max_length = len
      end
    end
  end

  s[start, max_length]
end


# @param {String} s
# @return {String}
def longest_palindrome_b(s)
  # Initialize an empty string to store the longest palindrome
  longest = ''

  # Initialize a counter i to iterate over the string
  i = 0

  # Start a loop to iterate over the string
  while i < s.length
    # Initialize j to be one more than i
    j = i + 1

    # Increment j as long as the character at index j is the same as the character at index i
    j += 1 while s[j] == s[i]

    # Call the expand method to find the longest palindrome centered around the current character or group of characters
    found = expand(s, i, j - 1)

    # If the length of the palindrome found is greater than or equal to the length of the current longest palindrome, update longest
    longest = found if found.length >= longest.length

    # Update i to be j to move to the next group of characters
    i = j
  end

  # Return the longest palindrome found
  longest
end

# This method expands around the center of a palindrome and returns the longest palindrome that can be formed with this center
def expand(s, l, r)
  # Continue expanding as long as the characters at the expanding boundaries are the same
  while l >= 0 && r < s.length && s[l] == s[r]
    l -= 1
    r += 1
  end

  # Return the substring of the string that corresponds to the expanded palindrome
  s[(l + 1)..(r - 1)]
end
test_cases = [
  "aabba", # "bab" or "aba"
  "babad", # "bab" or "aba"
  "cbbd", # "bb"
  "a", # "a"
  "ac", # "a"
  "bb", # "bb"
  "ccc", # "ccc"
  "racecar", # "racecar"
  "", # ""
  "z", # "z"
  "zzzzzz", # "zzzzzz"
  "racecarabcd", # "racecar"
  "abcdracecar", # "racecar"
  "racecarBBracecar", # "racecarBBracecar"
]

test_cases.each do |test_case|
  puts longest_palindrome(test_case)
end


test_cases.each do |test_case|
  puts longest_palindrome_dp(test_case)
end
