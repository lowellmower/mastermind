require_relative 'mastermind'
require_relative 'view'

class Game

  def initialize(board, view)
    @board = board
    @view = view
  end

  def run
    until @board.guess_counter == 12
    View.welcome
    View.display()
    @board.update_guess_count
  end

end

g = Game.new(Mastermind.new,View.new)
g.run