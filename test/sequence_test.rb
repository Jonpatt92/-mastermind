require './test/test_helper'

class SequenceTest < Minitest::Test
  def setup
    @sequence = Sequence.new
  end

  def test_it_exists
    assert_instance_of Sequence, @sequence
  end

  def test_it_has_colors
    assert_equal 4, @sequence.colors.count("RGBY")
  end
end
