require 'minitest'
require 'binary_search_tree'
require 'node'
require 'pry'

class BinarySearchTreeTest < Minitest::Test
  def setup
    @tree = BinarySearchTree.new
    @node1 = Node.new('m')
    @node2 = Node.new('j')
  end

  def test_can_create_instances
    assert_instance_of BinarySearchTree, @tree
  end

  def test_has_a_root_equal_to_nil_on_creation
    assert_nil @tree.root
  end

  def test_root_can_be_assigned_a_node
    @tree.root = @node1

    assert_equal @node1, @tree.root
  end

  def test_root_is_not_nil_when_assigned_a_node
    @tree.root = @node1

    refute_nil @tree.root
  end

  def test_can_insert_a_node_with_an_empty_root
    @tree.insert('j')

    assert_equal 'j', @tree.root.data
  end

  def test_assigns_new_node_to_roots_left_link_if_new_data_is_less_than_roots_data
    @tree.insert('m')
    @tree.insert('j')
    data = @tree.root.left_link.data

    assert_equal 'j', data
  end

  def test_assigns_new_node_to_roots_right_link_if_new_data_is_greater_than_roots_data
    @tree.insert('m')
    @tree.insert('z')
    data = @tree.root.right_link.data

    assert_equal 'z', data
  end
end
