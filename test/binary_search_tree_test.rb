require 'minitest'
require 'binary_search_tree'
require 'node'
require 'pry'

class BinarySearchTreeTest < Minitest::Test
  def setup
    @tree = BinarySearchTree.new
    @node = Node.new
  end

  def test_can_create_instances
    assert_instance_of BinarySearchTree, @tree
  end

  def test_has_a_root_equal_to_nil_on_creation
    assert_nil @tree.root
  end

  def test_root_can_be_assigned_a_node
    @tree.root = @node

    assert_equal @node, @tree.root
  end

  def test_root_is_not_nil_when_assigned_a_node
    skip
  end
end
