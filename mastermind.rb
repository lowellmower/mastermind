require 'pry'

class Mastermind

  attr_accessor :board, :secret_code, :guess_counter, :hint_pegs
  attr_reader :possible_colors

  def initialize #(board_string)
    @board = " | | |  -     \n[SECRET CODE]"
    @guess_counter = 0
    @secret_code = []
    @possible_colors = ["R","O","Y","G","B","P"]
    @hint_pegs = []
  end

  # set_code
  def set_secret_code
    4.times do
      secret_code << possible_colors.sample
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
  def update_board(string)
    string.split("").map.with_index{|x, i| @board[i+i] = x}
  end

end

m = Mastermind.new
m.set_secret_code
binding.pry
m.compare_code("RGRY")