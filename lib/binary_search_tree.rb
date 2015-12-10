require 'pry'
require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
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

  def find_min_node
    current_node = root
    until left_link_nil?(current_node)
      current_node = current_node.left_link
      if left_link_nil?(current_node)
        return current_node
      end
    end
  end

# start at tope node
# go left
# if bottom, collect, else, keep going left
# go back to parent
# if top, collect into result, else keep going up (down and right)
# go right and repeat going to bottom

  def sort
    current_node = root
    sorted_nodes = []

    if both_links_nil?(current_node)
      sorted_nodes << current_node.data
    elsif left_link_not_nil?(current_node)
      # find the min node
      min_node = find_min_node
      sorted_nodes << deconstruct_left_tree(current_node, min_node)
      sorted_nodes << current_node.data
    elsif false
      #
    end
    sorted_nodes.flatten
  end

  def deconstruct_left_tree(current_node, min_node)
    sorted_nodes = []
    sorted_nodes << min_node.data
    set_left_link_to_nil(current_node)
    if right_link_not_nil?(current_node)
      sorted_nodes << current_node.right_link.data
      set_right_link_to_nil(current_node)
    end
    sorted_nodes
  end

  def set_nodes_links_to_nil(current_node)
    current_node.left_link = nil
    current_node.right_link = nil
  end

  def set_left_link_to_nil(current_node)
    current_node.left_link == nil
  end

  def set_right_link_to_nil(current_node)
    current_node.right_link == nil
  end

  def include?(data)
    return false if root_is_nil?
    check_tree_for_data(data)
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
    links = nil
    if node.left_link.nil? && node.right_link.nil?
      false
    else
      true
    end
  end

  def both_links_nil?(node)
    links = nil
    if node.left_link.nil? && node.right_link.nil?
      true
    else
      false
    end
  end
end
