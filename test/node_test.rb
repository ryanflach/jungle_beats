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

  def test_it_has_no_next_node_by_default
    node = Node.new("plop")
    assert_equal nil, node.next_node
  end

  def test_it_can_have_an_assigned_next_node
    node = Node.new("plop", "doowop")
    assert_equal "doowop", node.next_node
  end

end
