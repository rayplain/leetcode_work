# This is the interface that allows for creating nested lists.
# You should not implement it, or speculate about its implementation
#
#class NestedInteger
#    def is_integer()
#        """
#        Return true if this NestedInteger holds a single integer, rather than a nested list.
#        @return {Boolean}
#        """
#
#    def get_integer()
#        """
#        Return the single integer that this NestedInteger holds, if it holds a single integer
#        Return nil if this NestedInteger holds a nested list
#        @return {Integer}
#        """
#
#    def get_list()
#        """
#        Return the nested list that this NestedInteger holds, if it holds a nested list
#        Return nil if this NestedInteger holds a single integer
#        @return {NestedInteger[]}
#        """

class NestedIterator
    # @param {NestedInteger[]} nested_list
    attr_accessor :nested_list, :current_index 
    def initialize(nested_list)
      @nested_list = nested_list.flatten
      @current_index = 0
    end

    # @return {Boolean}
    def has_next
      @current_index < @nested_list.length
    end

    # @return {Integer}
    def next
      @current_index += 1
      @nested_list[@current_index - 1]
    end
end

# Your NestedIterator will be called like this:
# i, v = NestedIterator.new(nested_list), []
# while i.has_next()
#    v << i.next
# end
#
test_cases = [
  {expected: [1,1,2,1,1], given: [[1,1],2,[1,1]]},
  {expected: [1,4,6], given: [1,[4,[6]]]},
]

test_cases.each do |test_case|
  puts "test_case: #{test_case[:given]}"
  res = []
  iterator = NestedIterator.new(test_case[:given])
  while iterator.has_next
    res << iterator.next
  end
  output = res
  puts "output: #{output}"
  puts "test success?: #{output == test_case[:expected]}"
end
