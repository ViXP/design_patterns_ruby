# CONCRETE COMPOSITE
require './component'

class MovieCategory < MovieComponent
  def initialize(*args)
    super(*args)
    @children = []
  end

  def add(component)
    if component.is_a? MovieComponent
      @children << component
    elsif component.is_a? Array
      @children.push(*component)
    else
      false
    end
  end

  def remove(component = MovieComponent.new)
    @children.delete component
  end

  def show_info
    puts '*' * 30
    puts "Category: #{title}\nDescription: #{description}"
    puts '*' * 30
    @children.each do |child|
      child.show_info
    end
  end
end
