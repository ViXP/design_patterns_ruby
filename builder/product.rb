# CONCRETE PRODUCT
class Skateboard
  attr_accessor :title, :deck, :trucks, :bearings, :wheels, :griptape

  def initialize title, details = {}
    @title = title
    @deck = details[:deck]
    @trucks = details[:trucks]
    @bearings = details[:bearings]
    @wheels = details[:wheels]
    @griptape = details[:griptape]
  end

  def full_info
    puts <<~INFO
      \e[33m#{self.title}\e[39m
      DECK:
      #{self.deck.show_info}
      TRUCK:
      #{self.trucks.show_info}
      BEARINGS:
      #{self.bearings.show_info}
      WHEELS:
      #{self.wheels.show_info}
      GRIPTAPE:
      #{self.griptape.show_info}
    INFO
  end
end