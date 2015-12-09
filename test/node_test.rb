require 'minitest'
require 'node'
require 'pry'

class NodeTest < Minitest::Test
  def setup
    @node1 = Node.new
    @node2 = Node.new
    @node3 = Node.new
  end

  def test_can_create_instances
    assert_instance_of Node, @node1
  end

  def test_has_data_that_is_equal_to_nil_on_creation
    assert_nil @node1.data
  end

  def test_has_a_left_link_that_is_equal_to_nil_on_creation
    assert_nil @node1.left_link
  end

  def test_has_a_right_link_that_is_equal_to_nil_on_creation
    assert_nil @node1.right_link
  end

  def test_can_have_a_node_assigned_to_its_left_link
    @node1.left_link = @node2

    assert_equal @node2, @node1.left_link
  end

  def test_can_have_a_node_assigned_to_its_right_link
    @node1.right_link = @node2

    assert_equal @node2, @node1.right_link
  end

  def test_can_have_both_its_links_assigned_to_another_node
    @node1.left_link  = @node2
    @node1.right_link = @node3

    assert_equal @node2, @node1.left_link
    assert_equal @node3, @node1.right_link
  end
end
