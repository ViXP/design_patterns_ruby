# ABSTRACT COMPONENT
class Tobacco
  attr_reader :name, :color, :aroma, :weight

  private

  def set_weight
    puts "Input the weight in gramms of #{name} in a new blend:"
    @weight = gets.to_i
  rescue
    set_weight
  end
end

# CONCRETE COMPONENTS
class Virginia < Tobacco
  def initialize
    @name ||= 'Flue-cured Virginia'
    @color = 'yellow to orange'
    @aroma = 'bright, caramel sweet'
    set_weight
  end
end

class Burley < Tobacco
  def initialize
    @name ||= 'Light air-cured Burley'
    @color = 'red to brown'
    @aroma = 'high-nicotine, bitter, dry, full, nutty'
    set_weight
  end
end

class Oriental < Tobacco
  def initialize
    @name ||= 'Oriental tobaccos'
    @aroma = 'spicy, sweet, exotic, various'
    @color = 'yellow to brown'
    set_weight
  end
end

class Cavendish < Virginia
  def initialize
    @name = 'Danish flavored Cavendish'
    super
    @color = 'brown to black'
    @aroma += ', moist textured, fresh, plum-like, chocolate, coconut, rum, ' \
    'vanilla taste'
  end
end

class Kentucky < Burley
  def initialize
    @name = 'Fire-cured Kentucky Burley'
    super
    @color = 'brown to black'
    @aroma += ', very strong taste'
  end
end

class Perique < Burley
  def initialize
    @name = 'Perique'
    super
    @aroma = 'frutty, heady, with whiskey flavor'
  end
end

class Latakia < Oriental
  def initialize
    @name = 'Cyprian fire-cured Latakia'
    super
    @color = 'dark brown to black'
    @aroma += ', foggy, smell of hay and grass, heavy'
  end
end
