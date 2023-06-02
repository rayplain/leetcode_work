class TreeNode
  attr_accessor :value, :left, :right


  # @param [Integer] value
  # @return [TreeNode]
  def initialize(value = nil)
    @value = value
    @left = nil
    @right = nil
  end

  def data
    @value
  end

  # @return [String]
  def to_s
    @value.to_s
  end

  # @return [String]
  def inspect
    to_s
  end
end


class BalancedBinaryTree
  attr_reader :root, :data

  # @param {TreeNode} root
  def initialize(array)
    @data = array.sort.uniq
    @root = build_tree(@data)
  end

  # @param {TreeNode} node
  # @param {String} prefix
  # @param {Boolean} is_left
  # @return {void}
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end


  # @param {Integer[]} array
  # @return {TreeNode}
  def build_tree(array)
    return nil? if array.empty?
    puts p array
    middle = array.length / 2
    node = TreeNode.new(array[middle])
    return node if array.length == 1

    node.left = build_tree(array[0...middle])
    node.right = build_tree(array[middle + 1..])
    node
  end

  # @param {Integer} value
  #
  # @return {TreeNode}
  def insert(value)
    node = TreeNode.new(value)
    if @root.nil?
      @root = node
    else
      insert_node(@root, node)
    end
  end

  # @param {Integer} value
  # @return {TreeNode}
  def find(value = root)
    node = @root
    while !node.nil?
      if value < node.value
        node = node.left
      elsif value > node.value
        node = node.right
      else
        return node
      end
    end

    nil
  end

  # @param {TreeNode} node
  #
  # @return {TreeNode}
  def delete(value)
    @root = delete_node(@root, value)
  end

  # @param {TreeNode} node
  #
  # @return {Integer}
  def height(node)
    if node.nil?
      return 0
    else
      return 1 + [height(node.left), height(node.right)].max
    end
  end

  # @param {TreeNode} node
  # @return {Boolean}
  def is_balanced?(node = root)
    if node.nil?
      return true
    end

    left_height = height(node.left)
    right_height = height(node.right)

    if (left_height - right_height).abs <= 1 && is_balanced?(node.left) && is_balanced?(node.right)
      return true
    end

    return false
  end

  def level_order(node = @root)
    return [] if node.nil?

    queue = [node]
    result = []

    while !queue.empty?
      current = queue.shift
      result << current.value

      queue << current.left if !current.left.nil?
      queue << current.right if !current.right.nil?
    end

    result
  end

  def depth(node)
    return 0 if node.nil?

    left_depth = depth(node.left)
    right_depth = depth(node.right)

    if left_depth > right_depth
      return left_depth + 1
    else
      return right_depth + 1
    end
  end

  def in_order(node = @root)
    return [] if node.nil?

    result = []
    result += in_order(node.left)
    result << node.value
    result += in_order(node.right)

    result
  end

  def pre_order(node = @root)
    return [] if node.nil?

    result = []
    result << node.value
    result += pre_order(node.left)
    result += pre_order(node.right)

    result
  end

  def post_order(node = @root)
    return [] if node.nil?

    result = []
    result += post_order(node.left)
    result += post_order(node.right)
    result << node.value

    result
  end

  def min_value_node(node)
    current = node
    while !current.left.nil?
      current = current.left
    end

    current
  end

  def max_value_node(node)
    current = node
    while !current.right.nil?
      current = current.right
    end

    current
  end

  def rebalance
    array = in_order
    @root = nil
    build_tree(array)
  end

  def balanced?
    is_balanced?(@root)
  end

  private

  # @param {TreeNode} node
  # @param {TreeNode} root
  # @return {TreeNode}
  def insert_node(root, node)
    if node.value < root.value
      if root.left.nil?
        root.left = node
      else
        insert_node(root.left, node)
      end
    else
      if root.right.nil?
        root.right = node
      else
        insert_node(root.right, node)
      end
    end
  end



  # @param {TreeNode} node
  # @param {Integer} value
  #
  # @return {TreeNode}
  def delete_node(node, value)
    return node if node.nil?

    if value < node.value
      node.left = delete_node(node.left, value)
    elsif value > node.value
      node.right = delete_node(node.right, value)
    else
      if node.left.nil?
        temp = node.right
        node = nil
        return temp
      elsif node.right.nil?
        temp = node.left
        node = nil
        return temp
      end

      temp = min_value_node(node.right)
      node.value = temp.value
      node.right = delete_node(node.right, temp.value)
    end

    node
  end
end

