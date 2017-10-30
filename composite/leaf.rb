# CONCRETE LEAF
require './component'

class Movie < MovieComponent
  attr_reader :year

  def initialize title, year = 1900, plot = ''
    super title, plot
    @year = year
    @rented
  end

  def show_info
    puts "Title: #{title}\nYear: #{year}\nPlot:#{plot}\nAvailable:#{available?}\n\n"
  end

  def rent!
    @rented = true
  end

  def available?
    @rented ? 'no' : 'yes'
  end

  alias :plot :description
end