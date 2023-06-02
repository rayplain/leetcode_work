# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  candidates = candidates.sort
  results = []
  dfs(candidates, target, 0, [], results)
  results
end

def dfs(candidates, target, index, path, results)
  if target == 0
    results << path
    return
  end

  (index...candidates.length).each do |i|
    break if candidates[i] > target
    dfs(candidates, target - candidates[i], i, path + [candidates[i]], results)
  end
end

test_cases = [
  [[2, 3, 6, 7], 7],
  [[2, 3, 5], 8]
]

test_cases.each do |test_case|
  p combination_sum(test_case[0], test_case[1])
end
