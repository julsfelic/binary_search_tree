require 'pry'
require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(data)
    # set depth method?
    depth = 0
    node = create_new_node(data)
    if root_is_nil?
      @root = node
      depth
    else
      compare_node_data(node)
    end
    # root_is_nil? ? @root = node : compare_node_data(node)
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

  def compare_node_data(node, current_node=root, depth=0)
    depth += 1
    if node.data < current_node.data
      # maybe add left link nil to the node itself?
      go_to_left_link(node, current_node)
    else
      go_to_right_link(node, current_node)
    end
    depth
  end

  def go_to_left_link(node, current_node)
    if left_link_nil?(current_node)
      # refactor
      assign_left_link(current_node, node)
    else
      current_node = current_node.left_link
      compare_node_data(node, current_node)
    end
  end

  def go_to_right_link(node, current_node)
    if right_link_nil?(current_node)
      # refactor
      assign_right_link(current_node, node)
    else
      current_node = current_node.right_link
      compare_node_data(node, current_node)
    end
  end

  def root_is_nil?
    root.nil?
  end

  def left_link_nil?(node)
    node.left_link.nil?
  end

  def right_link_nil?(node)
    node.right_link.nil?
  end
end
