require 'minitest'
require 'node'
require 'pry'

class NodeTest < Minitest::Test
  def setup
    @node = Node.new
  end

  def test_can_create_instances
    assert_instance_of Node, @node
  end

  def test_has_data_that_is_equal_to_nil_on_creation
    assert_nil @node.data
  end
end
