require 'pry'
require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(data)
    node = create_new_node(data)
    @root = node if root_is_nil?
  end

  def create_new_node(data)
    Node.new(data)
  end

  def root_is_nil?
    @root.nil?
  end
end
