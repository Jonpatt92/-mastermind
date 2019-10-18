require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/sequence'

class SequenceTest < Minitest::Test
  def setup
    @sequence = Sequence.new
  end

  def test_it_exists
    assert_instance_of Sequence, @sequence
  end

  def test_it_has_colors
    assert_equal 4, @sequence.colors.join.count("RGBY")
    refute_equal 3, @sequence.colors.join.count("R")
    refute_equal 3, @sequence.colors.join.count("G")
    refute_equal 3, @sequence.colors.join.count("B")
    refute_equal 3, @sequence.colors.join.count("Y")
  end

  def test_it_can_generate_new_colors
    existing_colors = @sequence.colors
    new_colors = @sequence.shuffle_colors

    refute_equal new_colors, existing_colors
    assert_equal 4, new_colors.join.count("RGBY")
    refute_equal 3, new_colors.join.count("R")
    refute_equal 3, new_colors.join.count("G")
    refute_equal 3, new_colors.join.count("B")
    refute_equal 3, new_colors.join.count("Y")
  end

  def test_it_can_verify_guess
    guess = @sequence.colors
    assert_equal true, @sequence.correct_guess?("#{guess}")

    @sequence.shuffle_colors
    assert_equal false, @sequence.correct_guess?("#{guess}")
  end
end
