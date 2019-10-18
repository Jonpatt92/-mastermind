class Sequence
  attr_reader :colors

  def initialize(colors = nil)
    @color_seed = ["R", "R", "G", "G", "B", "B", "Y", "Y"]
    @colors = colors || @color_seed.shuffle[0..3] if colors == nil || colors.join.count("RGBY") != 4
  end

  def shuffle_colors
    @colors = @color_seed.shuffle[0..3]
    @colors
  end

  def correct_guess?(guess)
    @colors == guess
  end

  def evaluate_guess(guess)
  
  end
end
