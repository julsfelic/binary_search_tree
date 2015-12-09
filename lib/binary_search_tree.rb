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

  def compare_node_data(node)
    if node.data < root.data
      assign_left_link(root, node)
    else
      assign_right_link(root, node)
    end
  end

  def root_is_nil?
    root.nil?
  end
end
