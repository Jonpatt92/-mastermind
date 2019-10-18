class Sequence
  attr_reader :colors

  def initialize
    @color_seed = ["R", "R", "G", "G", "B", "B", "Y", "Y"]
    @colors = @color_seed.shuffle[0..3]
  end

  def shuffle_colors
    @colors = @color_seed.shuffle[0..3]
  end
end
