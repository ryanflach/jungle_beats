require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beat'

class JungleBeatTest < Minitest::Test
  def test_it_instantiates_a_new_list
    jb = JungleBeat.new
    assert jb.list
  end

  def test_it_can_append_to_a_linked_list
    jb = JungleBeat.new
    jb.append("doo")
    assert_equal "doo", jb.list.head.data
  end
end
