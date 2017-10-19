# CONCRETE BUILDER
require './components'
require './product'

class SkateboardBuilder
  attr_reader :details

  def initialize title = ''
    @title = title
    @details = {}
  end

  def set_deck *args
    @details[:deck] = Deck.new(*args)
    self
  end

  def set_trucks *args
    @details[:trucks] = Truck.new(*args)
    self
  end

  def set_bearings *args
    @details[:bearings] = Bearing.new(*args)
    self
  end

  def set_wheels *args
    @details[:wheels] = Wheel.new(*args)
    self
  end

  def set_griptape *args
    @details[:griptape] = GripTape.new(*args)
    self
  end
  
  def build!
    Skateboard.new(@title, @details)
  end
end