# CONCRETE LEAF
require './component'

class Movie < MovieComponent
  attr_reader :year

  def initialize(title, year = 1900, plot = '')
    super title, plot
    @year = year
    @rented = false
  end

  def show_info
    puts "Title: #{title}\nYear: #{year}\nPlot: #{plot}\n" \
    "Available: #{available?}\n\n"
  end

  def rent!
    @rented = true
  end

  def available?
    @rented ? 'no' : 'yes'
  end

  alias plot description
end
