# ABSTRACT FACTORY
require './products'
require './components'

class TobaccoBlendFactory
  def self.make_tobacco type
    t = case type
      when 'E'
        EnglishBlendFactory.new
      when 'A'
        AmericanBlendFactory.new
      when 'S'
        ScottishBlendFactory.new
      when 'B'
        BalkanBlendFactory.new
      when 'D'
        DanishhBlendFactory.new
      when 'P'
        VaperBlendFactory.new
    else 
      VirginiaBlendFactory.new
    end
    t.make_blend!
  end

  def make_blend!
    raise NotImplementedError, 'Please, redeclare this method in child class, don\'t use the abstract method!'
  end

  private_methods :make_blend
end

# CONCRETE FACTORIES
class EnglishBlendFactory < TobaccoBlendFactory
  def initialize
    @mixture = EnglishMixture.new
  end

  def make_blend!
    @mixture.main_component = Latakia.new
    @mixture << Virginia.new
    @mixture << Perique.new
    @mixture
  end
end

class AmericanBlendFactory < EnglishBlendFactory
  def initialize
    @mixture = AmericanMixture.new
  end

  def make_blend!
    super
    @mixture << Burley.new
    @mixture << Kentucky.new
    @mixture
  end
end

class ScottishBlendFactory < TobaccoBlendFactory
  def initialize
    @mixture = ScottishMixture.new
  end

  def make_blend!
    @mixture.main_component = Virginia.new
    @mixture << Latakia.new
    @mixture << Oriental.new
    @mixture << Cavendish.new
    @mixture
  end
end

class BalkanBlendFactory < TobaccoBlendFactory
  def initialize
    @mixture = BalkanMixture.new
  end

  def make_blend!
    @mixture.main_component = Oriental.new
    @mixture << Latakia.new
    @mixture << Virginia.new
    @mixture
  end
end

class DanishhBlendFactory < TobaccoBlendFactory
  def initialize
    @mixture = DanishMixture.new
  end

  def make_blend!
    @mixture.main_component = Virginia.new
    @mixture << Cavendish.new
    @mixture
  end
end

class VirginiaBlendFactory < TobaccoBlendFactory
  def initialize
    @mixture = VirginiaMixture.new
  end

  def make_blend!
    @mixture.main_component = Virginia.new
    @mixture
  end
end

class VaperBlendFactory < TobaccoBlendFactory
  def initialize
    @mixture = VaperMixture.new
  end

  def make_blend!
    @mixture.main_component = Virginia.new
    @mixture << Perique.new
    @mixture
  end
end