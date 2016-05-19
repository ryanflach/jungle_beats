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

  def test_appending_spaces_only_has_no_effect
    @jb.append("    ")
    assert_equal nil, @jb.list.head
  end

  def test_it_can_prepend_to_a_linked_list
    @jb.prepend("doo")
    assert_equal "doo", @jb.list.head.data
  end

  def test_it_can_prepend_multiple_items_at_once
    @jb.append("ray")
    @jb.prepend("hip hip hip hop hoo")
    assert_equal "hip", @jb.list.head.data
    assert_equal "hoo", @jb.list.navigate_to(4).data
  end

  def test_prepending_spaces_only_has_no_effect
    @jb.append("   ")
    assert_equal nil, @jb.list.head
  end

  def test_it_can_count_the_number_of_items
    @jb.append("doo wop diggy")
    assert_equal 3, @jb.count
  end

  def test_it_can_play_a_beat
    @jb.append("mmm bop bah doo bee wop bop mmm bop sha doo bee wop bop")
    assert @jb.play
  end

  def test_speed_can_be_changed
    @jb.rate = 100
    assert_equal 100, @jb.rate
  end

  def test_speed_can_be_reset
    @jb.rate = 100
    @jb.reset_rate
    assert_equal 500, @jb.rate
  end

  def test_voice_can_be_changed
    @jb.voice = "Alice"
    assert_equal "Alice", @jb.voice
  end

  def test_voice_can_be_reset
    @jb.voice = "Alice"
    @jb.reset_voice
    assert_equal "Boing", @jb.voice
  end

end
