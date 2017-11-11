# CONCRETE PRODUCT
class Skateboard
  attr_accessor :title, :deck, :trucks, :bearings, :wheels, :griptape

  def initialize(title, details = {})
    @title = title
    @deck = details[:deck]
    @trucks = details[:trucks]
    @bearings = details[:bearings]
    @wheels = details[:wheels]
    @griptape = details[:griptape]
  end

  def full_info
    puts <<~INFO
      \e[33m#{title}\e[39m
      DECK:
      #{deck.show_info}
      TRUCK:
      #{trucks.show_info}
      BEARINGS:
      #{bearings.show_info}
      WHEELS:
      #{wheels.show_info}
      GRIPTAPE:
      #{griptape.show_info}
    INFO
  end
end
