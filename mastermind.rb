require 'pry'
require_relative 'file_update'

class Mastermind

  attr_accessor :board, :secret_code, :guess_counter, :hint_pegs
  attr_reader :possible_colors

  def initialize #(board_string)
    @file = "board.txt"
    @guess_counter = 0
    @secret_code = []
    @hint_pegs = []
    @board = []
  end

  include FileUpdate

  POSSIBLE_COLORS = ["R","O","Y","G","B","P"]

  # set_code
  def set_secret_code
    4.times do
      secret_code << POSSIBLE_COLORS.sample
    end
  end

  # display_board
  def display
    board
  end

  # compare_code
  def compare_code(user_input)
    i = 0
    4.times do
      if user_input.split('')[i] == @secret_code[i]
        hint_pegs << "r"
      elsif user_input.split('').include?(@secret_code[i])
        hint_pegs << "w"
      end
      i += 1
    end
    hint_pegs
  end

  # update board
  def update_board(user_input)
    update_file(user_input)
  end

  # update guess counter
  def update_guess_count
    @guess_counter += 1
  end

end

m = Mastermind.new
m.set_secret_code
binding.pry
m.compare_code("RGRY")