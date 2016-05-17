require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListTest < Minitest::Test
  def setup
    @list = LinkedList.new
  end

  def test_head_is_nil_by_default
    assert_equal nil, @list.head
  end

  def test_it_can_append_a_node
    @list.append("data")
    assert_equal "data", @list.head.data
  end

  def test_if_already_has_head_append_becomes_head_next_node
    @list.append("data")
    @list.append("second")
    assert_equal "second", @list.head.next_node.data
  end

  def test_it_can_append_when_head_and_tail_present
    @list.append("first")
    assert_equal "first", @list.head.data
    @list.append("second")
    assert_equal "second", @list.head.next_node.data
    @list.append("third")
    assert_equal "third", @list.tail.data
    refute @list.tail.next_node
  end

  def test_it_can_count_nodes_in_the_list
    assert_equal 0, @list.count
    @list.append("data")
    assert_equal 1, @list.count
  end

  def test_it_can_count_multiple_nodes
    @list.append("data")
    @list.append("beep")
    assert_equal 2, @list.count
  end

  def test_it_can_output_to_a_string_separated_by_spaces
    @list.append("data")
    assert_equal "data", @list.to_string
  end

  def test_it_can_output_a_string_when_multiple_items
    @list.append("data")
    @list.append("beep")
    assert_equal "data beep", @list.to_string
  end

  def test_it_can_prepend_to_an_empty_list
    @list.prepend("data")
    assert_equal "data", @list.head.data
  end

  def test_it_can_prepend_to_the_beginning_of_an_existing_list
    @list.prepend("data")
    assert_equal "data", @list.head.data
    @list.prepend("new_head")
    assert_equal "new_head", @list.head.data
    assert_equal "data", @list.head.next_node.data
  end

  def test_it_can_navigate_to_specific_positions
    @list.append("zero")
    @list.append("one")
    @list.append("two")
    assert_equal "one", @list.navigate_to(1).data
  end

  def test_it_can_insert_into_any_valid_position
    @list.append("zero")
    assert_equal "zero", @list.head.data
    @list.append("one")
    assert_equal "one", @list.tail.data
    @list.append("two")
    assert_equal "two", @list.navigate_to(2).data
    @list.insert(1, "new one")
    assert_equal "new one", @list.head.next_node.data
  end

  def test_insert_creates_a_new_head_if_place_is_0_or_less
    @list.insert(-1, "new")
    assert_equal "new", @list.head.data
  end

  def test_insert_makes_a_new_tail_if_place_is_too_high
    @list.append("hello")
    @list.append("goodbye")
    @list.insert(10, "new")
    assert_equal "new", @list.tail.data
  end

  def test_it_can_return_a_set_number_of_elements_from_a_starting_location
    0.upto(4) { |num| @list.append(num.to_s) }
    assert_equal "2 3", @list.find(2, 2)
  end

  def test_it_can_determine_if_an_element_is_included
    @list.append("big")
    assert @list.include?("big")
    refute @list.include?("small")
  end

  def test_it_can_pop_off_the_last_element
    @list.append("zero")
    @list.append("one")
    @list.append("two")
    @list.pop
    assert_equal "one", @list.tail.data
    @list.pop
    assert_equal "zero", @list.tail.data
    @list.pop
    assert_equal nil, @list.tail
  end

end
