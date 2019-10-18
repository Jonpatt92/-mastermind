require './test/test_helper'

class SequenceTest < Minitest::Test
  def setup
    @sequence = Sequence.new
  end

  def test_it_exists
    assert_instance_of Sequence, @sequence
  end

  def test_it_has_colors
    assert_equal 4, @sequence.colors.flatten.count("RGBY")
  end

  def test_it_can_generate_new_colors
    existing_colors = @sequence.colors
    @sequence.shuffle_colors
    new_colors = @sequence.colors

    refute new_colors == existing_colors
    asssert_equal 4, new_colors.flatten.count("RGBY")
  end
end
