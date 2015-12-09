require 'pry'
require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(data)
    node = create_new_node(data)
    if root_is_nil?
      @root = node
    else
      compare_node_data(node)
    end
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

  def compare_node_data(current_node=root, node)
    if node.data < current_node.data
      # maybe add left link nil to the node itself?
      go_to_left_link(current_node, node)
    else
      go_to_right_link(current_node, node)
    end
  end

  def go_to_left_link(current_node, node)
    if left_link_nil?(current_node)
      assign_left_link(current_node, node)
    else
      current_node = current_node.left_link
      compare_node_data(current_node, node)
    end
  end

  def go_to_right_link(current_node, node)
    if right_link_nil?(current_node)
      assign_right_link(current_node, node)
    else
      current_node = current_node.right_link
      compare_node_data(current_node, node)
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
