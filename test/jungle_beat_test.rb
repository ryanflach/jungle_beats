require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beat'

class JungleBeatTest < Minitest::Test
  def setup
    @jb = JungleBeat.new
  end

  def test_it_instantiates_a_new_list
    assert @jb.list
  end

  def test_it_can_append_to_a_linked_list
    @jb.append("doo")
    assert_equal "doo", @jb.list.head.data
  end

  def test_it_can_append_multiple_items_at_once
    @jb.append("doo wop diggy")
    assert_equal "doo", @jb.list.head.data
    assert_equal "wop", @jb.list.head.next_node.data
    assert_equal "diggy", @jb.list.tail.data
  end

  def test_it_can_count_the_number_of_items
    @jb.append("doo wop diggy")
    assert_equal 3, @jb.count
  end

  def test_it_can_play_a_beat
    @jb.append("mmm bop bah doo bee wop bop mmm bop sha doo bee wop bop")
    assert @jb.play
  end


end
