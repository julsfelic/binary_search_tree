require 'minitest'
require 'binary_search_tree'
require 'pry'

class BinarySearchTreeTest < Minitest::Test
  def test_can_create_instances
    tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, tree
  end
end
