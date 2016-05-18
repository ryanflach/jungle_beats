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

  def test_tail_is_nil_by_default
    assert_equal nil, @list.tail
  end

  def test_it_can_append_a_single_node
    @list.append("data")
    assert_equal "data", @list.head.data
  end

  def test_if_only_one_node_it_is_head_and_tail
    @list.append("solo")
    assert_equal "solo", @list.head.data
    assert_equal "solo", @list.tail.data
  end

  def test_tail_has_no_next_node
    @list.append("uno")
    assert_equal nil, @list.tail.next_node
  end

  def test_if_already_has_head_appended_becomes_head_next_node
    @list.append("data")
    @list.append("second")
    assert_equal "second", @list.head.next_node.data
  end

  def test_if_already_has_head_appended_becomes_new_tail
    @list.append("first")
    @list.append("second")
    assert_equal "second", @list.tail.data
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

  def test_to_string_will_return_nil_if_list_is_empty
    assert_equal nil, @list.to_string
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

  def test_if_empty_list_navigate_to_returns_nil
    assert_equal nil, @list.navigate_to(3)
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

  def test_it_can_find_and_return_a_set_number_of_elements_from_a_location
    0.upto(4) { |num| @list.append(num.to_s) }
    assert_equal "2 3", @list.find(2, 2)
  end

  def test_it_will_output_to_the_tail_if_find_request_exceeds_tail
    0.upto(4) { |num| @list.append(num.to_s) }
    assert_equal "1 2 3 4", @list.find(1, 5)
  end

  def test_it_will_begin_output_with_head_if_find_start_is_negative
    0.upto(4) { |num| @list.append(num.to_s) }
    assert_equal "0 1 2 3", @list.find(-1, 4)
  end

  def test_if_list_empty_find_returns_nil
    assert_equal nil, @list.find(0, 3)
  end

  def test_it_can_determine_if_an_element_is_included
    @list.append("big")
    assert @list.include?("big")
    refute @list.include?("small")
  end

  def test_will_return_false_if_searching_an_empty_list
    assert_equal 0, @list.count
    assert_equal false, @list.include?("test")
  end

  def test_it_can_pop_off_the_last_element
    @list.append("zero")
    @list.append("one")
    @list.append("two")
    @list.pop
    assert_equal "one", @list.tail.data
    @list.pop
  end

  def test_it_can_pop_even_if_only_one_element
    @list.append("zero")
    assert_equal "zero", @list.head.data
    @list.pop
    assert_equal nil, @list.head
  end

  def test_popping_empty_list_returns_nothing
    @list.pop
    assert_equal nil, @list.head
  end

end
