require 'pry'
require_relative 'file_update'

class Mastermind

  attr_accessor :board, :secret_code, :guess_counter, :hint_pegs, :guesses
  attr_reader :possible_colors

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
  end

  # compare_code
  def compare_code(user_input)
    i = 0
    4.times do
      if user_input.split('')[i] == @secret_code[i]
        @hint_pegs << "r"
      elsif user_input.split('').include?(@secret_code[i])
        @hint_pegs << "w"
      end
      i += 1
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

end