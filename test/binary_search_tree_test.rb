require 'minitest'
require 'binary_search_tree'
require 'pry'

class BinarySearchTreeTest < Minitest::Test
  def setup
    @tree = BinarySearchTree.new
  end

  def test_can_create_instances
    assert_instance_of BinarySearchTree, @tree
  end

  def test_has_a_root_equal_to_nil_on_creation
    assert_nil @tree.root
  end
end
