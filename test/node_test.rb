require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def test_it_is_a_node
    node = Node.new("plop")
    assert_instance_of Node, node
  end

  def test_it_contains_data
    node = Node.new("plop")
    assert node.data
  end

  def test_it_can_have_a_next_node
    node = Node.new("plop", "next")
    assert node.next_node
  end

end
