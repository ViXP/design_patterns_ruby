# CONCRETE BUILDER
require './components'
require './product'

class SkateboardBuilder
  attr_reader :details

  def initialize(title = '')
    @title = title
    @details = {}
  end

  def use_deck(*args)
    @details[:deck] = Deck.new(*args)
    self
  end

  def use_trucks(*args)
    @details[:trucks] = Truck.new(*args)
    self
  end

  def use_bearings(*args)
    @details[:bearings] = Bearing.new(*args)
    self
  end

  def use_wheels(*args)
    @details[:wheels] = Wheel.new(*args)
    self
  end

  def use_griptape(*args)
    @details[:griptape] = GripTape.new(*args)
    self
  end

  def build!
    Skateboard.new(@title, @details)
  end
end
