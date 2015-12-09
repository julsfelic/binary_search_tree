require 'minitest'
require 'node'
require 'pry'

class NodeTest < Minitest::Test
  def test_can_create_instances
    node = Node.new

    assert_instance_of Node, node
  end
end
