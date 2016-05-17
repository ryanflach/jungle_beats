require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListTest < Minitest::Test
  def test_head_is_nil_by_default
    list = LinkedList.new
    assert_equal nil, list.head
  end

  def test_it_can_append_a_node
    list = LinkedList.new
    list.append("data")
    assert_equal "data", list.head.data
  end

  def test_if_already_has_head_append_becomes_head_next_node
    list = LinkedList.new
    list.append("data")
    list.append("second")
    assert_equal "second", list.head.next_node.data
  end

  def test_it_can_append_when_head_and_tail_present
    list = LinkedList.new
    list.append("first")
    assert_equal "first", list.head.data
    list.append("second")
    assert_equal "second", list.head.next_node.data
    list.append("third")
    assert_equal "third", list.tail.data
    refute list.tail.next_node
  end

  def test_it_can_count_nodes_in_the_list
    list = LinkedList.new
    assert_equal 0, list.count
    list.append("data")
    assert_equal 1, list.count
  end

  def test_it_can_count_multiple_nodes
    list = LinkedList.new
    list.append("data")
    list.append("beep")
    assert_equal 2, list.count
  end

  def test_it_can_output_to_a_string_separated_by_spaces
    list = LinkedList.new
    list.append("data")
    assert_equal "data", list.to_string
  end

  def test_it_can_output_a_string_when_multiple_items
    list = LinkedList.new
    list.append("data")
    list.append("beep")
    assert_equal "data beep", list.to_string
  end

  def test_it_can_prepend_to_an_empty_list
    list = LinkedList.new
    list.prepend("data")
    assert_equal "data", list.head.data
  end

  def test_it_can_prepend_to_the_beginning_of_an_existing_list
    list = LinkedList.new
    list.prepend("data")
    assert_equal "data", list.head.data
    list.prepend("new_head")
    assert_equal "new_head", list.head.data
    assert_equal "data", list.head.next_node.data
  end

  def test_it_can_navigate_to_specific_positions
    list = LinkedList.new
    list.append("zero")
    list.append("one")
    list.append("two")
    assert_equal "one", list.navigate_to(1).data
  end

  def test_it_can_insert_into_any_valid_position
    list = LinkedList.new
    list.append("zero")
    assert_equal 0, list.head.position
    list.append("one")
    assert_equal 1, list.head.next_node.position
    list.append("two")
    assert_equal "one", list.navigate_to(1).data
    assert_equal 2, list.head.next_node.next_node.position
    list.insert(1, "new one")
    assert_equal "new one", list.head.next_node.data
  end

  def test_insert_creates_a_new_head_if_place_is_0_or_less
    list = LinkedList.new
    list.insert(-1, "new")
    assert_equal "new", list.head.data
  end

  def test_insert_makes_a_new_tail_if_place_is_too_high
    list = LinkedList.new
    list.append("hello")
    list.append("goodbye")
    list.insert(10, "new")
    assert_equal "new", list.tail.data
  end

end
