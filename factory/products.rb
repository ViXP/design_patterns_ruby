# ABSTRACT PRODUCT
class Guitar
  @@models = {}

  attr_reader :strings, :frets, :model

  def initialize num_strings = false
    @name = ''
    @model = ''
    @strings = num_strings
    @string_types = []
    @amp = false
    @frets = 0
    @pickups = false
    @woods = {
      top: '',
      body: '',
      fretboard: '',
      neck: ''
    }
    set_model
  end

  def amplification_required?
    !!@amp
  end

  def string_types
    @string_types.join ', '
  end

  def woods
    woods = ''
    @woods.each { |component, name| woods << "\n#{component.to_s.upcase}: #{name}" }
    woods
  end

  def name
    "#{@name} (#{self.model})"
  end

  def set_model
    puts 'Please, type your own model designation (2-3 letters): '
    @model = gets.slice(0,3).tr("\n", '').upcase 
    @model = @model.length > 1 ? @model : 'GT'
    @@models[@model] = @@models[@model] ? @@models[@model] + 1 : 1
    @model += "-#{@@models[@model]}"
  end

  def pickups
    !@pickups ? 'none' : @pickups.respond_to?(:each) ? @pickups.join(', ') : @pickups  
  end

  def show_info
    print <<~INFO
      ------------------------------
      #{self.name}
      ------------------------------
      Number of strings: #{self.strings}
      Types of strings supported: #{self.string_types}
      Number of frets: #{self.frets}
      Information about the wood of this instrument: #{self.woods}
      Pickups: #{self.pickups}
      #{'This product can\'t be properly used without external amplification!' if self.amplification_required?}
    INFO
  end

  def play
    raise NotImplementedError, 'Please, redeclare this method in child class, don\'t use the abstract method!'
  end
end

# CONCRETE PRODUCTS
class ClassicGuitar < Guitar
  def initialize num_strings = 6
    super
    @name = 'Classic acoustic guitar'
    @strings = num_strings
    @string_types = %w(nylon gut)
    @frets = 19
    @woods = {
      top: 'Cedar',
      body: 'Mahogany',
      fretboard: 'Rosewood',
      neck: 'Mahogany'
    }
  end

  def play
    puts 'La-da-di-da-dam...'
  end
end

class AcousticGuitar < Guitar
  def initialize num_strings = 6
    super
    @name = 'Dreadnought acoustic guitar'
    @strings = num_strings
    @string_types = %w(silk_&_steel bronze phosphor/bronze coated)
    @frets = 22
    @pickups = 'single piezo custom pickup with active preamp'
    @woods = {
      top: 'Spruce',
      body: 'Mahogany',
      fretboard: 'Ebony',
      neck: 'Maple'
    }
  end

  def play
    puts 'Zink! Zink! Ta-la-la-la! Zink! Zink!'
  end
end

class ElectricGuitar < Guitar
  def initialize num_strings = 6
    super
    @name = 'SG-style electric guitar'
    @strings = num_strings
    @string_types = %w(steel nickel-plated nickel coated)
    @amp = false
    @frets = 24
    @pickups = %w('EMG-81 ceramic magnets neck pickup' 'EMG-89 AlNiCo magnets bridge pickup')
    @amp = true
    @woods = {
      top: 'Ebony',
      body: 'Mahogany',
      fretboard: 'Ebony',
      neck: 'Nahogany'
    }  
  end

  def play
    puts self.strings > 6 ? 'D-jent, d-jent! D-d-d-jent, d-jent!' : 'Pow-ow! Wah-wah-wah, waaaah... Dj, dj. dj!'
  end
end

class BassGuitar < Guitar
  def initialize num_strings = 4
    super
    @name = 'Electric bass guitar'
    @strings = num_strings
    @string_types = %w(steel nickel-plated nickel coated)
    @frets = 22
    @pickups = '2 custom-made singlecoil pickups'
    @amp = true
    @woods = {
      body: 'Walnut',
      neck: 'Maple',
      fretboard: 'Maple'
    }
  end

  def play
    puts 'Pop... Pop, pop. Slap! Slap! Slap!'
  end
end