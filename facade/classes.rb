# CONCRETE MANIPULATED CLASSES
class Cook
  def self.start_cooking dish_name
    puts "\e[4mStart cooking the #{dish_name}!\e[0m"
  end

  def self.get_pan
    puts "\e[33mGet a big pan\e[0m"
  end

  def self.get_dripping_pan
    puts "\e[33mGet the hot pan with seed oil\e[0m"
  end

  def self.wait_for mins
    puts "\e[34mWait for #{mins} minutes...\e[0m"
    sleep mins
  end

  def self.mix
    puts "\e[33mMix the ingredients\e[0m"
  end

  def self.mash
    puts "\e[33mMash the ingredients\e[0m"
  end

  def self.ready!
    puts "\e[32m\e[1mTHE DISH IS READY!\n\e[0m"
  end

  private_methods :new
end

class Water
  attr_reader :temperature, :amount

  def initialize
    @amount = 0.0
    @temperature = 25.0
  end

  def pour amn
    @amount = amn
  end

  def warm_up tempr
    while @temperature <= tempr
      @temperature += 0.01
    end
    puts "The water is warmed up to #{temperature}°C"
  end

  def fill_in
    puts "The water is added to the mix"
  end

  def boil
    warm_up 100
  end
end

class Salt
  attr_reader :amount
  attr_accessor :type

  def initialize
    @type = :fine_table
    @amount = 0.0
  end

  def pinch amn
    @amount = amn
  end

  def salt!
    puts "The mix is salted with #{amount}kg of #{type} salt"
  end
end

class Potato
  attr_reader :amount
  attr_accessor :cut

  def initialize cut_type = :cubes
    @cut = cut_type
    @amount = 0.0
  end

  def load= amn
    @amount = amn
    add_to_mix
  end

  def add_to_mix
    puts "#{amount}kg of potatos (#{cut} cut), is added to the mix"
  end
end

class Onion
  attr_reader :quantity
  attr_writer :color

  def initialize color = :white
    @quantity = 1
    @color = color
  end

  def color
    @color.to_s.capitalize
  end

  def cut_and_add amn
    @amount = amn    
    puts "#{color} onion (#{quantity}) is cut"
    add
  end

  def add
    puts "Prepared onion is added to the mix"
  end
end

class Carrot
  attr_reader :cut

  def initialize quantity = 1, cut = :cubes
    @quantity = quantity
    @cut = cut
  end

  def quantity
    @quantity == 1 ? "#{@quantity} carrot" : "#{@quantity} carrots"
  end

  def add_to_mix
    puts "#{quantity}, #{cut} cut, is added to the mix"
  end
end

class Butter
  def initialize amount = 1.0
    @amount = amount
  end

  def amount
    "#{@amount}g"
  end

  def add
    puts "The butter (#{amount}) is added to the mix"
  end
end