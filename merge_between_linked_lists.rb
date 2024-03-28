require './linked_list.rb'
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {Integer} a
# @param {Integer} b
# @param {ListNode} list2
# @return {ListNode}
def merge_in_between(list1, a, b, list2)
  new_list = LinkedList.new 
  current_node = list1.head
  list_two_head = list2.head
  count = 0

  new_list.add(current_node.val)
  until current_node.next.nil?
    current_node = current_node.next
    if count >= a - 1 && count < b
      if count == a
        until list_two_head.nil?
          new_list.add(list_two_head.val)
          list_two_head = list_two_head.next
        end
      end
    else
      new_list.add(current_node.val)
    end

    count += 1
  end

  new_list.head
end

def merge_between_nodes list1, a, b, list2
  index = 0
  current_node = list1
  start_node = nil
  end_node = nil
  while current_node
    if index == a - 1
      start_node = current_node
    elsif index == b
      end_node = current_node.next
      break
    end
    current_node = current_node.next
    index += 1
  end

  current_node = list2

  while current_node.next
    current_node = current_node.next
  end

  if a == 1
    start_node.val = list2.val
    start_node.next = list2.next
  else
    start_node.next = list2
  end
  current_node.next = end_node
  list1
end


list_1_data = [10,1,13,6,9,5]
test_one_list = LinkedList.new
list_1_data.each do |val|
  test_one_list.add(val)
end

test_one_merge_data = [1000000,1000001,1000002]
test_one_merge_list = LinkedList.new
test_one_merge_data.each do |val|
  test_one_merge_list.add(val)
end

test_2_data = [0,1,2,3,4,5,6]
test_two_list = LinkedList.new
test_2_data.each do |val|
  test_two_list.add(val)
end

test_two_merge_data = [1000000,1000001,1000002,1000003,1000004]
test_two_merge_list = LinkedList.new
test_two_merge_data.each do |val|
  test_two_merge_list.add(val)
end

test_3_data = [0,1,2,3,4,5,6]
test_three_list = LinkedList.new
test_3_data.each do |val|
  test_three_list.add(val)
end

test_three_merge_data = [1000000,1000001,1000002,1000003,1000004]
test_three_merge_list = LinkedList.new
test_three_merge_data.each do |val|
  test_three_merge_list.add(val)
end


puts merge_in_between(test_one_list, 3, 4, test_one_merge_list)
puts merge_in_between(test_two_list, 2, 5, test_two_merge_list)
puts merge_in_between(test_three_list, 1, 3, test_three_merge_list)
puts merge_between_nodes(test_one_list.head, 3, 4, test_one_merge_list.head)
puts merge_between_nodes(test_two_list.head, 2, 5, test_two_merge_list.head)
puts merge_between_nodes(test_three_list.head, 1, 3, test_three_merge_list.head)
