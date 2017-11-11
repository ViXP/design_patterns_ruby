# CONCRETE FACTORY
require './products'

class GuitarFactory
  def self.build(type = '')
    if type.is_a? String
      parse_choice type
    else
      puts 'Make your decision!'
      build(gets)
    end
  end

  private

  def self.parse_choice(type)
    case type.tr("\n", '')
    when 'A6' then AcousticGuitar.new(6)
    when 'A12' then AcousticGuitar.new(12)
    when 'E6' then ElectricGuitar.new(6)
    when 'E7' then ElectricGuitar.new(7)
    when 'B4' then BassGuitar.new(4)
    when 'B5' then BassGuitar.new(5)
    else ClassicGuitar.new(6)
    end
  end

  private_methods :new
end
