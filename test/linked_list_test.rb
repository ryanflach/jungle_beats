require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/node'

class LinkedListTest < Minitest::Test
  def test_head_is_nil_by_default
    list = LinkedList.new
    assert_equal nil, list.head
  end

  def test_it_can_append_a_node
    list = LinkedList.new
    node = Node.new("data")
    list.append(node)
    assert_equal "data", list.head.data
  end

  def test_if_already_has_head_append_becomes_head_next_node
    list = LinkedList.new
    node = Node.new("data")
    list.append(node)
    list.append("second")
    assert_equal "second", list.head.next_node
  end

  def test_it_can_count_nodes_in_the_list
    list = LinkedList.new
    node = Node.new("data")
    assert_equal 0, list.count
    list.append(node)
    assert_equal 1, list.count
  end

  def test_it_can_count_multiple_nodes
    list = LinkedList.new
    node = Node.new("data")
    list.append(node)
    list.append("beep")
    assert_equal 2, list.count
  end

  def test_it_can_output_to_a_string_separated_by_spaces
    list = LinkedList.new
    node = Node.new("data")
    list.append(node)
    assert_equal "data", list.to_string
  end

  def test_it_can_output_a_string_when_multiple_items
    list = LinkedList.new
    node = Node.new("data")
    list.append(node)
    list.append("beep")
    assert_equal "data beep", list.to_string
  end


end
