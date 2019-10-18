class Game

  def initialize
    @sequence = Sequence.new
    @guess = nil
  end

  def play
    @guess = gets.chomp
  end
end
