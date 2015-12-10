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
    @tree.insert('w')
    data = @tree.root.right_link.data

    assert_equal 'w', data
  end

  def test_correctly_assigns_node_A_to_left_link_of_node_J
    @tree.insert('m')
    @tree.insert('w')
    @tree.insert('j')
    @tree.insert('a')

    node_J = @tree.root.left_link
    node_A = node_J.left_link

    assert_equal 'a', node_A.data
  end

  def test_correctly_assigns_node_L_to_right_link_of_node_J
    @tree.insert('m')
    @tree.insert('w')
    @tree.insert('j')
    @tree.insert('l')

    node_J = @tree.root.left_link
    node_L = node_J.right_link

    assert_equal 'l', node_L.data
  end

  def test_correctly_assigns_node_P_to_left_link_of_node_W
    @tree.insert('m')
    @tree.insert('w')
    @tree.insert('p')

    node_W = @tree.root.right_link
    node_P = node_W.left_link

    assert_equal 'p', node_P.data
  end

  def test_correctly_assigns_node_Z_to_right_link_of_node_W
    @tree.insert('m')
    @tree.insert('w')
    @tree.insert('z')

    node_W = @tree.root.right_link
    node_Z = node_W.right_link

    assert_equal 'z', node_Z.data
  end

  def test_depth_is_zero_when_only_node_is_the_root
    depth = @tree.insert('m')

    assert_equal 0, depth
  end

  def test_depth_is_one_when_two_nodes_are_set
    @tree.insert('m')
    depth = @tree.insert('j')

    assert_equal 1, depth
  end

  def test_depth_is_two_when_four_nodes_are_set
    @tree.insert('m')
    @tree.insert('e')
    @tree.insert('w')
    depth = @tree.insert('a')

    assert_equal 2, depth
  end

  def test_depth_is_three_when_given_the_right_set_of_nodes
    @tree.insert('m')
    @tree.insert('j')
    @tree.insert('a')
    @tree.insert('l')
    depth = @tree.insert('k')

    assert_equal 3, depth
  end

  def test_returns_false_for_include_if_root_is_nil
    assert_equal false, @tree.include?('a')
  end

  def test_returns_true_for_include_if_root_data_equal_data_passed_in
    @tree.insert('a')

    assert_equal true, @tree.include?('a')
  end

  def test_checks_if_a_piece_data_is_included_in_tree
    @tree.insert('m')
    @tree.insert('c')
    @tree.insert('q')
    @tree.insert('a')

    assert_equal true, @tree.include?('q')
    assert_equal false, @tree.include?('b')
  end

  def test_returns_the_largest_data_in_the_tree
    @tree.insert('m')
    @tree.insert('c')
    @tree.insert('q')
    @tree.insert('a')

    assert_equal 'q', @tree.max
  end

  def test_returns_the_smallest_value_present_in_a_tree
    @tree.insert('m')
    @tree.insert('c')
    @tree.insert('q')
    @tree.insert('a')

    assert_equal 'a', @tree.min
  end

  def test_returns_an_array_with_one_element_if_root_is_only_node
    @tree.insert('m')

    assert_equal ['m'], @tree.sort
  end

  def test_returns_an_array_with_two_elements_sorted
    @tree.insert('m')
    @tree.insert('c')

    assert_equal ['c', 'm'], @tree.sort
  end

  def test_returns_an_array_with_three_elements_sorted
    @tree.insert('m')
    @tree.insert('c')
    @tree.insert('q')

    assert_equal ['c', 'm', 'q'], @tree.sort
  end

  def test_returns_an_array_of_all_elements_in_sorted_order
    @tree.insert('m')
    @tree.insert('c')
    @tree.insert('q')
    @tree.insert('a')

    assert_equal ['a', 'c', 'm', 'q'], @tree.sort
  end

  def test_returns_an_array_of_many_elements_in_sorted_order
    @tree.insert('m')
    @tree.insert('m')
    @tree.insert('c')
    @tree.insert('q')
    @tree.insert('a')
    @tree.insert('z')
    @tree.insert('e')

    assert_equal ['a', 'c', 'e', 'm', 'q', 'z'], @tree.sort
  end

  def test_load_returns_the_number_of_unique_values_inserted_into_tree
    unique_values = @tree.load('numbers.txt')

    assert_equal 10, unique_values
  end
end
