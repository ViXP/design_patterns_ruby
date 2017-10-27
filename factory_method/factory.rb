# CONCRETE FACTORY
require './products'

class GuitarFactory
  def self.build type = ''
    if type.is_a? String
      case type.tr("\n",'')
        when 'A6'
          AcousticGuitar.new(6)
        when 'A12'
          AcousticGuitar.new(12)
        when 'E6'
          ElectricGuitar.new(6)
        when 'E7'
          ElectricGuitar.new(7)
        when 'B4'
          BassGuitar.new(4)
        when 'B5'
          BassGuitar.new(5)
      else
        ClassicGuitar.new(6)
      end
    else
      puts 'Make your decision!'
      self.build(gets)
    end
  end

  private_methods :new
end