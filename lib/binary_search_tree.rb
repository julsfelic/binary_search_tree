require 'pry'
require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(node=nil)
    @root = node
  end

  def insert(data)
    depth = 0
    node = create_new_node(data)
    if root_is_nil?
      @root = node
    else
      depth = compare_node_data(depth, node)
    end
    depth
  end

  def include?(data)
    return false if root_is_nil?
    check_tree_for_data(data)
  end

  def depth_of(data)
    if include?(data)
      check_tree_for_depth(data)
    else
      nil
    end
  end

  def max
    current_node = root
    until right_link_nil?(current_node)
      current_node = current_node.right_link
      if right_link_nil?(current_node)
        return current_node.data
      end
    end
  end

  def min
    current_node = root
    until left_link_nil?(current_node)
      current_node = current_node.left_link
      if left_link_nil?(current_node)
        return current_node.data
      end
    end
  end

  def sort
    current_node = root
    if both_links_nil?(current_node)
      [current_node.data]
    else
      sort_nodes(current_node)
    end
  end

  def load(file)
    numbers = File.foreach(file).map do |line|
      line.chomp
    end
    shuffled_numbers = numbers.uniq.shuffle
    shuffled_numbers.each do |num|
      insert(num)
    end
    shuffled_numbers.count
  end

  private

    def create_new_node(data)
      Node.new(data)
    end

    def assign_left_link(node, new_node)
      node.left_link = new_node
    end

    def assign_right_link(node, new_node)
      node.right_link = new_node
    end

    def compare_node_data(depth, node, current_node=root)
      return if include?(node.data)
      if node.data < current_node.data
        depth += 1
        go_to_left_link(depth, node, current_node)
      else
        depth += 1
        go_to_right_link(depth, node, current_node)
      end
    end

    def go_to_left_link(depth, node, current_node)
      if left_link_nil?(current_node)
        assign_left_link(current_node, node)
      else
        current_node = current_node.left_link
        depth = compare_node_data(depth, node, current_node)
      end
      depth
    end

    def go_to_right_link(depth, node, current_node)
      if right_link_nil?(current_node)
        assign_right_link(current_node, node)
      else
        current_node = current_node.right_link
        depth = compare_node_data(depth, node, current_node)
      end
      depth
    end

    def check_tree_for_depth(data, current_node=root, depth=1)
      return depth if data == current_node.data
      if data < current_node.data && left_link_not_nil?(current_node)
        check_tree_for_depth(data, current_node.left_link, depth)
        depth += 1
      elsif data > current_node.data && right_link_not_nil?(current_node)
        check_tree_for_depth(data, current_node.right_link, depth)
      end
    end

    def check_tree_for_data(data, current_node=root)
      return true if data == current_node.data
      if data < current_node.data && left_link_not_nil?(current_node)
        check_tree_for_data(data, current_node.left_link)
      elsif data > current_node.data && right_link_not_nil?(current_node)
        check_tree_for_data(data, current_node.right_link)
      else
        false
      end
    end

    def sort_nodes(node, sorted_nodes=[])
      if both_links_not_nil?(node)
        sort_left_tree(node, sorted_nodes)
        sorted_nodes << node.data
        sort_right_tree(node, sorted_nodes)
      else
        sorted_nodes << node.data
      end
      sorted_nodes
    end

    def sort_left_tree(node, sorted_nodes)
      if left_link_not_nil?(node)
        sorted_nodes = sort_nodes(node.left_link, sorted_nodes)
      end
      sorted_nodes
    end

    def sort_right_tree(node, sorted_nodes)
      if right_link_not_nil?(node)
        sorted_nodes = sort_nodes(node.right_link, sorted_nodes)
      end
    end

    def root_is_nil?
      root.nil?
    end

    def left_link_nil?(node)
      node.left_link.nil?
    end

    def left_link_not_nil?(node)
      !node.left_link.nil?
    end

    def right_link_nil?(node)
      node.right_link.nil?
    end

    def right_link_not_nil?(node)
      !node.right_link.nil?
    end

    def both_links_not_nil?(node)
      if node.left_link.nil? && node.right_link.nil?
        false
      else
        true
      end
    end

    def both_links_nil?(node)
      if node.left_link.nil? && node.right_link.nil?
        true
      else
        false
      end
    end
end

if __FILE__ == $0
  tree = BinarySearchTree.new

  puts tree.insert('m')
  puts tree.insert('c')
  puts tree.insert('q')
  puts tree.insert('a')


  puts tree.include?('q')
  puts tree.include?('b')

  puts tree.depth_of('q')
  puts tree.depth_of('a')

  puts tree.max
  puts tree.min

  p tree.sort

  puts tree.load('./numbers.txt')
end
