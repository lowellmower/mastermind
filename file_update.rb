require 'pry'

module FileUpdate

  def initialize
    @file = 'board.txt'
  end

  def update_file(board)
    File.open(@file, 'a') do |file|
      @guesses.each do |string|
        file.puts "|#{string[0]}|#{string[1]}|#{string[2]}|#{string[3]}| - #{@hint_pegs.join("")}\n\n"
        # binding.pry
      end
    end
  end

  def clear_file
    File.open(@file, 'w') do |file|
      file.truncate(0)
    end
  end

end