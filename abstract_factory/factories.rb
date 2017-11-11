# ABSTRACT FACTORY
require './products'
require './components'

class TobaccoPipeFactory
  def self.use_factory(type)
    case type
    when 'E' then EnglishFactory.new
    when 'A' then AmericanFactory.new
    when 'S' then ScottishFactory.new
    when 'B' then BalkanFactory.new
    when 'D' then DanishFactory.new
    when 'P' then VaperFactory.new
    else VirginiaFactory.new
    end
  end

  def make_blend!
    raise(
      NotImplementedError,
      'Redeclare this method in a child class, don\'t use the abstract method!'
    )
  end

  def make_pipe!
    return @pipe if @pipe
    @pipe = yield
  end
end

# CONCRETE FACTORIES
class EnglishFactory < TobaccoPipeFactory
  def initialize
    @mixture = EnglishMixture.new
  end

  def make_blend!
    @mixture.main_component = Latakia.new
    @mixture << Virginia.new
    @mixture << Perique.new
    @mixture
  end

  def make_pipe!
    super do
      TobaccoPipe.new(
        'Dunhill Bruyere', '3110',
        'The orignal finish produced, and a big part of developing and ' \
        'marketing the brand. It was the only finish from 1910 until 1917. A ' \
        'dark redish brown stain. Bruyere pipes were usually made using ' \
        'Calabrian briar, a very dense and hardy briar that has a mediocre ' \
        'grain but does very well with the deep red stain.'
      )
    end
  end
end

class AmericanFactory < EnglishFactory
  def initialize
    @mixture = AmericanMixture.new
  end

  def make_blend!
    super
    @mixture << Burley.new
    @mixture << Kentucky.new
    @mixture
  end

  def make_pipe!
    return @pipe if @pipe
    @pipe = TobaccoPipe.new(
      'Medico Standard Straight', '225',
      'The Medico 225 model pipe seems to take the form of a panel shape, but' \
      'is missing the square shaped shank. A black colored brylon and dark ' \
      'vulcanite stem combine to add a bit of mystery and intrigue to this ' \
      'American made pipe.'
    )
  end
end

class ScottishFactory < TobaccoPipeFactory
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

  def make_pipe!
    super do
      TobaccoPipe.new(
        'Rattray\'s Caledonia', 'RA 59',
        'Classic models with a small inlayed band in an intersting warm ' \
        'terracottacolour. Caledonia is the latin-celtic word for Scotland.'
      )
    end
  end
end

class BalkanFactory < TobaccoPipeFactory
  def initialize
    @mixture = BalkanMixture.new
  end

  def make_blend!
    @mixture.main_component = Oriental.new
    @mixture << Latakia.new
    @mixture << Virginia.new
    @mixture
  end

  def make_pipe!
    super do
      TobaccoPipe.new(
        'Emin Brothers Deluxe Eagle\'s Claw', '8022',
        'Pipes are made of high quality Eskisehir Meerschaum which is very ' \
        'well known by experts. Unlike briar, meerschaum does not burn. ' \
        'Meerschaum pipes do not need pre-smoking to have a good quality ' \
        'performance.'
      )
    end
  end
end

class DanishFactory < TobaccoPipeFactory
  def initialize
    @mixture = DanishMixture.new
  end

  def make_blend!
    @mixture.main_component = Virginia.new
    @mixture << Cavendish.new
    @mixture
  end

  def make_pipe!
    super do
      TobaccoPipe.new(
        'Stanwell Black & White', '409',
        'Black & White pipes are the newest ones from Stanwell that offer an ' \
        'option of two stems; one stem is regular length and the other is a ' \
        'semi-churchwarden stem for those times you need a long, cool smoke. ' \
        'The elegant look of each pipe is accented by the trim ring that ' \
        'alternates between black and white.'
      )
    end
  end
end

class VirginiaFactory < TobaccoPipeFactory
  def initialize
    @mixture = VirginiaMixture.new
  end

  def make_blend!
    @mixture.main_component = Virginia.new
    @mixture
  end

  def make_pipe!
    super do
      TobaccoPipe.new(
        'Peterson FIsherman\'s Sandblast', 'X105',
        'The Peterson Fisherman Series is a new range of pipes launched in ' \
        '2015. Inspired by the love of fishing from someone in the Peterson ' \
        'factory, this pipe is characterised by it black, sandblasted bowl ' \
        'and a beautiful, dark grey acrylic stem that depicts the color of a ' \
        'Salmon\'s skin.'
      )
    end
  end
end

class VaperFactory < TobaccoPipeFactory
  def initialize
    @mixture = VaperMixture.new
  end

  def make_blend!
    @mixture.main_component = Virginia.new
    @mixture << Perique.new
    @mixture
  end

  def make_pipe!
    super do
      TobaccoPipe.new(
        'Vauen' , 'CARO-1',
        'Designer pipe conceptualized by Markus Bischof. Extravagant pipe in ' \
        'a modern contemporary design. Elegant lines with very flat held ' \
        'mouthpiece bit.'
      )
    end
  end
end
