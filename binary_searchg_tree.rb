# frozen_string_literal: true

class Tree
  attr_accessor :root, :array
  def initialize(array = nil)
    @array = array.uniq.sort
    @root = build_tree(@array)
  end

  def build_tree(arr)
    return nil if arr.empty?
    mid = arr.length / 2 
    node = Node.new(arr[mid])
    node.left = build_tree(arr[0...mid])
    node.right = build_tree(arr[mid + 1..-1])
    node
  end

  def insert(value, root = @root)
    return "Node #{value} already exists, enter another value." if @array.include?(value)
    if value < root.data
      root.left.nil? ? (return root.left = Node.new(value)) : insert(value, root.left)
    else
      root.right.nil? ? (return root.right = Node.new(value)) : insert(value, root.right)
    end
    "Node #{value} added."
  end

  def min_value_node(root = @root.right)
    until root.left.nil?
     root = root.left
    end
    root
  end

  def delete(value, root = @root)
    return root if root.nil?
    if value < root.data
      root.left = delete(value, root.left)
    elsif value > root.data
      root.right = delete(value, root.right)
    else
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      new_node = min_value_node(root.right)
      root.data = new_node.data
      root.right = delete(new_node.data, root.right)
    end
    root
  end

  def find(value, root = @root)
    return "Element does not exists." if root.nil?
    return "The element #{value} is at node: #{root}" if root.data == value
    if value < root.data
      find(value, root.left)
    else
      find(value, root.right)
    end
  end

  def level_order_with_rec(root = @root, arr =[], queue =[])
    return if root.nil?
    arr << root.data
    queue << root.left if !root.left.nil?
    queue << root.right if !root.right.nil?
    level_order_with_rec(queue.shift, arr, queue)
    "Level-Order with recursion : #{arr}"
  end

  def level_order(root = @root)
    arr, queue = [[], []] 
    return if root.nil?
    queue << root
    until queue.empty?
      root = queue[0]
      arr << queue.shift.data
      queue << root.left if !root.left.nil?
      queue << root.right if !root.right.nil?
    end
     "Level-Order without using recursion : #{arr}"
  end

  def in_order(root = @root, arr = [])
    arr = in_order(root.left, arr) unless root.left.nil?
    arr << root.data
    arr = in_order(root.right, arr) unless root.right.nil?
    arr
  end

  def pre_order(root = @root, arr = [])
    arr << root.data if root.data
    arr = pre_order(root.left, arr) if root.left
    arr = pre_order(root.right, arr) if root.right
    arr
  end

  def post_order(root = @root, arr = [])
    arr = post_order(root.left, arr) if root.left
    arr = post_order(root.right, arr) if root.right
    arr << root.data if root.data
    arr
  end

  def height(value = 0, root = @root)
    return height_count(root) if value == root.data || value == 0
    value < root.data ? height(value, root.left) : height(value, root.right)
  end

  def height_count(root = @root)
    return 0 if root.nil?
    left_height = height_count(root.left)
    right_height = height_count(root.right)
    if left_height > right_height
      left_height + 1
    else
      right_height + 1
    end
  end

  def depth(value, count = 0, root =@root)
    return "Empty tree." if @array.empty?
    return "The value #{value} is at depth: #{count}" if root.data == value
    if value < root.data
      count += 1
      depth(value, count, root.left)
    else
      count += 1
      depth(value, count, root.right)
    end
  end

  def balanced?(root = @root)
    return height_count(root.left) - height_count(root.right) <= 1 ? true : false
  end

  def rebalance
    self.array = in_order
    self.root = build_tree(array)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

class Node
  attr_accessor :data, :left, :right
  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

tree = Tree.new([2,3,6,1,3,7,3,4,5,7,2])
tree.pretty_print
p tree.in_order
p tree.pre_order
p tree.post_order
p tree.insert(8)
p tree.in_order
tree.pretty_print
p tree.find(2)
p tree.find(9)
p tree.depth(8)
p tree.level_order_with_rec
p tree.level_order
tree.delete(6)
p tree.in_order
tree.pretty_print
p tree.height(7)
p tree.balanced?
tree.rebalance
tree.pretty_print