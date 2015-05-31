require_relative 'mastermind'
require_relative 'view'

class Game

  def initialize(board, view)
    @board = board
    @view = view
  end

  def run
    until @board.guess_counter == 12
      @board.set_secret_code
      @view.welcome
      @view.get_guess
      @board.track_guess(@view.guess)
      @board.compare_code(@view.guess)
      @board.update_board(@board.guesses)
      View.display(@board.display)
      @board.update_guess_count
      @board.clear_guesses
      @board.clear_hint_pegs
    end
  end

end

g = Game.new(Mastermind.new,View.new)
g.run