require_relative 'mastermind'
require_relative 'view'

class Game
# this will be the controller

  def initialize(board, view)
    @board = board
    @view = view
  end

  def run
    View.display(@board.display)
  end

end

g = Game.new(Mastermind.new,View.new)
g.run