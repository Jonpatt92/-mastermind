class Sequence
  attr_reader :colors

  def initialize(colors = nil)
    @color_seed = ["R", "R", "G", "G", "B", "B", "Y", "Y"]
    @colors = colors
    @colors = @color_seed.shuffle[0..3] if colors == nil 
  end

  def shuffle_colors
    @colors = @color_seed.shuffle[0..3]
    @colors
  end

  def correct_guess?(guess)
    @colors == guess
  end

  def evaluate_guess(guess)
    correct_positions = 0
    correct_elements_array = guess.find_all {|guess_color| @colors.any?(guess_color)}
    correct_elements = correct_elements_array.length

    @colors.each_with_index do |color, c_index|
      guess.each_with_index do |g_color, g_index|
        if color == g_color && c_index == g_index
          correct_positions +=1
        end
      end
    end

    puts "'#{guess.join}' has #{correct_elements} of the correct elements with #{correct_positions} in the correct positions"
  end
end
