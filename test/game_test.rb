require './test/test_helper'

class GameTest < Minitest::Test
  def setup
    @sequence = Sequence.new
    @game = Game.new
  end

  def test_it_exists
    assert_equal Game, @game
  end

  def test_it_can_verify_guess
    assert_equal true, @game.guess("#{@sequence.colors}")
  end
end
