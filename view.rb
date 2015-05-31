class View

  attr_accessor :guess

  def initialize
    @guess = String.new
  end

  POSSIBLE_COLORS = ["R","O","Y","G","B","P"]

  def welcome
    puts "M A S T E R M I N D:\n w = right color wrong spot.\n r = right color right spot."
  end

  def secret_code
    puts "\n*[SECRET CODE]*"
  end

  def get_guess
    puts "\nSelect 4 colors from [ROYGBP]"
    @guess = gets.chomp.upcase
  end

  def winner
    puts "YOU GUESSED THE SECRET CODE!"
  end

  def number_of_guesses(guess_counter)
    puts "\nYou have #{12 - guess_counter} guesses left!"
  end

  def self.display(args)
    puts args
  end


end