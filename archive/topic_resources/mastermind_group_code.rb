require "colorize"

class Mastermind
  def initialize
    # Display stuff
    @blank_row = ["x", "x", "x", "x ", ".", ".", ".", "."]
    @color_choices = { cyan: "cya", red: "red", green: "gre",
      yellow: "yel", blue: "blu", magenta: "mag" }

    @answer_row = populate_answer_row

    # Board stuff
    @default_rows = 11
    answer_string = "? ? ? ?"
    delim_string = "-" * 27
    color_palette = get_palette
    @rows = [[answer_string], [delim_string], color_palette, [delim_string]]

    start
  end

  def start
    puts "Let's play Mastermind!!!!"
    # this keeps track of game play
    @now_playing = true

    # add num of default blank rows
    @default_rows.times do
      @rows.insert(1, @blank_row)
    end

    draw_board
    play
  end

  def play
    # Keep playing while we want to be!
    while @now_playing
      guess = get_guess
      check_guess(guess)
    end
  end
# --------------------------------------------
# Guess methods

  def check_guess(guess)
    exact_matches = 0
    color_matches = 0

    guess_copy = guess.dup
    answer_copy = @answer_row.dup

    # Exact match (color and location)
    (0..3).each do |index|
      if @answer_row[index] == guess[index]
        exact_matches += 1
        guess_copy[index] = "nope"
        answer_copy[index] = "ugh no"
      end
    end

    # Color match only (color exists in the row)
    guess_copy.each do |color_guess|
      if answer_copy.include?(color_guess)
        color_matches += 1
      end
    end

    # puts "Exact matches: #{exact_matches}"
    # puts "Color matches: #{color_matches}"
    display_guess(guess, exact_matches, color_matches)
  end

  def get_guess
    guess = []

    while guess.length != 4
      puts "Please type in your guess. \nType four of the names from the palette below the board, separated by commas.\nTo exit the game type quit."
      input = gets.chomp.downcase

      # Make sure the user still wants to play
      if input == "quit"
        exit
      end

      # Turn user input into an array
      guess = input.split(",")
    end

    # Format the guess to match the answer
    formatted_guess = []
    guess.each do |guess_color|
      @color_choices.each do |color, color_abbr|
        if guess_color == color_abbr
          formatted_guess.push("@ ".colorize(color))
        end
      end
    end

    # Return answer-formatted guess to caller
    return formatted_guess
  end


# --------------------------------------------
# Visual methods

  def display_guess(guess, exact_matches, color_matches)
    # Create the hints for # of exact matches

    # Create the hints for # of color matches

    # Add any remaining blank hints

    # Find the last blank row to update

    # Update the row you found to update
  end

  def draw_board
    @rows.each do |row|
      puts row.join(" ")
    end
  end

  def get_palette
    palette = []
    @color_choices.each do |color_name, short_name|
      color_string = short_name.colorize(color_name)
      palette.push(color_string)
    end

    # Return the array to the caller
    return palette
  end

# --------------------------------------------
# Winning and losing

  def populate_answer_row
    result = []

    until result.length == 4
      random_color = @color_choices.keys[rand(0 ... @color_choices.keys.length)]
      new_peg = "@ ".colorize(random_color)
      result.push(new_peg)
    end

    puts "ANSWER: " + result.join

    # This will send the answer array back to the caller
    return result
  end

  def win
  end

  def lose
  end

# --------------------------------------------

end

Mastermind.new
