require 'minitest/autorun'
require 'minitest/pride'

class GameTest < Minitest::Test
  def setup
    @sequence = Sequence.new
    @game = Game.new
  end

  def test_it_exists
    assert_equal Game, @game
  end

end
