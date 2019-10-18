class Game

  def initialize
    @sequence = Sequence.new
    @guess = nil
  end

  def start_game
    quit = nil
    until quit == "q"
      p "Welcome to MASTERMIND"
      p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
      p ">"
      valid_input = false
      until valid_input
        initial_input = gets.chomp
        if initial_input.downcase == "p"
          valid_input = true
          initialize()
          play_game()
        elsif initial_input.downcase == "q"
          valid_input = true
          quit = "q"
          puts "Thanks for playing!"
        elsif initial_input.downcase == "i"
          p "I will select 4 random letters. Either (R)ed, (G)reen, (Y)ellow or (B)lue"
          p "Each letter can appear no more than 2 times, the total letters will always be 4"
          p "You must guess the 4 letters in order"
          p "ex: RGYB"
          p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
        else p "That was not a valid input. Enter 'p' to play. Enter 'q' to quit."
        end
      end
    end
  end

  def valid_guess?(guess)
    guess.join.count("RGBY") == 4
  end

  def make_guess
    p "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
    p ">"
    until valid_guess?(@guess)
      @guess = gets.chomp.upcase.chars
      if @guess.join.count("RGBY") > 4
        p "That's too many letters. Guess again."
        p ">"
        @guess = gets.chomp.upcase.chars
      elsif @guess.join.count("RGBY") < 4
        p "That's too few letters. Guess again."
        p ">"
        @guess = gets.chomp.upcase.chars
      end
    end
  end

  def play_game
    until @sequence.correct_guess?(@guess)
      make_guess
      @sequence.evaluate_guess(@guess)
    end
      p "Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes, 22 seconds."
      p "Do you want to (p)lay again or (q)uit?"
  end
end
