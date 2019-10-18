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
    assert_equal true, @sequence.correct_guess?(guess)

    @sequence.shuffle_colors
    assert_equal false, @sequence.correct_guess?(guess)
  end

  def test_it_can_evaluate_guess
    colors_1 = ["R", "B", "G", "B"]
    guess_1 =  ["Y", "B", "B", "G"]
    colors_2 = ["R", "Y", "G", "B"]
    guess_2 =  ["Y", "R", "G", "B"]
    sequence_1 = Sequence.new(colors_1)
    sequence_2 = Sequence.new(colors_2)
    statement_1 = "'YBBG' has 3 of the correct elements with 1 in the correct positions"
    statement_2 = "'YRGB' has 4 of the correct elements with 3 in the correct positions"

    assert_equal statement_1, sequence_1.evaluate_guess(guess_1)
    assert_equal statement_2, sequence_2.evaluate_guess(guess_2)
  end
end
