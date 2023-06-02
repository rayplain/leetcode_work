class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def to_s
    "#{@val} -> #{@next}"
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def add(val)
    if @head.nil?
      @head = ListNode.new(val)
    else
      current = find_tail
      current.next = ListNode.new(val)
    end
  end

  def add_after(val, after)
    current = @head
    while current
      if current.val == after
        new_node = ListNode.new(val)
        new_node.next = current.next
        current.next = new_node
        return
      end
      current = current.next
    end
  end

  def add_at_head(val)
    if @head.nil?
      @head = ListNode.new(val)
    else
      @head = ListNode.new(val, @head)
    end
  end


  def print
    current = @head
    while current
      puts current.val
      current = current.next
    end
  end

  def reverse
    current = @head
    previous = nil
    while current
      next_node = current.next
      current.next = previous
      previous = current
      current = next_node
    end
    @head = previous
  end

  def find(value)
    current = @head
    while current
      return current if current.val == value
      current = current.next
    end
    nil
  end

  def delete(value)
    current = @head
    previous = nil
    while current
      if current.val == value
        if previous.nil?
          @head = current.next
        else
          previous.next = current.next
        end
        return
      end
      previous = current
      current = current.next
    end
  end

  def find_before(value)
    current = @head
    previous = nil
    while current
      return previous if current.val == value
      previous = current
      current = current.next
    end
    nil
  end

  def find_tail
    current = @head
    while current
      return current if current.next.nil?
      current = current.next
    end
    current
  end

  def print
    current = @head
    while current
      puts current.val
      current = current.next
    end
  end
end


@test_data_1 = [2,4,3]
@test_data_2 = [5,6,4]

@test_data_3 = [0]
@test_data_4 = [0]

@test_data_5 = [9,9,9,9,9,9,9]
@test_data_6 = [9,9,9,9]


