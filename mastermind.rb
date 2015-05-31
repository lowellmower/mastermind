require 'pry'
require_relative 'file_update'

class Mastermind

  attr_accessor :board, :secret_code, :guess_counter, :hint_pegs, :guesses

  def initialize #(board_string)
    @file = "board.txt"
    @guess_counter = 0
    @secret_code = []
    @hint_pegs = []
    @guesses = []
  end

  include FileUpdate

  POSSIBLE_COLORS = ["R","O","Y","G","B","P"]

  # set_code
  def set_secret_code
    4.times do
      secret_code << POSSIBLE_COLORS.sample
    end
    binding.pry
  end

  # compare_code
  def compare_code(user_input)
    guess_arr        = user_input.split('')
    unmatched_guess  = []
    unmatched_secret = []
    guess_arr.each_with_index do |guess, idx|
      if guess == @secret_code[idx]
        @hint_pegs << "r"
      else
        unmatched_guess << guess
        unmatched_secret << @secret_code[idx]
      end
    end
    unmatched_guess.each do |guess|
      idx = unmatched_secret.index(guess)
      unless idx.nil?
        unmatched_secret.delete_at(idx)
        @hint_pegs << "w"
      end
    end
  end

  def track_guess(user_input)
    @guesses << user_input
  end

  def clear_guesses
    @guesses = []
  end

  def clear_hint_pegs
    @hint_pegs = []
  end

  # update board
  def update_board(board)
    update_file(board)
  end

  def clear_board
    clear_file
  end

  # update guess counter
  def update_guess_count
    @guess_counter += 1
  end

  # display_board
  def display
    File.readlines(@file) do |file|
      puts file
    end
  end

  def reset_screen!
    clear_screen!
    move_to_home!
  end

  def clear_screen!
    print "\e[2J"
  end

  def move_to_home!
    print "\e[H"
  end

end