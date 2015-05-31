require 'pry'

module FileUpdate
  def update_file(board)
    @file = 'board.txt'
    File.open(@file, 'a') do |file|
      @guesses.each do |string|
        file.puts "|#{string[0]}|#{string[1]}|#{string[2]}|#{string[3]}| - #{@hint_pegs.join("")}\n"
        # binding.pry
      end
    end
  end
end