require 'pry'
require_relative 'mastermind'
require_relative 'view'

class Game

  def initialize(board, view)
    @board = board
    @view = view
  end

  def run
    @board.set_secret_code
    @view.welcome
    until @board.guess_counter == 12
      @view.get_guess
      @board.track_guess(@view.guess)
      @board.compare_code(@view.guess)
      @board.update_board(@board.guesses)
      @board.update_guess_count
      @board.clear_guesses
      @board.clear_hint_pegs
      @board.reset_screen!
      @view.welcome
      View.display(@board.display)
    end
    @board.clear_board
  end

end

g = Game.new(Mastermind.new,View.new)
g.run