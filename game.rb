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
    @view.number_of_guesses(@board.guess_counter)
    until @board.guess_counter == 12
      @view.get_guess
      @board.track_guess(@view.guess)
      @board.compare_code(@view.guess)
      @board.update_board(@board.guesses)
      @board.update_guess_count
      break if @board.hint_pegs.join('') == "rrrr"
      @board.clear_guesses
      @board.clear_hint_pegs
      @board.reset_screen!
      @view.welcome
      @view.number_of_guesses(@board.guess_counter)
      View.display(@board.display)
      @view.secret_code
    end
    @board.clear_board
    @view.winner
    View.display(@board.secret_code.join(''))
  end

end

g = Game.new(Mastermind.new,View.new)
g.run