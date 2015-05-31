class View

  attr_accessor :guess

  def initialize
    @guess = String.new
  end

  def welcome
    puts "M A S T E R M I N D:\n w = right color wrong spot.\n r = right color right spot."
  end

  def get_guess
    puts "Select 4 colors from [ROYGBP]"
    @guess = gets.chomp.upcase
  end

  def self.display(args)
    puts args
  end

end